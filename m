Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBAF64598D8
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbhKWAEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbhKWADj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:39 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96BA2C061759
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:32 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id ay10-20020a05600c1e0a00b0033aa12cdd33so807166wmb.1
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1DtjaKUQu8kNaLZX0DxyN5Qbi+T3FEtA3UdvU6Vjxws=;
        b=qyRpDsFqS4zxUa0b/vbmLqjaKmPdM+sAgP7ke7kbMRtKOwFgmNfg4VHs7lUHwiPklA
         jyrHR0ZblMixgCTmA+rh2SNQqMJb2dtfqlvBa3iptYYoJ7IfsKd1a/O0g83p2y+rM9LX
         vFWSGeDdR+l5mFO7Ou5bRVck3R/1MBjt9OnhtRpZ20gbfonGB5oKJ+lG3wAkesqw3Yiy
         1/SS48Y5H9Q/r8GafP2kthEkv3uIJCXS1Bdf1xTz1gxmBffEtxB2S+U6V+c/6ftisnxq
         Av/o03GtxtGryJILwQ1Zl/lJ++1YYr7P+YpcIq3B85f6VWsVF+LO/8M6o5mugFuBTL+n
         yFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1DtjaKUQu8kNaLZX0DxyN5Qbi+T3FEtA3UdvU6Vjxws=;
        b=AKAFe5MsZW4Q0LPlsQCiPZpcyqRHalkRDhq6/x1RAVv4kM46Cl2qXhQJyhjpNYV83N
         PL7spjwJQX6nGpNEVN9kQ/z8wNmbtIhhAhQ2uDq3E1ijfpzlT4e2tsJAA48fz72NOXVl
         RPRP688zDeRVoIF56oinEueFfgUvvg9QFQQMDqAHOCO0aXngjK7ZcCGHdOmDW3aWURz5
         kS+1TyLdVb7Ne7ew5eUoFjCAnm3maqpS0Z2JHRQ1mMNOOas8h7cmGWvdO3i4YT2HSi+C
         RVYXTfOlBPesCvUosOQegQ0nAnn+B0QvITscA8mOU+NQ3JvEsgUSELO4lX0ZViav3LL+
         o68A==
X-Gm-Message-State: AOAM531l0QwAe6GQw6IALI/rFiy6ShKDRzViUnnrcgGUEYTVTTUrU98p
        o1zjn+g9qe+QGkPmG0A3gEyaXpVF9Ss=
X-Google-Smtp-Source: ABdhPJxbRXSDngfnTQrx/IsplTlDgU4fhoLiuSZZ3Bt5z0zD+6x+gHmfAfGtkN0LcSzRFlOSZ20fDA==
X-Received: by 2002:a7b:cbd8:: with SMTP id n24mr1433352wmi.150.1637625631286;
        Mon, 22 Nov 2021 16:00:31 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:30 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 07/17] media: i2c: Add .get_selection() support to ov8865
Date:   Tue, 23 Nov 2021 00:00:07 +0000
Message-Id: <20211123000017.43187-8-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver's v4l2_subdev_pad_ops currently does not include
.get_selection() - add support for that callback.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 64 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index e52e43bd7787..87e34ad9c9a6 100644
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

