select(
  (.verb == "get" and .objectRef.resource == "secrets") or
  (.verb == "create" and .objectRef.resource == "pods"
    and ((.requestObject.spec.containers[]?.securityContext.privileged // false) == true)
  ) or
  (.verb == "create" and .objectRef.subresource == "exec") or
  (.verb == "delete" and (.objectRef.resource == "policies" or .objectRef.resource == "auditpolicies")) or
  (.verb == "create" and .objectRef.resource == "rolebindings"
    and (.requestObject.roleRef.name == "cluster-admin")
  )
)