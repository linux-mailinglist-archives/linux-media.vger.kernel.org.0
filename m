Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AF64080C8
	for <lists+linux-media@lfdr.de>; Sun, 12 Sep 2021 22:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237250AbhILUM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Sep 2021 16:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236582AbhILUMO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Sep 2021 16:12:14 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20AD8C0613EE;
        Sun, 12 Sep 2021 13:10:21 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id i23so11323559wrb.2;
        Sun, 12 Sep 2021 13:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d07O0PTI8yOarAA3b3qtuOC+53W1id0Cs3+xSBQH71U=;
        b=C5P5AY+l/qL0vSUwbgvRQ3MZaH83QA0e4tCXl6ZD+1poqC1+F+AcTEXcXBLDMGtbiz
         siBU2x9tIZ8JuptDaAst6rE0ewmSmVMllRfYliY7IeU20D5eyUQ2eTB2GEKGiI+8xtp+
         LqVhtysafFeQYppe217qoTwu+2DT5h3PrjTAHiVnLYqdNJBsTggIrKOVZ9rO6lLrV+LF
         1dvK4dzvMw2iYeSSRbhRj4VE8LyDo8ehaPTK/5TnSebHqnWp4E5RwbLeM4SPJAlRiwnO
         RQ4fxfN425+E2MMzF70w7ztew1B6yh2Q2PqxhuooIS1slaaA87xamYGgQ8V8o3CZbehb
         hM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d07O0PTI8yOarAA3b3qtuOC+53W1id0Cs3+xSBQH71U=;
        b=0HPdN7Er/xpBsgToeNqtr9RK059oIjzZGnzHgFM70i6bMkInp7ZqQ97S/8MbddShlQ
         Gm/Fc3d7wtfEcwhO2tlXUr9tlTnL4BpBogUoAhchVEp8lsDMS9O1clyQeQPtU+oHiYdZ
         Y5cya53VR5qw9JfjNqpgkARgoWVZRMwj567Nja89kqflooaK2bigsUMe2lEhddBmFs6F
         k5jxiecj03V9eqZPTT6gcMhTcX0gZnJVilyCEVvnWmAoXFYqGRL0IJ57uo6jk8d8TTOn
         UU640KSxFFfukeJTF2k9RBSfEgYrJ5luT5yY9MUD99avvVwbpBwJCBOXj/nTqtAVrc5x
         qmEw==
X-Gm-Message-State: AOAM533XuYGdD+GRvzfX2y3/qcohVkwtLeqB5/9l5IEYk8g76qvup0UC
        g7k/Asbr5eNV++C2tq2NWn4=
X-Google-Smtp-Source: ABdhPJx3VU9fLQ5+P9HT0NrKffU+T0iQrcEhNyxdnVMkw5nmEuJsuZOGrVL0LCvktuvjSrqmGCSR2g==
X-Received: by 2002:adf:9e08:: with SMTP id u8mr8651388wre.383.1631477419709;
        Sun, 12 Sep 2021 13:10:19 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 13:10:19 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v11 19/34] mmc: sdhci-tegra: Add runtime PM and OPP support
Date:   Sun, 12 Sep 2021 23:08:17 +0300
Message-Id: <20210912200832.12312-20-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The SDHCI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now SDHCI must be resumed using
runtime PM API in order to initialize the SDHCI power state. The SDHCI
clock rate must be changed using OPP API that will reconfigure the power
domain performance state in accordance to the rate. Add runtime PM and OPP
support to the SDHCI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mmc/host/sdhci-tegra.c | 82 +++++++++++++++++++++++++++-------
 1 file changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index a5001875876b..6cf3712bf0a6 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -15,6 +15,8 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/mmc/card.h>
@@ -24,6 +26,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/ktime.h>
 
+#include <soc/tegra/common.h>
+
 #include "sdhci-pltfm.h"
 #include "cqhci.h"
 
@@ -760,7 +764,9 @@ static void tegra_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
+	struct device *dev = mmc_dev(host->mmc);
 	unsigned long host_clk;
+	int err;
 
 	if (!clock)
 		return sdhci_set_clock(host, clock);
@@ -778,7 +784,12 @@ static void tegra_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	 * from clk_get_rate() is used.
 	 */
 	host_clk = tegra_host->ddr_signaling ? clock * 2 : clock;
-	clk_set_rate(pltfm_host->clk, host_clk);
+
+	err = dev_pm_opp_set_rate(dev, host_clk);
+	if (err)
+		dev_err(dev, "failed to set clk rate to %luHz: %d\n",
+			host_clk, err);
+
 	tegra_host->curr_clk_rate = host_clk;
 	if (tegra_host->ddr_signaling)
 		host->max_clk = host_clk;
@@ -1705,7 +1716,6 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 				   "failed to get clock\n");
 		goto err_clk_get;
 	}
-	clk_prepare_enable(clk);
 	pltfm_host->clk = clk;
 
 	tegra_host->rst = devm_reset_control_get_exclusive(&pdev->dev,
@@ -1716,15 +1726,25 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 		goto err_rst_get;
 	}
 
+	pm_runtime_enable(&pdev->dev);
+
+	rc = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (rc)
+		goto err_pm_get;
+
+	rc = pm_runtime_resume_and_get(&pdev->dev);
+	if (rc)
+		goto err_pm_get;
+
 	rc = reset_control_assert(tegra_host->rst);
 	if (rc)
-		goto err_rst_get;
+		goto err_rst_assert;
 
 	usleep_range(2000, 4000);
 
 	rc = reset_control_deassert(tegra_host->rst);
 	if (rc)
-		goto err_rst_get;
+		goto err_rst_assert;
 
 	usleep_range(2000, 4000);
 
@@ -1736,8 +1756,11 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 
 err_add_host:
 	reset_control_assert(tegra_host->rst);
+err_rst_assert:
+	pm_runtime_put(&pdev->dev);
+err_pm_get:
+	pm_runtime_disable(&pdev->dev);
 err_rst_get:
-	clk_disable_unprepare(pltfm_host->clk);
 err_clk_get:
 	clk_disable_unprepare(tegra_host->tmclk);
 err_power_req:
@@ -1756,19 +1779,38 @@ static int sdhci_tegra_remove(struct platform_device *pdev)
 
 	reset_control_assert(tegra_host->rst);
 	usleep_range(2000, 4000);
-	clk_disable_unprepare(pltfm_host->clk);
-	clk_disable_unprepare(tegra_host->tmclk);
 
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	clk_disable_unprepare(tegra_host->tmclk);
 	sdhci_pltfm_free(pdev);
 
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
+static int __maybe_unused sdhci_tegra_runtime_suspend(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+
+	clk_disable_unprepare(pltfm_host->clk);
+
+	return 0;
+}
+
+static int __maybe_unused sdhci_tegra_runtime_resume(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+
+	return clk_prepare_enable(pltfm_host->clk);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int sdhci_tegra_suspend(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
 	int ret;
 
 	if (host->mmc->caps2 & MMC_CAP2_CQE) {
@@ -1783,17 +1825,22 @@ static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
 		return ret;
 	}
 
-	clk_disable_unprepare(pltfm_host->clk);
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		sdhci_resume_host(host);
+		cqhci_resume(host->mmc);
+		return ret;
+	}
+
 	return 0;
 }
 
-static int __maybe_unused sdhci_tegra_resume(struct device *dev)
+static int sdhci_tegra_resume(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
-	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	int ret;
 
-	ret = clk_prepare_enable(pltfm_host->clk);
+	ret = pm_runtime_force_resume(dev);
 	if (ret)
 		return ret;
 
@@ -1812,13 +1859,16 @@ static int __maybe_unused sdhci_tegra_resume(struct device *dev)
 suspend_host:
 	sdhci_suspend_host(host);
 disable_clk:
-	clk_disable_unprepare(pltfm_host->clk);
+	pm_runtime_force_suspend(dev);
 	return ret;
 }
 #endif
 
-static SIMPLE_DEV_PM_OPS(sdhci_tegra_dev_pm_ops, sdhci_tegra_suspend,
-			 sdhci_tegra_resume);
+static const struct dev_pm_ops sdhci_tegra_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(sdhci_tegra_runtime_suspend, sdhci_tegra_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(sdhci_tegra_suspend, sdhci_tegra_resume)
+};
 
 static struct platform_driver sdhci_tegra_driver = {
 	.driver		= {
-- 
2.32.0

