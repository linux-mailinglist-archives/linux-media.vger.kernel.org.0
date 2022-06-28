Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF61E55D3EA
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243813AbiF1H6f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 03:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243547AbiF1H6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 03:58:30 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5A1275EC
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:59 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3177d1fe9f1so97374727b3.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=YOI77sIxA3gB3oIq55SWWisUXhJh1xYbLqE4v0RQ7AE=;
        b=oOPX6XcooxqNpwInCROAq6DJqyogzPBaOagU8vVGofNg6+fRgHwzzEBXfdsxuiV7XY
         TYcoAEEZAwGtNeQ/5c8fVUoIImguiKklDR0WANFX3iQBcMox76SNtxJaPB9PTM+1uVsn
         QorGWqRehkE20CYYc/6wqOYaQ2G+Gm5kgBJKRHpjsd+2zMzWiIOTW9yA6dBMzd5D4ffY
         393yNZCScxCLt49eGHZw/+w7TZVlnHfSRzCothVsp6vh00GCUElS3zpOuA132rNB/M73
         SvKeVXRUd0TqWXGD+hAkPolFAkan5Q23OvN0Nfo3Q1NRglSynHI60u0bHiJqu3s2RmDZ
         f/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YOI77sIxA3gB3oIq55SWWisUXhJh1xYbLqE4v0RQ7AE=;
        b=rHaADZ3GXcTQNfDhfbNOvtErPi+YYN0FVriAtgCTQ5i/K4SHO9rkE+lBOjZHjvDVr5
         gTXh50YO2DE4SNwUh+dibVem5lEWJjRMxqGoLfVjKoZWaeT4tAVULEv5GhzPCEdSi/mE
         tFY1pjdCxBdPX4zmYn2md7JRoJnnQRZxSjD0gi0RKUMu0SjkPOE1jfII7oPBJD4FDMqm
         0Wdg/b7k4VIs91e5lFR+M4ta1q+VqdGqKznC4slpBgmw0iWVTABXHeHE2uazhrfTwTzG
         eSEMYZ9BKG8FxISRPnGBdarMdW/u2aWb2wjprhUANfKlKkRg+IVt7p2BijEHqsIyzYYn
         g+YA==
X-Gm-Message-State: AJIora9EbHl5nVjJ9tdDvsasSZ5GE101CalZhm/YvsQzCBUUoeCSdrHt
        NQZviuRzOyVLPmaFZvVrfgDydrWS2Pc=
X-Google-Smtp-Source: AGRyM1sY6sTM0O9UImy0pP4uGpaiyLk7pOJyye890ciGRTRDoAqC16iGDiVC221K26m5g89hp359XMkBfso=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:983d:14d6:e059:135f])
 (user=yunkec job=sendgmr) by 2002:a25:d705:0:b0:66a:1c7d:55ed with SMTP id
 o5-20020a25d705000000b0066a1c7d55edmr18388961ybg.21.1656403078912; Tue, 28
 Jun 2022 00:57:58 -0700 (PDT)
Date:   Tue, 28 Jun 2022 16:57:05 +0900
In-Reply-To: <20220628075705.2278044-1-yunkec@google.com>
Message-Id: <20220628075705.2278044-8-yunkec@google.com>
Mime-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v7 7/7] media: uvcvideo: document UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
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
 .../userspace-api/media/drivers/uvcvideo.rst  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index a290f9fadae9..ee4c182aa274 100644
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
2.37.0.rc0.161.g10f37bed90-goog

