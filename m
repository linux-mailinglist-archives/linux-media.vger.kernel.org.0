Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342F521E7BB
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 07:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgGNF7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 01:59:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60702 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgGNF7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 01:59:41 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14EB271D;
        Tue, 14 Jul 2020 07:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594706379;
        bh=Ew+SsarMu06l/V7xcnho8PBeFWv4Nh4eKcverwPsXYQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mxaHboOe4OSI17Q9Ru5hiI659GJDdSNUYkEN2w7hUjRvZrxY0yTSpkH2zNwfxRq35
         /JnW84c9b+NzWQGH87oetv7f08/wOi5DGSumufvgawFNVKb3fo8/QhpolcMNplH2Mf
         l1uECsoCDfcmp1beo4VD15+xlOOiZaJXzx9Ix0/I=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v4 2/7] v4l2-compliance: Add version command
Date:   Tue, 14 Jul 2020 14:59:10 +0900
Message-Id: <20200714055915.640438-2-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714055915.640438-1-paul.elder@ideasonboard.com>
References: <20200714055915.640438-1-paul.elder@ideasonboard.com>
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
Changes in v4:
- add git commit count to version

Changes in v3:
- embed PACKAGE_VERSION instead of string concatenation
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 30 ++++++++++++++++++-----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 825f2aa6..97c79e40 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -76,6 +76,7 @@ enum Option {
 	OptMediaBusInfo = 'z',
 	OptStreamFrom = 128,
 	OptStreamFromHdr,
+	OptVersion,
 	OptLast = 256
 };
 
@@ -150,9 +151,24 @@ static struct option long_options[] = {
 	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
 	{"stream-all-io", no_argument, 0, OptStreamAllIO},
 	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
+	{"version", no_argument, 0, OptVersion},
 	{0, 0, 0, 0}
 };
 
+static void print_sha()
+{
+#define STR(x) #x
+#define STRING(x) STR(x)
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
@@ -241,6 +257,7 @@ static void usage()
 	printf("  -P, --no-progress  Turn off progress messages.\n");
 	printf("  -T, --trace        Trace all called ioctls.\n");
 	printf("  -v, --verbose      Turn on verbose reporting.\n");
+	printf("  --version          Show version information.\n");
 #ifndef NO_LIBV4L2
 	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
 #endif
@@ -1482,12 +1499,6 @@ int main(int argc, char **argv)
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
@@ -1656,6 +1667,10 @@ int main(int argc, char **argv)
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
@@ -1677,6 +1692,9 @@ int main(int argc, char **argv)
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

