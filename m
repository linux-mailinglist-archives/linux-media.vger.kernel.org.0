Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34800615338
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 21:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiKAUZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 16:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbiKAUZg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 16:25:36 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9872BD2
        for <linux-media@vger.kernel.org>; Tue,  1 Nov 2022 13:25:35 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id cl5so10046976wrb.9
        for <linux-media@vger.kernel.org>; Tue, 01 Nov 2022 13:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lcnQFEH8tMft1NnQwuY0+FEByvdA/KJ2JTnCUWvixT8=;
        b=dFqwkf38q9U+J2umyrDeBVpDt1IdwC1Nx9lt8DDm4H7NStjJuLHL9q5kdtoZ9gMYTc
         opCV2yZr8vuekaUu7lw4MkFF+n1Y1srkZatS8bSXPEOD0k7KmsykwU8dowkIwJuxBTlu
         XiFB6h5QOwk67Bw43dtwe15bDdhVDdCTzjtUWJTKC/H/MB9WN+GOtROPjsxGu0TtcwPC
         WJqpqTLRZhiIQ2F2jPaNJX/nqD9ji4X+vb+YBMvWJ1mwWBZ1AMos9CRqnSiMri4TwhZe
         pYUcMx39+DQKE0MPMHJrIfVwdBiwh1x+S3bDJORRznSLkTaSIfShChiLGOaKRxJ1yO/V
         avlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcnQFEH8tMft1NnQwuY0+FEByvdA/KJ2JTnCUWvixT8=;
        b=w7QUj2esTJMCiDKOYLlgSeTAHaihuG/KcAKMWvRNqPdVRcudQMLb5G+eaOHdefJs83
         RYjGSSQAhOyKtp4arHvdYI3oNte2+g9cZAT5NRvmrKH6U2QK/5hO6QCDsSjeJVfwurhl
         xxLCTXeC/HWJb0MVl1QQGGtN0tLtaoiBVukDlJhZ82NCzk9zslZn7OtW48K5d69gS7Md
         /+1mXbGH5TC2l38/rom7yS6gfYalcnt3y7aLeDKhoBxq/6LbTwKeHEkrEUjmP0h1vrZs
         iSSg1lVjBgT1iKmq+NMadgucG6tPnRVt9XWJilVtcLYhdVmNV3Xs2h06zpb5EcG4H6Ri
         s66g==
X-Gm-Message-State: ACrzQf3FSzyxjDF89xXSkdK90GJWf2oT5VT5rnN4aHMjFqi4Ca3JhG09
        eFSnWq8y8GzZ4gywcEClhYccVn7NWFU=
X-Google-Smtp-Source: AMsMyM6dqUw+LpKw90trCQpOfxHCCMYo9TglT4aE0Y/32nPQhlcasvgOGRGZzjUYbTGy0p/BK/KE4A==
X-Received: by 2002:a5d:4390:0:b0:236:6e79:3948 with SMTP id i16-20020a5d4390000000b002366e793948mr12083405wrq.284.1667334333722;
        Tue, 01 Nov 2022 13:25:33 -0700 (PDT)
Received: from localhost.localdomain (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id j6-20020a056000124600b0022e653f5abbsm10963967wrx.69.2022.11.01.13.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 13:25:33 -0700 (PDT)
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] keytable: Convert deprecated libbpf API
Date:   Tue,  1 Nov 2022 20:25:28 +0000
Message-Id: <20221101202528.27306-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The libbpf APIs bpf_load_program_xattr(), bpf_create_map_node() and
bpf_create_map_in_map_node() have been deprecated since v0.7. Convert
them to use bpf_prog_load() and bpf_map_create().
Also, modify config script to add a check for libbpf version.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 configure.ac              |  2 +-
 utils/keytable/bpf_load.c | 59 ++++++++++++++++++++++-----------------
 2 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/configure.ac b/configure.ac
index 05298981..9b7c371d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -564,7 +564,7 @@ AM_CONDITIONAL([WITH_V4L2_CTL_32], [test x${enable_v4l2_ctl_32} = xyes])
 AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xyes])
 AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_libv4l} != xno])
 AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_32], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_32} = xyes])
-PKG_CHECK_MODULES([LIBBPF], [libbpf], [bpf_pc=yes], [bpf_pc=no])
+PKG_CHECK_MODULES([LIBBPF], [libbpf >= 0.7], [bpf_pc=yes], [bpf_pc=no])
 AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang -a x$bpf_pc = xyes])
 
 # append -static to libtool compile and link command to enforce static libs
diff --git a/utils/keytable/bpf_load.c b/utils/keytable/bpf_load.c
index 7c633dac..06098fc3 100644
--- a/utils/keytable/bpf_load.c
+++ b/utils/keytable/bpf_load.c
@@ -63,19 +63,17 @@ struct bpf_file {
 
 static int load_and_attach(int lirc_fd, struct bpf_file *bpf_file, struct bpf_insn *prog, int size)
 {
-	struct bpf_load_program_attr load_attr;
-	int fd, err;
+	LIBBPF_OPTS(bpf_prog_load_opts, opts);
+	int fd, err, insn_cnt;
 
-	memset(&load_attr, 0, sizeof(struct bpf_load_program_attr));
+	insn_cnt = size / sizeof(struct bpf_insn);
 
-	load_attr.prog_type = BPF_PROG_TYPE_LIRC_MODE2;
-	load_attr.expected_attach_type = BPF_LIRC_MODE2;
-	load_attr.name = bpf_file->name;
-	load_attr.insns = prog;
-	load_attr.insns_cnt = size / sizeof(struct bpf_insn);
-	load_attr.license = bpf_file->license;
+	opts.expected_attach_type = BPF_LIRC_MODE2;
+	opts.log_buf = bpf_log_buf;
+	opts.log_size = LOG_BUF_SIZE;
 
-	fd = bpf_load_program_xattr(&load_attr, bpf_log_buf, LOG_BUF_SIZE);
+	fd = bpf_prog_load(BPF_PROG_TYPE_LIRC_MODE2, bpf_file->name,
+				bpf_file->license, prog, insn_cnt, &opts);
 	if (fd < 0) {
 		printf("bpf_load_program() err=%m\n%s", bpf_log_buf);
 		return -1;
@@ -95,6 +93,9 @@ static int build_raw_map(struct bpf_map_data *map, struct raw_entry *raw, int nu
 	int no_patterns, value_size, fd, key, i;
 	struct raw_entry *e;
 	struct raw_pattern *p;
+	LIBBPF_OPTS(bpf_map_create_opts, opts,
+		.map_flags = map->def.map_flags,
+	);
 
 	no_patterns = 0;
 
@@ -110,14 +111,13 @@ static int build_raw_map(struct bpf_map_data *map, struct raw_entry *raw, int nu
 
 	value_size = sizeof(struct raw_pattern) + max_length * sizeof(short);
 
-	fd = bpf_create_map_node(map->def.type,
-				 map->name,
-				 map->def.key_size,
-				 value_size,
-				 no_patterns,
-				 map->def.map_flags,
-				 numa_node);
-
+	opts.numa_node = numa_node;
+	fd = bpf_map_create(map->def.type,
+			    map->name,
+			    map->def.key_size,
+			    value_size,
+			    no_patterns,
+			    &opts);
 	if (fd < 0) {
 		printf(_("failed to create a map: %d %s\n"),
 		       errno, strerror(errno));
@@ -174,27 +174,34 @@ static int load_maps(struct bpf_file *bpf_file, struct raw_entry *raw)
 
 		if (maps[i].def.type == BPF_MAP_TYPE_ARRAY_OF_MAPS ||
 		    maps[i].def.type == BPF_MAP_TYPE_HASH_OF_MAPS) {
-			int inner_map_fd = bpf_file->map_fd[maps[i].def.inner_map_idx];
+			LIBBPF_OPTS(bpf_map_create_opts, opts,
+				.inner_map_fd = bpf_file->map_fd[maps[i].def.inner_map_idx],
+				.map_flags = maps[i].def.map_flags,
+				.numa_node = numa_node,
+			);
 
-			bpf_file->map_fd[i] = bpf_create_map_in_map_node(
+			bpf_file->map_fd[i] = bpf_map_create(
 							maps[i].def.type,
 							maps[i].name,
 							maps[i].def.key_size,
-							inner_map_fd,
+							4,
 							maps[i].def.max_entries,
-							maps[i].def.map_flags,
-							numa_node);
+							&opts);
 		} else if (!strcmp(maps[i].name, "raw_map")) {
 			bpf_file->map_fd[i] = build_raw_map(&maps[i], raw, numa_node);
 		} else {
-			bpf_file->map_fd[i] = bpf_create_map_node(
+			LIBBPF_OPTS(bpf_map_create_opts, opts,
+				.map_flags = maps[i].def.map_flags,
+				.numa_node = numa_node,
+			);
+
+			bpf_file->map_fd[i] = bpf_map_create(
 							maps[i].def.type,
 							maps[i].name,
 							maps[i].def.key_size,
 							maps[i].def.value_size,
 							maps[i].def.max_entries,
-							maps[i].def.map_flags,
-							numa_node);
+							&opts);
 		}
 
 		if (bpf_file->map_fd[i] < 0) {
-- 
2.30.2

