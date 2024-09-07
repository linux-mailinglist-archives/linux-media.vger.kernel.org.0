Return-Path: <linux-media+bounces-17856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA3F96FFB0
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 05:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EB9A1F25663
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 03:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46B2158525;
	Sat,  7 Sep 2024 03:10:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E43314B94B;
	Sat,  7 Sep 2024 03:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678649; cv=none; b=LlYDr0zQYGqQ6diaXXuzEXmjEpoT8Z5IntKVC37tix/mrdyu1FSFaJ78nq/rx7NRHNqHFrbUXFnu2jOnTSqWeCJBngJkeUKWJ+CNelk/3T/RI/xCe29Ml/k9WCBO5pXUuvzYDL4w0wLqA7txxA5o7s6z3ECgsIB+1Ct5RLYOWvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678649; c=relaxed/simple;
	bh=NTT6omI+1h722IadGdfo3Cu5+r9CNZ+yAF34IF8fqzU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dqeCpKlSn1UkwOpdi3c91RC8i6zLszovHmEcpr6LWG8FayiYVCzkB1j2OeZ4PAtlQ15KjUC+GJnM6pOBfe6GV+raxTwd8FdweeHZ0gJJLFckgIiKsUoDbQ9mNKkv+hE0K7XjAlDSxx01vzgUi4vchw48n3HriGkV8Gpr7z/i2kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X0ylK04f0z1j80G;
	Sat,  7 Sep 2024 11:10:21 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 96AEE14011F;
	Sat,  7 Sep 2024 11:10:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:10:43 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <mchehab@kernel.org>, <florian.fainelli@broadcom.com>, <andrew@lunn.ch>,
	<olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <heiko@sntech.de>,
	<yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>, <hauke@hauke-m.de>,
	<alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
	<mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
	<radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <ruanjinjie@huawei.com>,
	<lizetao1@huawei.com>, <hverkuil-cisco@xs4all.nl>,
	<u.kleine-koenig@pengutronix.de>, <jacky_chou@aspeedtech.com>,
	<jacob.e.keller@intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH net-next v2 07/10] net: lantiq_xrx200: Convert using devm_clk_get_enabled() in xrx200_probe()
Date: Sat, 7 Sep 2024 11:19:23 +0800
Message-ID: <20240907031926.3591353-8-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240907031926.3591353-1-lizetao1@huawei.com>
References: <20240907031926.3591353-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Use devm_clk_get_enabled() instead of devm_clk_get() +
clk_prepare_enable(), which can make the clk consistent with the device
life cycle and reduce the risk of unreleased clk resources. Since the
device framework has automatically released the clk resource, there is
no need to execute clk_disable_unprepare(clk) on the error path, drop
the err_unprepare_clk label, and the original error process can change to
the err_uninit_dma error path. Some comments have also been adjusted.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/ethernet/lantiq_xrx200.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/lantiq_xrx200.c b/drivers/net/ethernet/lantiq_xrx200.c
index 07904a528f21..976748551643 100644
--- a/drivers/net/ethernet/lantiq_xrx200.c
+++ b/drivers/net/ethernet/lantiq_xrx200.c
@@ -589,8 +589,8 @@ static int xrx200_probe(struct platform_device *pdev)
 	if (priv->chan_tx.dma.irq < 0)
 		return -ENOENT;
 
-	/* get the clock */
-	priv->clk = devm_clk_get(dev, NULL);
+	/* get the clock and enable clock gate */
+	priv->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "failed to get clock\n");
 		return PTR_ERR(priv->clk);
@@ -605,11 +605,6 @@ static int xrx200_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	/* enable clock gate */
-	err = clk_prepare_enable(priv->clk);
-	if (err)
-		goto err_uninit_dma;
-
 	/* set IPG to 12 */
 	xrx200_pmac_mask(priv, PMAC_RX_IPG_MASK, 0xb, PMAC_RX_IPG);
 
@@ -628,13 +623,10 @@ static int xrx200_probe(struct platform_device *pdev)
 
 	err = register_netdev(net_dev);
 	if (err)
-		goto err_unprepare_clk;
+		goto err_uninit_dma;
 
 	return 0;
 
-err_unprepare_clk:
-	clk_disable_unprepare(priv->clk);
-
 err_uninit_dma:
 	xrx200_hw_cleanup(priv);
 
@@ -654,9 +646,6 @@ static void xrx200_remove(struct platform_device *pdev)
 	/* remove the actual device */
 	unregister_netdev(net_dev);
 
-	/* release the clock */
-	clk_disable_unprepare(priv->clk);
-
 	/* shut down hardware */
 	xrx200_hw_cleanup(priv);
 }
-- 
2.34.1


