Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E52A7BF0CF
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 04:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441871AbjJJCWe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 22:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441877AbjJJCWc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 22:22:32 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F408DAF
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 19:22:29 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9a3a98b34dso1181072276.3
        for <linux-media@vger.kernel.org>; Mon, 09 Oct 2023 19:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696904549; x=1697509349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADa9vJnwOE1d8IiN1GZrKGiha0yuHsQ8zR0tF4h9Dls=;
        b=DHRHlaMEGfF7Z6lX9n9uRZTSjIhSGg0MxUtVvnNgQr1XAaiHHCxAXryrlxx7va7ovX
         3rhiGD00jA+geO/GssOKoDOhsl5RWeSSJs4IlspPivuih2+KsZ4vfk/lfrsZh0Yiv+jZ
         VQGD/HNb03q+KkbEkyNOHGAd6TV+caEMZRyYhR0rtHJ5tsgGuNLOKZHMnj/nGvuYQUw+
         YQfe7NVjRXA3JbN5WljFV2NZWEjGdcTRePDiKeWQAbLysHg4Svl0ZRLwHyuv0zLij5jI
         oE30FVW6hpA+3pf1TFZh7416UgLVn5m4XsPEfYjsF3NaFxArsrr5lwcpkRpOUtwxHXzA
         3G2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696904549; x=1697509349;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ADa9vJnwOE1d8IiN1GZrKGiha0yuHsQ8zR0tF4h9Dls=;
        b=imVeN8nKEksAQPOpu8KPpmL915ysOG91Z8YmVtoUORi7fudtN9dKjORHfuMWHKRGU9
         CGvFTXGKFBhOI/eoryOz/lsx711lwRd0obpZMQeYgsUUPfScA9fs7Iqc5bOxKbgpofvv
         bfm4S0UESzp/ajn2ivtOlrUG2NnQWU1H7vbPWepB996X7LzVcjSUI6LZ1XBBQKv9uxdz
         Q9WCrN/+di+Q6bGx8C+8t1ICDkcf4tPsgUsiWcLg5nFyh5jC8hwmYFALc9QOuQ76B2vz
         0xnEI2+hAzTFjf8Vypx+bdK4oKJODQs6KvD69YIqByLx0N2cAIRrjySK7euuf/qW/PZj
         HdTQ==
X-Gm-Message-State: AOJu0YzPj48gvEj019HsZx2MGPIP7RGAYdHqnHne4j80HG6p/TmJmBPb
        Vt7S9CGwpBby7IJYswDeRf6FpfcynKM=
X-Google-Smtp-Source: AGHT+IFTvODmtiQa/PQ+5twWrqOoh15oO4SjvS22HKzONoyRKV4ywtsQ3FRXAXoRrolZiwPSVCG87aAao4s=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7303:2d54:5b83:e60b])
 (user=yunkec job=sendgmr) by 2002:a25:ad16:0:b0:d9a:521f:c442 with SMTP id
 y22-20020a25ad16000000b00d9a521fc442mr16373ybi.5.1696904549174; Mon, 09 Oct
 2023 19:22:29 -0700 (PDT)
Date:   Tue, 10 Oct 2023 11:21:32 +0900
In-Reply-To: <20231010022136.1504015-1-yunkec@google.com>
Mime-Version: 1.0
References: <20231010022136.1504015-1-yunkec@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231010022136.1504015-10-yunkec@google.com>
Subject: [PATCH v13 09/11] media: uvcvideo: implement UVC v1.5 ROI
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
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
2.42.0.609.gbb76f46606-goog

