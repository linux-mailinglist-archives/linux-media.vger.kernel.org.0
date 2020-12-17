Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9082DD7A2
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731580AbgLQSLM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730885AbgLQSJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:12 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395A0C0619FF;
        Thu, 17 Dec 2020 10:08:04 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 23so59806431lfg.10;
        Thu, 17 Dec 2020 10:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/iJ0B7r+mpUQZW1i1h5+IfDMfw4DAGq9J8zYCndrZHI=;
        b=ExWKxj5QIut3nA25Da7CecMiBE6Co0EUXUaYa7EDsuufeFK9vSA+MhI677Lvw9pnY6
         flwb85bLxAI+Xhf9X5Jjrv/OzhgzY6Qr6OJAo385beFQg2JtqdkNkJ7gFIP//KnsZ3VC
         G53ibKuOUf3j7BAO36IpfgdArAKtszZFpsCZGJxERdCPUIXqSplxqvTK/USoVQaTAjRy
         195+umeDmwwxOBfUeNKqAwfUoE36+5BoA5loGfJpKHRDTmWJchvit5GJeclCvEwkWMY9
         6dpFR4KTNetWh9Voiby3i5kyGUGo9HeX/IEwz7trvafihsWSUyWxDLOCwbk/ZpqX6MXV
         2+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/iJ0B7r+mpUQZW1i1h5+IfDMfw4DAGq9J8zYCndrZHI=;
        b=E1RizdYSMKtQq6Il2MZF9mcjb10mNykAXtRGNaED8WYcWeppmrKUP1lm/LKYUZbrdp
         wH+vwRENyzngW3VKNx7JOpZhcFU7CNhjTWAud3G/8FVEoFzr4+m5RBSvhDaus5TSiDyx
         CuHCWEC+333D9eEV6DCLtYH5CG3OqtKdO+japfG/vUqEE5hzjjL1YDxtiC6fk1EpuQS6
         eyt6AQhQn8Ur8o9iqWZljudMx4zYqSwghhbeJSS8xdSnTCFZ/Qn/N88ZkCg8egQ3fMTc
         oRM7gsHUNuQD6a2WgiJwcA4YUdeID4COP1ebFfH3Mk8hu9vFqZ0xIv/sIDJDNjzV7/vr
         ee6A==
X-Gm-Message-State: AOAM530T+2xVsB1ZsLTZPAe1geg9Hn6sZKqJMtZAS80FSNAPEgq3taFE
        jAS3WSCsQZBYTh6MrtJDzC8=
X-Google-Smtp-Source: ABdhPJzdw43MgdozgmwwfnsGmn12MpmVira1PDFRjrinDosvUczBNvUTOPwdtYFG4TtdwHo7+9B/5w==
X-Received: by 2002:a19:58e:: with SMTP id 136mr2356lff.98.1608228482755;
        Thu, 17 Dec 2020 10:08:02 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:08:02 -0800 (PST)
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
Subject: [PATCH v2 37/48] drm/tegra: gr2d: Support OPP and power management
Date:   Thu, 17 Dec 2020 21:06:27 +0300
Message-Id: <20201217180638.22748-38-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add OPP and PM support to the GR2D driver. This is required for enabling
system-wide DVFS and supporting dynamic power management using a generic
power domain.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 73 +++++++++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index f30aa86e4c9f..689554ef81a8 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -7,6 +7,9 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+
+#include <soc/tegra/common.h>
 
 #include "drm.h"
 #include "gem.h"
@@ -185,8 +188,15 @@ static const u32 gr2d_addr_regs[] = {
 	GR2D_VA_BASE_ADDR_SB,
 };
 
+static void gr2d_pm_runtime_release(void *dev)
+{
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+}
+
 static int gr2d_probe(struct platform_device *pdev)
 {
+	struct tegra_core_opp_params opp_params = {};
 	struct device *dev = &pdev->dev;
 	struct host1x_syncpt **syncpts;
 	struct gr2d *gr2d;
@@ -197,6 +207,8 @@ static int gr2d_probe(struct platform_device *pdev)
 	if (!gr2d)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, gr2d);
+
 	gr2d->soc = of_device_get_match_data(dev);
 
 	syncpts = devm_kzalloc(dev, sizeof(*syncpts), GFP_KERNEL);
@@ -209,12 +221,23 @@ static int gr2d_probe(struct platform_device *pdev)
 		return PTR_ERR(gr2d->clk);
 	}
 
-	err = clk_prepare_enable(gr2d->clk);
-	if (err) {
-		dev_err(dev, "cannot turn on clock\n");
+	opp_params.init_state = true;
+
+	err = devm_tegra_core_dev_init_opp_table(dev, &opp_params);
+	if (err && err != -ENODEV)
+		return err;
+
+	pm_runtime_enable(dev);
+	err = pm_runtime_get_sync(dev);
+	if (err < 0) {
+		gr2d_pm_runtime_release(dev);
 		return err;
 	}
 
+	err = devm_add_action_or_reset(dev, gr2d_pm_runtime_release, dev);
+	if (err)
+		return err;
+
 	INIT_LIST_HEAD(&gr2d->client.base.list);
 	gr2d->client.base.ops = &gr2d_client_ops;
 	gr2d->client.base.dev = dev;
@@ -229,7 +252,6 @@ static int gr2d_probe(struct platform_device *pdev)
 	err = host1x_client_register(&gr2d->client.base);
 	if (err < 0) {
 		dev_err(dev, "failed to register host1x client: %d\n", err);
-		clk_disable_unprepare(gr2d->clk);
 		return err;
 	}
 
@@ -237,8 +259,6 @@ static int gr2d_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
 		set_bit(gr2d_addr_regs[i], gr2d->addr_regs);
 
-	platform_set_drvdata(pdev, gr2d);
-
 	return 0;
 }
 
@@ -254,15 +274,56 @@ static int gr2d_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	return 0;
+}
+
+static int __maybe_unused gr2d_runtime_suspend(struct device *dev)
+{
+	struct gr2d *gr2d = dev_get_drvdata(dev);
+
 	clk_disable_unprepare(gr2d->clk);
 
 	return 0;
 }
 
+static int __maybe_unused gr2d_runtime_resume(struct device *dev)
+{
+	struct gr2d *gr2d = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(gr2d->clk);
+	if (err) {
+		dev_err(dev, "failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static __maybe_unused int gr2d_suspend(struct device *dev)
+{
+	struct gr2d *gr2d = dev_get_drvdata(dev);
+	int err;
+
+	host1x_channel_stop(gr2d->channel);
+
+	err = pm_runtime_force_suspend(dev);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_gr2d_pm = {
+	SET_RUNTIME_PM_OPS(gr2d_runtime_suspend, gr2d_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(gr2d_suspend, pm_runtime_force_resume)
+};
+
 struct platform_driver tegra_gr2d_driver = {
 	.driver = {
 		.name = "tegra-gr2d",
 		.of_match_table = gr2d_match,
+		.pm = &tegra_gr2d_pm,
 	},
 	.probe = gr2d_probe,
 	.remove = gr2d_remove,
-- 
2.29.2

