Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2E2D63E7E9
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 03:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiLACcw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 21:32:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiLACcv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 21:32:51 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE18027DF3
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:49 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-3c9960ad866so3845017b3.4
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w8Dxupi8eiIKei9hypKJ2SB7zjyaqOxVznLpWwSoJ1o=;
        b=sOls8iKiiKwvJelJQDkoc8hez0WPrpKOotsZLpUhZu6PQULEgSPT5gElaCjQkkpy/4
         o7Qz0eMZM7Cu0pTSlkmDhrsYw1dnFFUf1oKGT5W2fssJs791lXMz/A3RSTevHLJTFmO6
         qmaECofufAe4lcxkDecnxmYn3nIve8KkrNH+1m6wqvfF5SkZ+Rly/8/yOGcJVPEbmIkQ
         Kq8SE5Hzbckb30SCl744jIVbIl/yeZRHcnYRVL4r8N7IKdekbwWKFevDRaegbRUvwgi2
         x35awoGJCztY1jTAa+zzVTHVv/X6IWTMePoDn70gImbdJ6+eORjHKJ9lGE530KiGDRva
         4+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8Dxupi8eiIKei9hypKJ2SB7zjyaqOxVznLpWwSoJ1o=;
        b=R9kCa/cLwS65HHblnnsZN1L2m4xFGhb+sqrYMC9DQnBWcStJahqn1MCYud5orn7LoK
         WlSD9q+30C+ZKjMicFxrE3zBy2h9mW5ZnmulRpbEqlPJeHC/b29E5iprpmpmPzwfFTjk
         NNFC5RUBgmll7WumWWjIctHLks6ZkQI4PSTfvdxgIRui+zlSV87NPMZq1X4+y68Hudg5
         Ehqxc5mqPbSug7O+kigChl0dxdejuveGh8+dziI6WEsclaAPwZ1D6NeXQtW8VjuSGbp5
         flR+5JkP+C4MqGgLX1q1vXccgJOzKe1C3cEvDSTpkPGkVPqyEL/VwD5X4h7WHtIFo/pF
         +9rw==
X-Gm-Message-State: ANoB5pl1ZccR8u4Un+hJfHKPJlaHicsHYE1HrcrtAmhhlopWMRcK/xMI
        8+E2y482StrsfShqC4NXZzfhecb5CrQ=
X-Google-Smtp-Source: AA0mqf76AOg+V8wD7tFLYSN856SUJyAxz3krzC3825S5Jb/XzZSiIachVJK2c7wpLoi6XPA/BrR5urjkNHU=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:8366:b78e:6451:c163])
 (user=yunkec job=sendgmr) by 2002:a0d:d747:0:b0:3d2:b43d:57fb with SMTP id
 z68-20020a0dd747000000b003d2b43d57fbmr8228491ywd.95.1669861969179; Wed, 30
 Nov 2022 18:32:49 -0800 (PST)
Date:   Thu,  1 Dec 2022 11:32:00 +0900
In-Reply-To: <20221201023204.2177458-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221201023204.2177458-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221201023204.2177458-8-yunkec@google.com>
Subject: [PATCH v10 07/11 RESEND] media: uvcvideo: initilaize ROI control to
 default value
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
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

Add an init function to uvc_control_info. Use the function to
initialize ROI control to default value.

Also moves utility functions to the top of uvc_ctrl.c, above
the uvc_ctrls definition. uvc_ctrl_init_roi() calls uvc_ctrl_data()
and need to be declared before uvc_ctrls.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v9:
- No change.
Changelog since v8:
- No change.
Changelog since v7:
- Newly added patch. Split initializing from the previous patch.
- Add an init operation to uvc_control_info and use it for ROI
  initialization.

 drivers/media/usb/uvc/uvc_ctrl.c | 272 ++++++++++++++++++-------------
 drivers/media/usb/uvc/uvcvideo.h |   3 +
 2 files changed, 159 insertions(+), 116 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 6279a3edf944..cba31ee36fed 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -30,6 +30,157 @@
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
+			    const u8 *data_in, u8 *data)
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
@@ -373,6 +524,7 @@ static const struct uvc_control_info uvc_ctrls[] = {
 				| UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
 				| UVC_CTRL_FLAG_GET_DEF
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
+		.init		= uvc_ctrl_init_roi,
 	},
 };
 
@@ -841,122 +993,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings_uvc15[] = {
 	},
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
-			    const u8 *data_in, u8 *data)
-{
-	memcpy(data + mapping->offset / 8, data_in, mapping->data_size / 8);
-	return 0;
-}
-
-static bool
-uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
-{
-	return mapping->v4l2_type >= V4L2_CTRL_COMPOUND_TYPES;
-}
-
 /* ------------------------------------------------------------------------
  * Terminal and unit management
  */
@@ -2759,6 +2795,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
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
index c47304a63a7d..c7d20333ca8a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -86,6 +86,7 @@
 struct gpio_desc;
 struct sg_table;
 struct uvc_device;
+struct uvc_control;
 
 /*
  * TODO: Put the most frequently accessed fields at the beginning of
@@ -100,6 +101,8 @@ struct uvc_control_info {
 
 	u16 size;
 	u32 flags;
+
+	int (*init)(struct uvc_device *dev, struct uvc_control *ctrl);
 };
 
 struct uvc_control_mapping {
-- 
2.38.1.584.g0f3c55d4c2-goog

