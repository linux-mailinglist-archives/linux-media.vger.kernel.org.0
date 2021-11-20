Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87254580D5
	for <lists+linux-media@lfdr.de>; Sat, 20 Nov 2021 23:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhKTWuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Nov 2021 17:50:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhKTWuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Nov 2021 17:50:06 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BCEC061574
        for <linux-media@vger.kernel.org>; Sat, 20 Nov 2021 14:47:02 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id t30so24912822wra.10
        for <linux-media@vger.kernel.org>; Sat, 20 Nov 2021 14:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PAb6FhgzdtrREYeSGE8YyaTFjwU1FQX7OCBeNtL00z0=;
        b=qE3Wr482QVCCww2lgyGpA0Twb/ZENV0wbeMtPchlNGc9bTLhZjcmedFza5DhyuMNKf
         jH48TbpdjYsZHh8mYGZwQvI19HDWNI+cv9dY9WYIlVU3g4QN27gmSe3KbDzjgWd4hQa6
         9dNZs4qOWG/VzV1sYUipv+2w4yKM3i/OCKF8o/Gd2vXCN4f3Dz+gBasUVFR3lHil4dwh
         QfvsjWAqxPgT66na4noIgCRaYd/fKaZt5yIecuKMzZcID7SQj//wsfM5Mk0oPggofJoI
         SBfzcnFD98Lct6QdH4wxslqhWvWghWDm3pfZi2Je6gO87n2Ue17R/XIqyaXn0d9lyyvk
         gE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PAb6FhgzdtrREYeSGE8YyaTFjwU1FQX7OCBeNtL00z0=;
        b=WfUZLn0W9CTe3DNtpvPkvYGZohbUZ7tUfd9U3Jfm8kCj2Dc+vbbJHkj5j1XNchfO0F
         DgMXjMJGV4aVx7Bv1c27/Z17PS6HXIhcqX5cMvGGEwK1BPwNCZ/EyutjkOGbkBQRh9FP
         0XX4gMs/X5qw28BH96aZ8OuwVX1ICVPRptx4dwX7FuYiy09DHmxGERuVt/za8bxwZV3l
         w678Q2MhKh6S9DpTvabukcT40an5m3+37nq1o1Alj60PueVyJA1n9FY+CX+xqraM3q2r
         9+VFAsboQROy8xtg/8GRp+7O0UYAKORXqVoQd9rj3z17dlSChRuEOgSlCi6jtUnVY2H0
         dcKQ==
X-Gm-Message-State: AOAM531/zobYXHPnwLeG+BdfSOGfo8ZVsKvuWApPcyKArxVMgXo9K9NP
        CC5Kg7rqWaOP3hbZMusVWZ8=
X-Google-Smtp-Source: ABdhPJwMevUDC5xXDdA2wrlwaMcnojGFvffiWzvNZxqvqJDPhxoKWVk1n9lX3wHuL/dPZhz+GDi0Sg==
X-Received: by 2002:adf:e882:: with SMTP id d2mr22343911wrm.389.1637448421369;
        Sat, 20 Nov 2021 14:47:01 -0800 (PST)
Received: from [192.168.0.16] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id n32sm21792267wms.1.2021.11.20.14.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Nov 2021 14:47:00 -0800 (PST)
Subject: Re: [PATCH v4 04/16] media: i2c: Support 19.2MHz input clock in
 ov8865
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
 <20211101001119.46056-5-djrscally@gmail.com>
 <YX//JqaiubPXeNey@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <4e87d0d0-3eed-e464-ce16-e64cf6d89ab9@gmail.com>
Date:   Sat, 20 Nov 2021 22:46:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YX//JqaiubPXeNey@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari - sorry, only just coming back to this series.

On 01/11/2021 14:52, Sakari Ailus wrote:
>> +static struct ov8865_pll_configs ov8865_pll_configs_19_2mhz = {
>> +	.pll1_config = &ov8865_pll1_config_native_19_2mhz,
>> +	.pll2_config_native = &ov8865_pll2_config_native_19_2mhz,
>> +	.pll2_config_binning = &ov8865_pll2_config_binning_19_2mhz,
>> +};
>> +
>> +static struct ov8865_pll_configs ov8865_pll_configs_24mhz = {
>> +	.pll1_config = &ov8865_pll1_config_native_24mhz,
>> +	.pll2_config_native = &ov8865_pll2_config_native_24mhz,
>> +	.pll2_config_binning = &ov8865_pll2_config_binning_24mhz,
>> +};
> 
> These should be const.

Done, thank you.


>> @@ -2858,13 +2917,38 @@ static int ov8865_probe(struct i2c_client *client)
>>  		goto error_endpoint;
>>  	}
>>  
>> -	rate = clk_get_rate(sensor->extclk);
>> -	if (rate != OV8865_EXTCLK_RATE) {
>> -		dev_err(dev, "clock rate %lu Hz is unsupported\n", rate);
>> +	/*
>> +	 * We could have either a 24MHz or 19.2MHz clock rate. Check for a
>> +	 * clock-frequency property and if found, set that rate. This should
>> +	 * cover the ACPI case. If the system uses devicetree then the
>> +	 * configured rate should already be set, so we'll have to check it.
>> +	 */
>> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>> +				       &rate);
>> +	if (!ret) {
>> +		ret = clk_set_rate(sensor->extclk, rate);
>> +		if (ret) {
>> +			dev_err(dev, "failed to set clock rate\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	sensor->extclk_rate = clk_get_rate(sensor->extclk);
> 
> clk_get_rate() returns 0 if you don't have a clock. But you can still have
> clock-frequency property that tells the frequency. This is generally the
> case on ACPI based systems apart from some exceptions (which I understand
> you're well aware of).
> 
> See e.g. drivers/media/i2c/ccs/ccs-core.c .

I'm checking the clock-frequency property above...that should be
sufficient here I think right?

>> +
>> +	for (i = 0; i < ARRAY_SIZE(supported_extclk_rates); i++) {
>> +		if (sensor->extclk_rate == supported_extclk_rates[i])
>> +			break;
>> +	}
>> +
>> +	if (i == ARRAY_SIZE(supported_extclk_rates)) {
>> +		dev_err(dev, "clock rate %lu Hz is unsupported\n",
>> +			sensor->extclk_rate);
>>  		ret = -EINVAL;
>>  		goto error_endpoint;
>>  	}
>>  
>> +	sensor->pll_configs = ov8865_pll_configs[i];
>> +
>>  	/* Subdev, entity and pad */
>>  
>>  	subdev = &sensor->subdev;
> 
