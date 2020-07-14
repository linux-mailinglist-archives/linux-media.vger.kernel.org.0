Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D948621E7BF
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 07:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgGNF7x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 01:59:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60724 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbgGNF7w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 01:59:52 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BD7C71D;
        Tue, 14 Jul 2020 07:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594706390;
        bh=WVoyuNxYcQAIY1RC6HRI/CXzlU+bsZNkVU//gh6FCzA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dQwt0UGiqkKRLhdsJVsjoSvZcFUNHhXVcxWH53BLyoevcGiLQ0mxNKWnaHZw14fCe
         D/gv53jd0AZbbrvgtrXj5/HpUKIOCjb1VlbgLnLypJOrxFTG8JMPeubx6dvDkBxh3S
         YLZDxpyG7l70wY6JfNb8X0IvFCOsN3/KWiP9+9ek=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v4 6/7] cec-follower: Add version command
Date:   Tue, 14 Jul 2020 14:59:14 +0900
Message-Id: <20200714055915.640438-6-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714055915.640438-1-paul.elder@ideasonboard.com>
References: <20200714055915.640438-1-paul.elder@ideasonboard.com>
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
Changes in v4:
- add git commit count to version
- move printing sha into print_sha()

Changes in v3:
- embed PACKAGE_VERSION instead of string concatenation
---
 utils/cec-follower/Makefile.am      |  2 +-
 utils/cec-follower/cec-follower.cpp | 30 ++++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 8 deletions(-)

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

