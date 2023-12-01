Return-Path: <linux-media+bounces-1456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328480049B
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 08:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A240B20518
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 07:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E338614F88;
	Fri,  1 Dec 2023 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="whWvaHCy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EA1171A
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:20:03 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5d42c43d8daso1697827b3.0
        for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 23:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701415202; x=1702020002; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjPNq8wHje8F2AzEe6fv0QKZnMQlyqWV8HXHNJaILjI=;
        b=whWvaHCyRldtLWwLDIISrdkSzIMWEPOdtEoL+MZAVs1kokqNJckbRDGtNeutPk+Vj0
         9HZENxt5yMIKUnyS+LhOjSZWx46ckSz8C0/l0OlafM7826iMvHpKE1xim/F/UqUUptyT
         DkvSy+K2ldLwV5MKYO/iaKGzujK9WxH3YRmzcpdicnvhx1m2A8xHWrr+AsC8QzVss7Q/
         D4lRxu71bTIMrMPHjYcHwD3LtOb8OMDwiU3E9S0Cgm9JKQqzQqBypall4tIlluKqzK9w
         GnSerO87Ok7gr7tX8+9d/5QNHyQ+bsfvnwz1ROxPbALUaqgao2WXJGt1Ay1uhZqbjkQk
         ZOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415202; x=1702020002;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjPNq8wHje8F2AzEe6fv0QKZnMQlyqWV8HXHNJaILjI=;
        b=RxOcUaAFPwB+5+9VS9QHtd4yo9jVI0kr0w5LnJYD7xfJHYyVDW+wy+4y2HZs5ORg4A
         r+ljNDhSpxYOj23wjR7AlLk4hBSaFN37H0rR359NJXfm5YJQueSuLdNerlKo6I2rT0Q5
         /H9K+oWaXlh/gexOBkSF4dexCzo17F7gtx1qjZKTwTgDzOcTYEyeOxdYBVRIKV3L52LA
         gAlVMF4BPxpQGxRW3pBbsf53QMOed/WULo9Rcj7BCw/2TkVbjIkx83gv+B1yYbmzelyc
         33vT9ia3h9NKTvT2Bwc8Oi54Omg/+LE9plapDJrkvYxtdccXrNslMK9bNN4byAh4n1lH
         OZVw==
X-Gm-Message-State: AOJu0YyBhFSEiL9kwIGGKP049KEE01iIhv4gSdSbvC1u4HdsaxztzlKM
	G60eQvR5HZl48FpRWxG1h5zKpTDrYsg=
X-Google-Smtp-Source: AGHT+IEuPiX0Y911gv4gB0CbV4+T1gmLvBnnIuXkpP8pG5dNuYMqaQZa7oi06FU5ZzFr5w57Iu3226jMY/E=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:ea68:7c7a:2356:8a4a])
 (user=yunkec job=sendgmr) by 2002:a81:be15:0:b0:5d3:56a4:9073 with SMTP id
 i21-20020a81be15000000b005d356a49073mr226548ywn.2.1701415202546; Thu, 30 Nov
 2023 23:20:02 -0800 (PST)
Date: Fri,  1 Dec 2023 16:19:01 +0900
In-Reply-To: <20231201071907.3080126-1-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231201071907.3080126-1-yunkec@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201071907.3080126-11-yunkec@google.com>
Subject: [PATCH v14 10/11] media: uvcvideo: initilaize ROI control to default value
From: Yunke Cao <yunkec@google.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"

Add an init function to uvc_control_info. Use the function to
initialize ROI control to default value.

Also moves utility functions to the top of uvc_ctrl.c, above
the uvc_ctrls definition. uvc_ctrl_init_roi() calls uvc_ctrl_data()
and need to be declared before uvc_ctrls.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v8:
- No change.
Changelog since v7:
- Newly added patch. Split initializing from the previous patch.
- Add an init operation to uvc_control_info and use it for ROI
  initialization.
  
 drivers/media/usb/uvc/uvc_ctrl.c | 273 ++++++++++++++++++-------------
 drivers/media/usb/uvc/uvcvideo.h |   3 +
 2 files changed, 160 insertions(+), 116 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d405b2a9d477..bda625c392c2 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -32,6 +32,158 @@
 #define UVC_CTRL_DATA_DEF	5
 #define UVC_CTRL_DATA_LAST	6
 
+/* ------------------------------------------------------------------------
+ * Utility functions
+ */
+
+static inline u8 *uvc_ctrl_data(struct uvc_control *ctrl, int id)
+{
+	return ctrl->uvc_data + id * ctrl->info.size;
+}
+
+static inline int uvc_test_bit(const u8 *data, int bit)
+{
+	return (data[bit >> 3] >> (bit & 7)) & 1;
+}
+
+static inline void uvc_clear_bit(u8 *data, int bit)
+{
+	data[bit >> 3] &= ~(1 << (bit & 7));
+}
+
+/*
+ * Extract the bit string specified by mapping->offset and mapping->data_size
+ * from the little-endian data stored at 'data' and return the result as
+ * a signed 32bit integer. Sign extension will be performed if the mapping
+ * references a signed data type.
+ */
+static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
+			    u8 query, const u8 *data)
+{
+	int bits = mapping->data_size;
+	int offset = mapping->offset;
+	s32 value = 0;
+	u8 mask;
+
+	data += offset / 8;
+	offset &= 7;
+	mask = ((1LL << bits) - 1) << offset;
+
+	while (1) {
+		u8 byte = *data & mask;
+
+		value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
+		bits -= 8 - (offset > 0 ? offset : 0);
+		if (bits <= 0)
+			break;
+
+		offset -= 8;
+		mask = (1 << bits) - 1;
+		data++;
+	}
+
+	/* Sign-extend the value if needed. */
+	if (mapping->data_type == UVC_CTRL_DATA_TYPE_SIGNED)
+		value |= -(value & (1 << (mapping->data_size - 1)));
+
+	return value;
+}
+
+/*
+ * Set the bit string specified by mapping->offset and mapping->data_size
+ * in the little-endian data stored at 'data' to the value 'value'.
+ */
+static void uvc_set_le_value(struct uvc_control_mapping *mapping,
+			     s32 value, u8 *data)
+{
+	int bits = mapping->data_size;
+	int offset = mapping->offset;
+	u8 mask;
+
+	/*
+	 * According to the v4l2 spec, writing any value to a button control
+	 * should result in the action belonging to the button control being
+	 * triggered. UVC devices however want to see a 1 written -> override
+	 * value.
+	 */
+	if (mapping->v4l2_type == V4L2_CTRL_TYPE_BUTTON)
+		value = -1;
+
+	data += offset / 8;
+	offset &= 7;
+
+	for (; bits > 0; data++) {
+		mask = ((1LL << bits) - 1) << offset;
+		*data = (*data & ~mask) | ((value << offset) & mask);
+		value >>= offset ? offset : 8;
+		bits -= 8 - offset;
+		offset = 0;
+	}
+}
+
+/*
+ * Extract the byte array specified by mapping->offset and mapping->data_size
+ * stored at 'data' to the output array 'data_out'.
+ */
+static int uvc_get_compound(struct uvc_control_mapping *mapping, const u8 *data,
+			    u8 *data_out)
+{
+	memcpy(data_out, data + mapping->offset / 8, mapping->data_size / 8);
+	return 0;
+}
+
+/*
+ * Copy the byte array 'data_in' to the destination specified by mapping->offset
+ * and mapping->data_size stored at 'data'.
+ */
+static int uvc_set_compound(struct uvc_control_mapping *mapping,
+			    const u8 *data_in, const u8 *data_min,
+			    const u8 *data_max, u8 *data)
+{
+	memcpy(data + mapping->offset / 8, data_in, mapping->data_size / 8);
+	return 0;
+}
+
+static bool
+uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
+{
+	return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
+}
+
+static int uvc_ctrl_init_roi(struct uvc_device *dev, struct uvc_control *ctrl)
+{
+	int ret;
+
+	ret = uvc_query_ctrl(dev, UVC_GET_DEF, ctrl->entity->id, dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
+			     ctrl->info.size);
+	if (ret)
+		goto out;
+
+	/*
+	 * Most firmwares have wrong GET_CUR configuration. E.g. it's
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
+	ret = uvc_query_ctrl(dev, UVC_SET_CUR, 1, dev->intfnum,
+			     UVC_CT_REGION_OF_INTEREST_CONTROL,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
+			     ctrl->info.size);
+out:
+	if (ret)
+		dev_err(&dev->udev->dev, "Failed to fixup ROI (%d).\n", ret);
+	return ret;
+}
+
 /* ------------------------------------------------------------------------
  * Controls
  */
@@ -375,6 +527,7 @@ static const struct uvc_control_info uvc_ctrls[] = {
 				| UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
 				| UVC_CTRL_FLAG_GET_DEF
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
+		.init		= uvc_ctrl_init_roi,
 	},
 };
 
@@ -901,122 +1054,6 @@ static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc15[] = {
 	NULL, /* Sentinel */
 };
 
-/* ------------------------------------------------------------------------
- * Utility functions
- */
-
-static inline u8 *uvc_ctrl_data(struct uvc_control *ctrl, int id)
-{
-	return ctrl->uvc_data + id * ctrl->info.size;
-}
-
-static inline int uvc_test_bit(const u8 *data, int bit)
-{
-	return (data[bit >> 3] >> (bit & 7)) & 1;
-}
-
-static inline void uvc_clear_bit(u8 *data, int bit)
-{
-	data[bit >> 3] &= ~(1 << (bit & 7));
-}
-
-/*
- * Extract the bit string specified by mapping->offset and mapping->data_size
- * from the little-endian data stored at 'data' and return the result as
- * a signed 32bit integer. Sign extension will be performed if the mapping
- * references a signed data type.
- */
-static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
-	u8 query, const u8 *data)
-{
-	int bits = mapping->data_size;
-	int offset = mapping->offset;
-	s32 value = 0;
-	u8 mask;
-
-	data += offset / 8;
-	offset &= 7;
-	mask = ((1LL << bits) - 1) << offset;
-
-	while (1) {
-		u8 byte = *data & mask;
-		value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
-		bits -= 8 - (offset > 0 ? offset : 0);
-		if (bits <= 0)
-			break;
-
-		offset -= 8;
-		mask = (1 << bits) - 1;
-		data++;
-	}
-
-	/* Sign-extend the value if needed. */
-	if (mapping->data_type == UVC_CTRL_DATA_TYPE_SIGNED)
-		value |= -(value & (1 << (mapping->data_size - 1)));
-
-	return value;
-}
-
-/*
- * Set the bit string specified by mapping->offset and mapping->data_size
- * in the little-endian data stored at 'data' to the value 'value'.
- */
-static void uvc_set_le_value(struct uvc_control_mapping *mapping,
-	s32 value, u8 *data)
-{
-	int bits = mapping->data_size;
-	int offset = mapping->offset;
-	u8 mask;
-
-	/*
-	 * According to the v4l2 spec, writing any value to a button control
-	 * should result in the action belonging to the button control being
-	 * triggered. UVC devices however want to see a 1 written -> override
-	 * value.
-	 */
-	if (mapping->v4l2_type == V4L2_CTRL_TYPE_BUTTON)
-		value = -1;
-
-	data += offset / 8;
-	offset &= 7;
-
-	for (; bits > 0; data++) {
-		mask = ((1LL << bits) - 1) << offset;
-		*data = (*data & ~mask) | ((value << offset) & mask);
-		value >>= offset ? offset : 8;
-		bits -= 8 - offset;
-		offset = 0;
-	}
-}
-
-/*
- * Extract the byte array specified by mapping->offset and mapping->data_size
- * stored at 'data' to the output array 'data_out'.
- */
-static int uvc_get_compound(struct uvc_control_mapping *mapping, const u8 *data,
-			    u8 *data_out)
-{
-	memcpy(data_out, data + mapping->offset / 8, mapping->data_size / 8);
-	return 0;
-}
-
-/*
- * Copy the byte array 'data_in' to the destination specified by mapping->offset
- * and mapping->data_size stored at 'data'.
- */
-static int uvc_set_compound(struct uvc_control_mapping *mapping,
-			    const u8 *data_in, const u8 *data_min,
-			    const u8 *data_max, u8 *data)
-{
-	memcpy(data + mapping->offset / 8, data_in, mapping->data_size / 8);
-	return 0;
-}
-static bool
-uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
-{
-	return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
-}
-
 /* ------------------------------------------------------------------------
  * Terminal and unit management
  */
@@ -2984,6 +3021,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 			 * GET_INFO on standard controls.
 			 */
 			uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
+
+			if (info->init)
+				info->init(chain->dev, ctrl);
+
 			break;
 		 }
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 18da5e0b8cb2..335b565da6de 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -85,6 +85,7 @@
 struct gpio_desc;
 struct sg_table;
 struct uvc_device;
+struct uvc_control;
 
 /*
  * TODO: Put the most frequently accessed fields at the beginning of
@@ -99,6 +100,8 @@ struct uvc_control_info {
 
 	u16 size;
 	u32 flags;
+
+	int (*init)(struct uvc_device *dev, struct uvc_control *ctrl);
 };
 
 struct uvc_control_mapping {
-- 
2.43.0.rc2.451.g8631bc7472-goog


