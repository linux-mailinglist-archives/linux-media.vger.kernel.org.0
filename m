Return-Path: <linux-media+bounces-42837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B02BB8D2B3
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 02:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B843177741
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 00:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF161553A3;
	Sun, 21 Sep 2025 00:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cy2r37Ap"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B772AE97
	for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 00:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758414665; cv=none; b=J3Nk2AQ2Pe0BbsC09xYJF0H3OrgAD1+k5IrSFdUlYwqvbduqN8lIcZhEP74YxsGew1JHrY9zmVJWydatVWAvYZarPQS71sgIYZxvEEIyvjCsTdKhVnGoeiM4Ksm60C6A14zcNApJujJqrQU6Nk9CLRK/19Ef3xHX0piZHlHVhno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758414665; c=relaxed/simple;
	bh=t4qjfS0JajmUmGRVlQ1ZwdnkeMbZKYR+so4Sw5Xf0H0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7/MdCuiXuDdD5FVKpBvJNjDtEpHH3SHb0B8yuJhxfKjD5/F/JDBorvYPgCO1f7/GAdGLNsm+IEC2iUiDnVa9CEnuX/RrKrh++cqGS03sqLJjUqi5O249HB0JL8LnbrrvUpJiA/FZQrNReIZHGPhtrCtto4tDCYaRdkVvFCzbio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cy2r37Ap; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77e69f69281so1781105b3a.1
        for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 17:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758414661; x=1759019461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+58Sx+Vf9qDRURRTyjx8USlv7zRGtIJ/9Bqpeei8a8=;
        b=Cy2r37ApM7eLCz7QosDowXvK0nCeed7M464rDbZDe77uotciHAzpvw7Qm6+P9ycv3f
         VJGeuehtO7xRSoAaggDa2EO0Qvk2vhRbv/XPZ+GwdBe2I2MLiZjQsnKW2GWQifEkDqrx
         hBhU1A+8sl8AjBxll/rX616tRXw7RHGSKRjZHx3I2NPR5m1tFzR2LGM2vV3vmuAKlCYC
         He0SnJw19TkvAwFH0JJl/wJe43AHAUpR0JBm/3lkxsoExKuby4grel0Eh1JOLOQ6Ky/u
         mFwlxW2B1nVVgBYLhbatKEURzVLIarB6jnRkLFYTD43YZQs3gXkVSEsGWaGpR25pGjIa
         vWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758414661; x=1759019461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+58Sx+Vf9qDRURRTyjx8USlv7zRGtIJ/9Bqpeei8a8=;
        b=ILN78za8qZUd+92qBAKl4vkTP+9Cyv/6tziFNcP7lvQFlwND1T7kTBX770fxtXO5Mn
         zrl3tEVD1L3msi9+FYYTP5JWJAl957lmAjS+j5R9eD0wORLqwN6bXOfN05vCEdF29G+R
         RyTNHkMYumYQf3FWxLlbGwSWiwlE3IUzjA47AqTIgr/R5JT4aDnnUH+7+C8Ihe4OYrHM
         nuU86ZJ7RXAOrJqSwgDvTLn1znZCkjm6FRpSQVwzn4OnR3NxcFOvgf6QXSaHftoRRDfP
         oXikzX19ckBWYZVY4ODllR/t877n6aKAbJYY+Vz3Cfo3TLouTCBl9/CxEwSX3ZFwgYrV
         Ueeg==
X-Gm-Message-State: AOJu0Yycy0uFUanfv6apzrKl/1YjUqT2mxJ14I8FeBJT+Z5tN0ncBJv/
	EodW/36x8RXPRutUxTLyZ7vj49MHmIINz6DUCDzjVafU6m77+eRVzBfx
X-Gm-Gg: ASbGncsk58OGWkFn41adsRY7ELLn1hVda/tpx7kM3GUvWmttTy3mYpLsdjpYL4SZSNI
	cFYpyKeEFbgjczwQciidDcm6TP860zuhpED/KE3afdCB5ppNTUSl9VuGsBtLZKuhwAepm8w/vfH
	UWCINT8c5GZGoMKOeu4X/S6KYUq+rDxyiYVaPlcGYeTSopGOZCKmIrV8LbgDh90Iv79Ap1WT9aX
	bta3B13K2XTW9VbhsAU7/9fy1BdNPQch5KYQ0+LFOSynypNdME9thRXRc35z0nJKcSCtadNpPEs
	uTqEJ0haUFlHKdIP2P+1I+RqavwgPFfBjf47nUE6QWE5bk6SNvD+iC7+MEqYcS9/KVNpuULpwXf
	IOod47o14/jr9PDYWUtG9pDA=
X-Google-Smtp-Source: AGHT+IGq41WgnCrAeSw+woHi2U/JmzNR1alDHEIckZeunCloMf+3pg6EWv7zdT1YYGOKZuR2gl7c+g==
X-Received: by 2002:a05:6a20:728c:b0:249:467e:ba70 with SMTP id adf61e73a8af0-29218ad80a1mr11400793637.24.1758414661024;
        Sat, 20 Sep 2025 17:31:01 -0700 (PDT)
Received: from fedora ([172.59.162.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f23d92ef0sm1631575b3a.102.2025.09.20.17.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 17:31:00 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v2] media: i2c: wm8775: parameterize wm8775_platform_data based on config
Date: Sat, 20 Sep 2025 17:30:46 -0700
Message-ID: <20250921003046.946811-1-alex.t.tran@gmail.com>
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
 drivers/media/i2c/wm8775.c          | 109 ++++++++++++++++------------
 drivers/media/pci/cx88/cx88-video.c |   4 +-
 include/media/i2c/wm8775.h          |  25 +++++--
 3 files changed, 83 insertions(+), 55 deletions(-)

diff --git a/drivers/media/i2c/wm8775.c b/drivers/media/i2c/wm8775.c
index 56778d3bc..6218fc3fe 100644
--- a/drivers/media/i2c/wm8775.c
+++ b/drivers/media/i2c/wm8775.c
@@ -50,6 +50,43 @@ struct wm8775_state {
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
+
 static inline struct wm8775_state *to_state(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct wm8775_state, sd);
@@ -195,12 +232,8 @@ static int wm8775_probe(struct i2c_client *client)
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
@@ -233,49 +266,29 @@ static int wm8775_probe(struct i2c_client *client)
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
index 0c8732768..a3729fd73 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1353,9 +1353,9 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 		struct v4l2_subdev *sd;
 
 		if (core->boardnr == CX88_BOARD_HAUPPAUGE_NOVASPLUS_S1)
-			core->wm8775_data.is_nova_s = true;
+			core->wm8775_data = wm8775_nova_s_cfg;
 		else
-			core->wm8775_data.is_nova_s = false;
+			core->wm8775_data = wm8775_standard_cfg;
 
 		sd = v4l2_i2c_new_subdev_board(&core->v4l2_dev, &core->i2c_adap,
 					       &wm8775_info, NULL);
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


