Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C932A4674EA
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 11:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379974AbhLCKd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 05:33:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28359 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1379981AbhLCKdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Dec 2021 05:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638527393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wtE8vIxlgfY503I1ZvMohLPlosUR7ennh93ej1F6oPs=;
        b=POnImCB71ndniL7qUsGvKzlthr0MpwuRd109cFN9uuLISpUcp4MN2sd+K6TUUW3dvEub2f
        R8kFzHyvXGcpXQZ4w3YBrqiq+CHzM4kGSFVzYNF18PhyGB1L2j/H7piLUxDYhuNrS8cTUZ
        ag/7re6AQRj6g+3FxD9cBgn/1uy+Ujs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-8DwAoRwSM7-AM9zbPvPYng-1; Fri, 03 Dec 2021 05:29:50 -0500
X-MC-Unique: 8DwAoRwSM7-AM9zbPvPYng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B600C1006AA0;
        Fri,  3 Dec 2021 10:29:47 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5CFAB60843;
        Fri,  3 Dec 2021 10:29:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
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
        linux-clk@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v7 05/14] regulator: Introduce tps68470-regulator driver
Date:   Fri,  3 Dec 2021 11:28:48 +0100
Message-Id: <20211203102857.44539-6-hdegoede@redhat.com>
In-Reply-To: <20211203102857.44539-1-hdegoede@redhat.com>
References: <20211203102857.44539-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
the kernel the Regulators and Clocks are controlled by an OpRegion
driver designed to work with power control methods defined in ACPI, but
some platforms lack those methods, meaning drivers need to be able to
consume the resources of these chips through the usual frameworks.

This commit adds a driver for the regulators provided by the tps68470,
and is designed to bind to the platform_device registered by the
intel_skl_int3472 module.

This is based on this out of tree driver written by Intel:
https://github.com/intel/linux-intel-lts/blob/4.14/base/drivers/regulator/tps68470-regulator.c
with various cleanups added.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v7:
- Replace PTR_ERR(data->clk) with PTR_ERR(rdev) in the error logging during
  regulator_register() error handling (fixing a copy paste error)

Changes in v6:
- Drop the unused volt_table argument from the TPS68470_REGULATOR() macro
- While working on VCM (voice coil motor) support for the camera-module behind
  this PMIC I learned that the VIO voltage is always on. Instead of pointing its
  enable_reg and enable_mask at the same register-bits as the VSIO regulator
  (which is wrong), add a new tps68470_always_on_reg_ops struct without
  is_enabled, enable and disable ops and use that for the VIO regulator.

Changes in v5:
- Small comment / code cleanups based on review from Andy

Changes in v4:
- Make the top comment block use c++ style comments
- Drop the bogus builtin regulator_init_data
- Add || COMPILE_TEST to Kconfig snippet
- Make the driver enable the PMIC clk when enabling the Core buck
  regulator, this switching regulator needs the PLL to be on

Changes in v2:
- Update the comment on why a subsys_initcall is used to register the drv
- Make struct regulator_ops const
---
 drivers/regulator/Kconfig              |   9 ++
 drivers/regulator/Makefile             |   1 +
 drivers/regulator/tps68470-regulator.c | 201 +++++++++++++++++++++++++
 3 files changed, 211 insertions(+)
 create mode 100644 drivers/regulator/tps68470-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 6be9b1c8a615..ebe46e09510e 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1339,6 +1339,15 @@ config REGULATOR_TPS65912
 	help
 	    This driver supports TPS65912 voltage regulator chip.
 
+config REGULATOR_TPS68470
+	tristate "TI TPS68470 PMIC Regulators Driver"
+	depends on INTEL_SKL_INT3472 || COMPILE_TEST
+	help
+	  This driver adds support for the TPS68470 PMIC to register
+	  regulators against the usual framework.
+
+	  The module will be called "tps68470-regulator".
+
 config REGULATOR_TWL4030
 	tristate "TI TWL4030/TWL5030/TWL6030/TPS659x0 PMIC"
 	depends on TWL4030_CORE
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index b07d2a22df0b..257331d2caed 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -159,6 +159,7 @@ obj-$(CONFIG_REGULATOR_TPS6586X) += tps6586x-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65910) += tps65910-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65912) += tps65912-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65132) += tps65132-regulator.o
+obj-$(CONFIG_REGULATOR_TPS68470) += tps68470-regulator.o
 obj-$(CONFIG_REGULATOR_TWL4030) += twl-regulator.o twl6030-regulator.o
 obj-$(CONFIG_REGULATOR_UNIPHIER) += uniphier-regulator.o
 obj-$(CONFIG_REGULATOR_VCTRL) += vctrl-regulator.o
diff --git a/drivers/regulator/tps68470-regulator.c b/drivers/regulator/tps68470-regulator.c
new file mode 100644
index 000000000000..4bca7c4128ab
--- /dev/null
+++ b/drivers/regulator/tps68470-regulator.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Regulator driver for TPS68470 PMIC
+//
+// Copyright (c) 2021 Red Hat Inc.
+// Copyright (C) 2018 Intel Corporation
+//
+// Authors:
+//	Hans de Goede <hdegoede@redhat.com>
+//	Zaikuo Wang <zaikuo.wang@intel.com>
+//	Tianshu Qiu <tian.shu.qiu@intel.com>
+//	Jian Xu Zheng <jian.xu.zheng@intel.com>
+//	Yuning Pu <yuning.pu@intel.com>
+//	Rajmohan Mani <rajmohan.mani@intel.com>
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/tps68470.h>
+#include <linux/module.h>
+#include <linux/platform_data/tps68470.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+
+struct tps68470_regulator_data {
+	struct clk *clk;
+};
+
+#define TPS68470_REGULATOR(_name, _id, _ops, _n,			\
+			   _vr, _vm, _er, _em, _lr, _nlr)		\
+	[TPS68470_ ## _name] = {					\
+		.name			= # _name,			\
+		.id			= _id,				\
+		.ops			= &_ops,			\
+		.n_voltages		= _n,				\
+		.type			= REGULATOR_VOLTAGE,		\
+		.owner			= THIS_MODULE,			\
+		.vsel_reg		= _vr,				\
+		.vsel_mask		= _vm,				\
+		.enable_reg		= _er,				\
+		.enable_mask		= _em,				\
+		.linear_ranges		= _lr,				\
+		.n_linear_ranges	= _nlr,				\
+	}
+
+static const struct linear_range tps68470_ldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(875000, 0, 125, 17800),
+};
+
+static const struct linear_range tps68470_core_ranges[] = {
+	REGULATOR_LINEAR_RANGE(900000, 0, 42, 25000),
+};
+
+static int tps68470_regulator_enable(struct regulator_dev *rdev)
+{
+	struct tps68470_regulator_data *data = rdev->reg_data;
+	int ret;
+
+	/* The Core buck regulator needs the PMIC's PLL to be enabled */
+	if (rdev->desc->id == TPS68470_CORE) {
+		ret = clk_prepare_enable(data->clk);
+		if (ret) {
+			dev_err(&rdev->dev, "Error enabling TPS68470 clock\n");
+			return ret;
+		}
+	}
+
+	return regulator_enable_regmap(rdev);
+}
+
+static int tps68470_regulator_disable(struct regulator_dev *rdev)
+{
+	struct tps68470_regulator_data *data = rdev->reg_data;
+
+	if (rdev->desc->id == TPS68470_CORE)
+		clk_disable_unprepare(data->clk);
+
+	return regulator_disable_regmap(rdev);
+}
+
+/* Operations permitted on DCDCx, LDO2, LDO3 and LDO4 */
+static const struct regulator_ops tps68470_regulator_ops = {
+	.is_enabled		= regulator_is_enabled_regmap,
+	.enable			= tps68470_regulator_enable,
+	.disable		= tps68470_regulator_disable,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.map_voltage		= regulator_map_voltage_linear_range,
+};
+
+static const struct regulator_ops tps68470_always_on_reg_ops = {
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.map_voltage		= regulator_map_voltage_linear_range,
+};
+
+static const struct regulator_desc regulators[] = {
+	TPS68470_REGULATOR(CORE, TPS68470_CORE, tps68470_regulator_ops, 43,
+			   TPS68470_REG_VDVAL, TPS68470_VDVAL_DVOLT_MASK,
+			   TPS68470_REG_VDCTL, TPS68470_VDCTL_EN_MASK,
+			   tps68470_core_ranges, ARRAY_SIZE(tps68470_core_ranges)),
+	TPS68470_REGULATOR(ANA, TPS68470_ANA, tps68470_regulator_ops, 126,
+			   TPS68470_REG_VAVAL, TPS68470_VAVAL_AVOLT_MASK,
+			   TPS68470_REG_VACTL, TPS68470_VACTL_EN_MASK,
+			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
+	TPS68470_REGULATOR(VCM, TPS68470_VCM, tps68470_regulator_ops, 126,
+			   TPS68470_REG_VCMVAL, TPS68470_VCMVAL_VCVOLT_MASK,
+			   TPS68470_REG_VCMCTL, TPS68470_VCMCTL_EN_MASK,
+			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
+	TPS68470_REGULATOR(VIO, TPS68470_VIO, tps68470_always_on_reg_ops, 126,
+			   TPS68470_REG_VIOVAL, TPS68470_VIOVAL_IOVOLT_MASK,
+			   0, 0,
+			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
+/*
+ * (1) This regulator must have the same voltage as VIO if S_IO LDO is used to
+ *     power a sensor/VCM which I2C is daisy chained behind the PMIC.
+ * (2) If there is no I2C daisy chain it can be set freely.
+ */
+	TPS68470_REGULATOR(VSIO, TPS68470_VSIO, tps68470_regulator_ops, 126,
+			   TPS68470_REG_VSIOVAL, TPS68470_VSIOVAL_IOVOLT_MASK,
+			   TPS68470_REG_S_I2C_CTL, TPS68470_S_I2C_CTL_EN_MASK,
+			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
+	TPS68470_REGULATOR(AUX1, TPS68470_AUX1, tps68470_regulator_ops, 126,
+			   TPS68470_REG_VAUX1VAL, TPS68470_VAUX1VAL_AUX1VOLT_MASK,
+			   TPS68470_REG_VAUX1CTL, TPS68470_VAUX1CTL_EN_MASK,
+			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
+	TPS68470_REGULATOR(AUX2, TPS68470_AUX2, tps68470_regulator_ops, 126,
+			   TPS68470_REG_VAUX2VAL, TPS68470_VAUX2VAL_AUX2VOLT_MASK,
+			   TPS68470_REG_VAUX2CTL, TPS68470_VAUX2CTL_EN_MASK,
+			   tps68470_ldo_ranges, ARRAY_SIZE(tps68470_ldo_ranges)),
+};
+
+static int tps68470_regulator_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tps68470_regulator_platform_data *pdata = dev_get_platdata(dev);
+	struct tps68470_regulator_data *data;
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+	int i;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->clk = devm_clk_get(dev, "tps68470-clk");
+	if (IS_ERR(data->clk))
+		return dev_err_probe(dev, PTR_ERR(data->clk), "getting tps68470-clk\n");
+
+	config.dev = dev->parent;
+	config.regmap = dev_get_drvdata(dev->parent);
+	config.driver_data = data;
+
+	for (i = 0; i < TPS68470_NUM_REGULATORS; i++) {
+		if (pdata)
+			config.init_data = pdata->reg_init_data[i];
+		else
+			config.init_data = NULL;
+
+		rdev = devm_regulator_register(dev, &regulators[i], &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "registering %s regulator\n",
+					     regulators[i].name);
+	}
+
+	return 0;
+}
+
+static struct platform_driver tps68470_regulator_driver = {
+	.driver = {
+		.name = "tps68470-regulator",
+	},
+	.probe = tps68470_regulator_probe,
+};
+
+/*
+ * The ACPI tps68470 probe-ordering depends on the clk/gpio/regulator drivers
+ * registering before the drivers for the camera-sensors which use them bind.
+ * subsys_initcall() ensures this when the drivers are builtin.
+ */
+static int __init tps68470_regulator_init(void)
+{
+	return platform_driver_register(&tps68470_regulator_driver);
+}
+subsys_initcall(tps68470_regulator_init);
+
+static void __exit tps68470_regulator_exit(void)
+{
+	platform_driver_unregister(&tps68470_regulator_driver);
+}
+module_exit(tps68470_regulator_exit);
+
+MODULE_ALIAS("platform:tps68470-regulator");
+MODULE_DESCRIPTION("TPS68470 voltage regulator driver");
+MODULE_LICENSE("GPL v2");
-- 
2.33.1

