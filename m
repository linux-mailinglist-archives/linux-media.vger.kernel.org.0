Return-Path: <linux-media+bounces-21886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D93179D6FDA
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B808DB26AA3
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE211DFE23;
	Sun, 24 Nov 2024 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCqnE0Gk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FB21AC882;
	Sun, 24 Nov 2024 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452813; cv=none; b=soAzq15J3uTV9zfydKSvaQZiiwegRnS7uJ48Du58CzBoGoYkLlU4OxaBRRtSgqj27C0wleLjRlpdcKkt3DLc3wUmVDoEzbyLE6PQdL34sdRPjp6S1FELdCykke9wgmgDjThUbXdZhbVXZPZnKN0SSPLzkKRPP+ZmGoruFxl0FG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452813; c=relaxed/simple;
	bh=CQj7Ah5AyiraJ7TPu2782qx7eULz3rfKD1EQg3BvFmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjU7bbojqrCBzdq7MEmT8YiXgdV6cr097t64Bs1RaTygKw+G3iLhtFVks8u9NTTY3XyPqlnJgcDpp7h5kyV+m2Nk3d4xgeGbeVI052tCNvdz3HG3PQNl9rAssLUDwcEi7pg5P7kUj/zHu098kcYkAn1W+GSCZ5qe8IklUmuIn54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCqnE0Gk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3402DC4CECC;
	Sun, 24 Nov 2024 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452813;
	bh=CQj7Ah5AyiraJ7TPu2782qx7eULz3rfKD1EQg3BvFmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bCqnE0Gk/76AB1IbH747C+ODkhdIh7TwX0LIPA6QPdb/lcWQBVJltlf9dsZ2SPs7c
	 KIV3vnk9Ofg1jGxl6WcQWQJEIIcwZRA/T11QDsBqWuGGIOM3QR2ukob9TG5d4JYyyJ
	 aoQ2NlG6N6C7GM46zG5PBzxdWC34jZ9IKbc5c9iHyOMxN6inmaw3k+B/KK8iM/SPhi
	 qER93+SY+iL7O6y/4cULjTN1NbqlBY8thkd+JJl6WufyTdViU0DIeHq4l3AoASlj8e
	 Fu6w7lK426snLE/UP1lDXah6U+W5VcLILGE96Sr1mkaeYYLjTxT0iSjgh9L5KP6uS7
	 dRkIW6ddmWyFw==
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
Subject: [PATCH AUTOSEL 6.6 03/16] media: v4l: Add luma 16-bit interlaced pixel format
Date: Sun, 24 Nov 2024 07:52:21 -0500
Message-ID: <20241124125311.3340223-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125311.3340223-1-sashal@kernel.org>
References: <20241124125311.3340223-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
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
index f4d9d62790940..436935fe14bdd 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1314,6 +1314,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
 	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
+	case V4L2_PIX_FMT_Y16I:		descr = "Interleaved 16-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
 	case V4L2_PIX_FMT_INZI:		descr = "Planar 10:16 Greyscale Depth"; break;
 	case V4L2_PIX_FMT_CNF4:		descr = "4-bit Depth Confidence (Packed)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 78260e5d9985f..184824ce75330 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -793,6 +793,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_S5C_UYVY_JPG v4l2_fourcc('S', '5', 'C', 'I') /* S5C73M3 interleaved UYVY/JPEG */
 #define V4L2_PIX_FMT_Y8I      v4l2_fourcc('Y', '8', 'I', ' ') /* Greyscale 8-bit L/R interleaved */
 #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
+#define V4L2_PIX_FMT_Y16I     v4l2_fourcc('Y', '1', '6', 'I') /* Greyscale 16-bit L/R interleaved */
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
 #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
-- 
2.43.0


