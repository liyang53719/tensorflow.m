function [descriptor] = pb_descriptor_tensorflow__OpDef__ArgDef()
%pb_descriptor_tensorflow__OpDef__ArgDef Returns the descriptor for message ArgDef.
%   function [descriptor] = pb_descriptor_tensorflow__OpDef__ArgDef()
%
%   See also pb_read_tensorflow__OpDef__ArgDef

  descriptor = struct( ...
    'name', 'ArgDef', ...
    'full_name', 'tensorflow.OpDef.ArgDef', ...
    'filename', 'tensorflow/core/framework/op_def.proto', ...
    'containing_type', 'tensorflow.OpDef', ...
    'fields', [ ...
      struct( ...
        'name', 'name', ...
        'full_name', 'tensorflow.OpDef.ArgDef.name', ...
        'index', 1, ...
        'number', uint32(1), ...
        'type', uint32(9), ...
        'matlab_type', uint32(7), ...
        'wire_type', uint32(2), ...
        'label', uint32(1), ...
        'default_value', '', ...
        'read_function', @(x) char(x{1}(x{2} : x{3})), ...
        'write_function', @uint8, ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'description', ...
        'full_name', 'tensorflow.OpDef.ArgDef.description', ...
        'index', 2, ...
        'number', uint32(2), ...
        'type', uint32(9), ...
        'matlab_type', uint32(7), ...
        'wire_type', uint32(2), ...
        'label', uint32(1), ...
        'default_value', '', ...
        'read_function', @(x) char(x{1}(x{2} : x{3})), ...
        'write_function', @uint8, ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'type', ...
        'full_name', 'tensorflow.OpDef.ArgDef.type', ...
        'index', 3, ...
        'number', uint32(3), ...
        'type', uint32(14), ...
        'matlab_type', uint32(10), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'type_attr', ...
        'full_name', 'tensorflow.OpDef.ArgDef.type_attr', ...
        'index', 4, ...
        'number', uint32(4), ...
        'type', uint32(9), ...
        'matlab_type', uint32(7), ...
        'wire_type', uint32(2), ...
        'label', uint32(1), ...
        'default_value', '', ...
        'read_function', @(x) char(x{1}(x{2} : x{3})), ...
        'write_function', @uint8, ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'number_attr', ...
        'full_name', 'tensorflow.OpDef.ArgDef.number_attr', ...
        'index', 5, ...
        'number', uint32(5), ...
        'type', uint32(9), ...
        'matlab_type', uint32(7), ...
        'wire_type', uint32(2), ...
        'label', uint32(1), ...
        'default_value', '', ...
        'read_function', @(x) char(x{1}(x{2} : x{3})), ...
        'write_function', @uint8, ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'type_list_attr', ...
        'full_name', 'tensorflow.OpDef.ArgDef.type_list_attr', ...
        'index', 6, ...
        'number', uint32(6), ...
        'type', uint32(9), ...
        'matlab_type', uint32(7), ...
        'wire_type', uint32(2), ...
        'label', uint32(1), ...
        'default_value', '', ...
        'read_function', @(x) char(x{1}(x{2} : x{3})), ...
        'write_function', @uint8, ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'is_ref', ...
        'full_name', 'tensorflow.OpDef.ArgDef.is_ref', ...
        'index', 7, ...
        'number', uint32(16), ...
        'type', uint32(8), ...
        'matlab_type', uint32(3), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', uint32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'uint32')), ...
        'write_function', @(x) typecast(uint32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ) ...
    ], ...
    'extensions', [ ... % Not Implemented
    ], ...
    'nested_types', [ ... % Not implemented
    ], ...
    'enum_types', [ ... % Not Implemented
    ], ...
    'options', [ ... % Not Implemented
    ] ...
  );

  descriptor.field_indeces_by_number = java.util.HashMap;
  put(descriptor.field_indeces_by_number, uint32(1), 1);
  put(descriptor.field_indeces_by_number, uint32(2), 2);
  put(descriptor.field_indeces_by_number, uint32(3), 3);
  put(descriptor.field_indeces_by_number, uint32(4), 4);
  put(descriptor.field_indeces_by_number, uint32(5), 5);
  put(descriptor.field_indeces_by_number, uint32(6), 6);
  put(descriptor.field_indeces_by_number, uint32(16), 7);

