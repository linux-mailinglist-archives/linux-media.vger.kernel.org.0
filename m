Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5766C691F63
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 14:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbjBJNAA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 08:00:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbjBJM77 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 07:59:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451C513DF9
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 04:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676033951;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u9s4LT32fHU8u0qjdZ0lIIF4ADNtpgG8rrxOHrORXss=;
        b=IttY7nCvOi5CsFBgTyXrca8dKkQJckgT7fJf91Y5N5qOITnGIQ8U0NyJSxDx9EmEQlxUCU
        2n9lKY0nz9MVj78ipn0Q4msMqdDZY9ESblkVe2gB4BCoX2l5uJeAXDnx0LLFiuw8bucCRR
        Poc838XIyKAVmXHckZPnx1o8/1B4B94=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-sfWI0hsbN2OsTBzwFdmRSg-1; Fri, 10 Feb 2023 07:59:10 -0500
X-MC-Unique: sfWI0hsbN2OsTBzwFdmRSg-1
Received: by mail-ed1-f71.google.com with SMTP id s11-20020a056402520b00b004aada311135so3447164edd.9
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 04:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9s4LT32fHU8u0qjdZ0lIIF4ADNtpgG8rrxOHrORXss=;
        b=Hyn/JdRgD4Tg7JoYblpM9KzB2azf8/VesbqPG46tFS8t/DQwRVySazBwQOGjPayTX5
         zzceVNiDi3WhPdMqRUAYkbCgNsQtIUvevdR0KM5/DUsqfVTBngkll2ytIUgSFen0TdIG
         Nw8pGPJCkSXX/MvCzVBgkUPwj9nr1HNzR1MNyZ+lONJckyAwkV9sgdtBS5qaItY7yNTU
         ZcFPPDWjvqxlrvZ/mQBuTsmmpj39aXxmfi3yscJSjizZJsyNxQRuslpikb9J0Gl8DN5/
         /Q1eURZjj4gZYv56saw2FeglfIOXmHpGdCYLvM8rO3vu6ydGJ16MoFly+jDULcgkJOFm
         HU6w==
X-Gm-Message-State: AO0yUKXkOnPRh6O/BHvGnwI5V5EPUBCsIwAGsCWXbalwP7XpmCyc7H3l
        Z0NGdSHEWyiuLL02i7WDQXvrg9iuYRPwAKtAEWw/hBVRlq59lTAvdLuAXBQK110bwH4AMsvm0AG
        0d1k/Z+5GcfbiCO9oxeS3t/g=
X-Received: by 2002:a50:aa9a:0:b0:4ab:1f22:5e18 with SMTP id q26-20020a50aa9a000000b004ab1f225e18mr5544266edc.31.1676033949017;
        Fri, 10 Feb 2023 04:59:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8p2KhJOcmy5eBap8MqBCt+BkyZujJH2JnaK82u1pFGNtauquGEm3a7kkTuDQBjHCSLy5wnNA==
X-Received: by 2002:a50:aa9a:0:b0:4ab:1f22:5e18 with SMTP id q26-20020a50aa9a000000b004ab1f225e18mr5544248edc.31.1676033948752;
        Fri, 10 Feb 2023 04:59:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l7-20020a056402254700b0049dc0123f29sm2126717edb.61.2023.02.10.04.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:59:08 -0800 (PST)
Message-ID: <59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com>
Date:   Fri, 10 Feb 2023 13:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 <Y+Y1yWCGg5ORJEoh@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y+Y1yWCGg5ORJEoh@kekkonen.localdomain>
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

On 2/10/23 13:17, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Fri, Feb 10, 2023 at 02:09:02PM +0200, Laurent Pinchart wrote:
>> Hi Hans,
>>
>> On Fri, Feb 10, 2023 at 12:56:45PM +0100, Hans de Goede wrote:
>>> On 2/10/23 12:45, Laurent Pinchart wrote:
>>>> On Fri, Feb 10, 2023 at 12:20:36PM +0100, Hans de Goede wrote:
>>>>> On 2/9/23 17:11, Laurent Pinchart wrote:
>>>>>> On Thu, Feb 09, 2023 at 04:03:22PM +0100, Hans de Goede wrote:
>>>>>>> On 2/8/23 10:52, Laurent Pinchart wrote:
>>>>>>>> On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
>>>>>>>>> The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
>>>>>>>>> ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
>>>>>>>>> ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
>>>>>>>>>
>>>>>>>>> as well as various "atomisp" sensor drivers in drivers/staging, *all*
>>>>>>>>> use register access helpers with the following function prototypes:
>>>>>>>>>
>>>>>>>>> int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
>>>>>>>>>                     unsigned int len, u32 *val);
>>>>>>>>>
>>>>>>>>> int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
>>>>>>>>>                      unsigned int len, u32 val);
>>>>>>>>>
>>>>>>>>> To read/write registers on Omnivision OVxxxx image sensors wich expect
>>>>>>>>> a 16 bit register address in big-endian format and which have 1-3 byte
>>>>>>>>> wide registers, in big-endian format (for the higher width registers).
>>>>>>>>>
>>>>>>>>> Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
>>>>>>>>> versions of these register access helpers, so that this code duplication
>>>>>>>>> can be removed.
>>>>>>>>
>>>>>>>> Any reason to hand-roll those instead of using regmap ?
>>>>>>>
>>>>>>> These devices have a mix of 8 + 16 + 24 bit registers which regmap
>>>>>>> appears to not handle, a regmap has a single regmap_config struct
>>>>>>> with a single "@reg_bits: Number of bits in a register address, mandatory",
>>>>>>> so we would still need wrappers around regmap, at which point it
>>>>>>> really offers us very little.
>>>>>>
>>>>>> We could extend regmap too, although that may be too much yak shaving.
>>>>>> It would be nice, but I won't push hard for it.
>>>>>>
>>>>>>> Also I'm moving duplicate code present in many of the
>>>>>>> drivers/media/i2c/ov*.c files into a common header to remove
>>>>>>> duplicate code. The handrolling was already there before :)
>>>>>>>
>>>>>>> My goal with the new ovxxxx_16bit_addr_reg_helpers.h file was to
>>>>>>> offer something which is as much of a drop-in replacement of the
>>>>>>> current handrolled code as possible (usable with just a few
>>>>>>> search-n-replaces) as possible.
>>>>>>>
>>>>>>> Basically my idea here was to factor out code which I noticed was
>>>>>>> being repeated over and over again. My goal was not to completely
>>>>>>> redo how register accesses are done in these drivers.
>>>>>>>
>>>>>>> I realize I have not yet converted any other drivers, that is because
>>>>>>> I don't really have a way to test most of the other drivers. OTOH
>>>>>>> with the current helpers most conversions should be fairly simply
>>>>>>> and remove a nice amount of code. So maybe I should just only compile
>>>>>>> test the conversions ?
>>>>>>
>>>>>> Before you spend time converting drivers, I'd like to complete the
>>>>>> discussion regarding the design of those helpers. I'd rather avoid
>>>>>> mass-patching drivers now and doing it again in the next kernel release.
>>>>>
>>>>> I completely agree.
>>>>>
>>>>>> Sakari mentioned CCI (part of the CSI-2 specification). I think that
>>>>>> would be a good name to replace ov* here, as none of this is specific to
>>>>>> OmniVision.
>>>>>
>>>>> I did not realize this was CCI I agree renaming the helpers makes sense.
>>>>>
>>>>> I see there still is a lot of discussion going on.
>>>>
>>>> I haven't seen any disagreement regarding the cci prefix, so let's go
>>>> for that. I'd propose cci_read() and cci_write().
>>>>
>>>> Sakari, you and I would prefer layering this on top of regmap, while
>>>> Andy proposed extending the regmap API. Let's see if we reach an
>>>> anonymous agreement on this.
>>>>
>>>> Regarding the width-specific versions of the helpers, I really think
>>>> encoding the size in the register macros is the best option. It makes
>>>> life easier for driver authors (only one function to call, no need to
>>>> think about the register width to pick the appropriate function in each
>>>> call) and reviewers (same reason), without any drawback in my opinion.
>>>>
>>>> Another feature I'd like in these helpers is improved error handling. In
>>>> quite a few sensor drivers I've written, I've implemented the write
>>>> function as
>>>>
>>>> int foo_write(struct foo *foo, u32 reg, u32 val, int *err)
>>>> {
>>>> 	...
>>>> 	int ret;
>>>>
>>>> 	if (err && *err)
>>>> 		return *err;
>>>>
>>>> 	ret = real_write(...);
>>>> 	if (ret < 0) {
>>>> 		dev_err(...);
>>>> 		if (err)
>>>> 			*err = ret;
>>>> 	}
>>>>
>>>> 	return ret;
>>>> }
>>>>
>>>> This allows callers to write
>>>>
>>>> 	int ret = 0;
>>>>
>>>> 	foo_write(foo, REG_A, 0, &ret);
>>>> 	foo_write(foo, REG_B, 1, &ret);
>>>> 	foo_write(foo, REG_C, 2, &ret);
>>>> 	foo_write(foo, REG_D, 3, &ret);
>>>>
>>>> 	return ret;
>>>>
>>>> which massively simplifies error handling. I'd like the CCI write helper
>>>> to implement such a pattern.
>>>
>>> Interesting, I see that the passing of the err return pointer is optional,
>>> so we can still just do a search replace in existing code setting that
>>> to just NULL.
>>
>> And if someone dislikes having to pass NULL for the last argument, we
>> could use some macro magic to accept both the 3 arguments and 4
>> arguments variants.
>>
>> int __cci_write3(struct cci *cci, u32 reg, u32 val);
>> int __cci_write4(struct cci *cci, u32 reg, u32 val, int *err);
>>
>> #define __cci_write(_1, _2, _3, _4, NAME, ...) NAME
>> #define cci_write(...) __cci_write(__VA_ARGS__, __cci_write4, __cci_write3)(__VA_ARGS__)
> 
> This would be nice, yes.

Disagree, see my reply directly to Laurent.

> Who will now write the patches for this? :-)

I have already more or less volunteered / I opened this can of worms,
so that would be me...

I see in your other reply that you are fine with going without
wrappers for the fixed width accesses for now, good. TBH I don't
think these will add much value.

I'll try to make some time to work on this somewhere the next
couple of weeks.

Here is a rough sketch of the API for initial discussion:

/*
 * Note cci_reg_8 deliberately is 0, not 1, so that raw
 * (not wrapped in a CCI_REG*() macro) register addresses
 * do 8 bit wide accesses. This allows unchanged use of register
 * initialization lists of raw address, value pairs which only
 * do 8 bit width accesses.
 */
enum cci_reg_type {
	cci_reg_8 = 0,
	cci_reg_16,
	cci_reg_24,
	cci_reg_32,
};

/*
 * Macros to define register address with the register width encoded
 * into the higher bits. CCI_REG8() is a no-op so its use is optional.
 */
#define CCI_REG_SIZE_SHIFT		16
#define CCI_REG_ADDR_MASK		GENMASK(15, 0)

#define CCI_REG8(x)			((cci_reg_8 << CCI_REG_SIZE_SHIFT) | (x))
#define CCI_REG16(x)			((cci_reg_16 << CCI_REG_SIZE_SHIFT) | (x))
#define CCI_REG24(x)			((cci_reg_24 << CCI_REG_SIZE_SHIFT) | (x))
#define CCI_REG32(x)			((cci_reg_32 << CCI_REG_SIZE_SHIFT) | (x))

int cci_read(struct regmap *regmap, u32 reg, u32 *val, int *err);
int cci_write(struct regmap *regmap, u32 reg, u32 val, int *err);
int cci_update_bits(struct regmap *map, u32 reg, u32 mask, u32 val, int *err);
int cci_multi_reg_write(struct regmap *map, const struct reg_sequence *regs, int num_regs, int *err);

Note the regmap here is intended to be a regmap with 16 bit register-address
width and 8 bit register-data width. I'll add a helper to get the regmap
from an i2c_client to the initial implementation.

Also note that all the function names have been chosen to be 1:1 mirrors
of the matching regmap functions with the addition of the *err argument.

Regards,

Hans


