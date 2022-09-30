Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81DD25F04F8
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 08:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbiI3Glc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 02:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbiI3Glb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 02:41:31 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3D613EAF6
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:26 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-3508d8c60ceso34174457b3.18
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 23:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=vQG+p3E49guRSy6mdT3sIzY4I1b16cywP8kgg1ml9js=;
        b=BH4gfoB/MU/VXO4smjgkT8aPEY0mZA7xB5Z6yD7bo0hPqgKAJBhtZT+Pk0nn1GcIzs
         bzxPWlUqTVHaJ+5cvajetFJZED+5Sd+W/1S+7Q4Pq98T4cC+wevsz4QXLiqrp/fC5zJo
         A7D6mxfq/QPdra0KfiJeD0aurmVEAjiXLAXBBIfMKSVm3qDhwLIb0xqcpi+EsZKiQVFW
         omO+9A7LyJsaOi+QS6YXGBCYXWcJDS/Ye2/xyzPJQrUesxTRLYbscPYYDUb4O2o6kzvV
         DifQILHSHeEipATfoRXf2HSDFeZLzs9I55HBUWx4JrCPoqxbpoqC+YmtbPZuhdy69rML
         jmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=vQG+p3E49guRSy6mdT3sIzY4I1b16cywP8kgg1ml9js=;
        b=K4QEKeMvCQd9N6wGZds9OP82xAk29KldqSvgqZx/6Kq9bdK/ypkvTw5mWqZ4GmJpja
         nTICXr36jCkImpX42GJU61MZLVTUwwWeT66GTmQ1kQQ+SsG0cbM9korULbAi3HILi1Xr
         Q5DijKQh5mxFxPvGv4IEWc26S74UAPsVXtqGnTwjuIVjaSbUxSdXmDOFyaIE+o7ceCXG
         o8HZsvtBYE1Lor4/s/27aJkVUTv0guDaQFGPUAi5qkbjf4eigB4fseO1MHyjQpHaMju+
         ZG5sYJhZJyqQDRHzXOsnISRTuW1yCWkEJhjofO+96/zMjcqBpuPAzQpq3BtIcnAdOL25
         oEwg==
X-Gm-Message-State: ACrzQf1t4lfn7C9NnfXL8Lp5NrXZf9qPiEslzYlxWHVFxNhM2D0z/0Ay
        GHV77TvKZ9EVdw4TfI0nc97LHsavvLs=
X-Google-Smtp-Source: AMsMyM7NEVjj2qaAfXkoda83nrRNHsiW1Ggivc5P5asXmx4Gi4p+BCKNKzclLTu1ClcmImu/eK9Huqovols=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d86:8b01:88ae:86c1])
 (user=yunkec job=sendgmr) by 2002:a81:6107:0:b0:356:19a5:1e57 with SMTP id
 v7-20020a816107000000b0035619a51e57mr2509129ywb.446.1664520085351; Thu, 29
 Sep 2022 23:41:25 -0700 (PDT)
Date:   Fri, 30 Sep 2022 15:40:53 +0900
In-Reply-To: <20220930064059.3633710-1-yunkec@google.com>
Mime-Version: 1.0
References: <20220930064059.3633710-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20220930064059.3633710-5-yunkec@google.com>
Subject: [PATCH v8 04/10] media: uvcvideo: Split uvc_control_mapping.size to
 v4l2 and data size
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

Rename the existing size to data_size to represent uvc control data size,
add a separate field for v4l2 control size. v4l2 control size will be
used the compound controls.

Also modify the uvc driver documents to clarify the size in
uvc_xu_control_mapping corresponds to the uvc control data size.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v7:
- Newly added patch.

 .../userspace-api/media/drivers/uvcvideo.rst  |  2 +-
 drivers/media/usb/uvc/uvc_ctrl.c              | 78 +++++++++----------
 drivers/media/usb/uvc/uvc_driver.c            |  2 +-
 drivers/media/usb/uvc/uvc_v4l2.c              |  2 +-
 drivers/media/usb/uvc/uvcvideo.h              |  6 +-
 5 files changed, 47 insertions(+), 43 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index a290f9fadae9..aab4304e6bb5 100644
--- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
+++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
@@ -157,7 +157,7 @@ Argument: struct uvc_xu_control_mapping
 	__u8	name[32]	V4L2 control name
 	__u8	entity[16]	UVC extension unit GUID
 	__u8	selector	UVC control selector
-	__u8	size		V4L2 control size (in bits)
+	__u8	size		UVC control data size (in bits)
 	__u8	offset		V4L2 control offset (in bits)
 	enum v4l2_ctrl_type
 		v4l2_type	V4L2 control type
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 9e28203d6cff..989c0fba2a88 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -435,7 +435,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_BRIGHTNESS,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_BRIGHTNESS_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -444,7 +444,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_CONTRAST,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_CONTRAST_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -453,7 +453,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_HUE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_HUE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -464,7 +464,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_SATURATION,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_SATURATION_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -473,7 +473,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_SHARPNESS,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_SHARPNESS_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -482,7 +482,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_GAMMA,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_GAMMA_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -491,7 +491,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_BACKLIGHT_COMPENSATION,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_BACKLIGHT_COMPENSATION_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -500,7 +500,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_GAIN,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_GAIN_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -509,7 +509,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_HUE_AUTO,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_HUE_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -519,7 +519,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_EXPOSURE_AUTO,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_AE_MODE_CONTROL,
-		.size		= 4,
+		.data_size	= 4,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
@@ -531,7 +531,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_EXPOSURE_AUTO_PRIORITY,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_AE_PRIORITY_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -540,7 +540,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_EXPOSURE_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL,
-		.size		= 32,
+		.data_size	= 32,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -551,7 +551,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -561,7 +561,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_WHITE_BALANCE_TEMPERATURE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -572,7 +572,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -583,7 +583,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_BLUE_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -594,7 +594,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_RED_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 16,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -605,7 +605,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_FOCUS_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_FOCUS_ABSOLUTE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -616,7 +616,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_FOCUS_AUTO,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_FOCUS_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -626,7 +626,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_IRIS_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_IRIS_ABSOLUTE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -635,7 +635,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_IRIS_RELATIVE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_IRIS_RELATIVE_CONTROL,
-		.size		= 8,
+		.data_size	= 8,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -644,7 +644,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_ZOOM_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_ABSOLUTE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -653,7 +653,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_ZOOM_CONTINUOUS,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_RELATIVE_CONTROL,
-		.size		= 0,
+		.data_size	= 0,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -664,7 +664,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PAN_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
-		.size		= 32,
+		.data_size	= 32,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -673,7 +673,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_TILT_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
-		.size		= 32,
+		.data_size	= 32,
 		.offset		= 32,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -682,7 +682,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PAN_SPEED,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -693,7 +693,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_TILT_SPEED,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 16,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -704,7 +704,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PRIVACY,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PRIVACY_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -713,7 +713,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PRIVACY,
 		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
 		.selector	= UVC_CT_PRIVACY_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -725,7 +725,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings_uvc11[] = {
 		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-		.size		= 2,
+		.data_size	= 2,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
@@ -739,7 +739,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings_uvc15[] = {
 		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-		.size		= 2,
+		.data_size	= 2,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
@@ -768,7 +768,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
 }
 
 /*
- * Extract the bit string specified by mapping->offset and mapping->size
+ * Extract the bit string specified by mapping->offset and mapping->data_size
  * from the little-endian data stored at 'data' and return the result as
  * a signed 32bit integer. Sign extension will be performed if the mapping
  * references a signed data type.
@@ -776,7 +776,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
 static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 	u8 query, const u8 *data)
 {
-	int bits = mapping->size;
+	int bits = mapping->data_size;
 	int offset = mapping->offset;
 	s32 value = 0;
 	u8 mask;
@@ -799,19 +799,19 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 
 	/* Sign-extend the value if needed. */
 	if (mapping->data_type == UVC_CTRL_DATA_TYPE_SIGNED)
-		value |= -(value & (1 << (mapping->size - 1)));
+		value |= -(value & (1 << (mapping->data_size - 1)));
 
 	return value;
 }
 
 /*
- * Set the bit string specified by mapping->offset and mapping->size
+ * Set the bit string specified by mapping->offset and mapping->data_size
  * in the little-endian data stored at 'data' to the value 'value'.
  */
 static void uvc_set_le_value(struct uvc_control_mapping *mapping,
 	s32 value, u8 *data)
 {
-	int bits = mapping->size;
+	int bits = mapping->data_size;
 	int offset = mapping->offset;
 	u8 mask;
 
@@ -1888,7 +1888,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	 * needs to be loaded from the device to perform the read-modify-write
 	 * operation.
 	 */
-	if ((ctrl->info.size * 8) != mapping->size) {
+	if ((ctrl->info.size * 8) != mapping->data_size) {
 		ret = __uvc_ctrl_load_cur(chain, ctrl);
 		if (ret < 0)
 			return ret;
@@ -2377,8 +2377,8 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	}
 
 	/* Validate the user-provided bit-size and offset */
-	if (mapping->size > 32 ||
-	    mapping->offset + mapping->size > ctrl->info.size * 8) {
+	if (mapping->data_size > 32 ||
+	    mapping->offset + mapping->data_size > ctrl->info.size * 8) {
 		ret = -EINVAL;
 		goto done;
 	}
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 744051b52e12..b02dce9afed4 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2670,7 +2670,7 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
 	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
 	.entity		= UVC_GUID_UVC_PROCESSING,
 	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-	.size		= 2,
+	.data_size	= 2,
 	.offset		= 0,
 	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index d844da6f307c..98ab3d827dec 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -51,7 +51,7 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 	}
 	memcpy(map->entity, xmap->entity, sizeof(map->entity));
 	map->selector = xmap->selector;
-	map->size = xmap->size;
+	map->data_size = xmap->size;
 	map->offset = xmap->offset;
 	map->v4l2_type = xmap->v4l2_type;
 	map->data_type = xmap->data_type;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index dce9e3ca764d..d87b4cad4437 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -249,7 +249,11 @@ struct uvc_control_mapping {
 	u8 entity[16];
 	u8 selector;
 
-	u8 size;
+	/* Size of the v4l2 control. Required for compound controls. */
+	u8 v4l2_size;
+	/* UVC data size. Required for all controls. */
+	u8 data_size;
+
 	u8 offset;
 	enum v4l2_ctrl_type v4l2_type;
 	u32 data_type;
-- 
2.38.0.rc1.362.ged0d419d3c-goog

