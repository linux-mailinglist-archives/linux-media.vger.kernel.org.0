Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48ABA726554
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237287AbjFGQAD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbjFGQAC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED9A199D
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686153553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9rlkpj1joxESPA2xm5MbHF/L7J9bz0RN/LZqSF2toBk=;
        b=hUeW8AyukAm2hhCeFvUKUjyFn21YcdVsp63BLls3vGWrhHG6il07t/sx95ZmPPDD+VqR9c
        z27lJpgnTzIPbEELLH7f3xc2SdsdNsOvB5JEPmiOgoRCf2UsMyEZco+GP7SzY2Rn4aVLFX
        858xZYjSgZQkT+ydboCoGWX3VevEJw4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-eHZyzl68PUKkQWdHIVVCNg-1; Wed, 07 Jun 2023 11:59:11 -0400
X-MC-Unique: eHZyzl68PUKkQWdHIVVCNg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-977c8170b52so475501166b.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 08:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686153550; x=1688745550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rlkpj1joxESPA2xm5MbHF/L7J9bz0RN/LZqSF2toBk=;
        b=GsVIOXGC6t8s4sgAngILtNELYn3F0upy7Bpz1uvMP5Hwj8PVqXAsbuUKb+aeGVW73a
         9IDtOMpWQ63Wh/iXPPuVm+BRS59l84K6wZ8qfy79qWqq+l3HbjIhtTRiC2umMzYvVQR4
         p3EKln7vL1XQqmBp85UzfoU82q8BBXCRSaUnVZ4DBDK3rcV3j2DePtbEs5vwIC4oBL/V
         0nTTsU5qz4j+uBalbVlGP/qDxh6qTFk3UeMoSQjxSBFC778wM6m0rYl/qLgqTAVgYOfx
         NfaLJ+QFvxkFSoHlwyVJQwRnnhffHrCAJjf2ANMeDTczLL/lqkfj7Wt5jIUWYme+Xtu2
         A7Iw==
X-Gm-Message-State: AC+VfDyXQAEvGSfAAUSny21OsZtjUKr24XXxmZFa/bGqgeDfTD/ChDB8
        7gyMyKRfpERU1ZSVlcs7adioZzTbY/PFt1E90TL+2VLyBVQQv1uJNTyLvlg6JhMIeHDXWHT6tf4
        4WY6Ne2RI82OnkamRhWsqDs8=
X-Received: by 2002:a17:907:94d2:b0:965:f8b7:b0cd with SMTP id dn18-20020a17090794d200b00965f8b7b0cdmr7697617ejc.25.1686153550306;
        Wed, 07 Jun 2023 08:59:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62ck9Xedn2aJqVAOhHrlSVkaM+Bzoj8CYMxL5wVHdeNnEOTcsy1Z11uNamoEDU8QSw7wE+Og==
X-Received: by 2002:a17:907:94d2:b0:965:f8b7:b0cd with SMTP id dn18-20020a17090794d200b00965f8b7b0cdmr7697599ejc.25.1686153550022;
        Wed, 07 Jun 2023 08:59:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x21-20020a170906149500b00973f1cd586fsm7047111ejc.1.2023.06.07.08.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 08:59:09 -0700 (PDT)
Message-ID: <3dd04737-8c9d-d359-9a6e-919fe34d1674@redhat.com>
Date:   Wed, 7 Jun 2023 17:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] media: atomisp: ov2680: Convert to new CCI register
 access helpers
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-3-hdegoede@redhat.com>
 <CAHp75VeqeA4GA0_r_KgH0wv0_TQ4rQUdTY99DFFR_oWfdiDxfw@mail.gmail.com>
 <c34ca549-8d07-35db-0635-a5c60728dfc2@redhat.com>
 <20230607155115.GF22127@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230607155115.GF22127@pendragon.ideasonboard.com>
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

Hi Laurent,

On 6/7/23 17:51, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Wed, Jun 07, 2023 at 10:53:54AM +0200, Hans de Goede wrote:
>> On 6/6/23 22:53, Andy Shevchenko wrote:
>>> On Tue, Jun 6, 2023 at 7:58 PM Hans de Goede wrote:
>>>>
>>>> Use the new comon CCI register access helpers to replace the private
>>>> register access helpers in the ov2680 driver.
>>>>
>>>> While at it also switch to using the same register address defines
>>>> as the standard drivers/media/i2c/ov2680.c driver to make merging
>>>> the 2 drivers simpler.
>>>
>>> ...
>>>
>>>> +       cci_write(sensor->regmap, OV2680_REG_SENSOR_CTRL_0A, sensor_ctrl_0a, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_START, sensor->mode.h_start, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_START, sensor->mode.v_start, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_END, sensor->mode.h_end, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_END, sensor->mode.v_end, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_OUTPUT_SIZE,
>>>> +                 sensor->mode.h_output_size, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_OUTPUT_SIZE,
>>>> +                 sensor->mode.v_output_size, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_TIMING_HTS, sensor->mode.hts, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_TIMING_VTS, sensor->mode.vts, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_Y_INC, inc, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_X_WIN, sensor->mode.h_output_size, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_Y_WIN, sensor->mode.v_output_size, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_FORMAT1, fmt1, &ret);
>>>> +       cci_write(sensor->regmap, OV2680_REG_FORMAT2, fmt2, &ret);
>>>
>>> I know that &ret thingy was discussed before and Laurent is keen to
>>> have this, but has anybody actually tested how bad or not at all the
>>> code generation becomes?
>>
>> The cci_write function is in another module, so it won't be inlined
>> and as such I don't see how the code generation can become bad. We
>> loose all the if (ret) return ret; checks here, so the code should
>> become smaller.
>>
>> Or are you worried about having to pass the 1 extra parameter ?
>>
>>> ...
>>>
>>>> +       struct device *dev;
>>>> +       struct regmap *regmap;
>>>
>>> Isn't the same device associated with regmap? If so, one of them
>>> probably duplicates the other.
>>
>> You are right, but the entire atomisp-ov2680.c file is going away real
>> soon now. I plan to post a series to get drivers/media/i2c/ov2680.c
>> ready to replace it later today.
>>
>> So I'm not even sure if this patch should be merged, as I mentioned in
>> the cover letter this one is mostly here to illustrate use of the new
>> helpers.
> 
> How about porting drivers/media/i2c/imx290.c ? That's a real-life
> example that can be merged, which is good to serve as an example
> showcasing the API usage in mainline. It will also help ensuring that
> these helpers are a good fit for drivers that already encode the
> register width in the macros.

I prefer to port over drivers which I can actually test,
at least for now.

I already have converting ov5693.c (which also already has macros
to encode to width) on my TODO list. I'll convert that for v2
of the series.

And I also have a conversion of the "main" drivers/media/i2c/ov2680.c
ready.

I'll post that conversion as part of my big main ov2680 changes series
which I'll post in a couple of minutes (just need to write
a cover letter and then its ready).

Regards,

Hans



 
>> I also wrote this patch to make porting recent atomisp-ov2680.c
>> changes over to drivers/media/i2c/ov2680.c easier. Part of the series
>> to get drivers/media/i2c/ov2680.c into shape is converting it to the
>> new CCI helpers so that I could then easily copy over bits from the
>> also converted atomisp-ov2680.c.
>>
>> So it might be interesting to still merge this so that the latest
>> state of atomisp-ov2680.c is easier to compare to
>> drivers/media/i2c/ov2680.c if the need arises.
> 



