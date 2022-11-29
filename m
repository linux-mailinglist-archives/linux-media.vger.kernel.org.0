Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8F163BF27
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 12:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbiK2Les (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 06:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiK2Le0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 06:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4899587
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 03:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669721592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+hLXlKa4C2EAhgeQhlgk3w8DjF6p1JfcYdCXzEa7rn8=;
        b=fLsGGBTtXWFoEL+NybR9FDRaYJKFsk1wHaqMFuH9GE6C+IV0WUqW+wSV2GWvN1L8weihK9
        7LIYPc5GZa/57XabJivHPN3Dtw+WwkW4KLmzpjaTFEv2LG0IqTlPX3BrXNGb6CXHsSZEre
        YPvqaV70Wf2HVbI1uHhDD+9p5S0aYww=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-tg_i8Pm0NKucHxybWJwQ9A-1; Tue, 29 Nov 2022 06:33:10 -0500
X-MC-Unique: tg_i8Pm0NKucHxybWJwQ9A-1
Received: by mail-ej1-f72.google.com with SMTP id qb2-20020a1709077e8200b007bf01e43797so3420613ejc.13
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 03:33:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+hLXlKa4C2EAhgeQhlgk3w8DjF6p1JfcYdCXzEa7rn8=;
        b=JOO/jvzDKNBjB2rxG325cmb9GFxBFCL8q1ozGuGr4OMjBtgUzKbjJmtBWAV5PmLJA7
         7q51jaXpOUmSVTxhQeG75n5FXAQMv8TO+KCquwkmLRIeBmsLySr3ltQongjQ/5uEqFSC
         eF3wRKi6ci1lKBVrFVYl+Db1Bhq1kHyIG9/Mlou2Cib6IxRXlY6e4GIuzIm4Hk6q0niy
         LZbzc8cVBtKgR04GYi0ZRTZZ82+qTNDWgIn4huAnJtJJzHK6Z08QRHqDtIh4ton7UDSp
         63Z5QfW9PVgc2DoOT4z/hVWM4l/GAAZXD04vstDRqLc1ZB6TH3dRzeTULbltQ/aIGYkZ
         p08w==
X-Gm-Message-State: ANoB5pmOvQu03RMgwupRvdyEc5ogaamfPhk6bIoTs2ARbUUhuTE2xJmI
        SsxUOjBIcf/jys5aqfpQo2wzdMKF8xsC45iQucksQDAbyWh4Qqr1fniCDiKYWNJD3D4N/U84nYM
        xbtvttFbJ1mlCnt3wHhXoj0Y=
X-Received: by 2002:a17:906:ae99:b0:7c0:82d8:243a with SMTP id md25-20020a170906ae9900b007c082d8243amr3459322ejb.230.1669721589762;
        Tue, 29 Nov 2022 03:33:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5pGKGWOqZ812E/sE3+nFHL+aCdS/k52LLxvRmt4/2/hkJ/cO20KTx6sgSR8Fii3oaDe96CiA==
X-Received: by 2002:a17:906:ae99:b0:7c0:82d8:243a with SMTP id md25-20020a170906ae9900b007c082d8243amr3459310ejb.230.1669721589585;
        Tue, 29 Nov 2022 03:33:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id kw11-20020a170907770b00b007add28659b0sm6080790ejc.140.2022.11.29.03.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 03:33:09 -0800 (PST)
Message-ID: <1e9ca819-a5d0-4059-1a44-a7004a2c5cb0@redhat.com>
Date:   Tue, 29 Nov 2022 12:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/5] gpio: tps68470: Make tps68470_gpio_output() always
 set the initial value
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <20221128214408.165726-3-hdegoede@redhat.com>
 <CAHp75Vc=8CqOPURA=ot9UMSOJknM7LJLqqX70Qu_NjmAKs2pig@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc=8CqOPURA=ot9UMSOJknM7LJLqqX70Qu_NjmAKs2pig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/29/22 11:24, Andy Shevchenko wrote:
> On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Make tps68470_gpio_output() call tps68470_gpio_set() for output-only pins
>> too, so that the initial value passed to gpiod_direction_output() is
>> honored for these pins too.
> 
> This smells like a fix. Shouldn't be the Fixes tag?

Ack, and the same really goes for 1/3 too. I'll add a fixed tag
there for v2 too.

> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks.

Regards,

Hans


> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpio/gpio-tps68470.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
>> index 778a72cf800c..2ca86fbe1d84 100644
>> --- a/drivers/gpio/gpio-tps68470.c
>> +++ b/drivers/gpio/gpio-tps68470.c
>> @@ -91,13 +91,13 @@ static int tps68470_gpio_output(struct gpio_chip *gc, unsigned int offset,
>>         struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
>>         struct regmap *regmap = tps68470_gpio->tps68470_regmap;
>>
>> +       /* Set the initial value */
>> +       tps68470_gpio_set(gc, offset, value);
>> +
>>         /* rest are always outputs */
>>         if (offset >= TPS68470_N_REGULAR_GPIO)
>>                 return 0;
>>
>> -       /* Set the initial value */
>> -       tps68470_gpio_set(gc, offset, value);
>> -
>>         return regmap_update_bits(regmap, TPS68470_GPIO_CTL_REG_A(offset),
>>                                  TPS68470_GPIO_MODE_MASK,
>>                                  TPS68470_GPIO_MODE_OUT_CMOS);
>> --
>> 2.38.1
>>
> 
> 

