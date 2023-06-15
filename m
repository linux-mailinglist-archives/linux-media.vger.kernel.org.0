Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6556E73162C
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 13:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjFOLLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 07:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbjFOLLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 07:11:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7159273F
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 04:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686827445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BUlKzng6BNBxOspdby7iSVqKPHjcpXih5/ENXi1Jtnk=;
        b=Gl6GR6On6Pu2aWdLiqEkofs43TNSSwk9tTIIvOwp4TIUW/8fTm9yJgdyU11vjD6LfCfRgE
        a7A69H8N8MwIvmi5yQx/1pJ81AQLdNcIgDHR5Z7wGGNblR9sny63thyZ5bdJIXBPLT6ssF
        v0YMtSALI4MrSyPlWvAUlvkOtGjPMc8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-piuoa8WEObqFKNzLeE1e1g-1; Thu, 15 Jun 2023 07:10:44 -0400
X-MC-Unique: piuoa8WEObqFKNzLeE1e1g-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-51836731bfbso3461906a12.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 04:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686827443; x=1689419443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUlKzng6BNBxOspdby7iSVqKPHjcpXih5/ENXi1Jtnk=;
        b=R0Yuj1j3VqwfP3bytr9nRZI53Bbei3/L7eRj+BN9goHoU9ANI8zlbAaAmxP3JUnuhW
         JyGotZXuDoUSmcOq3VQEdxMkDxZh4PbrVBgJRtteP8pB9sRStHznvuBGVgNRedtKOcOB
         Y2Qu7nNJhLoaeqsqRzbLFaVj1o0Ugb07K5Lm64Eth/8QiamD828xV+28DCw6ux/KadO9
         xnYwKbPGEjy6QzrQuMqLzNhgwn4S+tMgPykNtxBR5x7XEPMwQ4c7IizDF6RAq6ttXOHT
         2D6TA/tpAdznQeGAGs/B6dw2ud69GD6rlpDalASMCCZvs6gQMGYPyaC2MWFxOeJzaX2o
         40Bw==
X-Gm-Message-State: AC+VfDwtrz+mB39Gk52tW0rUPYOL/eEmaTWgoy71ytGEKFV73r5yJqHI
        t0DZkwkQtMdU7RfWV9Qn5f/++fOKwfZ/JzFz44mVLAhGijMILiw9WOg/KSUN4ju6x9RHzpuvZQ5
        MFl5SlH44SZtTBuv3qPIp34tnZhqAI+8=
X-Received: by 2002:aa7:c90a:0:b0:516:4e6b:fa46 with SMTP id b10-20020aa7c90a000000b005164e6bfa46mr9952930edt.31.1686827442739;
        Thu, 15 Jun 2023 04:10:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5g/BCNGecz9d8/etOu7qdzEcSUVZhCwDr+LyXf+W+AiZF8LdF5mt4Rzt4Wu4o5YL5WNKtztQ==
X-Received: by 2002:aa7:c90a:0:b0:516:4e6b:fa46 with SMTP id b10-20020aa7c90a000000b005164e6bfa46mr9952919edt.31.1686827442334;
        Thu, 15 Jun 2023 04:10:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x6-20020aa7d386000000b00514bb73b8casm8653929edq.57.2023.06.15.04.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 04:10:41 -0700 (PDT)
Message-ID: <71aa3c7e-5bb2-afe6-a9a5-390307a8b3f9@redhat.com>
Date:   Thu, 15 Jun 2023 13:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Content-Language: en-US, nl
To:     Tommaso Merciai <tomm.merciai@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIriVxMVVxG2dsUO@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tommaso,

On 6/15/23 12:05, Tommaso Merciai wrote:
> Hi Hans, Laurent, Sakari,
> 
> Can I cherry-pick this patch and use these new functions also
> for cci regs of the alvium driver?

Yes that sounds like a good plan.

> Are on going to be merge?

Yes this will hopefully get merged upstream soon.

Note I'm about to send out a v3 addressing some small
remarks on this v2. I'll Cc you on that.

Regards,

Hans


> 
> Let me know.
> Thanks! :)
> 
> Regards,
> Tommaso
> 
> On Thu, Jun 15, 2023 at 12:21:00PM +0300, Laurent Pinchart wrote:
>> On Thu, Jun 15, 2023 at 11:11:20AM +0200, Hans de Goede wrote:
>>> Hi Sakari,
>>>
>>> On 6/14/23 23:48, Sakari Ailus wrote:
>>>> Hi Laurent,
>>>>
>>>> On Thu, Jun 15, 2023 at 12:34:29AM +0300, Laurent Pinchart wrote:
>>>>> Hello,
>>>>>
>>>>> On Wed, Jun 14, 2023 at 08:39:56PM +0000, Sakari Ailus wrote:
>>>>>> On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:
>>>>>>> The CSI2 specification specifies a standard method to access camera sensor
>>>>>>> registers called "Camera Control Interface (CCI)".
>>>>>>>
>>>>>>> This uses either 8 or 16 bit (big-endian wire order) register addresses
>>>>>>> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
>>>>>>>
>>>>>>> Currently a lot of Linux camera sensor drivers all have their own custom
>>>>>>> helpers for this, often copy and pasted from other drivers.
>>>>>>>
>>>>>>> Add a set of generic helpers for this so that all sensor drivers can
>>>>>>> switch to a single common implementation.
>>>>>>>
>>>>>>> These helpers take an extra optional "int *err" function parameter,
>>>>>>> this can be used to chain a bunch of register accesses together with
>>>>>>> only a single error check at the end, rather then needing to error
>>>>>>> check each individual register access. The first failing call will
>>>>>>> set the contents of err to a non 0 value and all other calls will
>>>>>>> then become no-ops.
>>>>>>>
>>>>>>> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>>> ---
>>>>>>> Changes in v2:
>>>>>>> - Drop cci_reg_type enum
>>>>>>> - Make having an encoded reg-width mandatory rather then using 0 to encode
>>>>>>>   8 bit width making reg-addresses without an encoded width default to
>>>>>>>   a width of 8
>>>>>>> - Add support for 64 bit wide registers
>>>>>
>>>>> I'm in two minds about this. This means that the read and write
>>>>> functions take a u64 argument, which will be less efficient on 32-bit
>>>>> platforms. I think it would be possible, with some macro magic, to
>>>>> accept different argument sizes, but maybe that's a micro-optimization
>>>>> that would actually result in worse code. 
>>>>>
>>>>> 64-bit support could be useful, but as far as I can tell, it's not used
>>>>> in this series, so maybe we could leave this for later ?
>>>>
>>>> I prefer to have it now, I just told Tommaso working on the Alvium driver
>>>> to use this, and he needs 64-bit access. :-)
>>>>
>>>> You could also easily have 32-bit and 64-bit variant of the functions, with
>>>> C11 _Generic(). Introducing it now would be easier than later.
>>>
>>> I took a quick look at C11 _Generic() and that looks at the type
>>> of "things" so in this case it would look at type of the val argument.
>>>
>>> Problem is that that can still be e.g. an int when doing a
>>> read/write from a 64 bit registers.
>>>
>>> So we would then need to handle the 64 bit width case in the 32
>>> bit versions of the functions too.
>>>
>>> And likewise I can see someone passing a long on a 64 bit
>>> arch while doing a cci_write() to a non 64 bit register.
>>>
>>> So this would basically mean copy and pasting cci_read()
>>> + cci_write() 2x with the only difference being one
>>> variant taking a 32 bit val argument and the other a
>>> 64 bit val argument.
>>>
>>> This seems like premature optimization to me.
>>>
>>> As mentioned in my reply to Laurent if we want to
>>> optimize things we really should look at avoiding
>>> unnecessary i2c transfers, or packing multiple
>>> writes into a single i2c transfer for writes to
>>> subsequent registers. That is where significant
>>> speedups can be made.
>>
>> This is something I'd really like to see, but it's way more work.
>>
>> There's an important need of applying changes atomically, which is often
>> not possible to strictly guarantee over I2C. Userspace ends up writing
>> V4L2 controls as quickly as it can after the start of a frame, hoping
>> they will all reach the sensor before the end of the frame. Some
>> platforms have camera-specific I2C controllers that have the ability to
>> buffer I2C transfers and issue them based on a hardware trigger. How to
>> fit this in thé kernel I2C API will be an interesting exercise.
>>
>> -- 
>> Regards,
>>
>> Laurent Pinchart
> 

