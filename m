Return-Path: <linux-media+bounces-16852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1916E95F7FB
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 293FB1C22322
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D9119924E;
	Mon, 26 Aug 2024 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UYHt5unp";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="NYpYp1Iy"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-48.smtp-out.eu-west-1.amazonses.com (a7-48.smtp-out.eu-west-1.amazonses.com [54.240.7.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F100198A19;
	Mon, 26 Aug 2024 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693053; cv=none; b=ckThNHqiWy+cNBijOtIq3z622AywCConfIIMNpXiAaHlhmJjK/6ZWCqF2O0HFeVbw1Pe6yUp/XIOfWdL5Poy9H7Z7l8JHdw/xe+6ptJed29swgWwDKKK36gECbO35Br9NZINfgDVYcpu/0nvsDEowhdAgsXh8FfYoPAPZhg/kGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693053; c=relaxed/simple;
	bh=OSLHE8tFNYIiN6g4tIzBnhyy90K7b7D8a3ozf67hRBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtZBvTLJuQbiTkzYXbvz5Jt8JKHfqjFgqF2iVll4k0ai55l/cvXF5GUBsKudmMJGhqWBPhrzhyuLAeBwhyh8VN0Fg7S10jhHFQRCLUUZtzQDKKSdBv1YyHV9Y5gNdb9iX3DEyRp7UxTMXca28hT10o+ZbBt40bzjDzRBcIAWilU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UYHt5unp; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=NYpYp1Iy; arc=none smtp.client-ip=54.240.7.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724693049;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OSLHE8tFNYIiN6g4tIzBnhyy90K7b7D8a3ozf67hRBM=;
	b=UYHt5unpeTd1SjzXB4oPnLLw1ua3OR6NXKvGKdI54KdLiIOq27LW4soXUpcdVE4K
	FMNobThYB1LrSIz5z0pv+whyGg/Zq4i6xneWnSlZkCGZEuLWkatgb1v31EdXYRZ+avk
	f8B/kTDQ+bNWdsiFeYB/nbbW/Fea8/aqatOZscghT/VMd62BTJti2iNLGCIhaTEHxvx
	L8iQLYDAJSzTG21dkxLiMXHkS4N1a9HkqIyCSnvCVSRISBZ1fhMC92Nv1Ms4tJQVMr1
	k+oU+YmpQPzN4/7EE5/gN3h9HVGW9p0Djqm/GbFK2ZgfOrlNVWWODkUvFimEzHTNl8S
	2rXtrk0twg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724693049;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=OSLHE8tFNYIiN6g4tIzBnhyy90K7b7D8a3ozf67hRBM=;
	b=NYpYp1Iy4Y5lBH10T+knIOw2cpLAirYjJNJW+MN1BxBtwMPg8D6l5ektfKP+qG/o
	HH1D0xE6b13gIpVDHYPUsn1gGRF+MNXDw0ZnN/XPTinN4HUVb/WGvACrwyaufhfF6nH
	MzT7r5Xbn3u4TrjBttgfYHJr6JkgIWWk+M34SUQg=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar, 
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 1/3] media: videodev2: Add flag to unconditionally enumerate pixel formats
Date: Mon, 26 Aug 2024 17:24:09 +0000
Message-ID: <010201918fb77141-93148d3e-6899-4b09-bff3-5d4f146f1449-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826172407.140538-1-benjamin.gaignard@collabora.com>
References: <20240826172407.140538-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.26-54.240.7.48

When the index is ORed with V4L2_FMTDESC_FLAG_ENUM_ALL the
driver clears the flag and enumerate all the possible formats,
ignoring any limitations from the current configuration.
Drivers which do not support this flag yet always return an EINVAL.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
change in version 7:
- Rework documentation about which drivers should use the flag

 .../media/v4l/vidioc-enum-fmt.rst              | 18 +++++++++++++++++-
 .../media/videodev2.h.rst.exceptions           |  1 +
 include/uapi/linux/videodev2.h                 |  3 +++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 3adb3d205531..e39c87bcbfc3 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -85,7 +85,17 @@ the ``mbus_code`` field is handled differently:
     * - __u32
       - ``index``
       - Number of the format in the enumeration, set by the application.
-	This is in no way related to the ``pixelformat`` field.
+        This is in no way related to the ``pixelformat`` field.
+        When the index is ORed with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` the
+        driver clears the flag and enumerates all the possible formats,
+        ignoring any limitations from the current configuration. Drivers
+        which do not support this flag always return an ``EINVAL``
+        error code.
+        Formats enumerated when using ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
+        shouldn't be used when calling :c:func:`VIDIOC_ENUM_FRAMESIZES`
+        or :c:func:`VIDIOC_ENUM_FRAMEINTERVALS`.
+        ``V4L2_FMTDESC_FLAG_ENUM_ALL`` should only be used by drivers that
+        can return different format list depending on this flag.
     * - __u32
       - ``type``
       - Type of the data stream, set by the application. Only these types
@@ -234,6 +244,12 @@ the ``mbus_code`` field is handled differently:
 	valid. The buffer consists of ``height`` lines, each having ``width``
 	Data Units of data and the offset (in bytes) between the beginning of
 	each two consecutive lines is ``bytesperline``.
+    * - ``V4L2_FMTDESC_FLAG_ENUM_ALL``
+      - 0x80000000
+      - When the applications ORs ``index`` with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
+        the driver enumerates all the possible pixel formats without taking care
+        of any already set configuration. Drivers which do not support this flag,
+        always return ``EINVAL``.
 
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


