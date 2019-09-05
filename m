Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCC7A9FA2
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732456AbfIEK0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:26:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:46587 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730864AbfIEK0m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 06:26:42 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 03:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; 
   d="scan'208";a="382845344"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 05 Sep 2019 03:26:35 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i5oyH-0006S3-S7; Thu, 05 Sep 2019 13:26:33 +0300
Date:   Thu, 5 Sep 2019 13:26:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     dongchun.zhu@mediatek.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sam.hung@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V2, 2/2] media: i2c: Add DW9768 VCM driver
Message-ID: <20190905102633.GC2680@smile.fi.intel.com>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190905072142.14606-3-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 05, 2019 at 03:21:42PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> and provides control to set the desired focus.
> 
> The DW9768 is a 10 bit DAC with 100mA output current sink capability
> from Dongwoon, designed for linear control of voice coil motor,
> and controlled via I2C serial interface.

> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                |   1 +

This should go to the same patch, where you introduce a record in the
MAINTAINERS database.

> +#define DW9768_SET_POSITION_ADDR                0x03

Indentation issue.

> +static struct regval_list dw9768_init_regs[] = {
> +	{0x02, 0x02},
> +	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +	{0x06, 0x41},
> +	{0x07, 0x39},
> +	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +};
> +
> +static struct regval_list dw9768_release_regs[] = {
> +	{0x02, 0x00},
> +	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +	{0x01, 0x00},
> +	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +};
> +
> +static int dw9768_write_smbus(struct dw9768 *dw9768, unsigned char reg,
> +			      unsigned char value)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +	int ret;
> +

> +	if (reg == DW9768_CMD_DELAY  && value == DW9768_CMD_DELAY)

Indentation issue.
But see other's comments.

> +		usleep_range(DW9768_CTRL_DELAY_US,
> +			     DW9768_CTRL_DELAY_US + 100);

> +	else

This needs an explanation.

> +		ret = i2c_smbus_write_byte_data(client, reg, value);
> +	return ret;
> +}

I'm wondering if we can benefit from regmap I²C API in this driver.

> +static int __maybe_unused dw9768_vcm_suspend(struct device *dev)
> +{

> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);

isn't is simple dev_get_drvdata() ?

> +	struct dw9768 *dw9768 = sd_to_dw9768_vcm(sd);
> +
> +	return dw9768_power_off(dw9768);
> +}
> +
> +static int __maybe_unused dw9768_vcm_resume(struct device *dev)
> +{

> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);

Ditto.

> +	struct dw9768 *dw9768 = sd_to_dw9768_vcm(sd);
> +
> +	return dw9768_power_on(dw9768);
> +}

> +static const struct i2c_device_id dw9768_id_table[] = {
> +	{ DW9768_NAME, 0 },

> +	{ },

No comma.

> +};

> +static const struct of_device_id dw9768_of_table[] = {
> +	{ .compatible = "dongwoon,dw9768" },

> +	{ },

Ditto.

> +};

-- 
With Best Regards,
Andy Shevchenko


