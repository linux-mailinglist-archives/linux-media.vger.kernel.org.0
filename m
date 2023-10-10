Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9CC7BF3FD
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 09:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442444AbjJJHU6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 03:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442441AbjJJHU5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 03:20:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEBFCEB;
        Tue, 10 Oct 2023 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696922456; x=1728458456;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=YyHQz7qyK+sC3CxsWjcLVyT5duvUIhENeNDxvSGX4B0=;
  b=UVBscdsIAthyLsGO7uD53RUdjzTzj+sQpQqfsL9t2GuHmcbryHu5iDQS
   6Ry2OnGEZ2GbXWnkJpeAwYGJFvAHhvLVqsz/59VpTuH9W93FUlVpgiLnK
   TibOPXX3gxGZ/mE2z1RexhVjSOR/2IEX+0kFb/86RtZG/2+2vxgW0GSw3
   syDcaB7tYcAKco+DJuUqbpuRpxtK/mUoXzfgYu/MBtY/C31ehkjr+IXwa
   kb399ToiOjK9zO0cTkrfpwurEk4eKojxzKZBVdYEXJEcx5TMVD5QQ7ry3
   7eS7BWMsfgfhT1BdGC7esn29vCgfunENmdQRyye/Oamzkchzq+gCVQUCH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="364622730"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="364622730"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 00:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="746972315"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="746972315"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga007.jf.intel.com with ESMTP; 10 Oct 2023 00:20:52 -0700
Subject: Re: [PATCH] platform/x86: int3472: Add handshake GPIO function
To:     Hao Yao <hao.yao@intel.com>,
        Dan Scally <dan.scally@ideasonboard.com>, djrscally@gmail.com,
        Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20231007021225.9240-1-hao.yao@intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <38c9ff1c-8d3b-8675-9780-2bb6c87ba815@linux.intel.com>
Date:   Tue, 10 Oct 2023 15:17:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20231007021225.9240-1-hao.yao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hao, 

On 10/7/23 10:12 AM, Hao Yao wrote:
> Handshake pin is used for Lattice MIPI aggregator to enable the
> camera sensor. After pulled up, recommend to wail ~250ms to get
> everything ready.

Is the delay for specific camera or requirement from Lattice.
250ms is bad for camera.

> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/x86/intel/int3472/common.h   | 1 +
>  drivers/platform/x86/intel/int3472/discrete.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 655ae3ec0593..3ad4c72afb45 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -23,6 +23,7 @@
>  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> +#define INT3472_GPIO_TYPE_HANDSHAKE				0x12
>  
>  #define INT3472_PDEV_MAX_NAME_LEN				23
>  #define INT3472_MAX_SENSOR_GPIOS				3
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index b644ce65c990..4753161b4080 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -111,6 +111,10 @@ static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polar
>  		*func = "power-enable";
>  		*polarity = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_HANDSHAKE:
> +		*func = "handshake";
> +		*polarity = GPIO_ACTIVE_HIGH;
> +		break;
>  	default:
>  		*func = "unknown";
>  		*polarity = GPIO_ACTIVE_HIGH;
> @@ -201,6 +205,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	switch (type) {
>  	case INT3472_GPIO_TYPE_RESET:
>  	case INT3472_GPIO_TYPE_POWERDOWN:
> +	case INT3472_GPIO_TYPE_HANDSHAKE:
>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
>  		if (ret)
>  			err_msg = "Failed to map GPIO pin to sensor\n";
> 

-- 
Best regards,
Bingbu Cao
