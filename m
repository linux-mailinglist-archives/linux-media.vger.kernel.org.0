Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04D320B0A1
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 13:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbgFZLgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 07:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbgFZLgv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 07:36:51 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F4CC08C5C1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 04:36:51 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bh7so4170672plb.11
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 04:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5IXPYsoxYZPJVziUBoxCjpETd7m6HknRzW0rUWdQZk8=;
        b=YDELcTiKhXmLMNRsWdugz8uSj/GYAPoVPW4nwfXo6bn2AK/mys5YDfmsVJaPcHi9pO
         /UausSGC8UDHhjtzM1Nt103lZlDo0zSuPj4Y1DJ6WTW53C87VRlUy31aUOdKPMQGCGgt
         9c0YJRDfeWE5Sm7MjpRJyW6ekBBK1Q5GZnEum9xBRLsCG9rPNk8dyo43okhaAyEsYFdX
         /6f5hDGMul0E/T4U5JwJY5LIqFtN93uVAFtBT0m08YRznwzLeHeTvmet7hEhb7IBwu0+
         VmK7E65Abo1KvJhr3IpdiMCHjkljNdeYwzHLiXXqMI5ZKF+CR+d/vFJ4Ooy3YH9yBNnD
         eJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5IXPYsoxYZPJVziUBoxCjpETd7m6HknRzW0rUWdQZk8=;
        b=l5MLLVch9MxgbAtFwN0UgUgpm46DNnQWL7IvYCP2bs8ZPiExM43F3uH6NYaY1hN2+f
         0OkRq+gE+wi2UX4hQrkVk79aaWkbahrLhm2GVqVi0/BPalQSxFovP+kATnN6RHf2p4Z2
         RVT7Nxoo9dWDocfgCNeTdHUXsPJLeeL7WTUxT1Sxycy44aqY6wL3P0+zpywWcv0aCeGV
         F5tf7DWlsDz9D8scj3S/SXwxG1AZTJVlA24EW3D0Wy4AasV/XuuaeE99N+g/lB50fBf3
         b0T6UEA2EIIV4JLGJ5hQfCymTIr7OaaQlkXgfrKASkh1p1sYbdBQfh3B5eDx/ymiPnyo
         hzOw==
X-Gm-Message-State: AOAM5316Ld+uwTV/ONYUl9+YlBnIAwKbQsSdWlekvEKkGrpPC1dLvI23
        ii4tImTsvNHJ3VXixKMKJQ0E/A==
X-Google-Smtp-Source: ABdhPJxuO8eP+CS2lYU2eLccH7ezxf9p4j157yS3vDqleka+SS0SvppqVZsDxscwXyGq1y6GuKxG1A==
X-Received: by 2002:a17:90a:a62:: with SMTP id o89mr2759576pjo.188.1593171410687;
        Fri, 26 Jun 2020 04:36:50 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id i184sm25058283pfc.73.2020.06.26.04.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 04:36:50 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v6 3/3] media: vimc: Add a control to display info on test image
Date:   Fri, 26 Jun 2020 17:06:18 +0530
Message-Id: <20200626113618.15280-4-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626113618.15280-1-kgupta@es.iitr.ac.in>
References: <20200626113618.15280-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a control in VIMC to display information such as the correct order of
colors for a given test pattern, brightness, hue, saturation, contrast,
width and height at sensor, and time since streaming started over test image.

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 drivers/media/test-drivers/vimc/Kconfig       |  2 +
 drivers/media/test-drivers/vimc/vimc-common.h |  1 +
 drivers/media/test-drivers/vimc/vimc-core.c   | 10 ++++
 drivers/media/test-drivers/vimc/vimc-sensor.c | 60 +++++++++++++++++++
 4 files changed, 73 insertions(+)

diff --git a/drivers/media/test-drivers/vimc/Kconfig b/drivers/media/test-drivers/vimc/Kconfig
index 4068a67585f9..da4b2ad6e40c 100644
--- a/drivers/media/test-drivers/vimc/Kconfig
+++ b/drivers/media/test-drivers/vimc/Kconfig
@@ -2,6 +2,8 @@
 config VIDEO_VIMC
 	tristate "Virtual Media Controller Driver (VIMC)"
 	depends on VIDEO_DEV && VIDEO_V4L2
+	select FONT_SUPPORT
+	select FONT_8x16
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_VMALLOC
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index ae163dec2459..a289434e75ba 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -20,6 +20,7 @@
 #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
 #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
 #define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
+#define VIMC_CID_OSD_TEXT_MODE		(VIMC_CID_VIMC_BASE + 2)
 
 #define VIMC_FRAME_MAX_WIDTH 4096
 #define VIMC_FRAME_MAX_HEIGHT 2160
diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index 11210aaa2551..8337e1276bba 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -5,10 +5,12 @@
  * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
  */
 
+#include <linux/font.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <media/media-device.h>
+#include <media/tpg/v4l2-tpg.h>
 #include <media/v4l2-device.h>
 
 #include "vimc-common.h"
@@ -263,11 +265,19 @@ static int vimc_register_devices(struct vimc_device *vimc)
 
 static int vimc_probe(struct platform_device *pdev)
 {
+	const struct font_desc *font = find_font("VGA8x16");
 	struct vimc_device *vimc;
 	int ret;
 
 	dev_dbg(&pdev->dev, "probe");
 
+	if (!font) {
+		dev_err(&pdev->dev, "vimc: could not find font\n");
+		return -ENODEV;
+	}
+
+	tpg_set_font(font->data);
+
 	vimc = kzalloc(sizeof(*vimc), GFP_KERNEL);
 	if (!vimc)
 		return -ENOMEM;
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index a2f09ac9a360..ce438cdabb73 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -19,6 +19,8 @@ struct vimc_sen_device {
 	struct v4l2_subdev sd;
 	struct tpg_data tpg;
 	u8 *frame;
+	unsigned int osd_mode;
+	u64 start_stream_ts;
 	/* The active format */
 	struct v4l2_mbus_framefmt mbus_format;
 	struct v4l2_ctrl_handler hdl;
@@ -185,10 +187,46 @@ static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
 static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
 				    const void *sink_frame)
 {
+	enum osd_mode {OSD_SHOW_ALL = 0, OSD_SHOW_COUNTERS = 1};
+	u8 *basep[TPG_MAX_PLANES][2];
+	char str[100];
+	int line = 1;
+	const unsigned int line_height = 16;
 	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
 						    ved);
 
 	tpg_fill_plane_buffer(&vsen->tpg, 0, 0, vsen->frame);
+	tpg_calc_text_basep(&vsen->tpg, basep, 0, vsen->frame);
+
+	if (vsen->osd_mode <= OSD_SHOW_COUNTERS) {
+		unsigned int ms;
+
+		ms = (ktime_get_ns() - vsen->start_stream_ts) / 1000000;
+		snprintf(str, sizeof(str), "%02d:%02d:%02d:%03d",
+			 (ms / (60 * 60 * 1000)) % 24,
+			 (ms / (60 * 1000)) % 60,
+			 (ms / 1000) % 60,
+			 ms % 1000);
+		tpg_gen_text(&vsen->tpg, basep, line++ * line_height, 16, str);
+	}
+
+	if (vsen->osd_mode == OSD_SHOW_ALL) {
+		const char *order = tpg_g_color_order(&vsen->tpg);
+
+		tpg_gen_text(&vsen->tpg, basep,
+			     line++ * line_height, 16, order);
+		snprintf(str, sizeof(str),
+			 "brightness %3d, contrast %3d, saturation %3d, hue %d ",
+			 vsen->tpg.brightness,
+			 vsen->tpg.contrast,
+			 vsen->tpg.saturation,
+			 vsen->tpg.hue);
+		tpg_gen_text(&vsen->tpg, basep, line++ * line_height, 16, str);
+		snprintf(str, sizeof(str), "sensor size: %dx%d",
+			 vsen->mbus_format.width, vsen->mbus_format.height);
+		tpg_gen_text(&vsen->tpg, basep, line++ * line_height, 16, str);
+	}
+
 	return vsen->frame;
 }
 
@@ -201,6 +239,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
 
+		vsen->start_stream_ts = ktime_get_ns();
+
 		/* Calculate the frame size */
 		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
 		frame_size = vsen->mbus_format.width * vpix->bpp *
@@ -269,6 +309,9 @@ static int vimc_sen_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_SATURATION:
 		tpg_s_saturation(&vsen->tpg, ctrl->val);
 		break;
+	case VIMC_CID_OSD_TEXT_MODE:
+		vsen->osd_mode = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -307,6 +350,22 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
 	.qmenu = tpg_pattern_strings,
 };
 
+static const char * const vimc_ctrl_osd_mode_strings[] = {
+	"All",
+	"Counters Only",
+	"None",
+	NULL,
+};
+
+static const struct v4l2_ctrl_config vimc_sen_ctrl_osd_mode = {
+	.ops = &vimc_sen_ctrl_ops,
+	.id = VIMC_CID_OSD_TEXT_MODE,
+	.name = "Show Information",
+	.type = V4L2_CTRL_TYPE_MENU,
+	.max = ARRAY_SIZE(vimc_ctrl_osd_mode_strings) - 2,
+	.qmenu = vimc_ctrl_osd_mode_strings,
+};
+
 static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 					    const char *vcfg_name)
 {
@@ -323,6 +382,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 
 	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_class, NULL);
 	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_test_pattern, NULL);
+	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_osd_mode, NULL);
 	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
 			  V4L2_CID_VFLIP, 0, 1, 1, 0);
 	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
-- 
2.17.1

