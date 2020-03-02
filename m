Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22EE117592C
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 12:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgCBLHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 06:07:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:46200 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgCBLHU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Mar 2020 06:07:20 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 03:07:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; 
   d="scan'208";a="318972571"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 02 Mar 2020 03:07:15 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j8iuq-00675X-Ti; Mon, 02 Mar 2020 13:07:16 +0200
Date:   Mon, 2 Mar 2020 13:07:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V3, 2/2] media: i2c: Add DW9768 VCM driver
Message-ID: <20200302110716.GR1224808@smile.fi.intel.com>
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
 <20200228155958.20657-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228155958.20657-3-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 28, 2020 at 11:59:58PM +0800, Dongchun Zhu wrote:
> This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> and provides control to set the desired focus via I2C serial interface.

...

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5139,6 +5139,7 @@ M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
>  L:	linux-media@vger.kernel.org
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Maintained
> +F:	drivers/media/i2c/dw9768.c
>  F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml

Had you run parse-maintainers.pl?

I believe the order is wrong here.

...

> +#define DW9768_MAX_FOCUS_POS			1023

Is this value being dictated by amount of bits available in the hardware?
If so, I would rather put it in a form (1024 - 1) or alike to show that it has
10 bit resolution.

...

> +static int dw9768_set_dac(struct dw9768 *dw9768, u16 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +
> +	/* Write VCM position to registers */
> +	return i2c_smbus_write_word_data(client, DW9768_MSB_ADDR,
> +					 swab16(val));

i2c_smbus_write_word_swapped() ?

> +}

...

> +static int dw9768_release(struct dw9768 *dw9768)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +	int ret, val;
> +

> +	for (val = round_down(dw9768->focus->val, DW9768_MOVE_STEPS);
> +	     val >= 0; val -= DW9768_MOVE_STEPS) {

Perhaps

	val = round_down(dw9768->focus->val, DW9768_MOVE_STEPS);
	for ( ; val >= 0; val -= DW9768_MOVE_STEPS) {

> +		ret = dw9768_set_dac(dw9768, val);
> +		if (ret) {

> +			dev_err(&client->dev, "%s I2C failure: %d",
> +				__func__, ret);

Do you need __func__? What for?

> +			return ret;
> +		}

> +		usleep_range(DW9768_MOVE_DELAY_US,
> +			     DW9768_MOVE_DELAY_US + 1000);

It's exactly one line. Perhaps you have to check your editor settings.
And check entire code for a such.

> +	}
> +
> +	/*
> +	 * Wait for the motor to stabilize after the last movement
> +	 * to prevent the motor from shaking.
> +	 */
> +	usleep_range(DW9768_STABLE_TIME_US - DW9768_MOVE_DELAY_US,
> +		     DW9768_STABLE_TIME_US - DW9768_MOVE_DELAY_US + 1000);
> +
> +	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
> +					DW9768_PD_MODE_EN);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * DW9769 requires waiting delay time of t_OPR
> +	 * after PD reset takes place.
> +	 */
> +	usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


