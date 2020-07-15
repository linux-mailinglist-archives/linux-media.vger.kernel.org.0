Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6852209F3
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 12:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbgGOK0x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 06:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbgGOK0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 06:26:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F74C061755
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2020 03:26:53 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC1AF564;
        Wed, 15 Jul 2020 12:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594808811;
        bh=DWpG4S89inUMoW6sZEPPMoEKf3yYaDnkBMj3oU2qS3k=;
        h=From:To:Cc:Subject:Date:From;
        b=g4/O7JCJ/0m91WL9eAuQEmZY9YgQXAIf1UEyWQQMmS5jgfVPDuhKJtBzbcd3B43i9
         EkdIgRkJ/xIJwcfXbE5e/piPrUPViBPT3UUo0TrIBffXV15KC6EX3rwDYcz4ufr+gH
         WWvfLgb49+Q6NuW0e2CGsHOXrl+GSYM0U6elvkpc=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v5 1/5] v4l2-compliance: Add version command
Date:   Wed, 15 Jul 2020 19:26:36 +0900
Message-Id: <20200715102640.17554-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a --version option to v4l2-compliance to retrieve the version of
v4l2-compliance. While at it, factor out and reorder printing the SHA to
after argument parsing.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
Changes in v5:
- update manpage
- move STR macros to before print_sha()

Changes in v4:
- add git commit count to version

Changes in v3:
- embed PACKAGE_VERSION instead of string concatenation
---
 utils/v4l2-compliance/v4l2-compliance.1.in |  3 +++
 utils/v4l2-compliance/v4l2-compliance.cpp  | 31 +++++++++++++++++-----
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.1.in b/utils/v4l2-compliance/v4l2-compliance.1.in
index 39f0229d..89d7e482 100644
--- a/utils/v4l2-compliance/v4l2-compliance.1.in
+++ b/utils/v4l2-compliance/v4l2-compliance.1.in
@@ -184,6 +184,9 @@ Trace all called ioctls.
 \fB\-v\fR, \fB\-\-verbose\fR
 Turn on verbose reporting.
 .TP
+\fB\-\-version\fR
+Show version information.
+.TP
 \fB\-w\fR, \fB\-\-wrapper\fR
 Use the libv4l2 wrapper library for all V4L2 device accesses. Note that doing this will
 cause some tests to fail because the libv4l2 library isn't fully V4L2 compliant. By
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 825f2aa6..92b4e995 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -76,6 +76,7 @@ enum Option {
 	OptMediaBusInfo = 'z',
 	OptStreamFrom = 128,
 	OptStreamFromHdr,
+	OptVersion,
 	OptLast = 256
 };
 
@@ -150,9 +151,25 @@ static struct option long_options[] = {
 	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
 	{"stream-all-io", no_argument, 0, OptStreamAllIO},
 	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
+	{"version", no_argument, 0, OptVersion},
 	{0, 0, 0, 0}
 };
 
+#define STR(x) #x
+#define STRING(x) STR(x)
+
+static void print_sha()
+{
+	printf("v4l2-compliance SHA: %s", STRING(GIT_SHA));
+	printf(", %zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
+	printf("\n");
+}
+
+static void print_version()
+{
+	printf("v4l2-compliance %s%s\n", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
+}
+
 static void usage()
 {
 	printf("Usage:\n");
@@ -241,6 +258,7 @@ static void usage()
 	printf("  -P, --no-progress  Turn off progress messages.\n");
 	printf("  -T, --trace        Trace all called ioctls.\n");
 	printf("  -v, --verbose      Turn on verbose reporting.\n");
+	printf("  --version          Show version information.\n");
 #ifndef NO_LIBV4L2
 	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
 #endif
@@ -1482,12 +1500,6 @@ int main(int argc, char **argv)
 	char *value, *subs;
 	int idx = 0;
 
-#define STR(x) #x
-#define STRING(x) STR(x)
-	printf("v4l2-compliance SHA: %s", STRING(GIT_SHA));
-	printf(", %zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
-	printf("\n");
-
 	if (!env_media_apps_color || !strcmp(env_media_apps_color, "auto"))
 		show_colors = isatty(STDOUT_FILENO);
 	else if (!strcmp(env_media_apps_color, "always"))
@@ -1656,6 +1668,10 @@ int main(int argc, char **argv)
 		case OptNoProgress:
 			no_progress = true;
 			break;
+		case OptVersion:
+			print_version();
+			print_sha();
+			std::exit(EXIT_SUCCESS);
 		case ':':
 			fprintf(stderr, "Option `%s' requires a value\n",
 				argv[optind]);
@@ -1677,6 +1693,9 @@ int main(int argc, char **argv)
 		usage();
 		std::exit(EXIT_FAILURE);
 	}
+
+	print_sha();
+
 	bool direct = !options[OptUseWrapper];
 	int fd;
 
-- 
2.27.0

