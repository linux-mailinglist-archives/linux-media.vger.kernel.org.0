Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE4A5F04FE
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 08:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbiI3Gl6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 02:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbiI3Gl5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 02:41:57 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BDD160E79
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:56 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-356a9048111so2980327b3.6
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=Tx1EvSgKthae8gIZgKHazqT5dLNMZ5Ryhsrr0+T5KUE=;
        b=rUfgwMJFDKI1fbtKzqsGZsWW6VO+LchGI9JgfhapIwO6M/i526Sej2F+DK9e7B81/r
         385gtbskV8WL+RCAyKpGr1C8k07d1o2mBw4JLiWdaqv1Ll0si1RIX9jFBW8WR24QnHXh
         aHTkCkMfcH0S4tZl5Gr0ZgBFo5dsQsXZbVTmxsy6zlgw6GV89Ry+AncopQa18kCRtPkn
         8ocjMUG6XuJQNJ5BzrIBlZsz1urNAADWRJhjwByBs8/QcowFqHJ6jfHTVHPBWM4ZJTST
         ouEDoSK9MQk+ZaqmfSfkqyV7PFkANEv3rZ8N0vW4eqzPmos2GH40n4liEkU7scFG2aCl
         QhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=Tx1EvSgKthae8gIZgKHazqT5dLNMZ5Ryhsrr0+T5KUE=;
        b=P6RkSSkFTmhRthTyNqMwpZgenbk7Rw2O2dD/OZ8I/tw5xdJdWTycGcjJD1F4w9GXYN
         qNbIyqGLy9savnu9yIQhhXoVQWQ5LkH5lkM7KH5P8mK0wDUSmT6RRajXHg2aL89+HH4V
         7ZFOlDxYhZJ2cx7aMt+kXDsKRG8zIT96AwTfjDb8Kmv+IZkGKGkGqG2czwYmy3xWGnkw
         uKc4f+2yg3X71RR6wTcEA22mS7ZExVDf9xGpf+oVbXHz+EprSkkp/+YP/0zf9dI/w7Yz
         Dyva7uRf8YzALpqxE+AtRui62nHWb8Cx6nHzFchX1wZ4m/jZsa1RZigamyiv12BRD0si
         s60Q==
X-Gm-Message-State: ACrzQf08jtb87co39yVJTNl/r7sanc8NK17wAvZJodeo347eKm3GUojv
        BrqFd4WaxA9ul5aFld2SEQR0Umafbog=
X-Google-Smtp-Source: AMsMyM6ELdCRoYEaYaYiMo2PxDBsxjph52aPTo4i85nOWBAxQLd/93a8baJDvKpAZw93wR8imbGLDRvytIc=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d86:8b01:88ae:86c1])
 (user=yunkec job=sendgmr) by 2002:a25:bb44:0:b0:677:24c:308f with SMTP id
 b4-20020a25bb44000000b00677024c308fmr7623979ybk.433.1664520115049; Thu, 29
 Sep 2022 23:41:55 -0700 (PDT)
Date:   Fri, 30 Sep 2022 15:40:59 +0900
In-Reply-To: <20220930064059.3633710-1-yunkec@google.com>
Mime-Version: 1.0
References: <20220930064059.3633710-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20220930064059.3633710-11-yunkec@google.com>
Subject: [PATCH v8 10/10] media: uvcvideo: document UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
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
Changelog since v7:
- Fix documentation for automatic exposure based on comment in v7.

 .../userspace-api/media/drivers/uvcvideo.rst  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index aab4304e6bb5..7c18f0f82903 100644
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
+---------------------
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
2.38.0.rc1.362.ged0d419d3c-goog

