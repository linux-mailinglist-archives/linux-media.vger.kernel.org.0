Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3514C77F118
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348449AbjHQHTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348439AbjHQHS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 03:18:58 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16557FE
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:57 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d1c693a29a0so8391183276.1
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692256736; x=1692861536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2U2Qkk4JcPTdYJ5HLJMLu64/5ctrAEOdHItmvl2Dlvs=;
        b=XEddddE8Lp39TAKOkCuXFq9aZtDMqVHlk38Qw37KvNOXR49HpV3cz3Em+TGu9iePYl
         uV0YMNf7FDL62JnyQk3arRT0rgZkzYyJr9KBMWJDslrw60QuY0H0AVsb1lxtum2CFfsr
         MvlP8FJkavKhv66wOJASyAH+pibDKI+tu4ydisJnkTSOTrqSj5QnRPs0eBp2k0ZLlBPX
         p60Y3EtBWaVK8WYnWRh6m3LQRuYkPkIUJBqire6OtGvJNpOecFigjPPeYY49MolsxP7a
         piLMexhp9HvloQWFW1crWF0+qFwD4iNs300ELasB8oBL1YWSFvqnkGQd4KP4lWhZuO0e
         +13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256736; x=1692861536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2U2Qkk4JcPTdYJ5HLJMLu64/5ctrAEOdHItmvl2Dlvs=;
        b=R3hYcMhMKmipdy17J0QXxOGFjmdAPq2UsfvIjPeM1YIQY0A/6/Z7q8CInlPXS4D05W
         YPKWUVTmCUBAoA2J0TQfJe3DTscTvXGodDcgB/Gjlb42/7XgiUavyWUmALK1X3c3SpCr
         fpeXqrf7Sc8pBQZad0d96ttahzx1Wt0+M0SqovRGXwkepTCOC+US7GakAdwnntKm7iM1
         uYkL9LQTYnTWxqbxPgd0nksEI28sBH9rPD6lXEDJcsqsrX/cdtAn74iM9ag3ou/cXmw9
         rilggULpfuez66bfnMQpYCgihCujv4/Db8f5r5nTizq9LWg0QFe17lLhp2XYuxlWfF69
         aM3w==
X-Gm-Message-State: AOJu0Yx2OXXER6+FBdD3UdJ3rxbrJK59L7ChYE888cd3khS84x0XSA4Y
        WNw1iuczV8KFNFHq0rNy+5CP2P0t4dM=
X-Google-Smtp-Source: AGHT+IGCJe5966UlBz3fahnNaqDTnTQsPtVcDDvTz1f2qgO7c6l3XNyQfCDurHjY0mJYZfAJIxK8w9TsKEs=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:cb5f:f997:f2a2:88c6])
 (user=yunkec job=sendgmr) by 2002:a25:df07:0:b0:c78:c530:6345 with SMTP id
 w7-20020a25df07000000b00c78c5306345mr55789ybg.7.1692256736309; Thu, 17 Aug
 2023 00:18:56 -0700 (PDT)
Date:   Thu, 17 Aug 2023 16:17:39 +0900
In-Reply-To: <20230817071750.2830271-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230817071750.2830271-1-yunkec@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230817071750.2830271-12-yunkec@google.com>
Subject: [PATCH v12 11/11] media: uvcvideo: document UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
2.41.0.694.ge786442a9b-goog

