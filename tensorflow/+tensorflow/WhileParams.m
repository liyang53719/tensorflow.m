classdef WhileParams < util.mixin.Pointer
  %WHILEPARAMS Summary of this class goes here
  %   Detailed explanation goes here

  methods
    function obj = WhileParams(ref)
      obj.set_reference_(ref, true);
    end

    % TF_CAPI_EXPORT extern void TF_FinishWhile(const TF_WhileParams* params, TF_Status* status, TF_Output* outputs);
    % TODO

    % TF_CAPI_EXPORT extern void TF_AbortWhile(const TF_WhileParams* params);
    function abortWhile(obj)
      tensorflow_m_('TF_AbortWhile', obj.ref);
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function delete(obj)
      if obj.isdeletable()
        obj.abortWhile();
        tensorflow_m_('TFM_DeleteWhile', obj.ref);
      end
      delete@util.mixin.Pointer(obj);
    end
  end
end
