Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232542DD79C
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731544AbgLQSKy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:10:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730989AbgLQSJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:16 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A68C061A04;
        Thu, 17 Dec 2020 10:08:08 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id a9so59804173lfh.2;
        Thu, 17 Dec 2020 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gq8W4I2wUasJ5h66KCTLBqIzNBWEKeD2bx1BnkMl56E=;
        b=ZiUJkXP3OEl/9p18Wnh4bsCNIWYB4EpZtNeUZUbymDo6mFP/v7DrbTn+YdTom89P/r
         AmXeBx7796APxIbMxtLxf3HciZHOxVmuTVKKDSDSJ8Ra7ZhMS9huHJ/KMHtHFBjHVkkZ
         BVDYefv2R4A+bme4K/4nKMZmTJbOuLNfP3vhtuOnUeHRIlFHaLmScFhfKLYmSPt5VqKy
         EzGb52iQElGyJCgS9zA9Af5lLvAkDa6CQbTnd8SEOJNgYqnIiL5p2zj2cEGY9Ddn8y6W
         VmjGL6qA17KyZFL2beiSQ+/fMV8SiM74sL+/ipNx57Q2rurhL7nvga/vD8DyPb+RajAM
         /IHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gq8W4I2wUasJ5h66KCTLBqIzNBWEKeD2bx1BnkMl56E=;
        b=PhWKn2bFwjjvG5Rg+eF7luMBEZsfl4QtYH8S7BoSlID769Jku6AOCdWDNr+nUKo5Lj
         2lsaropRFgbsZc/qESdTLOqbogIr9aLuT6gHzBcIQYVD5nx2w4Q4dubbbaOo5UOi53OG
         APTLgcwN7+02l6ziqqMUBzhZEhyZVSQpcCk/O8Lh/Qw8ZZ7pAvjRv/Wr82ZCL0gDjYoV
         f5r1La6sHeQDtV2N3G8EBkAkbOuOTbVFT9lBlU+DMHa+Qp2Mi+WbZTfKvE+DDJnfFWDR
         ELuGIFaMK1x9dPvXimy509WSGcPeJdd1KlIzP9rYXzYtn4Qzpp9EPM1nJZ3idfsJzVkT
         JxWQ==
X-Gm-Message-State: AOAM530Yp1AKcTkIrAs3qRvREZFtuph+eo9gTIi349vjphfY3cBeqc1U
        l1aSmZcpsqr3fFlfKipHYVk=
X-Google-Smtp-Source: ABdhPJzG7EE6kXogDOkARgr3HB5ayF26rpXNg7jPbhOKIPf6WK66Rb/TQWDoAw//rAssWa87q3IaOg==
X-Received: by 2002:a2e:9ad7:: with SMTP id p23mr191997ljj.465.1608228487370;
        Thu, 17 Dec 2020 10:08:07 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:08:06 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 41/48] memory: tegra20-emc: Use devm_tegra_core_dev_init_opp_table()
Date:   Thu, 17 Dec 2020 21:06:31 +0300
Message-Id: <20201217180638.22748-42-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use common devm_tegra_core_dev_init_opp_table() helper for the OPP table
initialization.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 57 +++---------------------------
 1 file changed, 4 insertions(+), 53 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 686aaf477d8a..4be847442fc7 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -908,58 +908,6 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 	return err;
 }
 
-static int tegra_emc_opp_table_init(struct tegra_emc *emc)
-{
-	u32 hw_version = BIT(tegra_sku_info.soc_process_id);
-	struct opp_table *clk_opp_table, *hw_opp_table;
-	int err;
-
-	clk_opp_table = dev_pm_opp_set_clkname(emc->dev, NULL);
-	err = PTR_ERR_OR_ZERO(clk_opp_table);
-	if (err) {
-		dev_err(emc->dev, "failed to set OPP clk: %d\n", err);
-		return err;
-	}
-
-	hw_opp_table = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
-	err = PTR_ERR_OR_ZERO(hw_opp_table);
-	if (err) {
-		dev_err(emc->dev, "failed to set OPP supported HW: %d\n", err);
-		goto put_clk_table;
-	}
-
-	err = dev_pm_opp_of_add_table(emc->dev);
-	if (err) {
-		if (err == -ENODEV)
-			dev_err(emc->dev, "OPP table not found, please update your device tree\n");
-		else
-			dev_err(emc->dev, "failed to add OPP table: %d\n", err);
-
-		goto put_hw_table;
-	}
-
-	dev_info(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
-		 hw_version, clk_get_rate(emc->clk) / 1000000);
-
-	/* first dummy rate-set initializes voltage state */
-	err = dev_pm_opp_set_rate(emc->dev, clk_get_rate(emc->clk));
-	if (err) {
-		dev_err(emc->dev, "failed to initialize OPP clock: %d\n", err);
-		goto remove_table;
-	}
-
-	return 0;
-
-remove_table:
-	dev_pm_opp_of_remove_table(emc->dev);
-put_hw_table:
-	dev_pm_opp_put_supported_hw(hw_opp_table);
-put_clk_table:
-	dev_pm_opp_put_clkname(clk_opp_table);
-
-	return err;
-}
-
 static void devm_tegra_emc_unset_callback(void *data)
 {
 	tegra20_clk_set_emc_round_callback(NULL, NULL);
@@ -1086,6 +1034,7 @@ static int tegra_emc_devfreq_init(struct tegra_emc *emc)
 
 static int tegra_emc_probe(struct platform_device *pdev)
 {
+	struct tegra_core_opp_params opp_params = {};
 	struct device_node *np;
 	struct tegra_emc *emc;
 	int irq, err;
@@ -1131,7 +1080,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = tegra_emc_opp_table_init(emc);
+	opp_params.init_state = true;
+
+	err = devm_tegra_core_dev_init_opp_table(&pdev->dev, &opp_params);
 	if (err)
 		return err;
 
-- 
2.29.2

