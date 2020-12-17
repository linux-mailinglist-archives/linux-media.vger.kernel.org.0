Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188472DD756
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731169AbgLQSJ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731127AbgLQSJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:22 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83379C0619DC;
        Thu, 17 Dec 2020 10:07:51 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m12so59850711lfo.7;
        Thu, 17 Dec 2020 10:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PmBu9E2lIeozw0QkYWqe3D4pOekliocLu8JrWl5nny4=;
        b=EPS29kv9Q9vOe6wgqe5DONcXtk0sVSUx85ZiXeHamtvdS3wv4XQD1m8FcHhtjA4J0u
         WJ7s/9fectY4VCJGti53BT0w5BHKjdWK5DG/6uPZajKUSJ+QfKB1xTT3bWx8nnZ/6YEx
         R1uOLMI3v7r0/KODn3O75mFfr7WU/WYV92H/GFIJE+LDOnXf//43yvBJUkqYK3LFc3yS
         za1YN9CBQLJMiQDmt96cJVJ9ptT9MDoybRZaEARxn65Hhx9NuakJbAMrFhxFYgQAi/Tj
         q5Ox90eUTSlb/QofCCJ+/nBR6XF3NdVQkxIlzbCHxOcPsjp2ug7KBulB9karp77fy0WD
         NyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PmBu9E2lIeozw0QkYWqe3D4pOekliocLu8JrWl5nny4=;
        b=V1daioFMNiOkYQ+B0XwMSIOKWB85l3vWVyZsfWRo/nW5j6VJnmwOK6OfvXOZZXfaIi
         RqgkuMYNM5DuyafyTOIMhw3pOu8tJ0pSWuZpLceJU+NW6rCW+oUGJSWvtgawE+4wuywn
         K+hlD6BkLE369AtGGB0gc0gDIODrJCdW7VNek22+HdtLEuRf0Et449A3yuSg+jTpiKRx
         klIp5zldMZ/rB6AA1U3igqomXMZqChU5DJ7LQLoqCT/HF36gdkhRhtZ3Df2y5aGMbqFu
         vsge6vdsc741y3KRZaBymQxF9oiAxctJtC0vf127R/8D3VYiPiJE1CeyLX5l9N/gKMUU
         1tjQ==
X-Gm-Message-State: AOAM532WyJnhUhwL02ff9Sr5bgFTfThMoyChevDGm84gevNY+6g9AJbX
        0KmZdmMyHqgvOpn5edU3dHg=
X-Google-Smtp-Source: ABdhPJwuD/q1ABQNnsDhwwbsY4LvwtjnLoFCXaYG1DCAoLzU2SaJeA+CHarpqRnPA6WcuWUQ7qagqw==
X-Received: by 2002:ac2:4946:: with SMTP id o6mr14552075lfi.412.1608228470017;
        Thu, 17 Dec 2020 10:07:50 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:49 -0800 (PST)
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
Subject: [PATCH v2 26/48] soc/tegra: Add devm_tegra_core_dev_init_opp_table()
Date:   Thu, 17 Dec 2020 21:06:16 +0300
Message-Id: <20201217180638.22748-27-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add common helper which initializes OPP table for Tegra SoC core devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 137 +++++++++++++++++++++++++++++++++++++
 include/soc/tegra/common.h |  35 ++++++++++
 2 files changed, 172 insertions(+)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 3dc54f59cafe..1339d46f494d 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -3,9 +3,16 @@
  * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#define dev_fmt(fmt)	"tegra-soc: " fmt
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/export.h>
 #include <linux/of.h>
+#include <linux/pm_opp.h>
 
 #include <soc/tegra/common.h>
+#include <soc/tegra/fuse.h>
 
 static const struct of_device_id tegra_machine_match[] = {
 	{ .compatible = "nvidia,tegra20", },
@@ -31,3 +38,133 @@ bool soc_is_tegra(void)
 
 	return match != NULL;
 }
+
+static int tegra_core_dev_init_opp_state(struct device *dev)
+{
+	struct dev_pm_opp *opp;
+	unsigned long rate;
+	struct clk *clk;
+	int err;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "failed to get clk: %pe\n", clk);
+		return PTR_ERR(clk);
+	}
+
+	/*
+	 * If voltage regulator presents, then we could select the fastest
+	 * clock rate, but driver doesn't support power management and
+	 * frequency scaling yet, hence the top freq OPP will vote for a
+	 * very high voltage that will produce lot's of heat.  Let's select
+	 * OPP for the current/default rate for now.
+	 *
+	 * Clock rate should be pre-initialized (i.e. it's non-zero) either
+	 * by clock driver or by assigned clocks in a device-tree.
+	 */
+	rate = clk_get_rate(clk);
+	if (!rate) {
+		dev_err(dev, "failed to get clk rate\n");
+		return -EINVAL;
+	}
+
+	/* find suitable OPP for the clock rate and supportable by hardware */
+	opp = dev_pm_opp_find_freq_ceil(dev, &rate);
+
+	/*
+	 * dev_pm_opp_set_rate() doesn't search for a floor clock rate and it
+	 * will error out if default clock rate is too high, i.e. unsupported
+	 * by a SoC hardware version.  Hence will find floor rate by ourselves.
+	 */
+	if (opp == ERR_PTR(-ERANGE))
+		opp = dev_pm_opp_find_freq_floor(dev, &rate);
+
+	err = PTR_ERR_OR_ZERO(opp);
+	if (err) {
+		dev_err(dev, "failed to get OPP for %ld Hz: %d\n",
+			rate, err);
+		return err;
+	}
+
+	dev_pm_opp_put(opp);
+
+	/*
+	 * First dummy rate-set initializes voltage vote by setting voltage
+	 * in accordance to the clock rate.  We need to do this because some
+	 * drivers currently don't support power management and clock is
+	 * permanently enabled.
+	 */
+	err = dev_pm_opp_set_rate(dev, rate);
+	if (err) {
+		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+/**
+ * devm_tegra_core_dev_init_opp_table() - initialize OPP table
+ * @cfg: pointer to the OPP table configuration
+ *
+ * This function will initialize OPP table and sync OPP state of a Tegra SoC
+ * core device.
+ *
+ * Return: 0 on success or errorno.
+ */
+int devm_tegra_core_dev_init_opp_table(struct device *dev,
+				       struct tegra_core_opp_params *params)
+{
+	struct opp_table *opp_table;
+	u32 hw_version;
+	int err;
+
+	opp_table = devm_pm_opp_set_clkname(dev, NULL);
+	if (IS_ERR(opp_table)) {
+		dev_err(dev, "failed to set OPP clk %pe\n", opp_table);
+		return PTR_ERR(opp_table);
+	}
+
+	/* Tegra114+ don't support OPP yet */
+	if (!of_machine_is_compatible("nvidia,tegra20") &&
+	    !of_machine_is_compatible("nvidia,tegra30"))
+		return -ENODEV;
+
+	if (of_machine_is_compatible("nvidia,tegra20"))
+		hw_version = BIT(tegra_sku_info.soc_process_id);
+	else
+		hw_version = BIT(tegra_sku_info.soc_speedo_id);
+
+	opp_table = devm_pm_opp_set_supported_hw(dev, &hw_version, 1);
+	if (IS_ERR(opp_table)) {
+		dev_err(dev, "failed to set OPP supported HW: %pe\n", opp_table);
+		return PTR_ERR(opp_table);
+	}
+
+	/*
+	 * Older device-trees have an empty OPP table, hence we will get
+	 * -ENODEV from devm_pm_opp_of_add_table() for the older DTBs.
+	 *
+	 * The OPP table presence also varies per-device and depending
+	 * on a SoC generation, hence -ENODEV is expected to happen for
+	 * the newer DTs as well.
+	 */
+	err = devm_pm_opp_of_add_table(dev);
+	if (err) {
+		if (err == -ENODEV)
+			dev_err_once(dev, "OPP table not found, please update device-tree\n");
+		else
+			dev_err(dev, "failed to add OPP table: %d\n", err);
+
+		return err;
+	}
+
+	if (params->init_state) {
+		err = tegra_core_dev_init_opp_state(dev);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_tegra_core_dev_init_opp_table);
diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index 98027a76ce3d..57b56793a9e5 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -6,6 +6,41 @@
 #ifndef __SOC_TEGRA_COMMON_H__
 #define __SOC_TEGRA_COMMON_H__
 
+#include <linux/errno.h>
+#include <linux/types.h>
+
+struct clk;
+struct device;
+
+/**
+ * Tegra SoC core device OPP table configuration
+ *
+ * @dev: pointer to the core device
+ * @clkname: name of clock used for DVFS
+ * @init_state: pre-initialize OPP state of a device
+ */
+struct tegra_core_opp_params {
+	struct device *dev;
+	const char *clkname;
+	bool init_state;
+};
+
+#ifdef CONFIG_ARCH_TEGRA
 bool soc_is_tegra(void);
+int devm_tegra_core_dev_init_opp_table(struct device *dev,
+				       struct tegra_core_opp_params *cfg);
+#else
+static inline bool soc_is_tegra(void)
+{
+	return false;
+}
+
+static inline int
+devm_tegra_core_dev_init_opp_table(struct device *dev,
+				   struct tegra_core_opp_params *cfg)
+{
+	return -ENODEV;
+}
+#endif
 
 #endif /* __SOC_TEGRA_COMMON_H__ */
-- 
2.29.2

