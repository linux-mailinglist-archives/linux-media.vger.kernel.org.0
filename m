Return-Path: <linux-media+bounces-21892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFB89D6FD3
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAC32162590
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1239418C33C;
	Sun, 24 Nov 2024 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+yqRyZr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEB41370;
	Sun, 24 Nov 2024 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452918; cv=none; b=DlJmMIBrFjMY+9NX14LJl4SBpf5ib7rb+fH9n46/VHkihddA2Dc6DdSIaWgda87yi3nyW6FS0Bd54/oenXuYoa7KeZ1aZmY1gF+wdbSmnCpeA1NcmJnLgUY9c44OZPTnabr+pOJ8yrINSsHHp6OnUIfwanYHWpXCCniPd8WlF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452918; c=relaxed/simple;
	bh=05xlpYf9NnAq/toADcgyfMLxclZVwF+c65xgPgbGHW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9YBLNDwe1mRTnIxECw3NFCHc70ybhgqM+yeSiSu5c7n2oaXRMRgv+llAi9bXxn+XwSEg1/cO44GfFEC1+fPG7NpsLtcQPkO3+KqzBoSd6vIZq0e50s+M6Q54X0CC3nLHickYOlKvmTlvOrR094Q61RNpGROJ1eIlb2j+JRzpe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+yqRyZr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB63CC4CECC;
	Sun, 24 Nov 2024 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452918;
	bh=05xlpYf9NnAq/toADcgyfMLxclZVwF+c65xgPgbGHW4=;
	h=From:To:Cc:Subject:Date:From;
	b=u+yqRyZrGr3nyosKOgKUmA7i89jfJlxTAfjc23YWDUd4/wuhQbjMLhhi+8bbZAUDf
	 1KcvTUHmIxEJG/KuW6L64/tv8hrq0fTrMYPHS81TlRqJuDFItyAdV3kElQ2yIyG5kb
	 PSFhSFHpy11XuftsS5Erp0N5zOkrU5vTyQwEXP4qSWcvG3Bm+AU6BEA6p6dwvYKA+/
	 2HYIjgEfw06zL8Z83n7W/YJe4AltNShGb3xZRGdCUEcKTZx/p3R/rzeQtowYTaDhPw
	 XLQQlVaG70RvaU3J8nu2DScPzYWJpWuFdcGYHMeW5jW2FIrVerhbglqgSVPvBACs1b
	 /Ep7obMKHG+Qw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	naush@raspberrypi.com,
	jeanmichel.hautbois@ideasonboard.com,
	benjamin.gaignard@collabora.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 1/9] media: v4l: Add luma 16-bit interlaced pixel format
Date: Sun, 24 Nov 2024 07:54:15 -0500
Message-ID: <20241124125515.3340625-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
Content-Transfer-Encoding: 8bit

From: Dmitry Perchanov <dmitry.perchanov@intel.com>

[ Upstream commit a8f2cdd27d114ed6c3354a0e39502e6d56215804 ]

The formats added by this patch are:

        V4L2_PIX_FMT_Y16I

Interlaced lumina format primary use in RealSense Depth cameras with
stereo stream for left and right image sensors.

Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/568efbd75290e286b8ad9e7347b5f43745121020.camel@intel.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../userspace-api/media/v4l/pixfmt-y16i.rst   | 73 +++++++++++++++++++
 .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/uapi/linux/videodev2.h                |  1 +
 4 files changed, 76 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16i.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
new file mode 100644
index 0000000000000..74ba9e910a38f
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _V4L2-PIX-FMT-Y16I:
+
+**************************
+V4L2_PIX_FMT_Y16I ('Y16I')
+**************************
+
+Interleaved grey-scale image, e.g. from a stereo-pair
+
+
+Description
+===========
+
+This is a grey-scale image with a depth of 16 bits per pixel, but with pixels
+from 2 sources interleaved and unpacked. Each pixel is stored in a 16-bit word
+in the little-endian order. The first pixel is from the left source.
+
+**Pixel unpacked representation.**
+Left/Right pixels 16-bit unpacked - 16-bit for each interleaved pixel.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - Y'\ :sub:`0L[7:0]`
+      - Y'\ :sub:`0L[15:8]`
+      - Y'\ :sub:`0R[7:0]`
+      - Y'\ :sub:`0R[15:8]`
+
+**Byte Order.**
+Each cell is one byte.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - Y'\ :sub:`00Llow`
+      - Y'\ :sub:`00Lhigh`
+      - Y'\ :sub:`00Rlow`
+      - Y'\ :sub:`00Rhigh`
+      - Y'\ :sub:`01Llow`
+      - Y'\ :sub:`01Lhigh`
+      - Y'\ :sub:`01Rlow`
+      - Y'\ :sub:`01Rhigh`
+    * - start + 8:
+      - Y'\ :sub:`10Llow`
+      - Y'\ :sub:`10Lhigh`
+      - Y'\ :sub:`10Rlow`
+      - Y'\ :sub:`10Rhigh`
+      - Y'\ :sub:`11Llow`
+      - Y'\ :sub:`11Lhigh`
+      - Y'\ :sub:`11Rlow`
+      - Y'\ :sub:`11Rhigh`
+    * - start + 16:
+      - Y'\ :sub:`20Llow`
+      - Y'\ :sub:`20Lhigh`
+      - Y'\ :sub:`20Rlow`
+      - Y'\ :sub:`20Rhigh`
+      - Y'\ :sub:`21Llow`
+      - Y'\ :sub:`21Lhigh`
+      - Y'\ :sub:`21Rlow`
+      - Y'\ :sub:`21Rhigh`
+    * - start + 24:
+      - Y'\ :sub:`30Llow`
+      - Y'\ :sub:`30Lhigh`
+      - Y'\ :sub:`30Rlow`
+      - Y'\ :sub:`30Rhigh`
+      - Y'\ :sub:`31Llow`
+      - Y'\ :sub:`31Lhigh`
+      - Y'\ :sub:`31Rlow`
+      - Y'\ :sub:`31Rhigh`
diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
index 24b34cdfa6fea..78ee406d76479 100644
--- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
+++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
@@ -269,5 +269,6 @@ image.
     pixfmt-yuv-luma
     pixfmt-y8i
     pixfmt-y12i
+    pixfmt-y16i
     pixfmt-uv8
     pixfmt-m420
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 6876ec25bc512..05c9820598478 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1317,6 +1317,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
 	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y16I:		descr = "Interleaved 16-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
 	case V4L2_PIX_FMT_INZI:		descr = "Planar 10:16 Greyscale Depth"; break;
 	case V4L2_PIX_FMT_CNF4:		descr = "4-bit Depth Confidence (Packed)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 45fa03882ef18..08046beeeb049 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -767,6 +767,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_S5C_UYVY_JPG v4l2_fourcc('S', '5', 'C', 'I') /* S5C73M3 interleaved UYVY/JPEG */
 #define V4L2_PIX_FMT_Y8I      v4l2_fourcc('Y', '8', 'I', ' ') /* Greyscale 8-bit L/R interleaved */
 #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
+#define V4L2_PIX_FMT_Y16I     v4l2_fourcc('Y', '1', '6', 'I') /* Greyscale 16-bit L/R interleaved */
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
 #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
-- 
2.43.0


