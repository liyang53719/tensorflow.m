classdef SessionOptions < util.mixin.Pointer
  %SESSIONOPTIONS Summary of this class goes here
  %   Detailed explanation goes here

  methods
    % TF_CAPI_EXPORT extern TF_SessionOptions* TF_NewSessionOptions(void);
    function obj = SessionOptions()
      ref = tensorflow_m_('TF_NewSessionOptions');
      obj.set_reference_(ref, true);
    end

    % TF_CAPI_EXPORT extern void TF_SetTarget(TF_SessionOptions* options, const char* target);
    function setTarget(obj, target)
      assert(ischar(target), 'Target must be provided as a string.');
      tensorflow_m_('TF_SetTarget', obj.ref, target);
    end

    % TF_CAPI_EXPORT extern void TF_SetConfig(TF_SessionOptions* options, const void* proto, size_t proto_len, TF_Status* status);
    function setConfig(obj, buf)
      assert(isa(buf, 'tensorflow.Buffer'), 'Configuration must be serialized and provided as a tensorflow.Buffer object.');
      status = tensorflow.Status();
      tensorflow_m_('TF_SetConfig', obj.ref, buf.ref, status.ref);
      status.maybe_raise();
    end

    % TF_CAPI_EXPORT extern void TF_DeleteSessionOptions(TF_SessionOptions*);
    function deleteSessionOptions(obj)
      obj.delete();
    end

    % TF_CAPI_EXPORT extern TF_Session* TF_LoadSessionFromSavedModel(const TF_SessionOptions* session_options, const TF_Buffer* run_options, const char* export_dir, const char* const* tags, int tags_len, TF_Graph* graph, TF_Buffer* meta_graph_def, TF_Status* status);
    % TODO

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function delete(obj)
      if obj.isdeletable()
        tensorflow_m_('TF_DeleteSessionOptions', obj.ref);
      end
      delete@util.mixin.Pointer(obj);
    end
  end
end
