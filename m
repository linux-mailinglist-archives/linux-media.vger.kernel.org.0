Return-Path: <linux-media+bounces-59596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HYCHqzs7GngdgAAu9opvQ
	(envelope-from <linux-media+bounces-59596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:32:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A056D466E83
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 71F77300B9D1
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 16:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EFC35FF6E;
	Sat, 25 Apr 2026 16:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrWta9iy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414A635C1B6
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 16:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134716; cv=none; b=tGrt0lTBZwfnyRxCKnUIhO01ecBrnDAF1EAfOYXmPh2NVSkvslYJ6SRisshCHtP+1sTVaKN8V2zSr1TS0S1z660G+lRCw/KYdYfcteiK59LVZ5KBL85GC9Rf/S4yZ7pXjsffudHrt3aIHDD2izYGNIpAC6tUOn5Ur/r24ySDDQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134716; c=relaxed/simple;
	bh=FIxvoDwbLwQtSP5P+8VTM35kemls7O4jg6bqp3j/4/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7c/wcL2gdViNdaX16oXEuvfos3GV/UgkXO7SQnENhBhfQtvKd7LUDNlg1Snl/51ZoZTgBiHX8QepcaELkOeddzSXubmbskVWJx2JOnoCd5qS2AhmAuvuv+htiFwIyUuqr1sL4O05Ue7oohvAciVAKeQPa1zyGy0LPD7jfU35YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrWta9iy; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b4520f6b32so12403288eec.0
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 09:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777134714; x=1777739514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qT+tPItvsjHY7RItgndIerm7VL1olTQZXKAgVp9YrJc=;
        b=RrWta9iyBcyTApi0O+zjHc5+MfBZ3qpwfN3oVtlxWuJ8TEngCQAgdFOPiXKS47hDvF
         qtP3DnJK1V6TLLyAs7UlNEZnQZTVCvK5haEcmW7fiL5iNj7AidxkSJElwoOLEBd1RiH4
         w0DtP24QQ+8VNWsV9JQ5sS+Mh7xDP5WTCvEosX5aMlkmL4qmxFSA7KyOW6hT3WV419AJ
         LN8ijDe2DJhHN25tEUVQnnKhrwEEsDJJQ+9rJq8qncemqHQk28cfbjEgoMn8BpbndMbO
         N2i5Yg/ViorS5mYcFqIb1yU7gD5Op3TdyeXIQmVPIVJ1xezflcVKoH0WClzDZK0ReYKo
         eZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134714; x=1777739514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qT+tPItvsjHY7RItgndIerm7VL1olTQZXKAgVp9YrJc=;
        b=cgGudeyPj7qVUUlA6pxEqkYDfXCFuWHGLYnmFy/HN1fgQNTv9M/krFfMJHfrhXZeAe
         CwquS7AFLbSUciFtz4J70zo4E3r/dewVSZPqK+owARXvh+BL6xfyQNAohdPJIKMiINrh
         ysur7dbURJCO9SUthnNHRCecwH68pAwMZiyaDBUWKh8cjPSg+zHTTcga4qxcBF5UIWhG
         r6rAGl+YwwdErDX1Lwd7Vnqnzho2VMg4q50axULzWfemaPMsn6iJvY1iK66zHN4D6M1s
         EBOp5TpFTyRID8PWNrCGvqDpKqOMj04f+Nic8xikSVGtVybJVAGByAQst105dkjR3nMu
         LgTA==
X-Forwarded-Encrypted: i=1; AFNElJ+HDIVH4KMbaBm851RZs5BSMbKDyCy1MMPB12K5ZpfmfobgtvCJk6vO9GjbOYyAzLRHOXfyjpxAoKslhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZPCQsH2sEZ77wTCtrhNTfOPFzd3ZZq463OvF32OumEWNk+soH
	gzrSD8AYbCz0ihyKGTkf0S+sQzI+1v8fBhQVP7xNkwqVSAeD/GwFy98x
X-Gm-Gg: AeBDieuXBqy6QU57mzGcXVL9lQlLLGeFupmQVDp5D1kCnktIx/Bobs+6GB2BrPyIcSm
	dcFqB7JVwDpkph5IgAczmxBMKhQ4LaBBavmkkuX5Uy4JcZMFHn5auGw40T0cRU5vU+jQlJZWv1e
	R3DHQRkJ69gQvk5jSdY8lkdg2aJylWLt/PcX33EKwml7/qhyUXag2uefeXMQNSVVw4+sYMfezpw
	iYqk9rUWQXvmXGsos2kZev89U5EhG6JHzeX6TuJTGMvkE/0zC4DADJWxepNy7HV0efbL5kwRx0W
	4MpbW+IViNSRd2jKvMGAVDaX0yWyra1PKlnNcT9mCq5CV6LkKIc+hY39HqV2+TitHQvqK57eKzy
	dbL0NYuTF8xvonTlVvkaxvGPCJkE4ZMMsCut9c6HMFUksvc5bYfjgfTilCEJXP7FWw+dBHS935n
	GF5kLqKPvP4QV5mxi+KTG9ORi1F/kX8nGT9w==
X-Received: by 2002:a05:7301:4d0d:b0:2ea:5057:a316 with SMTP id 5a478bee46e88-2ea5057b896mr7857173eec.13.1777134714407;
        Sat, 25 Apr 2026 09:31:54 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.143.226.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8bd2sm35922547eec.11.2026.04.25.09.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:31:54 -0700 (PDT)
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
Subject: [PATCH v6 2/5] platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
Date: Sat, 25 Apr 2026 09:31:42 -0700
Message-ID: <20260425163145.8474-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425163145.8474-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425163145.8474-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A056D466E83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59596-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

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
 drivers/platform/x86/intel/int3472/tps68470.c | 113 +++++++++++-------
 drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
 2 files changed, 79 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..92da2ba80 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -147,17 +147,41 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	struct tps68470_clk_platform_data *clk_pdata;
 	struct mfd_cell *cells;
 	struct regmap *regmap;
+	struct gpiod_lookup_table * const *tables;
 	int n_consumers;
 	int device_type;
 	int ret;
-	int i;
+	unsigned int i;
 
 	if (!adev)
 		return -ENODEV;
 
-	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
+	/*
+	 * Look up board data before building clock platform data.  On
+	 * platforms where a sensor's ACPI _DEP does not list the INT3472
+	 * device, for_each_acpi_consumer_dev() misses that sensor and its
+	 * clock consumer entry is never registered.  Board data can supply
+	 * a static consumer list to use instead, bypassing the broken _DEP
+	 * traversal.
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
+		for (i = 0; i < board_data->n_clk_consumers; i++)
+			clk_pdata->consumers[i] = board_data->clk_consumers[i];
+		n_consumers = board_data->n_clk_consumers;
+	} else {
+		n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
+		if (n_consumers < 0)
+			return n_consumers;
+	}
 
 	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
 	if (IS_ERR(regmap)) {
@@ -176,52 +200,53 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	device_type = skl_int3472_tps68470_calc_type(adev);
 	switch (device_type) {
 	case DESIGNED_FOR_WINDOWS:
-		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
-		if (!board_data)
-			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
-
-		cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
-		if (!cells)
-			return -ENOMEM;
-
-		/*
-		 * The order of the cells matters here! The clk must be first
-		 * because the regulator depends on it. The gpios must be last,
-		 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
-		 * the clk + regulators must be ready when this happens.
-		 */
-		cells[0].name = "tps68470-clk";
-		cells[0].platform_data = clk_pdata;
-		cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
-		cells[1].name = "tps68470-regulator";
-		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
-		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
-		cells[2].name = "tps68470-gpio";
-
-		for (i = 0; i < board_data->n_gpiod_lookups; i++)
-			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
-
-		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-					   cells, TPS68470_WIN_MFD_CELL_COUNT,
-					   NULL, 0, NULL);
-		kfree(cells);
-
-		if (ret) {
-			for (i = 0; i < board_data->n_gpiod_lookups; i++)
-				gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
-		}
-
 		break;
 	case DESIGNED_FOR_CHROMEOS:
-		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-					   tps68470_cros, ARRAY_SIZE(tps68470_cros),
-					   NULL, 0, NULL);
-		break;
+		return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
+					    tps68470_cros,
+					    ARRAY_SIZE(tps68470_cros),
+					    NULL, 0, NULL);
 	default:
 		dev_err(&client->dev, "Failed to add MFD devices\n");
 		return device_type;
 	}
 
+	if (!board_data)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "No board-data found for this model\n");
+
+	cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
+	if (!cells)
+		return -ENOMEM;
+
+	/*
+	 * The order of the cells matters here! The clk must be first
+	 * because the regulator depends on it. The gpios must be last,
+	 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
+	 * the clk + regulators must be ready when this happens.
+	 */
+	cells[0].name = "tps68470-clk";
+	cells[0].platform_data = clk_pdata;
+	cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
+	cells[1].name = "tps68470-regulator";
+	cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
+	cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
+	cells[2].name = "tps68470-gpio";
+
+	tables = board_data->tps68470_gpio_lookup_tables;
+	for (i = 0; i < board_data->n_gpiod_lookups; i++)
+		gpiod_add_lookup_table(tables[i]);
+
+	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
+				   cells, TPS68470_WIN_MFD_CELL_COUNT,
+				   NULL, 0, NULL);
+	kfree(cells);
+
+	if (ret) {
+		for (i = 0; i < board_data->n_gpiod_lookups; i++)
+			gpiod_remove_lookup_table(tables[i]);
+	}
+
 	/*
 	 * No acpi_dev_clear_dependencies() here, since the acpi_gpiochip_add()
 	 * for the GPIO cell already does this.
@@ -233,7 +258,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 static void skl_int3472_tps68470_remove(struct i2c_client *client)
 {
 	const struct int3472_tps68470_board_data *board_data;
-	int i;
+	unsigned int i;
 
 	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 	if (board_data) {
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
index 35915e701..1d3d67459 100644
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
+	 * Static clock consumers.  When n_clk_consumers is non-zero these
+	 * are used in place of for_each_acpi_consumer_dev() to build the
+	 * tps68470-clk platform data.  Needed on platforms where a sensor's
+	 * ACPI _DEP does not list the INT3472 device, causing that sensor
+	 * to be missed by the ACPI dependency traversal.
+	 */
+	unsigned int n_clk_consumers;
+	const struct tps68470_clk_consumer *clk_consumers;
 	unsigned int n_gpiod_lookups;
 	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
 };
-- 
2.51.0


