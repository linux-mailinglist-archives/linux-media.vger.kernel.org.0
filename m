Return-Path: <linux-media+bounces-42836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E84C0B8D20C
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 00:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5C2C7E305C
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 22:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AC422D4DD;
	Sat, 20 Sep 2025 22:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWGmEeBJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDBE1DF27F
	for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 22:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758408739; cv=none; b=n5MaHbbcJK49lMEp8hc7rxCZ9xQzLmtWPzzDKaqgLAbXo70BX5y95rheWqQuZwEwEFNMVo9kf4JXA+doMq+jtE3bXXQj4GoJ22v8wDX1XQzyTXsQTia5FMD4SX52Z9sJ0mODvVgsGbGnesDwyzZYNMujDbqab6t8DNBVnTh5VVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758408739; c=relaxed/simple;
	bh=aJfEvIc1NdLGBcUJgWs0H3jQOP07X7qtQfkLKlTEno0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rN1mU/z7JuuDGCdKJzRHDzgyF+uBBtLbPn6xOYHU5mRRryybIzM4egBeAA7HhjK0GnWJicJSuWsnafAaglVQl/G2Lh9KJWXfhsysG6OO15poDaiWL5UR0B+WFiq29WZgBYxClqP2lsRkMQoCQprphhJ/51mp94zrzZBTRf49QkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWGmEeBJ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b55115148b4so1960807a12.3
        for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 15:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758408737; x=1759013537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qvabovd6exkrtvk5aKX60w6o7MqzSjRxPqJB3uqAe+Q=;
        b=DWGmEeBJ1BmJUcxRmFEDZK5/aucdGq/C5Kq24L62mSl1xGZC7ZxdPqtErrpyvHKYL8
         ijmMTkQ1UdMBRJc+x2vwN/LNpAjMLvYMhmnreOLLUeGfOXSWw4eL39MUFbZ1dCQN0SQZ
         SxA+yQjQoerA7sr46JXBBJ64Z+q+i75Mdd8IAPLUfsyj0bZPqoVKrWNGJvHSvS3CwL5O
         lf1PuuBc8z19wDQoHFSKFZvjWR3YI8qv+NIMpog9PxbDfgFs0Qm3wuF0RHOuQAALlgZW
         1SPWw0Z72hvKdzJZqaUH7/y6s6jl2PD0I4zEVoiRc3F6fwk9OEP9RYorUuwH6lm5LJIQ
         e+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758408737; x=1759013537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvabovd6exkrtvk5aKX60w6o7MqzSjRxPqJB3uqAe+Q=;
        b=qoodYt7v+Luzv2uC8ArkXd0we+ACb4hJ9BqMRSO0BJSdpfQ61ZQnnZzzAmr4sql4ro
         8xwDvDM5QEpVBIzJYFUM+KLVEiqg00TJqF5M4XLkUte15IG/dDxalupwJOzH7qKkQ0FX
         KDufW91lU2jQum7II0ovbP9JzkcZ+bkgh5B224yr56RhmNph+cIdsJCUDJdHjbTolsOj
         2+YN3NC6LA8fWC/W//J4RlRLkZQt7QnXH7xbbg+9SFBnBFotkZOtM7OfinJw/dEHAxA8
         CHeq9Cqwq8s7FWCZMcDtSekGQxFf/W/i+hiiCxOAHmwqqXAAd1QkJt2SgN0H61+H5JP0
         apEQ==
X-Gm-Message-State: AOJu0YxkLFrcXoQzqsW70PM/fBkneqxCJz0TaAHBgPxgSFNMnmtkFlst
	8crb5lWutN0hN/AwHidr19vemjoQhFo0SamhoE1agxVMq8rTU2rUfuagBLPnUA==
X-Gm-Gg: ASbGncslqF+v1FFSq1ksGwyYvOI0TJP2JlNdqsaLoz4VCYB3Tlj0O8gylk8NK3LtPPH
	3hC/AkDUZcuHQNvpPwnsl7XSYYdSGM5KhQcwnZrCfKAJ5brKQlWxxJ7p4W6adwFlYEaBVVYShXq
	InyOuwVZf+cZLy75uxfCWwcHCwXSKb3VOgiGmw5Vo9t2LzhQDyb0tfRnmh9FFiXfNPQLo8we1Ij
	nMIoTDDB4goikTP9za58OBXEU+38V2937S/7lNWJiAuPZmDKIM4Dz25sLxYMatujzoDQHIODESF
	FvHZvysCuKBmo96gxaRoeIkoFHGrr8JzZNomVYwVuYd8jko7Zg18EmLzAhmU6667Ff+7vu3elJM
	kLSxzfKMbH44JPQt7pXpN5d4=
X-Google-Smtp-Source: AGHT+IEoyExlS6rYPTpon15iXuE+6tLaiZklhi4QcFOQ+OzZY3ty4xX+fxKtzGTX+6wtazkljaTTJg==
X-Received: by 2002:a17:903:32ca:b0:26c:3e5d:43b6 with SMTP id d9443c01a7336-26c3e5d4675mr92067215ad.32.1758408736729;
        Sat, 20 Sep 2025 15:52:16 -0700 (PDT)
Received: from fedora ([172.59.162.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980310e89sm91565035ad.99.2025.09.20.15.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 15:52:15 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v1] media: i2c: wm8775: parameterize wm8775_platform_data based on config
Date: Sat, 20 Sep 2025 15:52:07 -0700
Message-ID: <20250920225207.864348-1-alex.t.tran@gmail.com>
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
 drivers/media/i2c/wm8775.c          | 114 ++++++++++++++++------------
 drivers/media/pci/cx88/cx88-video.c |   4 +-
 include/media/i2c/wm8775.h          |  25 ++++--
 3 files changed, 88 insertions(+), 55 deletions(-)

diff --git a/drivers/media/i2c/wm8775.c b/drivers/media/i2c/wm8775.c
index d4c83c398..1fec8c0c2 100644
--- a/drivers/media/i2c/wm8775.c
+++ b/drivers/media/i2c/wm8775.c
@@ -50,6 +50,48 @@ struct wm8775_state {
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
+	.alc_ctrl_2 =
+		0x185, /* Enable gain control, use zero cross detection, ALC hold time 42.6 ms */
+	.alc_ctrl_3 =
+		0x0a2, /* ALC gain ramp up delay 34 s, ALC gain ramp down delay 33 ms */
+	.noise_gate = 0x005, /* Enable noise gate, threshold -72dBfs */
+	.limiter_ctrl =
+		0x07a, /* Transient window 4ms, lower PGA gain limit -1dB */
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
+	.alc_ctrl_1 =
+		0x1bb, /* ALC stereo, ALC target level -5dB FS, ALC max gain +8dB */
+	.alc_ctrl_2 = WM8775_REG_UNUSED,
+	.alc_ctrl_3 =
+		0x0a2, /* ALC gain ramp up delay 34 s, ALC gain ramp down delay 33 ms */
+	.noise_gate = 0x005, /* Enable noise gate, threshold -72dBfs */
+	.limiter_ctrl = 0x0fb, /* Transient window 4ms, ALC min gain -5dB  */
+	.adc_mixer = WM8775_REG_UNUSED,
+	.should_set_audio = true, /* set volume/mute/mux */
+};
+
 static inline struct wm8775_state *to_state(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct wm8775_state, sd);
@@ -196,12 +238,8 @@ static int wm8775_probe(struct i2c_client *client,
 	struct wm8775_state *state;
 	struct v4l2_subdev *sd;
 	int err;
-	bool is_nova_s = false;
-
-	if (client->dev.platform_data) {
-		struct wm8775_platform_data *data = client->dev.platform_data;
-		is_nova_s = data->is_nova_s;
-	}
+	struct wm8775_platform_data *data =
+		client->dev.platform_data ?: &wm8775_standard_cfg;
 
 	/* Check if the adapter supports the needed features */
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
@@ -234,49 +272,29 @@ static int wm8775_probe(struct i2c_client *client,
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
index 8cffdacf6..efba7477f 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1354,9 +1354,9 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
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
index 836758176..856f9ec64 100644
--- a/include/media/i2c/wm8775.h
+++ b/include/media/i2c/wm8775.h
@@ -20,13 +20,28 @@
 #define WM8775_AIN3 4
 #define WM8775_AIN4 8
 
+#define WM8775_REG_UNUSED ((u16)-1)
 
 struct wm8775_platform_data {
-	/*
-	 * FIXME: Instead, we should parametrize the params
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


