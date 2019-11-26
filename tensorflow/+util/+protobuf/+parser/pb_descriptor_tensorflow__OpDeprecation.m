function [descriptor] = pb_descriptor_tensorflow__OpDeprecation()
%pb_descriptor_tensorflow__OpDeprecation Returns the descriptor for message OpDeprecation.
%   function [descriptor] = pb_descriptor_tensorflow__OpDeprecation()
%
%   See also pb_read_tensorflow__OpDeprecation

  descriptor = struct( ...
    'name', 'OpDeprecation', ...
    'full_name', 'tensorflow.OpDeprecation', ...
    'filename', 'tensorflow/core/framework/op_def.proto', ...
    'containing_type', '', ...
    'fields', [ ...
      struct( ...
        'name', 'version', ...
        'full_name', 'tensorflow.OpDeprecation.version', ...
        'index', 1, ...
        'number', uint32(1), ...
        'type', uint32(5), ...
        'matlab_type', uint32(1), ...
        'wire_type', uint32(0), ...
        'label', uint32(1), ...
        'default_value', int32(0), ...
        'read_function', @(x) pblib_helpers_first(typecast(x, 'int32')), ...
        'write_function', @(x) typecast(int32(x), 'uint32'), ...
        'options', struct('packed', false) ...
      ), ...
      struct( ...
        'name', 'explanation', ...
        'full_name', 'tensorflow.OpDeprecation.explanation', ...
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

