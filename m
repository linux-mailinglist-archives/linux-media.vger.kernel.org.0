Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42F52209FC
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 12:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731145AbgGOK1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 06:27:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53434 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbgGOK1D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 06:27:03 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEC31595;
        Wed, 15 Jul 2020 12:26:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594808821;
        bh=IwfFMnTOV5g3vCiBWGTV5hZOAerkISWY4Tqa0L/Oie8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fQl7bYpPKkrvknFyWQ7sLK0wZg8w2JOhMokqxN6yrPDER4rK3RVp/ZSpQkrZhtQ2z
         ZwTxA6sMuXbJL1v/uo7n52OPGA5WkYFrxN/ExgOv4Bb3Xppjyos91oVo/dZsjfXccO
         fu05d1ej8QUfK5xbTdy91EZEaW8odh37S6+I8WZM=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v5 5/5] cec-follower: Add version command
Date:   Wed, 15 Jul 2020 19:26:40 +0900
Message-Id: <20200715102640.17554-5-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715102640.17554-1-paul.elder@ideasonboard.com>
References: <20200715102640.17554-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a --version option to cec-follower to retrieve the version of
cec-follower. Whilte at it, factor out printing the SHA.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
Changes in v5:
- update manpage

Changes in v4:
- add git commit count to version
- move printing sha into print_sha()

Changes in v3:
- embed PACKAGE_VERSION instead of string concatenation
---
 utils/cec-follower/Makefile.am       |  2 +-
 utils/cec-follower/cec-follower.1.in |  3 +++
 utils/cec-follower/cec-follower.cpp  | 30 +++++++++++++++++++++-------
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/utils/cec-follower/Makefile.am b/utils/cec-follower/Makefile.am
index a550cd1d..96e0f890 100644
--- a/utils/cec-follower/Makefile.am
+++ b/utils/cec-follower/Makefile.am
@@ -2,7 +2,7 @@ bin_PROGRAMS = cec-follower
 man_MANS = cec-follower.1
 
 cec_follower_SOURCES = cec-follower.cpp cec-follower.h cec-processing.cpp cec-tuner.cpp
-cec_follower_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil
+cec_follower_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil $(GIT_COMMIT_CNT)
 cec_follower_LDADD = -lrt ../libcecutil/libcecutil.la
 
 cec-follower.cpp: version.h
diff --git a/utils/cec-follower/cec-follower.1.in b/utils/cec-follower/cec-follower.1.in
index 2836d6dd..61c591b3 100644
--- a/utils/cec-follower/cec-follower.1.in
+++ b/utils/cec-follower/cec-follower.1.in
@@ -61,6 +61,9 @@ having to rely on the device node number.
 \fB\-v\fR, \fB\-\-verbose\fR
 Turn on verbose reporting.
 .TP
+\fB\-\-version\fR
+Show version information.
+.TP
 \fB\-w\fR, \fB\-\-wall\-clock\fR
 Show timestamps as wall-clock time. This also turns on verbose reporting. 
 .TP
diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 9cead57a..b3f9d615 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -46,6 +46,7 @@ enum Option {
 	OptShowState = 's',
 	OptWallClock = 'w',
 	OptServiceByDigID = 128,
+	OptVersion,
 	OptLast = 256
 };
 
@@ -70,10 +71,27 @@ static struct option long_options[] = {
 	{ "wall-clock", no_argument, 0, OptWallClock },
 	{ "service-by-dig-id", no_argument, 0, OptServiceByDigID },
 	{ "ignore", required_argument, 0, OptIgnore },
+	{ "version", no_argument, 0, OptVersion },
 
 	{ 0, 0, 0, 0 }
 };
 
+static void print_sha()
+{
+#ifdef SHA
+#define STR(x) #x
+#define STRING(x) STR(x)
+	printf("cec-follower SHA                   : %s\n", STRING(SHA));
+#else
+	printf("cec-follower SHA                   : not available\n");
+#endif
+}
+
+static void print_version()
+{
+	printf("cec-follower %s%s\n", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
+}
+
 static void usage()
 {
 	printf("Usage:\n"
@@ -93,6 +111,7 @@ static void usage()
 	       "                      Ignore messages from logical address <la> and opcode\n"
 	       "                      <opcode>. 'all' can be used for <la> or <opcode> to match\n"
 	       "                      all logical addresses or opcodes.\n"
+	       "  --version           Show version information\n"
 	       );
 }
 
@@ -427,6 +446,9 @@ int main(int argc, char **argv)
 			show_msgs = true;
 			show_state = true;
 			break;
+		case OptVersion:
+			print_version();
+			std::exit(EXIT_SUCCESS);
 		case ':':
 			fprintf(stderr, "Option '%s' requires a value\n",
 				argv[optind]);
@@ -475,13 +497,7 @@ int main(int argc, char **argv)
 	node.state.service_by_dig_id = options[OptServiceByDigID];
 	state_init(node);
 
-#ifdef SHA
-#define STR(x) #x
-#define STRING(x) STR(x)
-	printf("cec-follower SHA                   : %s\n", STRING(SHA));
-#else
-	printf("cec-follower SHA                   : not available\n");
-#endif
+	print_sha();
 
 	doioctl(&node, CEC_ADAP_G_PHYS_ADDR, &node.phys_addr);
 
-- 
2.27.0

