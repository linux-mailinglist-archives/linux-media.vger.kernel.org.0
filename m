Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F08213F11
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 20:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgGCSCy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 14:02:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46650 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCSCy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 14:02:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id F09342A6502
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v4l-utils v5 4/4] v4l2-ctl: subdev: Add the flags to the list of supported mbus formats
Date:   Fri,  3 Jul 2020 20:02:39 +0200
Message-Id: <20200703180239.25841-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703180239.25841-1-dafna.hirschfeld@collabora.com>
References: <20200703180239.25841-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new function mbus2s to that prints a descriptive
string of the supported flags of the the v4l2_subdev_mbus_code_enum
Use this function in the print_mbus_code function.
Also add a macro MBUS_DEF(enc_type) to create the two
arries 'mbus_hsv_def' and mbus_ycbcr_def' that maps flags to
string according to the enc_type (ycbcr/hsv)

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 utils/common/v4l2-info.cpp         | 19 +++++++++++++++++++
 utils/common/v4l2-info.h           |  4 ++++
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 10 ++++++++--
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index a8fa6236..67690f61 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -390,6 +390,25 @@ std::string fmtdesc2s(unsigned flags, bool is_hsv)
 	return flags2s(flags, fmtdesc_ycbcr_def);
 }
 
+#define MBUS_DEF(enc_type)						\
+static const flag_def mbus_ ## enc_type ## _def[] = { 			\
+	{ V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE, "csc-colorspace" }, 	\
+	{ V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC, "csc-"#enc_type },	\
+	{ V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION, "csc-quantization" }, \
+	{ V4L2_SUBDEV_MBUS_CODE_CSC_XFER_FUNC, "csc-xfer-func" }, 	\
+	{ 0, NULL }							\
+};
+
+MBUS_DEF(ycbcr)
+MBUS_DEF(hsv)
+
+std::string mbus2s(unsigned flags, bool is_hsv)
+{
+	if (is_hsv)
+		return flags2s(flags, mbus_hsv_def);
+	return flags2s(flags, mbus_ycbcr_def);
+}
+
 static const flag_def selection_targets_def[] = {
 	{ V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
 	{ V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
index 5b34409c..97c1e64a 100644
--- a/utils/common/v4l2-info.h
+++ b/utils/common/v4l2-info.h
@@ -8,6 +8,7 @@
 
 #include <string>
 #include <linux/videodev2.h>
+#include <linux/v4l2-subdev.h>
 
 /* Print capability information */
 void v4l2_info_capability(const v4l2_capability &cap);
@@ -50,6 +51,9 @@ std::string pixflags2s(unsigned flags);
 /* Return sliced vbi services description */
 std::string service2s(unsigned service);
 
+/* Return v4l2_subdev_mbus_code_enum flags description */
+std::string mbus2s(unsigned flags, bool is_hsv);
+
 /* Return v4l2_fmtdesc flags description */
 std::string fmtdesc2s(unsigned flags, bool is_hsv);
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index c6ec21a9..6f712af2 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -577,10 +577,10 @@ static void print_mbus_code(__u32 code)
 		if (mbus_names[i].code == code)
 			break;
 	if (mbus_names[i].name)
-		printf("\t0x%04x: MEDIA_BUS_FMT_%s\n",
+		printf("\t0x%04x: MEDIA_BUS_FMT_%s",
 		       mbus_names[i].code, mbus_names[i].name);
 	else
-		printf("\t0x%04x\n", code);
+		printf("\t0x%04x", code);
 }
 
 static void print_mbus_codes(int fd, __u32 pad)
@@ -597,6 +597,12 @@ static void print_mbus_codes(int fd, __u32 pad)
 		if (ret)
 			break;
 		print_mbus_code(mbus_code.code);
+		if (mbus_code.flags) {
+			bool is_hsv = mbus_code.code == MEDIA_BUS_FMT_AHSV8888_1X32;
+
+			printf(", %s", mbus2s(mbus_code.flags, is_hsv).c_str());
+		}
+		printf("\n");
 		mbus_code.index++;
 	}
 }
-- 
2.17.1

