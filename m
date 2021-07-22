Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C01B3D2DBF
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhGVTyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbhGVTx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:53:58 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B56DC061575;
        Thu, 22 Jul 2021 13:34:32 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id p9so1966840wmq.5;
        Thu, 22 Jul 2021 13:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zc8lJhsZsMg2PwiVZ5DjhWyoqaqqGvcwxv1tCnyX65U=;
        b=tQg/4OjlZfISJ7v0FQq/oNMhbHgJMOFHs0erdfr8XCro6uwr155GyhB9cjuxMpJmtm
         8tdiswJfYunNcFYkXbEkUBB6wOqzkxZ96ju+8etmGLviiKDrhKnjbTnA4tAZ76i3t8Pc
         S1vp/X8jvl4y9k2OUwqsczOuAa1CclNJMKjuspkn2NLZid6y8LVUcjIrF+xxhSAzMD1U
         E8hbKScPEDwRfiQLodneQYeO+pU6mRQmRbE8BVdGJ07nY5vBQ5GW/qVcgCtUP3IQ6psQ
         YcVDXFEqQU6xp4hZ4oV/kiTt07MnTXhM1oDCoTzCKNPszCzzzSn9YpPsG3pL+FBuR96e
         pH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zc8lJhsZsMg2PwiVZ5DjhWyoqaqqGvcwxv1tCnyX65U=;
        b=fyhq8GFPag/xnNatU5dFXikdFjvbCPUQWbnTx454X30BoVebC+VjsXk3brSJNALvVS
         0sfGaztWuV7XVsS0XxazTu5Ya9r42r+JoQ6xJIqwbDELnNXwWmeJMfwQ+XCZHOtpr7dq
         SDvx2p+ZaLgt7jXXXnuyOjZFn9fFUAVMYSUR2YTP3H0vOjnBwwmmnlKSUFLs0Hj5nsbT
         4iS/1bA4kchEviCx7e/Nuf7sGVdU+Ec7J0KM7566vs5vlBAqKz7ZOWkCvnJqE3mLAgm+
         eJYn6CBx3Srl7RTdAikkyhyEJXlnuqycF+k9OCe/IGPM6QtlqcCywWgg6sxERSNI2Tsz
         qn9w==
X-Gm-Message-State: AOAM532qW9Hogsg8NoxfVsM6bZ0KuVp5NdHEuqjg7I5K/34X+RlBF+Av
        rF8tIGCPkJ5B1kdFrPhBgWk=
X-Google-Smtp-Source: ABdhPJxtTWYjGixe7BdARyeMks/fr1sGf5GNP+HMlKGAhzpJ96G6vOHu0srBkhh0dlcDl1DAFs8Mxg==
X-Received: by 2002:a1c:4b0b:: with SMTP id y11mr9184547wma.109.1626986071111;
        Thu, 22 Jul 2021 13:34:31 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:30 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 05/13] media: i2c: Add .get_selection() support to ov8865
Date:   Thu, 22 Jul 2021 21:33:59 +0100
Message-Id: <20210722203407.3588046-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver's v4l2_subdev_pad_ops currently does not include
.get_selection() - add support for that callback.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 8739eea762c5..c012f5cb11ab 100644
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
@@ -2743,12 +2752,64 @@ static int ov8865_enum_frame_interval(struct v4l2_subdev *subdev,
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

