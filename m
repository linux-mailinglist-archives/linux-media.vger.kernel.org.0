Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 727AF733C27
	for <lists+linux-media@lfdr.de>; Sat, 17 Jun 2023 00:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345712AbjFPWOd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 18:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345724AbjFPWO3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 18:14:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA4D1FF5;
        Fri, 16 Jun 2023 15:14:27 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DAB08E1;
        Sat, 17 Jun 2023 00:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686953632;
        bh=3xCPeWHH0cBffVrsIuImdGBvDgV44XrHQG/XTlLrZt0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=XA+31oBdOM+FBraru2ZCvLhyzsuEh7iijr+iZnDny7Jpcl9YAV/3qCcGkA0ZI4flF
         kkRb2Vfg4iy+SQb6sOVT/flT1R8Nz12YdYszsxtIbUHhPTIo3FxF55hnxEC2Er4WJv
         N3Lx0QLy9x7qncQv1DDgMEvkIZkKmurQjGpbVmg8=
Message-ID: <d1ec42e1-530a-ed13-7056-cce5ca423626@ideasonboard.com>
Date:   Fri, 16 Jun 2023 23:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/6] platform/x86: int3472: discrete: Add alternative
 "AVDD" regulator supply name
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Hao Yao <hao.yao@intel.com>
References: <20230616172132.37859-1-hdegoede@redhat.com>
 <20230616172132.37859-5-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230616172132.37859-5-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 16/06/2023 18:21, Hans de Goede wrote:
> Add an "AVDD" regulator supply name alias to the supply-map which
> gets registered for the INT3472 GPIO regulator.
>
> This is necessary for the ov2680 driver which expects "AVDD" rather then
> "avdd". Updating the ov2680 driver to use "avdd" is not possible because
> that will break compatibility with existing DT / DTB files.
>
> Tested-by: Hao Yao <hao.yao@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/platform/x86/intel/int3472/clk_and_regulator.c | 1 +
>   drivers/platform/x86/intel/int3472/common.h            | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index a5c60b86f5de..61aeca804ba2 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -248,6 +248,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
>    */
>   static const char * const skl_int3472_regulator_map_supplies[] = {
>   	"avdd",
> +	"AVDD",
>   };
>   
>   static_assert(ARRAY_SIZE(skl_int3472_regulator_map_supplies) ==
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index fd2a3d3884fa..9f29baa13860 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -28,7 +28,7 @@
>   
>   #define GPIO_REGULATOR_NAME_LENGTH				21
>   #define GPIO_REGULATOR_SUPPLY_NAME_LENGTH			9
> -#define GPIO_REGULATOR_SUPPLY_MAP_COUNT				1
> +#define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
>   
>   #define INT3472_LED_MAX_NAME_LEN				32
>   
