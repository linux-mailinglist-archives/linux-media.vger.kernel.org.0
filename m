Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43052DD73F
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730799AbgLQSJE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgLQSJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:01 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13CDC0619FA;
        Thu, 17 Dec 2020 10:08:00 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id a12so59839722lfl.6;
        Thu, 17 Dec 2020 10:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aGHKx42MfDPDBxR4DOfvxOz7/Acf8JGv695v+njpFiw=;
        b=APzhHWryK80KbNYYXej8HpuMRxROpNpavnwx1kCJM5bBVa+TdnqcKt2RdY4SHrVcMt
         W32uT9CDUxgZFM5ZaDWbgo1obHaTQ1kGwhJG++8pUONg2zS9xnH2pzU8uyJ6hB+j4PGX
         1MqSTqHOmRR4oxYHzrG398GEVxIjKP0fRVqwZMLdKEqIdB1HPy2mp9iXuZShti/PjFyY
         zg1UQpEpkEy5lqEu4XzkhaFTH8uLVwRO4o9uco4kum/fI3IXc3ln3x8P6KAG8+NBMkxm
         aBvJj5J91tJlBSHYLO4l1LvQKn29JZGFsLwDihxkT203GN1ZlQqTQLh5/Nq0qb56d/Sx
         uI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aGHKx42MfDPDBxR4DOfvxOz7/Acf8JGv695v+njpFiw=;
        b=Z0MAUhlfYseIx3NpG9dw9WqffIK6vhTngdbbMxvXEe4vxcLA/nl4w7Pa7arGCtwnET
         1B/JXdKzzz3VeiCrfgYR/rjz3okwcvpiYovR5dMTeoyMn+EVussQR8UYPDSuAmBJwgig
         8qNsWyQVE1BOfHW9j0wI+/CFQzgl80C/hkqCe+IDTRsIoGBgg1dLjx1+LrDax+lfG3c6
         aD/IXig4QzHIq1MjR4S5SDyKANDO6FgSP0Zn/6uVIK30B7i1zMscmcV2+XT1Gh+SBakU
         NcevYMwyEyo1GFsiNCn++eLsELK3yGC4dD0TGXidHDffVbT79E+qJJKUweBmcfW+pPhO
         JTnA==
X-Gm-Message-State: AOAM533GiLApO2Xd0lL9mbF9eyz8DyNGbbB3h5ygVjhxAE/yu7gKYKY9
        GVG8JsVVMhpgy8ej0R7uJHY=
X-Google-Smtp-Source: ABdhPJxkb6RUPIBzwYQiSBrp+AitBo6hp1cBKHpnuOhqRgnsIEu24oMo56Vx5VfhUm4ap09nC3WDZg==
X-Received: by 2002:a19:be16:: with SMTP id o22mr15087043lff.109.1608228479360;
        Thu, 17 Dec 2020 10:07:59 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:58 -0800 (PST)
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
Subject: [PATCH v2 34/48] gpu: host1x: Support power management
Date:   Thu, 17 Dec 2020 21:06:24 +0300
Message-Id: <20201217180638.22748-35-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add suspend/resume and generic power domain support to the Host1x driver.
This is required for enabling system-wide DVFS and supporting dynamic
power management using a generic power domain.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/dev.c | 102 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 91 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index d0ebb70e2fdd..c1525cffe7b1 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #define CREATE_TRACE_POINTS
@@ -417,7 +418,7 @@ static int host1x_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	host->rst = devm_reset_control_get(&pdev->dev, "host1x");
+	host->rst = devm_reset_control_get_exclusive_released(&pdev->dev, "host1x");
 	if (IS_ERR(host->rst)) {
 		err = PTR_ERR(host->rst);
 		dev_err(&pdev->dev, "failed to get reset: %d\n", err);
@@ -437,16 +438,15 @@ static int host1x_probe(struct platform_device *pdev)
 		goto iommu_exit;
 	}
 
-	err = clk_prepare_enable(host->clk);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable clock\n");
-		goto free_channels;
-	}
+	pm_runtime_enable(&pdev->dev);
+	err = pm_runtime_get_sync(&pdev->dev);
+	if (err < 0)
+		goto rpm_disable;
 
 	err = reset_control_deassert(host->rst);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to deassert reset: %d\n", err);
-		goto unprepare_disable;
+		goto rpm_disable;
 	}
 
 	err = host1x_syncpt_init(host);
@@ -485,9 +485,10 @@ static int host1x_probe(struct platform_device *pdev)
 	host1x_syncpt_deinit(host);
 reset_assert:
 	reset_control_assert(host->rst);
-unprepare_disable:
-	clk_disable_unprepare(host->clk);
-free_channels:
+rpm_disable:
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
 	host1x_channel_list_free(&host->channel_list);
 iommu_exit:
 	host1x_iommu_exit(host);
@@ -504,16 +505,95 @@ static int host1x_remove(struct platform_device *pdev)
 	host1x_intr_deinit(host);
 	host1x_syncpt_deinit(host);
 	reset_control_assert(host->rst);
-	clk_disable_unprepare(host->clk);
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	host1x_iommu_exit(host);
 
 	return 0;
 }
 
+static int __maybe_unused host1x_runtime_suspend(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(host->clk);
+	reset_control_release(host->rst);
+
+	return 0;
+}
+
+static int __maybe_unused host1x_runtime_resume(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_acquire(host->rst);
+	if (err) {
+		dev_err(dev, "failed to acquire reset: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(host->clk);
+	if (err) {
+		dev_err(dev, "failed to enable clock: %d\n", err);
+		goto release_reset;
+	}
+
+	return 0;
+
+release_reset:
+	reset_control_release(host->rst);
+
+	return err;
+}
+
+static __maybe_unused int host1x_suspend(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+	int err;
+
+	host1x_syncpt_save(host);
+
+	err = pm_runtime_force_suspend(dev);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static __maybe_unused int host1x_resume(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+	struct host1x_channel *channel;
+	unsigned int index;
+	int err;
+
+	err = pm_runtime_force_resume(dev);
+	if (err < 0)
+		return err;
+
+	host1x_syncpt_restore(host);
+
+	for_each_set_bit(index, host->channel_list.allocated_channels,
+			 host->info->nb_channels) {
+		channel = &host->channel_list.channels[index];
+		host1x_hw_channel_init(host, channel, channel->id);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops host1x_pm = {
+	SET_RUNTIME_PM_OPS(host1x_runtime_suspend, host1x_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(host1x_suspend, host1x_resume)
+};
+
 static struct platform_driver tegra_host1x_driver = {
 	.driver = {
 		.name = "tegra-host1x",
 		.of_match_table = host1x_of_match,
+		.pm = &host1x_pm,
 	},
 	.probe = host1x_probe,
 	.remove = host1x_remove,
-- 
2.29.2

