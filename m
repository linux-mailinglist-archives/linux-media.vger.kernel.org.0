Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F821846DB
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 13:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgCMM2H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 08:28:07 -0400
Received: from mga18.intel.com ([134.134.136.126]:6234 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726395AbgCMM2H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 08:28:07 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Mar 2020 05:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,548,1574150400"; 
   d="scan'208";a="290013497"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Mar 2020 05:28:04 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jCjQ6-009G8T-69; Fri, 13 Mar 2020 14:28:06 +0200
Date:   Fri, 13 Mar 2020 14:28:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [v2 2/3] media: ov8856: Add devicetree support
Message-ID: <20200313122806.GT1922688@smile.fi.intel.com>
References: <20200313110350.10864-1-robert.foss@linaro.org>
 <20200313110350.10864-3-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313110350.10864-3-robert.foss@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 13, 2020 at 12:03:49PM +0100, Robert Foss wrote:
> Add devicetree match table, and enable ov8856_probe()
> to initialize power, clocks and reset pins.

Thanks for an update.
My comments below.

...

> +	ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");

In many frameworks we have '_optional' variants of API. Please use it instead
of open coded approach.

> +	if (PTR_ERR(ov8856->xvclk) == -ENOENT) {
> +		dev_info(&client->dev, "xvclk clock not defined, continuing...\n");
> +		ov8856->xvclk = NULL;
> +	} else if (IS_ERR(ov8856->xvclk)) {
> +		dev_err(&client->dev, "could not get xvclk clock (%ld)\n",
> +			PTR_ERR(ov8856->xvclk));
> +		return PTR_ERR(ov8856->xvclk);
> +	}
> +
> +	ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to set xvclk rate (24MHz)\n");
> +		return ret;
> +	}
> +

> +	ov8856->reset_gpio = devm_gpiod_get(&client->dev, "reset",
> +					       GPIOD_OUT_HIGH);

Same here.

> +	if (IS_ERR(ov8856->reset_gpio)) {
> +		dev_err(&client->dev, "failed to get reset-gpios\n");
> +		return PTR_ERR(ov8856->reset_gpio);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(ov8856_supply_names); i++)
> +		ov8856->supplies[i].supply = ov8856_supply_names[i];
> +

> +	ret = devm_regulator_bulk_get(&client->dev,
> +				      ARRAY_SIZE(ov8856_supply_names),
> +				      ov8856->supplies);

Luckily regulator framework will create dummy ones if there is none found.

> +	if (ret) {
> +		dev_warn(&client->dev, "failed to get regulators\n");
> +		return ret;
> +	}

-- 
With Best Regards,
Andy Shevchenko


