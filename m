Return-Path: <linux-media+bounces-23017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F05B9EACDD
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD6116BB7A
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE2A2397AD;
	Tue, 10 Dec 2024 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jEQOMHTH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C9237A35
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823791; cv=none; b=OrjjzEWVOR0WzUrA9nP8RRSpgRgC+THkEWJAIg7Zj7WwBSOdWMLBDJsx3kjb/OA5eF2Q/2uyUPkombKocHWSN7EP/xkNDEaL2gDWn+YR6znacWvDk2OPPB0qf487QViPFIBpWeBpfdJSzDdHkRyqi0b+bwmXIM6maej+LeyE1pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823791; c=relaxed/simple;
	bh=fKDUU4+a+tgFts82eq+chwHIWurrBXbxHGkI4O6ed0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aEEMDpLPrdWfjMf1nGNJArU7b9IiNRQJy1w0m3bT3F77RiOnvw7CHUqOp7hlIICUPyDq1InNU67iQkP9wruC/8rNrehVkp+5mFXJykFcsSdLynVokecBbdyNoZbilas1Q8w+5rLJDsHy8y1klZcI89BJd4B8PZxHjH7k8r7J7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jEQOMHTH; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d922db2457so3775536d6.3
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823788; x=1734428588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcSM+HEV8BWvpd8XLVPPgYNPK82Sc3PIhfJhk9lYWic=;
        b=jEQOMHTHW1SSFfR671K5xpr4OpCloXT+RjDqJUcusgkoguVlj8sWmMNeXDbIOJYtnZ
         ahVbqTSGc2yhv6ZVxR5c5MCLt4RAlai6IiYHko1Fi06muXVGCevHsEWv/Qw9N53V5rUz
         81TpCVmiBwXwd2e1uujtZvRgJxhXADAx/36Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823788; x=1734428588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcSM+HEV8BWvpd8XLVPPgYNPK82Sc3PIhfJhk9lYWic=;
        b=ZkZv8QnEL5VrBT81YE82UQdXqPlZ58YeUm8uxoe/X86rnSG2XgdhjyJHrqvI5iZXjJ
         4RA+GvskCOI4uZkx+lQutH6bwaWe8mE5g3HxlRxIpiTyAGr8bR5EtpTvhcnUDS+rABcM
         WmL39AWk9rt1BIILcKxlHu8KRJJUZ6ST7php48/qocny4qGUmDUWVT9jvNYVtPgirF+C
         4rywb73TK2tJrVQUradx62jdUKHjprl+OgeRrgbOyXXCRVV1cRiRFGSPCudIjtfsJRw/
         APBNr2dpQ+TTKIRKicNQb3QUklP2qtkNqfOpz28Uw7j8+jWqfz97uDlWZB2+1wOe4/0Y
         vHuw==
X-Forwarded-Encrypted: i=1; AJvYcCX+XBu9DqmqxVWe1pXA3uW8llodHWclQf4akHpV/0Qe45TnoqLGU5CR6UbyMOoK2RZed4F86l7KX1RdHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlHir1Gsv7d0E8jcmsMCdUraGQrJxEDxGlwjVG+O2NRh9jwV7i
	h2N3Xu6NMD7SLuh5utNylsDa0j35AMvQWhzI1/1vCjzEpceaF2aUoU282jyfrQ==
X-Gm-Gg: ASbGncuJ6KsF/y5hwLGtbTTP7yZ5l6/Vz7L2zo71dKYnlVPM5zstx91kHZ/zIerMDxK
	c2MKEl1AGWySR4RdG36ZFvT2MLeBD6DahKoTrwELoz7nF7Er3wxdX/SF5O+rZMlVNXLm3h8NUYv
	mcZWpTgxFEv0F+ioyGobj9xlCjOuKSvo/WtY7S7KVdShB9jsMHhcLIH4NOqnCpWhEXeFGLXB5yl
	6kozEgaz7F0gZHBqDzOaa8olOENbLNr9sLRBK3TUARr/svWxga2VF4hB3+itGdZc4Cy7sF+Ydny
	JX6v8wQ43Rci86tfUlQIwo2nP7P8
X-Google-Smtp-Source: AGHT+IFtCAY1FI+TINr0gaxNPy0pUOg439RuOUTCEezTgC51c5iK/b9dchgVcUIE8AI0mMGMWG8sDg==
X-Received: by 2002:a05:6214:e6b:b0:6d4:1dc0:2620 with SMTP id 6a1803df08f44-6d91e4465a0mr64808496d6.40.1733823787859;
        Tue, 10 Dec 2024 01:43:07 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:43:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:54 +0000
Subject: [PATCH v16 18/18] media: uvcvideo: document UVC v1.5 ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-18-e8201f7e8e57@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
In-Reply-To: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
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
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../userspace-api/media/drivers/uvcvideo.rst       | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index a290f9fadae9..dbb30ad389ae 100644
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
+	rectangle is in global sensor coordinates using pixel units. It is
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


