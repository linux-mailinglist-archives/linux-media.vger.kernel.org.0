Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3390691F4F
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 13:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbjBJMso (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 07:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbjBJMsn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 07:48:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8076359F
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 04:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676033273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=izisGCaL60GbbJ2l9clrLicxnHM7/Gq/q7/PldsJ/2s=;
        b=S9nsaRBb+qAX/7v9Z0fG2W7KXZpf7XD7R8juKAD9N02GJKbzF9St+X9RmkhTxD20Kml++2
        Iib9Yel1ZbVHExrZeJDneDHJT7qeSgtIcU5+F9o+Ott5GDcv7GbNJIF3QpbBbDCvQ6V2pv
        JS81/oGHhwEAaAXVC3ZPOMkDTcUibiM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-NwKI0o6vMd2F332cxwEVGA-1; Fri, 10 Feb 2023 07:47:52 -0500
X-MC-Unique: NwKI0o6vMd2F332cxwEVGA-1
Received: by mail-ej1-f71.google.com with SMTP id l18-20020a1709067d5200b008af415fdd80so2915101ejp.21
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 04:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izisGCaL60GbbJ2l9clrLicxnHM7/Gq/q7/PldsJ/2s=;
        b=KdCQsJdLhOyuPcR71l3HQTVX8ukMtz9jcvX34BkkloetY8Mob5p8wDIUbHUHiOF9Kb
         0aEM4+hu7FalwzKxMR3Gv974FMZ6/+jR03aYuiZDqUZvcwRt4nlA1PH9e3jasCPlG1X5
         dQhL61dqVEQ3N4pvO+xCyxat6yrNZIGUHjNDeP9afu0gprOx1gBXiuoExTK4qF32pT25
         dcQFw89w9zTK1tA1moUNn1aBlLsE9UyNcE9QEMUpJP3bd4xZlIxPvqqU5X2hS1Kq8sBs
         HoUWTtgaIhgNhkCdT34Sh/nPLcvOWyNN9mrHZ9DAYWC/UytLGNZ3yJofG+7tE915zZsm
         81oA==
X-Gm-Message-State: AO0yUKXjCSHscFKhCO+9zyaQdjzRTyC2MlWIPtJRiu1W/Qk68SKFjgGL
        X+nlhDxSA0czQXoVBq6Sh5XL4Lc8iO/Ip6NkimpeSF1HBHNBU4xDCDY7XkqS6IEXyFExP7RACeu
        lBvvQcbTNPXRPHMP36jqnQnM=
X-Received: by 2002:a50:d781:0:b0:4ac:89b:b605 with SMTP id w1-20020a50d781000000b004ac089bb605mr642509edi.22.1676033271378;
        Fri, 10 Feb 2023 04:47:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+YBZvakKGSv8xKc0HGKh2xcm7mcVd4HyH08WL+q70yGpZlyvhrGdcn92aRwW8HG80l2oWeFA==
X-Received: by 2002:a50:d781:0:b0:4ac:89b:b605 with SMTP id w1-20020a50d781000000b004ac089bb605mr642499edi.22.1676033271170;
        Fri, 10 Feb 2023 04:47:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x42-20020a50baad000000b004a7e9ec2087sm2153307ede.76.2023.02.10.04.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:47:50 -0800 (PST)
Message-ID: <30181cf6-7dc8-d75c-5d7a-93f483d4f045@redhat.com>
Date:   Fri, 10 Feb 2023 13:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
 <3be27a04-21e5-5929-88a1-0159f554a36f@redhat.com>
 <Y+Yz3qPY3aiJ+bYZ@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y+Yz3qPY3aiJ+bYZ@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2/10/23 13:09, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Feb 10, 2023 at 12:56:45PM +0100, Hans de Goede wrote:
>> On 2/10/23 12:45, Laurent Pinchart wrote:
>>> On Fri, Feb 10, 2023 at 12:20:36PM +0100, Hans de Goede wrote:
>>>> On 2/9/23 17:11, Laurent Pinchart wrote:
>>>>> On Thu, Feb 09, 2023 at 04:03:22PM +0100, Hans de Goede wrote:
>>>>>> On 2/8/23 10:52, Laurent Pinchart wrote:
>>>>>>> On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
>>>>>>>> The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
>>>>>>>> ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
>>>>>>>> ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
>>>>>>>>
>>>>>>>> as well as various "atomisp" sensor drivers in drivers/staging, *all*
>>>>>>>> use register access helpers with the following function prototypes:
>>>>>>>>
>>>>>>>> int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
>>>>>>>>                     unsigned int len, u32 *val);
>>>>>>>>
>>>>>>>> int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
>>>>>>>>                      unsigned int len, u32 val);
>>>>>>>>
>>>>>>>> To read/write registers on Omnivision OVxxxx image sensors wich expect
>>>>>>>> a 16 bit register address in big-endian format and which have 1-3 byte
>>>>>>>> wide registers, in big-endian format (for the higher width registers).
>>>>>>>>
>>>>>>>> Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
>>>>>>>> versions of these register access helpers, so that this code duplication
>>>>>>>> can be removed.
>>>>>>>
>>>>>>> Any reason to hand-roll those instead of using regmap ?
>>>>>>
>>>>>> These devices have a mix of 8 + 16 + 24 bit registers which regmap
>>>>>> appears to not handle, a regmap has a single regmap_config struct
>>>>>> with a single "@reg_bits: Number of bits in a register address, mandatory",
>>>>>> so we would still need wrappers around regmap, at which point it
>>>>>> really offers us very little.
>>>>>
>>>>> We could extend regmap too, although that may be too much yak shaving.
>>>>> It would be nice, but I won't push hard for it.
>>>>>
>>>>>> Also I'm moving duplicate code present in many of the
>>>>>> drivers/media/i2c/ov*.c files into a common header to remove
>>>>>> duplicate code. The handrolling was already there before :)
>>>>>>
>>>>>> My goal with the new ovxxxx_16bit_addr_reg_helpers.h file was to
>>>>>> offer something which is as much of a drop-in replacement of the
>>>>>> current handrolled code as possible (usable with just a few
>>>>>> search-n-replaces) as possible.
>>>>>>
>>>>>> Basically my idea here was to factor out code which I noticed was
>>>>>> being repeated over and over again. My goal was not to completely
>>>>>> redo how register accesses are done in these drivers.
>>>>>>
>>>>>> I realize I have not yet converted any other drivers, that is because
>>>>>> I don't really have a way to test most of the other drivers. OTOH
>>>>>> with the current helpers most conversions should be fairly simply
>>>>>> and remove a nice amount of code. So maybe I should just only compile
>>>>>> test the conversions ?
>>>>>
>>>>> Before you spend time converting drivers, I'd like to complete the
>>>>> discussion regarding the design of those helpers. I'd rather avoid
>>>>> mass-patching drivers now and doing it again in the next kernel release.
>>>>
>>>> I completely agree.
>>>>
>>>>> Sakari mentioned CCI (part of the CSI-2 specification). I think that
>>>>> would be a good name to replace ov* here, as none of this is specific to
>>>>> OmniVision.
>>>>
>>>> I did not realize this was CCI I agree renaming the helpers makes sense.
>>>>
>>>> I see there still is a lot of discussion going on.
>>>
>>> I haven't seen any disagreement regarding the cci prefix, so let's go
>>> for that. I'd propose cci_read() and cci_write().
>>>
>>> Sakari, you and I would prefer layering this on top of regmap, while
>>> Andy proposed extending the regmap API. Let's see if we reach an
>>> anonymous agreement on this.
>>>
>>> Regarding the width-specific versions of the helpers, I really think
>>> encoding the size in the register macros is the best option. It makes
>>> life easier for driver authors (only one function to call, no need to
>>> think about the register width to pick the appropriate function in each
>>> call) and reviewers (same reason), without any drawback in my opinion.
>>>
>>> Another feature I'd like in these helpers is improved error handling. In
>>> quite a few sensor drivers I've written, I've implemented the write
>>> function as
>>>
>>> int foo_write(struct foo *foo, u32 reg, u32 val, int *err)
>>> {
>>> 	...
>>> 	int ret;
>>>
>>> 	if (err && *err)
>>> 		return *err;
>>>
>>> 	ret = real_write(...);
>>> 	if (ret < 0) {
>>> 		dev_err(...);
>>> 		if (err)
>>> 			*err = ret;
>>> 	}
>>>
>>> 	return ret;
>>> }
>>>
>>> This allows callers to write
>>>
>>> 	int ret = 0;
>>>
>>> 	foo_write(foo, REG_A, 0, &ret);
>>> 	foo_write(foo, REG_B, 1, &ret);
>>> 	foo_write(foo, REG_C, 2, &ret);
>>> 	foo_write(foo, REG_D, 3, &ret);
>>>
>>> 	return ret;
>>>
>>> which massively simplifies error handling. I'd like the CCI write helper
>>> to implement such a pattern.
>>
>> Interesting, I see that the passing of the err return pointer is optional,
>> so we can still just do a search replace in existing code setting that
>> to just NULL.
> 
> And if someone dislikes having to pass NULL for the last argument, we
> could use some macro magic to accept both the 3 arguments and 4
> arguments variants.
> 
> int __cci_write3(struct cci *cci, u32 reg, u32 val);
> int __cci_write4(struct cci *cci, u32 reg, u32 val, int *err);
> 
> #define __cci_write(_1, _2, _3, _4, NAME, ...) NAME
> #define cci_write(...) __cci_write(__VA_ARGS__, __cci_write4, __cci_write3)(__VA_ARGS__)

TBH this just feels like code obfuscation to me and it is also going
to write havoc with various smarted code-editors / IDEs which give
proptype info to the user while typing the function name.

Having the extra ", NULL" there in calls which don't use / need
the *err thingie really is not a big deal IMHO.

Regards,

Hans



>>>>>>> Also, may I
>>>>>>> suggest to have a look at drivers/media/i2c/imx290.c for an example of
>>>>>>> how registers of different sizes can be handled in a less error-prone
>>>>>>> way, using single read/write functions that adapt to the size
>>>>>>> automatically ?
>>>>>>
>>>>>> Yes I have seen this pattern in drivers/media/i2c/ov5693.c too
>>>>>> (at least I assume it is the same pattern you are talking about).
>>>>>
>>>>> Correct. Can we use something like that to merge all the ov*_write_reg()
>>>>> variants into a single function ? Having to select the size manually in
>>>>> each call (either by picking the function variant, or by passing a size
>>>>> as a function parameter) is error-prone. Encoding the size in the
>>>>> register macro is much safer, easing both development and review.
>>>>>
>>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>>>> ---
>>>>>>>>  include/media/ovxxxx_16bit_addr_reg_helpers.h | 93 +++++++++++++++++++
>>>>>>>>  1 file changed, 93 insertions(+)
>>>>>>>>  create mode 100644 include/media/ovxxxx_16bit_addr_reg_helpers.h
>>>>>>>>
>>>>>>>> diff --git a/include/media/ovxxxx_16bit_addr_reg_helpers.h b/include/media/ovxxxx_16bit_addr_reg_helpers.h
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..e2ffee3d797a
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/include/media/ovxxxx_16bit_addr_reg_helpers.h
>>>>>>>> @@ -0,0 +1,93 @@
>>>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>>>> +/*
>>>>>>>> + * I2C register access helpers for Omnivision OVxxxx image sensors which expect
>>>>>>>> + * a 16 bit register address in big-endian format and which have 1-3 byte
>>>>>>>> + * wide registers, in big-endian format (for the higher width registers).
>>>>>>>> + *
>>>>>>>> + * Based on the register helpers from drivers/media/i2c/ov2680.c which is:
>>>>>>>> + * Copyright (C) 2018 Linaro Ltd
>>>>>>>> + */
>>>>>>>> +#ifndef __OVXXXX_16BIT_ADDR_REG_HELPERS_H
>>>>>>>> +#define __OVXXXX_16BIT_ADDR_REG_HELPERS_H
>>>>>>>> +
>>>>>>>> +#include <asm/unaligned.h>
>>>>>>>> +#include <linux/dev_printk.h>
>>>>>>>> +#include <linux/i2c.h>
>>>>>>>> +
>>>>>>>> +static inline int ovxxxx_read_reg(struct i2c_client *client, u16 reg,
>>>>>>>> +				  unsigned int len, u32 *val)
>>>>>>>> +{
>>>>>>>> +	struct i2c_msg msgs[2];
>>>>>>>> +	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
>>>>>>>> +	u8 data_buf[4] = { 0, };
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	if (len > 4)
>>>>>>>> +		return -EINVAL;
>>>>>>>> +
>>>>>>>> +	msgs[0].addr = client->addr;
>>>>>>>> +	msgs[0].flags = 0;
>>>>>>>> +	msgs[0].len = ARRAY_SIZE(addr_buf);
>>>>>>>> +	msgs[0].buf = addr_buf;
>>>>>>>> +
>>>>>>>> +	msgs[1].addr = client->addr;
>>>>>>>> +	msgs[1].flags = I2C_M_RD;
>>>>>>>> +	msgs[1].len = len;
>>>>>>>> +	msgs[1].buf = &data_buf[4 - len];
>>>>>>>> +
>>>>>>>> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>>>>>>>> +	if (ret != ARRAY_SIZE(msgs)) {
>>>>>>>> +		dev_err(&client->dev, "read error: reg=0x%4x: %d\n", reg, ret);
>>>>>>>> +		return -EIO;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	*val = get_unaligned_be32(data_buf);
>>>>>>>> +
>>>>>>>> +	return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +#define ovxxxx_read_reg8(s, r, v)	ovxxxx_read_reg(s, r, 1, v)
>>>>>>>> +#define ovxxxx_read_reg16(s, r, v)	ovxxxx_read_reg(s, r, 2, v)
>>>>>>>> +#define ovxxxx_read_reg24(s, r, v)	ovxxxx_read_reg(s, r, 3, v)
>>>>>>>> +
>>>>>>>> +static inline int ovxxxx_write_reg(struct i2c_client *client, u16 reg,
>>>>>>>> +				   unsigned int len, u32 val)
>>>>>>>> +{
>>>>>>>> +	u8 buf[6];
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	if (len > 4)
>>>>>>>> +		return -EINVAL;
>>>>>>>> +
>>>>>>>> +	put_unaligned_be16(reg, buf);
>>>>>>>> +	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
>>>>>>>> +	ret = i2c_master_send(client, buf, len + 2);
>>>>>>>> +	if (ret != len + 2) {
>>>>>>>> +		dev_err(&client->dev, "write error: reg=0x%4x: %d\n", reg, ret);
>>>>>>>> +		return -EIO;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +#define ovxxxx_write_reg8(s, r, v)	ovxxxx_write_reg(s, r, 1, v)
>>>>>>>> +#define ovxxxx_write_reg16(s, r, v)	ovxxxx_write_reg(s, r, 2, v)
>>>>>>>> +#define ovxxxx_write_reg24(s, r, v)	ovxxxx_write_reg(s, r, 3, v)
>>>>>>>> +
>>>>>>>> +static inline int ovxxxx_mod_reg(struct i2c_client *client, u16 reg, u8 mask, u8 val)
>>>>>>>> +{
>>>>>>>> +	u32 readval;
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	ret = ovxxxx_read_reg8(client, reg, &readval);
>>>>>>>> +	if (ret < 0)
>>>>>>>> +		return ret;
>>>>>>>> +
>>>>>>>> +	readval &= ~mask;
>>>>>>>> +	val &= mask;
>>>>>>>> +	val |= readval;
>>>>>>>> +
>>>>>>>> +	return ovxxxx_write_reg8(client, reg, val);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +#endif
> 

