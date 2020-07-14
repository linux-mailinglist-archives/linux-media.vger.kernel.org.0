Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4625121E7BD
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 07:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgGNF7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 01:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgGNF7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 01:59:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 811A0C061755
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 22:59:46 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32A5610F6;
        Tue, 14 Jul 2020 07:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594706385;
        bh=RsVzL03OgvwHmPd/jTtzggaVpAKmI5kdjbxzqEjUDl8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SJ0Y7HBZtb2L5//mJ2yYAh9v3izHI+rlh1+3cDybOdQVp23AsnoqgdKAMRoBFXXuE
         LUQGfTvbNWr7/nqESewLde2TeMWMdg4ir/oCFag8HbAcUtkfqgqBy4g7g5vJiyQ9el
         MTKLkarXqLJJyM6OwkFHb4SPcUCKeRJe4HAM4mRY=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v4 4/7] cec-compliance: Add version command
Date:   Tue, 14 Jul 2020 14:59:12 +0900
Message-Id: <20200714055915.640438-4-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714055915.640438-1-paul.elder@ideasonboard.com>
References: <20200714055915.640438-1-paul.elder@ideasonboard.com>
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
Changes in v4:
- add git commit count to version

Changes in v3:
- embed PACKAGE_VERSION instead of string concatenation
---
 utils/cec-compliance/Makefile.am        |  2 +-
 utils/cec-compliance/cec-compliance.cpp | 24 +++++++++++++++++++++---
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/utils/cec-compliance/Makefile.am b/utils/cec-compliance/Makefile.am
index 57ed7b37..a9c59ca6 100644
--- a/utils/cec-compliance/Makefile.am
+++ b/utils/cec-compliance/Makefile.am
@@ -2,7 +2,7 @@ bin_PROGRAMS = cec-compliance
 man_MANS = cec-compliance.1
 
 cec_compliance_SOURCES = cec-compliance.cpp cec-compliance.h cec-test.cpp cec-test-adapter.cpp cec-test-audio.cpp cec-test-power.cpp cec-test-fuzzing.cpp
-cec_compliance_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil $(GIT_SHA)
+cec_compliance_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil $(GIT_SHA) $(GIT_COMMIT_CNT)
 cec_compliance_LDADD = -lrt ../libcecutil/libcecutil.la
 
 EXTRA_DIST = cec-compliance.1
diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index bfd82af7..9be86510 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -93,6 +93,8 @@ enum Option {
 	OptSkipTestTunerControl,
 	OptSkipTestVendorSpecificCommands,
 	OptSkipTestStandbyResume,
+
+	OptVersion,
 	OptLast = 256
 };
 
@@ -174,9 +176,22 @@ static struct option long_options[] = {
 	{"skip-test-tuner-control", no_argument, 0, OptSkipTestTunerControl},
 	{"skip-test-vendor-specific-commands", no_argument, 0, OptSkipTestVendorSpecificCommands},
 	{"skip-test-standby-resume", no_argument, 0, OptSkipTestStandbyResume},
+	{"version", no_argument, 0, OptVersion},
 	{0, 0, 0, 0}
 };
 
+static void print_sha()
+{
+#define STR(x) #x
+#define STRING(x) STR(x)
+	printf("cec-compliance SHA                 : %s\n", STRING(GIT_SHA));
+}
+
+static void print_version()
+{
+	printf("cec-compliance %s%s\n", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
+}
+
 static void usage()
 {
 	printf("Usage:\n"
@@ -231,6 +246,7 @@ static void usage()
 	       "  -s, --skip-info    Skip Driver Info output\n"
 	       "  -T, --trace        Trace all called ioctls\n"
 	       "  -v, --verbose      Turn on verbose reporting\n"
+	       "  --version          Show version information\n"
 	       "  -w, --wall-clock   Show timestamps as wall-clock time (implies -v)\n"
 	       "  -W, --exit-on-warn Exit on the first warning.\n"
 	       );
@@ -1258,6 +1274,10 @@ int main(int argc, char **argv)
 		case OptVerbose:
 			show_info = true;
 			break;
+		case OptVersion:
+			print_version();
+			print_sha();
+			std::exit(EXIT_SUCCESS);
 		case ':':
 			fprintf(stderr, "Option '%s' requires a value\n",
 				argv[optind]);
@@ -1392,9 +1412,7 @@ int main(int argc, char **argv)
 	if (options[OptInteractive])
 		test_tags |= TAG_INTERACTIVE;
 
-#define STR(x) #x
-#define STRING(x) STR(x)
-	printf("cec-compliance SHA                 : %s\n", STRING(GIT_SHA));
+	print_sha();
 
 	node.phys_addr = CEC_PHYS_ADDR_INVALID;
 	doioctl(&node, CEC_ADAP_G_PHYS_ADDR, &node.phys_addr);
-- 
2.27.0

