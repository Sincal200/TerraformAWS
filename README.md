-------------------------------

kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-7dc599f9f7-9pztl   1/1     Running   0          39s
nginx-7dc599f9f7-bmf25   1/1     Running   0          39s
nginx-7dc599f9f7-ldkbf   1/1     Running   0          39s
nginx-7dc599f9f7-n9zqd   1/1     Running   0          39s

-------------------------------

kubectl get pod nginx-7dc599f9f7-9pztl
NAME                     READY   STATUS    RESTARTS   AGE
nginx-7dc599f9f7-9pztl   1/1     Running   0          79s

-------------------------------

kubectl get svc
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   10d

-------------------------------

kubectl get nodes
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   10d   v1.32.0

-------------------------------

kubectl get deployments
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   4/4     4            4           2m49s

-------------------------------

kubectl get all
NAME                         READY   STATUS    RESTARTS   AGE
pod/nginx-7dc599f9f7-9pztl   1/1     Running   0          3m3s
pod/nginx-7dc599f9f7-bmf25   1/1     Running   0          3m3s
pod/nginx-7dc599f9f7-ldkbf   1/1     Running   0          3m3s
pod/nginx-7dc599f9f7-n9zqd   1/1     Running   0          3m3s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   10d

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx   4/4     4            4           3m4s

NAME                               DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-7dc599f9f7   4         4         4       3m4s

-------------------------------

kubectl logs nginx-7dc599f9f7-9pztl
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2025/03/30 18:34:13 [notice] 1#1: using the "epoll" event method
2025/03/30 18:34:13 [notice] 1#1: nginx/1.27.4
2025/03/30 18:34:13 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14)
2025/03/30 18:34:13 [notice] 1#1: OS: Linux 5.15.167.4-microsoft-standard-WSL2
2025/03/30 18:34:13 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2025/03/30 18:34:13 [notice] 1#1: start worker processes
2025/03/30 18:34:13 [notice] 1#1: start worker process 29
2025/03/30 18:34:13 [notice] 1#1: start worker process 30
2025/03/30 18:34:13 [notice] 1#1: start worker process 31
2025/03/30 18:34:13 [notice] 1#1: start worker process 32
2025/03/30 18:34:13 [notice] 1#1: start worker process 33
2025/03/30 18:34:13 [notice] 1#1: start worker process 34
2025/03/30 18:34:13 [notice] 1#1: start worker process 35
2025/03/30 18:34:13 [notice] 1#1: start worker process 36

-------------------------------

kubectl top pod
NAME                     CPU(cores)   MEMORY(bytes)
nginx-7dc599f9f7-9pztl   0m           7Mi
nginx-7dc599f9f7-bmf25   0m           7Mi
nginx-7dc599f9f7-ldkbf   0m           7Mi
nginx-7dc599f9f7-n9zqd   0m           7Mi

-------------------------------

kubectl top node
NAME       CPU(cores)   CPU(%)   MEMORY(bytes)   MEMORY(%)
minikube   217m         2%       1146Mi          32%

-------------------------------

 kubectl apply -f https://gist.githubusercontent.com/ualmtorres/d9468f456eed8c65bf6f0174d8c8a591/raw/5eea37fd4d2f6c9999b0c1976576c7975c32e7a0/demons.yml
namespace/demo created

-------------------------------

kubectl delete -f https://gist.githubusercontent.com/ualmtorres/d9468f456eed8c65bf6f0174d8c8a591/raw/5eea37fd4d2f6c9999b0c1976576c7975c32e7a0/demons.yml
namespace "demo" deleted

-------------------------------

kubectl delete pod nginx-7dc599f9f7-9pztl
pod "nginx-7dc599f9f7-9pztl" deleted

-------------------------------

kubectl rollout restart deployment nginx
deployment.apps/nginx restarted

-------------------------------

kubectl exec -it nginx-5b87768745-2jxn4 -- bash
root@nginx-5b87768745-2jxn4:

-------------------------------

kubectl port-forward nginx-5b87768745-2jxn4 8080:80
Forwarding from 127.0.0.1:8080 -> 80
Forwarding from [::1]:8080 -> 80

-------------------------------

kubectl scale deployment nginx --replicas=5
deployment.apps/nginx scaled
kubectl get deployment
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   5/5     5            5           20m

-------------------------------

 kubectl get events
LAST SEEN   TYPE      REASON                              OBJECT                        MESSAGE
10d         Warning   PossibleMemoryBackedVolumesOnDisk   node/minikube                 The tmpfs noswap option is not supported. Memory-backed volumes (e.g. secrets, emptyDirs, etc.) might be swapped to disk and should no longer be considered secure.
10d         Normal    Starting                            node/minikube                 Starting kubelet.
10d         Warning   CgroupV1                            node/minikube                 cgroup v1 support is in maintenance mode, please migrate to cgroup v2
10d         Normal    NodeAllocatableEnforced             node/minikube                 Updated Node Allocatable limit across pods
10d         Normal    NodeHasSufficientMemory             node/minikube                 Node minikube status is now: NodeHasSufficientMemory
10d         Normal    NodeHasNoDiskPressure               node/minikube                 Node minikube status is now: NodeHasNoDiskPressure

-------------------------------

kubectl describe node minikube
Name:               minikube
Roles:              control-plane
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=minikube
                    kubernetes.io/os=linux
                    minikube.k8s.io/commit=dd5d320e41b5451cdf3c01891bc4e13d189586ed-dirty
                    minikube.k8s.io/name=minikube
                    minikube.k8s.io/primary=true
                    minikube.k8s.io/updated_at=2025_03_19T20_18_02_0700
                    minikube.k8s.io/version=v1.35.0
                    node-role.kubernetes.io/control-plane=
                    node.kubernetes.io/exclude-from-external-load-balancers=
Annotations:        kubeadm.alpha.kubernetes.io/cri-socket: unix:///var/run/cri-dockerd.sock
                    node.alpha.kubernetes.io/ttl: 0
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Wed, 19 Mar 2025 20:17:58 -0600
Taints:             <none>
Unschedulable:      false

-------------------------------

kubectl get pod nginx-5b87768745-22qhj -o yaml
apiVersion: v1
kind: Pod
metadata:
  annotations:
    kubectl.kubernetes.io/restartedAt: "2025-03-30T12:49:21-06:00"
  creationTimestamp: "2025-03-30T18:54:00Z"
  generateName: nginx-5b87768745-
  labels:
    app: nginx
    pod-template-hash: 5b87768745
  name: nginx-5b87768745-22qhj
  namespace: default
  ownerReferences:
  - apiVersion: apps/v1
    blockOwnerDeletion: true
    controller: true
    kind: ReplicaSet
    name: nginx-5b87768745
    uid: efa777d7-bcf5-4555-80cf-b48133050a21
  resourceVersion: "4442"
  uid: 195abcf0-dc35-41f4-80ca-c18d580d7775
spec:
  containers:
  - image: nginx
    imagePullPolicy: Always
    name: webcontainer
    ports:
    - containerPort: 80
      protocol: TCP
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-rtrlc
      readOnly: true
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  nodeName: minikube
  preemptionPolicy: PreemptLowerPriority
  priority: 0
  restartPolicy: Always
  schedulerName: default-scheduler
  securityContext: {}
  serviceAccount: default
  serviceAccountName: default
  terminationGracePeriodSeconds: 30
  tolerations:
  - effect: NoExecute
    key: node.kubernetes.io/not-ready
    operator: Exists
    tolerationSeconds: 300
  - effect: NoExecute
    key: node.kubernetes.io/unreachable
    operator: Exists
    tolerationSeconds: 300
  volumes:
  - name: kube-api-access-rtrlc
    projected:
      defaultMode: 420
      sources:
      - serviceAccountToken:
          expirationSeconds: 3607
          path: token
      - configMap:
          items:
          - key: ca.crt
            path: ca.crt
          name: kube-root-ca.crt
      - downwardAPI:
          items:
          - fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
            path: namespace
status:
  conditions:
  - lastProbeTime: null
    lastTransitionTime: "2025-03-30T18:54:04Z"
    status: "True"
    type: PodReadyToStartContainers
  - lastProbeTime: null
    lastTransitionTime: "2025-03-30T18:54:00Z"
    status: "True"
    type: Initialized
  - lastProbeTime: null
    lastTransitionTime: "2025-03-30T18:54:04Z"
    status: "True"
    type: Ready
  - lastProbeTime: null
    lastTransitionTime: "2025-03-30T18:54:04Z"
    status: "True"
    type: ContainersReady
  - lastProbeTime: null
    lastTransitionTime: "2025-03-30T18:54:00Z"
    status: "True"
    type: PodScheduled
  containerStatuses:
  - containerID: docker://279b9ebef084c79384f5e217f6169c705ab957264f64a637f0cc895d35347774
    image: nginx:latest
    imageID: docker-pullable://nginx@sha256:124b44bfc9ccd1f3cedf4b592d4d1e8bddb78b51ec2ed5056c52d3692baebc19
    lastState: {}
    name: webcontainer
    ready: true
    restartCount: 0
    started: true
    state:
      running:
        startedAt: "2025-03-30T18:54:04Z"
    volumeMounts:
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-rtrlc
      readOnly: true
      recursiveReadOnly: Disabled
  hostIP: 192.168.49.2
  hostIPs:
  - ip: 192.168.49.2
  phase: Running
  podIP: 10.244.0.21
  podIPs:
  - ip: 10.244.0.21
  qosClass: BestEffort
  startTime: "2025-03-30T18:54:00Z"

-------------------------------

kubectl exec nginx-5b87768745-22qhj -- env
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=nginx-5b87768745-22qhj
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_SERVICE_PORT=443
NGINX_VERSION=1.27.4
NJS_VERSION=0.8.9
NJS_RELEASE=1~bookworm
PKG_RELEASE=1~bookworm
DYNPKG_RELEASE=1~bookworm
HOME=/root

-------------------------------

kubectl config current-context
minikube

-------------------------------

NAME                   STATUS   AGE
default                Active   10d
kube-node-lease        Active   10d
kube-public            Active   10d
kube-system            Active   10d
kubernetes-dashboard   Active   10d

-------------------------------

kubectl config set-context --current --namespace=default
Context "minikube" modified.







