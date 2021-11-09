Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9800C44AD41
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 13:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240864AbhKIMRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 07:17:34 -0500
Received: from mga03.intel.com ([134.134.136.65]:10073 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236245AbhKIMRd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 07:17:33 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="232379887"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="232379887"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:14:47 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="451873163"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:14:42 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 24B83200FF;
        Tue,  9 Nov 2021 14:14:40 +0200 (EET)
Date:   Tue, 9 Nov 2021 14:14:40 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
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
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 04/11] regulator: Introduce tps68470-regulator driver
Message-ID: <YYpmMNefsGUhqJ9W@paasikivi.fi.intel.com>
References: <20211025094119.82967-1-hdegoede@redhat.com>
 <20211025094119.82967-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025094119.82967-5-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the set.

On Mon, Oct 25, 2021 at 11:41:12AM +0200, Hans de Goede wrote:
> The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
> the kernel the Regulators and Clocks are controlled by an OpRegion
> driver designed to work with power control methods defined in ACPI, but
> some platforms lack those methods, meaning drivers need to be able to
> consume the resources of these chips through the usual frameworks.
> 
> This commit adds a driver for the regulators provided by the tps68470,
> and is designed to bind to the platform_device registered by the
> intel_skl_int3472 module.
> 
> This is based on this out of tree driver written by Intel:
> https://github.com/intel/linux-intel-lts/blob/4.14/base/drivers/regulator/tps68470-regulator.c
> with various cleanups added.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - Make the top comment block use c++ style comments

Why?

> - Drop the bogus builtin regulator_init_data
> - Add || COMPILE_TEST to Kconfig snippet
> - Make the driver enable the PMIC clk when enabling the Core buck
>   regulator, this switching regulator needs the PLL to be on
> 
> Changes in v2:
> - Update the comment on why a subsys_initcall is used to register the drv
> - Make struct regulator_ops const
> ---
>  drivers/regulator/Kconfig              |   9 ++
>  drivers/regulator/Makefile             |   1 +
>  drivers/regulator/tps68470-regulator.c | 215 +++++++++++++++++++++++++
>  3 files changed, 225 insertions(+)
>  create mode 100644 drivers/regulator/tps68470-regulator.c
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 4fd13b06231f..1f6a6adc4ab0 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1339,6 +1339,15 @@ config REGULATOR_TPS65912
>  	help
>  	    This driver supports TPS65912 voltage regulator chip.
>  
> +config REGULATOR_TPS68470
> +	tristate "TI TPS68370 PMIC Regulators Driver"

s/3/4/

> +	depends on INTEL_SKL_INT3472 || COMPILE_TEST
> +	help
> +	  This driver adds support for the TPS68470 PMIC to register
> +	  regulators against the usual framework.
> +
> +	  The module will be called "tps68470-regulator".
> +
>  config REGULATOR_TPS80031
>  	tristate "TI TPS80031/TPS80032 power regulator driver"
>  	depends on MFD_TPS80031
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 9e382b50a5ef..03c318110986 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -158,6 +158,7 @@ obj-$(CONFIG_REGULATOR_TPS6524X) += tps6524x-regulator.o
>  obj-$(CONFIG_REGULATOR_TPS6586X) += tps6586x-regulator.o
>  obj-$(CONFIG_REGULATOR_TPS65910) += tps65910-regulator.o
>  obj-$(CONFIG_REGULATOR_TPS65912) += tps65912-regulator.o
> +obj-$(CONFIG_REGULATOR_TPS68470) += tps68470-regulator.o
>  obj-$(CONFIG_REGULATOR_TPS80031) += tps80031-regulator.o
>  obj-$(CONFIG_REGULATOR_TPS65132) += tps65132-regulator.o
>  obj-$(CONFIG_REGULATOR_TWL4030) += twl-regulator.o twl6030-regulator.o
> diff --git a/drivers/regulator/tps68470-regulator.c b/drivers/regulator/tps68470-regulator.c
> new file mode 100644
> index 000000000000..7bce45df1596
> --- /dev/null
> +++ b/drivers/regulator/tps68470-regulator.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Regulator driver for TPS68470 PMIC
> +//
> +// Copyright (c) 2021 Red Hat Inc.
> +// Copyright (C) 2018 Intel Corporation
> +//
> +// Authors:
> +//	Hans de Goede <hdegoede@redhat.com>
> +//	Zaikuo Wang <zaikuo.wang@intel.com>
> +//	Tianshu Qiu <tian.shu.qiu@intel.com>
> +//	Jian Xu Zheng <jian.xu.zheng@intel.com>
> +//	Yuning Pu <yuning.pu@intel.com>
> +//	Rajmohan Mani <rajmohan.mani@intel.com>
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/tps68470.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/tps68470.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +
> +struct tps68470_regulator_data {
> +	struct clk *clk;
> +};
> +
> +#define TPS68470_REGULATOR(_name, _id, _ops, _n, _vr,			\
> +			   _vm, _er, _em, _t, _lr, _nlr)		\
> +	[TPS68470_ ## _name] = {					\
> +		.name			= # _name,			\
> +		.id			= _id,				\
> +		.ops			= &_ops,			\
> +		.n_voltages		= _n,				\
> +		.type			= REGULATOR_VOLTAGE,		\
> +		.owner			= THIS_MODULE,			\
> +		.vsel_reg		= _vr,				\
> +		.vsel_mask		= _vm,				\
> +		.enable_reg		= _er,				\
> +		.enable_mask		= _em,				\
> +		.volt_table		= _t,				\
> +		.linear_ranges		= _lr,				\
> +		.n_linear_ranges	= _nlr,				\
> +	}
> +
> +static const struct linear_range tps68470_ldo_ranges[] = {
> +	REGULATOR_LINEAR_RANGE(875000, 0, 125, 17800),
> +};
> +
> +static const struct linear_range tps68470_core_ranges[] = {
> +	REGULATOR_LINEAR_RANGE(900000, 0, 42, 25000),
> +};
> +
> +int tps68470_regulator_enable(struct regulator_dev *rdev)
> +{
> +	struct tps68470_regulator_data *data = rdev->reg_data;
> +	int ret;
> +
> +	/* The Core buck regulator needs the PMIC's PLL to be enabled */
> +	if (rdev->desc->id == TPS68470_CORE) {
> +		ret = clk_prepare_enable(data->clk);
> +		if (ret) {
> +			dev_err(&rdev->dev, "Error enabling TPS68470 clock\n");
> +			return ret;
> +		}
> +	}
> +
> +	return regulator_enable_regmap(rdev);
> +}
> +
> +int tps68470_regulator_disable(struct regulator_dev *rdev)
> +{
> +	struct tps68470_regulator_data *data = rdev->reg_data;
> +
> +	if (rdev->desc->id == TPS68470_CORE)
> +		clk_disable_unprepare(data->clk);
> +
> +	return regulator_disable_regmap(rdev);
> +}
> +
> +/* Operations permitted on DCDCx, LDO2, LDO3 and LDO4 */
> +static const struct regulator_ops tps68470_regulator_ops = {
> +	.is_enabled		= regulator_is_enabled_regmap,
> +	.enable			= tps68470_regulator_enable,
> +	.disable		= tps68470_regulator_disable,
> +	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
> +	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
> +	.list_voltage		= regulator_list_voltage_linear_range,
> +	.map_voltage		= regulator_map_voltage_linear_range,
> +};
> +
> +static const struct regulator_desc regulators[] = {
> +	TPS68470_REGULATOR(CORE, TPS68470_CORE,
> +			   tps68470_regulator_ops, 43, TPS68470_REG_VDVAL,
> +			   TPS68470_VDVAL_DVOLT_MASK, TPS68470_REG_VDCTL,
> +			   TPS68470_VDCTL_EN_MASK,
> +			   NULL, tps68470_core_ranges,
> +			   ARRAY_SIZE(tps68470_core_ranges)),
> +	TPS68470_REGULATOR(ANA, TPS68470_ANA,
> +			   tps68470_regulator_ops, 126, TPS68470_REG_VAVAL,
> +			   TPS68470_VAVAL_AVOLT_MASK, TPS68470_REG_VACTL,
> +			   TPS68470_VACTL_EN_MASK,
> +			   NULL, tps68470_ldo_ranges,
> +			   ARRAY_SIZE(tps68470_ldo_ranges)),
> +	TPS68470_REGULATOR(VCM, TPS68470_VCM,
> +			   tps68470_regulator_ops, 126, TPS68470_REG_VCMVAL,
> +			   TPS68470_VCMVAL_VCVOLT_MASK, TPS68470_REG_VCMCTL,
> +			   TPS68470_VCMCTL_EN_MASK,
> +			   NULL, tps68470_ldo_ranges,
> +			   ARRAY_SIZE(tps68470_ldo_ranges)),
> +	TPS68470_REGULATOR(VIO, TPS68470_VIO,
> +			   tps68470_regulator_ops, 126, TPS68470_REG_VIOVAL,
> +			   TPS68470_VIOVAL_IOVOLT_MASK, TPS68470_REG_S_I2C_CTL,
> +			   TPS68470_S_I2C_CTL_EN_MASK,
> +			   NULL, tps68470_ldo_ranges,
> +			   ARRAY_SIZE(tps68470_ldo_ranges)),
> +
> +/*
> + * (1) This register must have same setting as VIOVAL if S_IO LDO is used to
> + *     power daisy chained IOs in the receive side.
> + * (2) If there is no I2C daisy chain it can be set freely.
> + *
> + */
> +	TPS68470_REGULATOR(VSIO, TPS68470_VSIO,
> +			   tps68470_regulator_ops, 126, TPS68470_REG_VSIOVAL,
> +			   TPS68470_VSIOVAL_IOVOLT_MASK, TPS68470_REG_S_I2C_CTL,
> +			   TPS68470_S_I2C_CTL_EN_MASK,
> +			   NULL, tps68470_ldo_ranges,
> +			   ARRAY_SIZE(tps68470_ldo_ranges)),
> +	TPS68470_REGULATOR(AUX1, TPS68470_AUX1,
> +			   tps68470_regulator_ops, 126, TPS68470_REG_VAUX1VAL,
> +			   TPS68470_VAUX1VAL_AUX1VOLT_MASK,
> +			   TPS68470_REG_VAUX1CTL,
> +			   TPS68470_VAUX1CTL_EN_MASK,
> +			   NULL, tps68470_ldo_ranges,
> +			   ARRAY_SIZE(tps68470_ldo_ranges)),
> +	TPS68470_REGULATOR(AUX2, TPS68470_AUX2,
> +			   tps68470_regulator_ops, 126, TPS68470_REG_VAUX2VAL,
> +			   TPS68470_VAUX2VAL_AUX2VOLT_MASK,
> +			   TPS68470_REG_VAUX2CTL,
> +			   TPS68470_VAUX2CTL_EN_MASK,
> +			   NULL, tps68470_ldo_ranges,
> +			   ARRAY_SIZE(tps68470_ldo_ranges)),
> +};
> +
> +static int tps68470_regulator_probe(struct platform_device *pdev)
> +{
> +	struct tps68470_regulator_platform_data *pdata = pdev->dev.platform_data;
> +	struct tps68470_regulator_data *data;
> +	struct regulator_config config = { };
> +	struct regulator_dev *rdev;
> +	int i;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->clk = devm_clk_get(&pdev->dev, "tps68470-clk");
> +	if (IS_ERR(data->clk)) {
> +		dev_err(&pdev->dev, "Error getting tps68470-clk\n");
> +		return PTR_ERR(data->clk);
> +	}
> +
> +	config.dev = pdev->dev.parent;
> +	config.regmap = dev_get_drvdata(pdev->dev.parent);
> +	config.driver_data = data;
> +
> +	for (i = 0; i < TPS68470_NUM_REGULATORS; i++) {
> +		if (pdata)
> +			config.init_data = pdata->reg_init_data[i];
> +		else
> +			config.init_data = NULL;
> +
> +		rdev = devm_regulator_register(&pdev->dev, &regulators[i], &config);
> +		if (IS_ERR(rdev)) {
> +			dev_err(&pdev->dev, "failed to register %s regulator\n",
> +				regulators[i].name);
> +			return PTR_ERR(rdev);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver tps68470_regulator_driver = {
> +	.driver = {
> +		.name = "tps68470-regulator",
> +	},
> +	.probe = tps68470_regulator_probe,
> +};
> +
> +/*
> + * The ACPI tps68470 probe-ordering depends on the clk/gpio/regulator drivers
> + * registering before the drivers for the camera-sensors which use them bind.
> + * subsys_initcall() ensures this when the drivers are builtin.
> + */
> +static int __init tps68470_regulator_init(void)
> +{
> +	return platform_driver_register(&tps68470_regulator_driver);
> +}
> +subsys_initcall(tps68470_regulator_init);
> +
> +static void __exit tps68470_regulator_exit(void)
> +{
> +	platform_driver_unregister(&tps68470_regulator_driver);
> +}
> +module_exit(tps68470_regulator_exit);
> +
> +MODULE_ALIAS("platform:tps68470-regulator");
> +MODULE_DESCRIPTION("TPS68470 voltage regulator driver");
> +MODULE_LICENSE("GPL v2");

-- 
Kind regards,

Sakari Ailus
