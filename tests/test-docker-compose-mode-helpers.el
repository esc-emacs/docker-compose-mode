;;; test-docker-compose-mode-helpers.el --- Tests for docker-compose-mode helpers -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Ricardo Martins

;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;; http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;;; Code:

(require 'docker-compose-mode-helpers)

(defconst schema-v1-filename "config_schema_v1.json")

(when (file-exists-p schema-v1-filename)
  (describe "Function: `docker-compose--extract-keywords-from-schema-tree'"
    (describe "given the docker-compose v1 schema"
      (it "returns a list with all the keywords"
        (let ((expected-keywords
               '("build" "cap_add" "cap_drop" "cgroup_parent" "command"
                 "container_name" "cpu_quota" "cpu_shares" "cpuset" "devices"
                 "dns" "dns_search" "dockerfile" "domainname" "entrypoint"
                 "env_file" "environment" "expose" "extends" "external_links"
                 "extra_hosts" "file" "hard" "hostname" "image" "ipc" "labels"
                 "links" "log_driver" "log_opt" "mac_address" "mem_limit"
                 "mem_swappiness" "memswap_limit" "net" "pid" "ports"
                 "privileged" "read_only" "restart" "security_opt" "service"
                 "shm_size" "soft" "stdin_open" "stop_signal" "tty" "ulimits"
                 "user" "volume_driver" "volumes" "volumes_from" "working_dir")))
          (expect
           (docker-compose--extract-keywords-from-schema-file schema-v1-filename)
           :to-equal
           expected-keywords))))))

(provide 'test-docker-compose-mode-helpers)
;;; test-docker-compose-mode-helpers.el ends here
