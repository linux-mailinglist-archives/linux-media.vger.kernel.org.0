Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8850172DC13
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 10:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238909AbjFMIK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 04:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235447AbjFMIK4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 04:10:56 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB91FE4E;
        Tue, 13 Jun 2023 01:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686643854; x=1718179854;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=m1Rk6YnaVEg3/LvTCv6Jv04yIkKnjKWMBNr+EyDl4Ag=;
  b=NlFI9EOSV+wva7/aY03nQXZ78YUUyUEtAGtLgDZw+cSLoSiw7cZuu+l4
   PBwxqjqwikRulGj4LfjjlvFi454ODNxVPaHWU3MqDzpKVBJQIxPPzV9An
   dHFWR0nyH/KqNkr4mt6dp0y3YBDQ4WTNz8HTOW4971OH+NJsKzLcS6pBO
   QGMlT7uDvKbeEsB+n02nFjXBQfgJsA2JpAIp3etT7YOChthE2pQc0IJqu
   +tvVVzJhhiRvKiV81LhOOw2mYG4GZLp6Q4WLEpv9wr3Cz2ZGanOyKwPwS
   XWePzzGjuIjGfl35fM/Y32Y6rhb7agPZE5dT6TsHpeKmpz3ahqyRXySeh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342952157"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="342952157"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 01:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="776718645"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="776718645"
Received: from abujor-mobl.ger.corp.intel.com ([10.249.44.113])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 01:10:51 -0700
Date:   Tue, 13 Jun 2023 11:10:22 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Andy Shevchenko <andy@kernel.org>,
        Dan Scally <dan.scally@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: int3472: discrete: Log a warning if
 the pin-numbers don't match
In-Reply-To: <20230612141632.5232-2-hdegoede@redhat.com>
Message-ID: <1b87ee9f-8de8-6923-111d-a9d889451d80@linux.intel.com>
References: <20230612141632.5232-1-hdegoede@redhat.com> <20230612141632.5232-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 12 Jun 2023, Hans de Goede wrote:

> The INT3472 discrete code assumes that the ACPI GPIO resources are
> in the same order as the pin-info _DSM entries.
> 
> The returned pin-info includes the pin-number in bits 15-8. Add a check
> that this matches with the ACPI GPIO resource pin-number in case
> the assumption is not true with some ACPI tables.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 4ef60883154d..c1132bbbff41 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -149,8 +149,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  {
>  	struct int3472_discrete_device *int3472 = data;
>  	struct acpi_resource_gpio *agpio;
> +	u8 active_value, pin, type;
>  	union acpi_object *obj;
> -	u8 active_value, type;
>  	const char *err_msg;
>  	const char *func;
>  	u32 polarity;
> @@ -174,10 +174,18 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  		return 1;
>  	}
>  
> +	/* Bits 7-0 contain the type/function of the pin */
>  	type = obj->integer.value & 0xff;
>  
>  	int3472_get_func_and_polarity(type, &func, &polarity);
>  
> +	/* Bits 15-8 contain the pin-number on the GPIO chip */
> +	pin = (obj->integer.value >> 8) & 0xff;
> +	if (pin != agpio->pin_table[0])
> +		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
> +			 func, agpio->resource_source.string_ptr, pin,
> +			 agpio->pin_table[0]);
> +
>  	/* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
>  	active_value = (obj->integer.value >> 24) & 0xff;
>  	if (!active_value)
> 

These changes made me wonder why there aren't defines for the fields? 
And then FIELD_GET() used to read the field. Most of those comments 
would be documented by the define name itself.

-- 
 i.

