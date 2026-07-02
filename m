Return-Path: <linux-media+bounces-66289-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hR4IEDjARWqeEgsAu9opvQ
	(envelope-from <linux-media+bounces-66289-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 03:34:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C96F2C22
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 03:34:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=A74GSfu6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66289-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66289-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6C923065359
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 01:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EC929E10B;
	Thu,  2 Jul 2026 01:33:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E011E8826
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 01:33:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956007; cv=none; b=Q3FcCiToJXJHlXD1bYoAcnurBpb1PMeWquIodrJA01utJVlz+r0/sLV7l25QmcdPULGVAITZJCnPITiaUK5WxGtUzP8w2Zu1p6OifQCeyzXDE2NpPM2Tx6Bp1idnSLd4Oi6Enwna6SPNCMX77uJxEva1jJhQ7+Qc1O9i+m+FUbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956007; c=relaxed/simple;
	bh=zhFe+ZRhmciMAogcYzumupwgQsYYn2i8MzGcR7ZntCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KpMWFJGI2Te1GtU0/KAXLi7izktitOCv/l8x0oeT7QpBEdO3qA6JxSJKk1Ig+3jd8/XUF82tvmN1qj8w/3msCne7WqvGCdWt9zFl03GYNcJGDdpGbmg9XzCRYiN+04bO7h8GDSJ9UXfpJMyQGdTqfoXXmsz4DEvAFQWzYHh7CUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A74GSfu6; arc=none smtp.client-ip=209.85.215.174
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso390144a12.2
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 18:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782956004; x=1783560804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wJsbLKf23+tQCZv8wuI9QKWN0edD8D07Gk0m8stuzE=;
        b=A74GSfu6uuxHpeQ9Kvaif01kT3DrXo0gyFu73ilVHE0HJ3eWPxjDSxTRSaqWEzn+Df
         lm8jcEYjGpCundw/mX0P7r1AVOQFW6neYT5Cw9RHDKa393MqXOgmkiwRxxV9HhntEaTK
         THQiRLhPlcrqiQle6eADaUEfoRzigRy+AWVi9XNn6SSoK3FWXDDD4DAruQOVrXJE8hLd
         YswZrvlEXiLDBf2dkDH1KgLczI+SiMDTr/lbbBQdub6neUW4jh45YflB7wsrhE+nlJPK
         1/qwvLyii7LW6FDpwZsopYJenMJsFOc4KnxkKot5apa1HEu8osDdMfew+wb0nhVkq9pz
         SM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782956004; x=1783560804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wJsbLKf23+tQCZv8wuI9QKWN0edD8D07Gk0m8stuzE=;
        b=L89/GMMiqYq8Mn3/ISWzILaIWXyLSnZELtJMDme1MxaBxxhIXm8BB/c4yzC/4Zo3W7
         M4x1KZUGPpND4+qtWIdqD5AXr0KjdHvVQvotHwThm3v0XOS90UYKXx4r/9LGk4V0AlPH
         upPvNbrlkt7gXoT6aK0gXQcobhaCF6bidW9fn49E4ekubFkNtRjFchiXLId/Mffe00Yn
         joRLjjO5dFqEg9sM/TdIxRuZXWu47S374ZWK3BeH7+LbYd0MgHKdHmL1r3Jc9GL0KeW6
         3oh3azyjm09k0AUxIAj0YZnqM3OpuqxLuk/uA7zcnXf55JxhjOdrYMfBmN3e3LibLF7h
         GzAg==
X-Forwarded-Encrypted: i=1; AFNElJ/+FZjZGk5uVScq+fGFvVJFNcCmKihVHhQYZhXXS8Fz3yexafg23UJnf4vuxKdmwzE6fkiAKoDmAUt9og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0z56eLxkgzZV3lue2+WH3ZztC1gaTvJBROE+6fU3Tjv5NnUT
	OZocS60yf5uSjWpIAa5D6x6DuL9P6JI15Wzh9NZtHI3/9ryHLN5inqXhEYQ/bpi1sWs=
X-Gm-Gg: AfdE7cmNqvaZtdnk7/QVEZHkchCDnFydUyLL9RC7nwxeGGUAJnXzRFHqD0qZaxAh3EQ
	WjB3HxMgWue/AzycNtGSZv9Z23sFJenHk+22TpyLajqaMBTxceJIAcjTcoCvbW1a8jcXAOmsLcD
	2GaeQ0b4qcbIAtTTyp73Cko0zQtDyhrekMW/BZdyLUQBPR7XHzJpqO13+YeXb0OcTlfTIeYq9+w
	Pp1ebO+IZryG2kPIfFKH4y64akaITpts4N6biB6nIpRSK3P7QD7jQmTPpuFjpogdHh1k8RZgswB
	AITU/DDt3kxy3JzoBuqmRUliGdxSVgLfZpWne0UqvTTdHjAOjjskrp1hSERT82UV5+bAIUjbdsp
	1U7cqwgqD1eb11pdh8PZyYrfm6tjz7rLUz8VBi71mY5acJD0eco5Y7tjs8yFfH2i5rf5hsq5UUX
	cGd9YHSbnF7KMkW40pf7pAvzkZjOvT
X-Received: by 2002:a05:6a21:3a83:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3bff40b1b6emr4003697637.15.1782956003564;
        Wed, 01 Jul 2026 18:33:23 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8901:272a:3379:8697:e33b:cbe6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f116065c5sm540377eec.11.2026.07.01.18.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 18:33:23 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 02 Jul 2026 07:02:38 +0530
Subject: [PATCH v2 2/2] media: i2c: hm1092: add Himax HM1092 mono NIR
 sensor driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-hm1092-driver-v2-2-4f9f369d6a48@gmail.com>
References: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
In-Reply-To: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22577; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=zhFe+ZRhmciMAogcYzumupwgQsYYn2i8MzGcR7ZntCo=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqRb/T8O2c7Y8c8Dwv236oXYJ0jfIypLDF2LfL9
 5HWZ0X+mveJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCakW/0wAKCRAVlYpeERwF
 3toCD/4s3k0+o0W0F6kORdyLKILcvY0qlmeYrw4PI2KuWPgASurtZrHCIdwHf97unx7WhJO/6MV
 NIxfsPdleoRD6ss5PYxMfiSM8cCYyuGlA/pIjx7yRtfH0kTBBmH0Gg64Ps+XMKlE3FoSdOWBJq9
 W/M1roL68aPFrLG5l4SxeX0LLOq9a1xLDfIaaqx6VGppznLbHfSiuGjdvn36q1FvDqRS3Bdl/u/
 LMTTHaIMk5ulhAkBuu2eOQ9zVO3S0i1AaqVje7qjhMGNs2Ivq0OghQ4aNsToKspJzThEvq3TV8i
 CBnThIbqcNh3PiZmedB/ZWHHEEKkB1MJyr4OUuQJdVFYLnB3qIJQaIkbNUbztnwrQ2C4eWIGcPD
 R79oTeUqXNOlOBbo0fbh0SV32pw0QLE+8iqte3vrdLqmdefuStVc1N8K2TSUDG7txbPdvbpLIDm
 FWwDqyH/ozUioWKvE/inRDfXNsRN2iNvf9e4Irxm24VsBdhg+wWyrtYsl3PYsKAiHYjoge1AqOS
 bSROX5It+cLYT0Bx9+sWxRXEn/UWQu4BR2bXuCSQQ2TTaejSB6VkAWSW+ybK2lKlWsnjZOSeDdx
 KIeYc7I6NAVkxliwTaxjtVZ+/hwFxiWJKdgj9D32lXk3fiAxdt5BW3ANMqLBiCCe7gmMyzu3hnD
 yMpG5C9gJNg+vdw==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66289-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,noorman.info:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C99C96F2C22

Add a V4L2 subdev driver for the Himax HM1092, a 1 megapixel monochrome
near-infrared image sensor with a single-lane MIPI CSI-2 interface,
typically used as the face-authentication IR camera on laptops.

The driver supports the sensor's native 560x360 10-bit mono mode, a test
pattern control and the standard fwnode properties (orientation,
rotation).

Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 MAINTAINERS                |   7 +
 drivers/media/i2c/Kconfig  |  11 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/hm1092.c | 790 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 809 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e11dd741d9f..4d9a4991ca2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11652,6 +11652,13 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/misc/hisi_hikey_usb.c
 
+HIMAX HM1092 SENSOR DRIVER
+M:	Ramshouriesh R <rshouriesh@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
+F:	drivers/media/i2c/hm1092.c
+
 HIMAX HX83112B TOUCHSCREEN SUPPORT
 M:	Job Noorman <job@noorman.info>
 L:	linux-input@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5d173e0ecf42..f94621edbe1a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -137,6 +137,17 @@ config VIDEO_HI847
           To compile this driver as a module, choose M here: the
           module will be called hi847.
 
+config VIDEO_HM1092
+	tristate "Himax HM1092 sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the Himax HM1092
+	  monochrome near-infrared CMOS image sensor, used as the
+	  face-authentication IR camera on laptops.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called hm1092.
+
 config VIDEO_IMX111
 	tristate "Sony IMX111 sensor support"
 	select V4L2_CCI_I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index e45359efe0e4..6507c173d0fa 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_VIDEO_GC2145) += gc2145.o
 obj-$(CONFIG_VIDEO_HI556) += hi556.o
 obj-$(CONFIG_VIDEO_HI846) += hi846.o
 obj-$(CONFIG_VIDEO_HI847) += hi847.o
+obj-$(CONFIG_VIDEO_HM1092) += hm1092.o
 obj-$(CONFIG_VIDEO_I2C) += video-i2c.o
 obj-$(CONFIG_VIDEO_IMX111) += imx111.o
 obj-$(CONFIG_VIDEO_IMX208) += imx208.o
diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c
new file mode 100644
index 000000000000..d0e417c9e35d
--- /dev/null
+++ b/drivers/media/i2c/hm1092.c
@@ -0,0 +1,790 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Himax HM1092 monochrome near-infrared image sensor driver.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define HM1092_LINK_FREQ_400MHZ		400000000ULL
+#define HM1092_MCLK			24000000
+#define HM1092_BITS_PER_SAMPLE		10
+
+#define HM1092_REG_STREAM		CCI_REG8(0x0100)
+
+struct hm1092_reg {
+	u16 address;
+	u8 val;
+};
+
+static const struct hm1092_reg hm1092_init_regs[] = {
+	{ 0x0103, 0x00 },
+	{ 0x030a, 0x05 },
+	{ 0x030d, 0x0c },
+	{ 0x030f, 0x5a },
+	{ 0x0307, 0x00 },
+	{ 0x0309, 0x01 },
+	{ 0x0387, 0x01 },
+	{ 0x0100, 0x02 },
+	{ 0x4265, 0x02 },
+	{ 0x4002, 0x2b },
+	{ 0x4001, 0x00 },
+	{ 0x0101, 0x03 },
+	{ 0x4024, 0x40 },
+	{ 0x0203, 0xbe },
+	{ 0x0202, 0x00 },
+	{ 0x0341, 0xee },
+	{ 0x0340, 0x02 },
+	{ 0x0343, 0x50 },
+	{ 0x0342, 0x06 },
+	{ 0x0345, 0x30 },
+	{ 0x0344, 0x00 },
+	{ 0x0349, 0xad },
+	{ 0x0348, 0x04 },
+	{ 0x0347, 0x08 },
+	{ 0x0346, 0x00 },
+	{ 0x034b, 0xd5 },
+	{ 0x034a, 0x02 },
+	{ 0x5015, 0xb3 },
+	{ 0x0350, 0x53 },
+	{ 0x0361, 0x30 },
+	{ 0x0360, 0x00 },
+	{ 0x034d, 0x30 },
+	{ 0x034c, 0x02 },
+	{ 0x034f, 0x68 },
+	{ 0x034e, 0x01 },
+	{ 0x0390, 0x03 },
+	{ 0x0383, 0x00 },
+	{ 0x0387, 0x10 },
+	{ 0x50dd, 0x01 },
+	{ 0x50cb, 0x21 },
+	{ 0x5005, 0x28 },
+	{ 0x5004, 0x40 },
+	{ 0x5007, 0x28 },
+	{ 0x5006, 0x40 },
+	{ 0x5011, 0x00 },
+	{ 0x501d, 0x4c },
+	{ 0x5013, 0x03 },
+	{ 0x4131, 0x01 },
+	{ 0x5283, 0x03 },
+	{ 0x5282, 0xff },
+	{ 0x5010, 0x20 },
+	{ 0x4132, 0x20 },
+	{ 0x50d5, 0xe0 },
+	{ 0x50d7, 0x12 },
+	{ 0x50bb, 0x14 },
+	{ 0x50b7, 0x00 },
+	{ 0x50b9, 0xff },
+	{ 0x50b8, 0x70 },
+	{ 0x50ba, 0xff },
+	{ 0x50fa, 0x02 },
+	{ 0x50b4, 0x00 },
+	{ 0x50a2, 0x0b },
+	{ 0x50ad, 0x07 },
+	{ 0x50ac, 0x24 },
+	{ 0x50af, 0x40 },
+	{ 0x50ae, 0x20 },
+	{ 0x50ab, 0x07 },
+	{ 0x50aa, 0x22 },
+	{ 0x50a7, 0x00 },
+	{ 0x50a6, 0x00 },
+	{ 0x5099, 0x11 },
+	{ 0x509b, 0x03 },
+	{ 0x50b3, 0x04 },
+	{ 0x50a0, 0x30 },
+	{ 0x5098, 0x00 },
+	{ 0x52f2, 0x53 },
+	{ 0x5209, 0x0c },
+	{ 0x5216, 0x02 },
+	{ 0x521e, 0x01 },
+	{ 0x50e8, 0x00 },
+	{ 0x5200, 0x60 },
+	{ 0x5202, 0x00 },
+	{ 0x5201, 0x80 },
+	{ 0x5203, 0x01 },
+	{ 0x5208, 0x0b },
+	{ 0x520d, 0x40 },
+	{ 0x520c, 0x15 },
+	{ 0x5215, 0x04 },
+	{ 0x50ea, 0x74 },
+	{ 0x5214, 0x28 },
+	{ 0x5218, 0x07 },
+	{ 0x5217, 0x01 },
+	{ 0x0310, 0x00 },
+	{ 0x4b31, 0x06 },
+	{ 0x4b3b, 0x02 },
+	{ 0x4b45, 0x01 },
+	{ 0x4b44, 0x0c },
+	{ 0x4b47, 0x00 },
+	{ 0x5101, 0x13 },
+	{ 0x5100, 0x03 },
+	{ 0x5103, 0x33 },
+	{ 0x5102, 0x23 },
+	{ 0x5105, 0x42 },
+	{ 0x5104, 0x43 },
+	{ 0x5106, 0x40 },
+	{ 0x5119, 0x00 },
+	{ 0x5118, 0x00 },
+	{ 0x511b, 0x00 },
+	{ 0x511a, 0x00 },
+	{ 0x511d, 0x00 },
+	{ 0x511c, 0x00 },
+	{ 0x511e, 0x00 },
+	{ 0x5131, 0x23 },
+	{ 0x5130, 0x13 },
+	{ 0x5133, 0x43 },
+	{ 0x5132, 0x33 },
+	{ 0x5135, 0x40 },
+	{ 0x5134, 0x42 },
+	{ 0x5136, 0x40 },
+	{ 0x5149, 0x01 },
+	{ 0x5148, 0x01 },
+	{ 0x514b, 0x01 },
+	{ 0x514a, 0x01 },
+	{ 0x514d, 0x01 },
+	{ 0x514c, 0x01 },
+	{ 0x514e, 0x01 },
+	{ 0x51c0, 0x00 },
+	{ 0x51c6, 0x00 },
+	{ 0x51cc, 0x00 },
+	{ 0x51d2, 0x00 },
+	{ 0x51d8, 0x00 },
+	{ 0x51c1, 0x81 },
+	{ 0x51c7, 0x81 },
+	{ 0x51cd, 0x81 },
+	{ 0x51d3, 0x81 },
+	{ 0x51d9, 0x81 },
+	{ 0x51c2, 0xec },
+	{ 0x51c8, 0xec },
+	{ 0x51ce, 0xec },
+	{ 0x51d4, 0xec },
+	{ 0x51da, 0xec },
+	{ 0x51c3, 0x00 },
+	{ 0x51c9, 0x00 },
+	{ 0x51cf, 0x00 },
+	{ 0x51d5, 0x00 },
+	{ 0x51db, 0x00 },
+	{ 0x51c4, 0x55 },
+	{ 0x51ca, 0x55 },
+	{ 0x51d0, 0x54 },
+	{ 0x51d6, 0x53 },
+	{ 0x51dc, 0x53 },
+	{ 0x51c5, 0x44 },
+	{ 0x51cb, 0x24 },
+	{ 0x51d1, 0x24 },
+	{ 0x51d7, 0x14 },
+	{ 0x51dd, 0x14 },
+	{ 0x51e0, 0x09 },
+	{ 0x51e2, 0x04 },
+	{ 0x51e4, 0x08 },
+	{ 0x51e6, 0x08 },
+	{ 0x51e1, 0x03 },
+	{ 0x51e3, 0x03 },
+	{ 0x51e5, 0x07 },
+	{ 0x51e8, 0x04 },
+	{ 0x51e7, 0x07 },
+	{ 0x51e9, 0x46 },
+	{ 0x51eb, 0x62 },
+	{ 0x51ea, 0x43 },
+	{ 0x51ed, 0x00 },
+	{ 0x51ec, 0x61 },
+	{ 0x51ee, 0x00 },
+	{ 0x5206, 0x80 },
+	{ 0x3110, 0x02 },
+	{ 0x3704, 0x02 },
+	{ 0x3704, 0x02 },
+	{ 0x4b20, 0x9e },
+	{ 0x4b18, 0x00 },
+	{ 0x4b3e, 0x00 },
+	{ 0x4b0e, 0x0e },
+	{ 0x4800, 0xac },
+	{ 0x0104, 0x01 },
+	{ 0x0104, 0x00 },
+	{ 0x4801, 0xae },
+	{ 0x0000, 0x00 },
+	{ 0x0037, 0x30 },
+};
+
+static const struct hm1092_reg hm1092_start_streaming[] = {
+	{ 0x0100, 0x01 },
+};
+
+static const struct hm1092_reg hm1092_test_pattern_mode0[] = {
+	{ 0x0601, 0x00 },
+};
+
+static const struct hm1092_reg hm1092_test_pattern_mode1[] = {
+	{ 0x0601, 0x01 },
+};
+
+static const struct hm1092_reg hm1092_test_pattern_mode2[] = {
+	{ 0x0601, 0x02 },
+};
+
+static const struct hm1092_reg hm1092_test_pattern_mode3[] = {
+	{ 0x0601, 0x03 },
+};
+
+static const struct hm1092_reg hm1092_test_pattern_mode4[] = {
+	{ 0x0601, 0x04 },
+};
+
+struct hm1092_mode {
+	u32 width;
+	u32 height;
+	u32 hts;
+	u32 vts;
+};
+
+static const struct hm1092_mode hm1092_mode_560x360 = {
+	.width = 560,
+	.height = 360,
+	.hts = 0x0650,
+	.vts = 0x02ee,
+};
+
+static const char * const hm1092_supply_names[] = {
+	"dovdd",
+	"avdd",
+	"dvdd",
+};
+
+static const char * const hm1092_test_pattern_menu[] = {
+	"Disabled",
+	"Mode 1",
+	"Mode 2",
+	"Mode 3",
+	"Mode 4",
+};
+
+static const s64 hm1092_link_freq_menu[] = {
+	HM1092_LINK_FREQ_400MHZ,
+};
+
+struct hm1092 {
+	struct device *dev;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct regmap *regmap;
+	struct clk *img_clk;
+	struct gpio_desc *reset;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(hm1092_supply_names)];
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	u8 mipi_lanes;
+};
+
+static inline struct hm1092 *to_hm1092(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct hm1092, sd);
+}
+
+static int hm1092_write_regs(struct hm1092 *hm1092,
+			     const struct hm1092_reg *regs, unsigned int len)
+{
+	unsigned int i;
+	int ret = 0;
+
+	for (i = 0; i < len; i++) {
+		cci_write(hm1092->regmap, CCI_REG8(regs[i].address),
+			  regs[i].val, &ret);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int hm1092_set_test_pattern(struct hm1092 *hm1092, int pattern)
+{
+	switch (pattern) {
+	case 0:
+		return hm1092_write_regs(hm1092, hm1092_test_pattern_mode0,
+					 ARRAY_SIZE(hm1092_test_pattern_mode0));
+	case 1:
+		return hm1092_write_regs(hm1092, hm1092_test_pattern_mode1,
+					 ARRAY_SIZE(hm1092_test_pattern_mode1));
+	case 2:
+		return hm1092_write_regs(hm1092, hm1092_test_pattern_mode2,
+					 ARRAY_SIZE(hm1092_test_pattern_mode2));
+	case 3:
+		return hm1092_write_regs(hm1092, hm1092_test_pattern_mode3,
+					 ARRAY_SIZE(hm1092_test_pattern_mode3));
+	case 4:
+		return hm1092_write_regs(hm1092, hm1092_test_pattern_mode4,
+					 ARRAY_SIZE(hm1092_test_pattern_mode4));
+	default:
+		return -EINVAL;
+	}
+}
+
+static int hm1092_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct hm1092 *hm1092 = container_of(ctrl->handler, struct hm1092,
+					     ctrl_handler);
+	int ret;
+
+	/*
+	 * The control value is cached by the framework and (re)applied from
+	 * hm1092_enable_streams() once the device is powered up for streaming.
+	 */
+	if (pm_runtime_get_if_in_use(hm1092->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		ret = hm1092_set_test_pattern(hm1092, ctrl->val);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(hm1092->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops hm1092_ctrl_ops = {
+	.s_ctrl = hm1092_set_ctrl,
+};
+
+static int hm1092_init_controls(struct hm1092 *hm1092)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr = &hm1092->ctrl_handler;
+	const struct hm1092_mode *mode = &hm1092_mode_560x360;
+	struct v4l2_fwnode_device_properties props;
+	s64 hblank, pixel_rate;
+	int ret;
+
+	v4l2_ctrl_handler_init(ctrl_hdlr, 6);
+
+	hm1092->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
+						   &hm1092_ctrl_ops,
+						   V4L2_CID_LINK_FREQ,
+						   0, 0,
+						   hm1092_link_freq_menu);
+	if (hm1092->link_freq)
+		hm1092->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	pixel_rate = div_u64(HM1092_LINK_FREQ_400MHZ * 2 * hm1092->mipi_lanes,
+			     HM1092_BITS_PER_SAMPLE);
+	hm1092->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE, 0,
+					       pixel_rate, 1, pixel_rate);
+
+	hblank = mode->hts - mode->width;
+	hm1092->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank, hblank, 1,
+					   hblank);
+	if (hm1092->hblank)
+		hm1092->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	hm1092->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
+					   V4L2_CID_VBLANK,
+					   mode->vts - mode->height,
+					   0xffff - mode->height, 1,
+					   mode->vts - mode->height);
+	if (hm1092->vblank)
+		hm1092->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &hm1092_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(hm1092_test_pattern_menu) - 1,
+				     0, 0, hm1092_test_pattern_menu);
+
+	ret = v4l2_fwnode_device_parse(hm1092->dev, &props);
+	if (ret)
+		goto err_free;
+
+	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &hm1092_ctrl_ops, &props);
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		goto err_free;
+	}
+
+	hm1092->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+err_free:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static void hm1092_update_pad_format(struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = hm1092_mode_560x360.width;
+	fmt->height = hm1092_mode_560x360.height;
+	fmt->code = MEDIA_BUS_FMT_Y10_1X10;
+	fmt->field = V4L2_FIELD_NONE;
+}
+
+static int hm1092_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 pad, u64 streams_mask)
+{
+	struct hm1092 *hm1092 = to_hm1092(sd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(hm1092->dev);
+	if (ret)
+		return ret;
+
+	ret = hm1092_write_regs(hm1092, hm1092_init_regs,
+				ARRAY_SIZE(hm1092_init_regs));
+	if (ret) {
+		dev_err(hm1092->dev, "failed to write init registers\n");
+		goto out;
+	}
+
+	ret = __v4l2_ctrl_handler_setup(hm1092->sd.ctrl_handler);
+	if (ret)
+		goto out;
+
+	ret = hm1092_write_regs(hm1092, hm1092_start_streaming,
+				ARRAY_SIZE(hm1092_start_streaming));
+	if (ret)
+		dev_err(hm1092->dev, "failed to start streaming\n");
+
+out:
+	if (ret)
+		pm_runtime_put(hm1092->dev);
+
+	return ret;
+}
+
+static int hm1092_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct hm1092 *hm1092 = to_hm1092(sd);
+	int ret = 0;
+
+	cci_write(hm1092->regmap, HM1092_REG_STREAM, 0, &ret);
+	pm_runtime_put(hm1092->dev);
+
+	return ret;
+}
+
+static int hm1092_set_format(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_format *fmt)
+{
+	hm1092_update_pad_format(&fmt->format);
+	*v4l2_subdev_state_get_format(state, fmt->pad) = fmt->format;
+
+	return 0;
+}
+
+static int hm1092_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_Y10_1X10;
+
+	return 0;
+}
+
+static int hm1092_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index)
+		return -EINVAL;
+
+	if (fse->code != MEDIA_BUS_FMT_Y10_1X10)
+		return -EINVAL;
+
+	fse->min_width = hm1092_mode_560x360.width;
+	fse->max_width = hm1092_mode_560x360.width;
+	fse->min_height = hm1092_mode_560x360.height;
+	fse->max_height = hm1092_mode_560x360.height;
+
+	return 0;
+}
+
+static int hm1092_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	hm1092_update_pad_format(v4l2_subdev_state_get_format(state, 0));
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops hm1092_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops hm1092_pad_ops = {
+	.set_fmt = hm1092_set_format,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.enum_mbus_code = hm1092_enum_mbus_code,
+	.enum_frame_size = hm1092_enum_frame_size,
+	.enable_streams = hm1092_enable_streams,
+	.disable_streams = hm1092_disable_streams,
+};
+
+static const struct v4l2_subdev_ops hm1092_subdev_ops = {
+	.video = &hm1092_video_ops,
+	.pad = &hm1092_pad_ops,
+};
+
+static const struct media_entity_operations hm1092_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_internal_ops hm1092_internal_ops = {
+	.init_state = hm1092_init_state,
+};
+
+static int hm1092_check_hwcfg(struct hm1092 *hm1092)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct device *dev = hm1092->dev;
+	struct fwnode_handle *ep, *fwnode = dev_fwnode(dev);
+	unsigned long link_freq_bitmap;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
+	if (!ep)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
+
+	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       hm1092_link_freq_menu,
+				       ARRAY_SIZE(hm1092_link_freq_menu),
+				       &link_freq_bitmap);
+	if (ret)
+		goto out;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "only 1 data lane is supported, got %u\n",
+				    bus_cfg.bus.mipi_csi2.num_data_lanes);
+		goto out;
+	}
+
+	hm1092->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+
+out:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	return ret;
+}
+
+static int hm1092_get_pm_resources(struct hm1092 *hm1092)
+{
+	unsigned int i;
+
+	hm1092->reset = devm_gpiod_get_optional(hm1092->dev, "reset",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(hm1092->reset))
+		return dev_err_probe(hm1092->dev, PTR_ERR(hm1092->reset),
+				     "failed to get reset gpio\n");
+
+	for (i = 0; i < ARRAY_SIZE(hm1092_supply_names); i++)
+		hm1092->supplies[i].supply = hm1092_supply_names[i];
+
+	return devm_regulator_bulk_get(hm1092->dev,
+				       ARRAY_SIZE(hm1092_supply_names),
+				       hm1092->supplies);
+}
+
+static int hm1092_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct hm1092 *hm1092 = to_hm1092(sd);
+
+	gpiod_set_value_cansleep(hm1092->reset, 1);
+	clk_disable_unprepare(hm1092->img_clk);
+	regulator_bulk_disable(ARRAY_SIZE(hm1092_supply_names),
+			       hm1092->supplies);
+
+	return 0;
+}
+
+static int hm1092_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct hm1092 *hm1092 = to_hm1092(sd);
+	int ret;
+
+	/*
+	 * Power-up sequence:
+	 *   1. enable all rails (~3 ms ramp)
+	 *   2. hold reset asserted
+	 *   3. start MCLK and let the sensor clock for ~1 ms
+	 *   4. release reset and wait 18 ms for the sensor to come up
+	 */
+	ret = regulator_bulk_enable(ARRAY_SIZE(hm1092_supply_names),
+				    hm1092->supplies);
+	if (ret)
+		return ret;
+	usleep_range(3000, 3500);
+
+	if (hm1092->reset)
+		gpiod_set_value_cansleep(hm1092->reset, 1);
+
+	ret = clk_prepare_enable(hm1092->img_clk);
+	if (ret) {
+		regulator_bulk_disable(ARRAY_SIZE(hm1092_supply_names),
+				       hm1092->supplies);
+		return ret;
+	}
+	usleep_range(1000, 1200);
+
+	if (hm1092->reset)
+		gpiod_set_value_cansleep(hm1092->reset, 0);
+	usleep_range(18000, 19000);
+
+	return 0;
+}
+
+static void hm1092_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct hm1092 *hm1092 = to_hm1092(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(hm1092->dev);
+	if (!pm_runtime_status_suspended(hm1092->dev)) {
+		hm1092_power_off(hm1092->dev);
+		pm_runtime_set_suspended(hm1092->dev);
+	}
+}
+
+static int hm1092_probe(struct i2c_client *client)
+{
+	struct hm1092 *hm1092;
+	unsigned long freq;
+	int ret;
+
+	hm1092 = devm_kzalloc(&client->dev, sizeof(*hm1092), GFP_KERNEL);
+	if (!hm1092)
+		return -ENOMEM;
+
+	hm1092->dev = &client->dev;
+
+	hm1092->img_clk = devm_v4l2_sensor_clk_get(hm1092->dev, NULL);
+	if (IS_ERR(hm1092->img_clk))
+		return dev_err_probe(hm1092->dev, PTR_ERR(hm1092->img_clk),
+				     "failed to get imaging clock\n");
+
+	freq = clk_get_rate(hm1092->img_clk);
+	if (freq != HM1092_MCLK) {
+		return dev_err_probe(hm1092->dev, -EINVAL,
+				     "external clock %lu is not supported\n",
+				     freq);
+	}
+
+	v4l2_i2c_subdev_init(&hm1092->sd, client, &hm1092_subdev_ops);
+
+	ret = hm1092_check_hwcfg(hm1092);
+	if (ret)
+		return ret;
+
+	ret = hm1092_get_pm_resources(hm1092);
+	if (ret)
+		return ret;
+
+	hm1092->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(hm1092->regmap))
+		return PTR_ERR(hm1092->regmap);
+
+	ret = hm1092_power_on(hm1092->dev);
+	if (ret)
+		return dev_err_probe(hm1092->dev, ret, "failed to power on\n");
+
+	ret = hm1092_init_controls(hm1092);
+	if (ret)
+		goto err_power_off;
+
+	hm1092->sd.internal_ops = &hm1092_internal_ops;
+	hm1092->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	hm1092->sd.entity.ops = &hm1092_entity_ops;
+	hm1092->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	hm1092->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&hm1092->sd.entity, 1, &hm1092->pad);
+	if (ret)
+		goto err_ctrls;
+
+	hm1092->sd.state_lock = hm1092->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&hm1092->sd);
+	if (ret)
+		goto err_entity;
+
+	pm_runtime_set_active(hm1092->dev);
+	pm_runtime_enable(hm1092->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&hm1092->sd);
+	if (ret)
+		goto err_subdev;
+
+	pm_runtime_idle(hm1092->dev);
+	return 0;
+
+err_subdev:
+	pm_runtime_disable(hm1092->dev);
+	pm_runtime_set_suspended(hm1092->dev);
+	v4l2_subdev_cleanup(&hm1092->sd);
+err_entity:
+	media_entity_cleanup(&hm1092->sd.entity);
+err_ctrls:
+	v4l2_ctrl_handler_free(hm1092->sd.ctrl_handler);
+err_power_off:
+	hm1092_power_off(hm1092->dev);
+
+	return ret;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(hm1092_pm_ops, hm1092_power_off,
+				 hm1092_power_on, NULL);
+
+static const struct of_device_id hm1092_of_match[] = {
+	{ .compatible = "himax,hm1092" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, hm1092_of_match);
+
+static struct i2c_driver hm1092_i2c_driver = {
+	.driver = {
+		.name = "hm1092",
+		.pm = pm_ptr(&hm1092_pm_ops),
+		.of_match_table = hm1092_of_match,
+	},
+	.probe = hm1092_probe,
+	.remove = hm1092_remove,
+};
+
+module_i2c_driver(hm1092_i2c_driver);
+
+MODULE_DESCRIPTION("Himax HM1092 monochrome NIR image sensor driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0


