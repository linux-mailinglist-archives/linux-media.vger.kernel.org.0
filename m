Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFE41F8A87
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 22:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbgFNUDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 16:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgFNUDT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 16:03:19 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB7AC08C5C2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 13:03:18 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id jz3so5851336pjb.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 13:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j4gk06Hqfw5/lTrfdtNI0K7/BTFaECtSfVdtHzYyVFQ=;
        b=gSIYPCobLz01tJ5DfPPQY1feRfgzjX8OzPdqtK6rV/OmqzpRkx2CLY3mIjAwsFWSws
         8bIT17usBHTfFovlsS/Wi+bJqnb7p8ScV3BD0xFqfSqRhWLqvbJ8OittjHqJKbLrd0MV
         /mwSRNkR4rFsoXxzcT/xRnuHcDCpP1feelfzWgWf4I1QdCrotACHWG2ffwyzzqK20ymv
         Md3A709qwkG+IGfQBLDRG150KFsl0pcxmMGD/QhWOIRgPvsOwhaVNLdBVXjY6/LKn4TD
         r7xGQRl655Uy2CkKRddZPpxyzHWHEej0Sm88b4aqOBYRoJtWorWkuOYBic0jA0WUUUBq
         sUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j4gk06Hqfw5/lTrfdtNI0K7/BTFaECtSfVdtHzYyVFQ=;
        b=JOEM3l02mg//rsG9Pc/ynWrVeoRgiH8otvl4In4XBFuo4MjcP7HaMQm1gjLuVAaK+/
         dfTdMvFtDOC9LDgRDk6zVLDdraY1ETBKV9F2nlXpPVCF7SuVqkE8pegxuYxW1l1bbqy/
         t6I28lso0+ZYfGds1Q86X0ygHEuPq6EVa7I89/Qzk7Hs1lUzraGHk6Roh92O2jb5dv2x
         lawe62xvtHkq6p062MjrF4Axc8IahkrdDjkqoO2tQ927dkl+9I2ujG0xACM+9jv152Od
         KORZIr0OH1dFjoaZgiNJheKxQKRAXwwiAVtWv9s/1gV0mDCKkX1B8vlqLZ4+EcUmgfmo
         xMug==
X-Gm-Message-State: AOAM533MLUnEFBQmYVDcqF/RlDgtPb5syi9uKeP7aYRwcqInXEqMpa6v
        8gwtj5cAPC3KFXskr0FDtRmsNA==
X-Google-Smtp-Source: ABdhPJzwiel/bjzvm+5yJjoMObflpOKHE05vTz+K85obpgwAIXUu4UNQjDn/TeuBCh59obdawDVuEw==
X-Received: by 2002:a17:90a:de1:: with SMTP id 88mr9072986pjv.124.1592164997299;
        Sun, 14 Jun 2020 13:03:17 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id 205sm11857378pfc.206.2020.06.14.13.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 13:03:16 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v2 2/2] media: vimc: Add a control to show test pattern colors' order
Date:   Mon, 15 Jun 2020 01:32:39 +0530
Message-Id: <20200614200239.18453-3-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200614200239.18453-1-kgupta@es.iitr.ac.in>
References: <20200614200239.18453-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a control in VIMC to show the correct order of the colors for a
given test pattern.
The control can be accessed by using show_colors_order in v4l2-ctl

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 drivers/media/test-drivers/vimc/Kconfig       |  2 ++
 drivers/media/test-drivers/vimc/vimc-common.h |  1 +
 drivers/media/test-drivers/vimc/vimc-sensor.c | 34 +++++++++++++++++++
 3 files changed, 37 insertions(+)

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
index ae163dec2459..52376ba6146b 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -20,6 +20,7 @@
 #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
 #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
 #define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
+#define VIMC_TEST_PATTERN_ORDER		(VIMC_CID_VIMC_BASE + 2)
 
 #define VIMC_FRAME_MAX_WIDTH 4096
 #define VIMC_FRAME_MAX_HEIGHT 2160
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index a2f09ac9a360..da625f6accce 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
  */
 
+#include <linux/font.h>
 #include <linux/v4l2-mediabus.h>
 #include <linux/vmalloc.h>
 #include <media/v4l2-ctrls.h>
@@ -19,6 +20,7 @@ struct vimc_sen_device {
 	struct v4l2_subdev sd;
 	struct tpg_data tpg;
 	u8 *frame;
+	bool show_colors_order;
 	/* The active format */
 	struct v4l2_mbus_framefmt mbus_format;
 	struct v4l2_ctrl_handler hdl;
@@ -185,10 +187,18 @@ static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
 static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
 				    const void *sink_frame)
 {
+	u8 *basep[TPG_MAX_PLANES][2];
+	char *str;
 	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
 						    ved);
 
 	tpg_fill_plane_buffer(&vsen->tpg, 0, 0, vsen->frame);
+	if (vsen->show_colors_order) {
+		tpg_calc_text_basep(&vsen->tpg, basep, 0, vsen->frame);
+		str = tpg_g_color_order(&vsen->tpg);
+		tpg_gen_text(&vsen->tpg, basep, 1, 1, str);
+	}
+
 	return vsen->frame;
 }
 
@@ -200,6 +210,14 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 	if (enable) {
 		const struct vimc_pix_map *vpix;
 		unsigned int frame_size;
+		const struct font_desc *font = find_font("VGA8x16");
+
+		if (font == NULL) {
+			pr_err("vimc: could not find font\n");
+			return -ENODEV;
+		}
+
+		tpg_set_font(font->data);
 
 		/* Calculate the frame size */
 		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
@@ -269,6 +287,9 @@ static int vimc_sen_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_SATURATION:
 		tpg_s_saturation(&vsen->tpg, ctrl->val);
 		break;
+	case VIMC_TEST_PATTERN_ORDER:
+		vsen->show_colors_order = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -307,6 +328,17 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
 	.qmenu = tpg_pattern_strings,
 };
 
+static const struct v4l2_ctrl_config vimc_sen_ctrl_order = {
+	.ops = &vimc_sen_ctrl_ops,
+	.id = VIMC_TEST_PATTERN_ORDER,
+	.name = "Show Colors Order",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.min = 0,
+	.max = 1,
+	.step = 1,
+	.def = 1,
+};
+
 static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 					    const char *vcfg_name)
 {
@@ -323,6 +355,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 
 	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_class, NULL);
 	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_test_pattern, NULL);
+	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_order, NULL);
 	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
 			  V4L2_CID_VFLIP, 0, 1, 1, 0);
 	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
@@ -362,6 +395,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 
 	/* Initialize the frame format */
 	vsen->mbus_format = fmt_default;
+	vsen->show_colors_order = vimc_sen_ctrl_order.def;
 
 	return &vsen->ved;
 
-- 
2.17.1

