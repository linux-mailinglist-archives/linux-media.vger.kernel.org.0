Return-Path: <linux-media+bounces-33735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA9AC9C6A
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 21:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B733BE8F8
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 19:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65CB1A3148;
	Sat, 31 May 2025 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1DWXxDZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D112F5A5
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748718349; cv=none; b=HGZQpbOH5iX2bu/ngTnYdylsUmzq+XBYBjB/NGs0plRWwoIuSas2dEl08Gq4GK025xakF+WxB3ItonmnCgdYrBoORtt2+UGc+XauMk4aQP217W8SVZ2O9bfiVtssCOPjJlJxO30aoX+hptbIEk0a0bxlhMXISpRsErVd6D05bTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748718349; c=relaxed/simple;
	bh=dp/scgIHX9go4ioONDi5Tw7mpr9mAUD6/zTwDHcF5mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIybAlgKw96RtpY43wGA5A8boyRSxJlKP/7GQpW8jsnzenpQ9d1Bbt/dXRPAhACCvD7tpwxanK2u8KdcXv/9DHcGJOn2vjHrAjGh/GPkp0mfUPUgpmIMdImLaQCe6uQ/LgpoSfZgpNuh7t7X8pqRlL1mSnoeEFoOK5rcN9iIWNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1DWXxDZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A95C4CEE3;
	Sat, 31 May 2025 19:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748718349;
	bh=dp/scgIHX9go4ioONDi5Tw7mpr9mAUD6/zTwDHcF5mU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1DWXxDZvTf16hnZi/2PZ0VsKVj0h/byIrajw2Wd7pUAQPMU3kGundo82WGkvtOAK
	 Lwh4B/6a9uUL7bARX5/vKQIP6OWa1BmXnHzDkcOze2PpFt6zOhCtdP9Gjy7xfQ3+7w
	 pmLAS9Tot7OOik0qwQtrcFqrqOqMOntOuKkMKtGzxEboEVrB4eU1tncGJYZZkTOtvN
	 6uCMtMuFKmUC++XwmincJHoahtoTM0UYx9K2TC+t0gmbY3UGQacSBX0mF47PL6agIa
	 mwXNDLLsyFCHOa19Tbpu2TbZAHwPSbFO8YiJRDrU0beyMfUGmAWqLXOVPWG/FTv7FV
	 zh3yCKHNU2rCA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: hi556: Support full range of power rails
Date: Sat, 31 May 2025 21:05:34 +0200
Message-ID: <20250531190534.94684-3-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531190534.94684-1-hansg@kernel.org>
References: <20250531190534.94684-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

Use regulator_bulk_* to get the array of potential power rails for
the hi556.

Previously the driver only supported avdd as only avdd is used on IPU6
designs. But other designs may also need the driver to control the other
power rails and the new INT3472 handshake support also makes use of
dvdd on IPU6 designs.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2368506
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/hi556.c | 40 +++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index d3cc65b67855..110dd00c51ae 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -624,6 +624,12 @@ static const struct hi556_mode supported_modes[] = {
 	},
 };
 
+static const char * const hi556_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
 struct hi556 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -639,7 +645,7 @@ struct hi556 {
 	/* GPIOs, clocks, etc. */
 	struct gpio_desc *reset_gpio;
 	struct clk *clk;
-	struct regulator *avdd;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(hi556_supply_names)];
 
 	/* Current mode */
 	const struct hi556_mode *cur_mode;
@@ -1289,17 +1295,10 @@ static int hi556_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct hi556 *hi556 = to_hi556(sd);
-	int ret;
 
 	gpiod_set_value_cansleep(hi556->reset_gpio, 1);
-
-	ret = regulator_disable(hi556->avdd);
-	if (ret) {
-		dev_err(dev, "failed to disable avdd: %d\n", ret);
-		gpiod_set_value_cansleep(hi556->reset_gpio, 0);
-		return ret;
-	}
-
+	regulator_bulk_disable(ARRAY_SIZE(hi556_supply_names),
+			       hi556->supplies);
 	clk_disable_unprepare(hi556->clk);
 	return 0;
 }
@@ -1314,9 +1313,10 @@ static int hi556_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = regulator_enable(hi556->avdd);
+	ret = regulator_bulk_enable(ARRAY_SIZE(hi556_supply_names),
+				    hi556->supplies);
 	if (ret) {
-		dev_err(dev, "failed to enable avdd: %d\n", ret);
+		dev_err(dev, "failed to enable regulators: %d", ret);
 		clk_disable_unprepare(hi556->clk);
 		return ret;
 	}
@@ -1335,7 +1335,7 @@ static int hi556_probe(struct i2c_client *client)
 {
 	struct hi556 *hi556;
 	bool full_power;
-	int ret;
+	int i, ret;
 
 	ret = hi556_check_hwcfg(&client->dev);
 	if (ret)
@@ -1358,11 +1358,15 @@ static int hi556_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(hi556->clk),
 				     "failed to get clock\n");
 
-	/* The regulator core will provide a "dummy" regulator if necessary */
-	hi556->avdd = devm_regulator_get(&client->dev, "avdd");
-	if (IS_ERR(hi556->avdd))
-		return dev_err_probe(&client->dev, PTR_ERR(hi556->avdd),
-				     "failed to get avdd regulator\n");
+	for (i = 0; i < ARRAY_SIZE(hi556_supply_names); i++)
+		hi556->supplies[i].supply = hi556_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&client->dev,
+				      ARRAY_SIZE(hi556_supply_names),
+				      hi556->supplies);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to get regulators\n");
 
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
-- 
2.49.0


