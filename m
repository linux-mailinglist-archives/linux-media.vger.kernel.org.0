Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34DE363E7E7
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 03:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiLACcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 21:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiLACcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 21:32:45 -0500
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65CD71DA44
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:44 -0800 (PST)
Received: by mail-pj1-x1049.google.com with SMTP id n9-20020a17090a2bc900b0021010dca313so546429pje.7
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omzWAVFnGLs6f8LgfIrS97JhzhckvG8A7GkfuEet0cE=;
        b=I/WUGHfKeK//nlxZU4Z2/licmqLe9kGR795jnMPcW+i4pAHMYx2Ajhtyrjp4wMGNTV
         5xHDVP5WtzQ6Mv4O1p6Bq761ouhqKf25qtlk2WxijTWI+sXD+GMtpleZfPm/2bAYV1E4
         nGUEKeuXnz/P4QGvQUhOUMpDw2sY3QAstKdJ+gc92/BfPNJ5Q9TvYtvz2a7jWtOmHnzy
         8bSN5OfD58ZrD4DBRWYzkLNhxvEepFDR5F7LToN1JMWzgOczw6OqxDYMpwHG/yLof8Sd
         ruxOyfHXhymcbwOfCJrejndcH7SqbJXhJfJNx81usGoEgMPftTTViKW6W0fNCMoWq63a
         rJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=omzWAVFnGLs6f8LgfIrS97JhzhckvG8A7GkfuEet0cE=;
        b=P7p0NX/DUj2/tc/ZBOX/3z5NgCdJzooFoMHF5/vvrsok9zxNTMn4QPDDFmHG2sXF8Y
         i46edS9WIU9v8mXx1oB4CS7x0tpZE/hwf6U4RNNPdOEZH0xCijqPccgDAy4TbGvJ+zax
         pCpQOWWyeAb23KeLIS1MGU9+/TFRR/2Gw/MBIHB8fikWUw170v/kR6pRfvkosML4LgY3
         mluTmFmsp4m59HsiSNv919coCkx6SPsp8iKcRKOUawLBfQ07ODggeXAiYpQyG4TX0ylL
         gEU0UlLH/HU6QlviZG6/xYX+qOItp96N8gbQhF7+68wHasM36q7+ZjXNutRJttnyQbcu
         68Iw==
X-Gm-Message-State: ANoB5pkdS/tXDH2UZDIgFlUD9GPDILkmkc/mvgYURLRdDtlxHJahe8A5
        RS0OK7ME2S45htus4S3YBRFfnacSNUE=
X-Google-Smtp-Source: AA0mqf6KGT92CsJDG85UrfU/R1EvGKd0BFbswCwMoMm1r9UUtWq3FQZZHJwNRunsn3XR0uDs3+C6BdNBTeo=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:8366:b78e:6451:c163])
 (user=yunkec job=sendgmr) by 2002:a17:902:9343:b0:188:b7d6:46bf with SMTP id
 g3-20020a170902934300b00188b7d646bfmr46957875plp.111.1669861963874; Wed, 30
 Nov 2022 18:32:43 -0800 (PST)
Date:   Thu,  1 Dec 2022 11:31:59 +0900
In-Reply-To: <20221201023204.2177458-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221201023204.2177458-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221201023204.2177458-7-yunkec@google.com>
Subject: [PATCH v10 06/11 RESEND] media: uvcvideo: implement UVC v1.5 ROI
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changelog since v9:
- No change.
Changelog since v8:
- No change.
Changelog since v7:
- Fix a few style issues.
- Only allow 4-byte aligned data.
- Add control names.
- Move initialization to 7/10.

Question:
- Is V4L2_CID_CAMERA_UVC_BASE defined correctly?
  Should we use V4L2_CID_PRIVATE_BASE?

 drivers/media/usb/uvc/uvc_ctrl.c   | 111 +++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c   |   5 +-
 drivers/media/usb/uvc/uvcvideo.h   |   7 ++
 include/uapi/linux/usb/video.h     |   1 +
 include/uapi/linux/uvcvideo.h      |  13 ++++
 include/uapi/linux/v4l2-controls.h |   9 +++
 6 files changed, 140 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_c=
trl.c
index 7d86aa695b34..6279a3edf944 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -356,6 +356,24 @@ static const struct uvc_control_info uvc_ctrls[] =3D {
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
@@ -431,6 +449,57 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_=
mapping *mapping,
 	data[first+1] =3D min_t(int, abs(value), 0xff);
 }
=20
+static int uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
+			    const struct uvc_rect *uvc_rect)
+{
+	if (uvc_rect->top < uvc_rect->bottom ||
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
+			    const struct v4l2_rect *v4l2_rect)
+{
+	/* Safely converts s32 and u32 to u16. */
+	if (v4l2_rect->top > U16_MAX || v4l2_rect->top < 0 ||
+	    v4l2_rect->left > U16_MAX || v4l2_rect->left < 0 ||
+	    v4l2_rect->height > U16_MAX || v4l2_rect->height =3D=3D 0 ||
+	    v4l2_rect->width > U16_MAX || v4l2_rect->width =3D=3D 0 ||
+	    v4l2_rect->height + v4l2_rect->top - 1 > U16_MAX ||
+	    v4l2_rect->width + v4l2_rect->left - 1 > U16_MAX)
+		return -ERANGE;
+
+	uvc_rect->top =3D v4l2_rect->top;
+	uvc_rect->left =3D v4l2_rect->left;
+	uvc_rect->bottom =3D v4l2_rect->height + v4l2_rect->top - 1;
+	uvc_rect->right =3D v4l2_rect->width + v4l2_rect->left - 1;
+	return 0;
+}
+
+static int uvc_get_compound_rect(struct uvc_control_mapping *mapping,
+				 const u8 *data,  u8 *data_out)
+{
+	struct uvc_rect *uvc_rect;
+
+	uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
+	return uvc_to_v4l2_rect((struct v4l2_rect *)data_out, uvc_rect);
+}
+
+static int uvc_set_compound_rect(struct uvc_control_mapping *mapping,
+				 const u8 *data_in, u8 *data)
+{
+	struct uvc_rect *uvc_rect;
+
+	uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
+	return v4l2_to_uvc_rect(uvc_rect, (struct v4l2_rect *)data_in);
+}
+
 static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
 	{
 		.id		=3D V4L2_CID_BRIGHTNESS,
@@ -719,6 +788,29 @@ static const struct uvc_control_mapping uvc_ctrl_mappi=
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
 static const struct uvc_control_mapping uvc_ctrl_mappings_uvc11[] =3D {
@@ -2444,12 +2536,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_=
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
index 36ff1d0d6edb..52a7dc9ad4b9 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1002,7 +1002,10 @@ static int uvc_ioctl_query_ext_ctrl(struct file *fil=
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
index 1e1bccd3b2e5..c47304a63a7d 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -291,6 +291,13 @@ struct uvc_streaming_header {
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
index bfdae12cdacf..9076a444758a 100644
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
index 8288137387c0..ae5eaa14eca2 100644
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
@@ -36,6 +37,18 @@
 	 UVC_CTRL_FLAG_GET_MAX | UVC_CTRL_FLAG_GET_RES | \
 	 UVC_CTRL_FLAG_GET_DEF)
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
 	__u8 name[32];
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-c=
ontrols.h
index b5e7d082b8ad..b3544355be8f 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1019,6 +1019,15 @@ enum v4l2_auto_focus_range {
=20
 #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
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
2.38.1.584.g0f3c55d4c2-goog

