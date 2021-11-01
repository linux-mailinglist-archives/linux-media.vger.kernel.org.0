Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368AB441198
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhKAAOE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbhKAAOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:03 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FD0C061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:31 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r8so12963408wra.7
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xgOUjYYiQc+X4eaADEk4n8rT6/67K8ZQHcBHPRdDd+I=;
        b=l1cZibRAtkNqTexW2HBkxrVKcesRjY93pdsHJAqPx7JeGG257jYCK88GlvR49i2hJ8
         7qzlqguihKNzkCyLomtdieWjBei1O/bmseSuWBpGad+oGRuhBh8MMSFB8qEy0DIxNlbM
         jSfufSxGwl4MSivuRJDEp2FifiZTxuQU7UDj6ICbarh98u2o99GR5M6WUEcDPylrRidk
         Wy5a878X7E5XWvsFnAWDXjwlgsuPJHwjZfSDTPzroNfT91ren0WfDAC3ed6whob1WOOb
         5GmocuEmzp2gZEZ5+i9Eq+LUEV7dX/SvQHhxV9m0z9DRn+/B5/57qGGLAoY7tYgC7wbu
         tWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xgOUjYYiQc+X4eaADEk4n8rT6/67K8ZQHcBHPRdDd+I=;
        b=LGj57n9riTmabXYu/avETLxQWlF+rRCbplYKjRRDbO1eb9OHOIKByBGEMX43DKkYwT
         1NR7EPd4EuPNkEOFq0JTlY5u6RnjXw/g9VT2x9Ca5ViQLC4CcN0uy1iRNC/NrI5ihEHu
         nelcT89ywAtp2rYV/MF1t0H8SFylvCrHkjbCMecJQ4BWftYFzyYHWLa/6WP4rDz1JCT7
         o2CqOourPvyJuewAq9fF7iw5nWcZJn6e51NoTlqMtghbaWQy+FFgCGgoXy35qov7bDUe
         CrPvX680/7r/33psMCSmIaMVpJCKIznxzcxaPy6BGc09m4cpQ+HD7Gt1GwW04SuNHIXK
         FOLQ==
X-Gm-Message-State: AOAM531lI5Y34rzTJ+ONHLSCufsGrif/K16EyHN5Fs8Jom2gGTpM8n92
        7jmsBnaLgj+/LFZqsJeSCVA=
X-Google-Smtp-Source: ABdhPJzBA5aD+xinKDW9BMPUBwwtGAJ0I6ZwnvDoXt6kaPPvwjqFMEesZ74fpWyDDU45C+O38n1I4A==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr7653816wrf.410.1635725489873;
        Sun, 31 Oct 2021 17:11:29 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:29 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 05/16] media: i2c: Add .get_selection() support to ov8865
Date:   Mon,  1 Nov 2021 00:11:08 +0000
Message-Id: <20211101001119.46056-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver's v4l2_subdev_pad_ops currently does not include
.get_selection() - add support for that callback.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 64 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 4ddc1b277cc0..0f2776390a8e 100644
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

