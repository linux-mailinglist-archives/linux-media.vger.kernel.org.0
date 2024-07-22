Return-Path: <linux-media+bounces-15260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0211E939154
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC30C1F221A0
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B82216DECD;
	Mon, 22 Jul 2024 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ud/TN7AV"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2954E16DC32;
	Mon, 22 Jul 2024 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660733; cv=none; b=cm48Onbd59tDp9wbCiGJQVo4sOodqv9xGQLSPuK6mqfS/N1aALBiwGdXJljFDphi1hpJCn1ZdpFj9UW6lYxIDnJzFfZjPWBAlTlg4Bf1xTvRW0Kvq5X+lXW66R241ia1re4zFFBNHHj4ECw4k9ZHR9s4cU4uq6n4Xmw9K19V4VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660733; c=relaxed/simple;
	bh=k9hBZGP+6hvd2eafv7kOgNAmp1jDm0056Wz82dkm78Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaNnaGiKi6EQIuzGveHDiZSikFjZlwX5JhY15HIc5gdh6A6mfX1PogJaYDk7gVcWFY4unVu6NS2JiqJRybcQeWoN/DPurBqYgcnKCLkxqGvsVOaYjK0spuVkD5/XPW4S4Zag+uZtxgmPKgPzP5OUo2wWJN+wAJWTJ4kHoENZm9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ud/TN7AV; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721660729;
	bh=k9hBZGP+6hvd2eafv7kOgNAmp1jDm0056Wz82dkm78Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ud/TN7AVdbK44CHnQAD1LdW1uOGh7orDvOQBmZlcndyj/eKxWvBR1mw+O4pL8f2Kq
	 QKKgGEMaD8vfqWfrNlDRamJBGqYTXxQx6bDGNhbNsmxMNh5XKL0lzSECuPoye1WSoU
	 xrtiFzJLtntpnGsmJg3Z2Ua+POC3onsJjRfL7Yg7afDr8ze4W6VWDPBSQFfAD6NaNO
	 G1XNz4+XXNt08sATHncuVQdiuHHUICj78euJKvoSUC+J3hsKRdvtfzrB5RvHfGQ6jR
	 9ChJiv3C4LVBR/nQfHorxTjF+F/TKq1hBR/tiyBm/Gf3dciHkTxOQ5jUmEL2coqsuj
	 Rs4MOVqUuCciw==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6E7BC3780523;
	Mon, 22 Jul 2024 15:05:29 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 1/3] media: videodev2: Add flag to unconditionnaly enumerate pixels formats
Date: Mon, 22 Jul 2024 17:05:21 +0200
Message-ID: <20240722150523.149667-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
References: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the index field is ORed with V4L2_FMT_FLAG_ENUM_ALL the driver
will ignore any configuration and enumerate all the possible formats.
Drivers which do not support this flag yet always return an EINVAL
error code.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 5:
- Reset the proposal to follow Hans's advices
- Add new flag to be used with index field.

 .../userspace-api/media/v4l/vidioc-enum-fmt.rst      | 12 +++++++++++-
 .../userspace-api/media/videodev2.h.rst.exceptions   |  1 +
 include/uapi/linux/videodev2.h                       |  3 +++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 3adb3d205531..12e1e65e6a71 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -85,7 +85,11 @@ the ``mbus_code`` field is handled differently:
     * - __u32
       - ``index``
       - Number of the format in the enumeration, set by the application.
-	This is in no way related to the ``pixelformat`` field.
+        This is in no way related to the ``pixelformat`` field. When the
+        index is ORed with V4L2_FMT_FLAG_ENUM_ALL the driver will ignore
+        any configuration and enumerate all the possible formats. Drivers
+        which do not support this flag yet always return an ``EINVAL``
+        error code.
     * - __u32
       - ``type``
       - Type of the data stream, set by the application. Only these types
@@ -234,6 +238,12 @@ the ``mbus_code`` field is handled differently:
 	valid. The buffer consists of ``height`` lines, each having ``width``
 	Data Units of data and the offset (in bytes) between the beginning of
 	each two consecutive lines is ``bytesperline``.
+    * - ``V4L2_FMT_FLAG_ENUM_ALL``
+      - 0x80000000
+      - When the applications ORs ``index`` with ``V4L2_FMT_FLAG_ENUM_ALL`` flag
+        the driver enumerates all the possible pixel formats without taking care
+        of any already set configuration. Drivers which do not support this flag
+        yet always return ``EINVAL``.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index bdc628e8c1d6..8dc10a500fc6 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -216,6 +216,7 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
 replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
+replace define V4L2_FMT_FLAG_ENUM_ALL fmtdesc-flags
 
 # V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4e91362da6da..3d11f91273a1 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -904,6 +904,9 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
 #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
 
+/*  Format description flag, to be ORed with the index */
+#define V4L2_FMT_FLAG_ENUM_ALL			0x80000000
+
 	/* Frame Size and frame rate enumeration */
 /*
  *	F R A M E   S I Z E   E N U M E R A T I O N
-- 
2.43.0


