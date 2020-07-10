Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF7121B97E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 17:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgGJP30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 11:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgGJP30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 11:29:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174E0C08C5CE
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 08:29:26 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04669B23;
        Fri, 10 Jul 2020 17:29:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594394964;
        bh=VT+PmWTgks/xjSUznT5Oqen9cCeSgx4fWV7GsEOjXG8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=alnlp+yA6LyydcGGB54Y4eCic98+cC3W6MZNkFAMARQuggzznTO0zg+yZBoioiFdr
         hCufFNe+hAHDtkWZMO5NetMctB6xqqFSPtf0gFpV4Z4nw3gBW+vlXGl/SwQrk4KbM6
         WphIizWQ01KoNjYlZUY12kDNhpMhpuKgqE/Xn3b0=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v2 3/6] cec-compliance: Add version command
Date:   Sat, 11 Jul 2020 00:28:55 +0900
Message-Id: <20200710152858.486326-3-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710152858.486326-1-paul.elder@ideasonboard.com>
References: <20200710152858.486326-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a --version option to cec-compliance to retrieve the version of
cec-compliance. While at it, factor out printing the SHA.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 utils/cec-compliance/cec-compliance.cpp | 33 +++++++++++++++++++------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index 0e5840c5..f954b31b 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -96,6 +96,8 @@ enum Option {
 	OptSkipTestTunerControl,
 	OptSkipTestVendorSpecificCommands,
 	OptSkipTestStandbyResume,
+
+	OptVersion,
 	OptLast = 256
 };
 
@@ -177,9 +179,27 @@ static struct option long_options[] = {
 	{"skip-test-tuner-control", no_argument, 0, OptSkipTestTunerControl},
 	{"skip-test-vendor-specific-commands", no_argument, 0, OptSkipTestVendorSpecificCommands},
 	{"skip-test-standby-resume", no_argument, 0, OptSkipTestStandbyResume},
+	{"version", no_argument, 0, OptVersion},
 	{0, 0, 0, 0}
 };
 
+static void print_sha()
+{
+#ifdef SHA
+#define STR(x) #x
+#define STRING(x) STR(x)
+	printf("cec-compliance SHA                 : %s\n", STRING(SHA));
+#else
+	printf("cec-compliance SHA                 : not available\n");
+#endif
+
+}
+
+static void version()
+{
+	printf("cec-compliance " PACKAGE_VERSION "\n");
+}
+
 static void usage()
 {
 	printf("Usage:\n"
@@ -234,6 +254,7 @@ static void usage()
 	       "  -s, --skip-info    Skip Driver Info output\n"
 	       "  -T, --trace        Trace all called ioctls\n"
 	       "  -v, --verbose      Turn on verbose reporting\n"
+	       "  --version          Show version information\n"
 	       "  -w, --wall-clock   Show timestamps as wall-clock time (implies -v)\n"
 	       "  -W, --exit-on-warn Exit on the first warning.\n"
 	       );
@@ -1261,6 +1282,10 @@ int main(int argc, char **argv)
 		case OptVerbose:
 			show_info = true;
 			break;
+		case OptVersion:
+			version();
+			print_sha();
+			std::exit(EXIT_SUCCESS);
 		case ':':
 			fprintf(stderr, "Option '%s' requires a value\n",
 				argv[optind]);
@@ -1395,13 +1420,7 @@ int main(int argc, char **argv)
 	if (options[OptInteractive])
 		test_tags |= TAG_INTERACTIVE;
 
-#ifdef SHA
-#define STR(x) #x
-#define STRING(x) STR(x)
-	printf("cec-compliance SHA                 : %s\n", STRING(SHA));
-#else
-	printf("cec-compliance SHA                 : not available\n");
-#endif
+	print_sha();
 
 	node.phys_addr = CEC_PHYS_ADDR_INVALID;
 	doioctl(&node, CEC_ADAP_G_PHYS_ADDR, &node.phys_addr);
-- 
2.27.0

