Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F78C40312B
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 00:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345710AbhIGWpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 18:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbhIGWpX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Sep 2021 18:45:23 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D6DC061575
        for <linux-media@vger.kernel.org>; Tue,  7 Sep 2021 15:44:15 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id n7-20020a05600c3b8700b002f8ca941d89so87285wms.2
        for <linux-media@vger.kernel.org>; Tue, 07 Sep 2021 15:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=14eWcdo4ahHMkDTDEHqDyUI0FGyIoQKZxiIenkW0axc=;
        b=ff0w1o/ZvxhzvnF6IigIv5Fv4qM5wX39l8bCu3yb5NOtIRunE3PhSdhx4bqQSPqUA6
         1djFnEqdmyPYVFtpFtreDfWk0eti9yFdCTaElKd3xWM7EPaeXTaus++8UsbOVOeoNiYH
         WST9bao1BspZ9qkuuwxb3GZNEg2wCQ3XPpBlFtpZ+LyHZjjZLuD1UY523ZufrCDbjv73
         gOieJc+O6oLv6T/olEQ5K/ngypc1YP7DNWMZ0/6yCXy4Hc1I/+IH0OBvNWohAAEPQXrJ
         jtvv65oM+D1q7M5pMldhDlTzjU/8mzxxDkXXmCAMOFir15vGSZuat8VJPdRak3LEfFTH
         OvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=14eWcdo4ahHMkDTDEHqDyUI0FGyIoQKZxiIenkW0axc=;
        b=olwT2uzu4trIfyAJQoQnwkPGr4Gt6eluIzFLyGguimFPu8dw8yyZBAjLZxZnIZM4U/
         P52KLWXUnBP6JS41vq6pV6yVbciArAecTcrhVPcDu/1gnAKTmAH46p/O4aWGIql7g/Kk
         JNLa3Lr9obDq1dQBT6s3VL6ZPmeHIgjPq6ozvFtyib90o1HhvtIiWGV8lXCUTKE5qEni
         be4N9ialtZ4ZyiK3kRdPjKTMiPKMYFhU3rQlHe/b35yNJPfouXun33nqMcPe+vOOfzsx
         28KpZ4dDK7wuCGElEYKsbdN3mxoHlu7CLmuQRCfvnXknyLJ7k7UKchtDu7YX4O40mUd4
         1Wug==
X-Gm-Message-State: AOAM5328GBC7eG+1vtPgJt9QmsuicYvqaTxgwtaAXxd5Zp2Sd6Yvh5ta
        EN2FNjcflPJN6z4Cfe5c35U=
X-Google-Smtp-Source: ABdhPJxwuEwN4gFT4jZfWOXdywr7P+JfW0LsVW+UtWOWBBaom4reC2WsQd6xlEKPbNb6EL20R40ccw==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr483033wml.127.1631054654035;
        Tue, 07 Sep 2021 15:44:14 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id p5sm318223wrd.25.2021.09.07.15.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 15:44:13 -0700 (PDT)
Subject: Re: [PATCH v2 04/12] media: i2c: Support 19.2MHz input clock in
 ov8865
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-5-djrscally@gmail.com>
 <20210810133426.GB3@paasikivi.fi.intel.com>
 <711e4f6d-f539-0a69-fe78-d5e32eecb673@gmail.com>
 <20210810214918.GL3@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <ad1de4f2-dd07-9214-6e28-98cc421377b6@gmail.com>
Date:   Tue, 7 Sep 2021 23:44:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810214918.GL3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 10/08/2021 22:49, Sakari Ailus wrote:
> On Tue, Aug 10, 2021 at 10:37:35PM +0100, Daniel Scally wrote:
>> Hi Sakari - thanks for all the comments
> You're welcome!
>
> Nice patches btw.


Thanks!

>
>> On 10/08/2021 14:34, Sakari Ailus wrote:
>>> Hi Daniel,
>>>
>>> Thanks for the set.
>>>
>>> On Mon, Aug 09, 2021 at 11:58:37PM +0100, Daniel Scally wrote:
>>>> The ov8865 driver as written expects a 24MHz input clock, but the sensor
>>>> is sometimes found on x86 platforms with a 19.2MHz input clock supplied.
>>>> Add a set of PLL configurations to the driver to support that rate too.
>>>> As ACPI doesn't auto-configure the clock rate, check for a clock-frequency
>>>> during probe and set that rate if one is found.
>>>>
>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>>
>>>> 	- Added an enum defining the possible frequency rates to index the
>>>> 	  array (Andy)
>>>>
>>>>  drivers/media/i2c/ov8865.c | 164 +++++++++++++++++++++++++++----------
>>>>  1 file changed, 121 insertions(+), 43 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>>>> index fe700787bfb9..1382b16d1a09 100644
>>>> --- a/drivers/media/i2c/ov8865.c
>>>> +++ b/drivers/media/i2c/ov8865.c
>>>> @@ -21,10 +21,6 @@
>>>>  #include <media/v4l2-image-sizes.h>
>>>>  #include <media/v4l2-mediabus.h>
>>>>  
>>>> -/* Clock rate */
>>>> -
>>>> -#define OV8865_EXTCLK_RATE			24000000
>>>> -
>>>>  /* Register definitions */
>>>>  
>>>>  /* System */
>>>> @@ -567,6 +563,19 @@ struct ov8865_sclk_config {
>>>>  	unsigned int sclk_div;
>>>>  };
>>>>  
>>>> +/* Clock rate */
>>>> +
>>>> +enum extclk_rate {
>>>> +	OV8865_19_2_MHZ,
>>>> +	OV8865_24_MHZ,
>>>> +	OV8865_NUM_SUPPORTED_RATES,
>>>> +};
>>>> +
>>>> +static const unsigned long supported_extclk_rates[] = {
>>>> +	[OV8865_19_2_MHZ] = 19200000,
>>>> +	[OV8865_24_MHZ] = 24000000,
>>>> +};
>>>> +
>>>>  /*
>>>>   * General formulas for (array-centered) mode calculation:
>>>>   * - photo_array_width = 3296
>>>> @@ -665,6 +674,9 @@ struct ov8865_sensor {
>>>>  	struct regulator *avdd;
>>>>  	struct regulator *dvdd;
>>>>  	struct regulator *dovdd;
>>>> +
>>>> +	unsigned long extclk_rate;
>>>> +	enum extclk_rate extclk_rate_idx;
>>>>  	struct clk *extclk;
>>>>  
>>>>  	struct v4l2_fwnode_endpoint endpoint;
>>>> @@ -680,49 +692,83 @@ struct ov8865_sensor {
>>>>  /* Static definitions */
>>>>  
>>>>  /*
>>>> - * EXTCLK = 24 MHz
>>>>   * PHY_SCLK = 720 MHz
>>>>   * MIPI_PCLK = 90 MHz
>>>>   */
>>>> -static const struct ov8865_pll1_config ov8865_pll1_config_native = {
>>>> -	.pll_pre_div_half	= 1,
>>>> -	.pll_pre_div		= 0,
>>>> -	.pll_mul		= 30,
>>>> -	.m_div			= 1,
>>>> -	.mipi_div		= 3,
>>>> -	.pclk_div		= 1,
>>>> -	.sys_pre_div		= 1,
>>>> -	.sys_div		= 2,
>>>> +
>>>> +static const struct ov8865_pll1_config ov8865_pll1_configs_native[] = {
>>>> +	{ /* 19.2 MHz input clock */
>>>> +		.pll_pre_div_half	= 1,
>>>> +		.pll_pre_div		= 2,
>>>> +		.pll_mul		= 75,
>>>> +		.m_div			= 1,
>>>> +		.mipi_div		= 3,
>>>> +		.pclk_div		= 1,
>>>> +		.sys_pre_div		= 1,
>>>> +		.sys_div		= 2,
>>>> +	},
>>>> +	{ /* 24MHz input clock */
>>>> +		.pll_pre_div_half	= 1,
>>>> +		.pll_pre_div		= 0,
>>>> +		.pll_mul		= 30,
>>>> +		.m_div			= 1,
>>>> +		.mipi_div		= 3,
>>>> +		.pclk_div		= 1,
>>>> +		.sys_pre_div		= 1,
>>>> +		.sys_div		= 2,
>>>> +	},
>>> Could you instead add a struct specific to the clock frequency with
>>> pointers to these? See e.g. the ov8856 driver how this could otherwise end
>>> up...I thin
>>
>> You mean something like
>>
>>
>> static struct ov8865_pll_configs_19_2_mhz {
>>
>>     .pll1_config_native = &ov8865_pll1_config_native,
>>
>>     ...
>>
>> };
>>
>>
>>
>> static struct ov8865_pll_configs_24_mhz {
>>
>>     .pll1_config_native = &ov8865_pll1_config_native,
>>
>>     ...
>>
>> };
>>
>>
>> or am I misunderstanding?
> Yes, please --- ov8865_pll1_config_native above is thus the PLL
> configuration for the 24 MHz clock.

I'm not sure about this actually. There's two versions of
ov8865_pll2_config, native and binning, so it becomes something like this:


struct ov8865_pll_configs {
    struct ov8865_pll1_config *pll1_config;
    struct ov8865_pll2_config *pll2_config_native;
    struct ov8865_pll2_config *pll2_config_binning;
};

static struct ov8865_pll_configs ov8865_pll_configs_19_2mhz = {
    .pll1_config = &ov8865_pll1_config_native_19_2mhz,
    .pll2_config_native = &ov8865_pll2_config_native_19_2mhz,
    .pll2_config_binning = &ov8865_pll2_config_binning_19_2mhz,
};

static struct ov8865_pll_configs ov8865_pll_configs_24mhz = {
    .pll1_config = &ov8865_pll1_config_native_24mhz,
    .pll2_config_native = &ov8865_pll2_config_native_24mhz,
    .pll2_config_binning = &ov8865_pll2_config_binning_24mhz,
};


Now because a mode might use either the native or binning version of the
pll2 configs, currently they're actually against the struct for a
particular mode like so:


struct ov8865_mode ov8865_modes[] = {

    {

        <snip>

        .pll1_config            = &ov8865_pll1_config_native,
        .pll2_config            = &ov8865_pll2_config_binning,
        .sclk_config            = &ov8865_sclk_config_native,

    }

};


The problem I'm having is that I can't really see a clean way to store
against the _mode_ whether it should access .pll2_config_native or
.pll2_config_binning, from the new struct ov8865_pll_configs. Do you
have any ideas about a way to do that?

