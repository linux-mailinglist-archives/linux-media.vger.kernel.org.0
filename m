Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E384731507
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 12:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244914AbjFOKQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 06:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245382AbjFOKQk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 06:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8D6271E
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 03:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686824152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7pgP7UVhubru72z/gjrrKvy2991Kq99wDmbSW06Wmqg=;
        b=IM8Zb3nmsat0dL63aNCz7fKTeXIQBjF6klIezNwq6gG0lslBqQB0xUMV9eXojDhFysrlU8
        JA+4OHnoclAPFVP9V6Cr/sEwWRzqulzBFyKUYnf+cw2LvKztITB0gU051BGk0jommEHEBw
        mIUObOgDc3eECFfFstqBE5NhBf8Tswk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-ZpWhCatUOpKLaP-oGF2KjA-1; Thu, 15 Jun 2023 06:15:51 -0400
X-MC-Unique: ZpWhCatUOpKLaP-oGF2KjA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9829a080268so71592966b.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 03:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686824150; x=1689416150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pgP7UVhubru72z/gjrrKvy2991Kq99wDmbSW06Wmqg=;
        b=GZN4l9bK/JoJ263ls/v73a3TwTXYTOgJ98Q9Z3o4PxtKr8QrL/3EwuCOHaX7PFeMHi
         xQM+VvMGlokwRFNjMR25Qyjkj2rGQkRh256q3hUi4CfKEI5FadwYqxv2M0YX704Lj8fn
         Y2Q3FP2R4TVXEGBHByjOOj86mKSn7NVbPMSq5eipvlI8dO6HNIFadyuwoHsbq+fJe59R
         I6rYAKIkxlvfpYQrfC8eZoxE+XkMyFOdoaT75tLAld/+e7QTZ2fkoi8aQoDMm2Svx1pb
         d9AXsI/Wghdghcm5qKmm7Xt5/3SEnuk8QkeELR5ADwUh3DG25PatR5sVt522KIu/H5ob
         y3bg==
X-Gm-Message-State: AC+VfDwUkY6EuijJ+u9jI7PwhgsI0ijMnPkfSdKYP1Ym1rT0s1UUvBnn
        J7/7OtB2JgIcHCZV4qbYvVAygHikXZNRVdeiWaEZ6Oy39Q/F6cWUDk9Oi1stMLA4lXgzOb9F+nT
        MBZx0pIZDYl0te6PDLnDf2DrdGtNIUDQ=
X-Received: by 2002:a17:907:25ca:b0:94e:4489:f24d with SMTP id ae10-20020a17090725ca00b0094e4489f24dmr16637081ejc.61.1686824150123;
        Thu, 15 Jun 2023 03:15:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4F/zhsIJO2158SYTDNyDWv1IVfCkLHFr6JymQcvk0JeVReez9rkLDWHMyiKH0RClV73RqFbQ==
X-Received: by 2002:a17:907:25ca:b0:94e:4489:f24d with SMTP id ae10-20020a17090725ca00b0094e4489f24dmr16637072ejc.61.1686824149860;
        Thu, 15 Jun 2023 03:15:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dk17-20020a170906f0d100b0097886843f75sm9307038ejb.177.2023.06.15.03.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 03:15:48 -0700 (PDT)
Message-ID: <647c6bf0-2ad3-16bd-8081-7f4244f60938@redhat.com>
Date:   Thu, 15 Jun 2023 12:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
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
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIrf7Ku9LHRCIU5K@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/15/23 11:54, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Jun 15, 2023 at 10:45:35AM +0200, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 6/14/23 22:39, Sakari Ailus wrote:
> 
> ...
>>>> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
>>>> index 348559bc2468..523ba243261d 100644
>>>> --- a/drivers/media/v4l2-core/Kconfig
>>>> +++ b/drivers/media/v4l2-core/Kconfig
>>>> @@ -74,6 +74,11 @@ config V4L2_FWNODE
>>>>  config V4L2_ASYNC
>>>>  	tristate
>>>>  
>>>> +config V4L2_CCI
>>>> +	tristate
>>>> +	depends on I2C
>>>
>>> This won't do anything if the dependent driver will select V4L2_CCI, will
>>> it? I'd let the sensor driver depend on I2C instead. CCI is also supported
>>> on I3C, for instance.
>>
>> It will cause a Kconfig error if the dependent driver does not depend
>> on I2C. Kconfig items doing select MUST depend on all the depends on
>> of the items they are selecting; and (continued below)
> 
> Maybe this has changed? It used to be that these cases were silently
> ignored and it wasn't that long ago. I haven't been following this up.
> 
> Nevertheless, this shouldn't depend on I2C as such.
> 
>>
>>>
>>>> +	select REGMAP_I2C
>>>
>>> This is a good question.
>>>
>>> How about adding V4L2_CCI_I2C that would select REGMAP_I2C?
>>
>> v4l2-cci.ko uses the devm_regmap_init_i2c() symbol, so
>> REGMAP_I2C must be enabled when V4L2_CCI is enabled and
>> REGMAP_I2C is a symbol which should be selected rather
>> then depended on when necessary.
> 
> I agree.

If you agree that because of the symbol dependency that
the select REGMAP_I2C is necessary then the depends on I2C
is also necessary because any Kconfig symbol selecting
another symbol MUST depends on all of the dependencies
of the selected symbol and REGMAP_I2C has:

config REGMAP_I2C
        tristate
        depends on I2C

<snip>

> This is documented in
> Documentation/driver-api/media/maintainer-entry-profile.rst and media tree
> follows that.

Ah, I missed that. Ok, I'll run

./scripts/checkpatch.pl --strict --max-line-length=80

and fix the warnings, with maybe one or 2 exceptions
where longer lines really make the code more readable.

Regards,

Hans

