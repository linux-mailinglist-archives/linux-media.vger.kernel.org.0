Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101F5427BB2
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 18:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbhJIQIr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 12:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24251 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231736AbhJIQIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Oct 2021 12:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633795592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=70XNOS0kBylUDDmRlKI84JmN1G8MEQqyFynvmQXcQQQ=;
        b=M0MtYqKlODS8bTamQmSJ+3eKVshJj3dYH7cTtTqHGsSNJnGJdLq2wRbJKf/PAtL5gm3Jyl
        n/pnyvaqkVrAlyLOTokqriTHbpseYwPh1wgN/0j00HE4NGb0iyLhtk771i5mV7SD+MWSp1
        kiaczBkcJfIiplWCDRPp6HQuid0u9rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-ohikN-5ePsWLTwRcGvIMcg-1; Sat, 09 Oct 2021 12:06:17 -0400
X-MC-Unique: ohikN-5ePsWLTwRcGvIMcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC66C102CB29;
        Sat,  9 Oct 2021 16:06:15 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.7])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8181A5C1B4;
        Sat,  9 Oct 2021 16:06:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 05/13] clk: Introduce clk-tps68470 driver
Date:   Sat,  9 Oct 2021 18:05:40 +0200
Message-Id: <20211009160548.306550-6-hdegoede@redhat.com>
In-Reply-To: <20211009160548.306550-1-hdegoede@redhat.com>
References: <20211009160548.306550-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
the kernel the Regulators and Clocks are controlled by an OpRegion
driver designed to work with power control methods defined in ACPI, but
some platforms lack those methods, meaning drivers need to be able to
consume the resources of these chips through the usual frameworks.

This commit adds a driver for the clocks provided by the tps68470,
and is designed to bind to the platform_device registered by the
intel_skl_int3472 module.

This is based on this out of tree driver written by Intel:
https://github.com/intel/linux-intel-lts/blob/4.14/base/drivers/clk/clk-tps68470.c
with various cleanups added.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Update the comment on why a subsys_initcall is used to register the drv
- Fix trailing whitespice on line 100
---
 drivers/clk/Kconfig          |   6 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/clk-tps68470.c   | 256 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/tps68470.h |  11 ++
 4 files changed, 274 insertions(+)
 create mode 100644 drivers/clk/clk-tps68470.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c5b3dc97396a..7dffecac83d1 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -169,6 +169,12 @@ config COMMON_CLK_CDCE706
 	help
 	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
 
+config COMMON_CLK_TPS68470
+	tristate "Clock Driver for TI TPS68470 PMIC"
+	depends on I2C && REGMAP_I2C && INTEL_SKL_INT3472
+	help
+	 This driver supports the clocks provided by TPS68470
+
 config COMMON_CLK_CDCE925
 	tristate "Clock driver for TI CDCE913/925/937/949 devices"
 	depends on I2C
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e42312121e51..6b6a88ae1425 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
 obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
 obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o
+obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
diff --git a/drivers/clk/clk-tps68470.c b/drivers/clk/clk-tps68470.c
new file mode 100644
index 000000000000..27e8cbd0f60e
--- /dev/null
+++ b/drivers/clk/clk-tps68470.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Clock driver for TPS68470 PMIC
+ *
+ * Copyright (C) 2018 Intel Corporation
+ *
+ * Authors:
+ *	Zaikuo Wang <zaikuo.wang@intel.com>
+ *	Tianshu Qiu <tian.shu.qiu@intel.com>
+ *	Jian Xu Zheng <jian.xu.zheng@intel.com>
+ *	Yuning Pu <yuning.pu@intel.com>
+ *	Antti Laakso <antti.laakso@intel.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/kernel.h>
+#include <linux/mfd/tps68470.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/tps68470.h>
+#include <linux/regmap.h>
+
+#define TPS68470_CLK_NAME "tps68470-clk"
+
+#define to_tps68470_clkdata(clkd) \
+	container_of(clkd, struct tps68470_clkdata, clkout_hw)
+
+struct tps68470_clkout_freqs {
+	unsigned long freq;
+	unsigned int xtaldiv;
+	unsigned int plldiv;
+	unsigned int postdiv;
+	unsigned int buckdiv;
+	unsigned int boostdiv;
+} clk_freqs[] = {
+/*
+ *  The PLL is used to multiply the crystal oscillator
+ *  frequency range of 3 MHz to 27 MHz by a programmable
+ *  factor of F = (M/N)*(1/P) such that the output
+ *  available at the HCLK_A or HCLK_B pins are in the range
+ *  of 4 MHz to 64 MHz in increments of 0.1 MHz
+ *
+ * hclk_# = osc_in * (((plldiv*2)+320) / (xtaldiv+30)) * (1 / 2^postdiv)
+ *
+ * PLL_REF_CLK should be as close as possible to 100kHz
+ * PLL_REF_CLK = input clk / XTALDIV[7:0] + 30)
+ *
+ * PLL_VCO_CLK = (PLL_REF_CLK * (plldiv*2 + 320))
+ *
+ * BOOST should be as close as possible to 2Mhz
+ * BOOST = PLL_VCO_CLK / (BOOSTDIV[4:0] + 16) *
+ *
+ * BUCK should be as close as possible to 5.2Mhz
+ * BUCK = PLL_VCO_CLK / (BUCKDIV[3:0] + 5)
+ *
+ * osc_in   xtaldiv  plldiv   postdiv   hclk_#
+ * 20Mhz    170      32       1         19.2Mhz
+ * 20Mhz    170      40       1         20Mhz
+ * 20Mhz    170      80       1         24Mhz
+ *
+ */
+	{ 19200000, 170, 32, 1, 2, 3 },
+	{ 20000000, 170, 40, 1, 3, 4 },
+	{ 24000000, 170, 80, 1, 4, 8 },
+};
+
+struct tps68470_clkdata {
+	struct clk_hw clkout_hw;
+	struct regmap *regmap;
+	struct clk *clk;
+	int clk_cfg_idx;
+};
+
+static int tps68470_clk_is_prepared(struct clk_hw *hw)
+{
+	struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
+	int val;
+
+	if (regmap_read(clkdata->regmap, TPS68470_REG_PLLCTL, &val))
+		return 0;
+
+	return val & TPS68470_PLL_EN_MASK;
+}
+
+static int tps68470_clk_prepare(struct clk_hw *hw)
+{
+	struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
+	int idx = clkdata->clk_cfg_idx;
+
+	regmap_write(clkdata->regmap, TPS68470_REG_BOOSTDIV, clk_freqs[idx].boostdiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_BUCKDIV, clk_freqs[idx].buckdiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_PLLSWR, TPS68470_PLLSWR_DEFAULT);
+	regmap_write(clkdata->regmap, TPS68470_REG_XTALDIV, clk_freqs[idx].xtaldiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_PLLDIV, clk_freqs[idx].plldiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_POSTDIV, clk_freqs[idx].postdiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_POSTDIV2, clk_freqs[idx].postdiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG2, TPS68470_CLKCFG2_DRV_STR_2MA);
+
+	regmap_write(clkdata->regmap, TPS68470_REG_PLLCTL,
+		     TPS68470_OSC_EXT_CAP_DEFAULT << TPS68470_OSC_EXT_CAP_SHIFT |
+		     TPS68470_CLK_SRC_XTAL << TPS68470_CLK_SRC_SHIFT);
+
+	regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG1,
+			   (TPS68470_PLL_OUTPUT_ENABLE <<
+			   TPS68470_OUTPUT_A_SHIFT) |
+			   (TPS68470_PLL_OUTPUT_ENABLE <<
+			   TPS68470_OUTPUT_B_SHIFT));
+
+	regmap_update_bits(clkdata->regmap, TPS68470_REG_PLLCTL,
+			   TPS68470_PLL_EN_MASK, TPS68470_PLL_EN_MASK);
+
+	return 0;
+}
+
+static void tps68470_clk_unprepare(struct clk_hw *hw)
+{
+	struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
+
+	/* disable clock first*/
+	regmap_update_bits(clkdata->regmap, TPS68470_REG_PLLCTL, TPS68470_PLL_EN_MASK, 0);
+
+	/* write hw defaults */
+	regmap_write(clkdata->regmap, TPS68470_REG_BOOSTDIV, 0);
+	regmap_write(clkdata->regmap, TPS68470_REG_BUCKDIV, 0);
+	regmap_write(clkdata->regmap, TPS68470_REG_PLLSWR, 0);
+	regmap_write(clkdata->regmap, TPS68470_REG_XTALDIV, 0);
+	regmap_write(clkdata->regmap, TPS68470_REG_PLLDIV, 0);
+	regmap_write(clkdata->regmap, TPS68470_REG_POSTDIV, 0);
+	regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG2, 0);
+	regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG1, 0);
+}
+
+static unsigned long tps68470_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
+
+	return clk_freqs[clkdata->clk_cfg_idx].freq;
+}
+
+static int tps68470_clk_cfg_lookup(unsigned long rate)
+{
+	long diff, best_diff = LONG_MAX;
+	int i, best_idx = 0;
+
+	for (i = 0; i < ARRAY_SIZE(clk_freqs); i++) {
+		diff = clk_freqs[i].freq - rate;
+		if (diff == 0)
+			return i;
+
+		diff = abs(diff);
+		if (diff < best_diff) {
+			best_diff = diff;
+			best_idx = i;
+		}
+	}
+
+	return best_idx;
+}
+
+static long tps68470_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *parent_rate)
+{
+	int idx = tps68470_clk_cfg_lookup(rate);
+
+	return clk_freqs[idx].freq;
+}
+
+static int tps68470_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
+	int idx = tps68470_clk_cfg_lookup(rate);
+
+	if (rate != clk_freqs[idx].freq)
+		return -EINVAL;
+
+	clkdata->clk_cfg_idx = idx;
+	return 0;
+}
+
+static const struct clk_ops tps68470_clk_ops = {
+	.is_prepared = tps68470_clk_is_prepared,
+	.prepare = tps68470_clk_prepare,
+	.unprepare = tps68470_clk_unprepare,
+	.recalc_rate = tps68470_clk_recalc_rate,
+	.round_rate = tps68470_clk_round_rate,
+	.set_rate = tps68470_clk_set_rate,
+};
+
+static struct clk_init_data tps68470_clk_initdata = {
+	.name = TPS68470_CLK_NAME,
+	.ops = &tps68470_clk_ops,
+};
+
+static int tps68470_clk_probe(struct platform_device *pdev)
+{
+	struct tps68470_clk_platform_data *pdata = pdev->dev.platform_data;
+	struct tps68470_clkdata *tps68470_clkdata;
+	int ret;
+
+	tps68470_clkdata = devm_kzalloc(&pdev->dev, sizeof(*tps68470_clkdata),
+					GFP_KERNEL);
+	if (!tps68470_clkdata)
+		return -ENOMEM;
+
+	tps68470_clkdata->regmap = dev_get_drvdata(pdev->dev.parent);
+	tps68470_clkdata->clkout_hw.init = &tps68470_clk_initdata;
+	tps68470_clkdata->clk = devm_clk_register(&pdev->dev, &tps68470_clkdata->clkout_hw);
+	if (IS_ERR(tps68470_clkdata->clk))
+		return PTR_ERR(tps68470_clkdata->clk);
+
+	ret = devm_clk_hw_register_clkdev(&pdev->dev, &tps68470_clkdata->clkout_hw,
+					  TPS68470_CLK_NAME, NULL);
+	if (ret)
+		return ret;
+
+	if (pdata) {
+		ret = devm_clk_hw_register_clkdev(&pdev->dev,
+						  &tps68470_clkdata->clkout_hw,
+						  pdata->consumer_con_id,
+						  pdata->consumer_dev_name);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver tps68470_clk_driver = {
+	.driver = {
+		.name = TPS68470_CLK_NAME,
+	},
+	.probe = tps68470_clk_probe,
+};
+
+/*
+ * The ACPI tps68470 probe-ordering depends on the clk/gpio/regulator drivers
+ * registering before the drivers for the camera-sensors which use them bind.
+ * subsys_initcall() ensures this when the drivers are builtin.
+ */
+static int __init tps68470_clk_init(void)
+{
+	return platform_driver_register(&tps68470_clk_driver);
+}
+subsys_initcall(tps68470_clk_init);
+
+static void __exit tps68470_clk_exit(void)
+{
+	platform_driver_unregister(&tps68470_clk_driver);
+}
+module_exit(tps68470_clk_exit);
+
+MODULE_ALIAS("platform:tps68470-clk");
+MODULE_DESCRIPTION("clock driver for TPS68470 pmic");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/tps68470.h b/include/linux/mfd/tps68470.h
index ffe81127d91c..7807fa329db0 100644
--- a/include/linux/mfd/tps68470.h
+++ b/include/linux/mfd/tps68470.h
@@ -75,6 +75,17 @@
 #define TPS68470_CLKCFG1_MODE_A_MASK	GENMASK(1, 0)
 #define TPS68470_CLKCFG1_MODE_B_MASK	GENMASK(3, 2)
 
+#define TPS68470_CLKCFG2_DRV_STR_2MA	0x05
+#define TPS68470_PLL_OUTPUT_ENABLE	0x02
+#define TPS68470_CLK_SRC_XTAL		BIT(0)
+#define TPS68470_PLLSWR_DEFAULT		GENMASK(1, 0)
+#define TPS68470_OSC_EXT_CAP_DEFAULT	0x05
+
+#define TPS68470_OUTPUT_A_SHIFT		0x00
+#define TPS68470_OUTPUT_B_SHIFT		0x02
+#define TPS68470_CLK_SRC_SHIFT		GENMASK(2, 0)
+#define TPS68470_OSC_EXT_CAP_SHIFT	BIT(2)
+
 #define TPS68470_GPIO_CTL_REG_A(x)	(TPS68470_REG_GPCTL0A + (x) * 2)
 #define TPS68470_GPIO_CTL_REG_B(x)	(TPS68470_REG_GPCTL0B + (x) * 2)
 #define TPS68470_GPIO_MODE_MASK		GENMASK(1, 0)
-- 
2.31.1

