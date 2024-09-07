Return-Path: <linux-media+bounces-17849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ACD96FF96
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 05:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 801761C22437
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 03:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB383BBE3;
	Sat,  7 Sep 2024 03:10:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5C738F83;
	Sat,  7 Sep 2024 03:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678642; cv=none; b=Jbs9KMQ6FkiD2Meqm22xRJO3nlzRYyzmgiSoRE85TlFU0yx5jqFbWEzFZD4bvHNLdQjXE4YW4j1tRKo+vB4rMhcmVWFyd+O2YY9p1QU97UC/GFHUyxDRAkNEth2dcHbzpPyImt8KQX/ZvY74hcEJPSdk5w6i9nTAmqAAni2DNvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678642; c=relaxed/simple;
	bh=rtbaTRX0bb9wsX/8CJDV0DlVPBZLSH3Yn4d9LBq7zHQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qlOttMY1ZPUW4It8kmGXjYdiGX0EJCzmag7q04zOPDxeRVZ1R4jpKRy2Ow7UFCfrvo1+jiuhTM6UK3C6WSQlVqBcIv6n88F/YCiGlLDfLYEvUwCBfdSXQeHH0dneM3r/3AmOvPiUVoTXI36BQ2vDKQgfLRnnqYiPYdKrkfSTsUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X0ydt3hkwz20nY9;
	Sat,  7 Sep 2024 11:05:38 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 8298B1400CF;
	Sat,  7 Sep 2024 11:10:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:10:37 +0800
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
Subject: [PATCH net-next v2 01/10] net: dsa: bcm_sf2: Convert using devm_clk_get_optional_enabled() in bcm_sf2_sw_probe()
Date: Sat, 7 Sep 2024 11:19:17 +0800
Message-ID: <20240907031926.3591353-2-lizetao1@huawei.com>
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

Use devm_clk_get_optional_enabled() instead of devm_clk_get_optional() +
clk_prepare_enable(), which can make the clk consistent with the device
life cycle and reduce the risk of unreleased clk resources. Since the
device framework has automatically released the clk resource, there is
no need to execute clk_disable_unprepare(clk) on the error path, drop
the out_clk_mdiv and out_clk labels, and the original error process can
be returned directly.

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/dsa/bcm_sf2.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 0e663ec0c12a..96c0fdb56601 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1453,28 +1453,18 @@ static int bcm_sf2_sw_probe(struct platform_device *pdev)
 		base++;
 	}
 
-	priv->clk = devm_clk_get_optional(&pdev->dev, "sw_switch");
+	priv->clk = devm_clk_get_optional_enabled(&pdev->dev, "sw_switch");
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
-		return ret;
-
-	priv->clk_mdiv = devm_clk_get_optional(&pdev->dev, "sw_switch_mdiv");
-	if (IS_ERR(priv->clk_mdiv)) {
-		ret = PTR_ERR(priv->clk_mdiv);
-		goto out_clk;
-	}
-
-	ret = clk_prepare_enable(priv->clk_mdiv);
-	if (ret)
-		goto out_clk;
+	priv->clk_mdiv = devm_clk_get_optional_enabled(&pdev->dev, "sw_switch_mdiv");
+	if (IS_ERR(priv->clk_mdiv))
+		return PTR_ERR(priv->clk_mdiv);
 
 	ret = bcm_sf2_sw_rst(priv);
 	if (ret) {
 		pr_err("unable to software reset switch: %d\n", ret);
-		goto out_clk_mdiv;
+		return ret;
 	}
 
 	bcm_sf2_crossbar_setup(priv);
@@ -1484,7 +1474,7 @@ static int bcm_sf2_sw_probe(struct platform_device *pdev)
 	ret = bcm_sf2_mdio_register(ds);
 	if (ret) {
 		pr_err("failed to register MDIO bus\n");
-		goto out_clk_mdiv;
+		return ret;
 	}
 
 	bcm_sf2_gphy_enable_set(priv->dev->ds, false);
@@ -1551,10 +1541,6 @@ static int bcm_sf2_sw_probe(struct platform_device *pdev)
 
 out_mdio:
 	bcm_sf2_mdio_unregister(priv);
-out_clk_mdiv:
-	clk_disable_unprepare(priv->clk_mdiv);
-out_clk:
-	clk_disable_unprepare(priv->clk);
 	return ret;
 }
 
@@ -1571,8 +1557,6 @@ static void bcm_sf2_sw_remove(struct platform_device *pdev)
 	dsa_unregister_switch(priv->dev->ds);
 	bcm_sf2_cfp_exit(priv->dev->ds);
 	bcm_sf2_mdio_unregister(priv);
-	clk_disable_unprepare(priv->clk_mdiv);
-	clk_disable_unprepare(priv->clk);
 	if (priv->type == BCM7278_DEVICE_ID)
 		reset_control_assert(priv->rcdev);
 }
-- 
2.34.1


