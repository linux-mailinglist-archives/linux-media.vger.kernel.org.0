Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3576B73181C
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 14:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239477AbjFOMFV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 08:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344779AbjFOME4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 08:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02EB93C0D
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686830459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kD3h/k9O0bVkDHxd9+fBaMq2PHH/xCzYDUDCXj2youw=;
        b=IoxRCf8CMJlDV0clmTYDcvMjWBsLrz7bo8mAENWtLZnGOGfXbls5S1LUqvRYHq7g+Ql4nu
        inaEtxGbBUBqSBHwaiFO3a2gTEcr3qZkjBgHzzx7Esu30l/r7JVji7mchp4nPtLiQefoUU
        cX1sGEtym3qUQ0QZsEPKV3IxQ1QaPRM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-9GQHYptyP0Ss2lCuRjGNoA-1; Thu, 15 Jun 2023 08:00:58 -0400
X-MC-Unique: 9GQHYptyP0Ss2lCuRjGNoA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-977d0333523so173558466b.0
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 05:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686830457; x=1689422457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kD3h/k9O0bVkDHxd9+fBaMq2PHH/xCzYDUDCXj2youw=;
        b=chxKLPnz1G/vwrytxt1wuP2Ye6cQhro4XsYdiIVNR1QQzhsSczaqUTLeEXABqTC2QB
         I9NL6ANiXQZHiK0SmU4zqYRQWy6S7MK5eiZJcVc6xKXuu7e8lq2yrD1VJ5qo1QiiIcUJ
         GQZ0kJpEuqhvlC/iDX0N+TLGROTr3MO4MnrVKu2NAMNp4eaBzcNxMoj53x3w3hm1VRgj
         0aDqroj3VqT9ykiPQunOgwPBEUkkbLWlofiyw1zLbK2BJQp55zKkppllaKXrN2pILLsF
         bppNy5t3aPhAceDdXz8OXQK2KMXjBs6DZLdBZl6TPkWS9zkjZQgqZ1ojHEImM2uvHB9F
         SOhw==
X-Gm-Message-State: AC+VfDyStFsfkWqZ9E90nnYZV8bFu9LNVtIzq+nb2XNVV7LYISZT3XPM
        oo37YZ5hSsO05lebE43zspHfYZwevqQEVoVGrbqaGq+Bc4YPwPb/DFu5LFZ/y0gcvqCb6/ey4OS
        lnqZLs+Vhd89vHiMD7HbGSR8=
X-Received: by 2002:a17:906:fe4d:b0:974:1e0e:91ee with SMTP id wz13-20020a170906fe4d00b009741e0e91eemr18685456ejb.13.1686830456720;
        Thu, 15 Jun 2023 05:00:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7sQL9xrjtsfV5L1FNTv+2XqHLSetesYNfJGFWLneBTcmh9xKfwxLZ9F5oYftCTO+VpN5Cjdg==
X-Received: by 2002:a17:906:fe4d:b0:974:1e0e:91ee with SMTP id wz13-20020a170906fe4d00b009741e0e91eemr18685433ejb.13.1686830456386;
        Thu, 15 Jun 2023 05:00:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bl5-20020a170906c24500b00982b8cd7a44sm389675ejb.139.2023.06.15.05.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 05:00:48 -0700 (PDT)
Message-ID: <3b79c522-4bba-fd38-e087-8a506ae14a23@redhat.com>
Date:   Thu, 15 Jun 2023 14:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
To:     Tommaso Merciai <tomm.merciai@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <20230614213429.GA28757@pendragon.ideasonboard.com>
 <ZIo1kHgYMK84iMj7@kekkonen.localdomain>
 <b8e5f3f7-d82d-390b-ac63-824a42c3f6cd@redhat.com>
 <20230615092100.GE741@pendragon.ideasonboard.com>
 <ZIriVxMVVxG2dsUO@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <71aa3c7e-5bb2-afe6-a9a5-390307a8b3f9@redhat.com>
 <ZIr1YVf15ZBJvguX@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZIr8CFZzq0MttUf+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIr8CFZzq0MttUf+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 6/15/23 13:54, Tommaso Merciai wrote:
> On Thu, Jun 15, 2023 at 01:26:25PM +0200, Tommaso Merciai wrote:
>> Hi Hans,
>>
>> On Thu, Jun 15, 2023 at 01:10:40PM +0200, Hans de Goede wrote:
>>> Hi Tommaso,
>>>
>>> On 6/15/23 12:05, Tommaso Merciai wrote:
>>>> Hi Hans, Laurent, Sakari,
>>>>
>>>> Can I cherry-pick this patch and use these new functions also
>>>> for cci regs of the alvium driver?
>>>
>>> Yes that sounds like a good plan.
>>>
>>>> Are on going to be merge?
>>>
>>> Yes this will hopefully get merged upstream soon.
>>
>> Thanks for the info!
>>
>> I want to ask you your opinion about this:
>>
>> Into alvium driver actually I'm using the following defines
>> manipulations:
>>
>> #define REG_BCRM_REG_ADDR_R				REG_BCRM_CCI_16BIT(0x0014)
>>
>> #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
>> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R		REG_BCRM_V4L2_64BIT(0x0010)
>>
>> My plan is to use your cci API for cci register in this way defines
>> became like:
>>
>> #define REG_BCRM_REG_ADDR_R				CCI_REG16(0x0014)
>>
>> And leave v4l2 regs are it are right now:
>>
>> #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
>> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R		REG_BCRM_V4L2_64BIT(0x0010)
>>
>> What do you think about?
> 
> Or maybe is worth don't use v4l2 bit for v4l2 regs, I think is implicit
> that what regs that are not CCI are v4l2, then we return wit the
> following defines:
> 
> 
> 
> #define REG_BCRM_REG_ADDR_R                           CCI_REG16(0x0014)
> ^CCI regs
> 
> #define REG_BCRM_FEATURE_INQUIRY_R                    0x0008 
> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R            0x0010
> ^v4l2 regs

I'm not sure what you mean with "V4L2" registers ? I guess you mean
registers which cannot be accessed through the CCI helper functions,
but starting with v2 this is no longer true. There now is a CCI_REG64()
so you can simply use that.

Regards,

Hans



> 
> ?
> 
>>
>>>
>>> Note I'm about to send out a v3 addressing some small
>>> remarks on this v2. I'll Cc you on that.
>>
>> Thanks, in this way I can test that and let you know my feedback.
>>
>> Regards,
>> Tommaso
>>
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>>>
>>>> Let me know.
>>>> Thanks! :)
>>>>
>>>> Regards,
>>>> Tommaso
>>>>
>>>> On Thu, Jun 15, 2023 at 12:21:00PM +0300, Laurent Pinchart wrote:
>>>>> On Thu, Jun 15, 2023 at 11:11:20AM +0200, Hans de Goede wrote:
>>>>>> Hi Sakari,
>>>>>>
>>>>>> On 6/14/23 23:48, Sakari Ailus wrote:
>>>>>>> Hi Laurent,
>>>>>>>
>>>>>>> On Thu, Jun 15, 2023 at 12:34:29AM +0300, Laurent Pinchart wrote:
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> On Wed, Jun 14, 2023 at 08:39:56PM +0000, Sakari Ailus wrote:
>>>>>>>>> On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:
>>>>>>>>>> The CSI2 specification specifies a standard method to access camera sensor
>>>>>>>>>> registers called "Camera Control Interface (CCI)".
>>>>>>>>>>
>>>>>>>>>> This uses either 8 or 16 bit (big-endian wire order) register addresses
>>>>>>>>>> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
>>>>>>>>>>
>>>>>>>>>> Currently a lot of Linux camera sensor drivers all have their own custom
>>>>>>>>>> helpers for this, often copy and pasted from other drivers.
>>>>>>>>>>
>>>>>>>>>> Add a set of generic helpers for this so that all sensor drivers can
>>>>>>>>>> switch to a single common implementation.
>>>>>>>>>>
>>>>>>>>>> These helpers take an extra optional "int *err" function parameter,
>>>>>>>>>> this can be used to chain a bunch of register accesses together with
>>>>>>>>>> only a single error check at the end, rather then needing to error
>>>>>>>>>> check each individual register access. The first failing call will
>>>>>>>>>> set the contents of err to a non 0 value and all other calls will
>>>>>>>>>> then become no-ops.
>>>>>>>>>>
>>>>>>>>>> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
>>>>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>>>>>> ---
>>>>>>>>>> Changes in v2:
>>>>>>>>>> - Drop cci_reg_type enum
>>>>>>>>>> - Make having an encoded reg-width mandatory rather then using 0 to encode
>>>>>>>>>>   8 bit width making reg-addresses without an encoded width default to
>>>>>>>>>>   a width of 8
>>>>>>>>>> - Add support for 64 bit wide registers
>>>>>>>>
>>>>>>>> I'm in two minds about this. This means that the read and write
>>>>>>>> functions take a u64 argument, which will be less efficient on 32-bit
>>>>>>>> platforms. I think it would be possible, with some macro magic, to
>>>>>>>> accept different argument sizes, but maybe that's a micro-optimization
>>>>>>>> that would actually result in worse code. 
>>>>>>>>
>>>>>>>> 64-bit support could be useful, but as far as I can tell, it's not used
>>>>>>>> in this series, so maybe we could leave this for later ?
>>>>>>>
>>>>>>> I prefer to have it now, I just told Tommaso working on the Alvium driver
>>>>>>> to use this, and he needs 64-bit access. :-)
>>>>>>>
>>>>>>> You could also easily have 32-bit and 64-bit variant of the functions, with
>>>>>>> C11 _Generic(). Introducing it now would be easier than later.
>>>>>>
>>>>>> I took a quick look at C11 _Generic() and that looks at the type
>>>>>> of "things" so in this case it would look at type of the val argument.
>>>>>>
>>>>>> Problem is that that can still be e.g. an int when doing a
>>>>>> read/write from a 64 bit registers.
>>>>>>
>>>>>> So we would then need to handle the 64 bit width case in the 32
>>>>>> bit versions of the functions too.
>>>>>>
>>>>>> And likewise I can see someone passing a long on a 64 bit
>>>>>> arch while doing a cci_write() to a non 64 bit register.
>>>>>>
>>>>>> So this would basically mean copy and pasting cci_read()
>>>>>> + cci_write() 2x with the only difference being one
>>>>>> variant taking a 32 bit val argument and the other a
>>>>>> 64 bit val argument.
>>>>>>
>>>>>> This seems like premature optimization to me.
>>>>>>
>>>>>> As mentioned in my reply to Laurent if we want to
>>>>>> optimize things we really should look at avoiding
>>>>>> unnecessary i2c transfers, or packing multiple
>>>>>> writes into a single i2c transfer for writes to
>>>>>> subsequent registers. That is where significant
>>>>>> speedups can be made.
>>>>>
>>>>> This is something I'd really like to see, but it's way more work.
>>>>>
>>>>> There's an important need of applying changes atomically, which is often
>>>>> not possible to strictly guarantee over I2C. Userspace ends up writing
>>>>> V4L2 controls as quickly as it can after the start of a frame, hoping
>>>>> they will all reach the sensor before the end of the frame. Some
>>>>> platforms have camera-specific I2C controllers that have the ability to
>>>>> buffer I2C transfers and issue them based on a hardware trigger. How to
>>>>> fit this in thé kernel I2C API will be an interesting exercise.
>>>>>
>>>>> -- 
>>>>> Regards,
>>>>>
>>>>> Laurent Pinchart
>>>>
>>>
> 

