Return-Path: <linux-media+bounces-21431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 834999C9260
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63959B2A67E
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C9D1B982E;
	Thu, 14 Nov 2024 19:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R/z23kPf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387A01B5EBC
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611466; cv=none; b=ifQrN/2/P9qGxJNNmPjCgH5SxQ+DC2mgexb7NYwCM6LeRNxjXL+rOafdjz/R21NWr+RNKDxI1yT58dAq6L4equXpmG0lT9ggqq9VCzbazU5j1sS/T30usxWJbLHnNyD8RUa0gz2jHzt1EdVBQYcTuydHmu3UP9djU1l6J8bSx8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611466; c=relaxed/simple;
	bh=PhTJre4pPGmMPPsN/T9S6uvenShngpY+QklJsyJGE5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PByNDvywMIk91Eb7NP3OftiOPJ43kqu7F5ZwBAhXSyYANoqfhtrMfKiiHnAOKCU5SP5wqj5FdAyp8BOAoUrS7SaaDMVVI4z3dz6IBUSxqnf1DtdS2Wj3sEu3Qf7vcpvKwn2m4+m6sVZAKkKFjTd/jUXbsqqZdZwPr3HC8ZBWGJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R/z23kPf; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cbf340fccaso7885936d6.1
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611463; x=1732216263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBavzk6Bw3Trxv3crngVWykxkJCeHnNA55ffm7Fp7P0=;
        b=R/z23kPf0JUQl/xmFpzO8ohew7Ldo6lxXE5EYQY4LuLA/4Xq+AIJxGOMqDnMAt/0Ru
         RSTQghh7Q+dyA09g4ETaziFV4CuVmHcz34IWIdVgeLymPuFWMTKba2IU+XiqhhJMoDU7
         z3keOHAGn2xIqBvxqdRDPmbR0vBAUE9xqA/J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611463; x=1732216263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBavzk6Bw3Trxv3crngVWykxkJCeHnNA55ffm7Fp7P0=;
        b=PJqPHqILBAzCbVwebmnNT2BIrD4MvLzPs+GgLaLM1jFVWjK14niF1rBTaT9/e/cd+0
         F1rH4ULw5gsE1a42wvjJ3y0HHoC4vj34d0a8APpKpXuZqTimapbCdYujFdubQcCBiK76
         5G1t/yw53Dw5dSnoi2lXWM+al18UfiqqXEFeVFXhNeNkFZOT3CKEGrJA7CR4vydCXJGO
         C71191EfRRm4HH1maWm/dCLgWfeXobV+UtMrMagyAtgKSGuEYpZy6b3TUEORY4AgmDWI
         vHzUoGNh6ewrXq19yx/oED/UUOEJwkdgYAzJStSuucEB1eG70Mno0X8ykPMpNoVYYnVV
         1X8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmrmR1LfDtopwfrmBnMrCrndZ26GdkfB1apHF72ajBQjqKpM4N/t7w0WP9rSAomzkxnr8bV6Mz/kT+gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYtLr/Zs87s9yqI8fh3WT0hbqCp7icTcLvRRJMmhlwu8ilqtK4
	eDKDFxWMJ1d67qtvn3mawjZTsq0NKoMTCSfK2qbM5RDiI70cRRyK0K0xi+EX2g==
X-Google-Smtp-Source: AGHT+IFgscBZYIINazB1el1lgvgswMvG66EcNip964hXIqQxn60chcRbTUwj3BXMFDmkJzGj5Aze5A==
X-Received: by 2002:a05:6214:5d8d:b0:6cb:f72e:4eb9 with SMTP id 6a1803df08f44-6d3fac30859mr3276576d6.11.1731611463343;
        Thu, 14 Nov 2024 11:11:03 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:11:02 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:48 +0000
Subject: [PATCH v15 19/19] media: uvcvideo: document UVC v1.5 ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-19-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.13.0

From: Yunke Cao <yunkec@google.com>

Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

An example of a userspace implementing this feature can be found at:
https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../userspace-api/media/drivers/uvcvideo.rst       | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index a290f9fadae9..1cdcd45907a3 100644
--- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
+++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
@@ -181,6 +181,7 @@ Argument: struct uvc_xu_control_mapping
 	UVC_CTRL_DATA_TYPE_BOOLEAN	Boolean
 	UVC_CTRL_DATA_TYPE_ENUM		Enumeration
 	UVC_CTRL_DATA_TYPE_BITMASK	Bitmask
+	UVC_CTRL_DATA_TYPE_RECT		Rectangular area
 
 
 UVCIOC_CTRL_QUERY - Query a UVC XU control
@@ -255,3 +256,66 @@ Argument: struct uvc_xu_control_query
 	__u8	query		Request code to send to the device
 	__u16	size		Control data size (in bytes)
 	__u8	*data		Control value
+
+
+Driver-specific V4L2 controls
+-----------------------------
+
+The uvcvideo driver implements the following UVC-specific controls:
+
+``V4L2_CID_UVC_REGION_OF_INTEREST_RECT (struct)``
+	This control determines the region of interest (ROI). ROI is a
+	rectangular area represented by a struct :c:type:`v4l2_rect`. The
+	rectangle is in global sensor coordinates and pixel units. It is
+	independent of the field of view, not impacted by any cropping or
+	scaling.
+
+	Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query
+	the range of rectangle sizes.
+
+	Setting a ROI allows the camera to optimize the capture for the region.
+	The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control determines
+	the detailed behavior.
+
+	An example of use of this control, can be found in the:
+	`Chrome OS USB camera HAL.
+	<https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/>`
+
+
+``V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (bitmask)``
+	This determines which, if any, on-board features should track to the
+	Region of Interest specified by the current value of
+	``V4L2_CID_UVD__REGION_OF_INTEREST_RECT``.
+
+	Max value is a mask indicating all supported Auto Controls.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE``
+      - Setting this bit causes automatic exposure to track the region of
+	interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS``
+      - Setting this bit causes automatic iris to track the region of interest
+        instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
+      - Setting this bit causes automatic white balance to track the region
+	of interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS``
+      - Setting this bit causes automatic focus adjustment to track the region
+        of interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT``
+      - Setting this bit causes automatic face detection to track the region of
+        interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
+      - Setting this bit enables automatic face detection and tracking. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the driver.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
+      - Setting this bit enables automatic image stabilization. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the driver.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
+      - Setting this bit enables automatically capture the specified region
+        with higher quality if possible.

-- 
2.47.0.338.g60cca15819-goog


