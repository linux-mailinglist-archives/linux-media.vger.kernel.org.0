Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C26441A33
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 11:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbhKAKvH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 06:51:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50567 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231946AbhKAKvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 06:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635763711;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/Z2r4wjgjmfKtWXXm/PRt+JSau+E3wOrLAYY5e+orSU=;
        b=HNj/xOdMYfCbTVzOJAARTd9HeHA/L5KYBooA9B2uOEC1pGE7/kbPlS36jgHzl0Kosb87m9
        /EHwulFDr3r0EFzK/hGRVIZSUVemdD8tt85pxF7mIWyLmmod82zK3P3kQZS8AwPtS6JJif
        gZQr2SVkQFmrGYFyME13cL9jK0udFb0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-n2NmORsgOumO9wJ5Wst6xQ-1; Mon, 01 Nov 2021 06:48:30 -0400
X-MC-Unique: n2NmORsgOumO9wJ5Wst6xQ-1
Received: by mail-ed1-f71.google.com with SMTP id m16-20020a056402431000b003dd2005af01so15153707edc.5
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 03:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/Z2r4wjgjmfKtWXXm/PRt+JSau+E3wOrLAYY5e+orSU=;
        b=fmVnpUE1Cj87yOtgiOOGsXaspROx4/dHBNimK8svMWCHzJlHXiI36v6h138xR+9G7r
         rb3J1GfKc5DiyCKzcGR1wMrZe13KSD5LV7D/3/gZ6vwghWGeqxsd5SVPKYaE8C2kr6E+
         h7KWxFq43C7ucv70OTBrQFGmfRP53GG1QvXR+Lr0TQR0ZHbaNMew0vVB0CCCkLRgznqa
         GtgyALGVkWPPfxNQu4Ft9lk4I8CdLfzyJHLQCeGDMLhUMYAl4uKqTLYSeNO54ja1Xeay
         +TOuwJYfnRuYhzXP6PFt/yARYQBQcNfVt1CWX7G6804XUYMxi51WCIHmYxf0x6/Ju7Wv
         XlUg==
X-Gm-Message-State: AOAM5327BLZiDghLWxu16JD3u49ZyEY3qeUXXQhNkpnqDZfzZe1YiV6R
        RM6yvvcPXUKxPrlAmLizXvEklk3k2J9dJIp8qLKgv4sf8udfEnnP8JB/Lhq5Xs2eP/FIn5TvEI/
        vA391p/7xmoDWTzd2UPH7HGE=
X-Received: by 2002:a05:6402:331:: with SMTP id q17mr3272970edw.58.1635763709667;
        Mon, 01 Nov 2021 03:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqwZ6pYKJ964qOQyIfK0fQV7DN0AlpOGjSg/1ST/kyNYa/fXNYu4eGpY0jOgRgPJc3qHFynA==
X-Received: by 2002:a05:6402:331:: with SMTP id q17mr3272945edw.58.1635763709553;
        Mon, 01 Nov 2021 03:48:29 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id hp3sm7010914ejc.61.2021.11.01.03.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 03:48:29 -0700 (PDT)
Message-ID: <9ccd15b1-f751-5c05-cca0-bfccbb9d5b1f@redhat.com>
Date:   Mon, 1 Nov 2021 11:48:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 08/11] platform/x86: int3472: Add
 get_sensor_adev_and_name() helper
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
 <20211025094119.82967-9-hdegoede@redhat.com>
 <CAHp75VeLAW6ZBQYidnD7PDYfAH3A2bq+oMJTru-9OW_t-XS26g@mail.gmail.com>
 <8804fa29-d0d9-14a9-e48e-268113a79d07@redhat.com>
 <CAHp75VcdZV7NLEgQnEbsG951Mo2s_eRwfijgjSConXGF2SaSGA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcdZV7NLEgQnEbsG951Mo2s_eRwfijgjSConXGF2SaSGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/1/21 11:44, Andy Shevchenko wrote:
> On Mon, Nov 1, 2021 at 12:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 10/25/21 13:31, Andy Shevchenko wrote:
>>> On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> +int skl_int3472_get_sensor_adev_and_name(struct device *dev,
>>>> +                                        struct acpi_device **sensor_adev_ret,
>>>> +                                        const char **name_ret)
>>>> +{
>>>> +       struct acpi_device *adev = ACPI_COMPANION(dev);
>>>> +       struct acpi_device *sensor;
>>>> +       int ret = 0;
>>>> +
>>>> +       sensor = acpi_dev_get_first_consumer_dev(adev);
>>>> +       if (!sensor) {
>>>> +               dev_err(dev, "INT3472 seems to have no dependents.\n");
>>>> +               return -ENODEV;
>>>> +       }
>>>> +
>>>> +       *name_ret = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
>>>> +                                  acpi_dev_name(sensor));
>>>> +       if (!*name_ret)
>>>> +               ret = -ENOMEM;
>>>> +
>>>> +       if (ret == 0 && sensor_adev_ret)
>>>> +               *sensor_adev_ret = sensor;
>>>> +       else
>>>> +               acpi_dev_put(sensor);
>>>> +
>>>> +       return ret;
>>>
>>> The error path is twisted a bit including far staying ret=0 assignment.
>>>
>>> Can it be
>>>
>>>        int ret;
>>>        ...
>>>        *name_ret = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
>>>                                   acpi_dev_name(sensor));
>>>        if (!*name_ret) {
>>>                acpi_dev_put(sensor);
>>>                return -ENOMEM;
>>>        }
>>>
>>>        if (sensor_adev_ret)
>>>                *sensor_adev_ret = sensor;
>>>
>>>        return 0;
>>>
>>> ?
>>
>> That misses an acpi_dev_put(sensor) when sensor_adev_ret == NULL.
> 
> else
>   acpi_dev_put(...);

Then we have 2 acpi_dev_put() paths, IMHO the original code
which clearly states that we keep the ref:

if (success && returning-the-ref)

and put the ref in all other cases is better then having
2 separate put paths.

Regards,

Hans

