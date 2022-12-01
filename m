Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 232A563E7ED
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 03:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiLACdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 21:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiLACdK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 21:33:10 -0500
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CAD2B185
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:33:09 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id g193-20020a636bca000000b00476a2298bd1so506805pgc.12
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dXGh+whUFfSVOqnt2jMxHxRS/YETRRHx+wWfeEz4/kg=;
        b=kUiFVCB81OCxq9lZe3ghJgsmqJdPs/MReWPFJh0JLczpbrPsD3rylFaHP03L+MhBwL
         GmupedbkHqBTbqAPSLaUmOiB0s9jyEfcXXOP913u/rQ4OHJiQ/WtbscH3jNLjUcNVYT9
         RTQYOcN40DEsyDxqyMqAI2C9ZvIdjLu3+E3hIJMod4H1lxf4zVql+lX4wZX1pEf7YOyR
         1yRZ90Ar0Efht/Cjl6azNTRAAbl/y7GU9+ckvTnpQ7/uwt7cR3yzW985s5K9UeJ3I9RX
         t+7iClFXtXbuvX24IGHa8oDGbrWRf9DJRcW7rqPtfw9UzEtquUwaNAj6lvoE8nYdnfDL
         Jt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dXGh+whUFfSVOqnt2jMxHxRS/YETRRHx+wWfeEz4/kg=;
        b=IbP+4vZm1zScYbn3YZKJWCojbfvjPgEjvN/oZR+j4IBRBifdOCf1g/tSoxKYu1ublF
         668ouRg0zOuvUz2/zXr9sVjUt2ap+GmLgJQNCBYidBCD2kJNiXjLSMxmDerhoDnaDaxd
         irpsekjDRiTdsgY7g7c3khpSuboQP+6CS1jsN+ipms5UhTb8r2xGbSgJaYk7URnJk/kM
         rkmQWb1KF6ofCiiJpChn6qGvUQ5EZK2s4MX2pTl+FTFpwpJUdTO5neO9svhQ02xejpuT
         +ur0E8Nx+w2lNMB0Z4/mMzvHDFu27zvyGP5CyCkXr53Ykckg03IntPcVdWCIPl6UvLw4
         GlLg==
X-Gm-Message-State: ANoB5pmxw7DJ/ZdvWo8C15za5Nszb1mG3e9U8jpfMLWSZHap4h9MGQ54
        EPgLkeQaQ9Nt0ei3lEOgKJxiS53IbiQ=
X-Google-Smtp-Source: AA0mqf7ld+4uSucNpLmaiSAc6uHTz8ohNEChc7KodAvZaZ/oEiPyHGH5G4P4T/KFAgqA80AUFk1w31iAtG0=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:8366:b78e:6451:c163])
 (user=yunkec job=sendgmr) by 2002:a17:90a:294e:b0:219:65c0:619f with SMTP id
 x14-20020a17090a294e00b0021965c0619fmr5919188pjf.150.1669861988853; Wed, 30
 Nov 2022 18:33:08 -0800 (PST)
Date:   Thu,  1 Dec 2022 11:32:04 +0900
In-Reply-To: <20221201023204.2177458-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221201023204.2177458-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221201023204.2177458-12-yunkec@google.com>
Subject: [PATCH v10 11/11 RESEND] media: uvcvideo: document UVC v1.5 ROI
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
2.38.1.584.g0f3c55d4c2-goog

