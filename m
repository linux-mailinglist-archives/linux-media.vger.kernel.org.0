Return-Path: <linux-media+bounces-22230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0C59DBA70
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9EF716447D
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 15:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A9A1BBBC4;
	Thu, 28 Nov 2024 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eAGEDzAv"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E091AA786
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732807440; cv=none; b=Od0tGA+aNuDmYfFF2Zuj6b5TTIoFwJlM+WjlInxAFUtlYO8FNsMsv2u6NZZklrVFmGPpuKYTkxXju6OZAB7+lY3Cg/Fz+sJWZpMJZ2jpUYfCTz0yQmDQpJ0VVBE7Cz+xgxGdeY4aQd/UoluDPWKIcjt7mJ65FqsvJ6oQf7v9wSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732807440; c=relaxed/simple;
	bh=JYgHlUb3YN8+8fn39STft8qQzAmLWRHEtMbF/VNfKOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wl9Z6DNN221pof9EZ7xrqoTrJkJ6AC/L77Y3fO7CRZI9lQCO0V1kRVKQHm4Nc5Q9f/cgRPUqD/FSkIJpp8KfFv2+tviBFl8KkDBZxM7DA0V9B0dg3v6EPn8uBbgnmO2dTGhjtWfmByrqNPJVGgSZZuWnoHHbzhNLwwo1UN1eX3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eAGEDzAv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732807437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BClqDHz1MUSrqKr7/8QlyH7q12CXxzhXJgq0LP5VI/U=;
	b=eAGEDzAvvzFJ5ZFMlzN3BhXOt384zZ3kD0/uk26wptpRIDIuxe18ZnofK6pdnMHiZBvxl6
	GGg9xZ4+3jVYgChb0iKohT0c4QWVc3IjYQmH8S0Y1fewaqInOpuweAXeEfkR/KUEXrDnFb
	TEFqmyCZiN3YJqBTq3cOGeCA1vhRkQU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-moo1d8epP8eF1rTBjjLjXw-1; Thu,
 28 Nov 2024 10:23:56 -0500
X-MC-Unique: moo1d8epP8eF1rTBjjLjXw-1
X-Mimecast-MFC-AGG-ID: moo1d8epP8eF1rTBjjLjXw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0BD7C1955F45;
	Thu, 28 Nov 2024 15:23:55 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.119])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B0C991956095;
	Thu, 28 Nov 2024 15:23:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 4/4] media: ov2740: Add regulator support
Date: Thu, 28 Nov 2024 16:23:38 +0100
Message-ID: <20241128152338.4583-5-hdegoede@redhat.com>
In-Reply-To: <20241128152338.4583-1-hdegoede@redhat.com>
References: <20241128152338.4583-1-hdegoede@redhat.com>
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

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 14d0a0588cc2..c766c1f83e12 100644
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
@@ -76,6 +77,14 @@
 /* OTP registers from sensor */
 #define OV2740_REG_OTP_CUSTOMER		0x7010
 
+static const char * const ov2740_supply_name[] = {
+	"AVDD",
+	"DOVDD",
+	"DVDD",
+};
+
+#define OV2740_NUM_SUPPLIES ARRAY_SIZE(ov2740_supply_name)
+
 struct nvm_data {
 	struct nvmem_device *nvmem;
 	struct regmap *regmap;
@@ -523,10 +532,11 @@ struct ov2740 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 
-	/* GPIOs, clocks */
+	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *powerdown_gpio;
 	struct clk *clk;
+	struct regulator_bulk_data supplies[OV2740_NUM_SUPPLIES];
 
 	/* Current mode */
 	const struct ov2740_mode *cur_mode;
@@ -1309,6 +1319,7 @@ static int ov2740_suspend(struct device *dev)
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
 	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
 	clk_disable_unprepare(ov2740->clk);
+	regulator_bulk_disable(OV2740_NUM_SUPPLIES, ov2740->supplies);
 	return 0;
 }
 
@@ -1318,10 +1329,16 @@ static int ov2740_resume(struct device *dev)
 	struct ov2740 *ov2740 = to_ov2740(sd);
 	int ret;
 
-	ret = clk_prepare_enable(ov2740->clk);
+	ret = regulator_bulk_enable(OV2740_NUM_SUPPLIES, ov2740->supplies);
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(ov2740->clk);
+	if (ret) {
+		regulator_bulk_disable(OV2740_NUM_SUPPLIES, ov2740->supplies);
+		return ret;
+	}
+
 	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 0);
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
 	msleep(20);
@@ -1334,7 +1351,7 @@ static int ov2740_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ov2740 *ov2740;
 	bool full_power;
-	int ret;
+	int i, ret;
 
 	ov2740 = devm_kzalloc(&client->dev, sizeof(*ov2740), GFP_KERNEL);
 	if (!ov2740)
@@ -1372,6 +1389,13 @@ static int ov2740_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov2740->clk),
 				     "failed to get clock\n");
 
+	for (i = 0; i < OV2740_NUM_SUPPLIES; i++)
+		ov2740->supplies[i].supply = ov2740_supply_name[i];
+
+	ret = devm_regulator_bulk_get(dev, OV2740_NUM_SUPPLIES, ov2740->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		/* ACPI does not always clear the reset GPIO / enable the clock */
-- 
2.47.0


