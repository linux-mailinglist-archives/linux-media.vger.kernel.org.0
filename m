Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEAC1EF83B
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 14:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgFEMqq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 08:46:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:39855 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726499AbgFEMqq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jun 2020 08:46:46 -0400
IronPort-SDR: +rPeI5uZh0OMljZuxl/TdFc7ZIRmLmLmX911sCr55Hb+7EG2AS8LdwoqghjBWlzW4T55Rd3gnc
 UXbgTnpooerQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2020 05:46:45 -0700
IronPort-SDR: r/oJX8fhNmc8e/bISoUrjyeoU9guHWxK+HVaeG11SzZWS7YbfeGTMiJ95UKT4qtI63FTHd0jO8
 yFEOq6VRqCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; 
   d="scan'208";a="269755373"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 05 Jun 2020 05:46:41 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jhBkB-00B1rI-FV; Fri, 05 Jun 2020 15:46:43 +0300
Date:   Fri, 5 Jun 2020 15:46:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200605124643.GG2428291@smile.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605105412.18813-3-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> control to set the desired focus via IIC serial interface.

...

> +config VIDEO_DW9768
> +	tristate "DW9768 lens voice coil support"
> +	depends on I2C && VIDEO_V4L2

No compile test?

> +	depends on PM

This is very strange dependency for ordinary driver.

> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE

...

> +/*
> + * DW9768 requires waiting time (delay time) of t_OPR after power-up,
> + * or in the case of PD reset taking place.
> + */
> +#define DW9768_T_OPR_US				1000
> +#define DW9768_Tvib_MS_BASE10			(64 - 1)
> +#define DW9768_AAC_MODE_DEFAULT			2

> +#define DW9768_AAC_TIME_DEFAULT			0x20

Hex? Why not decimal?

> +#define DW9768_CLOCK_PRE_SCALE_DEFAULT		1

...

> +static int dw9768_mod_reg(struct dw9768 *dw9768, u8 reg, u8 mask, u8 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(client, reg);
> +	if (ret < 0)
> +		return ret;
> +

> +	val = ((unsigned char)ret & ~mask) | (val & mask);

This cast is weird.

> +
> +	return i2c_smbus_write_byte_data(client, reg, val);
> +}

...

> +			dev_err(&client->dev, "%s I2C failure: %d",
> +				__func__, ret);

One line?

...

> +static int dw9768_release(struct dw9768 *dw9768)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +	u32 move_delay_us = dw9768_cal_move_delay(dw9768->aac_mode,
> +						  dw9768->clock_presc,
> +						  dw9768->aac_timing) / 100;
> +	int ret, val;
> +
> +	val = round_down(dw9768->focus->val, DW9768_MOVE_STEPS);
> +	for ( ; val >= 0; val -= DW9768_MOVE_STEPS) {
> +		ret = dw9768_set_dac(dw9768, val);
> +		if (ret) {
> +			dev_err(&client->dev, "I2C write fail: %d", ret);
> +			return ret;
> +		}
> +		usleep_range(move_delay_us, move_delay_us + 1000);
> +	}


It will look more naturally in the multiplier kind of value.

	unsigned int steps = DIV_ROUND_UP(...);

	while (steps--) {
		...(..., steps * ..._MOVE_STEPS);
		...
	}

but double check arithmetics.

> +	return 0;
> +}


Also it seems we need to have writex_poll_timeout() implementation (see
iopoll.h).

-- 
With Best Regards,
Andy Shevchenko


