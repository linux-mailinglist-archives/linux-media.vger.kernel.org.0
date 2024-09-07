Return-Path: <linux-media+bounces-17842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3070496FF6B
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 05:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC5C1287558
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 03:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC0E54652;
	Sat,  7 Sep 2024 03:01:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC364084E;
	Sat,  7 Sep 2024 03:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678092; cv=none; b=haRz9bU8Vg3lP9WOJ9S22k8smPtrpf6hAZ4Fd/1wX2QA1q3OZnNkCa6YblfGGfDKgZgiB0pwggWN/QJ/yMPNXMx6hYUELNw+pBvEfvOcfm6bLG3xUFdfTnMdAnEH9VvpuABbDEZ/8/ZKyOqp1/xbN5TVIeHMCEB/s8Ql3NH8KNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678092; c=relaxed/simple;
	bh=7W1tcdm2zh5G5w60OHuhn10sbehAYbPyEfodQj/6jmU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TEYbstMJJ0gdn2xuon8HaaeAMMG7hpvYvoRoim7gLk7xqlDMpicHEvxuI7ZK/dNz9Y5KUJUValCJ+tRFnE6Y8u5pO05KgckSgMH/N1BACHTryoB/CRmTttc3lx5FcmroYW/16sh3925bn9YkY7V/JAN3iI/ziTbBgf1tNmhpVV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X0yT20Tvrz1HJL8;
	Sat,  7 Sep 2024 10:57:58 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 75D881400D3;
	Sat,  7 Sep 2024 11:01:28 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:01:27 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <mchehab@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <heiko@sntech.de>,
	<yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>, <hauke@hauke-m.de>,
	<alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
	<mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
	<radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <lizetao1@huawei.com>,
	<ruanjinjie@huawei.com>, <hverkuil-cisco@xs4all.nl>,
	<u.kleine-koenig@pengutronix.de>, <jacky_chou@aspeedtech.com>,
	<jacob.e.keller@intel.com>
CC: <linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH net-next v2 08/10] net: stmmac: dwmac-dwc-qos-eth: Convert using devm_clk_get_enabled() in dwc_qos_probe()
Date: Sat, 7 Sep 2024 11:10:07 +0800
Message-ID: <20240907031009.3591057-10-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240907031009.3591057-1-lizetao1@huawei.com>
References: <20240907031009.3591057-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Use devm_clk_get_enabled() instead of devm_clk_get() +
clk_prepare_enable(), which can make the clk consistent with the device
life cycle and reduce the risk of unreleased clk resources. Since the
device framework has automatically released the clk resource, there is
no need to execute clk_disable_unprepare(clk) on the error path, drop
the disable label, and the original error process can return directly.

The tegra_eqos_probe() also has similar modifications.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 98 ++++---------------
 1 file changed, 17 insertions(+), 81 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index ec924c6c76c6..d6e9a93771f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -123,49 +123,24 @@ static int dwc_qos_probe(struct platform_device *pdev,
 			 struct plat_stmmacenet_data *plat_dat,
 			 struct stmmac_resources *stmmac_res)
 {
-	int err;
-
-	plat_dat->stmmac_clk = devm_clk_get(&pdev->dev, "apb_pclk");
+	plat_dat->stmmac_clk = devm_clk_get_enabled(&pdev->dev, "apb_pclk");
 	if (IS_ERR(plat_dat->stmmac_clk)) {
 		dev_err(&pdev->dev, "apb_pclk clock not found.\n");
 		return PTR_ERR(plat_dat->stmmac_clk);
 	}
 
-	err = clk_prepare_enable(plat_dat->stmmac_clk);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable apb_pclk clock: %d\n",
-			err);
-		return err;
-	}
-
-	plat_dat->pclk = devm_clk_get(&pdev->dev, "phy_ref_clk");
+	plat_dat->pclk = devm_clk_get_enabled(&pdev->dev, "phy_ref_clk");
 	if (IS_ERR(plat_dat->pclk)) {
 		dev_err(&pdev->dev, "phy_ref_clk clock not found.\n");
-		err = PTR_ERR(plat_dat->pclk);
-		goto disable;
-	}
-
-	err = clk_prepare_enable(plat_dat->pclk);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable phy_ref clock: %d\n",
-			err);
-		goto disable;
+		return PTR_ERR(plat_dat->pclk);
 	}
 
 	return 0;
-
-disable:
-	clk_disable_unprepare(plat_dat->stmmac_clk);
-	return err;
 }
 
 static void dwc_qos_remove(struct platform_device *pdev)
 {
-	struct net_device *ndev = platform_get_drvdata(pdev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
 
-	clk_disable_unprepare(priv->plat->pclk);
-	clk_disable_unprepare(priv->plat->stmmac_clk);
 }
 
 #define SDMEMCOMPPADCTRL 0x8800
@@ -283,53 +258,27 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
 
-	eqos->clk_master = devm_clk_get(&pdev->dev, "master_bus");
-	if (IS_ERR(eqos->clk_master)) {
-		err = PTR_ERR(eqos->clk_master);
-		goto error;
-	}
+	eqos->clk_master = devm_clk_get_enabled(&pdev->dev, "master_bus");
+	if (IS_ERR(eqos->clk_master))
+		return PTR_ERR(eqos->clk_master);
 
-	err = clk_prepare_enable(eqos->clk_master);
-	if (err < 0)
-		goto error;
-
-	eqos->clk_slave = devm_clk_get(&pdev->dev, "slave_bus");
-	if (IS_ERR(eqos->clk_slave)) {
-		err = PTR_ERR(eqos->clk_slave);
-		goto disable_master;
-	}
+	eqos->clk_slave = devm_clk_get_enabled(&pdev->dev, "slave_bus");
+	if (IS_ERR(eqos->clk_slave))
+		return PTR_ERR(eqos->clk_slave);
 
 	data->stmmac_clk = eqos->clk_slave;
 
-	err = clk_prepare_enable(eqos->clk_slave);
-	if (err < 0)
-		goto disable_master;
-
-	eqos->clk_rx = devm_clk_get(&pdev->dev, "rx");
-	if (IS_ERR(eqos->clk_rx)) {
-		err = PTR_ERR(eqos->clk_rx);
-		goto disable_slave;
-	}
-
-	err = clk_prepare_enable(eqos->clk_rx);
-	if (err < 0)
-		goto disable_slave;
+	eqos->clk_rx = devm_clk_get_enabled(&pdev->dev, "rx");
+	if (IS_ERR(eqos->clk_rx))
+		return PTR_ERR(eqos->clk_rx);
 
-	eqos->clk_tx = devm_clk_get(&pdev->dev, "tx");
-	if (IS_ERR(eqos->clk_tx)) {
-		err = PTR_ERR(eqos->clk_tx);
-		goto disable_rx;
-	}
-
-	err = clk_prepare_enable(eqos->clk_tx);
-	if (err < 0)
-		goto disable_rx;
+	eqos->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(eqos->clk_tx))
+		return PTR_ERR(eqos->clk_tx);
 
 	eqos->reset = devm_gpiod_get(&pdev->dev, "phy-reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(eqos->reset)) {
-		err = PTR_ERR(eqos->reset);
-		goto disable_tx;
-	}
+	if (IS_ERR(eqos->reset))
+		return PTR_ERR(eqos->reset);
 
 	usleep_range(2000, 4000);
 	gpiod_set_value(eqos->reset, 0);
@@ -370,15 +319,6 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	reset_control_assert(eqos->rst);
 reset_phy:
 	gpiod_set_value(eqos->reset, 1);
-disable_tx:
-	clk_disable_unprepare(eqos->clk_tx);
-disable_rx:
-	clk_disable_unprepare(eqos->clk_rx);
-disable_slave:
-	clk_disable_unprepare(eqos->clk_slave);
-disable_master:
-	clk_disable_unprepare(eqos->clk_master);
-error:
 	return err;
 }
 
@@ -388,10 +328,6 @@ static void tegra_eqos_remove(struct platform_device *pdev)
 
 	reset_control_assert(eqos->rst);
 	gpiod_set_value(eqos->reset, 1);
-	clk_disable_unprepare(eqos->clk_tx);
-	clk_disable_unprepare(eqos->clk_rx);
-	clk_disable_unprepare(eqos->clk_slave);
-	clk_disable_unprepare(eqos->clk_master);
 }
 
 struct dwc_eth_dwmac_data {
-- 
2.34.1


