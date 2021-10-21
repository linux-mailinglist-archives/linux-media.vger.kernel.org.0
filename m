Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24EC436CEA
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhJUVqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbhJUVqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:18 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9420C061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:01 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id u8-20020a05600c440800b0030d90076dabso7896264wmn.1
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6q8zbUSbQQbOo/L1tTIpt7sLV2QEP76RgaqAvhzS0t8=;
        b=CY+RbVENe3nxfyGLrYtAEsw+43mh9hfYU4eJg0PsMsrySZRtprPiL+ImIH2nlqOtNU
         gB/SDSzLSO5yvmlAjoCAkbkAPgZDVuSLrFqRfxVcPEPNS6Qg/xK4FlWEl6B6eHqBrOxg
         9VusoNBaJiOrO7HFEJC8EjNq6wFjQM4OtrVo6tO26oBRrU1vwHVX/Q14Znmgm0nezL6i
         WFm8+qBpy4VQPIJ4ODTyJIMws+xQ9KIa2hDH5s+i1UYq4dGzADeqddLB+QJpHXeLmHOI
         zvd5kUKoGchBxLLcpAty6Fdlka3+jiSKgo2s2MzCQiiSMY6f5yXOlz89q7AHDrYxB6/N
         Qrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6q8zbUSbQQbOo/L1tTIpt7sLV2QEP76RgaqAvhzS0t8=;
        b=Tf5gG5YZBKePG7fBA8Ou1JMPiipW7x/hRpSZTgiMl4CtpxHBfdEkqHlIIl4bWbr+v7
         Oy18eD5YFB3tHEpcwNB74ZxnwYfBNDEkpm5yGJVnplhzqE4KvogOqrZyw0sGhe4Ke/FQ
         BaVzCC89mtsRMQnQGv5CjZOEfSNIAX3O+wFyJVgHVvZtSbVZ4xWBENOineQukjIA+ZNX
         jdUA8kaLQjRqXNT1cUbJbHzaTbOy99JNVFj/rb6oC9k/bt85AzK0czmVsp62CwqiJ8I1
         bz5hFKhnGhU0rL2Gn6ynswTglujz87F6Wwu25GC7K0Gg/DvehvHhvy9TjotDu6LbWppi
         gfow==
X-Gm-Message-State: AOAM53116ZL4LFZqoM5i8GdL8bKBC/yyGGqqt8k5t6g4fqgu4qqtQUeU
        TbmfTv4+hzLntu9/JdbIctrYAw3JMdM=
X-Google-Smtp-Source: ABdhPJzS71ptcStFBRa/tQJZhwyykjl76C5ZYvESvgCzDTdeSv6ers105htN50MwR4Q2VEp/CVFstg==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr9185899wmi.69.1634852640106;
        Thu, 21 Oct 2021 14:44:00 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:43:59 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 05/16] media: i2c: Add .get_selection() support to ov8865
Date:   Thu, 21 Oct 2021 22:43:20 +0100
Message-Id: <20211021214331.1188787-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver's v4l2_subdev_pad_ops currently does not include
.get_selection() - add support for that callback.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- Used the same function for .set_select() (sakari)

 drivers/media/i2c/ov8865.c | 64 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 23e80d8114d7..c16b31f13e37 100644
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
@@ -2756,12 +2765,67 @@ static int ov8865_enum_frame_interval(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static void
+__ov8865_get_pad_crop(struct ov8865_sensor *sensor,
+		      struct v4l2_subdev_state *state, unsigned int pad,
+		      enum v4l2_subdev_format_whence which, struct v4l2_rect *r)
+{
+	const struct ov8865_mode *mode = sensor->state.mode;
+
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		*r = *v4l2_subdev_get_try_crop(&sensor->subdev, state, pad);
+		break;
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		r->height = mode->output_size_y;
+		r->width = mode->output_size_x;
+		r->top = (OV8865_NATIVE_HEIGHT - mode->output_size_y) / 2;
+		r->left = (OV8865_NATIVE_WIDTH - mode->output_size_x) / 2;
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
+	.set_selection		= ov8865_get_selection,
 };
 
 static const struct v4l2_subdev_ops ov8865_subdev_ops = {
-- 
2.25.1

