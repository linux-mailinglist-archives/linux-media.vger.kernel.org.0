Return-Path: <linux-media+bounces-59037-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHErIF5h4mnI5QAAu9opvQ
	(envelope-from <linux-media+bounces-59037-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:35:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8AA41D2D4
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 18:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 960A130048EF
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972CF2D46A1;
	Fri, 17 Apr 2026 16:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXBeNk5i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A63335BDC9
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 16:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443587; cv=none; b=eUKGZznNtCLJF//XyLD0195CSBe410klwmQY/5BeblwGebkU38DK9/mHScSf7x5kL2QSemrjSUVbCuCsJx5RGJq3HqkrR9eQOuPTiF7cjOumbnZlTNDduSyKV4xmh4q1GKHWH19zPoE8/cjbiM2kg174fYtmu12zCN+sfFxsDVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443587; c=relaxed/simple;
	bh=Cu1Qzmws012BXnI1eTEAw1sw3l4dPj+7XQhUK50WAm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hs9V8RpUHMMYV38aPrFt2C1vVPJxz5qrgQCBf93qvB63SUXSCys5sm/j8pWiQ++zNQZ57FHQo/ZYR8xuwcnl7rjPdP77rJjD38mDyTR47x6/Cd1UyQaUyf91T5etJeanvB6m+13l0qhtDD+7o5uI62pVaPqRGS8tVQoolKv+U8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXBeNk5i; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c555f886dso1141458c88.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776443584; x=1777048384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lDBm8n8fJvrsOswm79MFjtCZT25fXo9SM2Tx+0mY14=;
        b=VXBeNk5ik3eQP1muaXlgiq/5III6uvCaZTOm0JPvIowMBGdSw6xpNxb1zymgVWPhc/
         ooVy9tFpjVkOCwh6qYz3FzLxmeu67GCfYPoW5ym2MdseeBk1808IizuMd45ug0zFnvVm
         eGxEsaTmLrZaZGX2GGpZkKtemNRCeT4c+fJOqyWydSevvareH4Ufiei/JDJccknt6UmU
         NX/VQpNUtoTdtZ9E3b+5l4EKf56lBC5RFVEXO2+WewMdj7eNsRnvN7QsOtQdXb2/uxOy
         J/W69Nlg8bpoQ/vc1DKz2Bv30ZWBpXhDssDP+NoIjd32ayVA/QE3zCkc3G9u/BsCL6iH
         ptnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776443584; x=1777048384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+lDBm8n8fJvrsOswm79MFjtCZT25fXo9SM2Tx+0mY14=;
        b=UNndQV+3OFZbML6ncjjIqe80kiHgg2MwPDZCScoIlOYyUsMbmdk5cHGr0r6yn3UYTX
         wst57bM6qvK5elEdkMn147albi59KxEfSL04UShcUBugl8Ti5Jm6BPKG8wrVNfBBiwmG
         j6HAUGuizWEXw/xBwv+M3wendejk1A3xu5/3KSC7aZ0k8WOgrE73MsJKnY8jgUyTQzdX
         M2j5had5GlFWlu1Ujjg3Jf3GD+Yu8Ga4rKzMXgox+4mLj1snxi1U9No7HVq1+ug0l5gK
         zAU7dOybkTNBgefidgQr7x3BvKFVdOgobQ7kce0Szio5dIMHNzPGCqqo29Vg+yjR5hz4
         4TRA==
X-Forwarded-Encrypted: i=1; AFNElJ9NqBHg4+7NAPuebKdZC2sFs7lgbF8ALru6IR6W+pnE/hC9f79y5CmfFMjplXWBMYwv40GhtY29HQ5WLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzAplk+TXjC+FoZJZhGJ0KkvLL14nfBnJqXTeMdAmCyisZFQyb
	x1QTFSG8I1JJ5uFZakxUJGZ3ivkOMxg1JWH6uDIx2qQQGNZPqo4lERol
X-Gm-Gg: AeBDietSjpBFxxa7w9vr7+M3PMFa5qPvA3e4UF21lpco8DEoI4ZhpA0q8hbK0X9ow2E
	iNC+KtCObwD1puBGEt3+739ljNWK9K1h/jMSVs7132bK8EkUgNHgOXbp0MhdS8WqYWtfHMVM+uZ
	3rbryZnHNxVqmg1KGcAckbQcKX/gWMy5xX9f9WU72bj9vN0zjBxPlPen+wlMpSpKRV2WM++ob5M
	8IczDJyGMa2HYvVFqgXf+cJQn5lSPONfyCzi28alyR+2qZHM1Pkw7ucl4P2mzVSoZPVJdow8Zck
	oJPz98sJPjB7Zj18F98m3tX9OtKOTcAJTpO1kO4ohXOTGcnSPpidimA9PUckvKJ6ySu+cn5uc3h
	8wf/ImfuHImWV1ZqGNyELpSwp0DMwodzA3Rd5BGGRnMkqcQzpfTDn/7QTmxG8f8GKcKlZJU0Tyh
	48TtG2QHNamg6XpZyd7Y/qj8ho/XXjEYGBEa8dkJh8l6J2qNTQtHWX/bGE/s+T65Z1qm31nA==
X-Received: by 2002:a05:7022:383:b0:12b:ebb9:1c18 with SMTP id a92af1059eb24-12c73fa739fmr2082866c88.31.1776443584133;
        Fri, 17 Apr 2026 09:33:04 -0700 (PDT)
Received: from TC-LAPTOP (23-93-157-142.fiber.dynamic.sonic.net. [23.93.157.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749dc86bsm3603777c88.8.2026.04.17.09.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:33:03 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v3 2/5] platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
Date: Fri, 17 Apr 2026 09:32:49 -0700
Message-ID: <20260417163252.15603-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417163252.15603-1-tchatard@gmail.com>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59037-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C8AA41D2D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The BIOS on the Dell Latitude 5285 leaves GNVS field C0TP at zero.
With C0TP=0 the ACPI _DEP method on INT3479 (OV5670, front camera)
resolves to PCI0 instead of the INT3472 (TPS68470 PMIC) device.

Because for_each_acpi_consumer_dev() walks the _DEP reverse-mapping,
INT3479 is invisible to it: the clock consumer lookup entry for the
front camera is never registered with the tps68470-clk driver, and
the OV5670 sensor driver cannot acquire its MCLK.

Fix this without touching ACPI tables by adding optional static clock
consumer fields to struct int3472_tps68470_board_data:

  unsigned int n_clk_consumers;
  const struct tps68470_clk_consumer *clk_consumers;

When board data is present and n_clk_consumers is non-zero, probe uses
the static list instead of for_each_acpi_consumer_dev() to populate
tps68470-clk platform data.  Platforms that do not set these fields
continue to use the existing ACPI traversal path unchanged.

The board_data lookup is moved before the clock-pdata allocation so
that it is available for both the static and dynamic paths.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 29 ++++++++++++++++---
 drivers/platform/x86/intel/int3472/tps68470.h | 10 +++++++
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..3364ef428 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -155,9 +155,31 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	if (!adev)
 		return -ENODEV;
 
-	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
+	/*
+	 * Look up board data before building clock platform data.  On platforms
+	 * where a sensor's ACPI _DEP does not list the INT3472 device,
+	 * for_each_acpi_consumer_dev() misses that sensor and its clock consumer
+	 * entry is never registered.  Board data can supply a static consumer
+	 * list to use instead, bypassing the broken _DEP traversal.
+	 */
+	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
+
+	if (board_data && board_data->n_clk_consumers) {
+		clk_pdata = devm_kzalloc(&client->dev,
+					 struct_size(clk_pdata, consumers,
+						     board_data->n_clk_consumers),
+					 GFP_KERNEL);
+		if (!clk_pdata)
+			return -ENOMEM;
+		clk_pdata->n_consumers = board_data->n_clk_consumers;
+		for (i = 0; i < (int)board_data->n_clk_consumers; i++)
+			clk_pdata->consumers[i] = board_data->clk_consumers[i];
+		n_consumers = board_data->n_clk_consumers;
+	} else {
+		n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
+		if (n_consumers < 0)
+			return n_consumers;
+	}
 
 	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
 	if (IS_ERR(regmap)) {
@@ -176,7 +198,6 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	device_type = skl_int3472_tps68470_calc_type(adev);
 	switch (device_type) {
 	case DESIGNED_FOR_WINDOWS:
-		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 		if (!board_data)
 			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
 
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
index 35915e701..4aefb728e 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.h
+++ b/drivers/platform/x86/intel/int3472/tps68470.h
@@ -12,11 +12,21 @@
 #define _INTEL_SKL_INT3472_TPS68470_H
 
 struct gpiod_lookup_table;
+struct tps68470_clk_consumer;
 struct tps68470_regulator_platform_data;
 
 struct int3472_tps68470_board_data {
 	const char *dev_name;
 	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
+	/*
+	 * Static clock consumers.  When n_clk_consumers is non-zero these are
+	 * used in place of for_each_acpi_consumer_dev() to build the tps68470-clk
+	 * platform data.  Needed on platforms where a sensor's ACPI _DEP does not
+	 * list the INT3472 device, causing that sensor to be missed by the ACPI
+	 * dependency traversal.
+	 */
+	unsigned int n_clk_consumers;
+	const struct tps68470_clk_consumer *clk_consumers;
 	unsigned int n_gpiod_lookups;
 	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
 };
-- 
2.51.0


