Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60CE731822
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 14:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344689AbjFOMGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 08:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344684AbjFOMGi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 08:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F22C82120
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 05:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686830708;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vT5YPefdclIvpGGO3OhnRz7E2rEkyVfPWr51ZrtvFrw=;
        b=OTWurTU++MlilIJ+vSezmjaBEQqTNVsxJW6Wsy408XseIHIy9LkwiAANGdRHFOSoIHrrVH
        eOpXxXekZ+HW6tZQJL+6BBdUyBOD/ldwqTgHdAhgyS8U+SQP2Y6vIWDSSQHY/CouO4tbku
        HNffERtt9rGCFc9kY0KFNu9cT8Y4L4A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-C1myEKQpN_Cmy9UJuR1nnA-1; Thu, 15 Jun 2023 08:05:06 -0400
X-MC-Unique: C1myEKQpN_Cmy9UJuR1nnA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-98286c6cbeaso108209766b.1
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 05:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686830704; x=1689422704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vT5YPefdclIvpGGO3OhnRz7E2rEkyVfPWr51ZrtvFrw=;
        b=IJ1ThamFFl/2XstCMuQNp5vjTmVaiHhhROm3BTVUCD+3SWU7T0Ie5T0cA5+3baEpUq
         kiC9R99yniY+ys+KlMp/ZYhkvpPC1qPOnBmBxI3BCB9dXogUMb1AupwCWl6f2fDid1FP
         xu2Yc7FiA6o4yi15eU03MQwLPmOx3PaMgWJv3qxgJVIu3ZnEsL6l16A0Ca98i62D6OR/
         NxHSCxVKsotpAndlbVk7chlnXpsBNi5+lGvxCfFOp033vqivFCnqGmBMsUQ2QufxhTgy
         4DDR18NSPhmXbr7jzvI7sYozTqAccOiTAJ29C3jMIHtiPqaIhUm6s0LgJcIFeZQeVJQ9
         tUpw==
X-Gm-Message-State: AC+VfDy9Hba3NpN0th3MFvVZF+Cxlxw3hKFuH4nr7jyeQH1oFgTfY4K1
        Xhz88P4LCvnrhUV97uC0m/TTqJRXd7FVM5r5E9W+ng349Le01XCsoBtCn7QpHD1eplFC7hnsO0f
        FUsUHCiZ7T+t0djbKqk2rYJ6G//0OTsI=
X-Received: by 2002:a17:907:9710:b0:96f:a8c2:77ad with SMTP id jg16-20020a170907971000b0096fa8c277admr19369310ejc.63.1686830704427;
        Thu, 15 Jun 2023 05:05:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7GulmIezcwMd23dOmH6wBBpIItmUdT6BbLJuOngoRrGGTvc/jQbHnr7Wc1MPsfq8Bvf+pFXw==
X-Received: by 2002:a17:907:9710:b0:96f:a8c2:77ad with SMTP id jg16-20020a170907971000b0096fa8c277admr19369292ejc.63.1686830704126;
        Thu, 15 Jun 2023 05:05:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090668c900b0098242730348sm3189777ejr.72.2023.06.15.05.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 05:05:02 -0700 (PDT)
Message-ID: <f10d2b2d-1496-936c-c609-38279d8f6262@redhat.com>
Date:   Thu, 15 Jun 2023 14:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <4c9b2cec-e026-e527-2253-fc541ec85d05@redhat.com>
 <ZIrf7Ku9LHRCIU5K@kekkonen.localdomain>
 <647c6bf0-2ad3-16bd-8081-7f4244f60938@redhat.com>
 <ZIr41hzdphg1UbJy@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIr41hzdphg1UbJy@kekkonen.localdomain>
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

On 6/15/23 13:41, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Jun 15, 2023 at 12:15:47PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 6/15/23 11:54, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Thu, Jun 15, 2023 at 10:45:35AM +0200, Hans de Goede wrote:
>>>> Hi Sakari,
>>>>
>>>> On 6/14/23 22:39, Sakari Ailus wrote:
>>>
>>> ...
>>>>>> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
>>>>>> index 348559bc2468..523ba243261d 100644
>>>>>> --- a/drivers/media/v4l2-core/Kconfig
>>>>>> +++ b/drivers/media/v4l2-core/Kconfig
>>>>>> @@ -74,6 +74,11 @@ config V4L2_FWNODE
>>>>>>  config V4L2_ASYNC
>>>>>>  	tristate
>>>>>>  
>>>>>> +config V4L2_CCI
>>>>>> +	tristate
>>>>>> +	depends on I2C
>>>>>
>>>>> This won't do anything if the dependent driver will select V4L2_CCI, will
>>>>> it? I'd let the sensor driver depend on I2C instead. CCI is also supported
>>>>> on I3C, for instance.
>>>>
>>>> It will cause a Kconfig error if the dependent driver does not depend
>>>> on I2C. Kconfig items doing select MUST depend on all the depends on
>>>> of the items they are selecting; and (continued below)
>>>
>>> Maybe this has changed? It used to be that these cases were silently
>>> ignored and it wasn't that long ago. I haven't been following this up.
>>>
>>> Nevertheless, this shouldn't depend on I2C as such.
>>>
>>>>
>>>>>
>>>>>> +	select REGMAP_I2C
>>>>>
>>>>> This is a good question.
>>>>>
>>>>> How about adding V4L2_CCI_I2C that would select REGMAP_I2C?
>>>>
>>>> v4l2-cci.ko uses the devm_regmap_init_i2c() symbol, so
>>>> REGMAP_I2C must be enabled when V4L2_CCI is enabled and
>>>> REGMAP_I2C is a symbol which should be selected rather
>>>> then depended on when necessary.
>>>
>>> I agree.
>>
>> If you agree that because of the symbol dependency that
>> the select REGMAP_I2C is necessary then the depends on I2C
>> is also necessary because any Kconfig symbol selecting
>> another symbol MUST depends on all of the dependencies
>> of the selected symbol and REGMAP_I2C has:
>>
>> config REGMAP_I2C
>>         tristate
>>         depends on I2C
> 
> Yes.
> 
> How about putting cci_regmap_init_i2c() behind an #ifdef? Then there
> wouldn't be a need for REGMAP_I2C unconditionally, but dependent on I2C.
> 
> I guess right now I2C is more or less given in many systems but binding CCI
> to it still seems dubious.

Yes, I can wrap the cci_regmap_init_i2c() prototype +
implementation in

#ifdef CONFIG_REGMAP_I2C

for version 4. Downside of this is that all i2c sensor drivers
which want to use the CCI helpers now will need to have
a select REGMAP_I2C added to their Kconfig snippet.

Regards,

Hans



	

> 
>>
>> <snip>
>>
>>> This is documented in
>>> Documentation/driver-api/media/maintainer-entry-profile.rst and media tree
>>> follows that.
>>
>> Ah, I missed that. Ok, I'll run
>>
>> ./scripts/checkpatch.pl --strict --max-line-length=80
>>
>> and fix the warnings, with maybe one or 2 exceptions
>> where longer lines really make the code more readable.
> 
> Thank you.
> 

