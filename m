Return-Path: <linux-media+bounces-23870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5009F9189
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7ABB1891E0C
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B0C1C3029;
	Fri, 20 Dec 2024 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HtiEnGiC"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F6D1C07FE
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695022; cv=none; b=nfaFX21OWqh9bm1ktDQwsEIOgIR1lIX37WUJ8MY2KrV6goMJQKlQtWCO+xkjxktTLOiLd8FJoOWM8eOlAcJFDw8NzT5nwNnb3WguHD8eCk6qYpkv4xJDTXnq5yxsYbs+lFJcQ5lqfnrkJXlj830cELC9+9YKrqn/YXmo5fGTfF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695022; c=relaxed/simple;
	bh=1Q4r/2vnj4uHxSoaDJQaKLSjXx8RPbWgH9Xd9zP3oGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fPCLgTtBpS6oR5jf7Ub7cFMmpxu2sTAi4IPVQO1HUlE6x8Gg21GwLTDHurGb1i1nenopUjgQe0l2MpeHc3D33I4SHW27CFgSFq9usI9gVFp4Ae4y6ZY1NrL0uQxbrSOvc2/CNUNtz1bbz6+14HzQxAMA98GOkp0uyjI64VPfE4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HtiEnGiC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734695019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gyqeW1ucNsufnmm4yh81pi2UUfJhZQ3+Y92Tk5SVFas=;
	b=HtiEnGiCnXcmnjKIHetFR4+2VTTGihC8CuC11IdA28KHS9G9JL5B90ymHsvDZA4m+HjPrc
	t54VyBM0/EQMleB9i9N4gsHAYtoiXNCaTiJrEwxaL6bWruHWhL9t45fDZH9Wm7+mosM90x
	ZOgsmjM+dbEkHvH1u5TKvS1gdcmcv+w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-ypUx_1lrO4WAGEp8aIkAJg-1; Fri,
 20 Dec 2024 06:43:36 -0500
X-MC-Unique: ypUx_1lrO4WAGEp8aIkAJg-1
X-Mimecast-MFC-AGG-ID: ypUx_1lrO4WAGEp8aIkAJg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5CFFD19560B1;
	Fri, 20 Dec 2024 11:43:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2EEE8195608A;
	Fri, 20 Dec 2024 11:43:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: [PATCH v2 4/4] media: ov2740: Add regulator support
Date: Fri, 20 Dec 2024 12:43:17 +0100
Message-ID: <20241220114317.21219-4-hdegoede@redhat.com>
In-Reply-To: <20241220114317.21219-1-hdegoede@redhat.com>
References: <20241220114317.21219-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On some designs the regulators for the AVDD / DOVDD / DVDD power rails
are controlled by Linux.

Add support to the driver for getting regulators for these 3 rails and
for enabling these regulators when necessary.

The datasheet specifies a delay of 0ns between enabling the regulators,
IOW they can all 3 be enabled at the same time. This allows using the bulk
regulator API.

The regulator core will provide dummy regulators for the 3 power-rails
when necessary.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Directly use ARRAY_SIZE(ov2740_supply_name), drop OV2740_NUM_SUPPLIES define
- Make i in probe() unsigned
---
 drivers/media/i2c/ov2740.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 0ee83e2680eb..80d151e8ae29 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -11,6 +11,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/nvmem-provider.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -76,6 +77,12 @@
 /* OTP registers from sensor */
 #define OV2740_REG_OTP_CUSTOMER		0x7010
 
+static const char * const ov2740_supply_name[] = {
+	"AVDD",
+	"DOVDD",
+	"DVDD",
+};
+
 struct nvm_data {
 	struct nvmem_device *nvmem;
 	struct regmap *regmap;
@@ -523,10 +530,11 @@ struct ov2740 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 
-	/* GPIOs, clocks */
+	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *powerdown_gpio;
 	struct clk *clk;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov2740_supply_name)];
 
 	/* Current mode */
 	const struct ov2740_mode *cur_mode;
@@ -1311,6 +1319,8 @@ static int ov2740_suspend(struct device *dev)
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
 	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
 	clk_disable_unprepare(ov2740->clk);
+	regulator_bulk_disable(ARRAY_SIZE(ov2740_supply_name),
+			       ov2740->supplies);
 	return 0;
 }
 
@@ -1320,10 +1330,18 @@ static int ov2740_resume(struct device *dev)
 	struct ov2740 *ov2740 = to_ov2740(sd);
 	int ret;
 
-	ret = clk_prepare_enable(ov2740->clk);
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov2740_supply_name),
+				    ov2740->supplies);
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(ov2740->clk);
+	if (ret) {
+		regulator_bulk_disable(ARRAY_SIZE(ov2740_supply_name),
+				       ov2740->supplies);
+		return ret;
+	}
+
 	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 0);
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
 	msleep(20);
@@ -1336,6 +1354,7 @@ static int ov2740_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ov2740 *ov2740;
 	bool full_power;
+	unsigned int i;
 	int ret;
 
 	ov2740 = devm_kzalloc(&client->dev, sizeof(*ov2740), GFP_KERNEL);
@@ -1374,6 +1393,14 @@ static int ov2740_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov2740->clk),
 				     "failed to get clock\n");
 
+	for (i = 0; i < ARRAY_SIZE(ov2740_supply_name); i++)
+		ov2740->supplies[i].supply = ov2740_supply_name[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov2740_supply_name),
+				      ov2740->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		/* ACPI does not always clear the reset GPIO / enable the clock */
-- 
2.47.1


