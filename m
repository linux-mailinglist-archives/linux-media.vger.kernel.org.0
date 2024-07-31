Return-Path: <linux-media+bounces-15628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D9942A9D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 11:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27161F24C03
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8EC1AB51F;
	Wed, 31 Jul 2024 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="1TkrMVBs"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9713C1A8C18;
	Wed, 31 Jul 2024 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418507; cv=none; b=WaBZEu9N97vvmyxmm73/1f1MKStSoE1om+q9ZaD567tgWLg4JfMq1eaBjZvnGxUuaw3Ebh4O2cTbzOw/QIE1ESUSPnQdVYrZDuDGJtu4qvBNHfBkL7g7OLy+/aedB+5fYlXtXqB4CIETsh9Cx7wAZGmQoG8w3kgc37gMF9DICUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418507; c=relaxed/simple;
	bh=xpSXgsWUTk8EjfxPhq83yZrNoBSKswzok7wmSDRayZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMg4mPTwmX5dAAPwYtbHiczJy2TPITLc6sDpzO7GYIr5aA8GSALOa9sFzufSq9SLsGxIDKH0uaRYD3tEuONuuiZgkjAMkRrt+8n2MBVjDTMR7aQzrYXK3tDJmm4ANyeK5r/fJpX+CLGuLOyKRP1TGHMZMuoygGoDq7eAVuCWpTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=1TkrMVBs; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722418503;
	bh=xpSXgsWUTk8EjfxPhq83yZrNoBSKswzok7wmSDRayZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1TkrMVBs3ytTu2BqTnIZhC88+PHh22ue12iu4iM5EWVSEw7deP6TF1nTD4Zomg4EW
	 CfWcggObztHgFamqLkrOp3luhD9mpdtw9UnZhmua5QOKSM5EdbuLEmAxM+MajXm1cF
	 NECPhxGiduzOBjsyAM4tKO+sHYBueYtnwFSnpAfv80tmsrIPknyoLBanvNv64aE62z
	 zwgqI+YnFruyjMSJQ0xnApScgd8sPwkq/8OOZ7G6NfAklz/SdX3bCuk205PR+bNRVT
	 uTVOBNoJMAefZ6JoUsgE5vYCH2YEElsxP/fdg3AXpOdVgMRhRPAIWnwtkMDfb6u5Jv
	 BchN7UTTT8gRw==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 792193782039;
	Wed, 31 Jul 2024 09:35:03 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v6 1/3] media: videodev2: Add flag to unconditionally enumerate pixel formats
Date: Wed, 31 Jul 2024 11:34:55 +0200
Message-ID: <20240731093457.29095-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731093457.29095-1-benjamin.gaignard@collabora.com>
References: <20240731093457.29095-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the index is ORed with V4L2_FMTDESC_FLAG_ENUM_ALL the
driver clears the flag and enumerate all the possible formats,
ignoring any limitations from the current configuration.
Drivers which do not support this flag yet always return an EINVAL.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
change in version 6:
- Change flag name.
- Improve documentation.

 .../userspace-api/media/v4l/vidioc-enum-fmt.rst  | 16 +++++++++++++++-
 .../media/videodev2.h.rst.exceptions             |  1 +
 include/uapi/linux/videodev2.h                   |  3 +++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 3adb3d205531..1112dc9044b2 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -85,7 +85,15 @@ the ``mbus_code`` field is handled differently:
     * - __u32
       - ``index``
       - Number of the format in the enumeration, set by the application.
-	This is in no way related to the ``pixelformat`` field.
+        This is in no way related to the ``pixelformat`` field.
+        When the index is ORed with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` the
+        driver clears the flag and enumerate all the possible formats,
+        ignoring any limitations from the current configuration. Drivers
+        which do not support this flag yet always return an ``EINVAL``
+        error code.
+        Formats enumerated when using ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
+        shouldn't be used when calling :c:func:`VIDIOC_ENUM_FRAMESIZES`
+        or :c:func:`VIDIOC_ENUM_FRAMEINTERVALS`.
     * - __u32
       - ``type``
       - Type of the data stream, set by the application. Only these types
@@ -234,6 +242,12 @@ the ``mbus_code`` field is handled differently:
 	valid. The buffer consists of ``height`` lines, each having ``width``
 	Data Units of data and the offset (in bytes) between the beginning of
 	each two consecutive lines is ``bytesperline``.
+    * - ``V4L2_FMTDESC_FLAG_ENUM_ALL``
+      - 0x80000000
+      - When the applications ORs ``index`` with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
+        the driver enumerates all the possible pixel formats without taking care
+        of any already set configuration. Drivers which do not support this flag
+        yet, always return ``EINVAL``.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index bdc628e8c1d6..0a9ea9686c24 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -216,6 +216,7 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
 replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
 replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
+replace define V4L2_FMTDESC_FLAG_ENUM_ALL fmtdesc-flags
 
 # V4L2 timecode types
 replace define V4L2_TC_TYPE_24FPS timecode-type
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4e91362da6da..421a30cb0c51 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -904,6 +904,9 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
 #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
 
+/*  Format description flag, to be ORed with the index */
+#define V4L2_FMTDESC_FLAG_ENUM_ALL		0x80000000
+
 	/* Frame Size and frame rate enumeration */
 /*
  *	F R A M E   S I Z E   E N U M E R A T I O N
-- 
2.43.0


