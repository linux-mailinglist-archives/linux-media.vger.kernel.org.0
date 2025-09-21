Return-Path: <linux-media+bounces-42846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 570F5B8E396
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 21:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E160017923D
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 19:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EC1212566;
	Sun, 21 Sep 2025 19:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3jeGt7v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB4E2BB1D
	for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 19:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758481327; cv=none; b=rCuAuSZAkwciiIdAQH038xktC0i6UGmmijIcqaW3C9QFYupWDmXhUeN7rJkUyDmgjRLxEoUwx3tu6gx/3eCOwqJWxh5r8T74UiBwRxoeJnLWv3Hi+vvj8TsBzBlbfXTiZ8A9rNQ5UcnO3PaIJ+PdGEyO/rirOvtHgYt48lKo9D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758481327; c=relaxed/simple;
	bh=MGtwA1ORP1SZWS3yFHFC1So7GPy8+TI3Y+7Wnm9Gi94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vAe3ChToNUoGjOEUge9e+dw0KZW349o3sXtK+1OlCP3dZOVMBWmbRFop9ZuCkBCONrddRpUpJiPAM7LQSHI7SX7URcze2/nEFMJQn2v8G7Zm8sP1siGRvElF0t7wLLMATlNxZfZPEbuLWuT7kvQ+ptIMH3JrmDTcDmRq/12nPgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3jeGt7v; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4c29d2ea05so3464837a12.0
        for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 12:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758481325; x=1759086125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trXhhaVo1V956DTPgVzHkWvjZXBUgzeYR4SoTGMR0QE=;
        b=F3jeGt7vGf3VEutZfkQ65VNbD9YVuwbF4jRerqwXees+aXKKqzBqBnW+xSBN3oLInu
         5aHqb4WblEaHqBBxz/xQzp1YlL7Es4ujpVu1RXyLvj1vjgZi6RM02OGTycGlBpJ0N13m
         mweb8QEdaebAHKS3THK53Q3NCrLoW0iBGg2ODQf7d7CZiDVpIaJFYj+DXOfnF2Q0ZrXB
         z9Wn0ve2fsXYQlfGwlo/ii3A/j3YrdWcHAzDhbcHU6uTpB9l9mkYvw5C0mz1EKDSUeGZ
         sNfdgKzXB39heBDr/UpQBVE6VXZPVyrJDgU1ISULqEKA82LrSvSp7PT15igExXBE+IfT
         ijvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758481325; x=1759086125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trXhhaVo1V956DTPgVzHkWvjZXBUgzeYR4SoTGMR0QE=;
        b=LUH22ATwunIpDycH/Ozt68S9L2V34ldZomUO9UdcG6NZLdvq3hLo7vDZ+4iAiRoHPr
         3oivEFQ11Ax9yuXE2U1NnjSTKtfpSb2NmsCSoQHP/b6N2aRc5Aqh8HwnnwYwOjv90Y+d
         VTpQUPsvB+hyJLyuE1qIhS+nRsq6VFD0DJssdUtl4lAURMjR+HIv8yHisYH4EZ52mjej
         roLwoxBDe9W6MJ7wMmFO6XiWpWmdyInHFIUkL+9lhEFFGfQ2xAhjGg/Cm9zsOggiOCft
         SoFMDZHXquskX1xdY58AVs5Id6pFA8QrCkBfZoHIBsHHElOEGV1Bg6711oxi2ksf5teL
         r35A==
X-Gm-Message-State: AOJu0YwhzJrOsrNNd+SEVy+VfrF/pl7pM7av5creBV1S043k2LjXgnya
	jFlUFNCAxG6o0tO639KWG2VWFc3o+DEsj5EyhsRpS/yOa82003ZJVG3yGoUZMS2l
X-Gm-Gg: ASbGncs9TbTaD2hAGiUFHrr9QKIgi3Pw2lOZuo2ZYY8yL9GW+Fo2qMfOJqSWOjCIoZ0
	BRacdiZWN6CP2FEyqgp6cOq6eWma962kzm5KdOwo6HEtt70h2LeDFkEZfwa0jfp/+4TWlAN35Ip
	9UWOfQtObpl5DLklQD6V1I0DUXKLVcNRoPh5tTLxbHA5riGZ10qKB1SMFsrHN8qQZlAB3vAllKj
	VsJqfzZ6ch1nSti81DG75mv74OvGD9n4tmfN3FkNTlaXa84DGYCXY4dN2c9k2x7uREnJX3Bhv9+
	OtMC7kVM4pBwMP5Lx0IbO09Y6ZQH/iShq5smGqTnzwyIcWdJhGSr85VwSyYcAjVJdEzs76UsZVO
	572CpEhKV135xTl6B3JWqOxZGJBnTGAwHMA==
X-Google-Smtp-Source: AGHT+IGjix9Q3SsImAjWNlj3eDVMBvG9InLq50vg9siHUGNZyuZAe8aBBpMUA8CYYa0XVd+x30ifeQ==
X-Received: by 2002:a17:902:ecc3:b0:26c:4280:4860 with SMTP id d9443c01a7336-26c42804be8mr114393475ad.8.1758481325075;
        Sun, 21 Sep 2025 12:02:05 -0700 (PDT)
Received: from fedora ([172.59.162.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2699ae52db1sm99784565ad.43.2025.09.21.12.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 12:02:04 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	hansg@kernel.org,
	ribalda@chromium.org,
	laurent.pinchart@ideasonboard.com,
	cascardo@igalia.com,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v4] media: i2c: wm8775: parameterize wm8775_platform_data based on config
Date: Sun, 21 Sep 2025 12:01:55 -0700
Message-ID: <20250921190155.1013277-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parameterized wm8775_platform_data struct, removing the single boolean
for determining device type. wm8775_standard_cfg struct will be used
for standard devices and wm8775_nova_s_cfg for nova_s devices. 

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
Changes in v2:
- rebased from mchehab linux media onto media committers tree
- resolve patch and build errors
Changes in v3:
- cc updated maintainers list
Changes in v4:
- exported config symbols
- cx88_core wm8775_data field converted to pointer
 drivers/media/i2c/wm8775.c          | 111 ++++++++++++++++------------
 drivers/media/pci/cx88/cx88-video.c |   6 +-
 drivers/media/pci/cx88/cx88.h       |   2 +-
 include/media/i2c/wm8775.h          |  25 +++++--
 4 files changed, 87 insertions(+), 57 deletions(-)

diff --git a/drivers/media/i2c/wm8775.c b/drivers/media/i2c/wm8775.c
index 56778d3bc..a6c605303 100644
--- a/drivers/media/i2c/wm8775.c
+++ b/drivers/media/i2c/wm8775.c
@@ -50,6 +50,45 @@ struct wm8775_state {
 	u8 input;		/* Last selected input (0-0xf) */
 };
 
+struct wm8775_platform_data wm8775_standard_cfg = {
+	.reset = 0x000, /* RESET */
+	.zero_cross_timeout = 0x000, /* Disable zero cross detect timeout */
+	.interface_ctrl =
+		0x021, /* HPF enable, left justified, 24-bit (Philips) mode */
+	.master_mode = 0x102, /* Master mode, clock ratio 256fs */
+	.powerdown = 0x000, /* Powered up */
+	.adc_l = 0x1d4, /* ADC gain +2.5dB, enable zero cross */
+	.adc_r = 0x1d4, /* ADC gain +2.5dB, enable zero cross */
+	.alc_ctrl_1 =
+		0x1bf, /* ALC Stereo, ALC target level -1dB FS max gain +8dB */
+	.alc_ctrl_2 = 0x185, /* Enable gain control, ALC hold time 42.6 ms */
+	.alc_ctrl_3 = 0x0a2, /* Ramp up delay 34 s, ramp down delay 33 ms */
+	.noise_gate = 0x005, /* Enable noise gate, threshold -72dBfs */
+	.limiter_ctrl = 0x07a, /* Window 4ms, lower PGA gain limit -1dB */
+	.adc_mixer = 0x102, /* LRBOTH = 1, use input 2. */
+	.should_set_audio = false,
+};
+EXPORT_SYMBOL_GPL(wm8775_standard_cfg);
+
+struct wm8775_platform_data wm8775_nova_s_cfg = {
+	.reset = 0x000, /* RESET */
+	.zero_cross_timeout = 0x000, /* Disable zero cross detect timeout */
+	.interface_ctrl =
+		0x021, /* HPF enable, left justified, 24-bit (Philips) mode */
+	.master_mode = 0x102, /* Master mode, clock ratio 256fs */
+	.powerdown = 0x000, /* Powered up */
+	.adc_l = WM8775_REG_UNUSED,
+	.adc_r = WM8775_REG_UNUSED,
+	.alc_ctrl_1 = 0x1bb, /* Stereo, target level -5dB FS, max gain +8dB */
+	.alc_ctrl_2 = WM8775_REG_UNUSED,
+	.alc_ctrl_3 = 0x0a2, /* Ramp up delay 34 s, ramp down delay 33 ms */
+	.noise_gate = 0x005, /* Enable noise gate, threshold -72dBfs */
+	.limiter_ctrl = 0x0fb, /* Transient window 4ms, ALC min gain -5dB  */
+	.adc_mixer = WM8775_REG_UNUSED,
+	.should_set_audio = true, /* set volume/mute/mux */
+};
+EXPORT_SYMBOL_GPL(wm8775_nova_s_cfg);
+
 static inline struct wm8775_state *to_state(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct wm8775_state, sd);
@@ -195,12 +234,8 @@ static int wm8775_probe(struct i2c_client *client)
 	struct wm8775_state *state;
 	struct v4l2_subdev *sd;
 	int err;
-	bool is_nova_s = false;
-
-	if (client->dev.platform_data) {
-		struct wm8775_platform_data *data = client->dev.platform_data;
-		is_nova_s = data->is_nova_s;
-	}
+	struct wm8775_platform_data *data = client->dev.platform_data ?:
+						    &wm8775_standard_cfg;
 
 	/* Check if the adapter supports the needed features */
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
@@ -233,49 +268,29 @@ static int wm8775_probe(struct i2c_client *client)
 	}
 
 	/* Initialize wm8775 */
+	wm8775_write(sd, R23, data->reset);
+	wm8775_write(sd, R7, data->zero_cross_timeout);
+	wm8775_write(sd, R11, data->interface_ctrl);
+	wm8775_write(sd, R12, data->master_mode);
+	wm8775_write(sd, R13, data->powerdown);
+	if (data->adc_l != WM8775_REG_UNUSED)
+		wm8775_write(sd, R14, data->adc_l);
+	if (data->adc_r != WM8775_REG_UNUSED)
+		wm8775_write(sd, R15, data->adc_r);
+	wm8775_write(sd, R16, data->alc_ctrl_1);
+	if (data->alc_ctrl_2 != WM8775_REG_UNUSED)
+		wm8775_write(sd, R17, data->alc_ctrl_2);
+	else
+		wm8775_write(sd, R17,
+			     (state->loud->val ? ALC_EN : 0) | ALC_HOLD);
+	wm8775_write(sd, R18, data->alc_ctrl_3);
+	wm8775_write(sd, R19, data->noise_gate);
+	wm8775_write(sd, R20, data->limiter_ctrl);
+	if (data->adc_mixer != WM8775_REG_UNUSED)
+		wm8775_write(sd, R21, data->adc_mixer);
+	if (data->should_set_audio)
+		wm8775_set_audio(sd, 1);
 
-	/* RESET */
-	wm8775_write(sd, R23, 0x000);
-	/* Disable zero cross detect timeout */
-	wm8775_write(sd, R7, 0x000);
-	/* HPF enable, left justified, 24-bit (Philips) mode */
-	wm8775_write(sd, R11, 0x021);
-	/* Master mode, clock ratio 256fs */
-	wm8775_write(sd, R12, 0x102);
-	/* Powered up */
-	wm8775_write(sd, R13, 0x000);
-
-	if (!is_nova_s) {
-		/* ADC gain +2.5dB, enable zero cross */
-		wm8775_write(sd, R14, 0x1d4);
-		/* ADC gain +2.5dB, enable zero cross */
-		wm8775_write(sd, R15, 0x1d4);
-		/* ALC Stereo, ALC target level -1dB FS max gain +8dB */
-		wm8775_write(sd, R16, 0x1bf);
-		/* Enable gain control, use zero cross detection,
-		   ALC hold time 42.6 ms */
-		wm8775_write(sd, R17, 0x185);
-	} else {
-		/* ALC stereo, ALC target level -5dB FS, ALC max gain +8dB */
-		wm8775_write(sd, R16, 0x1bb);
-		/* Set ALC mode and hold time */
-		wm8775_write(sd, R17, (state->loud->val ? ALC_EN : 0) | ALC_HOLD);
-	}
-	/* ALC gain ramp up delay 34 s, ALC gain ramp down delay 33 ms */
-	wm8775_write(sd, R18, 0x0a2);
-	/* Enable noise gate, threshold -72dBfs */
-	wm8775_write(sd, R19, 0x005);
-	if (!is_nova_s) {
-		/* Transient window 4ms, lower PGA gain limit -1dB */
-		wm8775_write(sd, R20, 0x07a);
-		/* LRBOTH = 1, use input 2. */
-		wm8775_write(sd, R21, 0x102);
-	} else {
-		/* Transient window 4ms, ALC min gain -5dB  */
-		wm8775_write(sd, R20, 0x0fb);
-
-		wm8775_set_audio(sd, 1);      /* set volume/mute/mux */
-	}
 	return 0;
 }
 
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index 0c8732768..2054daeba 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1348,14 +1348,14 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 		struct i2c_board_info wm8775_info = {
 			.type = "wm8775",
 			.addr = 0x36 >> 1,
-			.platform_data = &core->wm8775_data,
+			.platform_data = core->wm8775_data,
 		};
 		struct v4l2_subdev *sd;
 
 		if (core->boardnr == CX88_BOARD_HAUPPAUGE_NOVASPLUS_S1)
-			core->wm8775_data.is_nova_s = true;
+			core->wm8775_data = &wm8775_nova_s_cfg;
 		else
-			core->wm8775_data.is_nova_s = false;
+			core->wm8775_data = &wm8775_standard_cfg;
 
 		sd = v4l2_i2c_new_subdev_board(&core->v4l2_dev, &core->i2c_adap,
 					       &wm8775_info, NULL);
diff --git a/drivers/media/pci/cx88/cx88.h b/drivers/media/pci/cx88/cx88.h
index 2ff3226a5..c8f85d2f4 100644
--- a/drivers/media/pci/cx88/cx88.h
+++ b/drivers/media/pci/cx88/cx88.h
@@ -391,7 +391,7 @@ struct cx88_core {
 
 	/* I2C remote data */
 	struct IR_i2c_init_data    init_data;
-	struct wm8775_platform_data wm8775_data;
+	struct wm8775_platform_data *wm8775_data;
 
 	struct mutex               lock;
 	/* various v4l controls */
diff --git a/include/media/i2c/wm8775.h b/include/media/i2c/wm8775.h
index a02695ee3..99678d165 100644
--- a/include/media/i2c/wm8775.h
+++ b/include/media/i2c/wm8775.h
@@ -20,13 +20,28 @@
 #define WM8775_AIN3 4
 #define WM8775_AIN4 8
 
+#define WM8775_REG_UNUSED ((u16)-1)
 
 struct wm8775_platform_data {
-	/*
-	 * FIXME: Instead, we should parameterize the params
-	 * that need different settings between ivtv, pvrusb2, and Nova-S
-	 */
-	bool is_nova_s;
+	u16 reset; /* RESET (R23) */
+	u16 zero_cross_timeout; /* Zero cross detect timeout (R7) */
+	u16 interface_ctrl; /* Interface control (R11) */
+	u16 master_mode; /* Master mode (R12) */
+	u16 powerdown; /* Power down (R13) */
+
+	u16 adc_l; /* ADC left (R14) */
+	u16 adc_r; /* ADC right (R15) */
+	u16 alc_ctrl_1; /* ALC control 1 (R16)*/
+	u16 alc_ctrl_2; /* ALC control 2 (R17) */
+	u16 alc_ctrl_3; /* ALC control 3 (R18) */
+	u16 noise_gate; /* Noise gate (R19) */
+	u16 limiter_ctrl; /* Limiter control (R20) */
+	u16 adc_mixer; /* ADC mixer control (R21) */
+
+	bool should_set_audio;
 };
 
+extern struct wm8775_platform_data wm8775_nova_s_cfg;
+extern struct wm8775_platform_data wm8775_standard_cfg;
+
 #endif
-- 
2.51.0


