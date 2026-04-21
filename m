Return-Path: <linux-media+bounces-59252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFC4MnIB6GlJEAIAu9opvQ
	(envelope-from <linux-media+bounces-59252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 01:00:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 444544405FD
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 01:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCE76312B56A
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0863A7848;
	Tue, 21 Apr 2026 22:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGupfWbU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC4C3A7832
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 22:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811958; cv=none; b=UIOcAOyBKerjspVsov2rys5mvvUq+h7yPHoDtYE5xGV8DtNy0impJ1BmcYaLGCwCxJBaBdb1T+lAZxVX6fz3LdioE+EFx95k3Jsu7hPh7dbtXzwFlzbCs9/PE9GJqrLIW+VUPSx59cAkELlZuXAV7q0/ipXGdGRwM4YcwH9ol8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811958; c=relaxed/simple;
	bh=pkISsqV/Vd/AkxRoaxIZdYMzBbCImLUZNm6/QZ3JzIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WY/SBW2KnwRjbkK5HJOdZqcaZ08xZvxmmKnG4gyVokgrDF4T+ezUR7OUBLSDCw57P5Ks7H9HG4ZSpxONsIoYy1Zx8jHzCXtWiguvxCZeflr25BBLxq99atepsk3WTjba9bLvIIDsnvdyYkibf6K+LVJKBMalLqxGUx0wOfZ8UY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGupfWbU; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso4011642eec.0
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 15:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776811956; x=1777416756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMmU13XWi2hz/awwYwuaTGeoy/1gyMry/mt49asroCk=;
        b=OGupfWbUQAXYCzcLTVxk4AAuqIZ+3ToqdEVaY7cmfRSvUWs4Z/GHUopGy6GOKz/wDK
         qs03Uyx3Fsb71jjW8XY0/JyluX+ZZE75bsUBvzd19z9y1c+N/0ZXNojijEUbu1p4T1Ef
         ev2KpeKOJoL5/MYOlDGAxYxoa9HyqHKqHMJdAN/9oIRoj7bQyxyvV0aA+1puAScURy0c
         RbDlj5R+NAk4veVRzWZ9GmncKcqRuytq0eDUKNaJeL9vS4NYd1BgT70YMz+WzB1Tv+qO
         QVdqJBizZRBiNoxiJOk7HR0LHBMwgwPa0lMD5038+kmNujYB4Nu6GUGKVyLdXsYexYUi
         DNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811956; x=1777416756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qMmU13XWi2hz/awwYwuaTGeoy/1gyMry/mt49asroCk=;
        b=T3arP6FedAJSolKF5AymI7fA3Xu8MAs0rPVIZvXtnLjTy+04uucC7hFFoTmzISmqhS
         0bGpNKssoTWNTd9/q0EUGCza3ohOgAi5tC2Cw/RaHtyS4ifDoIs5nS8AjCa96XXu1iyD
         roEr83Rip8QZ612xnaUu2/fMqvItIS+DA0aMPXsYCJ5yRTYIEp3cRwy7/i3pP9PGnHDX
         OS/8GRqtN7TtMZonBk5ueKCXLgqQ4TQIBzJBCtUEAtCjDtP3kUPQ6/aV6/K1diEH1dQD
         gme/rauWjl1Sks+DTtUVTIAzT2wzyqFTehj5nPFHyMq4K6jyO49ULJv/iERVv2rCHTLb
         83vQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1y+aCibprvhN/73QkoCsRNsmbhFEuoxe//uMAUrHnH7pGrt4wqbF71KMtRbf91Slw0kT7UnF16jY7Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI1YKqM+1MQBrdu0JyieM0EBr/XU0+4+IabHyzwg16JvfFnEjS
	dvT8gYc5+Fo1nQ9vTS9vLfTEaxiL083sya8Dz6qhUNldzp2dNgoBNDk5
X-Gm-Gg: AeBDiesBxP3KiKA6/rdrC3RMz65M5n4InriHcdxoGn0AJ8K97TPJczpMZwEYTHH9nwb
	qgwFvHahbbnF4mlumHZYM6M+5ifHQR8pjIShLimnKNTQC3pnPY0aWuOdbJ2UrqTIw6/chau9AzO
	Ex9Z5/J3n6NuRi6wxm1QcqIQA6LmjtJlE2TDdIdvsJrnEfdiSBa5go6kaF0Nta3ZtjdIovTzIo8
	GxCTE2W9KgbaNZXvDKyvd/VqOFc7+NkT4R6FAeha1M5EnRR8UuJvpZWnp1JTvXYL6RJLpY/7bJ8
	P0fNs+/rEEXHb3O5FoSspP99Ej3ZkmK3/TRdfdtidWJyD/5oT3e1UIBqkZhgsTtGNrBQtDY53CJ
	u/sqM+gOBIqio1QKQuPzXTiISkHgXw9155Cu1zxE34yRWTEbCO+vtrJsmTJBR8dIO4Ty9/r7uJL
	qP2Q4BF+Ee76AzYwNa+ZxZl/ikp12TF83W
X-Received: by 2002:a05:7300:5711:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-2e42c15ceacmr9582888eec.3.1776811955691;
        Tue, 21 Apr 2026 15:52:35 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm26145884eec.8.2026.04.21.15.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:52:35 -0700 (PDT)
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
Subject: [PATCH v4 2/5] platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
Date: Tue, 21 Apr 2026 15:52:14 -0700
Message-ID: <20260421225217.12472-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421225217.12472-1-tchatard@gmail.com>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-59252-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 444544405FD
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
 drivers/platform/x86/intel/int3472/tps68470.c | 36 +++++++++++++++----
 drivers/platform/x86/intel/int3472/tps68470.h | 10 ++++++
 2 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..e121eb24a 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -147,17 +147,40 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	struct tps68470_clk_platform_data *clk_pdata;
 	struct mfd_cell *cells;
 	struct regmap *regmap;
-	int n_consumers;
+	unsigned int n_consumers;
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
@@ -176,7 +199,6 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	device_type = skl_int3472_tps68470_calc_type(adev);
 	switch (device_type) {
 	case DESIGNED_FOR_WINDOWS:
-		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 		if (!board_data)
 			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
 
@@ -233,7 +255,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
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


