Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5081534A21
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 07:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345747AbiEZFIc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 01:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345684AbiEZFIZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 01:08:25 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9C1BC6DA
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 22:08:24 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2f7dbceab08so4631457b3.10
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 22:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=KrI7i+VPXs0xSai8FELIbvq2Fe2F5OuQP/UOI1f0siM=;
        b=dip/UtOaElSAfB9NES8396aZUUlrqtl22FOBf8P2FJWFXpehnFR9WdgAsJ9tcvyEPG
         JFOdNst0cnqRQSmZ/tHHV7CmYDiTg93ENWQBLY9HQdfolpMh418ChfWUlB1aWA1exOCS
         lMHtBInv3dlujl4LqEsFYG9KBYg2rCC7rUKR3J2v1JlZfxaxo/qUeQTs3/eMLOT27+E0
         gI+5HsF7jybpcqQONwUjnmSbCoEB1Nyhihzqt+bCQ5WEfcwd2Vaj8XJXEkWsFaxLT3Gl
         hwJufO15driUyazrS9jbCpQXOa43d8Ov+fg8xQgialQqnfRpH+SsiJvVt9pEvg3ZPpsz
         NC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=KrI7i+VPXs0xSai8FELIbvq2Fe2F5OuQP/UOI1f0siM=;
        b=n2n49X693o6Ew8YssqQ9k9IJozG2eTMh/Vs9AioR3DtzQij+Tb1moiq1u3Vu9WQBYy
         eXcR5dbUMWpGgFTrR+T5jI8dYz5Wo/HJ2eEWlzomIoGtjSqLSQrCNCbzeJGzqyV0hhUP
         3HoomB9VRq+qFCys5dbaVaBhqdRa9UFr45eIM+i6qObD7wxqr5W1bejA/ev5ar/oJjvw
         5vB8+5Sx+/NyFHjok3xObxoTg5Y3yh+9AMdSLmSHew5cOd9kK7jXtC09ieJFl4cmHZRJ
         X2OIAa3Q/2yjKMsqRsrGUq5a6ym83dWTDMGkPKCDdpq7VSr247K+NFqLkrcjFbtbRc3M
         s6kQ==
X-Gm-Message-State: AOAM5302Jxkuoey7anFnm2XH5zjsqEZ/kbSl/o26hKalCzH4nXTGEdCT
        6lKaoVZD5cTIL0NfNHKFTymorb5WijY=
X-Google-Smtp-Source: ABdhPJxmHrrhmWIQHqjUHQoF262vGKhfKGVnjFKNB+amM6gypv1gQtXH35481nBP30ZkOI/1puQe4Mh7aaY=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:9e5b:ab60:68b2:d628])
 (user=yunkec job=sendgmr) by 2002:a25:250:0:b0:656:872:210d with SMTP id
 77-20020a250250000000b006560872210dmr4932126ybc.91.1653541703981; Wed, 25 May
 2022 22:08:23 -0700 (PDT)
Date:   Thu, 26 May 2022 14:07:44 +0900
In-Reply-To: <20220526050744.2431518-1-yunkec@google.com>
Message-Id: <20220526050744.2431518-6-yunkec@google.com>
Mime-Version: 1.0
References: <20220526050744.2431518-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [PATCH v5 5/5] media: uvcvideo: document UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v4:
-Reword the documentation.
-Mention ROI is in global sensor coordinates.

 .../userspace-api/media/drivers/uvcvideo.rst  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index e5fd8fad333c..6f28d816d24a 100644
--- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
+++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
@@ -181,6 +181,7 @@ Argument: struct uvc_xu_control_mapping
 	UVC_CTRL_DATA_TYPE_BOOLEAN	Boolean
 	UVC_CTRL_DATA_TYPE_ENUM		Enumeration
 	UVC_CTRL_DATA_TYPE_BITMASK	Bitmask
+	UVC_CTRL_DATA_TYPE_RECT		Rectangular area
 
 
 UVCIOC_CTRL_QUERY - Query a UVC XU control
@@ -255,3 +256,63 @@ Argument: struct uvc_xu_control_query
 	__u8	query		Request code to send to the device
 	__u16	size		Control data size (in bytes)
 	__u8	*data		Control value
+
+Private V4L2 controls
+---------------------
+
+A few UVC specific V4L2 control IDs are listed below.
+
+``V4L2_CID_UVC_REGION_OF_INTEREST_RECT (struct)``
+	This control determines the region of interest (ROI). ROI is an
+	rectangular area represented by a struct :c:type:`v4l2_rect`. The
+	rectangle is in global sensor coordinates and pixel units. It is
+	independent of the field of view, not impacted by any cropping or
+	scaling.
+
+	Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query
+	the range of rectangle sizes. For example, a device can have a minimum
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
+	Max value is a mask indicating all supported Auto
+	Controls.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_EXPOSURE``
+      - Setting this to true enables automatic exposure time for the specified
+	region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_IRIS``
+      - Setting this to true enables automatic iris aperture for the specified
+	region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
+      - Setting this to true enables automatic white balance adjustment for the
+	specified region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_FOCUS``
+      - Setting this to true enables automatic focus adjustment for the
+	specified region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_FACE_DETECT``
+      - Setting this to true enables automatic face detection for the
+	specified region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
+      - Setting this to true enables automatic face detection and tracking. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the driver.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
+      - Setting this to true enables automatic image stabilization. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the driver.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
+      - Setting this to true enables automatically capture the specified region
+	with higher quality if possible.
-- 
2.36.1.124.g0e6072fb45-goog

