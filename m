Return-Path: <linux-media+bounces-33721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 739E1AC9BB9
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D20FE3B1C22
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E743770B;
	Sat, 31 May 2025 16:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6Mgc+90"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A2017A2F7
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709121; cv=none; b=QzKAO5PYKR81jDtEbnjES/Apmkp4/6Z0/eqQijUMftSu3a/RjEINcUtveozNEsAF82pUyKmHQegLf/bV2uFA29KJUfC5BajPunpeedSMbvN6B4WVIixnL81skmpo6sUI2mXC9fhXfGrffQpPzMIaeW5Mm/jQCSr9Nq2stKjFBLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709121; c=relaxed/simple;
	bh=S74UMftPAlRwGiL4tm80DNwdcWwLDYkmDZTnhCtBExw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjT5GvueKfBiIatdMMSkIlQ1xeL+Bzg0nvcM26Nu65PJdqWLU3lk5xnp7AcrjwbD0f/tzrDoiwqEfa/0NP19zuSbXW/45kgIOfFGxbXica4KuCZApWFWkzW4hUlUmkcETBjjmKx5xZWT/XCqinBXK/kQ9GAXbjOobrqDGQ5ercY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6Mgc+90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC02C4CEE3;
	Sat, 31 May 2025 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709121;
	bh=S74UMftPAlRwGiL4tm80DNwdcWwLDYkmDZTnhCtBExw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r6Mgc+90dt+G/UhjsWFTnLZqMGAbJ5g0zevKveJSOVuIS7R3tCXT/lda2rLwKFCop
	 TZSVw33QJ3aORAJjNf5FDvirjO8OtIYl3nxoCieJzQiLUeu6qCy9hp111d4iFiie4o
	 i7lRHMdbYGGYSyRt6PSvQf5RsewK10V3p8oWt6obypD53H6NoPaumAfxUE2NIDy0NU
	 YQv3i020MnYlUKZBARNf45Uu+Fzwni+ZiimKeapoQoPdyj4pk/ak8n4m5ojEncICYH
	 VjExTHQxmnzeT6xMbE8LesSNOR0QmAQla6gZn9KPFVHXWwokPDukJZ/V+cqla2IWjX
	 4mw/8zzHf2Mcg==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 02/12] media: mt9m114: Add support for clock-frequency property
Date: Sat, 31 May 2025 18:31:37 +0200
Message-ID: <20250531163148.83497-3-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531163148.83497-1-hansg@kernel.org>
References: <20250531163148.83497-1-hansg@kernel.org>
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


