Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1395272C65E
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 15:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235517AbjFLNtE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 09:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjFLNtC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 09:49:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB8210F2
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 06:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686577685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y6R6MmCZxrCwRJ0hufKOr6gMDbmii9MUWlTuVNGPr7Y=;
        b=KW2QpzKLHCl5EcJNXgrFib8A08p7aMZPgjn0eNE72y7MpsfAWbr81RSGKx7yHTtCOgCTJY
        5HJ1iN6wVbR506wHtGBab7yPJwYnfHNuv4SFSlU+uNB5ayvQt8fplwjPVt1n3cJIRl7V8v
        hFhSQ/kh5u8mAev8g+Qw48U0TusXOqk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-udZOUYILMl66WOXNE1m6Tg-1; Mon, 12 Jun 2023 09:48:04 -0400
X-MC-Unique: udZOUYILMl66WOXNE1m6Tg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-97ea7f0e088so225252966b.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 06:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686577682; x=1689169682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6R6MmCZxrCwRJ0hufKOr6gMDbmii9MUWlTuVNGPr7Y=;
        b=DFsqZvbU43iKZCQufRiiuFWhRkCLP2rPe7/xKwUuIRLdZvgma3LdOpgHxdbYr53xvO
         sXmqj4c5ARUVWGpNfDxNaWKBXHT3jqwUBoodkPmNEsnSRnzcB/CqzxALhI0J0vBoxwZ4
         eCASuXntzfM5FT/bh4qSVZJ/tkx1vAmHdvsW1ka61UUKjxylURQigdY6vU3ek9CIhpKe
         /G6GEP49PGwMTlCa+psJaKtidAdKEDfFoO6Qs8KAt0zNDLvu0JalZ/xy/HEMVMHH0ren
         z0zXs8K/A66RhgQRy4em4orqXfyCC/CF+BMPTjxqnwa3t8UgXf8bmLbwWd+g0Flm2qib
         UIpA==
X-Gm-Message-State: AC+VfDwJWBKrMxmGUSVu9fLwGI8Jo+hmq5mLualsnX9koYx/iDpYxilD
        QuxF7u0jnJ7U5OlbeBBzE0tzz6nDzCdUJ/E4HxZ3ng3Frewkl6OyTUd5KLbXHj4QDkus6dWkL7b
        uw1VoFqDvB1IimVoAT7COO5kCTdcnoMA=
X-Received: by 2002:a17:906:da87:b0:978:930e:2276 with SMTP id xh7-20020a170906da8700b00978930e2276mr10001809ejb.31.1686577682516;
        Mon, 12 Jun 2023 06:48:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6n+rcNNNJHZ7k6zLBjjiXRYEdE/6ywVANCvpED20NreVvR7wxmyWF3ONWuE+sSH9QGmvS1Ww==
X-Received: by 2002:a17:906:da87:b0:978:930e:2276 with SMTP id xh7-20020a170906da8700b00978930e2276mr10001794ejb.31.1686577682189;
        Mon, 12 Jun 2023 06:48:02 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i25-20020a170906265900b00977ca5de275sm5353447ejc.13.2023.06.12.06.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 06:48:01 -0700 (PDT)
Message-ID: <cb020702-a112-22ad-39aa-56417633fc56@redhat.com>
Date:   Mon, 12 Jun 2023 15:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <20230607181855.GM5058@pendragon.ideasonboard.com>
 <b558aac9-0a34-ecca-57b0-d132af8cdefb@redhat.com>
 <20230608102725.GN5058@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230608102725.GN5058@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 6/8/23 12:27, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Wed, Jun 07, 2023 at 09:01:40PM +0200, Hans de Goede wrote:
>> On 6/7/23 20:18, Laurent Pinchart wrote:

<snip>

>>>> +int cci_update_bits(struct regmap *map, u32 reg, u32 mask, u32 val, int *err)
>>>> +{
>>>> +	int width, ret;
>>>> +	u32 readval;
>>>> +
>>>> +	if (err && *err)
>>>> +		return *err;
>>>> +
>>>> +	/*
>>>> +	 * For single byte updates use regmap_update_bits(), this uses
>>>> +	 * the regmap-lock to protect against other read-modify-writes racing.
>>>> +	 */
>>>> +	width = (reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT;
>>>> +	if (width == cci_reg_8) {
>>>> +		reg &= CCI_REG_ADDR_MASK;
>>>> +		ret = regmap_update_bits(map, reg, mask, val);
>>>> +		if (ret) {
>>>> +			dev_err(regmap_get_device(map), "Error updating reg 0x%4x: %d\n", reg, ret);
>>>> +			if (err)
>>>> +				*err = ret;
>>>> +		}
>>>> +
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = cci_read(map, reg, &readval, err);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	val = (readval & ~mask) | (val & mask);
>>>> +
>>>> +	return cci_write(map, reg, val, err);
>>>
>>> Unless I'm mistaken, the regmap cache isn't used. This makes update
>>> operations fairly costly due to the read. Could that be improved ?
>>
>> The problem is that some registers may be volatile,
>> think e.g. expsoure on a sensor where auto-exposure is supported.
>>
>> So normally drivers which want to use regmap caching, also
>> provide a whole bunch of tables describing the registers
>> (lists of volatile + list of writable + list of readable
>> registers).
>>
>> So enabling caching is not trivial. I think that it would be best
>> for drivers which want that to supply their own regmap_config config
>> and directly call devm_regmap_init_i2c() if they then use
>> the resulting regmaps with the existing cci_* helpers then caching
>> will be used automatically.
> 
> Would there be a way to use the cache for update operations (as I think
> we can consider that registers used in those operations won't be
> volatile), and bypass it for standalone reads ?

There is not really a nice way to only use the cache for update operations.

I guess we could do something hacky like tell regmap to create a cache,
then set the cache-bypass flag and drop the cache-bypass flag during
update ops. But that really is abusing the regmap API.

Generally speaking update operations don't happen that often though,
so IMHO hacking to get this cached is not worth it.

> 
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(cci_update_bits);
>>>> +
>>>> +int cci_multi_reg_write(struct regmap *map, const struct reg_sequence *regs, int num_regs, int *err)
>>>> +{
>>>> +	int i, ret;
>>>> +
>>>> +	if (err && *err)
>>>> +		return *err;
>>>> +
>>>> +	for (i = 0; i < num_regs; i++) {
>>>> +		ret = cci_write(map, regs[i].reg, regs[i].def, err);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		if (regs[i].delay_us)
>>>> +			fsleep(regs[i].delay_us);
>>>
>>> Do you have an immediate need for this ? If not, I'd drop support for
>>> the delay, and add it later when and if needed. It will be easier to
>>> discuss the API and use cases with a real user.
>>
>> This is a 1:1 mirror of regmap_multi_reg_write() note this uses
>> the existing struct reg_sequence delay_us field and the:
>>
>> 		if (regs[i].delay_us)
>> 			fsleep(regs[i].delay_us);
>>
>> is copied from the implementation of regmap_multi_reg_write()
> 
> The reason why I don't like it much as that such delays are often hacks
> hidden in the middle of register arrays that should in many cases be
> handled differently. I was hoping that, by not supporting them yet,
> we'll have an easier time to get drivers right. Maybe I'm wrong.

I understand, but having this is more or less a downside of
the choice to mirror the regmap API as close as possible.

As Sakari said, having the field there just to ignore it
seems like a bad idea.

I think that this being abused is something to watch for during
review, rather then enforcing it not being used in the CCI code.

> 
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(cci_multi_reg_write);
>>>> +
>>>> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits)
>>>> +{
>>>> +	struct regmap_config config = {
>>>> +		.reg_bits = reg_addr_bits,
>>>> +		.val_bits = 8,
>>>> +		.reg_format_endian = REGMAP_ENDIAN_BIG,
>>>> +	};
>>>> +
>>>> +	return devm_regmap_init_i2c(client, &config);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(cci_regmap_init_i2c);
>>>> +
>>>> +MODULE_LICENSE("GPL");
>>>> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
>>>> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
>>>> new file mode 100644
>>>> index 000000000000..69b8a7c4a013
>>>> --- /dev/null
>>>> +++ b/include/media/v4l2-cci.h
>>>> @@ -0,0 +1,109 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * MIPI Camera Control Interface (CCI) register access helpers.
>>>> + *
>>>> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
>>>> + */
>>>> +#ifndef _V4L2_CCI_H
>>>> +#define _V4L2_CCI_H
>>>> +
>>>> +#include <linux/regmap.h>
>>>> +#include <linux/types.h>
>>>> +
>>>> +/*
>>>> + * Note cci_reg_8 deliberately is 0, not 1, so that raw
>>>> + * (not wrapped in a CCI_REG*() macro) register addresses
>>>> + * do 8 bit wide accesses. This allows unchanged use of register
>>>> + * initialization lists of raw address, value pairs which only
>>>> + * do 8 bit width accesses. Which makes porting drivers easier.
>>>
>>> It does, but at the same time, it prevents catching errors caused by
>>> incorrect register macros. I'm tempted to consider that catching those
>>> errors is more important.
>>>
>>>> + */
>>>> +enum cci_reg_type {
>>>> +	cci_reg_8 = 0,
>>>> +	cci_reg_16,
>>>> +	cci_reg_24,
>>>> +	cci_reg_32,
>>>> +};
>>>> +
>>>> +/*
>>>> + * Macros to define register address with the register width encoded
>>>> + * into the higher bits. CCI_REG8() is a no-op so its use is optional.
>>>
>>> Even if it's a no-op I'd prefer making its use mandatory. It makes
>>> driver code more explicit, and eases catching issues during review.
>>
>> The problem is that almost all sensor drivers contain long list
>> of register-address, -val pairs which they send to their own custom
>> regmap_multi_reg_write()
>>
>> See e.g. the drivers/media/i2c/imx219.c (to stick with the imx
>> theme from your imx290 request) this has a lot of quite long
>> struct imx219_reg arrays with raw initializers.
>>
>> Often some or all of these registers in such list are
>> undocumented (if we have access to a datasheet at all),
>> so we simply don't know the register width.
>>
>> So arguably adding CCI_REG8(x) around all the addresses
>> here is wrong, since this suggests we know the register
>> width.
>>
>> With the current proposal to have 0 mean both unset and 8bit
>> width this kinda register lists just work and converting
>> the driver becomes just a matter of replacing e.g.
>> imx219_write_regs() with cci_multi_reg_write().
>>
>> Where as otherwise we would need to add CCI_REG8(x)
>> around the addresses which:
>>
>> a) Suggests we actually know the register width which
>>    we often do not know at all
>>
>> b) causes a ton of needless churn
>>
>> so I would very much prefer to keep this as as and
>> allow unmarked register addresses.
>>
>> As for the CCI_REG8(x) being useful as an annotation
>> during review you are of course free to enforce its
>> use during review. And note that I did use it for
>> all the OV2680_REG_FOO defines in both ov2680 conversions.
>>
>> I do agree enforcing its use makes sense for individual
>> register address defines. The reason to make it optional
>> and the place where I want it to be optional is for
>> the array of raw register-addr + initializer-val pairs
>> case.
> 
> For register arrays, I'm fine with that. For register macros, I don't
> want to see
> 
> #define MY_WELL_DEFINED_8B_REG		0x1234
> 
> For those I want drivers to use CCI_REG8(). It seems we're on the same
> page :-)

Right, but if we want cci_multi_reg_write() to work with register
arrays without the CCI_REG8() macros then the code needs to stay
as is and we cannot enforce use of the macro by erroring out
if it is not used.

Regards,

Hans

