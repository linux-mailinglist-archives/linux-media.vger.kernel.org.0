Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A936671C7
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 13:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjALMMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 07:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232881AbjALMMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 07:12:24 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD190DF7D;
        Thu, 12 Jan 2023 04:08:37 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id az7so17871598wrb.5;
        Thu, 12 Jan 2023 04:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RvlLS+KkHvJ6tRiF0L/XTd5ZqYizdgpzAhS381rG97w=;
        b=IGTfFGJoszd9S49dvjtL+xsKhfU/2ay9o84c2EtBLrj0MaYRtD2c8gTOl29xzeA5Du
         GcZy2J8sj98D4Gitv8tR2RXUqrSDztrJYUi+d+Zi8pjh83ybYQ1U2VCNBo7Bd4rvARf8
         EhV8CiiqovDzW7Op7UPS0gb8mCnMLul0unRIkiP/q7fN25yCA7gdGxVQJ0TO2KyNHsIZ
         xHucV/U5rqsG/HN4Nw5WssAZAn/Vlf1hhbepQ/l4+oJaN0d04mFspWTBxD5lrEGvAU4z
         G5gxtNERxfdbHq1mOcRNgqMxI8ZuVNLdwntaLqK62z+juMoLLliEIA+PbQ++fKKB5rOf
         0sLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvlLS+KkHvJ6tRiF0L/XTd5ZqYizdgpzAhS381rG97w=;
        b=TNoj7N4fN4W9JYc48/VgatUc4oaBluLuCBXOjyGRHZrwnpfpMCo6Eh4jmeGj3feyD9
         PdQNhAqk/qakRfDTFG9OUWem8YdoD4oCvuuwEDIJJU4JfK0t6+6UWRibDx6h5fNlfMRt
         uan1lTS6a8NRo+VU3bKc0P2AxHySe7IA3EldodNccI5f6EH/HhtxtlDjtzHZWDtWb8y3
         tbFdwRm5x/LVOwGMNutFdgeGUElh/UzmYH92dmEObRQpztKd+7Y91vwV1oR7P6E7m2IT
         sQaEFgSW7J/Rtk0M0SMlgzrE72TvuIz5JMJTvonUc4R2q24tH8KkK+0wS5g7Sk3QNLhH
         6xyg==
X-Gm-Message-State: AFqh2krbgJLwaLcfOLoXT5iKydk7vLIqsk05JjFMU2YcCoeMo9NL3oOW
        v9iPGjb3INYgyQGCzYXcm3Y=
X-Google-Smtp-Source: AMrXdXu4tXUiRJ4z1XBnPGpm/M33l4S5Hnxg/Jroiqt9jobPniiEnJVpYMvj2BSq/q7Rn33ZRm+KAQ==
X-Received: by 2002:adf:e392:0:b0:2bd:daf2:77ef with SMTP id e18-20020adfe392000000b002bddaf277efmr248522wrm.39.1673525316235;
        Thu, 12 Jan 2023 04:08:36 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id b1-20020adf9b01000000b0028e55b44a99sm16138571wrc.17.2023.01.12.04.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 04:08:35 -0800 (PST)
Message-ID: <e98399cf-2fef-25cf-2d54-5a5a37c7a7c8@gmail.com>
Date:   Thu, 12 Jan 2023 12:08:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] platform/x86: int3472/discrete: Ensure the clk/power
 enable pins are in output mode
To:     Andy Shevchenko <andy@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, linux-media@vger.kernel.org
References: <20230111201426.947853-1-hdegoede@redhat.com>
 <Y7/30zGP5FRKTaqE@smile.fi.intel.com>
Content-Language: en-US
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <Y7/30zGP5FRKTaqE@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 12/01/2023 12:06, Andy Shevchenko wrote:
> On Wed, Jan 11, 2023 at 09:14:26PM +0100, Hans de Goede wrote:
>> acpi_get_and_request_gpiod() does not take a gpio_lookup_flags argument
>> specifying that the pins direction should be initialized to a specific
>> value.
>>
>> This means that in some cases the pins might be left in input mode, causing
>> the gpiod_set() calls made to enable the clk / regulator to not work.
>>
>> One example of this problem is the clk-enable GPIO for the ov01a1s sensor
>> on a Dell Latitude 9420 being left in input mode causing the clk to
>> never get enabled.
>>
>> Explicitly set the direction of the pins to output to fix this.
> LGTM,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> thanks!


And to me:


Reviewed-by: Daniel Scally <djrscally@gmail.com>

>
>> Fixes: 5de691bffe57 ("platform/x86: Add intel_skl_int3472 driver")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v4:
>> - Split out of the "int3472/media privacy LED support" series, so
>>   that this can be applied separately as it really is a bug-fix
>> ---
>>  drivers/platform/x86/intel/int3472/clk_and_regulator.c | 3 +++
>>  drivers/platform/x86/intel/int3472/discrete.c          | 4 ++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> index b2342b3d78c7..74dc2cff799e 100644
>> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> @@ -181,6 +181,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>>  		return PTR_ERR(int3472->regulator.gpio);
>>  	}
>>  
>> +	/* Ensure the pin is in output mode and non-active state */
>> +	gpiod_direction_output(int3472->regulator.gpio, 0);
>> +
>>  	cfg.dev = &int3472->adev->dev;
>>  	cfg.init_data = &init_data;
>>  	cfg.ena_gpiod = int3472->regulator.gpio;
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 974a132db651..c42c3faa2c32 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -168,6 +168,8 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
>>  			return (PTR_ERR(gpio));
>>  
>>  		int3472->clock.ena_gpio = gpio;
>> +		/* Ensure the pin is in output mode and non-active state */
>> +		gpiod_direction_output(int3472->clock.ena_gpio, 0);
>>  		break;
>>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
>>  		gpio = acpi_get_and_request_gpiod(path, pin, "int3472,privacy-led");
>> @@ -175,6 +177,8 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
>>  			return (PTR_ERR(gpio));
>>  
>>  		int3472->clock.led_gpio = gpio;
>> +		/* Ensure the pin is in output mode and non-active state */
>> +		gpiod_direction_output(int3472->clock.led_gpio, 0);
>>  		break;
>>  	default:
>>  		dev_err(int3472->dev, "Invalid GPIO type 0x%02x for clock\n", type);
>> -- 
>> 2.39.0
>>
