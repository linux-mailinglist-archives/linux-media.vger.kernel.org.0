Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F30B316E
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2019 20:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfIOSo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 14:44:27 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:45833 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfIOSo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 14:44:27 -0400
Received: by mail-qt1-f193.google.com with SMTP id c21so1735371qtj.12;
        Sun, 15 Sep 2019 11:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gjuD9aN3z5ZP5tKR9EsODbiavn1pZqmMfFq5Cg5cFqw=;
        b=bkO4LkH4Jlf8toRAyIAYfcY2uhiHDG45tNWqXqbmzUo5+7dYSinRV032jzdUONl1nb
         cXn5rDmPXWTpPXKqjnG1c7Uksh+1nNZznNR2nB3YSac/Q2nN0KWwvPVET1a8C3FBVzC/
         wNdCPfy4L6Ry3c2uVDuV6RSbHM+SWDQU8ZJDoe4JJc629PlKByf/vfzG6rWXdEVpGaMt
         K7oPNpqNYjyIyyPBUKre4R2GXb9MWtPq0RyrnoGqsJgXlPISDzfVoIaWst7D06/6cQmq
         A6HZu2ZWczXOgwsgMxjsM/0ZS/siW/CaLZjorVDhSwX4Frd3YZFiLWB+VASlwex4G3cS
         K2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gjuD9aN3z5ZP5tKR9EsODbiavn1pZqmMfFq5Cg5cFqw=;
        b=eNKSUZLiDCFnkh7o8ACfOwnTrEjKQvY20gkte7+wlM4mfwquCdW+d7QqKFkplmqO0e
         ClNX6WFVooz43hKsX93fqUIW+QQY+y8QnKHsx5jiAHUZglU66J03rKT2odV2Lj0gzwYK
         bNvA5D5VL7572I0bntrySTioJQ/wguBj9u25n8E8FPVLrQfuuaPYbNucMh6LISRjUHVV
         9P+ZpGcrCYvVjeseJziM6PvxB0UcRWYiRsGujssDHd0nDY4yhtar7HKC/yTvJSD0AtCY
         iNdokqSANB2551aLYW3jUOVfKjRunwoVibRgftUmuGJnuSoE+IVxFJ7XVnUJEYUtIfyt
         jTQg==
X-Gm-Message-State: APjAAAU6NkbrbkBadJ8Q90i5ykNBHN10kgB71xrY8/LG+cKl1onJXR2z
        KNFnNTbIEZNFMjzDw/y1CjFR65oh
X-Google-Smtp-Source: APXvYqz+yyAeSOpkUsFDw6TVqIYK4YSsxX/naQpgDqdIxcxGIYNvRfjdyC66YvJeVGu1ypNyFQ1oAw==
X-Received: by 2002:a0c:9665:: with SMTP id 34mr39432403qvy.223.1568573065126;
        Sun, 15 Sep 2019 11:44:25 -0700 (PDT)
Received: from localhost.localdomain ([187.101.47.190])
        by smtp.gmail.com with ESMTPSA id e4sm3294601qkl.135.2019.09.15.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2019 11:44:23 -0700 (PDT)
From:   =?UTF-8?q?Lucas=20A=2E=20M=2E=20Magalh=C3=A3es?= 
        <lucmaga@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        helen.koike@collabora.com, edusbarretto@gmail.com,
        lkcamp@lists.libreplanetbr.org,
        "Lucas A . M . Magalhaes" <lucmaga@gmail.com>
Subject: [PATCH v2] media: vimc: fla: Add virtual flash subdevice
Date:   Sun, 15 Sep 2019 15:44:19 -0300
Message-Id: <20190915184419.32184-1-lucmaga@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Lucas A. M. Magalhaes <lucmaga@gmail.com>

Add a virtual subdevice to simulate the flash control API.
Those are the supported controls:
v4l2-ctl -d /dev/v4l-subdev6 -L
Flash Controls

                       led_mode 0x009c0901 (menu)   : min=0 max=2 default=0 value=0
                                0: Off
                                1: Flash
                                2: Torch
                  strobe_source 0x009c0902 (menu)   : min=0 max=1 default=0 value=0
                                0: Software
                                1: External
                         strobe 0x009c0903 (button) : flags=write-only, execute-on-write
                    stop_strobe 0x009c0904 (button) : flags=write-only, execute-on-write
                  strobe_status 0x009c0905 (bool)   : default=0 value=0 flags=read-only
                 strobe_timeout 0x009c0906 (int)    : min=1 max=10 step=1 default=10 value=10
           intensity_flash_mode 0x009c0907 (int)    : min=0 max=255 step=1 default=255 value=255
           intensity_torch_mode 0x009c0908 (int)    : min=0 max=255 step=1 default=255 value=255
            intensity_indicator 0x009c0909 (int)    : min=0 max=255 step=1 default=255 value=255
                         faults 0x009c090a (bitmask): max=0x00000002 default=0x00000000 value=0x00000000

Co-authored-by: Eduardo Barretto <edusbarretto@gmail.com>
Signed-off-by: Eduardo Barretto <edusbarretto@gmail.com>
Signed-off-by: Lucas A. M. Magalhães <lucmaga@gmail.com>

---
Hi,

This patch depends on the patch series
        "Collapse vimc into single monolithic driver" version 4.

Changes in v2:
	- Fix v4l2-complience errors
	- Add V4L2_CID_FLASH_STROBE_STATUS behavior
	- Add V4L2_CID_FLASH_STROBE restrictions
	- Remove vimc_fla_g_volatile_ctrl
	- Remove unnecessarie V4L2_CID_FLASH_CLASS
	- Change varables names
	- Changes to apply over v4 of patch
		"Collapse vimc into single monolithic driver"
---
 drivers/media/platform/vimc/Makefile      |   2 +-
 drivers/media/platform/vimc/vimc-common.c |   2 +
 drivers/media/platform/vimc/vimc-common.h |   4 +
 drivers/media/platform/vimc/vimc-core.c   |   5 +
 drivers/media/platform/vimc/vimc-flash.c  | 200 ++++++++++++++++++++++
 5 files changed, 212 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/vimc/vimc-flash.c

diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platform/vimc/Makefile
index a53b2b532e9f..e759bbb04b14 100644
--- a/drivers/media/platform/vimc/Makefile
+++ b/drivers/media/platform/vimc/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 vimc-y := vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
-		vimc-debayer.o vimc-scaler.o vimc-sensor.o
+		vimc-debayer.o vimc-scaler.o vimc-sensor.o vimc-flash.o
 
 obj-$(CONFIG_VIDEO_VIMC) += vimc.o
 
diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index a3120f4f7a90..cb786de75573 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -203,6 +203,8 @@ struct media_pad *vimc_pads_init(u16 num_pads, const unsigned long *pads_flag)
 	struct media_pad *pads;
 	unsigned int i;
 
+	if (!num_pads)
+		return NULL;
 	/* Allocate memory for the pads */
 	pads = kcalloc(num_pads, sizeof(*pads), GFP_KERNEL);
 	if (!pads)
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 236412ad7548..a1fbbc8066d3 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -169,6 +169,10 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
 void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
 
+struct vimc_ent_device *vimc_fla_add(struct vimc_device *vimc,
+				     const char *vcfg_name);
+void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
+
 /**
  * vimc_pads_init - initialize pads
  *
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index a1218578cb9a..312723b4ed8a 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -91,6 +91,11 @@ static struct vimc_ent_config ent_config[] = {
 		.add = vimc_cap_add,
 		.rm = vimc_cap_rm,
 	},
+	{
+		.name = "Flash Controller",
+		.add = vimc_fla_add,
+		.rm = vimc_fla_rm,
+	}
 };
 
 static const struct vimc_ent_link ent_links[] = {
diff --git a/drivers/media/platform/vimc/vimc-flash.c b/drivers/media/platform/vimc/vimc-flash.c
new file mode 100644
index 000000000000..637e7d0a5919
--- /dev/null
+++ b/drivers/media/platform/vimc/vimc-flash.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * vimc-flash.c Virtual Media Controller Driver
+ *
+ * Copyright (C) 2019
+ * Contributors: Lucas A. M. Magalhães <lamm@lucmaga.dev>
+ *               Eduardo Barretto <edusbarretto@gmail.com>
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/sched.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#include "vimc-common.h"
+
+#define VIMC_FLASH_TIMEOUT_STEP 10000
+#define VIMC_FLASH_TIMEOUT_MAX 50000000
+
+struct vimc_fla_device {
+	struct vimc_ent_device ved;
+	struct v4l2_subdev sd;
+	struct v4l2_ctrl_handler hdl;
+	int strobe_source;
+	bool is_strobe;
+	int led_mode;
+	int indicator_intensity;
+	int torch_intensity;
+	int flash_intensity;
+	u64 timeout;
+	u64 last_strobe;
+	struct task_struct *kthread;
+};
+
+void vimc_fla_set_strobe_status(struct v4l2_ctrl_handler *hdl, bool value){
+	struct v4l2_ctrl *c;
+	c = v4l2_ctrl_find(hdl, V4L2_CID_FLASH_STROBE_STATUS);
+	if (!c) return;
+	v4l2_ctrl_s_ctrl(c, value);
+
+}
+
+static int vimc_fla_strobe_thread(void *data)
+{
+	struct vimc_fla_device *vfla = data;
+	vimc_fla_set_strobe_status(&vfla->hdl, vfla->is_strobe);
+	vfla->last_strobe = ktime_get_ns();
+	while(vfla->is_strobe &&
+		vfla->last_strobe + vfla->timeout > ktime_get_ns()){
+		msleep_interruptible(VIMC_FLASH_TIMEOUT_STEP/1000);
+	}
+	vimc_fla_set_strobe_status(&vfla->hdl, false);
+	return 0;
+}
+
+static int vimc_fla_s_ctrl(struct v4l2_ctrl *c)
+{
+
+	struct vimc_fla_device *vfla =
+		container_of(c->handler, struct vimc_fla_device, hdl);
+
+	switch (c->id) {
+	case V4L2_CID_FLASH_LED_MODE:
+		vfla->led_mode = c->val;
+		return 0;
+	case V4L2_CID_FLASH_STROBE_SOURCE:
+		vfla->strobe_source = c->val;
+		return 0;
+	case V4L2_CID_FLASH_STROBE:
+		if (vfla->led_mode != V4L2_FLASH_LED_MODE_FLASH ||
+		    vfla->strobe_source != V4L2_FLASH_STROBE_SOURCE_SOFTWARE){
+			return -EILSEQ;
+		}
+		vfla->is_strobe = true;
+		vfla->kthread = kthread_run(vimc_fla_strobe_thread, vfla, "vimc-flash thread");
+		return 0;
+	case V4L2_CID_FLASH_STROBE_STATUS:
+		vfla->is_strobe = c->val;
+		return 0;
+	case V4L2_CID_FLASH_STROBE_STOP:
+		vfla->is_strobe = false;
+		return 0;
+	case V4L2_CID_FLASH_TIMEOUT:
+		vfla->timeout = c->val;
+		return 0;
+	case V4L2_CID_FLASH_INTENSITY:
+		vfla->flash_intensity = c->val;
+		return 0;
+	case V4L2_CID_FLASH_TORCH_INTENSITY:
+		vfla->torch_intensity = c->val;
+		return 0;
+	case V4L2_CID_FLASH_INDICATOR_INTENSITY:
+		vfla->indicator_intensity = c->val;
+		return 0;
+	}
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops vimc_fla_ctrl_ops = {
+	.s_ctrl = vimc_fla_s_ctrl,
+};
+
+static const struct v4l2_subdev_core_ops vimc_fla_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops vimc_fla_ops = {
+	.core = &vimc_fla_core_ops,
+};
+
+/* initialize device */
+struct vimc_ent_device *vimc_fla_add(struct vimc_device *vimc,
+				     const char *vcfg_name)
+{
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
+	struct vimc_fla_device *vfla;
+	int ret;
+
+	/* Allocate the vfla struct */
+	vfla = kzalloc(sizeof(*vfla), GFP_KERNEL);
+	if (!vfla)
+		return NULL;
+
+	v4l2_ctrl_handler_init(&vfla->hdl, 4);
+
+	v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
+			       V4L2_CID_FLASH_LED_MODE,
+			       V4L2_FLASH_LED_MODE_TORCH, ~0x7,
+			       V4L2_FLASH_LED_MODE_NONE);
+	v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
+			       V4L2_CID_FLASH_STROBE_SOURCE, 0x1, ~0x3,
+			       V4L2_FLASH_STROBE_SOURCE_SOFTWARE);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_STROBE, 0, 0, 0, 0);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_STROBE_STOP, 0, 0, 0, 0);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_TIMEOUT, 0,
+			  VIMC_FLASH_TIMEOUT_MAX,
+			  VIMC_FLASH_TIMEOUT_STEP,
+			  VIMC_FLASH_TIMEOUT_STEP);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_TORCH_INTENSITY, 0, 255, 1, 255);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_INTENSITY, 0, 255, 1, 255);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_INDICATOR_INTENSITY, 0, 255, 1, 255);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_STROBE_STATUS, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_FAULT, 0,
+			  V4L2_FLASH_FAULT_TIMEOUT, 0, 0);
+	vfla->sd.ctrl_handler = &vfla->hdl;
+	if (vfla->hdl.error) {
+		ret = vfla->hdl.error;
+		goto err_free_vfla;
+	}
+
+	/* Initialize ved and sd */
+	ret = vimc_ent_sd_register(&vfla->ved, &vfla->sd, v4l2_dev,
+				   vcfg_name,
+				   MEDIA_ENT_F_FLASH, 0, NULL,
+				   NULL, &vimc_fla_ops);
+	if (ret)
+		goto err_free_hdl;
+
+	/* Initialize standard values */
+	vfla->indicator_intensity = 0;
+	vfla->torch_intensity = 0;
+	vfla->flash_intensity = 0;
+	vfla->is_strobe = false;
+	vfla->timeout = 0;
+	vfla->last_strobe = 0;
+	vfla->led_mode = V4L2_FLASH_LED_MODE_NONE;
+
+	return &vfla->ved;
+
+err_free_hdl:
+	v4l2_ctrl_handler_free(&vfla->hdl);
+err_free_vfla:
+	kfree(vfla);
+
+	return NULL;
+}
+
+void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
+{
+	struct vimc_fla_device *vfla;
+
+	if (!ved)
+		return;
+
+	vfla = container_of(ved, struct vimc_fla_device, ved);
+	vimc_ent_sd_unregister(ved, &vfla->sd);
+}
-- 
2.23.0

