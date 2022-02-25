Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B20A04C4BAD
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 18:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243502AbiBYRKz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 12:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243494AbiBYRKx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 12:10:53 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E7E186B95
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 09:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645809021; x=1677345021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qev9WmLcdiIlGGeQB0m/lwOoKMONKMVTc52qH4VVmT4=;
  b=AjMwaWyHfEniyWYgbeXFPBg9zBlS9lHKT7DTBX4ufsAW4vCCfVJ3gy62
   aWkj6LQtMTWLDMAOMPR1KzppTNfZ2Fu5zExxb9BuE8O/26VPPDHedoRkv
   lAreR+v/yF1f1jXH7PmWlshBSN7VfXCSW6AVFrP7jH16Bu7BF5klEvJi3
   TvMdFh/uEugaE7LQEO6a5yd/VTbh2HbWbCbP4bOe3a2P4JR1oADHAC8YF
   SFShnHDYBqIxQy4UqiP3PKk4A22Wq27iatLZLa0Hfu5vZSrhJGuQ2bp+S
   NNFEFUkOqyHhX01L9Dc0XiZQ/xwdhC6sDCW/xyP/IjgMMlep/NnQqY35c
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="232509022"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="232509022"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 09:10:20 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="506751292"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 09:10:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nNe5v-008H3v-Gx;
        Fri, 25 Feb 2022 19:09:27 +0200
Date:   Fri, 25 Feb 2022 19:09:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2 07/11] media: i2c: Add support for new frequencies to
 ov7251
Message-ID: <YhkNR7BhRAG2MjNm@smile.fi.intel.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-8-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225000753.511996-8-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 25, 2022 at 12:07:49AM +0000, Daniel Scally wrote:
> The OV7251 sensor is used as the IR camera sensor on the Microsoft
> Surface line of tablets; this provides a 19.2MHz external clock, and
> the Windows driver for this sensor configures a 319.2MHz link freq to
> the CSI-2 receiver. Add the ability to support those rate to the
> driver by defining a new set of PLL configs.

> +static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_240_mhz = {
> +	.pre_div = 0x03,
> +	.mult = 0x4b,
> +	.div = 0x01,
> +	.pix_div = 0x0a,
> +	.mipi_div = 0x05

+ Comma.

> +};
> +
> +static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
> +	.pre_div = 0x01,
> +	.mult = 0x85,
> +	.div = 0x04,
> +	.pix_div = 0x0a,
> +	.mipi_div = 0x05

Ditto.

> +};

...

> +static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_319_2_mhz = {
> +	.pre_div = 0x05,
> +	.mult = 0x85,
> +	.div = 0x02,
> +	.pix_div = 0x0a,
> +	.mipi_div = 0x05

Ditto.

> +};
> +
> +static const struct ov7251_pll2_cfg ov7251_pll2_cfg_19_2_mhz = {
> +	.pre_div = 0x04,
> +	.mult = 0x32,
> +	.div = 0x00,
> +	.sys_div = 0x05,
> +	.adc_div = 0x04

Ditto.

> +};

...

> +static const struct ov7251_pll_cfgs ov7251_pll_cfgs_19_2_mhz = {
> +	.pll2 = &ov7251_pll2_cfg_19_2_mhz,
> +	.pll1 = {
> +		[OV7251_LINK_FREQ_240_MHZ] = &ov7251_pll1_cfg_19_2_mhz_240_mhz,
> +		[OV7251_LINK_FREQ_319_2_MHZ] = &ov7251_pll1_cfg_19_2_mhz_319_2_mhz,
> +	}

Ditto.

> +};

...

>  	/* get system clock (xclk) */
> -	ov7251->xclk = devm_clk_get(dev, "xclk");
> +	ov7251->xclk = devm_clk_get(dev, NULL);

Why a clock doesn't have a name anymore?
Shouldn't you rather switch to _optional()?

>  	if (IS_ERR(ov7251->xclk)) {
>  		dev_err(dev, "could not get xclk");
>  		return PTR_ERR(ov7251->xclk);

This should be dev_err_probe().

>  	}

...

> +	/*
> +	 * We could have either a 24MHz or 19.2MHz clock rate from either dt or

DT

> +	 * ACPI. We also need to support the IPU3 case which will have both an
> +	 * external clock AND a clock-frequency property.

Why is that? Broken table?

> +	 */
>  	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> -				       &ov7251->xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "could not get xclk frequency\n");
> -		return ret;
> +				       &rate);
> +	if (!ret && ov7251->xclk) {
> +		ret = clk_set_rate(ov7251->xclk, rate);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to set clock rate\n");
> +	} else if (ret && !ov7251->xclk) {

Redundant 'else' if you test for error condition first.

> +		return dev_err_probe(dev, ret, "invalid clock config\n");
>  	}

-- 
With Best Regards,
Andy Shevchenko


