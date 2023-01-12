Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9056671BE
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 13:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbjALML6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 07:11:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjALMLe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 07:11:34 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC1E3A4;
        Thu, 12 Jan 2023 04:06:49 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311510198"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="311510198"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 04:06:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="659765312"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="659765312"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jan 2023 04:06:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pFwM0-0082Dt-0E;
        Thu, 12 Jan 2023 14:06:44 +0200
Date:   Thu, 12 Jan 2023 14:06:43 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] platform/x86: int3472/discrete: Ensure the clk/power
 enable pins are in output mode
Message-ID: <Y7/30zGP5FRKTaqE@smile.fi.intel.com>
References: <20230111201426.947853-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111201426.947853-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 11, 2023 at 09:14:26PM +0100, Hans de Goede wrote:
> acpi_get_and_request_gpiod() does not take a gpio_lookup_flags argument
> specifying that the pins direction should be initialized to a specific
> value.
> 
> This means that in some cases the pins might be left in input mode, causing
> the gpiod_set() calls made to enable the clk / regulator to not work.
> 
> One example of this problem is the clk-enable GPIO for the ov01a1s sensor
> on a Dell Latitude 9420 being left in input mode causing the clk to
> never get enabled.
> 
> Explicitly set the direction of the pins to output to fix this.

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
thanks!

> Fixes: 5de691bffe57 ("platform/x86: Add intel_skl_int3472 driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - Split out of the "int3472/media privacy LED support" series, so
>   that this can be applied separately as it really is a bug-fix
> ---
>  drivers/platform/x86/intel/int3472/clk_and_regulator.c | 3 +++
>  drivers/platform/x86/intel/int3472/discrete.c          | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index b2342b3d78c7..74dc2cff799e 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -181,6 +181,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  		return PTR_ERR(int3472->regulator.gpio);
>  	}
>  
> +	/* Ensure the pin is in output mode and non-active state */
> +	gpiod_direction_output(int3472->regulator.gpio, 0);
> +
>  	cfg.dev = &int3472->adev->dev;
>  	cfg.init_data = &init_data;
>  	cfg.ena_gpiod = int3472->regulator.gpio;
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 974a132db651..c42c3faa2c32 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -168,6 +168,8 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
>  			return (PTR_ERR(gpio));
>  
>  		int3472->clock.ena_gpio = gpio;
> +		/* Ensure the pin is in output mode and non-active state */
> +		gpiod_direction_output(int3472->clock.ena_gpio, 0);
>  		break;
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
>  		gpio = acpi_get_and_request_gpiod(path, pin, "int3472,privacy-led");
> @@ -175,6 +177,8 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
>  			return (PTR_ERR(gpio));
>  
>  		int3472->clock.led_gpio = gpio;
> +		/* Ensure the pin is in output mode and non-active state */
> +		gpiod_direction_output(int3472->clock.led_gpio, 0);
>  		break;
>  	default:
>  		dev_err(int3472->dev, "Invalid GPIO type 0x%02x for clock\n", type);
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


