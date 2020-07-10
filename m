Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8EF721B97C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 17:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgGJP3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 11:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgGJP3W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 11:29:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A593EC08C5CE
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 08:29:21 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CC492C0;
        Fri, 10 Jul 2020 17:29:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594394959;
        bh=p86aJ8vHaxhnJfG97Tc0QbMgOVuh+7I/vEjm/kNAkEY=;
        h=From:To:Cc:Subject:Date:From;
        b=DZbOcOL0DGPi5wdeS6D1TSAcGDMSeJp5hpVext9F/Gw+nGOdW6PKykioQCK/Z/oyb
         X9XkucDq/dBeWexlZ8eUNQSgt1hzh1bEQb5ORjXLst69ecK3JVrFH+PrpDVE9+U0au
         XvJUH+NENCzpc9YmJQia4AwybCyWpYdws7eaSsw0=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v2 1/6] v4l2-compliance: Add version command
Date:   Sat, 11 Jul 2020 00:28:53 +0900
Message-Id: <20200710152858.486326-1-paul.elder@ideasonboard.com>
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
 utils/v4l2-compliance/v4l2-compliance.cpp | 40 ++++++++++++++++-------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 4b45f110..dfffa184 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -79,6 +79,7 @@ enum Option {
 	OptMediaBusInfo = 'z',
 	OptStreamFrom = 128,
 	OptStreamFromHdr,
+	OptVersion,
 	OptLast = 256
 };
 
@@ -153,9 +154,29 @@ static struct option long_options[] = {
 	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
 	{"stream-all-io", no_argument, 0, OptStreamAllIO},
 	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
+	{"version", no_argument, 0, OptVersion},
 	{0, 0, 0, 0}
 };
 
+static void print_sha()
+{
+#ifdef SHA
+#define STR(x) #x
+#define STRING(x) STR(x)
+	printf("v4l2-compliance SHA: %s", STRING(SHA));
+#else
+	printf("v4l2-compliance SHA: not available\n");
+#endif
+
+	printf(", %zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
+	printf("\n");
+}
+
+static void version()
+{
+	printf("v4l2-compliance " PACKAGE_VERSION "\n");
+}
+
 static void usage()
 {
 	printf("Usage:\n");
@@ -244,6 +265,7 @@ static void usage()
 	printf("  -P, --no-progress  Turn off progress messages.\n");
 	printf("  -T, --trace        Trace all called ioctls.\n");
 	printf("  -v, --verbose      Turn on verbose reporting.\n");
+	printf("  --version          Show version information.\n");
 #ifndef NO_LIBV4L2
 	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
 #endif
@@ -1485,17 +1507,6 @@ int main(int argc, char **argv)
 	char *value, *subs;
 	int idx = 0;
 
-#ifdef SHA
-#define STR(x) #x
-#define STRING(x) STR(x)
-	printf("v4l2-compliance SHA: %s", STRING(SHA));
-#else
-	printf("v4l2-compliance SHA: not available\n");
-#endif
-
-	printf(", %zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
-	printf("\n");
-
 	if (!env_media_apps_color || !strcmp(env_media_apps_color, "auto"))
 		show_colors = isatty(STDOUT_FILENO);
 	else if (!strcmp(env_media_apps_color, "always"))
@@ -1664,6 +1675,10 @@ int main(int argc, char **argv)
 		case OptNoProgress:
 			no_progress = true;
 			break;
+		case OptVersion:
+			version();
+			print_sha();
+			std::exit(EXIT_SUCCESS);
 		case ':':
 			fprintf(stderr, "Option `%s' requires a value\n",
 				argv[optind]);
@@ -1685,6 +1700,9 @@ int main(int argc, char **argv)
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

