Return-Path: <linux-media+bounces-23791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D081A9F7CAD
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 14:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D86F9189288A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A622253FC;
	Thu, 19 Dec 2024 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CF8pS286"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01031F8682
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616197; cv=none; b=eIh7w7Qah0j9aVgf4rlm8j9iDmFLDow5nWpNLLRyBmcF9VYGcXDUqDIbHEeMu8KYkFvwvWLvMcyYzZ3FMQ0T/GnhPZYLLxbHN2GxG4dGHSOkKIgkabpU8PazUSicJ4tCBY15EjJJs+DW3WY9nBnwl8cEoZtz041T7SaAHeKveMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616197; c=relaxed/simple;
	bh=YW+eGRpnQ47Ek+2Gagg8zqTYJT2S93HObo3hyoiSCJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IWE/um9x6mq9OhiR7ZgaLjeVywHhnjqgbYm2ghb2Q+R+2grZ54pCAPdGOu1yqOPwloAptG3/SEIl9qQGOMi+6p+/2y1d5YqbtDpHAt41SYXgKdqEtjWl78p47dQ9xDbB9MekGDbBDePvXmJrJD4yi1kyLifOgfD2Gw32ZInKex0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CF8pS286; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734616194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4B1ntKcwAXxvtIhEAEuErzDpXJ6V+fFs7P8G0AvEbe0=;
	b=CF8pS286AV3/BFcVxdqqk87FSRe2FN7OXzj0pl55uIXPEFvDNiZ4c+8/YXer0v18XN8eKh
	dPOgqetYLlnQha8JiIOLi3HKr8RlHeJjzZEFqG3ssFA8/wd4BflcAeSffIcCRdb/M03gjD
	G7KkmmwlHAIGlW8gYjREArHbsS85nZY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-171-MjmjRPPjMUGEvW3vyAzX5w-1; Thu,
 19 Dec 2024 08:49:51 -0500
X-MC-Unique: MjmjRPPjMUGEvW3vyAzX5w-1
X-Mimecast-MFC-AGG-ID: MjmjRPPjMUGEvW3vyAzX5w
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57B571955E70;
	Thu, 19 Dec 2024 13:49:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9184D1955F54;
	Thu, 19 Dec 2024 13:49:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 3/8] media: ov08x40: Get reset GPIO and regulators on ACPI platforms too
Date: Thu, 19 Dec 2024 14:49:35 +0100
Message-ID: <20241219134940.15472-4-hdegoede@redhat.com>
In-Reply-To: <20241219134940.15472-1-hdegoede@redhat.com>
References: <20241219134940.15472-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

ACPI platforms might also have a reset GPIO and regulators, move the code
to get these outside of the if (!is_acpi_node(fwnode)) check.

This also removes the is_acpi_node(fwnode) checks from ov08x40_power_on() /
ov08x40_power_off() both the GPIO hand the clk frameworks functions used
there will happily accept the NULL pointer returned from the optional get()
functions when there is no reset GPIO / no clk.

While moving the code around also at error logging to the error exit
path for getting the reset GPIO.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 38 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index e4046d4705c3..8b1380506778 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1322,9 +1322,6 @@ static int ov08x40_power_on(struct device *dev)
 	struct ov08x40 *ov08x = to_ov08x40(sd);
 	int ret;
 
-	if (is_acpi_node(dev_fwnode(dev)))
-		return 0;
-
 	ret = clk_prepare_enable(ov08x->xvclk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable xvclk\n");
@@ -1360,9 +1357,6 @@ static int ov08x40_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov08x40 *ov08x = to_ov08x40(sd);
 
-	if (is_acpi_node(dev_fwnode(dev)))
-		return 0;
-
 	gpiod_set_value_cansleep(ov08x->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(ov08x40_supply_names),
 			       ov08x->supplies);
@@ -2165,6 +2159,22 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 	if (ret)
 		return ret;
 
+	ov08x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(ov08x->reset_gpio)) {
+		ret = dev_err_probe(dev, PTR_ERR(ov08x->reset_gpio),
+				    "getting reset GPIO\n");
+		goto out_err;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ov08x40_supply_names); i++)
+		ov08x->supplies[i].supply = ov08x40_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov08x40_supply_names),
+				      ov08x->supplies);
+	if (ret)
+		goto out_err;
+
 	if (!is_acpi_node(fwnode)) {
 		ov08x->xvclk = devm_clk_get(dev, NULL);
 		if (IS_ERR(ov08x->xvclk)) {
@@ -2175,22 +2185,6 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 		}
 
 		xvclk_rate = clk_get_rate(ov08x->xvclk);
-
-		ov08x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-							    GPIOD_OUT_LOW);
-		if (IS_ERR(ov08x->reset_gpio)) {
-			ret = PTR_ERR(ov08x->reset_gpio);
-			goto out_err;
-		}
-
-		for (i = 0; i < ARRAY_SIZE(ov08x40_supply_names); i++)
-			ov08x->supplies[i].supply = ov08x40_supply_names[i];
-
-		ret = devm_regulator_bulk_get(dev,
-					      ARRAY_SIZE(ov08x40_supply_names),
-					      ov08x->supplies);
-		if (ret)
-			goto out_err;
 	} else {
 		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
 					       &xvclk_rate);
-- 
2.47.1


