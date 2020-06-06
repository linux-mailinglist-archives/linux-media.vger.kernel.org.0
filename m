Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4EB1F0633
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2020 12:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbgFFK4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 06:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728793AbgFFKz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jun 2020 06:55:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99854C08C5C3
        for <linux-media@vger.kernel.org>; Sat,  6 Jun 2020 03:55:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id B4E58263992
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org,
        p.zabel@pengutronix.de
Subject: [PATCH v4l-utils 1/4] v4l2-ctl: vidcap: Add support for the CSC API
Date:   Sat,  6 Jun 2020 12:55:35 +0200
Message-Id: <20200606105538.30147-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200606105538.30147-1-dafna.hirschfeld@collabora.com>
References: <20200606105538.30147-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the CSC API, capture drivers can allow userspace to request
to set the quantization or the ycbcr_enc/hsv_enc fields of the
pixelformat. This patch adds supports for this feature.
when calling 'v4l2-ctl --set-fmt-video' on capture devices
userspace can ask to change the quantization or the ycbcr/hsv_enc
of the format if the driver supports it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 utils/v4l2-compliance/v4l2-test-formats.cpp |  3 ++-
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp          | 22 +++++++++++++++++++--
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index e1b00f3c..085f4986 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -264,7 +264,8 @@ static int testEnumFormatsType(struct node *node, unsigned type)
 			return fail("drivers must never set the emulated flag\n");
 		if (fmtdesc.flags & ~(V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_EMULATED |
 				      V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM |
-				      V4L2_FMT_FLAG_DYN_RESOLUTION))
+				      V4L2_FMT_FLAG_DYN_RESOLUTION | V4L2_FMT_FLAG_CSC_YCBCR_ENC |
+				      V4L2_FMT_FLAG_CSC_HSV_ENC | V4L2_FMT_FLAG_CSC_QUANTIZATION))
 			return fail("unknown flag %08x returned\n", fmtdesc.flags);
 		if (!(fmtdesc.flags & V4L2_FMT_FLAG_COMPRESSED))
 			fail_on_test(fmtdesc.flags & (V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM |
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 80312b51..5cb529c8 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -21,6 +21,7 @@ static struct v4l2_frmsizeenum frmsize; /* list frame sizes */
 static struct v4l2_frmivalenum frmival; /* list frame intervals */
 static unsigned set_fmts;
 static __u32 width, height, pixfmt, field, flags;
+static __u32 ycbcr, quantization;
 static __u32 bytesperline[VIDEO_MAX_PLANES];
 static __u32 sizeimage[VIDEO_MAX_PLANES];
 
@@ -101,7 +102,7 @@ static void print_video_fields(int fd)
 
 void vidcap_cmd(int ch, char *optarg)
 {
-	__u32 colorspace, xfer_func, ycbcr, quantization;
+	__u32 colorspace, xfer_func;
 	char *value, *subs;
 	bool be_pixfmt;
 
@@ -112,7 +113,7 @@ void vidcap_cmd(int ch, char *optarg)
 				xfer_func, ycbcr, quantization, flags, bytesperline,
 				sizeimage);
 		if (!set_fmts ||
-		    (set_fmts & (FmtColorspace | FmtYCbCr | FmtQuantization | FmtXferFunc))) {
+		    (set_fmts & (FmtColorspace | FmtXferFunc))) {
 			vidcap_usage();
 			std::exit(EXIT_FAILURE);
 		}
@@ -220,6 +221,15 @@ int vidcap_get_and_update_fmt(cv4l_fd &_fd, struct v4l2_format &vfmt)
 				vfmt.fmt.pix_mp.plane_fmt[i].sizeimage =
 					sizeimage[i];
 		}
+
+		if (set_fmts & FmtYCbCr) {
+			vfmt.fmt.pix_mp.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix_mp.ycbcr_enc = ycbcr;
+		}
+		if (set_fmts & FmtQuantization) {
+			vfmt.fmt.pix_mp.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix_mp.quantization = quantization;
+		}
 	} else {
 		if (set_fmts & FmtWidth)
 			vfmt.fmt.pix.width = width;
@@ -249,6 +259,14 @@ int vidcap_get_and_update_fmt(cv4l_fd &_fd, struct v4l2_format &vfmt)
 		}
 		if (set_fmts & FmtSizeImage)
 			vfmt.fmt.pix.sizeimage = sizeimage[0];
+		if (set_fmts & FmtYCbCr) {
+			vfmt.fmt.pix.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix.ycbcr_enc = ycbcr;
+		}
+		if (set_fmts & FmtQuantization) {
+			vfmt.fmt.pix.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix.quantization = quantization;
+		}
 	}
 
 	if ((set_fmts & FmtPixelFormat) &&
-- 
2.17.1

