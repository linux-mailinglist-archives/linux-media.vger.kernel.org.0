Return-Path: <linux-media+bounces-1457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0EF80049C
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 08:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FFBCB2122B
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 07:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8180134D2;
	Fri,  1 Dec 2023 07:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RxZSZAxa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E5A10FD
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:20:08 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5caf61210e3so27545627b3.0
        for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701415207; x=1702020007; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i3/mP1wKCuXhwBC/V9uJWWU0BTbwKVKpUZR1VaRHKPc=;
        b=RxZSZAxaIEDADMQh8NpOkgLW1jr9+JHJy76TyBsy6hOR9U8nzbyY/v1wCwE7XkHjXa
         Kc308JJm9vhHaZCQchm2XqyE5pqgyeZs6uZX64IQmvYMifE8tMfSEBiARCFL5vnMwZ+z
         3ixo9ZfJD84L15+f+258BiriQeOnlrlRpqoJtCtfZIJFzcAcPFI5xpovTF2cXMjrG4H7
         BM0CEHjFp7DmHu89OWiXqdHGLYu0suzfFFo9hCSr0/JBQajuELXIWJzTMz6x5WUgSStZ
         5C6l5eUdCeB5/Rw4E3oHfarx5WVbuCELfMXfz2E7B3znamYV+CBLuHfU8S1ogsHD0zgo
         hBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415207; x=1702020007;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3/mP1wKCuXhwBC/V9uJWWU0BTbwKVKpUZR1VaRHKPc=;
        b=dmXPpT2TwC5VF/Rpb3mnTyKIgVzzONeq11F/L4MaNUjuqhw7XBJy+6HGnx3mtg8TMv
         VEy71Lq+HZHr9yMsumPI0lo0z1VfZYD7LjlbBUsAnyrtwka5za5eEjrZ5hsBSFLaPXJd
         tr3yhYUbLuqLVhEaZLDE9vLYyV+ozG4DCjLoatSR8h8JBSNV4/sFukc2/MtUFpLtqKux
         tne0is/V8pLmDBlaXYEfFwEqiJPwPVem2PWPp6Il0H44Wdco0zngoheSdRPJwFsyyjkL
         sCSlZj2m+mOv5UFCfTlbhqM8M20I40Pm8F+2brTg5Uj36RFYo7fGqL2Ia/+/HmetMBqW
         nWjg==
X-Gm-Message-State: AOJu0YyqEE79mtpDk6KvzTzk+hv+vrugM2EYObTrx/fXTInG/qQvrovI
	AwITH2Il3o+lA1UfBWHVbJpyJB/AZ8g=
X-Google-Smtp-Source: AGHT+IH4MLCDxfHg3dGsPHXVMZjfmfk4SNWCmp62KbwgjLbW9UKdXj/hRYT/6pso0Ac4ULv97xAjraKtA6M=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:ea68:7c7a:2356:8a4a])
 (user=yunkec job=sendgmr) by 2002:a05:690c:2849:b0:5d4:1b2d:f43f with SMTP id
 ed9-20020a05690c284900b005d41b2df43fmr38647ywb.6.1701415207414; Thu, 30 Nov
 2023 23:20:07 -0800 (PST)
Date: Fri,  1 Dec 2023 16:19:02 +0900
In-Reply-To: <20231201071907.3080126-1-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231201071907.3080126-1-yunkec@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201071907.3080126-12-yunkec@google.com>
Subject: [PATCH v14 11/11] media: uvcvideo: document UVC v1.5 ROI
From: Yunke Cao <yunkec@google.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"

Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v11:
- No change.
Changelog since v10:
- Added Reviewed-by from Sergey.
Changelog since v9:
- No change.
Changelog since v8:
- No change.
Changelog since v7:
- Fix documentation for automatic exposure based on comment in v7.

 .../userspace-api/media/drivers/uvcvideo.rst  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index aab4304e6bb5..3dc062221f8b 100644
--- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
+++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
@@ -181,6 +181,7 @@ Argument: struct uvc_xu_control_mapping
 	UVC_CTRL_DATA_TYPE_BOOLEAN	Boolean
 	UVC_CTRL_DATA_TYPE_ENUM		Enumeration
 	UVC_CTRL_DATA_TYPE_BITMASK	Bitmask
+	UVC_CTRL_DATA_TYPE_RECT		Rectangular area
 
 
 UVCIOC_CTRL_QUERY - Query a UVC XU control
@@ -255,3 +256,64 @@ Argument: struct uvc_xu_control_query
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
+	the range of rectangle sizes. The left/top coordinates of a minimum or
+	maximum rectangle are always 0. For example, a device can have a minimum
+	ROI rectangle of 1x1@0x0 and a maximum of 640x480@0x0.
+
+	Setting a ROI allows the camera to optimize the capture for the region.
+	The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control determines
+	the detailed behavior.
+
+
+``V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (bitmask)``
+	This determines which, if any, on board features should track to the
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
+      - Setting this to true causes automatic exposure to track the region of
+	interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS``
+      - Setting this to true causes automatic iris to track the region of
+	interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
+      - Setting this to true causes automatic white balance to track the region
+	of interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS``
+      - Setting this to true causes automatic focus adjustment to track the
+	region of interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT``
+      - Setting this to true causes automatic face detection to track the
+	region of interest instead of the whole image.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
+      - Setting this to true enables automatic face detection and tracking. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the driver.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
+      - Setting this to true enables automatic image stabilization. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the driver.
+    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
+      - Setting this to true enables automatically capture the specified region
+	with higher quality if possible.
-- 
2.43.0.rc2.451.g8631bc7472-goog


