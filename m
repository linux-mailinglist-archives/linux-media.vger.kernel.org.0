Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD4C9A8003
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 12:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfIDKIu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 06:08:50 -0400
Received: from gofer.mess.org ([88.97.38.141]:54501 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbfIDKIu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Sep 2019 06:08:50 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 920D060688; Wed,  4 Sep 2019 11:08:49 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] keytable: ensure we have enough memlock pages
Date:   Wed,  4 Sep 2019 11:08:49 +0100
Message-Id: <20190904100849.21916-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since kernel v5.2, BPF maps and programs are charged against
RLIMT_MEMLOCK. By default this limit is 64KB however all of these are
already taken (16 patges) by the time we've booted on Fedora. This
results in a permission denied.

The error message is confusing since error happens when running as root.
systemd works around this problem by setting setrlimit(RLIMIT_MEMLOCK)
to 64MB. Do the the same.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/keytable.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 70fbb822..986503a0 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -25,6 +25,7 @@
 #include <linux/lirc.h>
 #include <sys/ioctl.h>
 #include <sys/types.h>
+#include <sys/resource.h>
 #include <sys/stat.h>
 #include <dirent.h>
 #include <argp.h>
@@ -1698,9 +1699,14 @@ static void device_info(int fd, char *prepend)
 
 #ifdef HAVE_BPF
 #define MAX_PROGS 64
+// This value is what systemd sets PID 1 to, see:
+// https://github.com/systemd/systemd/blob/master/src/basic/def.h#L60
+#define HIGH_RLIMIT_MEMLOCK (1024ULL*1024ULL*64ULL)
+
 static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct protocol_param *param)
 {
 	unsigned int features;
+	struct rlimit rl;
 	int fd;
 
 	fd = open(lirc_name, O_RDONLY);
@@ -1721,6 +1727,14 @@ static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct proto
 		return;
 	}
 
+	// BPF programs are charged against RLIMIT_MEMLOCK. We'll need pages
+	// for the state, program text, and any raw IR. None of these are
+	// particularly large. However, the kernel defaults to 64KB
+	// memlock, which is only 16 pages which are mostly used by the
+	// time we are trying to load our BPF program.
+	rl.rlim_cur = rl.rlim_max = HIGH_RLIMIT_MEMLOCK;
+	(void) setrlimit(RLIMIT_MEMLOCK, &rl);
+
 	load_bpf_file(bpf_prog, fd, param, rawtable);
 	close(fd);
 }
-- 
2.21.0

