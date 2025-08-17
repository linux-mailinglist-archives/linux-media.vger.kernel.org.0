Return-Path: <linux-media+bounces-40049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1524DB29474
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 19:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9E351B262EF
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 17:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A2F303C99;
	Sun, 17 Aug 2025 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/igG5wD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD182FFDD5;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450584; cv=none; b=Jn6an1pLqOFNTqrZh7o7wMEzQEr2LeFc8Vm9EfjWDE7/B/bMzo0JbYhA1KC4DdAlL5yXYjTOlJdAkz0tzxc+9681mKNoQt2HDPRO3A9AtaR6Ha2o0lk9fVGj0K33ucm5A87blhxZo50Qfdi59aUPl4qlYoX14tAdlIT2zR1I5H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450584; c=relaxed/simple;
	bh=QH1lLHa0Qn4oD7Q4DnkxZWzudMCKYCpdrR+3O5VFHn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNJsxY5ZPVPiNXjKuL3Z+vIhtxDNcN7RACNdHv6mBPdGhbU7df1iLInfJ6zICAkHEZPiMwY/lZKFEMRGDDwoD8ouhE0yXWOFV6+M1h8iENcNFP2k96RD/GArTtNNky6xqgcXQh7d04XJBzDuZ1j+rYZIuJgI3ozqB3W9qy34Sds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/igG5wD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 616CDC16AAE;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755450584;
	bh=QH1lLHa0Qn4oD7Q4DnkxZWzudMCKYCpdrR+3O5VFHn0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F/igG5wD79uC1tgC/Ms1DxCZujiZAysT3G41kZZUyxt6BcPwyfoG19xslTjqMnZYK
	 U74QphhddRpngwmWXV0myyp0N6QlMHx/n1qH6nzi8LUCDR5hDH4FfzpcvlUkcpgq5c
	 KgzaCT1pUbAfbglDgEDY9pH1lkjrB9BC9FzKX8aXC1HCUcPa08e/tiWZYXrhUhq7sL
	 +EIbEYGwWErBm4jhziAt91Sp5mT4OMVWFpj5h55LsNOmNiwtGUrnhUd5d5A7DnX3L8
	 RzvpvH7jyWoFaPo8qQYUucAnDsrgwA6zrkP9SlCLBAGGKQPplD4yZUt9fZY7Y4HYuS
	 rbjFhBMF+aWjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E3ACA0EED;
	Sun, 17 Aug 2025 17:09:44 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 17 Aug 2025 19:09:23 +0200
Subject: [PATCH 4/7] media: i2c: dw9719: Add DW9718S support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250817-dw9719-v1-4-426f46c69a5a@apitzsch.eu>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
In-Reply-To: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Val Packett <val@packett.cool>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755450582; l=5188;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=8uwvY0cyVGXLUCsLbJPIIy5Sce02KuOJAaciNhQUmcY=;
 b=6x2LjyDVp7HcaW33RAPJ3ZbJgGww9mYh3aLgEGM8+RSHN7jIvVimiBXBpxejzFd6NmOW1Ow33
 iIsuoCOeJEyCxtC37G4Ex16jfd98vLTjfwvgeJ8zlzidkON2IU0dQ2y
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Val Packett <val@packett.cool>

The DW9718S is a similar part that uses a different register set but
follows the same method of operation otherwise. Add support for it
to the existing dw9719 driver.

Tested on the Moto E5 (motorola-nora) smartphone.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/dw9719.c | 67 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 7ce66eaede5a2a1ba9c4c30c0efc5fafcca339a0..61758a9450aee20c9226e879a15eccfced9a3e96 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -23,6 +23,25 @@
 #define DW9719_CTRL_STEPS	16
 #define DW9719_CTRL_DELAY_US	1000
 
+#define DW9718S_PD			CCI_REG8(0)
+
+#define DW9718S_CONTROL			CCI_REG8(1)
+#define DW9718S_CONTROL_SW_LINEAR	BIT(0)
+#define DW9718S_CONTROL_SAC_SHIFT	1
+#define DW9718S_CONTROL_SAC_MASK	0x7
+#define DW9718S_CONTROL_OCP_DISABLE	BIT(4)
+#define DW9718S_CONTROL_UVLO_DISABLE	BIT(5)
+#define DW9718S_DEFAULT_SAC		4
+
+#define DW9718S_VCM_CURRENT		CCI_REG16(2)
+
+#define DW9718S_SW			CCI_REG8(4)
+#define DW9718S_SW_VCM_FREQ_MASK	0xF
+#define DW9718S_DEFAULT_VCM_FREQ	0
+
+#define DW9718S_SACT			CCI_REG8(5)
+#define DW9718S_SACT_PERIOD_8_8MS	0x19
+
 #define DW9719_INFO			CCI_REG8(0)
 #define DW9719_ID			0xF1
 #define DW9761_ID			0xF4
@@ -53,6 +72,7 @@
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
 enum dw9719_model {
+	DW9718S,
 	DW9719,
 	DW9761,
 };
@@ -80,6 +100,7 @@ static int dw9719_power_down(struct dw9719_device *dw9719)
 
 static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 {
+	u32 reg_pwr;
 	u64 val;
 	int ret;
 	int err;
@@ -89,13 +110,21 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		return ret;
 
 	/* Jiggle SCL pin to wake up device */
-	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_SHUTDOWN, &ret);
+	reg_pwr = (dw9719->model == DW9718S) ? DW9718S_PD : DW9719_CONTROL;
+	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN, &ret);
 	fsleep(100);
-	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_STANDBY, &ret);
+	cci_write(dw9719->regmap, reg_pwr, DW9719_STANDBY, &ret);
 	/* Need 100us to transit from SHUTDOWN to STANDBY */
 	fsleep(100);
 
 	if (detect) {
+		/* This model does not have an INFO register */
+		if (dw9719->model == DW9718S) {
+			dw9719->sac_mode = DW9718S_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9718S_DEFAULT_VCM_FREQ;
+			goto props;
+		}
+
 		ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
 		if (ret < 0)
 			return ret;
@@ -119,6 +148,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			return -ENXIO;
 		}
 
+props:
 		/* Optional indication of SAC mode select */
 		device_property_read_u32(dw9719->dev, "dongwoon,sac-mode",
 					 &dw9719->sac_mode);
@@ -134,14 +164,30 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 					 &dw9719->vcm_freq);
 	}
 
-	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
-	cci_write(dw9719->regmap, DW9719_MODE, dw9719->mode_low_bits |
-			  (dw9719->sac_mode << DW9719_MODE_SAC_SHIFT), &ret);
-	cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
-
-	if (dw9719->model == DW9761)
+	switch (dw9719->model) {
+	case DW9718S:
+		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */
+		dw9719->sac_mode &= DW9718S_CONTROL_SAC_MASK;
+		cci_write(dw9719->regmap, DW9718S_CONTROL,
+			  DW9718S_CONTROL_SW_LINEAR |
+			  (dw9719->sac_mode << DW9718S_CONTROL_SAC_SHIFT) |
+			  DW9718S_CONTROL_OCP_DISABLE |
+			  DW9718S_CONTROL_UVLO_DISABLE, &ret);
+		cci_write(dw9719->regmap, DW9718S_SACT,
+			  DW9718S_SACT_PERIOD_8_8MS, &ret);
+		cci_write(dw9719->regmap, DW9718S_SW,
+			  dw9719->vcm_freq & DW9718S_SW_VCM_FREQ_MASK, &ret);
+		break;
+	case DW9761:
 		cci_write(dw9719->regmap, DW9761_VCM_PRELOAD,
 			  DW9761_DEFAULT_VCM_PRELOAD, &ret);
+		fallthrough;
+	case DW9719:
+		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
+		cci_write(dw9719->regmap, DW9719_MODE, dw9719->mode_low_bits |
+				  (dw9719->sac_mode << DW9719_MODE_SAC_SHIFT), &ret);
+		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
+	}
 
 	if (ret)
 		dw9719_power_down(dw9719);
@@ -151,7 +197,9 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 
 static int dw9719_t_focus_abs(struct dw9719_device *dw9719, s32 value)
 {
-	return cci_write(dw9719->regmap, DW9719_VCM_CURRENT, value, NULL);
+	u32 reg = (dw9719->model == DW9718S) ? DW9718S_VCM_CURRENT
+					     : DW9719_VCM_CURRENT;
+	return cci_write(dw9719->regmap, reg, value, NULL);
 }
 
 static int dw9719_set_ctrl(struct v4l2_ctrl *ctrl)
@@ -363,6 +411,7 @@ static void dw9719_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id dw9719_id_table[] = {
+	{ "dw9718s", .driver_data = DW9718S },
 	{ "dw9719", .driver_data = DW9719 },
 	{ "dw9761", .driver_data = DW9761 },
 	{ }

-- 
2.50.1



