Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFEE213F10
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 20:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgGCSCy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 14:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgGCSCw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 14:02:52 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B898C061794
        for <linux-media@vger.kernel.org>; Fri,  3 Jul 2020 11:02:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id A4D262A6505
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v4l-utils v5 2/4] v4l2: common: add the flags V4L2_FMT_FLAG_CSC* to the list that maps flags to str
Date:   Fri,  3 Jul 2020 20:02:37 +0200
Message-Id: <20200703180239.25841-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703180239.25841-1-dafna.hirschfeld@collabora.com>
References: <20200703180239.25841-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the array fmtdesc_def with a macro 'FMTDESC_DEF'
The macro is used to to create two arrays 'fmtdesc_def_ycbcr',
'fmtdesc_def_hsv' that map the format flags to strings.
The function 'fmtdesc2s' is changed to get a parameter 'is_hsv'
that decides which array to use.
The new CSC flags V4L2_FMT_FLAG_CSC* are added to the arries.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 utils/common/v4l2-info.cpp  | 28 +++++++++++++++++++---------
 utils/common/v4l2-info.h    |  2 +-
 utils/v4l2-ctl/v4l2-ctl.cpp | 16 ++++++++++++----
 3 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 16be409a..a8fa6236 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -366,18 +366,28 @@ std::string service2s(unsigned service)
 	return flags2s(service, service_def);
 }
 
-static const flag_def fmtdesc_def[] = {
-	{ V4L2_FMT_FLAG_COMPRESSED, "compressed" },
-	{ V4L2_FMT_FLAG_EMULATED, "emulated" },
-	{ V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM, "continuous-bytestream" },
-	{ V4L2_FMT_FLAG_DYN_RESOLUTION, "dyn-resolution" },
-	{ V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL, "enc-cap-frame-interval" },
-	{ 0, NULL }
+#define FMTDESC_DEF(enc_type)							\
+static const flag_def fmtdesc_ ## enc_type ## _def[] = { 			\
+	{ V4L2_FMT_FLAG_COMPRESSED, "compressed" }, 				\
+	{ V4L2_FMT_FLAG_EMULATED, "emulated" }, 				\
+	{ V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM, "continuous-bytestream" }, 	\
+	{ V4L2_FMT_FLAG_DYN_RESOLUTION, "dyn-resolution" }, 			\
+	{ V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL, "enc-cap-frame-interval" },	\
+	{ V4L2_FMT_FLAG_CSC_COLORSPACE, "csc-colorspace" }, 			\
+	{ V4L2_FMT_FLAG_CSC_YCBCR_ENC, "csc-"#enc_type }, 			\
+	{ V4L2_FMT_FLAG_CSC_QUANTIZATION, "csc-quantization" }, 		\
+	{ V4L2_FMT_FLAG_CSC_XFER_FUNC, "csc-xfer-func" }, 			\
+	{ 0, NULL } 								\
 };
 
-std::string fmtdesc2s(unsigned flags)
+FMTDESC_DEF(ycbcr)
+FMTDESC_DEF(hsv)
+
+std::string fmtdesc2s(unsigned flags, bool is_hsv)
 {
-	return flags2s(flags, fmtdesc_def);
+	if (is_hsv)
+		return flags2s(flags, fmtdesc_hsv_def);
+	return flags2s(flags, fmtdesc_ycbcr_def);
 }
 
 static const flag_def selection_targets_def[] = {
diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
index ce2600f0..5b34409c 100644
--- a/utils/common/v4l2-info.h
+++ b/utils/common/v4l2-info.h
@@ -51,7 +51,7 @@ std::string pixflags2s(unsigned flags);
 std::string service2s(unsigned service);
 
 /* Return v4l2_fmtdesc flags description */
-std::string fmtdesc2s(unsigned flags);
+std::string fmtdesc2s(unsigned flags, bool is_hsv);
 
 /* Return selection flags description */
 std::string selflags2s(__u32 flags);
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 4972591e..edac19f1 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -615,8 +615,12 @@ void print_video_formats(cv4l_fd &fd, __u32 type)
 	do {
 		printf("\t[%d]: '%s' (%s", fmt.index, fcc2s(fmt.pixelformat).c_str(),
 		       fmt.description);
-		if (fmt.flags)
-			printf(", %s", fmtdesc2s(fmt.flags).c_str());
+		if (fmt.flags) {
+			bool is_hsv = fmt.pixelformat == V4L2_PIX_FMT_HSV24 ||
+				      fmt.pixelformat == V4L2_PIX_FMT_HSV32;
+
+			printf(", %s", fmtdesc2s(fmt.flags, is_hsv).c_str());
+		}
 		printf(")\n");
 	} while (!fd.enum_fmt(fmt));
 }
@@ -634,8 +638,12 @@ void print_video_formats_ext(cv4l_fd &fd, __u32 type)
 	do {
 		printf("\t[%d]: '%s' (%s", fmt.index, fcc2s(fmt.pixelformat).c_str(),
 		       fmt.description);
-		if (fmt.flags)
-			printf(", %s", fmtdesc2s(fmt.flags).c_str());
+		if (fmt.flags) {
+			bool is_hsv = fmt.pixelformat == V4L2_PIX_FMT_HSV24 ||
+				      fmt.pixelformat == V4L2_PIX_FMT_HSV32;
+
+			printf(", %s", fmtdesc2s(fmt.flags, is_hsv).c_str());
+		}
 		printf(")\n");
 		if (fd.enum_framesizes(frmsize, fmt.pixelformat))
 			continue;
-- 
2.17.1

