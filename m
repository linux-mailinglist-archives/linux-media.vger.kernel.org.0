Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA664419BB
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 11:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhKAKXF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 06:23:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38559 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231673AbhKAKXE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 06:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635762031;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6GKVOIqK7nVWtbHe5Lw3RempWLyywE1J9gAebyUeQYo=;
        b=ilntWRlgoN+VGgRqTA085elgZwMm+Wikrf6apC7rUTRmwA7NRflglD4EijkaljBwi8B2K/
        QDqAkd8wnBbt8TxZEAgdLObNIxc5gFrkRAjnXvjOAoeiic7BoOhHLJyQi0Q8VefBXr766K
        nc61mbHy3bQz+MRUrXP+8XdmPcR0XQo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-TET55k8HNw2N4kW5RpVWZw-1; Mon, 01 Nov 2021 06:20:30 -0400
X-MC-Unique: TET55k8HNw2N4kW5RpVWZw-1
Received: by mail-ed1-f72.google.com with SMTP id h16-20020a05640250d000b003dd8167857aso15155937edb.0
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 03:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6GKVOIqK7nVWtbHe5Lw3RempWLyywE1J9gAebyUeQYo=;
        b=CwiYbOrDPVHToYPz9Uy1/JgF8mzOX8vEM4z5YcQfIRvcB6gM7nooxDV28OlCbINoLe
         RrCSvUqyw6ZFLogaeL6DiBIIFOytOM+yJvK2vGacF6QwWWfeWnFYcKYOZUQLIv1n00Zs
         0mfNfEc3D0BE+p3qBioDTZI9cuNyLqr+PeWFW3MMPBKC6pASwLQ6dq+3ImxHlFUJgeQw
         g2maUiPbEaHv82sknPhGel4ApdH6UJkVgifjHRL2uAREIgoA/A2Gd/l3Rjxd+yDKmV2E
         dFusvGibnSOhNAjoszW3oFpuaEPURYAT59wrzYDsLLIa0OyzwBX8TzFtL/hY1tn4qpiJ
         FOag==
X-Gm-Message-State: AOAM533J+IKyB+EwrAOfZkabdTq4QiK0c5hdpIpb6wyP3jk7dUDSBN9p
        VB7eoPiy6P5G/CxeRBAFk7wUY4OkQSEweoZrRnEr37seXzTzYGBklhg8QPnKRpvOnAH1MgH1W/h
        wj3ecExg74RNR5q7DX9iEQb0=
X-Received: by 2002:a17:907:6da4:: with SMTP id sb36mr35639754ejc.490.1635762029175;
        Mon, 01 Nov 2021 03:20:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEHfQy0TcctxhEUS7W+qUxUEatSVkMN784xMt2dLb/n/0z432ckOav1RgTwKmh1k2nt3yoIA==
X-Received: by 2002:a17:907:6da4:: with SMTP id sb36mr35639725ejc.490.1635762028980;
        Mon, 01 Nov 2021 03:20:28 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id h10sm8869323edk.41.2021.11.01.03.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 03:20:28 -0700 (PDT)
Message-ID: <2c4d2e45-798e-fdc1-82fb-8413d5a9e061@redhat.com>
Date:   Mon, 1 Nov 2021 11:20:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 04/11] regulator: Introduce tps68470-regulator driver
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211025094119.82967-1-hdegoede@redhat.com>
 <20211025094119.82967-5-hdegoede@redhat.com>
 <CAHp75Ve4nu1WDURaSvUto6+aLoEDM2OfTCVi2Th6x-oagO6a-Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve4nu1WDURaSvUto6+aLoEDM2OfTCVi2Th6x-oagO6a-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/25/21 13:11, Andy Shevchenko wrote:
> On Mon, Oct 25, 2021 at 12:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
>> the kernel the Regulators and Clocks are controlled by an OpRegion
>> driver designed to work with power control methods defined in ACPI, but
>> some platforms lack those methods, meaning drivers need to be able to
>> consume the resources of these chips through the usual frameworks.
>>
>> This commit adds a driver for the regulators provided by the tps68470,
>> and is designed to bind to the platform_device registered by the
>> intel_skl_int3472 module.
>>
>> This is based on this out of tree driver written by Intel:
>> https://github.com/intel/linux-intel-lts/blob/4.14/base/drivers/regulator/tps68470-regulator.c
>> with various cleanups added.
> 
>> +struct tps68470_regulator_data {
>> +       struct clk *clk;
>> +};
> 
> ...
> 
>> +/*
>> + * (1) This register must have same setting as VIOVAL if S_IO LDO is used to
>> + *     power daisy chained IOs in the receive side.
>> + * (2) If there is no I2C daisy chain it can be set freely.
> 
>> + *
> 
> Redundant empty line.
> 
>> + */
> 
> ...
> 
>> +       struct tps68470_regulator_platform_data *pdata = pdev->dev.platform_data;
> 
> dev_get_platdata() ?
> 
> ...
> 
>> +       data->clk = devm_clk_get(&pdev->dev, "tps68470-clk");
>> +       if (IS_ERR(data->clk)) {
>> +               dev_err(&pdev->dev, "Error getting tps68470-clk\n");
>> +               return PTR_ERR(data->clk);
>> +       }
> 
> return dev_err_probe(...);
> 
> ...
> 
>> +               rdev = devm_regulator_register(&pdev->dev, &regulators[i], &config);
>> +               if (IS_ERR(rdev)) {
>> +                       dev_err(&pdev->dev, "failed to register %s regulator\n",
>> +                               regulators[i].name);
>> +                       return PTR_ERR(rdev);
>> +               }
> 
> Ditto.

Andy, thank you for all the reviews. I've addressed all your comments in the v5
of this series which I'm preparing now. This also applies to your comments on
other patches, except those which I will address in separate emails.

Regards,

Hans

