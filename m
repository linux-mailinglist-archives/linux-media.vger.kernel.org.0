Return-Path: <linux-media+bounces-1455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F480049A
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 08:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0EFA1C20EC9
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 07:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C09A13AF7;
	Fri,  1 Dec 2023 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rZ+SXTBu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3357B103
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:19:58 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-db54e86b2d1so205425276.1
        for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701415197; x=1702019997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnC55j+2LSbKGG8iXAGN+owNCJKesrfIiBR6W6fgqdU=;
        b=rZ+SXTBunuFMfOFLbqSZVBkzMaMzRPkMHcQrX5Dfg3QoKpP097Bc3rQ2CmAwTrOf1n
         7Rbyp7ApyMEwUXIQlRWcw61w3GFX31A8st2Nht0Kx+x5/FcyJGCHEL6FL3f2lODJsUxF
         rJG68z+KW15Y/i52wpp3g5gwG+k4xrEyuqZhorvfBGgemEikmSbF2F3Se1MeOojhO9Cn
         5GiIDW9JFklCMnU2JCWb+VmwLdMTMISEFSh3v4jKMspBreXwrXa5CRpcucxWSgYgKP+9
         r3PldPMIwo5hboAiAnTsYyRSlP1EdmuLb1k1OvTe3rqYNByuzBEBtsoeQ8gALejurCna
         mtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415197; x=1702019997;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AnC55j+2LSbKGG8iXAGN+owNCJKesrfIiBR6W6fgqdU=;
        b=feMx/kMVChQjfAEyD1vplTvgQrtTKnaMOrsmU5EFh1l4TyC7fRgkHheTAeScAsGRMZ
         RFqGHXcYwNrQ7yVvN6wh23S1ZDsDjJrKdPeeGQtQvw6Ko0egWxZXTy2bi0bLzBsbFHtS
         jX215CuyoFpBOExR2wSLefZWwU8ipRGsgPDAi47UEqJRnGKy4p8N8Ul7qqCF1ZoaLuqK
         Hutc/paNNw1/yjzsnf3Cm3/VfOe7DL/pyBH9HpYn4Oxhj6rCMiDhSK8P8HlXBwAS2nTG
         o2FddbNlxzq2mKViqUqV4kXuM4Mq+GJveSo6EdTG1b5BjEwV2gQfXe3yk9p7cv4UGxne
         ChDA==
X-Gm-Message-State: AOJu0YyFVVWFOWnxzo6J++g6bIjJzfie0KJbMsZavJu4OtG3RMhHTLyJ
	A6a138VOUNhvykY7CFo/zwiAcu1GzQQ=
X-Google-Smtp-Source: AGHT+IHE+/BRETHNhBMBircantO37ONYaSBn8DAgnqjnZXSaZIzJEtP4R0Bfi6U1b0DMguMTnx76svR4wL0=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:ea68:7c7a:2356:8a4a])
 (user=yunkec job=sendgmr) by 2002:a25:dd07:0:b0:daf:3e84:d016 with SMTP id
 u7-20020a25dd07000000b00daf3e84d016mr927823ybg.2.1701415197409; Thu, 30 Nov
 2023 23:19:57 -0800 (PST)
Date: Fri,  1 Dec 2023 16:19:00 +0900
In-Reply-To: <20231201071907.3080126-1-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231201071907.3080126-1-yunkec@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201071907.3080126-10-yunkec@google.com>
Subject: [PATCH v14 09/11] media: uvcvideo: implement UVC v1.5 ROI
From: Yunke Cao <yunkec@google.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
index c073c2a02102..d405b2a9d477 100644
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
@@ -2100,6 +2205,8 @@ static int __uvc_ctrl_set_compound(struct uvc_control=
_mapping *mapping,
 		goto out;
=20
 	ret =3D mapping->set_compound(mapping, data,
+			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN),
+			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX),
 			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
=20
 	__uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT, xctrl);
@@ -2224,6 +2331,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
@@ -2641,12 +2755,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_=
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
index 352f62ef02f2..c0a7c0091099 100644
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
index 68db66d4aae8..6c7e03d18d79 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1081,6 +1081,15 @@ enum v4l2_auto_focus_range {
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
2.43.0.rc2.451.g8631bc7472-goog


