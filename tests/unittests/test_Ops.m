function test_suite = test_Ops()
  test_functions = localfunctions();
  initTestSuite;

  function test_add()
    dtypes = { ...
      tensorflow.DataType('TF_FLOAT'), ...
      tensorflow.DataType('TF_DOUBLE'), ...
      tensorflow.DataType('TF_INT32') ...
    };
    ndims = [1:3]; % considered dimensions
    graph = tensorflow.Graph();
    session = tensorflow.Session(graph);

    for i = 1:1:numel(dtypes)
      dtype = dtypes{i};
      for nd = ndims
        dims = randi([2 10], 1, nd);
        aVal = rand_tensor([dims 1], dtype);
        bVal = rand_tensor([dims 1], dtype);
        exptd = aVal+bVal;

        y = graph.add(graph.constant(aVal), graph.constant(bVal));
        res = session.run([], [], y);
        addRes = res(1).value();
        assertEqual(exptd(:), addRes(:));
      end
    end

  function test_addn()
    graph = tensorflow.Graph();
    session = tensorflow.Session(graph);

    dtype = tensorflow.DataType('TF_DOUBLE');
    dims = randi([2 10], 1, 3);
    aVal = rand_tensor([dims 1], dtype);
    bVal = rand_tensor([dims 1], dtype);
    cVal = rand_tensor([dims 1], dtype);
    exptd = aVal+bVal+cVal;

    vals(1) = graph.constant(aVal);
    vals(2) = graph.constant(bVal);
    vals(3) = graph.constant(cVal);
    y = graph.addn(vals);
    res = session.run([], [], y);
    addRes = res(1).value();
    assertEqual(exptd(:), addRes(:));

  function test_mul()
    dtypes = { ...
      tensorflow.DataType('TF_FLOAT'), ...
      tensorflow.DataType('TF_DOUBLE'), ...
      tensorflow.DataType('TF_INT64') ...
    };
    ndims = [1:3]; % considered dimensions
    graph = tensorflow.Graph();
    session = tensorflow.Session(graph);

    for i = 1:1:numel(dtypes)
      dtype = dtypes{i};
      for nd = ndims
        dims = randi([2 10], 1, nd);
        aVal = rand_tensor([dims 1], dtype);
        bVal = rand_tensor([dims 1], dtype);
        exptd = aVal.*bVal;

        y = graph.mul(graph.constant(aVal), graph.constant(bVal));
        res = session.run([], [], y);
        mulRes = res(1).value();
        assertEqual(exptd(:), mulRes(:));
      end
    end

  function test_bucketize()
    graph = tensorflow.Graph();
    session = tensorflow.Session(graph);

    vals = [0.1, 0.3, 0.6, 0.8];
    edges = [0, 0.25, 0.5, 0.75, 1];
    bins = [1, 2, 3, 4]; % hard-coded solution due to lack of Octave-built in function

    t = graph.constant(vals);
    desc = graph.newOperation('Bucketize', 'Bucketize_test');
    desc.addInput(t);
    desc.setAttrFloatList('boundaries', single(edges));

    oper = desc.finishOperation();
    y = tensorflow.Output(oper);
    res = session.run([], [], y);
    buckets = double(res(1).value());
    assertEqual(buckets, bins);

  function test_identityn()
    graph = tensorflow.Graph();
    session = tensorflow.Session(graph);
    testmat = rand(10,2);

    desc = graph.newOperation('IdentityN', 'IdentityN_test');

    out(1) = graph.constant(testmat);
    out(2) = graph.constant(uint16([1 5 4 4 5]));
    desc.addInputList(out);
    dtype(1) = tensorflow.DataType('TF_DOUBLE');
    dtype(2) = tensorflow.DataType('TF_UINT16');
    desc.setAttrTypeList('T', dtype);

    oper = desc.finishOperation();
    y = tensorflow.Output(oper);
    res = session.run([], [], y);
    assertEqual(res(1).value, testmat);

  function test_matrixsolve()
    graph = tensorflow.Graph();
    session = tensorflow.Session(graph);

    A = rand(10,10);
    b = graph.placeholder('TF_DOUBLE', 'shape', [10 1]);
    y = graph.matrixsolve(graph.constant(A), b, 'adjoint', true);

    % TODO due to a bug in matrixsolve this will likely result in a segfault
    % bval = rand(10,1);
    % res = session.run([b], [tensorflow.Tensor(bval)], [y]);
    % assertTrue(norm(res(1).value-(A.')\bval) < 1e-6);

  function test_pack()
    graph = tensorflow.Graph();
    session = tensorflow.Session(graph);

    val1 = rand(3,3);
    val2 = eye(3);
    c(1) = graph.constant(val1);
    c(2) = graph.constant(val2);

    exptd(1,:,:) = val1;
    exptd(2,:,:) = val2;
    res = session.run([], [], graph.pack(c));
    assertEqual(exptd, res.value);

    clear exptd
    exptd(:,1,:) = val1;
    exptd(:,2,:) = val2;
    res = session.run([], [], graph.pack(c, 'axis', int32(1)));
    assertEqual(exptd, res.value);

  function test_maxpool()
    graph = tensorflow.Graph();
    session = tensorflow.Session(graph);

    vals = rand([1,2,2,2]);
    exptd = squeeze(max(max(vals, [], 3)));
    input = graph.constant(vals);

    % maxpool in depth
    res = session.run([], [], graph.maxpool(input, int32([1 2 2 1]), int32([1 1 1 1]), 'VALID'));
    assertEqual(exptd, squeeze(res.value));

  function randres = rand_tensor(dims, dtype)
    type = tensorflow.DataType.tf2m(dtype);
    if any(strcmp(type, { 'double', 'single' }))
      randres = randn(dims)*1e6;
    elseif strcmp(type, 'logical')
      randres = round(rand(dims));
    elseif any(strcmp(type, { 'int64', 'int32', 'int16', 'int8' }))
      randres = round(2*(rand(dims)-0.5)*min(1e6, double(intmax(type))));
    elseif any(strcmp(type, { 'uint64', 'uint32', 'uint16', 'uint8' }))
      randres = round(rand(dims)*min(1e6, double(intmax(type))));
    elseif strcmp(type, 'complex')
      error('Not implemented.');
    else
      error('Not supported.');
    end
    randres = cast(randres, type);
