Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD2272CA40
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 17:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237564AbjFLPek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 11:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234742AbjFLPej (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 11:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C5310CC
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 08:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686584030;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PK3h3V1BrRTQbwb1fHrZTvsFvvDYr0rCWS6wjjwSvHA=;
        b=XicgmH+9lfJ05diUzwH8E1bQje/7B/+pg5X/J1Pryp8iKtLgqX5UtC+zhm0Ha0jxXKkNeE
        z1XuPIdSnRiBXtGisrYTmRu2c+GmEYxT/2vaiVGJ6W9thoBVFbQAJiWzKqAKuXIu1k67rI
        0bDhi+Ad51v/MIDsYqEFpZat8axQTpY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-ledzafalNSyx0UuV_wWQBg-1; Mon, 12 Jun 2023 11:33:43 -0400
X-MC-Unique: ledzafalNSyx0UuV_wWQBg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51866148986so262306a12.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 08:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686584022; x=1689176022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PK3h3V1BrRTQbwb1fHrZTvsFvvDYr0rCWS6wjjwSvHA=;
        b=eGtsdZUzK1ARZ+vq2SffcQleEZw1Pov+gSBs4mS3Uur1NwLTl0t6KLkq7iyCw8U0NN
         8w1bzODtuu5kSPte0QH9AUmQdgLpbPDNrBcCfNj2iz+ZYd4wg6avkw/+K/SYPjljVMNB
         Cuuaz2v83OU++xFpoCzEwpQIPtHO17w1NPVwzO2K9eNTsIbeNsc3wU/xcKalsLh83UYF
         iorEO0gOao2sRozd+f3cBauhlFM7lNp/oShhtD/fDjMBZ8G3FUVSWLQG7jrMKy8XFheU
         ODobhtsV6X5slZMHe+l689y0YJVXUh0HlEXfekNg1AifOdBZCgpdboPsxrUG5XFYy8Z3
         5Q/Q==
X-Gm-Message-State: AC+VfDxVirirPBqorxONTxidDDX9+JAnUrMVo9cDi40Zvqg/h2rSso8v
        nwYKUXhIOXogUSNAFk3yzi8UPQaOAObELiU5kY+2Bied3dXBCJ5i24MMZEzpxaAYd9qX5AUwAuS
        ei3BaHfSoAjSaFcXO46dRltA=
X-Received: by 2002:aa7:cf02:0:b0:514:af52:e49a with SMTP id a2-20020aa7cf02000000b00514af52e49amr5369761edy.25.1686584022231;
        Mon, 12 Jun 2023 08:33:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5TKbuli4mEQYCQ1x5ZbZtFHnwNqOt6jqNDOU5Aspyl6pYLjwmAYItcc8V3dfrom3TimQwFnA==
X-Received: by 2002:aa7:cf02:0:b0:514:af52:e49a with SMTP id a2-20020aa7cf02000000b00514af52e49amr5369742edy.25.1686584021838;
        Mon, 12 Jun 2023 08:33:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bn14-20020a170906c0ce00b0095807ab4b57sm5472883ejb.178.2023.06.12.08.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:33:41 -0700 (PDT)
Message-ID: <f43d37ae-1b49-829a-ec8a-4a3834e2f318@redhat.com>
Date:   Mon, 12 Jun 2023 17:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <20230607181855.GM5058@pendragon.ideasonboard.com>
 <b558aac9-0a34-ecca-57b0-d132af8cdefb@redhat.com>
 <20230608102725.GN5058@pendragon.ideasonboard.com>
 <cb020702-a112-22ad-39aa-56417633fc56@redhat.com>
 <20230612151600.GF23921@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230612151600.GF23921@pendragon.ideasonboard.com>
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

Hi,

On 6/12/23 17:16, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Jun 12, 2023 at 03:48:01PM +0200, Hans de Goede wrote:
>> On 6/8/23 12:27, Laurent Pinchart wrote:
>>> On Wed, Jun 07, 2023 at 09:01:40PM +0200, Hans de Goede wrote:
>>>> On 6/7/23 20:18, Laurent Pinchart wrote:
>>
>> <snip>
>>
>>>>>> +int cci_update_bits(struct regmap *map, u32 reg, u32 mask, u32 val, int *err)
>>>>>> +{
>>>>>> +	int width, ret;
>>>>>> +	u32 readval;
>>>>>> +
>>>>>> +	if (err && *err)
>>>>>> +		return *err;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * For single byte updates use regmap_update_bits(), this uses
>>>>>> +	 * the regmap-lock to protect against other read-modify-writes racing.
>>>>>> +	 */
>>>>>> +	width = (reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT;
>>>>>> +	if (width == cci_reg_8) {
>>>>>> +		reg &= CCI_REG_ADDR_MASK;
>>>>>> +		ret = regmap_update_bits(map, reg, mask, val);
>>>>>> +		if (ret) {
>>>>>> +			dev_err(regmap_get_device(map), "Error updating reg 0x%4x: %d\n", reg, ret);
>>>>>> +			if (err)
>>>>>> +				*err = ret;
>>>>>> +		}
>>>>>> +
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	ret = cci_read(map, reg, &readval, err);
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	val = (readval & ~mask) | (val & mask);
>>>>>> +
>>>>>> +	return cci_write(map, reg, val, err);
>>>>>
>>>>> Unless I'm mistaken, the regmap cache isn't used. This makes update
>>>>> operations fairly costly due to the read. Could that be improved ?
>>>>
>>>> The problem is that some registers may be volatile,
>>>> think e.g. expsoure on a sensor where auto-exposure is supported.
>>>>
>>>> So normally drivers which want to use regmap caching, also
>>>> provide a whole bunch of tables describing the registers
>>>> (lists of volatile + list of writable + list of readable
>>>> registers).
>>>>
>>>> So enabling caching is not trivial. I think that it would be best
>>>> for drivers which want that to supply their own regmap_config config
>>>> and directly call devm_regmap_init_i2c() if they then use
>>>> the resulting regmaps with the existing cci_* helpers then caching
>>>> will be used automatically.
>>>
>>> Would there be a way to use the cache for update operations (as I think
>>> we can consider that registers used in those operations won't be
>>> volatile), and bypass it for standalone reads ?
>>
>> There is not really a nice way to only use the cache for update operations.
>>
>> I guess we could do something hacky like tell regmap to create a cache,
>> then set the cache-bypass flag and drop the cache-bypass flag during
>> update ops. But that really is abusing the regmap API.
>>
>> Generally speaking update operations don't happen that often though,
>> so IMHO hacking to get this cached is not worth it.
> 
> I2C reads are slow, so even if they're not very common, it would be nice
> to avoid them. We can start without any caching and improve it later,
> I'm fine with that.
> 
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(cci_update_bits);
>>>>>> +
>>>>>> +int cci_multi_reg_write(struct regmap *map, const struct reg_sequence *regs, int num_regs, int *err)
>>>>>> +{
>>>>>> +	int i, ret;
>>>>>> +
>>>>>> +	if (err && *err)
>>>>>> +		return *err;
>>>>>> +
>>>>>> +	for (i = 0; i < num_regs; i++) {
>>>>>> +		ret = cci_write(map, regs[i].reg, regs[i].def, err);
>>>>>> +		if (ret)
>>>>>> +			return ret;
>>>>>> +
>>>>>> +		if (regs[i].delay_us)
>>>>>> +			fsleep(regs[i].delay_us);
>>>>>
>>>>> Do you have an immediate need for this ? If not, I'd drop support for
>>>>> the delay, and add it later when and if needed. It will be easier to
>>>>> discuss the API and use cases with a real user.
>>>>
>>>> This is a 1:1 mirror of regmap_multi_reg_write() note this uses
>>>> the existing struct reg_sequence delay_us field and the:
>>>>
>>>> 		if (regs[i].delay_us)
>>>> 			fsleep(regs[i].delay_us);
>>>>
>>>> is copied from the implementation of regmap_multi_reg_write()
>>>
>>> The reason why I don't like it much as that such delays are often hacks
>>> hidden in the middle of register arrays that should in many cases be
>>> handled differently. I was hoping that, by not supporting them yet,
>>> we'll have an easier time to get drivers right. Maybe I'm wrong.
>>
>> I understand, but having this is more or less a downside of
>> the choice to mirror the regmap API as close as possible.
>>
>> As Sakari said, having the field there just to ignore it
>> seems like a bad idea.
> 
> I'm not sure to agree here, if we see no valid use case for that field,
> why would it be a bad idea to ignore it ? That shouldn't affect anyone.

I'm fine with dropping the fsleep() here, but IMHO it should
be replaced with a warning if it is missing do we want dev_warn
or WARN_ON() here ?  Since setting it would be considered
a driver bug I guess WARN_ON() ?

> 
>> I think that this being abused is something to watch for during
>> review, rather then enforcing it not being used in the CCI code.
>>
>>>>>> +	}
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(cci_multi_reg_write);
>>>>>> +
>>>>>> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits)
>>>>>> +{
>>>>>> +	struct regmap_config config = {
>>>>>> +		.reg_bits = reg_addr_bits,
>>>>>> +		.val_bits = 8,
>>>>>> +		.reg_format_endian = REGMAP_ENDIAN_BIG,
>>>>>> +	};
>>>>>> +
>>>>>> +	return devm_regmap_init_i2c(client, &config);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(cci_regmap_init_i2c);
>>>>>> +
>>>>>> +MODULE_LICENSE("GPL");
>>>>>> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
>>>>>> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..69b8a7c4a013
>>>>>> --- /dev/null
>>>>>> +++ b/include/media/v4l2-cci.h
>>>>>> @@ -0,0 +1,109 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>> +/*
>>>>>> + * MIPI Camera Control Interface (CCI) register access helpers.
>>>>>> + *
>>>>>> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
>>>>>> + */
>>>>>> +#ifndef _V4L2_CCI_H
>>>>>> +#define _V4L2_CCI_H
>>>>>> +
>>>>>> +#include <linux/regmap.h>
>>>>>> +#include <linux/types.h>
>>>>>> +
>>>>>> +/*
>>>>>> + * Note cci_reg_8 deliberately is 0, not 1, so that raw
>>>>>> + * (not wrapped in a CCI_REG*() macro) register addresses
>>>>>> + * do 8 bit wide accesses. This allows unchanged use of register
>>>>>> + * initialization lists of raw address, value pairs which only
>>>>>> + * do 8 bit width accesses. Which makes porting drivers easier.
>>>>>
>>>>> It does, but at the same time, it prevents catching errors caused by
>>>>> incorrect register macros. I'm tempted to consider that catching those
>>>>> errors is more important.
>>>>>
>>>>>> + */
>>>>>> +enum cci_reg_type {
>>>>>> +	cci_reg_8 = 0,
>>>>>> +	cci_reg_16,
>>>>>> +	cci_reg_24,
>>>>>> +	cci_reg_32,
>>>>>> +};
>>>>>> +
>>>>>> +/*
>>>>>> + * Macros to define register address with the register width encoded
>>>>>> + * into the higher bits. CCI_REG8() is a no-op so its use is optional.
>>>>>
>>>>> Even if it's a no-op I'd prefer making its use mandatory. It makes
>>>>> driver code more explicit, and eases catching issues during review.
>>>>
>>>> The problem is that almost all sensor drivers contain long list
>>>> of register-address, -val pairs which they send to their own custom
>>>> regmap_multi_reg_write()
>>>>
>>>> See e.g. the drivers/media/i2c/imx219.c (to stick with the imx
>>>> theme from your imx290 request) this has a lot of quite long
>>>> struct imx219_reg arrays with raw initializers.
>>>>
>>>> Often some or all of these registers in such list are
>>>> undocumented (if we have access to a datasheet at all),
>>>> so we simply don't know the register width.
>>>>
>>>> So arguably adding CCI_REG8(x) around all the addresses
>>>> here is wrong, since this suggests we know the register
>>>> width.
>>>>
>>>> With the current proposal to have 0 mean both unset and 8bit
>>>> width this kinda register lists just work and converting
>>>> the driver becomes just a matter of replacing e.g.
>>>> imx219_write_regs() with cci_multi_reg_write().
>>>>
>>>> Where as otherwise we would need to add CCI_REG8(x)
>>>> around the addresses which:
>>>>
>>>> a) Suggests we actually know the register width which
>>>>    we often do not know at all
>>>>
>>>> b) causes a ton of needless churn
>>>>
>>>> so I would very much prefer to keep this as as and
>>>> allow unmarked register addresses.
>>>>
>>>> As for the CCI_REG8(x) being useful as an annotation
>>>> during review you are of course free to enforce its
>>>> use during review. And note that I did use it for
>>>> all the OV2680_REG_FOO defines in both ov2680 conversions.
>>>>
>>>> I do agree enforcing its use makes sense for individual
>>>> register address defines. The reason to make it optional
>>>> and the place where I want it to be optional is for
>>>> the array of raw register-addr + initializer-val pairs
>>>> case.
>>>
>>> For register arrays, I'm fine with that. For register macros, I don't
>>> want to see
>>>
>>> #define MY_WELL_DEFINED_8B_REG		0x1234
>>>
>>> For those I want drivers to use CCI_REG8(). It seems we're on the same
>>> page :-)
>>
>> Right, but if we want cci_multi_reg_write() to work with register
>> arrays without the CCI_REG8() macros then the code needs to stay
>> as is and we cannot enforce use of the macro by erroring out
>> if it is not used.
> 
> Could we have an internal __cci_reg_write() that doesn't check the size,
> and a cci_reg_write() wrapper that does ?

And then make cci_multi_reg_write() use the non checking version I presume?
Yes that is possible / should work.

Or alternatively we could make drivers which use raw register init lists
(with the reg-width macros) directly call regmap_multi_reg_write() since
all register writes are expected to be 8 bit wide in that case directly
calling regmap_multi_reg_write() should work fine too.

And then we can have all the cci_ prefixed versions always check
that a reg-width has been specified, which would be more consistent.

Regards,

Hans


