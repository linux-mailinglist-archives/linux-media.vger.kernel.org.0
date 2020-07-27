Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E397A22FA68
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 22:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgG0Uvy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 16:51:54 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9051 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgG0Uvw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 16:51:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1f3e5a0000>; Mon, 27 Jul 2020 13:51:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 27 Jul 2020 13:51:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 13:51:51 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:51:51 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 27 Jul 2020 20:51:51 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.236]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1f3e660004>; Mon, 27 Jul 2020 13:51:51 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v5 02/14] i2c: tegra: Remove NULL pointer check before clk_enable/disable/prepare/unprepare
Date:   Mon, 27 Jul 2020 13:57:20 -0700
Message-ID: <1595883452-17343-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595883098; bh=jD0igf8U1bTJzOqQcNuwvqEC25xsAMW3RMlh+sdfw58=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=cxy90JDMzfwqNZeqwmmIPrlt5oxjkV0qpeGd4v8E+F8v+x+kaOf0DYFjiRoeOMYZI
         mcx4YmylJzMSqMX2L/5Nmk9QOrqsByq/OzPbLF+dV2rAEg/AN1IaXwFBrTYQL1ogqk
         qNmrOlK6/juirbEznj7sFMXuzvYs3a49EWuN0eXgPKdsvjeAwo4no4b1aytdH5qu9/
         HdnQ1hnDCWRe1BTlbbE4nXhslJYguMSS44JEzmjv6sMVRf9btC6Fm1QaNRzMIpRqHj
         g5tk/I97ZjZqf9L4HfL8yrHQm1RrbBXebY1a+m4iTkshodKiqDj8yiiGx41cR1xl27
         Pq6dBqDfSajAw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

clk_enable, clk_disable, clk_prepare, and clk_unprepare APIs have
implementation for checking clk pointer not NULL and clock consumers
can safely call these APIs without NULL pointer check.

So, this patch cleans up Tegra i2c driver to remove explicit checks
before these APIs.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 64 +++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 41 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3be1018..c91307b9 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -655,21 +655,17 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (!i2c_dev->hw->has_single_clk_source) {
-		ret = clk_enable(i2c_dev->fast_clk);
-		if (ret < 0) {
-			dev_err(i2c_dev->dev,
-				"Enabling fast clk failed, err %d\n", ret);
-			return ret;
-		}
+	ret = clk_enable(i2c_dev->fast_clk);
+	if (ret < 0) {
+		dev_err(i2c_dev->dev,
+			"Enabling fast clk failed, err %d\n", ret);
+		return ret;
 	}
 
-	if (i2c_dev->slow_clk) {
-		ret = clk_enable(i2c_dev->slow_clk);
-		if (ret < 0) {
-			dev_err(dev, "failed to enable slow clock: %d\n", ret);
-			return ret;
-		}
+	ret = clk_enable(i2c_dev->slow_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable slow clock: %d\n", ret);
+		return ret;
 	}
 
 	ret = clk_enable(i2c_dev->div_clk);
@@ -688,12 +684,8 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 
 	clk_disable(i2c_dev->div_clk);
-
-	if (i2c_dev->slow_clk)
-		clk_disable(i2c_dev->slow_clk);
-
-	if (!i2c_dev->hw->has_single_clk_source)
-		clk_disable(i2c_dev->fast_clk);
+	clk_disable(i2c_dev->slow_clk);
+	clk_disable(i2c_dev->fast_clk);
 
 	return pinctrl_pm_select_idle_state(i2c_dev->dev);
 }
@@ -1716,20 +1708,16 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c_dev);
 
-	if (!i2c_dev->hw->has_single_clk_source) {
-		ret = clk_prepare(i2c_dev->fast_clk);
-		if (ret < 0) {
-			dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
-			return ret;
-		}
+	ret = clk_prepare(i2c_dev->fast_clk);
+	if (ret < 0) {
+		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
+		return ret;
 	}
 
-	if (i2c_dev->slow_clk) {
-		ret = clk_prepare(i2c_dev->slow_clk);
-		if (ret < 0) {
-			dev_err(dev, "failed to prepare slow clock: %d\n", ret);
-			goto unprepare_fast_clk;
-		}
+	ret = clk_prepare(i2c_dev->slow_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to prepare slow clock: %d\n", ret);
+		goto unprepare_fast_clk;
 	}
 
 	if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ &&
@@ -1843,12 +1831,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	clk_unprepare(i2c_dev->div_clk);
 
 unprepare_slow_clk:
-	if (i2c_dev->is_vi)
-		clk_unprepare(i2c_dev->slow_clk);
+	clk_unprepare(i2c_dev->slow_clk);
 
 unprepare_fast_clk:
-	if (!i2c_dev->hw->has_single_clk_source)
-		clk_unprepare(i2c_dev->fast_clk);
+	clk_unprepare(i2c_dev->fast_clk);
 
 	return ret;
 }
@@ -1867,12 +1853,8 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 		tegra_i2c_runtime_suspend(&pdev->dev);
 
 	clk_unprepare(i2c_dev->div_clk);
-
-	if (i2c_dev->slow_clk)
-		clk_unprepare(i2c_dev->slow_clk);
-
-	if (!i2c_dev->hw->has_single_clk_source)
-		clk_unprepare(i2c_dev->fast_clk);
+	clk_unprepare(i2c_dev->slow_clk);
+	clk_unprepare(i2c_dev->fast_clk);
 
 	tegra_i2c_release_dma(i2c_dev);
 	return 0;
-- 
2.7.4

