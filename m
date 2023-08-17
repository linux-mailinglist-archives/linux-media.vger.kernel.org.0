Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDBB77F10F
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348432AbjHQHS0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348437AbjHQHSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 03:18:22 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE8FFE
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:20 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58c8cbf0a0dso12515777b3.1
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692256700; x=1692861500;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CWbjQYyOPR/xIx3cv2/RxYcbcO3Yixp3KZZGKISEQ04=;
        b=4oIV7MUU91GiHZHO4mdvymEiw2cBxNNHufziIqBa7wX7a0L3ZeKmtcIeo1rQJTgVEP
         lEqw8sSeMO2haDM22zB2rzhsLo3M+7U26RtQkG93Jk+gQ0l3W2IIVujk+BEheUCaYRrA
         jk8atnAFZafOB+aT8iA55h/QSZ8bl8uyI67nyV4upCotFLWAbJ1mZ2GuyF6N5/ksrsLW
         eLkOaouyaIJF1zfkKbqJBStcKNtFDyygboxFxtQal37M/fvMJ2yWISXEdaBDddCwYrMV
         it9bH9pw//Bn2AnJYwLlIfMSMu4vfU+xeLmlL8Q6dlHhhRWqqNuDuSd/rZQJxE0usMit
         TIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256700; x=1692861500;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWbjQYyOPR/xIx3cv2/RxYcbcO3Yixp3KZZGKISEQ04=;
        b=gUZW30miFZLnCJeTEnpwFkwXLv/bcboEIwHghvFtJPwXsX5aJ59JSZnLxNnFMQAFR+
         F3Y4xnjounhMzAfFQiY43DsTgb+vFjhw6U1R94mm3noBFtml+/Fijci6Xshq+aOAHNQI
         fTcTuDq7K/tSkChZc1GYag4PK/W0b3M93aSfbl7I9qqAWYxZ1mX59jp7r1hcy/6tS7hB
         qYgnNQzdYJjJBS466v2lLPB/TnJsood7E8OUmzVo8dXlyxpuMvqDeUOvV2p/yjhHiQTv
         /PWG8qYl/9tagtOkVhSk9D6Gc1JH3Pydoqo8gFjPCA7nLEcwjAkbxZXJOr48LcFpFVxY
         p0XA==
X-Gm-Message-State: AOJu0Yy9rJPqqxKEdXXBAj5chFudbWVVH0WIUUysHLDk3A9QsMg368x6
        PE8DfqvIeXCyWoNc95Mi/XnhD4U4w7g=
X-Google-Smtp-Source: AGHT+IEewpwW61TwdUHHCprwPGs9dODHoxh4LXLj4EtDyxOElzuiUKDlz02hvGP+GE3TjfLsLjxJGybj9Sk=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:cb5f:f997:f2a2:88c6])
 (user=yunkec job=sendgmr) by 2002:a05:690c:460a:b0:58c:bab1:cd23 with SMTP id
 gw10-20020a05690c460a00b0058cbab1cd23mr29431ywb.2.1692256699787; Thu, 17 Aug
 2023 00:18:19 -0700 (PDT)
Date:   Thu, 17 Aug 2023 16:17:32 +0900
In-Reply-To: <20230817071750.2830271-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230817071750.2830271-1-yunkec@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230817071750.2830271-5-yunkec@google.com>
Subject: [PATCH v12 04/11] media: uvcvideo: Split uvc_control_mapping.size to
 v4l2 and data size
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

Rename the existing size to data_size to represent uvc control data size,
add a separate field for v4l2 control size. v4l2 control size will be
used the compound controls.

Also modify the uvc driver documents to clarify the size in
uvc_xu_control_mapping corresponds to the uvc control data size.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v11:
- No change.
Changelog since v10:
- Added Reviewed-by from Daniel Scally.
Changelog since v9:
- No change.
Changelog since v8:
- No change.
Changelog since v7:
- Newly added patch.

 .../userspace-api/media/drivers/uvcvideo.rst  |  2 +-
 drivers/media/usb/uvc/uvc_ctrl.c              | 80 +++++++++----------
 drivers/media/usb/uvc/uvc_v4l2.c              |  2 +-
 drivers/media/usb/uvc/uvcvideo.h              |  6 +-
 4 files changed, 47 insertions(+), 43 deletions(-)

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
index b73a7e3812cf..fe1245ccea15 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -464,7 +464,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_BRIGHTNESS,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_BRIGHTNESS_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -473,7 +473,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_CONTRAST,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_CONTRAST_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -482,7 +482,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_HUE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_HUE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -493,7 +493,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_SATURATION,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_SATURATION_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -502,7 +502,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_SHARPNESS,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_SHARPNESS_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -511,7 +511,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_GAMMA,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_GAMMA_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -520,7 +520,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_BACKLIGHT_COMPENSATION,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_BACKLIGHT_COMPENSATION_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -529,7 +529,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_GAIN,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_GAIN_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -538,7 +538,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_HUE_AUTO,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_HUE_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -548,7 +548,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_EXPOSURE_AUTO,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_AE_MODE_CONTROL,
-		.size		= 4,
+		.data_size	= 4,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
@@ -561,7 +561,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_EXPOSURE_AUTO_PRIORITY,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_AE_PRIORITY_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -570,7 +570,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_EXPOSURE_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL,
-		.size		= 32,
+		.data_size	= 32,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -581,7 +581,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -591,7 +591,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_WHITE_BALANCE_TEMPERATURE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_TEMPERATURE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -602,7 +602,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_AUTO_WHITE_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -613,7 +613,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_BLUE_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -624,7 +624,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_RED_BALANCE,
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_WHITE_BALANCE_COMPONENT_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 16,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -635,7 +635,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_FOCUS_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_FOCUS_ABSOLUTE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -646,7 +646,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_FOCUS_AUTO,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_FOCUS_AUTO_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -656,7 +656,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_IRIS_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_IRIS_ABSOLUTE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -665,7 +665,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_IRIS_RELATIVE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_IRIS_RELATIVE_CONTROL,
-		.size		= 8,
+		.data_size	= 8,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -674,7 +674,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_ZOOM_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_ABSOLUTE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
@@ -683,7 +683,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_ZOOM_CONTINUOUS,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_RELATIVE_CONTROL,
-		.size		= 0,
+		.data_size	= 0,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -694,7 +694,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PAN_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
-		.size		= 32,
+		.data_size	= 32,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -703,7 +703,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_TILT_ABSOLUTE,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_ABSOLUTE_CONTROL,
-		.size		= 32,
+		.data_size	= 32,
 		.offset		= 32,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -712,7 +712,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PAN_SPEED,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -723,7 +723,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_TILT_SPEED,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PANTILT_RELATIVE_CONTROL,
-		.size		= 16,
+		.data_size	= 16,
 		.offset		= 16,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -734,7 +734,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PRIVACY,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_PRIVACY_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -743,7 +743,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_PRIVACY,
 		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
 		.selector	= UVC_CT_PRIVACY_CONTROL,
-		.size		= 1,
+		.data_size	= 1,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
@@ -754,7 +754,7 @@ const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
 	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
 	.entity		= UVC_GUID_UVC_PROCESSING,
 	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-	.size		= 2,
+	.data_size	= 2,
 	.offset		= 0,
 	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
@@ -766,7 +766,7 @@ const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
 	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
 	.entity		= UVC_GUID_UVC_PROCESSING,
 	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-	.size		= 2,
+	.data_size	= 2,
 	.offset		= 0,
 	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
@@ -783,7 +783,7 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
 	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
 	.entity		= UVC_GUID_UVC_PROCESSING,
 	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-	.size		= 2,
+	.data_size	= 2,
 	.offset		= 0,
 	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
 	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
@@ -816,7 +816,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
 }
 
 /*
- * Extract the bit string specified by mapping->offset and mapping->size
+ * Extract the bit string specified by mapping->offset and mapping->data_size
  * from the little-endian data stored at 'data' and return the result as
  * a signed 32bit integer. Sign extension will be performed if the mapping
  * references a signed data type.
@@ -824,7 +824,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
 static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 	u8 query, const u8 *data)
 {
-	int bits = mapping->size;
+	int bits = mapping->data_size;
 	int offset = mapping->offset;
 	s32 value = 0;
 	u8 mask;
@@ -847,19 +847,19 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 
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
 
@@ -2036,7 +2036,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	 * needs to be loaded from the device to perform the read-modify-write
 	 * operation.
 	 */
-	if ((ctrl->info.size * 8) != mapping->size) {
+	if ((ctrl->info.size * 8) != mapping->data_size) {
 		ret = __uvc_ctrl_load_cur(chain, ctrl);
 		if (ret < 0)
 			return ret;
@@ -2543,8 +2543,8 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	}
 
 	/* Validate the user-provided bit-size and offset */
-	if (mapping->size > 32 ||
-	    mapping->offset + mapping->size > ctrl->info.size * 8) {
+	if (mapping->data_size > 32 ||
+	    mapping->offset + mapping->data_size > ctrl->info.size * 8) {
 		ret = -EINVAL;
 		goto done;
 	}
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 656cf0fbf7a3..dee3151ff6c4 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -122,7 +122,7 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 	}
 	memcpy(map->entity, xmap->entity, sizeof(map->entity));
 	map->selector = xmap->selector;
-	map->size = xmap->size;
+	map->data_size = xmap->size;
 	map->offset = xmap->offset;
 	map->v4l2_type = xmap->v4l2_type;
 	map->data_type = xmap->data_type;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5091085fcfb0..7bc41270ed94 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -110,7 +110,11 @@ struct uvc_control_mapping {
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
2.41.0.694.ge786442a9b-goog

