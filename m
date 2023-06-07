Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83446726EAC
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 22:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235293AbjFGUv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 16:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235241AbjFGUvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 16:51:50 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5721FE2
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 13:51:46 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336733031"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="336733031"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 13:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="1039835045"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="1039835045"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2023 13:51:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q707q-00206O-2Y;
        Wed, 07 Jun 2023 23:51:26 +0300
Date:   Wed, 7 Jun 2023 23:51:26 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 14/28] media: ov2680: Add support for more clk setups
Message-ID: <ZIDtzsKuXvvQDMqs@smile.fi.intel.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-15-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607164712.63579-15-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 07, 2023 at 06:46:58PM +0200, Hans de Goede wrote:
> On ACPI systems the following 2 scenarios are possible:
> 
> 1. The xvclk is fully controlled by ACPI powermanagement, so there
>    is no "xvclk" for the driver to get (since it is abstracted away).
>    In this case there will be a "clock-frequency" device property
>    to tell the driver the xvclk rate.
> 
> 2. There is a xvclk modelled in the clk framework for the driver,
>    but the clk-generator may not be set to the right frequency
>    yet. In this case there will also be a "clock-frequency" device
>    property and the driver is expected to set the rate of the xvclk
>    through this frequency through the clk framework.
> 
> Handle both these scenarios by switching to devm_clk_get_optional()
> and checking for a "clock-frequency" device property.
> 
> This is modelled after how this same issues was fixed for the ov8865 in

this --> the

> commit 73dcffeb2ff9 ("media: i2c: Support 19.2MHz input clock in ov8865").

...

> +	/*
> +	 * We could have either a 24MHz or 19.2MHz clock rate from either dt or

DT

> +	 * ACPI...but we also need to support the weird IPU3 case which will

ACPI... but

> +	 * have an external clock AND a clock-frequency property. Check for the
> +	 * clock-frequency property and if found, set that rate if we managed
> +	 * to acquire a clock. This should cover the ACPI case. If the system
> +	 * uses devicetree then the configured rate should already be set, so
> +	 * we can just read it.
> +	 */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &rate);

	if (ret && !sensor->xvclk)
		return dev_err_probe(dev, ret, "invalid clock config\n");

('else' is redundant)

> +	if (!ret && sensor->xvclk) {
> +		ret = clk_set_rate(sensor->xvclk, rate);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to set clock rate\n");
> +	} else if (ret && !sensor->xvclk) {
> +		return dev_err_probe(dev, ret, "invalid clock config\n");
> +	}

...

> +	sensor->xvclk_freq = rate ? rate : clk_get_rate(sensor->xvclk);

Elvis can be used:

	sensor->xvclk_freq = rate ?: clk_get_rate(sensor->xvclk);

-- 
With Best Regards,
Andy Shevchenko


