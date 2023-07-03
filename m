Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23907455AC
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 08:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbjGCG6P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 02:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjGCG6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 02:58:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9582AD1
        for <linux-media@vger.kernel.org>; Sun,  2 Jul 2023 23:58:10 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C886C512;
        Mon,  3 Jul 2023 08:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688367445;
        bh=9xYePQXJzcFlbM0ykc2GiRGv/hzJrce0EJ1CadJbYxU=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=thoOEcS+b+pkHh4wmFH2btcSiVROGlFGTqg8gzxVRVnwS/QK728WeLKN++KdadPUD
         gWsxlO8jLCK8CO/bIu57PbwHkCh5s0YHJa1VDCyR4Q3lUd67vtMYr+Qv61IQ6xmVhe
         HUsG2piipiFWVUXZe5CZKT8WebSD46rfZX8yyjJU=
Message-ID: <f8e73804-5d40-e9a4-d044-f13276613ca1@ideasonboard.com>
Date:   Mon, 3 Jul 2023 07:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-15-hdegoede@redhat.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v3 14/29] media: ov2680: Add support for more clk setups
In-Reply-To: <20230627131830.54601-15-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Morning Hans

On 27/06/2023 15:18, Hans de Goede wrote:
> On ACPI systems the following 2 scenarios are possible:
>
> 1. The xvclk is fully controlled by ACPI powermanagement, so there
>     is no "xvclk" for the driver to get (since it is abstracted away).
>     In this case there will be a "clock-frequency" device property
>     to tell the driver the xvclk rate.
>
> 2. There is a xvclk modelled in the clk framework for the driver,
>     but the clk-generator may not be set to the right frequency
>     yet. In this case there will also be a "clock-frequency" device
>     property and the driver is expected to set the rate of the xvclk
>     through this frequency through the clk framework.
>
> Handle both these scenarios by switching to devm_clk_get_optional()
> and checking for a "clock-frequency" device property.
>
> This is modelled after how the same issue was fixed for the ov8865 in
> commit 73dcffeb2ff9 ("media: i2c: Support 19.2MHz input clock in ov8865").
>
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/i2c/ov2680.c | 26 ++++++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index b7c23286700e..a6a83f0e53f3 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -698,6 +698,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>   {
>   	struct device *dev = sensor->dev;
>   	struct gpio_desc *gpio;
> +	unsigned int rate = 0;
>   	int ret;
>   
>   	/*
> @@ -718,13 +719,34 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>   
>   	sensor->pwdn_gpio = gpio;
>   
> -	sensor->xvclk = devm_clk_get(dev, "xvclk");
> +	sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
>   	if (IS_ERR(sensor->xvclk)) {
>   		dev_err(dev, "xvclk clock missing or invalid\n");
>   		return PTR_ERR(sensor->xvclk);
>   	}
>   
> -	sensor->xvclk_freq = clk_get_rate(sensor->xvclk);
> +	/*
> +	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
> +	 * ACPI... but we also need to support the weird IPU3 case which will
> +	 * have an external clock AND a clock-frequency property. Check for the
> +	 * clock-frequency property and if found, set that rate if we managed
> +	 * to acquire a clock. This should cover the ACPI case. If the system
> +	 * uses devicetree then the configured rate should already be set, so
> +	 * we can just read it.
> +	 */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +				       &rate);
> +	if (ret && !sensor->xvclk)
> +		return dev_err_probe(dev, ret, "invalid clock config\n");
> +
> +	if (!ret && sensor->xvclk) {
> +		ret = clk_set_rate(sensor->xvclk, rate);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to set clock rate\n");
> +	}
> +
> +	sensor->xvclk_freq = rate ?: clk_get_rate(sensor->xvclk);
>   	if (sensor->xvclk_freq != OV2680_XVCLK_VALUE) {
>   		dev_err(dev, "wrong xvclk frequency %d HZ, expected: %d Hz\n",
>   			sensor->xvclk_freq, OV2680_XVCLK_VALUE);
