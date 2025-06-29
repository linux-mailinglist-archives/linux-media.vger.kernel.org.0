Return-Path: <linux-media+bounces-36210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2087AED117
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB0681890F43
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A5523DEAD;
	Sun, 29 Jun 2025 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzhgCJPD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C457222F74A
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230598; cv=none; b=R7vDPJcqHqQM4JPFxqlOzyUmgxOyEm5EjVUKQDoGPEHQJT2sD7luRLP4AveekpFkJsU/Fdx2CI26/e4+cOUk5PBMmF83hHxMJGZUF6euwLa3CXHlrAOUmDaje6aK7J9dzANJNdyS7D3Sq2f+v7dyfOyCcRQtXeFe8Im2lCQaqK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230598; c=relaxed/simple;
	bh=S74UMftPAlRwGiL4tm80DNwdcWwLDYkmDZTnhCtBExw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IG8WUkd2n5I9Aw8K+8UJDJi53Yy7w7zn7Q1lsW4+D78RiWIcPVFBXiYnuSUsTCiwj6UISaRwMtlOyV1ivPVgJpvpN65xc6diETeVcLNlHs9CactrUmHvlOM92CNqmhN8W6oCYCYNqPEsGcsE4OFsk+T1D8LbLBhZXs9usFuRSIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzhgCJPD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F3CC4CEEF;
	Sun, 29 Jun 2025 20:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230598;
	bh=S74UMftPAlRwGiL4tm80DNwdcWwLDYkmDZTnhCtBExw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NzhgCJPD79K/PoVJIRXSr+tD0git998CZ/CGuC3nCZiwpB0N+1zrv8QqTGGfCM3qV
	 /buL1vpui/MR8XMvArgtiE5mRJ8FIMNPxxTukfkEodaaxsvQpRkeRCorjqnC2AkNat
	 9EnfBI2WKhD2PMVGp5BafIDJxhdk9+U7xjjUG5euTaarFJ3dK1IH8bXQtQHG58xVeQ
	 9cEpQs1gAPpOaQlb79bMEBW5FXBKZ8NxOK2mpMXs3mjzB1bCeuOjulPq+bahQDIheq
	 TfcmyEwjQcM9gxrIxJJ4gN5otlEbqhggj3Dt0mGnRZs/2IZNXZyLyPu6ehN/yq+4JV
	 MawXEO2EFkPxg==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 02/15] media: mt9m114: Add support for clock-frequency property
Date: Sun, 29 Jun 2025 22:56:12 +0200
Message-ID: <20250629205626.68341-3-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for platforms that do not have a clock provider, but instead
specify the clock frequency by using the "clock-frequency" property.

E.g. ACPI platforms turn the clock on/off through ACPI power-resources
depending on the runtime-pm state, so there is no clock provider.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Note as discussed during review of v1, this needs to be moved over to
the solution from:

https://lore.kernel.org/r/20250321130329.342236-1-mehdi.djait@linux.intel.com

once that has landed upstream. I'll submit a follow-up patch to move to
that solution once it has landed upstream.
---
 drivers/media/i2c/mt9m114.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 3f540ca40f3c..5a7c45ce2169 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -388,6 +388,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	u32 clk_freq;
 
 	/* Pixel Array */
 	struct {
@@ -2134,14 +2135,13 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
 
 	/* Perform a hard reset if available, or a soft reset otherwise. */
 	if (sensor->reset) {
-		long freq = clk_get_rate(sensor->clk);
 		unsigned int duration;
 
 		/*
 		 * The minimum duration is 50 clock cycles, thus typically
 		 * around 2µs. Double it to be safe.
 		 */
-		duration = DIV_ROUND_UP(2 * 50 * 1000000, freq);
+		duration = DIV_ROUND_UP(2 * 50 * 1000000, sensor->clk_freq);
 
 		gpiod_set_value(sensor->reset, 1);
 		fsleep(duration);
@@ -2279,7 +2279,7 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
 	 * Check if EXTCLK fits the configured link frequency. Bypass the PLL
 	 * in this case.
 	 */
-	pixrate = clk_get_rate(sensor->clk) / 2;
+	pixrate = sensor->clk_freq / 2;
 	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
 		sensor->pixrate = pixrate;
 		sensor->bypass_pll = true;
@@ -2287,7 +2287,7 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
 	}
 
 	/* Check if the PLL configuration fits the configured link frequency. */
-	pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
+	pixrate = sensor->clk_freq * sensor->pll.m
 		/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
 	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
 		sensor->pixrate = pixrate;
@@ -2395,13 +2395,25 @@ static int mt9m114_probe(struct i2c_client *client)
 		return ret;
 
 	/* Acquire clocks, GPIOs and regulators. */
-	sensor->clk = devm_clk_get(dev, NULL);
+	sensor->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(sensor->clk)) {
 		ret = PTR_ERR(sensor->clk);
 		dev_err_probe(dev, ret, "Failed to get clock\n");
 		goto error_ep_free;
 	}
 
+	if (sensor->clk) {
+		sensor->clk_freq = clk_get_rate(sensor->clk);
+	} else {
+		ret = fwnode_property_read_u32(dev_fwnode(dev),
+					       "clock-frequency",
+					       &sensor->clk_freq);
+		if (ret) {
+			dev_err_probe(dev, ret, "Failed to read clock-freq\n");
+			goto error_ep_free;
+		}
+	}
+
 	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(sensor->reset)) {
 		ret = PTR_ERR(sensor->reset);
-- 
2.49.0


