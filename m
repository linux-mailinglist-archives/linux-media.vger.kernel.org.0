Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15338A4C30
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 23:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbfIAVLq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Sep 2019 17:11:46 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36691 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728519AbfIAVLq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Sep 2019 17:11:46 -0400
Received: by mail-qt1-f194.google.com with SMTP id o12so2091573qtf.3;
        Sun, 01 Sep 2019 14:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FhEhGYlJyknnVLOLo4oWzBHV63OaArmPf55KzUhy0U8=;
        b=Z5PSBRPFy1AfcggRNGz8n0RkalGr8cJbH8okpPGWQcjSg7SxXAXH6mJOQVfKYb7LCh
         38soZHOEkYlLulZwcOEVkmDP19Dsnaz8VX8yO+fIXz3plGx8MfPTiHGPTGT4iX6vUgGR
         EPzrEN1jo4tB1UbhKj14PP9kJB7S+bJwrTLr8PPLW7ncFXb9cFvfvi19c0JwKJEvRaH9
         FaX5kqUoNtR/XPdotCVQAZLAJK0vO+aGKpj57oFl3tIUNM8NGohCh7o8MCOakzEjIHDR
         59HogDssGHBs7HtNcMg1fKYCqu+t2EAAQ6xRdBisagGrNFsl6Ioe5p/TwGtntrWzzu4t
         kbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FhEhGYlJyknnVLOLo4oWzBHV63OaArmPf55KzUhy0U8=;
        b=sVpn2la/M7bJOpxaKH5cvW9AYtw4MgMfYF9fKdph88GZlldDmVKH7FD2TlpqDz2a9d
         WYVImxrv+wVatihAxez73Jqd9MAJc9ObcdNAfETfQHmENeY0nkh6jJLY2Gm308Tgulfi
         j5aYwgqCs+BoyBm7eBYxLuuW9WOd9kvjtk0PgmIMDgJnmdoajPDrDHz0i93pfjKntlfL
         U+8AVUCTGc80P6oD+3GSfrk9TQWZTZPIj8ky545qMu/mEfRGbr8l7F6oxaMje7XVNEeL
         XaUxT45zHRcTq9hkJRMS2DfzT6FO5GQLHG6iud1cByvSV4t/WXeOCnaSHZs3nM//hvyy
         pusQ==
X-Gm-Message-State: APjAAAV7puuf9BEztPSVhflBnN4/1v7U/WU3zEFrTV6hHPaDDUynHClk
        XcBAl7NwTdjnSHZSrAR00j0iby/ZOz4=
X-Google-Smtp-Source: APXvYqzVXfpZo8HKaGFwHSmusSItRygTi3s47KDT5NIz0In5KLPQgipNoCr4tj9LVtYW9R+JKb8Hnw==
X-Received: by 2002:aed:2ca3:: with SMTP id g32mr26103328qtd.359.1567372304364;
        Sun, 01 Sep 2019 14:11:44 -0700 (PDT)
Received: from localhost.localdomain ([177.188.69.119])
        by smtp.gmail.com with ESMTPSA id k11sm5471751qtp.26.2019.09.01.14.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2019 14:11:43 -0700 (PDT)
From:   =?UTF-8?q?Lucas=20A=2E=20M=2E=20Magalh=C3=A3es?= 
        <lucmaga@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        helen.koike@collabora.com, edusbarretto@gmail.com,
        "Lucas A . M . Magalhaes" <lucmaga@gmail.com>
Subject: [PATCH] media: vimc: fla: Add virtual flash subdevice
Date:   Sun,  1 Sep 2019 18:11:39 -0300
Message-Id: <20190901211139.2405-1-lucmaga@gmail.com>
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
	"Collapse vimc into single monolithic driver" version 3.

I tested it using the v4l2-ctl and the v4l2-compliance. Apparently the compliance
doesn't test any of the standard flash controls. However I got this error:

test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        fail: v4l2-test-controls.cpp(830): subscribe event for control 'Flash Controls' failed

Is it really mandatory to implement the event mechanism?

Here is the full output of the v4l2-compliance

root@(none):/# /usr/local/bin/v4l2-compliance -d /dev/v4l-subdev6
v4l2-compliance SHA: b393a5408383b7341883857dfda78537f2f85ef6, 64 bits

Compliance test for vimc device /dev/v4l-subdev6:

Media Driver Info:
        Driver name      : vimc
        Model            : VIMC MDEV
        Serial           :
        Bus info         : platform:vimc
        Media version    : 5.3.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 5.3.0
Interface Info:
        ID               : 0x03000039
        Type             : V4L Sub-Device
Entity Info:
        ID               : 0x0000001c (28)
        Name             : Flash Controller
        Function         : Flash Controller

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK

Allow for multiple opens:
        test second /dev/v4l-subdev6 open: OK
        test for unlimited opens: OK

Debug ioctls:
[  342.293254] Flash Controller: =================  START STATUS  ================
[  342.293945] Flash Controller: ==================  END STATUS  ==================
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
                fail: v4l2-test-controls.cpp(830): subscribe event for control 'Flash Controls' failed
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)

ontrols: 11 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for vimc device /dev/v4l-subdev6: 41, Succeeded: 40, Failed: 1, Warnings: 0

 drivers/media/platform/vimc/Makefile      |   2 +-
 drivers/media/platform/vimc/vimc-common.c |   2 +
 drivers/media/platform/vimc/vimc-common.h |   3 +
 drivers/media/platform/vimc/vimc-core.c   |   6 +
 drivers/media/platform/vimc/vimc-flash.c  | 173 ++++++++++++++++++++++
 5 files changed, 185 insertions(+), 1 deletion(-)
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
index 5b2282de395c..af35169753f1 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -159,6 +159,9 @@ void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
 int vimc_sen_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
 void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
 
+int vimc_fla_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+
 /**
  * vimc_pads_init - initialize pads
  *
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 3749bfa88e40..019a52b0d4e6 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -100,6 +100,12 @@ static struct vimc_ent_config ent_config[] = {
 		.add = vimc_cap_add,
 		.rm = vimc_cap_rm,
 	},
+	{
+		.name = "Flash Controller",
+		.ved = NULL,
+		.add = vimc_fla_add,
+		.rm = vimc_fla_rm,
+	}
 };
 
 static const struct vimc_ent_link ent_links[] = {
diff --git a/drivers/media/platform/vimc/vimc-flash.c b/drivers/media/platform/vimc/vimc-flash.c
new file mode 100644
index 000000000000..ee15fcb4aa8f
--- /dev/null
+++ b/drivers/media/platform/vimc/vimc-flash.c
@@ -0,0 +1,173 @@
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
+#include <linux/vmalloc.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+#include "vimc-common.h"
+
+struct vimc_fla_device {
+	struct vimc_ent_device ved;
+	struct v4l2_subdev sd;
+	struct v4l2_ctrl_handler hdl;
+	int led_mode;
+	int indicator_intensity;
+	int torch_intensity;
+	int brightness;
+};
+
+static int vimc_fla_g_volatile_ctrl(struct v4l2_ctrl *c)
+{
+	struct vimc_fla_device *vfla =
+		container_of(c->handler, struct vimc_fla_device, hdl);
+
+	switch (c->id) {
+	case V4L2_CID_FLASH_TORCH_INTENSITY:
+		return vfla->torch_intensity;
+	case V4L2_CID_FLASH_INDICATOR_INTENSITY:
+		return vfla->indicator_intensity;
+	case V4L2_CID_FLASH_INTENSITY:
+		return vfla->brightness;
+	case V4L2_CID_FLASH_STROBE_STATUS:
+	case V4L2_CID_FLASH_FAULT:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+/* Flash Controls */
+static const struct v4l2_ctrl_config vimc_fla_ctrl_class = {
+	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY,
+	.id = VIMC_CID_VIMC_CLASS,
+	.name = "VIMC Flash Controls",
+	.type = V4L2_CTRL_TYPE_CTRL_CLASS,
+};
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
+		return 0;
+	case V4L2_CID_FLASH_STROBE:
+		return 0;
+	case V4L2_CID_FLASH_STROBE_STOP:
+		return 0;
+	case V4L2_CID_FLASH_TIMEOUT:
+		return 0;
+	case V4L2_CID_FLASH_INTENSITY:
+		vfla->brightness = c->val;
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
+	.g_volatile_ctrl = vimc_fla_g_volatile_ctrl,
+	.s_ctrl = vimc_fla_s_ctrl,
+};
+
+/* initialize device */
+static const struct v4l2_subdev_ops vimc_fla_ops = {
+	.core = NULL,
+};
+
+int vimc_fla_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
+{
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
+	struct vimc_fla_device *vfla;
+	int ret;
+
+	/* Allocate the vfla struct */
+	vfla = kzalloc(sizeof(*vfla), GFP_KERNEL);
+	if (!vfla)
+		return -ENOMEM;
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
+			  V4L2_CID_FLASH_TIMEOUT, 1, 10, 1, 10);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_TORCH_INTENSITY, 0, 255, 1, 255);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_INTENSITY, 0, 255, 1, 255);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_INDICATOR_INTENSITY, 0, 255, 1, 255);
+	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
+			  V4L2_CID_FLASH_STROBE_STATUS, 0, 0, 0, 0);
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
+				   vcfg->name,
+				   MEDIA_ENT_F_FLASH, 0, NULL,
+				   NULL, &vimc_fla_ops);
+	if (ret)
+		goto err_free_hdl;
+
+	/* Initialize standard values */
+	vfla->indicator_intensity = 0;
+	vfla->torch_intensity = 0;
+	vfla->brightness = 0;
+	vfla->led_mode = V4L2_FLASH_LED_MODE_NONE;
+
+	vcfg->ved = &vfla->ved;
+	return 0;
+
+err_free_hdl:
+	v4l2_ctrl_handler_free(&vfla->hdl);
+err_free_vfla:
+	kfree(vfla);
+
+	return ret;
+}
+
+void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
+{
+	struct vimc_ent_device *ved = vcfg->ved;
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

