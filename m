Return-Path: <linux-media+bounces-57897-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WulMCJBhzWmMcwYAu9opvQ
	(envelope-from <linux-media+bounces-57897-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 20:18:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5837F1B9
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 20:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A10A130138F6
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 18:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858A33264FE;
	Wed,  1 Apr 2026 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkKbYpvr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F947325705
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775067432; cv=none; b=r7zwV+aCvgw1dTljlBMY2bnYUBi8V+o3CkSb9fo74xOqTZc1QdaKttpacdhSf5t7cS9Urg/SHXw97Q+YboA0kXOQYtB6HlGrRR8VqzU1JJOhlZlDlCAQEthpGSn2W+Bv9zwCPl39Du2ONb5DXTFtFnDSBuRl2GtA1VcQVEg2oXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775067432; c=relaxed/simple;
	bh=ST1x8Uz6TQiGe79USzqdmWvtwG5sB+Qa3OSNFjV2atk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T2Luf5En+SB7dQHhXuibyBc+TrH1zVLfprPVDdJTZoOLqEkp1hFa5DeDRtnTzl9r83/cXnyB4/uJnP/Ttt4sNKLN60o04XNHrIhRBisSJOGkH51hTZZYTaDoToXpkvMYC937tQkcWlGRjQWe3PqFcjvpbDHla+g7XPkJzFymKMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkKbYpvr; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82ce09b61beso35553b3a.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 11:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775067431; x=1775672231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4DmGGsmlsWiS4YmUq0GXU6tJWK3BV4/TprF0P8CHx8=;
        b=CkKbYpvraMDRHRyVBuECfsavtGsmm1Ts+W3gAvE++KnUMCN7ehZ7STgv6X2yyiUGED
         CYKfoRQpHIy0q/z42ucQj9zXjeYu4w0/hufKnCwmnUEi2GBnILBTUX89nfPQZEaB+Toj
         Hbh6+89IPoDrjkY6DZA5T9S/o775KU35r325M9rqexyutu/K2LJs9glOH+pdPj29yFe3
         qG3UY2/D5/nCTLK3gKBO33Fn5smHOgv7RB1I2auzMH+xD2FVIGaPMqj0kK/Gr1wvDDIV
         o9tdeF21rMW3ji2I0YFrsAxw7mmu57a7uZyMOiRErh7cgeyL4x8l2Ihh1Yss4f1zIpGW
         woHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775067431; x=1775672231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4DmGGsmlsWiS4YmUq0GXU6tJWK3BV4/TprF0P8CHx8=;
        b=OSaKpoyyDnk8xxCrW0SOEruSJLw44ASiyNkMaj3n5uh+KkE4v0wSJCWH0qFHmoVR7G
         R/+AwX+BFNQ/DdvSR8QFnMhppO1/zi5TXjhDe1mENAB/5QlS2abQqvY9TTr/gJUUC+lE
         cf60X2cbt4DpbujRkRUU0OmdLymwXJ9Q/RW0ZHAT/yiWXOxgYSv5pznGVT7MumVeZ4I4
         wcI1XXnZd248jIn/ef6ekx2vKkZto6I8MfTyCKo9C4HUSjwyxI4mMf/IZVNW/SBthvMm
         MV90B5M4+QKg0DofeSFwf3VLFxGBKwtv8Fwne+SDPOKz5Eg1vYTjNvzzW5QQDRHUbvQl
         ALAw==
X-Forwarded-Encrypted: i=1; AJvYcCVqdYZUf1No4s0BuYNRW4zAmpOIY8NgdUn3sN4RDBAyCtBYlGDeB2XOBoV48JxCxYg9SgGr5B6NmOv9xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywykzlb6ULxg+FdaeqlLK55OOu/0FBYEybHH4DRiLv0j0Q/Ft9+
	McS1dqxdG2k9TJSWFvWDd65JC3cKIwjobOzXbg4/PiC1bBXmxS6ZpCBm
X-Gm-Gg: ATEYQzzgStvqp4yLZCsvDhOTZHQ9t5z0MAuYT3cnHliXt5O9rH/9PBQVbU5Q+xbh+g3
	mG3pbQ6YhtN8wfzrrYe3a3NpZCIMF4uMoDyfZrDaCJ3/clgvQ/461tEbu7MH1ixSlVIbsdjb/YK
	RGoJzOFiMon++hlsm3HUCE1MOqwdVufsacTlp18iWunir7Z1d345jAij0XKH3azScJ1JZ/um1y5
	kjt8S19WkOr4BYLeyDSGji3aXjFwtZ1lOEAwavUgkp6lWwQDG0W+uOYeHPgS0b0+cMG0bsJcYRN
	c9p23J9nepqUy8ZFfn3OSY9i5+OXAp/ex25pGIqXatHu4oZAozsDQWdpk1HaOVW/s0rZTzwA+LV
	2jhgKwO2mjptuc4ECQiL7oVSg2xdqiVoFtUFapw9CqNOMjbBzDUtzGqpM7/IOrjVBqh6zKAXQ1M
	71JtKigZZWqc1JvUFr6FTcsnfCdbPwke3OZ1jD1EWDAGn3aDlm
X-Received: by 2002:a05:6a00:6717:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-82cf03569afmr2319067b3a.42.1775067430834;
        Wed, 01 Apr 2026 11:17:10 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca14b3sm666249b3a.54.2026.04.01.11.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:17:10 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: i2c: gc0310: Use devm_v4l2_sensor_clk_get()
Date: Wed,  1 Apr 2026 23:46:57 +0530
Message-Id: <20260401181657.654055-4-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401181657.654055-1-sanjayembedded@gmail.com>
References: <20260401181657.654055-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-57897-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15B5837F1B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Several camera sensor drivers access the "clock-frequency" property
directly to retrieve the external clock rate or handle the external
clock manually in the driver. While this is valid on a subset of ACPI
platforms, implementing this logic directly in drivers is deprecated
and can lead to inconsistent behaviour across drivers.

This driver supports ACPI platforms only. It currently retrieves the
external clock rate from the "clock-frequency" property and fails
probing if the rate does not match the expected value, which is the
correct policy for ACPI platforms.

Switch to using the devm_v4l2_sensor_clk_get() helper to standardise
clock handling. This preserves the existing behaviour on ACPI
platforms that specify a clock-frequency property without providing
a clock. On platforms that provide a clock, the helper will program
the clock to the rate specified by clock-frequency, which is also
consistent with the driver's expectations.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/media/i2c/gc0310.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
index e538479fee2e..e9e67bd73f51 100644
--- a/drivers/media/i2c/gc0310.c
+++ b/drivers/media/i2c/gc0310.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2023-2025 Hans de Goede <hansg@kernel.org>
  */
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
@@ -84,6 +85,7 @@
 #define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
 
 struct gc0310_device {
+	struct clk *clk;
 	struct device *dev;
 	struct i2c_client *client;
 
@@ -634,7 +636,6 @@ static int gc0310_check_hwcfg(struct device *dev)
 	};
 	struct fwnode_handle *ep_fwnode;
 	unsigned long link_freq_bitmap;
-	u32 mclk;
 	int ret;
 
 	/*
@@ -646,21 +647,6 @@ static int gc0310_check_hwcfg(struct device *dev)
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for fwnode graph endpoint\n");
 
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &mclk);
-	if (ret) {
-		fwnode_handle_put(ep_fwnode);
-		return dev_err_probe(dev, ret,
-				     "reading clock-frequency property\n");
-	}
-
-	if (mclk != GC0310_MCLK_FREQ) {
-		fwnode_handle_put(ep_fwnode);
-		return dev_err_probe(dev, -EINVAL,
-				     "external clock %u is not supported\n",
-				     mclk);
-	}
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep_fwnode, &bus_cfg);
 	fwnode_handle_put(ep_fwnode);
 	if (ret)
@@ -684,6 +670,7 @@ static int gc0310_check_hwcfg(struct device *dev)
 static int gc0310_probe(struct i2c_client *client)
 {
 	struct gc0310_device *sensor;
+	unsigned long freq;
 	int ret;
 
 	ret = gc0310_check_hwcfg(&client->dev);
@@ -697,6 +684,16 @@ static int gc0310_probe(struct i2c_client *client)
 	sensor->client = client;
 	sensor->dev = &client->dev;
 
+	sensor->clk = devm_v4l2_sensor_clk_get(sensor->dev, NULL);
+	if (IS_ERR(sensor->clk))
+		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clk),
+				     "failed to get clock\n");
+
+	freq = clk_get_rate(sensor->clk);
+	if (freq != GC0310_MCLK_FREQ)
+		return dev_err_probe(sensor->dev, -EINVAL,
+				     "external clock %lu is not supported\n", freq);
+
 	sensor->reset = devm_gpiod_get(sensor->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->reset)) {
 		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
-- 
2.34.1


