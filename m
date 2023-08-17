Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE5B77F116
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348446AbjHQHTB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348437AbjHQHSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 03:18:49 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F6DFE
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:47 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d6861869bcdso6050252276.3
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692256726; x=1692861526;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NImp40Mk+GLPsw8KNCGGtSQrcwWWbmAPIAzN9uxi0o=;
        b=RGxKk9a7oxMBiqeq+zaksezZEqhozf7nsvHWi2YvrvBgG+Dzo5RZqXVZH10vdUT31U
         ygH9vD4MNAiKgQcQhtViXbcpR/F9WocaWSLQIg5VykULMRnhRvBUDv/HBPZ8tDTUwPeQ
         UcgtxkEpcvoP78f+rsth6zn12K7iD8By3gp2+f1pqvpEYFqMD5fYDhu23EXXHzHxizHJ
         jGGp5CdmoHFhVE9mSoTHrPNtI61qHW0F94xEg2WK7WjqWJ4eOycD1wg7GLEvYsaCEdY6
         7H5IJw+BsitK8kcB7kDa1ExuT6g0k7geTbIrjCBi4jQZ00r2BuUKkMX1YgmBIf2gxvZW
         MN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256726; x=1692861526;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+NImp40Mk+GLPsw8KNCGGtSQrcwWWbmAPIAzN9uxi0o=;
        b=jqd+ta9W3coj+WTqT6cNmubl82Sc9c84d9zD2RPt5eMeir8U8+YJkzS581lateCoXE
         UF5rcKxnp82f7BYIGSpfZQfHFBTsnq0GQoEn4igmlpl0iV0zh8mH5ajQDiSgdh9n1qRe
         kmnUANMeU11mF3SXRKL9KHGhjwa3n8JoP93UzvQL5XBKMYlEWiuELHCKF8zYo/E5XxJ0
         yngQSkXeMvlTz6EW1XDdFfWrCG+4PdCYdep+KWyUxKs/fHzj3ffPfrzLhljusnBBgJPJ
         g1tHmB0gdmKhyb03EZqELqRLuKeBQhTzhlFdJCnizxwwCojrwfi7QTo0PHa2asn0PEQi
         W6Ag==
X-Gm-Message-State: AOJu0YwOxKLBaAKJcjGPRlPXECsfvlT1/0AdEAYX0VhrljomUZgRg5SW
        sGiau9mf8sNZbsUvlFcBmmdZHc2KOO8=
X-Google-Smtp-Source: AGHT+IHaI8rhD8C5Embts6jJ0AidVF/YqpCnkAmTxcpmACZdTmjvZL7j0CFK5Rocj1qxpEhUj6SK6Y530S4=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:cb5f:f997:f2a2:88c6])
 (user=yunkec job=sendgmr) by 2002:a25:c044:0:b0:d12:d6e4:a08f with SMTP id
 c65-20020a25c044000000b00d12d6e4a08fmr48248ybf.6.1692256726602; Thu, 17 Aug
 2023 00:18:46 -0700 (PDT)
Date:   Thu, 17 Aug 2023 16:17:37 +0900
In-Reply-To: <20230817071750.2830271-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230817071750.2830271-1-yunkec@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230817071750.2830271-10-yunkec@google.com>
Subject: [PATCH v12 09/11] media: uvcvideo: implement UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement support for ROI as described in UVC 1.5:
4.2.2.1.20 Digital Region of Interest (ROI) Control

ROI control is implemented using V4L2 control API as
two UVC-specific controls:
V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v11:
- No change.
Changelog since v10:
- Moved after the patches adding support for MIN/MAX.
- Clamp the set current value based on MIN/MAX.
- Thanks, Daniel!
Changelog since v9:
- No change.
Changelog since v8:
- No change.
Changelog since v7:
- Fix a few style issues.
- Only allow 4-byte aligned data.
- Add control names.
- Move initialization to 7/10.

 drivers/media/usb/uvc/uvc_ctrl.c   | 137 +++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c   |   5 +-
 drivers/media/usb/uvc/uvcvideo.h   |  12 ++-
 include/uapi/linux/usb/video.h     |   1 +
 include/uapi/linux/uvcvideo.h      |  13 +++
 include/uapi/linux/v4l2-controls.h |   9 ++
 6 files changed, 167 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_c=
trl.c
index 1d8df8551acd..6fe1331961d8 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -358,6 +358,24 @@ static const struct uvc_control_info uvc_ctrls[] =3D {
 		.flags		=3D UVC_CTRL_FLAG_GET_CUR
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	/*
+	 * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get updated
+	 * by sensors.
+	 * "This RoI should be the same as specified in most recent SET_CUR
+	 * except in the case where the =E2=80=98Auto Detect and Track=E2=80=99 a=
nd/or
+	 * =E2=80=98Image Stabilization=E2=80=99 bit have been set."
+	 * 4.2.2.1.20 Digital Region of Interest (ROI) Control
+	 */
+	{
+		.entity		=3D UVC_GUID_UVC_CAMERA,
+		.selector	=3D UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.index		=3D 21,
+		.size		=3D 10,
+		.flags		=3D UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_CUR
+				| UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
+				| UVC_CTRL_FLAG_GET_DEF
+				| UVC_CTRL_FLAG_AUTO_UPDATE,
+	},
 };
=20
 static const u32 uvc_control_classes[] =3D {
@@ -459,6 +477,70 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_=
mapping *mapping,
 	data[first+1] =3D min_t(int, abs(value), 0xff);
 }
=20
+static int uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
+			    const struct uvc_rect *uvc_rect)
+{
+	if (uvc_rect->bottom < uvc_rect->top ||
+	    uvc_rect->right < uvc_rect->left)
+		return -EINVAL;
+
+	v4l2_rect->top =3D uvc_rect->top;
+	v4l2_rect->left =3D uvc_rect->left;
+	v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
+	v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
+	return 0;
+}
+
+static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
+			    const struct v4l2_rect *min_rect,
+			    const struct v4l2_rect *max_rect,
+			    struct v4l2_rect *v4l2_rect)
+{
+	v4l2_rect->left =3D clamp_t(s32, v4l2_rect->left, 0, max_rect->width);
+	v4l2_rect->top =3D clamp_t(s32, v4l2_rect->top, 0, max_rect->height);
+	v4l2_rect->height =3D clamp_t(s32, v4l2_rect->height,
+				    min_rect->height, max_rect->height);
+	v4l2_rect->width =3D clamp_t(s32, v4l2_rect->width,
+				   min_rect->width, max_rect->width);
+
+	uvc_rect->top =3D v4l2_rect->top;
+	uvc_rect->left =3D v4l2_rect->left;
+	uvc_rect->bottom =3D v4l2_rect->height + v4l2_rect->top - 1;
+	uvc_rect->right =3D v4l2_rect->width + v4l2_rect->left - 1;
+	return 0;
+}
+
+static int uvc_get_compound_rect(struct uvc_control_mapping *mapping,
+				 const u8 *data, u8 *data_out)
+{
+	struct uvc_rect *uvc_rect;
+
+	uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
+	return uvc_to_v4l2_rect((struct v4l2_rect *)data_out, uvc_rect);
+}
+
+static int uvc_set_compound_rect(struct uvc_control_mapping *mapping,
+				 const u8 *data_in, const u8 *data_min,
+				 const u8 *data_max, u8 *data)
+{
+	struct uvc_rect *uvc_rect;
+	struct v4l2_rect min_rect, max_rect;
+	int ret;
+
+	uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
+
+	ret =3D uvc_get_compound_rect(mapping, data_min, (u8 *)&min_rect);
+	if (ret)
+		return ret;
+
+	ret =3D uvc_get_compound_rect(mapping, data_max, (u8 *)&max_rect);
+	if (ret)
+		return ret;
+
+	return v4l2_to_uvc_rect(uvc_rect, &min_rect, &max_rect,
+				(struct v4l2_rect *)data_in);
+}
+
 static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
 	{
 		.id		=3D V4L2_CID_BRIGHTNESS,
@@ -748,6 +830,29 @@ static const struct uvc_control_mapping uvc_ctrl_mappi=
ngs[] =3D {
 		.v4l2_type	=3D V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	=3D UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
+	{
+		.id		=3D V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
+		.entity		=3D UVC_GUID_UVC_CAMERA,
+		.selector	=3D UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.v4l2_size	=3D sizeof(struct v4l2_rect) * 8,
+		.data_size	=3D sizeof(struct uvc_rect) * 8,
+		.offset		=3D 0,
+		.v4l2_type	=3D V4L2_CTRL_TYPE_RECT,
+		.data_type	=3D UVC_CTRL_DATA_TYPE_RECT,
+		.get_compound	=3D uvc_get_compound_rect,
+		.set_compound	=3D uvc_set_compound_rect,
+		.name		=3D "Region Of Interest Rectangle",
+	},
+	{
+		.id		=3D V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
+		.entity		=3D UVC_GUID_UVC_CAMERA,
+		.selector	=3D UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.data_size	=3D 16,
+		.offset		=3D 64,
+		.v4l2_type	=3D V4L2_CTRL_TYPE_BITMASK,
+		.data_type	=3D UVC_CTRL_DATA_TYPE_BITMASK,
+		.name		=3D "Region Of Interest Auto Controls",
+	},
 };
=20
 const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited =3D {
@@ -900,12 +1005,12 @@ static int uvc_get_compound(struct uvc_control_mappi=
ng *mapping, const u8 *data,
  * and mapping->data_size stored at 'data'.
  */
 static int uvc_set_compound(struct uvc_control_mapping *mapping,
-			    const u8 *data_in, u8 *data)
+			    const u8 *data_in, const u8 *data_min,
+			    const u8 *data_max, u8 *data)
 {
 	memcpy(data + mapping->offset / 8, data_in, mapping->data_size / 8);
 	return 0;
 }
-
 static bool
 uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
 {
@@ -2097,6 +2202,8 @@ static int __uvc_ctrl_set_compound(struct uvc_control=
_mapping *mapping,
 		goto out;
=20
 	ret =3D mapping->set_compound(mapping, data,
+			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN),
+			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX),
 			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
=20
 	__uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT, xctrl);
@@ -2221,6 +2328,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	}
=20
 	if (uvc_ctrl_mapping_is_compound(mapping)) {
+		/* Populates min/max value cache for clamping. */
+		if (!ctrl->cached) {
+			ret =3D uvc_ctrl_populate_cache(chain, ctrl);
+			if (ret < 0)
+				return ret;
+		}
+
 		ret =3D __uvc_ctrl_set_compound(mapping, xctrl, ctrl);
 		if (ret < 0)
 			return ret;
@@ -2638,12 +2752,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_=
chain *chain,
 	}
=20
 	if (uvc_ctrl_mapping_is_compound(map)) {
-		if (map->data_size !=3D map->v4l2_size)
-			return -EINVAL;
+		switch (map->v4l2_type) {
+		case V4L2_CTRL_TYPE_RECT:
+			/* Only supports 4 bytes-aligned data. */
+			if (WARN_ON(map->offset % 32))
+				return -EINVAL;
+			break;
+		default:
+			if (WARN_ON(map->data_size !=3D map->v4l2_size))
+				return -EINVAL;
+
+			/* Only supports byte-aligned data. */
+			if (WARN_ON(map->offset % 8 || map->data_size % 8))
+				return -EINVAL;
+		}
=20
-		/* Only supports byte-aligned data. */
-		if (WARN_ON(map->offset % 8 || map->data_size % 8))
-			return -EINVAL;
 	}
=20
 	if (!map->get && !uvc_ctrl_mapping_is_compound(map))
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v=
4l2.c
index 06aa819a6f75..47024a837e25 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1053,7 +1053,10 @@ static int uvc_ioctl_query_ext_ctrl(struct file *fil=
e, void *fh,
 	qec->step =3D qc.step;
 	qec->default_value =3D qc.default_value;
 	qec->flags =3D qc.flags;
-	qec->elem_size =3D 4;
+	if (qc.type =3D=3D V4L2_CTRL_TYPE_RECT)
+		qec->elem_size =3D sizeof(struct v4l2_rect);
+	else
+		qec->elem_size =3D 4;
 	qec->elems =3D 1;
 	qec->nr_of_dims =3D 0;
 	memset(qec->dims, 0, sizeof(qec->dims));
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvi=
deo.h
index 6fda40919e7f..18da5e0b8cb2 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -133,8 +133,9 @@ struct uvc_control_mapping {
 			    u8 *data_out);
 	void (*set)(struct uvc_control_mapping *mapping, s32 value,
 		    u8 *data);
-	int (*set_compound)(struct uvc_control_mapping *mapping, const u8 *data_i=
n,
-			    u8 *data);
+	int (*set_compound)(struct uvc_control_mapping *mapping,
+			    const u8 *data_in, const u8 *data_min,
+			    const u8 *data_max, u8 *data);
 };
=20
 struct uvc_control {
@@ -289,6 +290,13 @@ struct uvc_streaming_header {
 	u8 bTriggerUsage;
 };
=20
+struct uvc_rect {
+	u16 top;
+	u16 left;
+	u16 bottom;
+	u16 right;
+} __packed;
+
 enum uvc_buffer_state {
 	UVC_BUF_STATE_IDLE	=3D 0,
 	UVC_BUF_STATE_QUEUED	=3D 1,
diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.=
h
index 2ff0e8a3a683..2afb4420e6c4 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -104,6 +104,7 @@
 #define UVC_CT_ROLL_ABSOLUTE_CONTROL			0x0f
 #define UVC_CT_ROLL_RELATIVE_CONTROL			0x10
 #define UVC_CT_PRIVACY_CONTROL				0x11
+#define UVC_CT_REGION_OF_INTEREST_CONTROL		0x14
=20
 /* A.9.5. Processing Unit Control Selectors */
 #define UVC_PU_CONTROL_UNDEFINED			0x00
diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
index f86185456dc5..9d1e6085feba 100644
--- a/include/uapi/linux/uvcvideo.h
+++ b/include/uapi/linux/uvcvideo.h
@@ -16,6 +16,7 @@
 #define UVC_CTRL_DATA_TYPE_BOOLEAN	3
 #define UVC_CTRL_DATA_TYPE_ENUM		4
 #define UVC_CTRL_DATA_TYPE_BITMASK	5
+#define UVC_CTRL_DATA_TYPE_RECT		6
=20
 /* Control flags */
 #define UVC_CTRL_FLAG_SET_CUR		(1 << 0)
@@ -38,6 +39,18 @@
=20
 #define UVC_MENU_NAME_LEN 32
=20
+/* V4L2 driver-specific controls */
+#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT	(V4L2_CID_CAMERA_UVC_BASE + 1=
)
+#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_UVC_BASE + 2=
)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE		(1 << 0)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK	(1 << 5)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION	(1 << 6)
+#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY		(1 << 7)
+
 struct uvc_menu_info {
 	__u32 value;
 	__u8 name[UVC_MENU_NAME_LEN];
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-c=
ontrols.h
index c3604a0a3e30..01ab88bd89a7 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1075,6 +1075,15 @@ enum v4l2_auto_focus_range {
=20
 #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
=20
+/* CAMERA-class private control IDs */
+
+/*
+ * The base for the uvc driver controls.
+ * See linux/uvcvideo.h for the list of controls.
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_CAMERA_UVC_BASE		(V4L2_CID_CAMERA_CLASS_BASE + 0x1000)
+
 /* FM Modulator class control IDs */
=20
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
--=20
2.41.0.694.ge786442a9b-goog

