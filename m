Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4961555D3A3
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243087AbiF1H6E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 03:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243551AbiF1H5p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 03:57:45 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3394313FA7
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:44 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-31ba792c793so46924127b3.20
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=aIbHKbVVcaZVM4752YjpEFdZQCRYFrEKvf1iqr1v6tU=;
        b=oydepxdL9EIhOyT5K3L5QeA343Lx3DF8Irejv8eqsq3/bc8so60fhsTQgZbd6nLC1s
         XuniwmgfE1TU28yCEj2OieNEwPcRv91aSSThdyLieCBieedd3atoqFYd+u4P8mwoq/LK
         qrS0lsVZlsNm/n0Q9lbjz24CzVIN2KBeTzzU86/gO/aHYv0JAFQcv6RTD5QE0iifZV+1
         mFk0c+J5xxV3yAAW48fBHgu+LUwIJTQDN4cF4U1iU2NBnH474yZHctw2xPk8VOhSp1dQ
         4hQnZueRqekvFesibX1K2qCuxdquuAuHOHC59b6KbvIoJTrAbHGbe8KE8hsCCXLa7FPb
         ljXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=aIbHKbVVcaZVM4752YjpEFdZQCRYFrEKvf1iqr1v6tU=;
        b=J484YFp9EcqF51EHzbxCieBtIIGQHB9MtdDIHQS+80aADkAzBtOb47Tdb0FY8IiEUJ
         bCGoo1jaA58oIfzrvspjxdT1OFgx+YW4Hlc1mTlqpPbSkFNQMVBUlyGtKBmXpPv4FeSD
         bPCAShHzWlfXS3IiRlMuASVwgEH50GieJYPI7XhQfi0Kw1gVc4j/2s0Fd4qplwqDRp3D
         WzeMUYDhPoAI2IEgSgcI5anrG9CxxpqoDjmFJWjVrRMEN5eaXtypfy4P7u/83yKjn0y/
         U8xPJpbp0bM6O3JYJsZor8pJQWNbwMNi5LRzWZ/fuNvMvXQGnUnauqa7+Wd8r1op79f+
         lTPA==
X-Gm-Message-State: AJIora8uPrwDHLskCnRA/Tc8LVw1eDbNcH3EdD3XUr0mAig++b8ifHxN
        2s7vE4eWuWpSAQS2W3bn7wJvx0P0OMo=
X-Google-Smtp-Source: AGRyM1tIowpdcqdpLuYbwAevXdRvy74xHNPctloEva3gHz6Xql2Qf7Cl9gYrDFed21UMy7D8XSxIMF1l4bI=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:983d:14d6:e059:135f])
 (user=yunkec job=sendgmr) by 2002:a81:990f:0:b0:2f8:c347:d11a with SMTP id
 q15-20020a81990f000000b002f8c347d11amr20012421ywg.507.1656403063541; Tue, 28
 Jun 2022 00:57:43 -0700 (PDT)
Date:   Tue, 28 Jun 2022 16:57:02 +0900
In-Reply-To: <20220628075705.2278044-1-yunkec@google.com>
Message-Id: <20220628075705.2278044-5-yunkec@google.com>
Mime-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v7 4/7] media: uvcvideo: implement UVC v1.5 ROI
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement support for ROI as described in UVC 1.5:
4.2.2.1.20 Digital Region of Interest (ROI) Control

ROI control is implemented using V4L2 control API as
two uvc-specific controls:
V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 146 ++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvc_v4l2.c   |   5 +-
 drivers/media/usb/uvc/uvcvideo.h   |   7 ++
 include/uapi/linux/usb/video.h     |   1 +
 include/uapi/linux/uvcvideo.h      |  13 +++
 include/uapi/linux/v4l2-controls.h |   8 ++
 6 files changed, 178 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_c=
trl.c
index 508ee04afbcd..00482269233a 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -355,6 +355,23 @@ static const struct uvc_control_info uvc_ctrls[] =3D {
 		.flags		=3D UVC_CTRL_FLAG_GET_CUR
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	/* UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get updated
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
@@ -429,6 +446,64 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_=
mapping *mapping,
 	data[first+1] =3D min_t(int, abs(value), 0xff);
 }
=20
+static void uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
+			     const struct uvc_rect *uvc_rect)
+{
+	v4l2_rect->top =3D uvc_rect->top;
+	v4l2_rect->left =3D uvc_rect->left;
+	v4l2_rect->height =3D uvc_rect->bottom - uvc_rect->top + 1;
+	v4l2_rect->width =3D uvc_rect->right - uvc_rect->left + 1;
+}
+
+static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
+			    const struct v4l2_rect *v4l2_rect)
+{
+	// Safely converts s32 and u32 to u16.
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
+static int uvc_get_array_rect(struct uvc_control_mapping *mapping,
+			      const u8 *data,  u8 *data_out)
+{
+	struct uvc_rect *uvc_rect;
+
+	if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
+		return -EINVAL;
+	if (WARN_ON(mapping->size / 8 !=3D sizeof(struct uvc_rect)))
+		return -EINVAL;
+
+	uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
+	uvc_to_v4l2_rect((struct v4l2_rect *)data_out, uvc_rect);
+
+	return 0;
+}
+
+static int uvc_set_array_rect(struct uvc_control_mapping *mapping,
+			      const u8 *data_in, u8 *data)
+{
+	struct uvc_rect *uvc_rect;
+
+	if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
+		return -EINVAL;
+	if (WARN_ON(mapping->size / 8 !=3D sizeof(struct uvc_rect)))
+		return -EINVAL;
+
+	uvc_rect =3D (struct uvc_rect *)(data + mapping->offset / 8);
+	return v4l2_to_uvc_rect(uvc_rect, (struct v4l2_rect *)data_in);
+}
+
 static const struct uvc_control_mapping uvc_ctrl_mappings[] =3D {
 	{
 		.id		=3D V4L2_CID_BRIGHTNESS,
@@ -728,6 +803,26 @@ static const struct uvc_control_mapping uvc_ctrl_mappi=
ngs[] =3D {
 		.v4l2_type	=3D V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	=3D UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
+	{
+		.id		=3D V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
+		.entity		=3D UVC_GUID_UVC_CAMERA,
+		.selector	=3D UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.size		=3D 64,
+		.offset		=3D 0,
+		.v4l2_type	=3D V4L2_CTRL_TYPE_RECT,
+		.data_type	=3D UVC_CTRL_DATA_TYPE_RECT,
+		.get_array	=3D uvc_get_array_rect,
+		.set_array	=3D uvc_set_array_rect,
+	},
+	{
+		.id		=3D V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
+		.entity		=3D UVC_GUID_UVC_CAMERA,
+		.selector	=3D UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.size		=3D 16,
+		.offset		=3D 64,
+		.v4l2_type	=3D V4L2_CTRL_TYPE_BITMASK,
+		.data_type	=3D UVC_CTRL_DATA_TYPE_BITMASK,
+	},
 };
=20
 /* -----------------------------------------------------------------------=
-
@@ -1061,7 +1156,16 @@ static int __uvc_ctrl_get_compound_to_user(struct uv=
c_control_mapping *mapping,
 	if (WARN_ON(!mapping->size % 8))
 		return -EINVAL;
=20
-	size =3D mapping->size / 8;
+	switch (mapping->v4l2_type) {
+	case V4L2_CTRL_TYPE_RECT:
+		size =3D sizeof(struct v4l2_rect);
+		break;
+
+	default:
+		size =3D mapping->size / 8;
+		break;
+	}
+
 	if (xctrl->size < size) {
 		xctrl->size =3D size;
 		return -ENOSPC;
@@ -2578,6 +2682,40 @@ static void uvc_ctrl_prune_entity(struct uvc_device =
*dev,
 	}
 }
=20
+static int uvc_ctrl_init_roi(struct uvc_device *dev, struct uvc_control *c=
trl)
+{
+	int ret;
+
+	ret =3D uvc_query_ctrl(dev, UVC_GET_DEF, ctrl->entity->id, dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
+			     ctrl->info.size);
+	if (ret)
+		goto out;
+
+	/*
+	 * Most firmwares have wrong GET_CURRENT configuration. E.g. it's
+	 * below GET_MIN, or have rectangle coordinates mixed up. This
+	 * causes problems sometimes, because we are unable to set
+	 * auto-controls value without first setting ROI rectangle to
+	 * valid configuration.
+	 *
+	 * We expect that default configuration is always correct and
+	 * is within the GET_MIN / GET_MAX boundaries.
+	 *
+	 * Set current ROI configuration to GET_DEF, so that we will
+	 * always have properly configured ROI.
+	 */
+	ret =3D uvc_query_ctrl(dev, UVC_SET_CUR, 1, dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
+			     ctrl->info.size);
+out:
+	if (ret)
+		dev_err(&dev->udev->dev, "Failed to fixup ROI (%d).\n", ret);
+	return ret;
+}
+
 /*
  * Add control information and hardcoded stock control mappings to the giv=
en
  * device.
@@ -2590,6 +2728,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain=
 *chain,
 	const struct uvc_control_mapping *mapping =3D uvc_ctrl_mappings;
 	const struct uvc_control_mapping *mend =3D
 		mapping + ARRAY_SIZE(uvc_ctrl_mappings);
+	const u8 camera_entity[16] =3D UVC_GUID_UVC_CAMERA;
=20
 	/* XU controls initialization requires querying the device for control
 	 * information. As some buggy UVC devices will crash when queried
@@ -2610,6 +2749,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chai=
n *chain,
 			 * GET_INFO on standard controls.
 			 */
 			uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
+
+			if (ctrl->info.selector =3D=3D
+				UVC_CT_REGION_OF_INTEREST_CONTROL &&
+			    uvc_entity_match_guid(ctrl->entity, camera_entity))
+				uvc_ctrl_init_roi(chain->dev, ctrl);
 			break;
 		 }
 	}
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v=
4l2.c
index 0366d05895a9..aad61af36271 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -998,7 +998,10 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file,=
 void *fh,
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
index 2f9b75faae83..9ff95bbad251 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -431,6 +431,13 @@ struct uvc_streaming_header {
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
index 8288137387c0..e2feee15cb1b 100644
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
+/* V4L2 private controls */
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
index dfff69ed88f7..d85be46e46f2 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1013,6 +1013,14 @@ enum v4l2_auto_focus_range {
=20
 #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
=20
+/* CAMERA-class private control IDs */
+
+/*
+ * The base for the uvc driver controls. See linux/uvcvideo.h for the list
+ * of controls. We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_CAMERA_UVC_BASE		(V4L2_CID_CAMERA_CLASS_BASE + 0x1000)
+
 /* FM Modulator class control IDs */
=20
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
--=20
2.37.0.rc0.161.g10f37bed90-goog

