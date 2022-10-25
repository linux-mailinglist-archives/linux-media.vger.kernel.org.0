Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACB960C387
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 07:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbiJYF4A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 01:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbiJYFz6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 01:55:58 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B9B52084
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:55:56 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-3691846091fso108592087b3.9
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HQnPv7+EaiL5Cc8HI8WCoWz3xx2ejfpWom3dlENssUA=;
        b=WKu5DZrOj+WhadQkndovryoHiRrA/UBe4/VKDQQJcymCVh6mwe7XPCbm2CWqe/H4ZH
         HonFpuqW/Caq+UZKIUWju4wFq8nzAWOuh9GY4wGsRv/oJy/IY+wnzyHDKSe1XiXD2t6y
         RnxOUb0rHy4QqJLrwoJzhCvCRUJiIOWopaOKecyOzA2LX7eCvtltBbnjuq6a7iiBTLeg
         HTkSM6riRXovooJHLShpK61Yx/Hgwi856gEr0gEnetk5LAvbS725LolYVwwIaVJnSWMj
         jF1uCZ/OQFrhz93/GxyzoUi8P+dOfGdGUzml46ZHbuT7/+9oiful4CmJV6MGQjdMDdXK
         D8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQnPv7+EaiL5Cc8HI8WCoWz3xx2ejfpWom3dlENssUA=;
        b=vBLaC7NOw6rRECy5AjITVYWKY/Fyew2JnB8l5aLX92Mhk926jBtQgAyh3pPX5sVKIL
         vKFw18MW9jUkwdJnh8TozM2A2RSIo8+SaK/ruYtDx7xdHD9si4rmJ7XIsZalGCsKCKGz
         poeSdrftFp9XmtVT0bdAvFQRViycWHM0dtoUwdao3z7XfpKfp0PH137Apmxe3hpeaduE
         rqFoAYe32/C/db8rSSB1tIf2PaZaX0zLaEKEZim1r3TfQv4l3GwNOfRVhMCE1f3MxH7L
         C6iMrEcTrclIQu+GojQDcCMoR8smPid4SJt5e0K3ttNyWFOmpnKMu3y5JXBREahePi65
         7i/w==
X-Gm-Message-State: ACrzQf0E79GXVC3bdjjTvdIB+xBoAay0NCvXnUkkCxIBDgSOAqcKTQwC
        M9dcmxMO0q65MSKecoZ3SKp8QgK6Tw8=
X-Google-Smtp-Source: AMsMyM6mU1FAzcBTEBVMHL41v/xsTpg3STrgBEw8+kii4G+U1vHxMd9QK3fHgjPiC6geZEFwQGBE7rLd34w=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7ee8:fa64:12b0:14f3])
 (user=yunkec job=sendgmr) by 2002:a25:9d84:0:b0:6bd:2acd:61c0 with SMTP id
 v4-20020a259d84000000b006bd2acd61c0mr32585336ybp.556.1666677355518; Mon, 24
 Oct 2022 22:55:55 -0700 (PDT)
Date:   Tue, 25 Oct 2022 14:55:21 +0900
In-Reply-To: <20221025055528.1117251-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221025055528.1117251-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221025055528.1117251-5-yunkec@google.com>
Subject: [PATCH v9 04/11] media: uvcvideo: Split uvc_control_mapping.size to
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
Changelog since v8:
- Newly added patch.
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
index 40c5d01364d9..020303e2593b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -436,7 +436,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_BRIGHTNESS,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_BRIGHTNESS_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -445,7 +445,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_CONTRAST,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_CONTRAST_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -454,7 +454,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_HUE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_HUE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -465,7 +465,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_SATURATION,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_SATURATION_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -474,7 +474,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_SHARPNESS,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_SHARPNESS_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -483,7 +483,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_GAMMA,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_GAMMA_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -492,7 +492,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_BACKLIGHT_COMPENSATION,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_BACKLIGHT_COMPENSATION_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -501,7 +501,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_GAIN,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_GAIN_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -510,7 +510,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_HUE_AUTO,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_HUE_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -520,7 +520,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_EXPOSURE_AUTO,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_AE_MODE_CONTROL,
-		.size		= 4,
+		.data_size	= 4,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
@@ -532,7 +532,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_EXPOSURE_AUTO_PRIORITY,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_AE_PRIORITY_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -541,7 +541,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_EXPOSURE_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL,
-		.size		= 32,
+		.data_size	= 32,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -552,7 +552,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -562,7 +562,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_WHITE_BALANCE_TEMPERATURE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -573,7 +573,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -584,7 +584,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_BLUE_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -595,7 +595,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_RED_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 16,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -606,7 +606,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_FOCUS_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_FOCUS_ABSOLUTE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -617,7 +617,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_FOCUS_AUTO,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_FOCUS_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -627,7 +627,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_IRIS_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_IRIS_ABSOLUTE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -636,7 +636,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_IRIS_RELATIVE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_IRIS_RELATIVE_CONTROL,
-		.size		= 8,
+		.data_size	= 8,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -645,7 +645,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_ZOOM_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_ABSOLUTE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -654,7 +654,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_ZOOM_CONTINUOUS,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_RELATIVE_CONTROL,
-		.size		= 0,
+		.data_size	= 0,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -665,7 +665,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PAN_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
-		.size		= 32,
+		.data_size	= 32,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -674,7 +674,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_TILT_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
-		.size		= 32,
+		.data_size	= 32,
 		.offset		= 32,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -683,7 +683,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PAN_SPEED,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -694,7 +694,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_TILT_SPEED,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 16,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -705,7 +705,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PRIVACY,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PRIVACY_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -714,7 +714,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PRIVACY,
 		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
 		.selector	= UVC_CT_PRIVACY_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -726,7 +726,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings_uvc11[] = {
 		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-		.size		= 2,
+		.data_size	= 2,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
@@ -740,7 +740,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings_uvc15[] = {
 		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-		.size		= 2,
+		.data_size	= 2,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
@@ -769,7 +769,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
 }
 
 /*
- * Extract the bit string specified by mapping->offset and mapping->size
+ * Extract the bit string specified by mapping->offset and mapping->data_size
  * from the little-endian data stored at 'data' and return the result as
  * a signed 32bit integer. Sign extension will be performed if the mapping
  * references a signed data type.
@@ -777,7 +777,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
 static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 	u8 query, const u8 *data)
 {
-	int bits = mapping->size;
+	int bits = mapping->data_size;
 	int offset = mapping->offset;
 	s32 value = 0;
 	u8 mask;
@@ -800,19 +800,19 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 
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
 
@@ -1889,7 +1889,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	 * needs to be loaded from the device to perform the read-modify-write
 	 * operation.
 	 */
-	if ((ctrl->info.size * 8) != mapping->size) {
+	if ((ctrl->info.size * 8) != mapping->data_size) {
 		ret = __uvc_ctrl_load_cur(chain, ctrl);
 		if (ret < 0)
 			return ret;
@@ -2378,8 +2378,8 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
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
index 215fb483efb0..06317843c486 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2382,7 +2382,7 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
 	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
 	.entity		= UVC_GUID_UVC_PROCESSING,
 	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-	.size		= 2,
+	.data_size	= 2,
 	.offset		= 0,
 	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index e807e348aa41..36ff1d0d6edb 100644
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
index b2ee3d59a4c8..8f7938205a63 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -111,7 +111,11 @@ struct uvc_control_mapping {
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
2.38.0.135.g90850a2211-goog

