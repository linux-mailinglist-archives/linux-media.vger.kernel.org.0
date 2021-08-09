Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5933E4FA0
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236948AbhHIW70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbhHIW7Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:25 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C77C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:04 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id b128so11641396wmb.4
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xh0P4NTmPzYcjBqILM/Pjd/H6Y/GMmN8W7uqdPEVo30=;
        b=JIYC9CmAg9UEddcj/VhReoZhScehYl9oc4SK5t9fBnXG62WqL9zaXmj+T5qfvpgb3q
         VqoiML6uraeCvea7p/ecVtCckHNVYmDD2p3NFg5Fs0iuCAY6zlLrD6yAo/0kGyiG7u/I
         +fKtf7wi2wIhq3fspZD1deK2+llgM91sgSA2+5vQ2CWFJyPaS5FSXFFebqxxDpRYHpUS
         TQ9uS+oWjZnAHNWYmDoVU/ojR6fDSKvFqOCkD8ACRIEZtCQ8xfeiaILN1/xvMk6iUYTz
         fgD4HwHzo/eEBSmnF6haPuNUFkyJ4M7ls8FA0bpoVg8zj40HsdhzJMYVs4WfnoeTuUlN
         8bnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xh0P4NTmPzYcjBqILM/Pjd/H6Y/GMmN8W7uqdPEVo30=;
        b=dJ5g8X8pFSywFglq4KTbtJRwO/w6omrrpeX+OFYgQeXSquXuCvipH2A0bKFiJ62lxY
         oqQ3/Pb5VuyilKK7Gtu6ID6LkiyD9YZsmJEhYuDHml5A2diF9u3GjxBBpbJrByQXGRGd
         2U3QmkY1W0G611iCausvg7Y4a2amGXdnztTnrhOFBiPUnkPoh2IRHtqLnjhFmwI/+TDt
         luK/bOUKkomcTT+5yXDlKE9o1HuMK8yEyzrUys2dWEPSk2fkiviHepI/AfAoDtbdtHdT
         RBHOM6wTX1sL1v9VamQowoSLifqSc+KyyN9hxGTerqZsqOxQhaB2fNdVbjgj+eFxrx7u
         qnvA==
X-Gm-Message-State: AOAM533RoIV2Eqn1KXYT3zLswaLp5nwnD5klLbLPBGF2Z3M+Q8swmeln
        ixG8yrc0WptDQQjb3HLXyGA=
X-Google-Smtp-Source: ABdhPJxPtWjIZZj9X9wDeeK+/5O10/mnthkEFbpWjV9QdSlfyy97XpZ41vu7/nVUacJGHEXtkmazog==
X-Received: by 2002:a1c:9884:: with SMTP id a126mr1369404wme.153.1628549943167;
        Mon, 09 Aug 2021 15:59:03 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:59:02 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 05/12] media: i2c: Add .get_selection() support to ov8865
Date:   Mon,  9 Aug 2021 23:58:38 +0100
Message-Id: <20210809225845.916430-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver's v4l2_subdev_pad_ops currently does not include
.get_selection() - add support for that callback.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- None

 drivers/media/i2c/ov8865.c | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 1382b16d1a09..8c2b7d3cbc8c 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -450,6 +450,15 @@
 #define OV8865_PRE_CTRL0_PATTERN_COLOR_SQUARES	2
 #define OV8865_PRE_CTRL0_PATTERN_BLACK		3
 
+/* Pixel Array */
+
+#define OV8865_NATIVE_WIDTH			3296
+#define OV8865_NATIVE_HEIGHT			2528
+#define OV8865_ACTIVE_START_TOP			32
+#define OV8865_ACTIVE_START_LEFT		80
+#define OV8865_ACTIVE_WIDTH			3264
+#define OV8865_ACTIVE_HEIGHT			2448
+
 /* Macros */
 
 #define ov8865_subdev_sensor(s) \
@@ -2749,12 +2758,64 @@ static int ov8865_enum_frame_interval(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static void
+__ov8865_get_pad_crop(struct ov8865_sensor *sensor,
+		      struct v4l2_subdev_state *state, unsigned int pad,
+		      enum v4l2_subdev_format_whence which, struct v4l2_rect *r)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		*r = *v4l2_subdev_get_try_crop(&sensor->subdev, state, pad);
+		break;
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		r->height = sensor->state.mode->output_size_y;
+		r->width = sensor->state.mode->output_size_x;
+		r->top = (OV8865_NATIVE_HEIGHT - sensor->state.mode->output_size_y) / 2;
+		r->left = (OV8865_NATIVE_WIDTH - sensor->state.mode->output_size_x) / 2;
+		break;
+	}
+}
+
+static int ov8865_get_selection(struct v4l2_subdev *subdev,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ov8865_sensor *sensor = ov8865_subdev_sensor(subdev);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		mutex_lock(&sensor->mutex);
+			__ov8865_get_pad_crop(sensor, state, sel->pad,
+					      sel->which, &sel->r);
+		mutex_unlock(&sensor->mutex);
+		break;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV8865_NATIVE_WIDTH;
+		sel->r.height = OV8865_NATIVE_HEIGHT;
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = OV8865_ACTIVE_START_TOP;
+		sel->r.left = OV8865_ACTIVE_START_LEFT;
+		sel->r.width = OV8865_ACTIVE_WIDTH;
+		sel->r.height = OV8865_ACTIVE_HEIGHT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops ov8865_subdev_pad_ops = {
 	.enum_mbus_code		= ov8865_enum_mbus_code,
 	.get_fmt		= ov8865_get_fmt,
 	.set_fmt		= ov8865_set_fmt,
 	.enum_frame_size	= ov8865_enum_frame_size,
 	.enum_frame_interval	= ov8865_enum_frame_interval,
+	.get_selection		= ov8865_get_selection,
 };
 
 static const struct v4l2_subdev_ops ov8865_subdev_ops = {
-- 
2.25.1

