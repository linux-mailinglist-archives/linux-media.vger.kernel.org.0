Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBD6F6EF046
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 10:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240165AbjDZIbK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 04:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240133AbjDZIbI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 04:31:08 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C245140DC
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:31:05 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-b98ef5b557fso12042083276.2
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682497865; x=1685089865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/6eAcxcsZVn2Wn4m+e+g35tdx6ZI1ZmzqFc+ThNRwhc=;
        b=Ge/p+hzBiZvB2d5vj9mC0huONChMdYR4cvHJ3TtAnWPRy7kSa+4NIiHXtyeMYR5HSX
         +c917G2+h1p8ku8o5YKrIvb8cPCkI0SH8gg+gnbgAZt1uC0BPhWEc1HW8C0tCQ5OZTXb
         d4OcjSLarIyXG0Xn8Gq45ktFT/I+MqyzGeoT+gRk/4vBvqgWZ5wOmfU12fWpAeDArNwX
         rkKKpQchEb0e3mV3JJxboMdRHo08mSjaNrDpBXLaxtVSzKtl6ztwAT7JaCoDOMwuTtyi
         tV7Gzt/6HjYR8gsi9yt78XARKlMsRyjwA849NxL8rMNJ9YJ9V+wS4QiKfCwn6cwf7Y7H
         vS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682497865; x=1685089865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6eAcxcsZVn2Wn4m+e+g35tdx6ZI1ZmzqFc+ThNRwhc=;
        b=IO2qm35PkgyqO9dr5+ejrIB63zTz6xc2BFJDHt/IHwFiEYydjHAhsr4at3hNrOr/7E
         GLMySS+NXq3LgcP4P+ArrBgsKCTwf7/y2h5ARsSdyFJda6JtsHC/1Z0ObieceVvJMu3x
         JxSO/48eoT/I3I1g5pjG5Ka4zQ2l7rxjGb6gCamJXQF2TOsiiNB+aC1Ti2BFHOff1uSt
         r2Bc8XNBhYmVPOXp3Kvqxg3Sx/G1DX5tMY37X2tmMcWPXZkDCQM9YrgvaoJhH5CVpKgP
         2pRenUBKOl+3x+ES0j4slln5jV4EU7Z87aRN+MFXaica8DFv/+cKOeJimGnLymk6+xmd
         4u+g==
X-Gm-Message-State: AAQBX9cPTyVbTeLcOSBdFDvbSYTHZ5Eyz4ZyMIv/Uuon10NxiNAVb5St
        LboRjIwbMws1J9WApZ0aI5NNawOZp90=
X-Google-Smtp-Source: AKy350ZMURJlfsMnf6D6tQlt3FaI8ktIyMp0/3N+P0dQAUOO7jf3trBZL3EJzsn8zTFp8eeim32FnCa3o6w=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:1f4e:598b:ed:99bd])
 (user=yunkec job=sendgmr) by 2002:a25:d88f:0:b0:b1d:5061:98e3 with SMTP id
 p137-20020a25d88f000000b00b1d506198e3mr11301723ybg.6.1682497865101; Wed, 26
 Apr 2023 01:31:05 -0700 (PDT)
Date:   Wed, 26 Apr 2023 17:29:22 +0900
In-Reply-To: <20230426082923.132909-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230426082923.132909-1-yunkec@google.com>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230426082923.132909-11-yunkec@google.com>
Subject: [PATCH v11 10/11] media: uvcvideo: initilaize ROI control to default value
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
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
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
Changelog since v10:
- No change.
Changelog since v9:
- No change.
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
index df19978746d3..9a46e0bdec32 100644
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
@@ -2972,6 +3009,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
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
index 5f1d0ba4b761..9a47d736ddf3 100644
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
2.40.1.495.gc816e09b53d-goog

