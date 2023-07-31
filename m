Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A79C37696D4
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 14:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjGaMzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 08:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbjGaMzL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 08:55:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E4110DF
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690808061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rSP/Ig5pbgMlwr7HuNCn+SiRN9AqvgUkxYpFEjDqgeE=;
        b=iaMZp56sUikzrQUreW6xWbELWoJF9dN89CERwfPMCDrGmHlNSTlaYErT2eIFQbGTQzUAW2
        OvGV/TyW/q3XuM4SDzs/ZysMiDW2HW1zCN9KYIMhoItDbEvG4cWhn18ANpNj8Ov9k4F/xt
        lIMbO9yr/N7/9A+hIKS+2ZLuhjak5cw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-OrIv1H1jNhaP54Zgj_ckAw-1; Mon, 31 Jul 2023 08:54:16 -0400
X-MC-Unique: OrIv1H1jNhaP54Zgj_ckAw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4fe3a1e0329so719154e87.3
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 05:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690808055; x=1691412855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rSP/Ig5pbgMlwr7HuNCn+SiRN9AqvgUkxYpFEjDqgeE=;
        b=dFnsuc5ctM0FbD+y8PM57SgCY4BhEJqCMzgmbzcU1y+/SoUfHPykN9RXQaly3zY2wd
         nDcWjzZT8OERfEJp69CO5zKvrxgdjBJTXk0zjm8UUGN9FXNN1kQ+aiDfe5VvrL3ImBw4
         9vNry873ZSzx0Elu1WerT+ApRBh78N5bmdtIpKAdyZd8po2jBgunL5hlUOFIKgb3F0DC
         Lre+nFM20b8wg+BAim8ZjkDpuBM4JGIIB5hP6LBeQ5Px+JyA2mmLNUPmVrrSiN22WuE2
         Jt1xp6ycCJhUP0I6kCzKuMG+e4O7Ki+cxeMWfouB/AkxoiVomB6cO5EbCXkjCO3rIiWc
         4Pjw==
X-Gm-Message-State: ABy/qLZTM5aO0fcYiIABsawBdcc63bQy64+hSCwcgn49Z4Q6+2IdpUAB
        krkQprxVXkEfvVZWMZek2uF60bNiu3vNA7nGuBms/MQ0hHmK5uYSUFxxJylmDCiMSVwlfHPX8VY
        a79uctz7A9VuX0u+ETtBN1EM=
X-Received: by 2002:a05:6512:201b:b0:4fd:fadb:e6e4 with SMTP id a27-20020a056512201b00b004fdfadbe6e4mr5196811lfb.69.1690808055258;
        Mon, 31 Jul 2023 05:54:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFMubXt2hs1ljiMSxjKjn+IKDkMrtPnietReqCHymR7cBFPLo4PzW4GsCneZFONMo9vraBPYg==
X-Received: by 2002:a05:6512:201b:b0:4fd:fadb:e6e4 with SMTP id a27-20020a056512201b00b004fdfadbe6e4mr5196797lfb.69.1690808054890;
        Mon, 31 Jul 2023 05:54:14 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i9-20020aa7c9c9000000b00522bfd930dcsm2132102edt.33.2023.07.31.05.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 05:54:14 -0700 (PDT)
Message-ID: <2593f770-dca5-c368-7776-a2b938fbd09e@redhat.com>
Date:   Mon, 31 Jul 2023 14:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 14/29] media: ov2680: Add support for more clk setups
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-15-hdegoede@redhat.com>
 <ZMesmcoad6ez8kst@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZMesmcoad6ez8kst@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/31/23 14:44, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Jun 27, 2023 at 03:18:15PM +0200, Hans de Goede wrote:
>> On ACPI systems the following 2 scenarios are possible:
>>
>> 1. The xvclk is fully controlled by ACPI powermanagement, so there
>>    is no "xvclk" for the driver to get (since it is abstracted away).
>>    In this case there will be a "clock-frequency" device property
>>    to tell the driver the xvclk rate.
>>
>> 2. There is a xvclk modelled in the clk framework for the driver,
>>    but the clk-generator may not be set to the right frequency
>>    yet. In this case there will also be a "clock-frequency" device
>>    property and the driver is expected to set the rate of the xvclk
>>    through this frequency through the clk framework.
>>
>> Handle both these scenarios by switching to devm_clk_get_optional()
>> and checking for a "clock-frequency" device property.
>>
>> This is modelled after how the same issue was fixed for the ov8865 in
>> commit 73dcffeb2ff9 ("media: i2c: Support 19.2MHz input clock in ov8865").
>>
>> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov2680.c | 26 ++++++++++++++++++++++++--
>>  1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>> index b7c23286700e..a6a83f0e53f3 100644
>> --- a/drivers/media/i2c/ov2680.c
>> +++ b/drivers/media/i2c/ov2680.c
>> @@ -698,6 +698,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>>  {
>>  	struct device *dev = sensor->dev;
>>  	struct gpio_desc *gpio;
>> +	unsigned int rate = 0;
>>  	int ret;
>>  
>>  	/*
>> @@ -718,13 +719,34 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>>  
>>  	sensor->pwdn_gpio = gpio;
>>  
>> -	sensor->xvclk = devm_clk_get(dev, "xvclk");
>> +	sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
>>  	if (IS_ERR(sensor->xvclk)) {
>>  		dev_err(dev, "xvclk clock missing or invalid\n");
>>  		return PTR_ERR(sensor->xvclk);
>>  	}
>>  
>> -	sensor->xvclk_freq = clk_get_rate(sensor->xvclk);
>> +	/*
>> +	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
>> +	 * ACPI... but we also need to support the weird IPU3 case which will
>> +	 * have an external clock AND a clock-frequency property. Check for the
> 
> Where does this happen? This puts the driver in an awful situation. :-(

This happens on IPU3 setups where the INT3472 device represents an actual
i2c attached sensor PMIC (rather then just some GPIOs) in this case
there is a clk generator inside the PMIC which is used and that is programmable,
so the driver needs to set the clk-rate.

Note this patch is pretty much a 1:1 copy of the same patch for the ov8865
and ov7251 drivers.

I guess it might be good to start a discussion about doing this more
elegantly but that seems out of scope for this series.

Regards,

Hans





> 
>> +	 * clock-frequency property and if found, set that rate if we managed
>> +	 * to acquire a clock. This should cover the ACPI case. If the system
>> +	 * uses devicetree then the configured rate should already be set, so
>> +	 * we can just read it.
>> +	 */
>> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>> +				       &rate);
>> +	if (ret && !sensor->xvclk)
>> +		return dev_err_probe(dev, ret, "invalid clock config\n");
>> +
>> +	if (!ret && sensor->xvclk) {
>> +		ret = clk_set_rate(sensor->xvclk, rate);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret,
>> +					     "failed to set clock rate\n");
>> +	}
>> +
>> +	sensor->xvclk_freq = rate ?: clk_get_rate(sensor->xvclk);
>>  	if (sensor->xvclk_freq != OV2680_XVCLK_VALUE) {
>>  		dev_err(dev, "wrong xvclk frequency %d HZ, expected: %d Hz\n",
>>  			sensor->xvclk_freq, OV2680_XVCLK_VALUE);
> 

