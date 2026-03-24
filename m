Return-Path: <linux-media+bounces-56921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPsXC0oFw2lKnwQAu9opvQ
	(envelope-from <linux-media+bounces-56921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:42:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3211B31CF16
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 677673031D69
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 21:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B557F3630A1;
	Tue, 24 Mar 2026 21:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd9I4P9F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955EA362133
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388536; cv=none; b=SESBa7Lh0RbVEp9ypoyanhlEuJlucYyv+aF1AiA1XZh+iB8LZXOrUClbgtSCzTMmZyZJTwOTL+dTiqCJL/j2b10rrY0zNj42vfjMsxg0ll4WHUa9ekhsmeM8lkU3KoF3zaolIXH8BxNR3666iEfHJhv7owc1l8yMS4c6iFIKx5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388536; c=relaxed/simple;
	bh=Ee57EugqJBkqQgM9cOCn5nat+dNqMMp/HGLAUfLk3vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsvH9iogiLgma73AR/C2WpVtxgek0AoOQl7DpLZnnbrkHpzXYgE9LFvoZaPYV711m2vD3ZgvZQCpEzYoVIy27vrtBmd7wokDL47GZiu0GFbUt6vH2dbPADkVezuge5ir72GbY6wQn83RwQPYaeEQOGeRj/CrxCQqd7/3O944624=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd9I4P9F; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-126ea4e9694so11147994c88.1
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774388534; x=1774993334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAGnFJM2vdOXc5jzyYPjoXklMCuveWdc+fFF8+tCFwY=;
        b=nd9I4P9FakUADAj3njyLpzD72wKWLAtUZsVJlbgXJ1TH2usaSpDzCMog6Pd+uwACSE
         Mqw8IzIMDEaGUXWt3ENIo4q39YmC301HelDfta2VtjuvlKbmaGAxuA8sA1jLdSeAIkV1
         4Fdw6KfdBIJ4S2oMOS4GbLRSSatz0YwYV6HIzweDzX/li7/szGmKLDdmRgIXirixKjVd
         u6HTFXHqJBXQFkERTnQ+cfeuVibFsWz+giGgS1HmBRcFUwDMBeiNQoGsIrLUO43ioqXH
         dlHNTg1Yvf7Cpm+BfvQDxZzSeoDw41FuNJgpTZ5lM0q2qaAgbiRV1JW9ka1ubPmSlBQk
         27PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388534; x=1774993334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gAGnFJM2vdOXc5jzyYPjoXklMCuveWdc+fFF8+tCFwY=;
        b=nXqrqytDTdD9VTCAcdxBXVJP3zZMTb+w4IWy6MOVQvJUQZ1vRfj85QYrOez20gqVhM
         k6GCab5SuOrAtbodpkEt91Vf7xR3P4kQsU5fsokJsBzE2tyNYapPkhj2iO4mWwkROlL0
         jyfFYsnTZiy3acviisPaY2LZeVShcZ7EtHNSDOuAJvRdgZBnTYKpH7g9oUYKJKaT068H
         wFIFR1RccSPZ/rpn2l0pIQxlunjC7+XKzuQuFh7l0nQSbT9oVSyx22aVq/6qVHVYjOog
         hy1gvRWaVBLY4t9zKsiZCM8uFEsNxFpAuOsg7OYSNNKLt1QNkjLweWbkK38ivZyuKYUC
         pqgw==
X-Gm-Message-State: AOJu0Yzwpfb2kHR1k14EKTPAV5jeBmkqq2R/9oIm1v2MfwawrB+kO2qO
	SJRuCTqokjhnJEbrFIt31lAriy4Q21c62EFwbtR8MtlEf/fDjIzfyBK5
X-Gm-Gg: ATEYQzxNT3XSRxvqxhZL7P7xuINpWaOkU1ySmk9IH3soC8C3EosZw5dNZOeKH6Wvbia
	sRQW8W43HrnCJ6ah7Antg5yoHyebyFT0nlZso3QS9evjmV2s7kBOwXkxIlFfokiApxeKdmy3uak
	eD6LLU8NB1QT+rGBOm/OwWWNfFk9VJWijXxPTc2fIDDJNOCjSx7IZoavFd5r65U5YYn+CLfw2js
	o6aeoGpo+iHrLC0tirDilXpz1Os1hk6Yuhsi0UET9BCbtWvW1FMfITCcFBLxAknVDe4CG7zPOqS
	3AmegGCopHtZ9MLTj6KJqy3YccQxQlK1FUOpJVKXJSMC0fyX+fsUpusGRP295yj+YIKn5VWGE9S
	E1oFVR/hy0NW020t/EnGFwS4ZLuGJHXOqGdDzUg3rnj6RxStcE5mUrLV5i7qZGXf9/+uDwIxM+M
	EMBk4MgHT8INt8DH+HU6mrUg==
X-Received: by 2002:a05:7022:ba5:b0:128:d967:466c with SMTP id a92af1059eb24-12a96ed373bmr527563c88.24.1774388533506;
        Tue, 24 Mar 2026 14:42:13 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm3284180eec.2.2026.03.24.14.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:42:13 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v2 3/3] platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
Date: Tue, 24 Mar 2026 14:41:27 -0700
Message-ID: <20260324214129.17300-4-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324214129.17300-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
 <20260324214129.17300-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-56921-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3211B31CF16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Dell Latitude 5285 2-in-1 has two cameras connected through a TPS68470
PMIC/clock/GPIO hub:

  Front: OV5670 (ACPI INT3479) on I2C4
  Back:  OV8858 (ACPI INT3477) on I2C2, daisy-chained behind TPS68470
         S_I2C port (controlled by reg 0x43 S_I2C_CTL)

GPIO mapping (TPS68470):
  INT3479 (OV5670): GPIO3 = reset, GPIO4 = powerdown (both active-low)
  INT3477 (OV8858): GPIO9 = s_resetn, GPIO7 = s_enable (both active-low)
    GPIO9 and GPIO7 are the TPS68470 secondary-port GPIOs (SGPO reg 0x22
    bits 2 and 0), not regular GPDO outputs.

Regulator mapping:
  CORE  -> dvdd  / INT3477
  ANA   -> avdd  / INT3477
  VIO   -> dovdd / INT3477
  VSIO  -> avdd  / INT3479 and vsio / INT3477 (always_on: keeps S_I2C_CTL
           non-zero from boot so OV8858 is reachable on I2C2 at any time)
  AUX1  -> dvdd  / INT3479
  AUX2  -> dovdd / INT3479

Marking VSIO always_on ensures the TPS68470 S_I2C passthrough is active
from the moment the PMIC driver probes, eliminating a timing dependency
between TPS68470 and ov8858 probe ordering.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 71357a036..a5b469dcb 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -287,6 +287,162 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
 	},
 };
 
+/* Settings for Dell Latitude 5285 2-in-1 */
+
+static struct regulator_consumer_supply dell_5285_int3477_ana_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-INT3477:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3477_core_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-INT3477:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3477_vio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-INT3477:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3479_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-INT3479:00"),
+	/* S_I2C_CTL: must be enabled for OV8858 I2C daisy-chain access */
+	REGULATOR_SUPPLY("vsio", "i2c-INT3477:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3479_aux1_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-INT3479:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3479_aux2_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
+};
+
+static const struct regulator_init_data dell_5285_tps68470_core_reg_init_data = {
+	.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_core_consumer_supplies),
+	.consumer_supplies = dell_5285_int3477_core_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_ana_consumer_supplies),
+	.consumer_supplies = dell_5285_int3477_ana_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_vcm_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = 0,
+	.consumer_supplies = NULL,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_vio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_vio_consumer_supplies),
+	.consumer_supplies = dell_5285_int3477_vio_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+		/*
+		 * Keep S_I2C_CTL enabled from boot so OV8858 I2C daisy-chain
+		 * is accessible before ov8858 driver probes.
+		 */
+		.always_on = 1,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_vsio_consumer_supplies),
+	.consumer_supplies = dell_5285_int3479_vsio_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_aux1_reg_init_data = {
+	.constraints = {
+		.min_uV = 1213200,
+		.max_uV = 1213200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_aux1_consumer_supplies),
+	.consumer_supplies = dell_5285_int3479_aux1_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_aux2_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_aux2_consumer_supplies),
+	.consumer_supplies = dell_5285_int3479_aux2_consumer_supplies,
+};
+
+static const struct tps68470_regulator_platform_data dell_5285_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &dell_5285_tps68470_core_reg_init_data,
+		[TPS68470_ANA]  = &dell_5285_tps68470_ana_reg_init_data,
+		[TPS68470_VCM]  = &dell_5285_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO]  = &dell_5285_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &dell_5285_tps68470_vsio_reg_init_data,
+		[TPS68470_AUX1] = &dell_5285_tps68470_aux1_reg_init_data,
+		[TPS68470_AUX2] = &dell_5285_tps68470_aux2_reg_init_data,
+	},
+};
+
+static struct gpiod_lookup_table dell_5285_int3477_gpios = {
+	.dev_id = "i2c-INT3477:00",
+	.table = {
+		/*
+		 * TPS68470 GPIO9 = s_resetn (secondary camera reset, active-low)
+		 * TPS68470 GPIO7 = s_enable (secondary camera enable/powerdown)
+		 * These logic outputs are specifically designed for secondary
+		 * camera control on the TPS68470. Matches Surface Go pattern.
+		 */
+		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 7, "powerdown", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
+static struct gpiod_lookup_table dell_5285_int3479_gpios = {
+	.dev_id = "i2c-INT3479:00",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 3, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 4, "powerdown", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
+static const struct int3472_tps68470_board_data dell_5285_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:05",
+	.tps68470_regulator_pdata = &dell_5285_tps68470_pdata,
+	.n_gpiod_lookups = 2,
+	.tps68470_gpio_lookup_tables = {
+		&dell_5285_int3477_gpios,
+		&dell_5285_int3479_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -316,6 +472,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&dell_7212_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR,   "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
+		},
+		.driver_data = (void *)&dell_5285_tps68470_board_data,
+	},
 	{ }
 };
 
-- 
2.51.0


