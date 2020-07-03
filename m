Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8252C213F0E
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 20:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgGCSCw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 14:02:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46602 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCSCw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 14:02:52 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 04FC82A64FE
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v4l-utils v5 1/4] v4l2-ctl: vidcap: Add support for the CSC API
Date:   Fri,  3 Jul 2020 20:02:36 +0200
Message-Id: <20200703180239.25841-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703180239.25841-1-dafna.hirschfeld@collabora.com>
References: <20200703180239.25841-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the CSC API, capture drivers can allow userspace to request
to set the colorspace fields of the pixelformat. This patch adds
supports for this feature. when calling 'v4l2-ctl --set-fmt-video'
on capture devices userspace can ask to change the fields
'colorspace', 'ycbcr/hsv_enc', 'quantization' and 'xfer_func'
of the format if the driver supports it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 utils/v4l2-compliance/v4l2-test-formats.cpp |  4 ++-
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp          | 39 +++++++++++++++++++--
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index e1b00f3c..70e5f506 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -264,7 +264,9 @@ static int testEnumFormatsType(struct node *node, unsigned type)
 			return fail("drivers must never set the emulated flag\n");
 		if (fmtdesc.flags & ~(V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_EMULATED |
 				      V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM |
-				      V4L2_FMT_FLAG_DYN_RESOLUTION))
+				      V4L2_FMT_FLAG_DYN_RESOLUTION | V4L2_FMT_FLAG_CSC_COLORSPACE |
+				      V4L2_FMT_FLAG_CSC_YCBCR_ENC | V4L2_FMT_FLAG_CSC_HSV_ENC |
+				      V4L2_FMT_FLAG_CSC_QUANTIZATION | V4L2_FMT_FLAG_CSC_XFER_FUNC))
 			return fail("unknown flag %08x returned\n", fmtdesc.flags);
 		if (!(fmtdesc.flags & V4L2_FMT_FLAG_COMPRESSED))
 			fail_on_test(fmtdesc.flags & (V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM |
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 80312b51..26c8a578 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -21,6 +21,7 @@ static struct v4l2_frmsizeenum frmsize; /* list frame sizes */
 static struct v4l2_frmivalenum frmival; /* list frame intervals */
 static unsigned set_fmts;
 static __u32 width, height, pixfmt, field, flags;
+static __u32 ycbcr, quantization, xfer_func, colorspace;
 static __u32 bytesperline[VIDEO_MAX_PLANES];
 static __u32 sizeimage[VIDEO_MAX_PLANES];
 
@@ -101,7 +102,6 @@ static void print_video_fields(int fd)
 
 void vidcap_cmd(int ch, char *optarg)
 {
-	__u32 colorspace, xfer_func, ycbcr, quantization;
 	char *value, *subs;
 	bool be_pixfmt;
 
@@ -111,8 +111,7 @@ void vidcap_cmd(int ch, char *optarg)
 		set_fmts = parse_fmt(optarg, width, height, pixfmt, field, colorspace,
 				xfer_func, ycbcr, quantization, flags, bytesperline,
 				sizeimage);
-		if (!set_fmts ||
-		    (set_fmts & (FmtColorspace | FmtYCbCr | FmtQuantization | FmtXferFunc))) {
+		if (!set_fmts) {
 			vidcap_usage();
 			std::exit(EXIT_FAILURE);
 		}
@@ -220,6 +219,23 @@ int vidcap_get_and_update_fmt(cv4l_fd &_fd, struct v4l2_format &vfmt)
 				vfmt.fmt.pix_mp.plane_fmt[i].sizeimage =
 					sizeimage[i];
 		}
+
+		if (set_fmts & FmtColorspace) {
+			vfmt.fmt.pix_mp.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix_mp.colorspace = colorspace;
+		}
+		if (set_fmts & FmtYCbCr) {
+			vfmt.fmt.pix_mp.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix_mp.ycbcr_enc = ycbcr;
+		}
+		if (set_fmts & FmtQuantization) {
+			vfmt.fmt.pix_mp.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix_mp.quantization = quantization;
+		}
+		if (set_fmts & FmtXferFunc) {
+			vfmt.fmt.pix_mp.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix_mp.xfer_func = xfer_func;
+		}
 	} else {
 		if (set_fmts & FmtWidth)
 			vfmt.fmt.pix.width = width;
@@ -249,6 +265,23 @@ int vidcap_get_and_update_fmt(cv4l_fd &_fd, struct v4l2_format &vfmt)
 		}
 		if (set_fmts & FmtSizeImage)
 			vfmt.fmt.pix.sizeimage = sizeimage[0];
+		if (set_fmts & FmtColorspace) {
+			vfmt.fmt.pix.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix.colorspace = colorspace;
+		}
+		if (set_fmts & FmtYCbCr) {
+			vfmt.fmt.pix.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix.ycbcr_enc = ycbcr;
+		}
+		if (set_fmts & FmtQuantization) {
+			vfmt.fmt.pix.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix.quantization = quantization;
+		}
+		if (set_fmts & FmtXferFunc) {
+			vfmt.fmt.pix.flags |= V4L2_PIX_FMT_FLAG_SET_CSC;
+			vfmt.fmt.pix.xfer_func = xfer_func;
+		}
+
 	}
 
 	if ((set_fmts & FmtPixelFormat) &&
-- 
2.17.1

