Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C2B4C5129
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 23:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbiBYWFG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 17:05:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiBYWFE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 17:05:04 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CFE19F468
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 14:04:31 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id b5so6449887wrr.2
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 14:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yoBErYJenVo9A6ulfKWt+geECm37vhvFnF1sMgsnLiE=;
        b=p8VSStKv1jeQJcTtqJF/4e9MeZ0dPHGl276DQNL5Ngvi9yOMzkzVDGrXxN9vRp5GT+
         3RZEKy6/v6vB6AJdrmar2pPmoM7empfiVDE5vlcpRdycWtdX3fT6+Yk8nCJ2NpCFQ6Je
         wbEVDIZpU1yjhLcRDYLjXsP+s1CMWujiFmqxM7KcgDwx+WcNT4sDC/+aJKty85pU2go7
         9tZxwhNsVVGPcc+SvzxdnN/EFPjKC95VSXRZZ1EnEKsWflNStCZWfK5sOsrVDGAtGJV5
         Q0KePrdXepX5SInrjTI0HYPtca4bLiGjWG0862DIkip+c6lLvdpLHdvHVShIgiU2q7TP
         2MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yoBErYJenVo9A6ulfKWt+geECm37vhvFnF1sMgsnLiE=;
        b=CvRhjfWr8ky39NcqVE3o0N51i0mc2XLk+qUcfNHpdgkgu2ci/j3vI5VjTHT2T/gWsN
         IaBqSaGbTdq+8pAQTyXl63GFL6tsarYrpxgP4OEiz4btQh7xD7M1mlrq16NOKgtxap5Q
         echLpgY5gLHxrASUANNoOja8kaoFnXdJlIJkVt9B6Stw90nj9aw3q8ZB+8cugCf1KrKH
         qA/TBSwqi7mNOPYqDoCfHbBV5u/SZVSHqTLEKkSaegP/zEKXt3rqgKOLprkquRl6Lqwk
         RkOwsFPhbY2WLNc4ffZXe5npLpsq9WZz4grajEe/eH8dgO1I+Jt/xS6EiY+Zuvi0d3cE
         Hubw==
X-Gm-Message-State: AOAM532JNbu5ocbeZsUMaNRNcpwi+NDNg3rhEXK3pWRwt4BcDvCoBKEx
        bVNRAIgu065dz7Sp4WgUHa0=
X-Google-Smtp-Source: ABdhPJxK1k/CjUzCXs+0iMmKu8cICMz74uGkDd2GLULiEIjUVSQ9M6Yv4EDfk+AKFVrX9SQqdCPXCg==
X-Received: by 2002:a5d:5255:0:b0:1ed:f971:5497 with SMTP id k21-20020a5d5255000000b001edf9715497mr6772756wrc.528.1645826670483;
        Fri, 25 Feb 2022 14:04:30 -0800 (PST)
Received: from [192.168.0.30] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id f18-20020a5d6652000000b001e669ebd528sm3277127wrw.91.2022.02.25.14.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 14:04:30 -0800 (PST)
Message-ID: <03c68a99-c9ff-7cdf-e5d7-2c52657e5d9f@gmail.com>
Date:   Fri, 25 Feb 2022 22:04:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 07/11] media: i2c: Add support for new frequencies to
 ov7251
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-8-djrscally@gmail.com>
 <YhkNR7BhRAG2MjNm@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <YhkNR7BhRAG2MjNm@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 25/02/2022 17:09, Andy Shevchenko wrote:
> On Fri, Feb 25, 2022 at 12:07:49AM +0000, Daniel Scally wrote:
>> The OV7251 sensor is used as the IR camera sensor on the Microsoft
>> Surface line of tablets; this provides a 19.2MHz external clock, and
>> the Windows driver for this sensor configures a 319.2MHz link freq to
>> the CSI-2 receiver. Add the ability to support those rate to the
>> driver by defining a new set of PLL configs.
>> +static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_240_mhz = {
>> +	.pre_div = 0x03,
>> +	.mult = 0x4b,
>> +	.div = 0x01,
>> +	.pix_div = 0x0a,
>> +	.mipi_div = 0x05
> + Comma.
>
>> +};
>> +
>> +static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
>> +	.pre_div = 0x01,
>> +	.mult = 0x85,
>> +	.div = 0x04,
>> +	.pix_div = 0x0a,
>> +	.mipi_div = 0x05
> Ditto.
>
>> +};
> ...
>
>> +static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_319_2_mhz = {
>> +	.pre_div = 0x05,
>> +	.mult = 0x85,
>> +	.div = 0x02,
>> +	.pix_div = 0x0a,
>> +	.mipi_div = 0x05
> Ditto.
>
>> +};
>> +
>> +static const struct ov7251_pll2_cfg ov7251_pll2_cfg_19_2_mhz = {
>> +	.pre_div = 0x04,
>> +	.mult = 0x32,
>> +	.div = 0x00,
>> +	.sys_div = 0x05,
>> +	.adc_div = 0x04
> Ditto.
>
>> +};
> ...
>
>> +static const struct ov7251_pll_cfgs ov7251_pll_cfgs_19_2_mhz = {
>> +	.pll2 = &ov7251_pll2_cfg_19_2_mhz,
>> +	.pll1 = {
>> +		[OV7251_LINK_FREQ_240_MHZ] = &ov7251_pll1_cfg_19_2_mhz_240_mhz,
>> +		[OV7251_LINK_FREQ_319_2_MHZ] = &ov7251_pll1_cfg_19_2_mhz_319_2_mhz,
>> +	}
> Ditto.
>
>> +};
> ...
>
>>   	/* get system clock (xclk) */
>> -	ov7251->xclk = devm_clk_get(dev, "xclk");
>> +	ov7251->xclk = devm_clk_get(dev, NULL);
> Why a clock doesn't have a name anymore?
> Shouldn't you rather switch to _optional()?


The problem is since we could have a the clock coming from some dt file 
with it named xclk, as this driver is obviously designed for, but it 
also can be created by the int3472-tps68470 or int3472-discrete drivers 
which don't use that name. Without knowing what it's called, best thing 
I could think to do was remove the name and rely on device matching.

>
>>   	if (IS_ERR(ov7251->xclk)) {
>>   		dev_err(dev, "could not get xclk");
>>   		return PTR_ERR(ov7251->xclk);
> This should be dev_err_probe().


Yep

>
>>   	}
> ...
>
>> +	/*
>> +	 * We could have either a 24MHz or 19.2MHz clock rate from either dt or
> DT
>
>> +	 * ACPI. We also need to support the IPU3 case which will have both an
>> +	 * external clock AND a clock-frequency property.
> Why is that? Broken table?


Broken ACPI compensated for by the cio2-bridge - it creates the 
clock-frequency property which ordinarily wouldn't be there on ACPI 
systems AIUI.

>
>> +	 */
>>   	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>> -				       &ov7251->xclk_freq);
>> -	if (ret) {
>> -		dev_err(dev, "could not get xclk frequency\n");
>> -		return ret;
>> +				       &rate);
>> +	if (!ret && ov7251->xclk) {
>> +		ret = clk_set_rate(ov7251->xclk, rate);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret,
>> +					     "failed to set clock rate\n");
>> +	} else if (ret && !ov7251->xclk) {
> Redundant 'else' if you test for error condition first.


Ah yes, ok thanks.

>
>> +		return dev_err_probe(dev, ret, "invalid clock config\n");
>>   	}
