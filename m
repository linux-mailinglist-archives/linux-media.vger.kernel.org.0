Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95714AF09D
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 19:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437147AbfIJRo5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 13:44:57 -0400
Received: from mga05.intel.com ([192.55.52.43]:17576 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394113AbfIJRo5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 13:44:57 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Sep 2019 10:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; 
   d="scan'208";a="186924829"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 10 Sep 2019 10:44:51 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i7kCA-0003u5-Ca; Tue, 10 Sep 2019 20:44:50 +0300
Date:   Tue, 10 Sep 2019 20:44:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     dongchun.zhu@mediatek.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V2, 2/2] media: i2c: Add more sensor modes for ov8856 camera
 sensor
Message-ID: <20190910174450.GJ2680@smile.fi.intel.com>
References: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
 <20190910130446.26413-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910130446.26413-3-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 10, 2019 at 09:04:46PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> This patch mainly adds two more sensor modes for OV8856 CMOS image sensor.
> That is, the resolution of 1632*1224 and 3264*2448, corresponding to the bayer order of BGGR.
> The sensor revision also differs in some OTP register.

> +static int __ov8856_power_on(struct ov8856 *ov8856)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> +	int ret;
> +
> +	ret = clk_prepare_enable(ov8856->xvclk);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to enable xvclk\n");
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> +
> +	ret = regulator_bulk_enable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to enable regulators\n");
> +		goto disable_clk;
> +	}
> +
> +	gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_HIGH);
> +

> +	usleep_range(1400, 1500);

This should be commented why this is needed and from where the requirement
comes from. Also, not, that 100us, which is only ~7%, is small margin.
Recommended one is ~20%.

> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(ov8856->xvclk);
> +
> +	return ret;
> +}

> +	ov8856->is_1B_revision = (val == OV8856_1B_MODULE) ? 1 : 0;

!! will give same result without using ternary operator.

> +	ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> +	if (IS_ERR(ov8856->xvclk)) {
> +		dev_err(&client->dev, "failed to get xvclk\n");
> +		return -EINVAL;
> +	}

Previously it was optional.
How did it work before and why it's not optional?

> +	ov8856->n_shutdn_gpio = devm_gpiod_get(&client->dev, "reset",
> +					       GPIOD_OUT_LOW);
> +	if (IS_ERR(ov8856->n_shutdn_gpio)) {
> +		dev_err(&client->dev, "failed to get reset-gpios\n");
> +		return -EINVAL;
> +	}

Ditto.

> +static const struct of_device_id ov8856_of_match[] = {
> +	{ .compatible = "ovti,ov8856" },

> +	{},

No comma needed for terminator line.

> +};

-- 
With Best Regards,
Andy Shevchenko


