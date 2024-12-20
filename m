Return-Path: <linux-media+bounces-23932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD39F94AD
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBA667A440B
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B150E218836;
	Fri, 20 Dec 2024 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a6f8gYbA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFE72185A7
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705716; cv=none; b=E1LYb8vrG3FqiCCn11ONudZkNkOWX9p8FQwrdKrK1tqcg3adKjo8HedfBFN1dAPBqNiUiVphAjMWqRi7gmc6MvqJUhZXiybwAKuZ2R8nu+ge3y/LktwEIqP/i9+kcL2m5O3NKi+wYCBJheY0Bdj6yp43pPiQ+znSLd/msDBWdu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705716; c=relaxed/simple;
	bh=cDeYy42VrI+rHEWzR12frA1lswbIArosPc69mRv8mPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6BVsGKZl2YgsmS4VFUpLiuuxTL9CBIaAfz8CDp3L1CcXR8VGd0iB0jIGKDZ+6JaUGv2eDkDgOPw2JBgWhrEqYaIm6satEluROqxui/5fIDlFJateVOG4ZPxcmnWSRyE2dJfSwZvYyA4bTXYVPRzjqwl5JWf2pM6//5cKBso81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a6f8gYbA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734705713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFRkAECr7mR1qjc5X9Wcb8rdkxBaKEscQj6VLXd18go=;
	b=a6f8gYbAwg/Y+dGlNG5HDx/40Zn9BfCH8c719l6+bJy5xOrsyCFgxLxUWsJyK8Y1xixqJl
	ZN6l/R6kxjAFP3Be6Rn33B/9z1Oz2JOHKxW8kHjIC98zhJnj8haeibzHPFARxm5ml47wFq
	PWmG2Gsa+0EAES4uUqI00QI0lk7UP4c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-346-t_VKuZIfNGqRROyo0sDsgw-1; Fri,
 20 Dec 2024 09:41:49 -0500
X-MC-Unique: t_VKuZIfNGqRROyo0sDsgw-1
X-Mimecast-MFC-AGG-ID: t_VKuZIfNGqRROyo0sDsgw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E8E01955F41;
	Fri, 20 Dec 2024 14:41:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 43B1919560AD;
	Fri, 20 Dec 2024 14:41:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 03/10] media: ov08x40: Get reset GPIO and regulators on ACPI platforms too
Date: Fri, 20 Dec 2024 15:41:23 +0100
Message-ID: <20241220144130.66765-4-hdegoede@redhat.com>
In-Reply-To: <20241220144130.66765-1-hdegoede@redhat.com>
References: <20241220144130.66765-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

ACPI platforms might also have a reset GPIO and regulators, move the code
to get these outside of the if (!is_acpi_node(fwnode)) check.

This also removes the is_acpi_node(fwnode) checks from ov08x40_power_on() /
ov08x40_power_off() both the GPIO hand the clk frameworks functions used
there will happily accept the NULL pointer returned from the optional get()
functions when there is no reset GPIO / no clk.

While moving the code around also at error logging to the error exit
path for getting the reset GPIO.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 38 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 908a4752117b..21f36d16ed1e 100644
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


