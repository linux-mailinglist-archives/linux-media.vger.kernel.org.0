Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E531E4586F0
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 00:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhKUXRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Nov 2021 18:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbhKUXRY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Nov 2021 18:17:24 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C5EC061574
        for <linux-media@vger.kernel.org>; Sun, 21 Nov 2021 15:14:19 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so15233806wme.0
        for <linux-media@vger.kernel.org>; Sun, 21 Nov 2021 15:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=96SulmJB2RY5rftfgBxMRdIYoOvE7FSQHVfbvmHQAEE=;
        b=XtPQYXkg5sfQPsJt5orQ8QjLr3PTALEdZmO7A1IcKdZlRuzE8u8J/+xvQW70bRx2QO
         +Yy8jnNK1BG1aVun+/X4zJNZvE/CfuzbQuLy5AyXPJ4YlU8JGPUB5ETLsrxYHuZJG2zE
         2kUxGvBKXpBjT/9ByJyGMxA0onB7EIckVRxtEWXOJYm7bV/uK2Aw9n+oUwYC9sHtBKRV
         po1o+kjq395Co1YulOZ0+Uj0CMBGKMLz0Fy/gi21FkREQ3iHHhxSFGyK18bvffqerMPA
         g/Zrz4Qk1Kfs8BKf9cHLYu/iCy5V21D3eiQktUHJqpdve4Kg0eNChJWJO3Xyi9uBbyzo
         M+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=96SulmJB2RY5rftfgBxMRdIYoOvE7FSQHVfbvmHQAEE=;
        b=19ILUv+OPxGESU+h4CyKOvx3oLtJ7bAnOaFu7k4bvstXslNOmr20hwCR7BdGXORgaQ
         cmVI05MKeft7/v2oH0wngK47vYl4a+fMq/y2yf8Dnkp90GmjtDlct136mgW7lWE9BF5t
         aIUXLP/41bg7AHQU7lZqvo99+foNr6wP1ZOTCBrOVA3Xi6h77YUKmuOuWcyxJnauY7Lq
         DnzMQso++4x1WkcYuUtollyeZ+J7U8FoNg02LJOOmEMuWuL3FSe8FxG76PUXirNOc2kJ
         JC6Fops+MAtKfJXd83dV+RyYTbkFvOXQVwY1PfHy4EOI7dWMYgCu+5RVHSHDLQMwEF7j
         O5Aw==
X-Gm-Message-State: AOAM532VH4wgFKJzuFD7n5vTPvkooGTpDwtVWJVzhW55i4lQXMVNRc/I
        Fel+cq0AK7W10/fA9y0UTPo=
X-Google-Smtp-Source: ABdhPJwz/GoBJcexMpbELUI2kY4y9og8G+7ziDKUXlXlzBmAaTEW0mBblRNaiV+L/47+HVie6RLmVw==
X-Received: by 2002:a05:600c:1d97:: with SMTP id p23mr23922591wms.186.1637536457768;
        Sun, 21 Nov 2021 15:14:17 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id i17sm8530254wmq.48.2021.11.21.15.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 15:14:17 -0800 (PST)
Subject: Re: [PATCH v4 04/16] media: i2c: Support 19.2MHz input clock in
 ov8865
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
 <20211101001119.46056-5-djrscally@gmail.com>
 <CAHp75VfuMtdMrXnFABW8CELNuZEjQUiV9LhzAtTWRr4+aOkLYA@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <a19a866e-a904-f822-1746-54136d050c14@gmail.com>
Date:   Sun, 21 Nov 2021 23:14:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfuMtdMrXnFABW8CELNuZEjQUiV9LhzAtTWRr4+aOkLYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On 01/11/2021 10:29, Andy Shevchenko wrote:
> On Mon, Nov 1, 2021 at 2:12 AM Daniel Scally <djrscally@gmail.com> wrote:
>> The ov8865 driver as written expects a 24MHz input clock, but the sensor
>> is sometimes found on x86 platforms with a 19.2MHz input clock supplied.
>> Add a set of PLL configurations to the driver to support that rate too.
>> As ACPI doesn't auto-configure the clock rate, check for a clock-frequency
>> during probe and set that rate if one is found.
> ...
>
>> +       /*
>> +        * We could have either a 24MHz or 19.2MHz clock rate. Check for a
>> +        * clock-frequency property and if found, set that rate. This should
>> +        * cover the ACPI case. If the system uses devicetree then the
>> +        * configured rate should already be set, so we'll have to check it.
>> +        */
>> +       ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>> +                                      &rate);
>> +       if (!ret) {
>> +               ret = clk_set_rate(sensor->extclk, rate);
>> +               if (ret) {
>> +                       dev_err(dev, "failed to set clock rate\n");
>> +                       return ret;
>> +               }
> dev_err_probe()
> 7065f92255bb ("driver core: Clarify that dev_err_probe() is OK even
> w/out -EPROBE_DEFER")


That cuts down on boilerplate usefully, thank you!

>
>> +       }
> ...
>
>> +       for (i = 0; i < ARRAY_SIZE(supported_extclk_rates); i++) {
>> +               if (sensor->extclk_rate == supported_extclk_rates[i])
>> +                       break;
>> +       }
>> +
>> +       if (i == ARRAY_SIZE(supported_extclk_rates)) {
>> +               dev_err(dev, "clock rate %lu Hz is unsupported\n",
>> +                       sensor->extclk_rate);
>>                 ret = -EINVAL;
>>                 goto error_endpoint;
>>         }
> find_closest() ?
>
Not sure about this one though; the values might not match exactly, but
if someone makes a device with this sensor supplying a totally different
clock than 19.2MHz or 24MHz, it ought to fail here rather than attempt
to continue I think
