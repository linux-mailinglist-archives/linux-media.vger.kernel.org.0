Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF8E1AB672
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 05:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387737AbgDPD7n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 23:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728187AbgDPD7k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 23:59:40 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A4EC061A0C
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 20:59:39 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b7so798646pju.0
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 20:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PsnGzjfKu5IZcoR5TNPc62+7ZAU/sxStmB75VwZNkU=;
        b=r6iyNmiFOpmAEmSZ36vNloWokFOt7qZTopBatWz3hWnCXW8Z1mvaXSqi01naLXiITj
         vtr+f/7oBkGSPkxmTF9fOshT3hLZq4LrpA7iQaPla3tA+6osAw8jIBJZyqbebuj7wlOy
         UHUj81ida2v4lV29Q7q5TkATWQd6K+G4emzXuPcoKu8LObCWFYQKe8/w1PkV/sUqbZEx
         eGIorOtLRNGv0yC7W1fNIFu9SL1qd3sIUWXJ4WAVc02lRblX3Euql18SA4yAkuLaPBov
         dojUs8HqJXYO12caTga7gfciF6OkFqbD0cBrIwMs3zxrVnf021c3CvriTcXaZfEr1fO/
         eGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PsnGzjfKu5IZcoR5TNPc62+7ZAU/sxStmB75VwZNkU=;
        b=OT/dT71OT1CDstVqpcjfK+M7zOMcSBM39uMyxCfpKADlfMPgTWnyFkZ0xCOuOFAD0T
         a1ENdUhBnISeQHGYPFi6z7Sfip7IOXeCDg7WVe0HC6YF2AELc8oyXCOnl9V+zHOv9eMj
         zIhvEg6TjD4VvmvRnHRudK/PaiGmexXUyy9iq+dwDkJ+FS6ebl8eGnYEtMlyf2BaPLxM
         5DP2AR1QLYYa+7XoW4bnODRxhQAa0BZK+bGZzHXgVrWL2qi3N1AB52aBuooRDQQSLT2O
         UwEAzxESPYEvuOfctm93pIUAJRUxwY9Dd8Yl23BQxllT1/LH/2gpiF87JmYQJxgNvaFT
         OAOw==
X-Gm-Message-State: AGi0PuZgTrHMnrmSoXEMj6C5KvLNzYbMKcCSvttRr61y6w6HbBHM+x6A
        zUKsPwH1872e31N+7I4sBkcY6MxD
X-Google-Smtp-Source: APiQypL804Rm9aEZ6Pcdq/kD7xobpJfLD7DzrF8OkMc4PzsouNTp86RZyT4UB13p/53I2wzfgBap2Q==
X-Received: by 2002:a17:90a:25cb:: with SMTP id k69mr2621403pje.93.1587009578177;
        Wed, 15 Apr 2020 20:59:38 -0700 (PDT)
Received: from localhost.localdomain (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id x4sm15327940pfi.202.2020.04.15.20.59.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 20:59:37 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] treewide: remove bzero
Date:   Wed, 15 Apr 2020 20:59:35 -0700
Message-Id: <20200416035935.387760-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

bzero is gone in POSIX 2008. Replace with {} and memset.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/dvb/dvbv5-daemon.c |  2 +-
 utils/keytable/bpf.c     | 70 +++++++++++++---------------------------
 2 files changed, 24 insertions(+), 48 deletions(-)

diff --git a/utils/dvb/dvbv5-daemon.c b/utils/dvb/dvbv5-daemon.c
index 26d234df..0b0e2d41 100644
--- a/utils/dvb/dvbv5-daemon.c
+++ b/utils/dvb/dvbv5-daemon.c
@@ -1475,7 +1475,7 @@ int main(int argc, char *argv[])
 	}
 
 	/* Initialize listen address struct */
-	bzero((char *) &serv_addr, sizeof(serv_addr));
+	memset((char *) &serv_addr, 0, sizeof(serv_addr));
 	serv_addr.sin_family = AF_INET;
 	serv_addr.sin_addr.s_addr = INADDR_ANY;
 	serv_addr.sin_port = htons(port);
diff --git a/utils/keytable/bpf.c b/utils/keytable/bpf.c
index b1cd2507..69ba190d 100644
--- a/utils/keytable/bpf.c
+++ b/utils/keytable/bpf.c
@@ -67,9 +67,7 @@ static inline int sys_bpf(enum bpf_cmd cmd, union bpf_attr *attr,
 int bpf_create_map_xattr(const struct bpf_create_map_attr *create_attr)
 {
 	__u32 name_len = create_attr->name ? strlen(create_attr->name) : 0;
-	union bpf_attr attr;
-
-	memset(&attr, '\0', sizeof(attr));
+	union bpf_attr attr = {};
 
 	attr.map_type = create_attr->map_type;
 	attr.key_size = create_attr->key_size;
@@ -142,9 +140,7 @@ int bpf_create_map_in_map_node(enum bpf_map_type map_type, const char *name,
 			       __u32 map_flags, int node)
 {
 	__u32 name_len = name ? strlen(name) : 0;
-	union bpf_attr attr;
-
-	memset(&attr, '\0', sizeof(attr));
+	union bpf_attr attr = {};
 
 	attr.map_type = map_type;
 	attr.key_size = key_size;
@@ -183,7 +179,7 @@ int bpf_load_program_xattr(const struct bpf_load_program_attr *load_attr,
 
 	name_len = load_attr->name ? strlen(load_attr->name) : 0;
 
-	bzero(&attr, sizeof(attr));
+	memset(&attr, 0, sizeof(attr));
 	attr.prog_type = load_attr->prog_type;
 	attr.expected_attach_type = load_attr->expected_attach_type;
 	attr.insn_cnt = (__u32)load_attr->insns_cnt;
@@ -214,9 +210,8 @@ int bpf_load_program(enum bpf_prog_type type, const struct bpf_insn *insns,
 		     __u32 kern_version, char *log_buf,
 		     size_t log_buf_sz)
 {
-	struct bpf_load_program_attr load_attr;
+	struct bpf_load_program_attr load_attr = {};
 
-	memset(&load_attr, 0, sizeof(struct bpf_load_program_attr));
 	load_attr.prog_type = type;
 	load_attr.expected_attach_type = 0;
 	load_attr.name = name;
@@ -233,9 +228,8 @@ int bpf_verify_program(enum bpf_prog_type type, const struct bpf_insn *insns,
 		       const char *license, __u32 kern_version,
 		       char *log_buf, size_t log_buf_sz, int log_level)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.prog_type = type;
 	attr.insn_cnt = (__u32)insns_cnt;
 	attr.insns = ptr_to_u64(insns);
@@ -253,9 +247,8 @@ int bpf_verify_program(enum bpf_prog_type type, const struct bpf_insn *insns,
 int bpf_map_update_elem(int fd, const void *key, const void *value,
 			__u64 flags)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.map_fd = fd;
 	attr.key = ptr_to_u64(key);
 	attr.value = ptr_to_u64(value);
@@ -266,9 +259,8 @@ int bpf_map_update_elem(int fd, const void *key, const void *value,
 
 int bpf_map_lookup_elem(int fd, const void *key, void *value)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.map_fd = fd;
 	attr.key = ptr_to_u64(key);
 	attr.value = ptr_to_u64(value);
@@ -278,9 +270,8 @@ int bpf_map_lookup_elem(int fd, const void *key, void *value)
 
 int bpf_map_delete_elem(int fd, const void *key)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.map_fd = fd;
 	attr.key = ptr_to_u64(key);
 
@@ -289,9 +280,8 @@ int bpf_map_delete_elem(int fd, const void *key)
 
 int bpf_map_get_next_key(int fd, const void *key, void *next_key)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.map_fd = fd;
 	attr.key = ptr_to_u64(key);
 	attr.next_key = ptr_to_u64(next_key);
@@ -301,9 +291,8 @@ int bpf_map_get_next_key(int fd, const void *key, void *next_key)
 
 int bpf_obj_pin(int fd, const char *pathname)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.pathname = ptr_to_u64((void *)pathname);
 	attr.bpf_fd = fd;
 
@@ -312,9 +301,8 @@ int bpf_obj_pin(int fd, const char *pathname)
 
 int bpf_obj_get(const char *pathname)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.pathname = ptr_to_u64((void *)pathname);
 
 	return sys_bpf(BPF_OBJ_GET, &attr, sizeof(attr));
@@ -323,9 +311,8 @@ int bpf_obj_get(const char *pathname)
 int bpf_prog_attach(int prog_fd, int target_fd, enum bpf_attach_type type,
 		    unsigned int flags)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.target_fd	   = target_fd;
 	attr.attach_bpf_fd = prog_fd;
 	attr.attach_type   = type;
@@ -336,9 +323,8 @@ int bpf_prog_attach(int prog_fd, int target_fd, enum bpf_attach_type type,
 
 int bpf_prog_detach(int target_fd, enum bpf_attach_type type)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.target_fd	 = target_fd;
 	attr.attach_type = type;
 
@@ -347,9 +333,8 @@ int bpf_prog_detach(int target_fd, enum bpf_attach_type type)
 
 int bpf_prog_detach2(int prog_fd, int target_fd, enum bpf_attach_type type)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.target_fd	 = target_fd;
 	attr.attach_bpf_fd = prog_fd;
 	attr.attach_type = type;
@@ -360,10 +345,9 @@ int bpf_prog_detach2(int prog_fd, int target_fd, enum bpf_attach_type type)
 int bpf_prog_query(int target_fd, enum bpf_attach_type type, __u32 query_flags,
 		   __u32 *attach_flags, __u32 *prog_ids, __u32 *prog_cnt)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 	int ret;
 
-	bzero(&attr, sizeof(attr));
 	attr.query.target_fd	= target_fd;
 	attr.query.attach_type	= type;
 	attr.query.query_flags	= query_flags;
@@ -381,10 +365,9 @@ int bpf_prog_test_run(int prog_fd, int repeat, void *data, __u32 size,
 		      void *data_out, __u32 *size_out, __u32 *retval,
 		      __u32 *duration)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 	int ret;
 
-	bzero(&attr, sizeof(attr));
 	attr.test.prog_fd = prog_fd;
 	attr.test.data_in = ptr_to_u64(data);
 	attr.test.data_out = ptr_to_u64(data_out);
@@ -403,10 +386,9 @@ int bpf_prog_test_run(int prog_fd, int repeat, void *data, __u32 size,
 
 int bpf_prog_get_next_id(__u32 start_id, __u32 *next_id)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 	int err;
 
-	bzero(&attr, sizeof(attr));
 	attr.start_id = start_id;
 
 	err = sys_bpf(BPF_PROG_GET_NEXT_ID, &attr, sizeof(attr));
@@ -418,10 +400,9 @@ int bpf_prog_get_next_id(__u32 start_id, __u32 *next_id)
 
 int bpf_map_get_next_id(__u32 start_id, __u32 *next_id)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 	int err;
 
-	bzero(&attr, sizeof(attr));
 	attr.start_id = start_id;
 
 	err = sys_bpf(BPF_MAP_GET_NEXT_ID, &attr, sizeof(attr));
@@ -433,9 +414,8 @@ int bpf_map_get_next_id(__u32 start_id, __u32 *next_id)
 
 int bpf_prog_get_fd_by_id(__u32 id)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.prog_id = id;
 
 	return sys_bpf(BPF_PROG_GET_FD_BY_ID, &attr, sizeof(attr));
@@ -443,9 +423,8 @@ int bpf_prog_get_fd_by_id(__u32 id)
 
 int bpf_map_get_fd_by_id(__u32 id)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.map_id = id;
 
 	return sys_bpf(BPF_MAP_GET_FD_BY_ID, &attr, sizeof(attr));
@@ -453,9 +432,8 @@ int bpf_map_get_fd_by_id(__u32 id)
 
 int bpf_btf_get_fd_by_id(__u32 id)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.btf_id = id;
 
 	return sys_bpf(BPF_BTF_GET_FD_BY_ID, &attr, sizeof(attr));
@@ -463,10 +441,9 @@ int bpf_btf_get_fd_by_id(__u32 id)
 
 int bpf_obj_get_info_by_fd(int prog_fd, void *info, __u32 *info_len)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 	int err;
 
-	bzero(&attr, sizeof(attr));
 	attr.info.bpf_fd = prog_fd;
 	attr.info.info_len = *info_len;
 	attr.info.info = ptr_to_u64(info);
@@ -480,9 +457,8 @@ int bpf_obj_get_info_by_fd(int prog_fd, void *info, __u32 *info_len)
 
 int bpf_raw_tracepoint_open(const char *name, int prog_fd)
 {
-	union bpf_attr attr;
+	union bpf_attr attr = {};
 
-	bzero(&attr, sizeof(attr));
 	attr.raw_tracepoint.name = ptr_to_u64(name);
 	attr.raw_tracepoint.prog_fd = prog_fd;
 
-- 
2.25.2

