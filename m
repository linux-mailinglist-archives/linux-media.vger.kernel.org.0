Return-Path: <linux-media+bounces-15083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4088933D72
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 15:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60F871F23021
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 13:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD545180A71;
	Wed, 17 Jul 2024 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mkcW1svA"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC418004E;
	Wed, 17 Jul 2024 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721222080; cv=none; b=fb5ERiSTLFEzxN90AeNjyJPEikIUxQR7annY2LMnG70hRWL14gNYvV49XXpVsQU5EIUJTv6WIM5QCGAc0RkeKYKPwPpGT0i2pX4eTaLPMtEzEx854a2ecc7DnfCD54iceDtyWBkEp7/1WI5wW21JWJBnB+irapR7Fmu9VTo5nyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721222080; c=relaxed/simple;
	bh=Xgrjk1lmvTEHYSnAbu9gLnih+wsnblGc0/9MCvZ9kvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEc8YUN8R+npVCuJX05nqypzfEEKek4hOuluzpfcmj6ZX0gV1sFmuTzNC2dHdKRzGWJxpBie7GtykjkfJ4ml2MopC4nuzyrCyOng2WRFM03WKc6McDVjij6EIBHsoJQi1e7B1WhZYQ1MIDOWiy30aluc8AN3JYfyXQu28OevooU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mkcW1svA; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721222077;
	bh=Xgrjk1lmvTEHYSnAbu9gLnih+wsnblGc0/9MCvZ9kvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mkcW1svAJckWK8BdrBNLLy5/M/Z/0aOHwU4QIEHosuY1f1aK2Pjzf0Fp74V3z58DK
	 a6XJ2dsPUGnmSvd/H2HzbX7kasqh8WH3igGDJ/wd1F5k9M8DU7LSwTA3Balo1BW5t3
	 lGhpG8mykL7JeUuqTUvjQOav2WHZv71GnCor6bzg7ODw2ZxAP/El6dVfI5oV5GXSVC
	 7lJG2eMC788sJYCjYZm8J3i7D9NcjcJSN3u0XsfWqWem1k6g3Wi9iL16CaH03zgJ3f
	 /BB+OuU9kzaaHbxgQDkF/IGmQ/v9DIPHPD39snStOv/xprYxnNVBIHppnBCqa7wP/z
	 q/TscvntY+nGA==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BB7683781144;
	Wed, 17 Jul 2024 13:14:36 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 1/2] media: videodev2: Add flags to unconditionnaly enumerate pixels formats
Date: Wed, 17 Jul 2024 15:14:29 +0200
Message-ID: <20240717131430.159727-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new flags to enumerate all pixels formats when calling VIDIOC_ENUM_FMT ioctl.
When this V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag is set drivers must
ignore the configuration and return the hardware supported pixel
formats for the specified queue.
To distinguish this particular enumeration case V4L2_FMT_FLAG_ALL_FORMATS
flag must be set by the drivers to highlight support of this feature
to user space applications.
This will permit to discover which pixel formats are supported
without setting codec-specific information so userland can more easily
know if the driver suits its needs well.
The main target are stateless decoders so update the documentation
about how to use this flag.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 4:
- Explicitly document that the new flags are targeting mem2mem devices.

 .../userspace-api/media/v4l/dev-stateless-decoder.rst |  6 ++++++
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst       | 11 +++++++++++
 .../userspace-api/media/videodev2.h.rst.exceptions    |  2 ++
 drivers/media/v4l2-core/v4l2-ioctl.c                  |  3 +++
 include/uapi/linux/videodev2.h                        |  2 ++
 5 files changed, 24 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
index 35ed05f2695e..b0b657de910d 100644
--- a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
@@ -58,6 +58,12 @@ Querying capabilities
      default values for these controls being used, and a returned set of formats
      that may not be usable for the media the client is trying to decode.
 
+   * If the ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS`` flag is set the driver must enumerate
+     all the supported formats without taking care of codec-dependent controls
+     set on the ``OUTPUT`` queue. To indicate that the driver has take care of this
+     flag it must set ``V4L2_FMT_FLAG_ALL_FORMATS`` flag for each format while
+     enumerating.
+
 3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect supported
    resolutions for a given format, passing desired pixel format in
    :c:type:`v4l2_frmsizeenum`'s ``pixel_format``.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 3adb3d205531..15bc2f59c05a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -234,6 +234,17 @@ the ``mbus_code`` field is handled differently:
 	valid. The buffer consists of ``height`` lines, each having ``width``
 	Data Units of data and the offset (in bytes) between the beginning of
 	each two consecutive lines is ``bytesperline``.
+    * - ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS``
+      - 0x0400
+      - Set by userland applications to enumerate all possible pixel formats
+        without taking care of any OUTPUT or CAPTURE queue configuration.
+        This flag is relevant only for mem2mem devices.
+    * - ``V4L2_FMT_FLAG_ALL_FORMATS``
+      - 0x0800
+      - Set by the driver to indicated that format have been enumerated because
+        :ref:`V4L2_FMT_FLAG_ENUM_ALL_FORMATS <v4l2-pix-fmt-flag-set-csc>` has
+        been set by the userland application.
+        This flag is relevant only for mem2mem devices.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index bdc628e8c1d6..7a3a1e9dc055 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -216,6 +216,8 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
 replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
+replace define V4L2_FMT_FLAG_ENUM_ALL_FORMATS fmtdesc-flags
+replace define V4L2_FMT_FLAG_ALL_FORMATS fmtdesc-flags
 
 # V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 4c76d17b4629..5785a98b6ba2 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1569,6 +1569,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 	int ret = check_fmt(file, p->type);
 	u32 mbus_code;
 	u32 cap_mask;
+	u32 flags;
 
 	if (ret)
 		return ret;
@@ -1578,8 +1579,10 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 		p->mbus_code = 0;
 
 	mbus_code = p->mbus_code;
+	flags = p->flags & V4L2_FMT_FLAG_ENUM_ALL_FORMATS;
 	memset_after(p, 0, type);
 	p->mbus_code = mbus_code;
+	p->flags = flags;
 
 	switch (p->type) {
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index fe6b67e83751..b6a5da79ba21 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -886,6 +886,8 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
 #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
+#define V4L2_FMT_FLAG_ENUM_ALL_FORMATS		0x0400
+#define V4L2_FMT_FLAG_ALL_FORMATS		0x0800
 
 	/* Frame Size and frame rate enumeration */
 /*
-- 
2.43.0


