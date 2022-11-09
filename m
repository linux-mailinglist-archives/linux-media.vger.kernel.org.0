Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A4A6223B8
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 07:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiKIGH1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 01:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiKIGH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 01:07:26 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7921F611
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 22:07:25 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id t6-20020a25b706000000b006b38040b6f7so15859565ybj.6
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 22:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B64WtGxfyYiC5qwn+aWF/jkPXBaDFQ1mZNVz6PFOsBA=;
        b=CPUhu4FmP9dc12D8j8ipB+3tJJYc20LPXAB3ufiDC+ACMB8iRLIOicUAKsFF87OrV+
         1mb1Uib28N6UW84QVhTWZ/b7bPmeRqH/XCoIrhAzcZNCLwRAmoBz4p3ZQ3aHY4QTOqav
         Cqu+XTt/hPxb/BjgzZC8dYXbu99n12W94+qK4ZDaY0694RQLM+CGNu+6t3lLEu0I4qCT
         yjX5n9zdm6CIGBt1S/Fyc0ScjKaaZoM3+uMcUB5A5i8S4AAPOszW18BKKzzgdEV+LRP+
         B+7SaVRiWfiTgZ/IgFw3iG+CEXsr+XwGXJ9kNh49zOU0Tz6vDVpDrCYd0FYEQ0040rOm
         MyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B64WtGxfyYiC5qwn+aWF/jkPXBaDFQ1mZNVz6PFOsBA=;
        b=5bGxmfaoyvc+NstaPeeI+rI547BI2DGM5M/LtwhLN7VQJDyQvgiOqQlN9HoBcZy5f4
         2joEytGJj8KojVz8gUUCm9rWeit6InMd7ONlfTZPxjqSVqkN9ZwT1rGRKHGABEX7k9Zg
         z/LNSia7BBEKVT/uc+DLF4zFZUf2e/PzTmY5ERo7gOd/lVefVgyj+p2Q5s1kcNdQA4G3
         DXXkrGBCMMvJ6TFSNMmqDyq4kYXuJIVkIgFKyC+8b/ivujctsT2WvrHxcITQ7B8jXHfB
         m0SkpvoHr0pTYgTxPFSKb4NlClKJx0PkL7dXxVXmBJepvcx8iWSuOp8uWr3rTh99IE7z
         vd9g==
X-Gm-Message-State: ANoB5plNVO/738xMlfF7OZqbhdWg3/8MyWsa2LCSsoa46rLbt40Wqbwd
        Sua7F3r0PKcI8YOXll/Kv3t5nKyQloM=
X-Google-Smtp-Source: AA0mqf6nBR+XLdX1Hvo8MYXlQTHP1Uq/tYybRIbaXBKruPXBCpigtDFJuyyzFS4W/hOUnAJkYHyyXEYi2SM=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:124f:15d3:a305:3dbf])
 (user=yunkec job=sendgmr) by 2002:a25:7c86:0:b0:6d5:fe9f:e4a3 with SMTP id
 x128-20020a257c86000000b006d5fe9fe4a3mr16640430ybc.386.1667974045031; Tue, 08
 Nov 2022 22:07:25 -0800 (PST)
Date:   Wed,  9 Nov 2022 15:06:21 +0900
In-Reply-To: <20221109060621.704531-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221109060621.704531-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221109060621.704531-12-yunkec@google.com>
Subject: [PATCH v10 11/11] media: uvcvideo: document UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changelog since v9:
- No change.
Changelog since v8:
- No change.
Changelog since v7:
- Fix documentation for automatic exposure based on comment in v7.

Some descriptions for some V4L2_UVC_REGION_OF_INTEREST_AUTO_* are vague because
I copied these options from the UVC spec.

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
2.38.1.431.g37b22c650d-goog

