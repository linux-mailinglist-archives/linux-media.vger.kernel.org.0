Return-Path: <linux-media+bounces-4506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB504843D35
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 11:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F03411C20E2D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 10:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1476BB26;
	Wed, 31 Jan 2024 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Nqmd3Htu"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E432269D30
	for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 10:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706698218; cv=none; b=c5cEVrrLtCikXnUi+jPWdshxaEmSOZ7gl5LnQ7Uco3QxjyhAUqZpEbedF6/1mzm8JKi+5CuFALMMfRqzsl0D87xH8SqJuxy50oGoOHbJWSLB+1Tu1uNHO0svyhF7zS0rBEC8nit6LL1jvWOEbh9sYa53IESeS6Q2S66KY0yFpOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706698218; c=relaxed/simple;
	bh=8fy9UTRa5pbqan4CetoucO06hS65NKL8apA+SUoOwEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RDR4W9R8MJwH7sbMM78AicOu3rHIEpsl+q46nntP2kCvwABwcv/eVQrNiAJIiXXKcUOIyytmZYx81jwgjmL7JvgbaW96s3JciuEvqvz9LsAToqbt7vmh+xHQOzvTIPTXNiyKX0UOwJewdx/0gx8CaOYBYqogytGhmd36ssHblaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Nqmd3Htu; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706698215;
	bh=8fy9UTRa5pbqan4CetoucO06hS65NKL8apA+SUoOwEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nqmd3HtuN0KJLgn701wyoiUX5nbP9mZAt8rVwxEFiIX5RDKJLih/B8tAS2h7yuPkO
	 BCFGtGkrpraTXCEqce+mRo68hQB6P2v9ANd/lN4ACm6tbbFbrw45NqnU3f5HFJaHeb
	 MJBEKGQj13LBPyVgkiLNuv59Fd3uu0Le5q85bJy556WVwNGbvwNR/26WaQazutEw38
	 3P8ohvx/4LcOCCw1Et6Gdzn2ky+pAlXiL4rdkGz3LHwrcnv+gdjH3p0d7JxUCuz8FR
	 PilrgFWNhcAIQXfgZKxByyDPU6oMxTxdspwZXcmRATziU74LJYwWdYcJQ2S6FQRqbX
	 iTaeMXoZcsj4w==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DC7AE378202B;
	Wed, 31 Jan 2024 10:50:14 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 1/2] media: videodev2: Add V4L2_FMT_FLAG_ALL_FORMATS flag
Date: Wed, 31 Jan 2024 11:50:07 +0100
Message-Id: <20240131105008.109457-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240131105008.109457-1-benjamin.gaignard@collabora.com>
References: <20240131105008.109457-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new flag to allow enumerate all pixels formats when
calling VIDIOC_ENUM_FMT ioctl.
When this flag is set drivers must ignore the configuration
and return the hardware supported pixel formats for the specified queue.
This will permit to discover which pixels formats are supported
without setting codec-specific information so userland can more easily
knows if the driver suit well to what it needs.
The main target are stateless decoders so update the documentation
about how use this flag.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 2:
- Clarify documentation.
- Only keep V4L2_FMT_FLAG_ALL_FORMATS flag in ioctl.

 .../userspace-api/media/v4l/dev-stateless-decoder.rst        | 4 ++++
 Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst    | 5 +++++
 Documentation/userspace-api/media/videodev2.h.rst.exceptions | 1 +
 drivers/media/v4l2-core/v4l2-ioctl.c                         | 3 +++
 include/uapi/linux/videodev2.h                               | 1 +
 5 files changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
index 35ed05f2695e..c5948b5744dc 100644
--- a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
@@ -58,6 +58,10 @@ Querying capabilities
      default values for these controls being used, and a returned set of formats
      that may not be usable for the media the client is trying to decode.
 
+   * If ``V4L2_FMT_FLAG_ALL_FORMATS`` flag is set the driver must enumerate
+     all the supported formats without taking care of codec-dependent controls
+     set on ``OUTPUT`` queue.
+
 3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect supported
    resolutions for a given format, passing desired pixel format in
    :c:type:`v4l2_frmsizeenum`'s ``pixel_format``.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 000c154b0f98..50e07ed4d79a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -227,6 +227,11 @@ the ``mbus_code`` field is handled differently:
 	The application can ask to configure the quantization of the capture
 	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
 	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
+    * - ``V4L2_FMT_FLAG_ALL_FORMATS``
+      - 0x0200
+      - Set by userland application to enumerate all possible pixels formats
+        without taking care of any configuration done on OUTPUT or CAPTURE
+        queues.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 3e58aac4ef0b..42d9075b7fc2 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -215,6 +215,7 @@ replace define V4L2_FMT_FLAG_CSC_XFER_FUNC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
+replace define V4L2_FMT_FLAG_ALL_FORMATS fmtdesc-flags
 
 # V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 33076af4dfdb..ce69e026f8d9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1535,6 +1535,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 	int ret = check_fmt(file, p->type);
 	u32 mbus_code;
 	u32 cap_mask;
+	u32 flags;
 
 	if (ret)
 		return ret;
@@ -1544,8 +1545,10 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 		p->mbus_code = 0;
 
 	mbus_code = p->mbus_code;
+	flags = p->flags & V4L2_FMT_FLAG_ALL_FORMATS;
 	memset_after(p, 0, type);
 	p->mbus_code = mbus_code;
+	p->flags = flags;
 
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 68e7ac178cc2..82d8c8a7fb7f 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -869,6 +869,7 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
 #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
+#define V4L2_FMT_FLAG_ALL_FORMATS		0x0200
 
 	/* Frame Size and frame rate enumeration */
 /*
-- 
2.40.1


