Return-Path: <linux-media+bounces-17844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 441D996FF76
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 05:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00F43285E92
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 03:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A43214375D;
	Sat,  7 Sep 2024 03:01:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73023D97F;
	Sat,  7 Sep 2024 03:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678093; cv=none; b=q9V3RX270xcvRSyOwZ1F0ok6kMrG0SNOtDZDBZG+HA8ddBHCPG4Z5194deLj1Ft2kkmP8fC5n2OJFRFvgXKiy4QcpVhOJzkFmgkjKpMH+Yd6cPAgwj1b08n0RfS4mfNGgCs3U4iDN8wLGLk5HIXGBIjkWlj/solYg0c0lexKh1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678093; c=relaxed/simple;
	bh=uuPsbGSC03RIrdjCtzWhXiL4H5CVg5+9qxkQe4VXg8M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iuha5nrnZubehj5OFy3omFyYfwOTFYri9e84LF3uyDpXpkZASg1OBDcVTcy4iphCyFlOQ9DhesOKlVWs8vrI9hGBf1AajihVUbvzFB810mth41BXc/Uumf5bdo9UEmhCsqes0pDqltmun1pTHRiAJZcSspScosu/uydUjojHAX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4X0yXV32zwz1S9mZ;
	Sat,  7 Sep 2024 11:00:58 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id C24471A016C;
	Sat,  7 Sep 2024 11:01:22 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:01:21 +0800
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
Subject: [PATCH net-next v2 02/10] net: ethernet: Convert using devm_clk_get_enabled() in emac_probe()
Date: Sat, 7 Sep 2024 11:10:01 +0800
Message-ID: <20240907031009.3591057-4-lizetao1@huawei.com>
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
the out_clk_disable_unprepare label, and the original error process can
changed to the out_dispose_mapping error path.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/ethernet/allwinner/sun4i-emac.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index d761c08fe5c1..8f42501729b7 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -1005,22 +1005,16 @@ static int emac_probe(struct platform_device *pdev)
 	if (emac_configure_dma(db))
 		netdev_info(ndev, "configure dma failed. disable dma.\n");
 
-	db->clk = devm_clk_get(&pdev->dev, NULL);
+	db->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(db->clk)) {
 		ret = PTR_ERR(db->clk);
 		goto out_dispose_mapping;
 	}
 
-	ret = clk_prepare_enable(db->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Error couldn't enable clock (%d)\n", ret);
-		goto out_dispose_mapping;
-	}
-
 	ret = sunxi_sram_claim(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Error couldn't map SRAM to device\n");
-		goto out_clk_disable_unprepare;
+		goto out_dispose_mapping;
 	}
 
 	db->phy_node = of_parse_phandle(np, "phy-handle", 0);
@@ -1068,8 +1062,6 @@ static int emac_probe(struct platform_device *pdev)
 
 out_release_sram:
 	sunxi_sram_release(&pdev->dev);
-out_clk_disable_unprepare:
-	clk_disable_unprepare(db->clk);
 out_dispose_mapping:
 	irq_dispose_mapping(ndev->irq);
 	dma_release_channel(db->rx_chan);
@@ -1095,7 +1087,6 @@ static void emac_remove(struct platform_device *pdev)
 
 	unregister_netdev(ndev);
 	sunxi_sram_release(&pdev->dev);
-	clk_disable_unprepare(db->clk);
 	irq_dispose_mapping(ndev->irq);
 	iounmap(db->membase);
 	free_netdev(ndev);
-- 
2.34.1


