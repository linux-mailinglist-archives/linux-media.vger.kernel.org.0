Return-Path: <linux-media+bounces-16637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0753C95C87D
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0F5CB26B34
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 08:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E2414D718;
	Fri, 23 Aug 2024 08:54:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D044C149007;
	Fri, 23 Aug 2024 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403286; cv=none; b=UxdMPVayfssERDivJXsvr8IU+fqrOPlQolmxsUitf8LOdua6ZXHJxuF/cZSk09ApSaYTIMvgSthVQZSv9m5aUpL9B7Ej1cOHadrVvyVfH85c69K4oQKrM3u5WWUNC9AnwG9gulEq6IZy2RhVRXiG1AUOpHOplwwnFbiCDY5Rk3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403286; c=relaxed/simple;
	bh=Bog3becMgtB1hmj5Xx9F7tbvSQGy7CZRFjxhZt6ljtE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f0WjJ3JxMqddqmUt5UzjMqbfs2PMGHw9qZwvfitA3QoajfRFiEeMWz64ZZKg8tmT2czHuIlOgBvxos3OHRnTXpDiqd4VwUILnBTMIDHoTx9bKgAhLmjX56RSFpW+bDeggpRTrWlQp6CsEIKgwPU2PCKZZDQsckphw11vx94a7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wqv3C48nNzhY9j;
	Fri, 23 Aug 2024 16:52:39 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F3C91800D2;
	Fri, 23 Aug 2024 16:54:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Aug
 2024 16:54:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <s.nawrocki@samsung.com>, <mchehab@kernel.org>, <krzk@kernel.org>,
	<alim.akhtar@samsung.com>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 2/3] media: c8sectpfe: Use for_each_child_of_node_scoped()
Date: Fri, 23 Aug 2024 17:02:16 +0800
Message-ID: <20240823090217.436622-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823090217.436622-1-ruanjinjie@huawei.com>
References: <20240823090217.436622-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Avoids the need for manual cleanup of_node_put() in early exits
from the loop.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 .../st/sti/c8sectpfe/c8sectpfe-core.c         | 34 +++++++------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index 67d3d6e50d2e..40ae91f65848 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -658,7 +658,7 @@ static irqreturn_t c8sectpfe_error_irq_handler(int irq, void *priv)
 static int c8sectpfe_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *child, *np = dev->of_node;
+	struct device_node *np = dev->of_node;
 	struct c8sectpfei *fei;
 	struct resource *res;
 	int ret, index = 0;
@@ -742,17 +742,15 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		return PTR_ERR(fei->pinctrl);
 	}
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		struct device_node *i2c_bus;
 
 		fei->channel_data[index] = devm_kzalloc(dev,
 						sizeof(struct channel_info),
 						GFP_KERNEL);
 
-		if (!fei->channel_data[index]) {
-			ret = -ENOMEM;
-			goto err_node_put;
-		}
+		if (!fei->channel_data[index])
+			return -ENOMEM;
 
 		tsin = fei->channel_data[index];
 
@@ -761,7 +759,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		ret = of_property_read_u32(child, "tsin-num", &tsin->tsin_id);
 		if (ret) {
 			dev_err(&pdev->dev, "No tsin_num found\n");
-			goto err_node_put;
+			return ret;
 		}
 
 		/* sanity check value */
@@ -769,8 +767,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"tsin-num %d specified greater than number\n\tof input block hw in SoC! (%d)",
 				tsin->tsin_id, fei->hw_stats.num_ib);
-			ret = -EINVAL;
-			goto err_node_put;
+			return -EINVAL;
 		}
 
 		tsin->invert_ts_clk = of_property_read_bool(child,
@@ -786,22 +783,20 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 					&tsin->dvb_card);
 		if (ret) {
 			dev_err(&pdev->dev, "No dvb-card found\n");
-			goto err_node_put;
+			return ret;
 		}
 
 		i2c_bus = of_parse_phandle(child, "i2c-bus", 0);
 		if (!i2c_bus) {
 			dev_err(&pdev->dev, "No i2c-bus found\n");
-			ret = -ENODEV;
-			goto err_node_put;
+			return -ENODEV;
 		}
 		tsin->i2c_adapter =
 			of_find_i2c_adapter_by_node(i2c_bus);
 		if (!tsin->i2c_adapter) {
 			dev_err(&pdev->dev, "No i2c adapter found\n");
 			of_node_put(i2c_bus);
-			ret = -ENODEV;
-			goto err_node_put;
+			return -ENODEV;
 		}
 		of_node_put(i2c_bus);
 
@@ -814,7 +809,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		if (ret && ret != -EBUSY) {
 			dev_err(dev, "Can't request tsin%d reset gpio\n",
 				fei->channel_data[index]->tsin_id);
-			goto err_node_put;
+			return ret;
 		}
 
 		if (!ret) {
@@ -856,10 +851,6 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 	c8sectpfe_debugfs_init(fei);
 
 	return 0;
-
-err_node_put:
-	of_node_put(child);
-	return ret;
 }
 
 static void c8sectpfe_remove(struct platform_device *pdev)
@@ -898,16 +889,15 @@ static void c8sectpfe_remove(struct platform_device *pdev)
 static int configure_channels(struct c8sectpfei *fei)
 {
 	int index = 0, ret;
-	struct device_node *child, *np = fei->dev->of_node;
+	struct device_node *np = fei->dev->of_node;
 
 	/* iterate round each tsin and configure memdma descriptor and IB hw */
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = configure_memdma_and_inputblock(fei,
 						fei->channel_data[index]);
 		if (ret) {
 			dev_err(fei->dev,
 				"configure_memdma_and_inputblock failed\n");
-			of_node_put(child);
 			goto err_unmap;
 		}
 		index++;
-- 
2.34.1


