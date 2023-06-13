Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A68BC72E127
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 13:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235152AbjFMLUr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 07:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241780AbjFMLTH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 07:19:07 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F589294C;
        Tue, 13 Jun 2023 04:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686655056; x=1718191056;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=nv36s9PsuvVj4NH4vGNtZglB8PdYZFfc+949dgKyhQs=;
  b=DDvFoiysiw0amImZM0K1uj/1ULjeilsSM6rTBdgJU/D8Kg0UPo7qolDr
   8rcRbpk+ale8xAN3LFZky76gafLAkEIiF9B7Gfq7IOfs/4ftKxSO9ALjv
   YnfAoG68zAKjLm5EVSd8+lUJuS5Y3hzICN3NDX2ByagAUpXlaNuUDbTDx
   XzszeO+iQHUYBSurRirvJrLIyRV0ddRKR65FF2XLMIK78ElH89o15aLT3
   OuRlnDJEfrPQ1FVpO/+g0sgOQ/3v+0avsj0ved5pXgiAYL0eaiH7m9fhz
   bAWlNLEAUUNfEer5wziuy+VOnJ6qHBiq/FqVCFOzq0uSY8VxVmYH8J0eY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="355798371"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="355798371"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 04:17:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="781620757"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="781620757"
Received: from abujor-mobl.ger.corp.intel.com ([10.249.44.113])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 04:17:34 -0700
Date:   Tue, 13 Jun 2023 14:17:31 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Andy Shevchenko <andy@kernel.org>,
        Dan Scally <dan.scally@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: int3472: discrete: Log a warning if
 the pin-numbers don't match
In-Reply-To: <20230613110810.240193-2-hdegoede@redhat.com>
Message-ID: <c821a4e0-ff2f-1b8d-a0fa-aadc9c541b6f@linux.intel.com>
References: <20230613110810.240193-1-hdegoede@redhat.com> <20230613110810.240193-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1050445301-1686655010=:2099"
Content-ID: <67e03eb-54cb-cf8-abc-27c699c8c143@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1050445301-1686655010=:2099
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <a45d97bf-ccc8-147d-bd46-c84c4c3976b3@linux.intel.com>

On Tue, 13 Jun 2023, Hans de Goede wrote:

> The INT3472 discrete code assumes that the ACPI GPIO resources are
> in the same order as the pin-info _DSM entries.
> 
> The returned pin-info includes the pin-number in bits 15-8. Add a check
> that this matches with the ACPI GPIO resource pin-number in case
> the assumption is not true with some ACPI tables.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index a31964076883..850f306214c7 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -154,8 +154,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  {
>  	struct int3472_discrete_device *int3472 = data;
>  	struct acpi_resource_gpio *agpio;
> +	u8 active_value, pin, type;
>  	union acpi_object *obj;
> -	u8 active_value, type;
>  	const char *err_msg;
>  	const char *func;
>  	u32 polarity;
> @@ -183,6 +183,12 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  	int3472_get_func_and_polarity(type, &func, &polarity);
>  
> +	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
> +	if (pin != agpio->pin_table[0])
> +		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
> +			 func, agpio->resource_source.string_ptr, pin,
> +			 agpio->pin_table[0]);
> +
>  	active_value = FIELD_GET(INT3472_GPIO_DSM_SENSOR_ON_VAL, obj->integer.value);
>  	if (!active_value)
>  		polarity ^= GPIO_ACTIVE_LOW;

For both 1 and 2,

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>


--
 i.
--8323329-1050445301-1686655010=:2099--
