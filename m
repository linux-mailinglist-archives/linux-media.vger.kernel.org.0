Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77C06731A84
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 15:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344104AbjFONxW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 09:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343756AbjFONxV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 09:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A1B294A
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 06:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686837142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2MbtrcHmP6e8ZGfC03ZOLMF4iHjJBxErJL9JPNYPMX0=;
        b=NNRRPNFbHkUHUqn67zWVsVqz0z+3r3ccl2oxcknSSURLxzorVdWgHalGiSrgsZb3jLz06i
        82pDGbHodKgbQODuSU/+qhaj3ppsU6KIqc/CCUYQGWbidc10jAEFeTHiHkPAEKcKda9yKy
        NnqlQjWHYG6o19m+abq38HUzKPwPokM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-QE0EQ4g3MyGR3JS-BpIVhQ-1; Thu, 15 Jun 2023 09:52:20 -0400
X-MC-Unique: QE0EQ4g3MyGR3JS-BpIVhQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-982a57942c1so66461666b.1
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 06:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686837139; x=1689429139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MbtrcHmP6e8ZGfC03ZOLMF4iHjJBxErJL9JPNYPMX0=;
        b=FGUPDcnuq3dTvBDYct/IF/hbNrMYZXLNg3Gw1LBgY6LOk9/ceXInjLwAzD2qf+if82
         tg8DZf15KSIxWQOwMRyMv4JKF9Q2gq4GpwjwSeB0o24/H5Jn5omVwUPhCe0cGI8qk5QN
         r4ZHsUOjk7EOWDN4A9SUIPaJ1uVmTinDRiA7amnac/SiwQgV/uHQPQCgQ3WRGEerdkjc
         8y2mV/QfpVYvzr7iwVriZ2UrOrYU2lPA9ANjL8nODcT20IV6D+zyeirMH7C131tT4NBz
         1WcB22BCT4GtZdl5FxA6kg3ItDNrlg+Er35U2J4xv1Pufy0n/OxJIU/8OOsMZ5BPIsLv
         F/zw==
X-Gm-Message-State: AC+VfDyt1VNS1pMC1jQENenS/ecxyIvDCAv/yaxA9N/ybt4u/QG69/F9
        EWWJCXnQOrm4oAA+YF8rEg3NGaSdF0S0XmZBcnKxV3LhgU0hn+wL7yT+rDcca4Xjn1st5eEj0D9
        Z4w9Lz7Iq0EjrQ2NU0fiYh9I=
X-Received: by 2002:a17:907:705:b0:96f:cde5:5f5e with SMTP id xb5-20020a170907070500b0096fcde55f5emr16154730ejb.29.1686837139281;
        Thu, 15 Jun 2023 06:52:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lTusdSnfFDC12hn4rtCV7u5c909RR0YaAS3ZA5luvLZ254qNhkxXU3KMpP2N55K71OOOW5g==
X-Received: by 2002:a17:907:705:b0:96f:cde5:5f5e with SMTP id xb5-20020a170907070500b0096fcde55f5emr16154723ejb.29.1686837138951;
        Thu, 15 Jun 2023 06:52:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a11-20020a170906684b00b0096a91ab434fsm9271828ejs.40.2023.06.15.06.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 06:52:16 -0700 (PDT)
Message-ID: <510f03ac-9d88-e15d-1082-6c96d7042a74@redhat.com>
Date:   Thu, 15 Jun 2023 15:52:15 +0200
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
 <f10d2b2d-1496-936c-c609-38279d8f6262@redhat.com>
 <ZIsP4ohiO7gHi+eC@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIsP4ohiO7gHi+eC@kekkonen.localdomain>
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

On 6/15/23 15:19, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Jun 15, 2023 at 02:05:02PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 6/15/23 13:41, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Thu, Jun 15, 2023 at 12:15:47PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 6/15/23 11:54, Sakari Ailus wrote:
>>>>> Hi Hans,
>>>>>
>>>>> On Thu, Jun 15, 2023 at 10:45:35AM +0200, Hans de Goede wrote:
>>>>>> Hi Sakari,
>>>>>>
>>>>>> On 6/14/23 22:39, Sakari Ailus wrote:
>>>>>
>>>>> ...
>>>>>>>> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
>>>>>>>> index 348559bc2468..523ba243261d 100644
>>>>>>>> --- a/drivers/media/v4l2-core/Kconfig
>>>>>>>> +++ b/drivers/media/v4l2-core/Kconfig
>>>>>>>> @@ -74,6 +74,11 @@ config V4L2_FWNODE
>>>>>>>>  config V4L2_ASYNC
>>>>>>>>  	tristate
>>>>>>>>  
>>>>>>>> +config V4L2_CCI
>>>>>>>> +	tristate
>>>>>>>> +	depends on I2C
>>>>>>>
>>>>>>> This won't do anything if the dependent driver will select V4L2_CCI, will
>>>>>>> it? I'd let the sensor driver depend on I2C instead. CCI is also supported
>>>>>>> on I3C, for instance.
>>>>>>
>>>>>> It will cause a Kconfig error if the dependent driver does not depend
>>>>>> on I2C. Kconfig items doing select MUST depend on all the depends on
>>>>>> of the items they are selecting; and (continued below)
>>>>>
>>>>> Maybe this has changed? It used to be that these cases were silently
>>>>> ignored and it wasn't that long ago. I haven't been following this up.
>>>>>
>>>>> Nevertheless, this shouldn't depend on I2C as such.
>>>>>
>>>>>>
>>>>>>>
>>>>>>>> +	select REGMAP_I2C
>>>>>>>
>>>>>>> This is a good question.
>>>>>>>
>>>>>>> How about adding V4L2_CCI_I2C that would select REGMAP_I2C?
>>>>>>
>>>>>> v4l2-cci.ko uses the devm_regmap_init_i2c() symbol, so
>>>>>> REGMAP_I2C must be enabled when V4L2_CCI is enabled and
>>>>>> REGMAP_I2C is a symbol which should be selected rather
>>>>>> then depended on when necessary.
>>>>>
>>>>> I agree.
>>>>
>>>> If you agree that because of the symbol dependency that
>>>> the select REGMAP_I2C is necessary then the depends on I2C
>>>> is also necessary because any Kconfig symbol selecting
>>>> another symbol MUST depends on all of the dependencies
>>>> of the selected symbol and REGMAP_I2C has:
>>>>
>>>> config REGMAP_I2C
>>>>         tristate
>>>>         depends on I2C
>>>
>>> Yes.
>>>
>>> How about putting cci_regmap_init_i2c() behind an #ifdef? Then there
>>> wouldn't be a need for REGMAP_I2C unconditionally, but dependent on I2C.
>>>
>>> I guess right now I2C is more or less given in many systems but binding CCI
>>> to it still seems dubious.
>>
>> Yes, I can wrap the cci_regmap_init_i2c() prototype +
>> implementation in
>>
>> #ifdef CONFIG_REGMAP_I2C
>>
>> for version 4. Downside of this is that all i2c sensor drivers
>> which want to use the CCI helpers now will need to have
>> a select REGMAP_I2C added to their Kconfig snippet.
> 
> Not if you add a new option for V4L2_CCI, a bit like you suggested for
> sensor driver dependencies in general:
> 
> config V4L2_CCI_I2C
> 	tristate
> 	depends on I2C
> 	select REGMAP_I2C
> 	select V4L2_CCI
> 
> So individual drivers would then select this instead of the plain V4L2_CCI.
> 
> The same could later on be done for I3C.

Ack, I'll do that for v4. But first lets see if there is
going to be more feedback on v3.

Regards,

Hans


