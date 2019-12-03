Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3211111E6A
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 00:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730358AbfLCXB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 18:01:56 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36798 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfLCXBz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Dec 2019 18:01:55 -0500
Received: by mail-qk1-f195.google.com with SMTP id v19so5295679qkv.3;
        Tue, 03 Dec 2019 15:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IaS4SvPI45yDASGgPA0MR5GDu2HWprEyugIRxy5AF38=;
        b=qjP40ZxuCI9m1ulzXL/fHYbGLjHv6+X25t0ccAAG/XiUTsLj5iBmy8jO/1K2uYYASE
         NbbwW/8Evj/rh4Dak1171y2MwXTnzS4n7Nw5rEeptPGWLbzsur2Bu1uRO9g19FvH8MHS
         K8hcyzq0ywh9ftODRMKnD+klZbiSyFmEnU4RI7EUoOQqZ9E640E4+u3idyVjsv9E+WPh
         AQAzF4esaSID0uT1XpaPd+hq4XgfAOD7TgLF8RptHzh6rLmesjwaaWntp4UBKS/gqOc8
         rTSRHkaCOC0xiscUem2JX/INxSJhMx6gNvDOtAWXYsLDCyj6LNE1RK1OqDCO1B9sTJWk
         5KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IaS4SvPI45yDASGgPA0MR5GDu2HWprEyugIRxy5AF38=;
        b=QQtUBlgKErh9fuTn0CkHlP9M36syBzyg1uh6fbdiKzuUpmLoSEKtad5os+15OeBPvk
         5f9yyJh88ExdZ3Fzb557C1HDxhA9mzZ5GpGjFnNegGHHcsidNrVtbr9yXo1ESf6jRrhz
         oKtrXzOiMiBeUhDh6G4i8kR0djE+aXohXXyfhWDihKDw7MpTISzVLg1wQ4HBFBynliO/
         4XxYwBd8Ypqht8ziSIsmKe4JEX4PcDWpO+lBGnbl4qv5bFvmOFm20V5PUOccx1lK2rZh
         xm0jn61/QDLgd7c+MRj0bK5d3eEZX69a0r/4DXEUj9aRdaGpJdPvCNBcTogFllNAWfzJ
         +zXw==
X-Gm-Message-State: APjAAAVkbkWQcgcKbzHYQOfc8B4ZiH69r+8mksQLHt3ADGPULpkJnLFm
        2QnncUSW+A7BIyq/VW2m/MGDnJXTICU=
X-Google-Smtp-Source: APXvYqw6Pu42SYpEy5f/QIzsMqUBAlc+pGf0foS+jrFc6soi8NPAhx6krK6RC60VteP2CI+bG4dMaw==
X-Received: by 2002:a37:6694:: with SMTP id a142mr7873822qkc.274.1575414114088;
        Tue, 03 Dec 2019 15:01:54 -0800 (PST)
Received: from localhost.localdomain ([187.74.34.131])
        by smtp.gmail.com with ESMTPSA id s127sm2595244qkc.44.2019.12.03.15.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 15:01:52 -0800 (PST)
From:   =?UTF-8?q?Lucas=20A=2E=20M=2E=20Magalh=C3=A3es?= 
        <lucmaga@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        helen.koike@collabora.com, edusbarretto@gmail.com,
        lkcamp@lists.libreplanetbr.org,
        "Lucas A . M . Magalhaes" <lucmaga@gmail.com>
Subject: [PATCH v3 RESEND] media: vimc: fla: Add virtual flash subdevice
Date:   Tue,  3 Dec 2019 20:01:48 -0300
Message-Id: <20191203230148.2442-1-lucmaga@gmail.com>
X-Mailer: git-send-email 2.24.0
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

                       led_mode 0x009c0901 (menu)   : min=0 max=2 default=1 value=1
                                0: Off
                                1: Flash
                                2: Torch
                  strobe_source 0x009c0902 (menu)   : min=0 max=1 default=0 value=0
                                0: Software
                                1: External
                         strobe 0x009c0903 (button) : flags=write-only, execute-on-write
                    stop_strobe 0x009c0904 (button) : flags=write-only, execute-on-write
                  strobe_status 0x009c0905 (bool)   : default=0 value=0 flags=read-only
                 strobe_timeout 0x009c0906 (int)    : min=50 max=400 step=50 default=50 value=400
           intensity_flash_mode 0x009c0907 (int)    : min=23040 max=1499600 step=11718 default=23040 value=23040
           intensity_torch_mode 0x009c0908 (int)    : min=2530 max=187100 step=1460 default=2530 value=2530
            intensity_indicator 0x009c0909 (int)    : min=0 max=255 step=1 default=0 value=0
                         faults 0x009c090a (bitmask): max=0x00000002 default=0x00000000 value=0x00000000

Co-authored-by: Eduardo Barretto <edusbarretto@gmail.com>
Signed-off-by: Eduardo Barretto <edusbarretto@gmail.com>
Signed-off-by: Lucas A. M. Magalhães <lucmaga@gmail.com>

---
Hi,

I've copied some values from another driver (lm3646) to make it more
realistic, as suggested by Hans. All values except for
V4L2_CID_FLASH_INDICATOR_INTENSITY, which I couldn't find any
implementation.

The v4l-compliance is failing. From the documentation
V4L2_CID_FLASH_STROBE should just work if the
V4L2_CID_FLASH_STROBE_SOURCE is "Software" and the
V4L2_CID_FLASH_LED_MODE is "Flash", otherwise it should fail. With the
standard values configured for the V4L2_CID_FLASH_STROBE will not fail.
But during the tests v4l-compliance sets V4L2_CID_FLASH_LED_MODE to
"Torch" and V4L2_CID_FLASH_STROBE_SOURCE to "External" which makes
V4L2_CID_FLASH_STROBE to fail. How do I proceed? Should the
v4l-compliance be changed?

Changes in v3:
	- Fix style errors
	- Use more realistic numbers for the controllers
	- Change from kthread to workqueue
	- Change commit message for the new controllers values

Changes in v2:
	- Fix v4l2-complience errors
	- Add V4L2_CID_FLASH_STROBE_STATUS behavior
	- Add V4L2_CID_FLASH_STROBE restrictions
	- Remove vimc_fla_g_volatile_ctrl
	- Remove unnecessarie V4L2_CID_FLASH_CLASS
	- Change varables names

 drivers/media/platform/vimc/Makefile      |   2 +-
 drivers/media/platform/vimc/vimc-common.c |   2 +
 drivers/media/platform/vimc/vimc-common.h |   4 +
 drivers/media/platform/vimc/vimc-core.c   |   5 +
 drivers/media/platform/vimc/vimc-flash.c  | 248 ++++++++++++++++++++++
 5 files changed, 260 insertions(+), 1 deletion(-)
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
index 698db7c07645..19815f0f4d40 100644
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
index 6e3e5c91ae39..5f6c750d3d8d 100644
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
index 000000000000..3918beecec57
--- /dev/null
+++ b/drivers/media/platform/vimc/vimc-flash.c
@@ -0,0 +1,248 @@
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
+#include <linux/workqueue.h>
+#include <linux/sched.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#include "vimc-common.h"
+
+/*
+ * Flash timeout in ms
+ */
+#define VIMC_FLASH_TIMEOUT_MS_MIN 50
+#define VIMC_FLASH_TIMEOUT_MS_MAX 400
+#define VIMC_FLASH_TIMEOUT_MS_STEP 50
+
+/*
+ * Torch intencity in uA
+ */
+#define VIMC_FLASH_TORCH_UA_MIN 2530
+#define VIMC_FLASH_TORCH_UA_MAX 187100
+#define VIMC_FLASH_TORCH_UA_STEP 1460
+
+/*
+ * Flash intencity in uA
+ */
+#define VIMC_FLASH_FLASH_UA_MIN 23040
+#define VIMC_FLASH_FLASH_UA_MAX 1499600
+#define VIMC_FLASH_FLASH_UA_STEP 11718
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
+	struct workqueue_struct *wq;
+	struct work_struct work;
+	struct v4l2_ctrl *strobe_status_ctl;
+};
+
+static void vimc_fla_strobe_work(struct work_struct *work)
+{
+	struct vimc_fla_device *vfla =
+		container_of(work, struct vimc_fla_device, work);
+	v4l2_ctrl_s_ctrl(vfla->strobe_status_ctl, true);
+	vfla->last_strobe = ktime_get_ns();
+	while (vfla->is_strobe &&
+	       vfla->last_strobe + vfla->timeout > ktime_get_ns()) {
+		msleep_interruptible(VIMC_FLASH_TIMEOUT_MS_STEP);
+	}
+	v4l2_ctrl_s_ctrl(vfla->strobe_status_ctl, false);
+}
+
+static int vimc_fla_s_ctrl(struct v4l2_ctrl *c)
+{
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
+			return -EINVAL;
+		}
+		queue_work(vfla->wq, &vfla->work);
+		return 0;
+	case V4L2_CID_FLASH_STROBE_STATUS:
+		vfla->is_strobe = c->val;
+		return 0;
+	case V4L2_CID_FLASH_STROBE_STOP:
+		vfla->is_strobe = false;
+		return 0;
+	case V4L2_CID_FLASH_TIMEOUT:
+		vfla->timeout = c->val * 1000000; /* MS to NS */
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
+	default:
+		return -EINVAL;
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
+static void vimc_fla_release(struct v4l2_subdev *sd)
+{
+	struct vimc_fla_device *vfla =
+				container_of(sd, struct vimc_fla_device, sd);
+
+	v4l2_ctrl_handler_free(&vfla->hdl);
+	kfree(vfla);
+}
+
+static const struct v4l2_subdev_internal_ops vimc_fla_int_ops = {
+	.release = vimc_fla_release,
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
+	v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
+			       V4L2_CID_FLASH_LED_MODE,
+			       V4L2_FLASH_LED_MODE_TORCH, ~0x7,
+			       V4L2_FLASH_LED_MODE_FLASH);
+	v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
+			       V4L2_CID_FLASH_STROBE_SOURCE, 0x1, ~0x3,
+			       V4L2_FLASH_STROBE_SOURCE_SOFTWARE);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_STROBE, 0, 0, 0, 0);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_STROBE_STOP, 0, 0, 0, 0);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_TIMEOUT, VIMC_FLASH_TIMEOUT_MS_MIN,
+			  VIMC_FLASH_TIMEOUT_MS_MAX,
+			  VIMC_FLASH_TIMEOUT_MS_STEP,
+			  VIMC_FLASH_TIMEOUT_MS_MIN);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_TORCH_INTENSITY,
+			  VIMC_FLASH_TORCH_UA_MIN,
+			  VIMC_FLASH_TORCH_UA_MAX,
+			  VIMC_FLASH_TORCH_UA_STEP,
+			  VIMC_FLASH_TORCH_UA_MIN);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_INTENSITY,
+			  VIMC_FLASH_FLASH_UA_MIN,
+			  VIMC_FLASH_FLASH_UA_MAX,
+			  VIMC_FLASH_FLASH_UA_STEP,
+			  VIMC_FLASH_FLASH_UA_MIN);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_INDICATOR_INTENSITY,
+			  0,
+			  255,
+			  1,
+			  0);
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
+	vfla->strobe_status_ctl = v4l2_ctrl_find(&vfla->hdl,
+						 V4L2_CID_FLASH_STROBE_STATUS);
+
+	/* Initialize ved and sd */
+	ret = vimc_ent_sd_register(&vfla->ved, &vfla->sd, v4l2_dev,
+				   vcfg_name,
+				   MEDIA_ENT_F_FLASH, 0, NULL,
+				   &vimc_fla_int_ops, &vimc_fla_ops);
+	if (ret)
+		goto err_free_hdl;
+
+	/* Create processing workqueue */
+	vfla->wq = alloc_workqueue("%s", 0, 0, "vimc-flash thread");
+	if (!vfla->wq)
+		goto err_unregister;
+
+	INIT_WORK(&vfla->work, vimc_fla_strobe_work);
+	/* Initialize standard values */
+	vfla->indicator_intensity = 0;
+	vfla->torch_intensity = 0;
+	vfla->flash_intensity = 0;
+	vfla->is_strobe = false;
+	vfla->timeout = 0;
+	vfla->last_strobe = 0;
+	vfla->strobe_source = V4L2_FLASH_STROBE_SOURCE_SOFTWARE;
+	vfla->led_mode = V4L2_FLASH_LED_MODE_FLASH;
+
+	return &vfla->ved;
+
+err_unregister:
+	vimc_ent_sd_unregister(&vfla->ved, &vfla->sd);
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
+	destroy_workqueue(vfla->wq);
+	vimc_ent_sd_unregister(ved, &vfla->sd);
+}
-- 
2.23.0

