Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1934C5881
	for <lists+linux-media@lfdr.de>; Sat, 26 Feb 2022 23:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiBZW0Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Feb 2022 17:26:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiBZW0Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Feb 2022 17:26:16 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372B02BE203
        for <linux-media@vger.kernel.org>; Sat, 26 Feb 2022 14:25:41 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d17so9662009wrc.9
        for <linux-media@vger.kernel.org>; Sat, 26 Feb 2022 14:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=P6QWLY5qoG4VquFCoclgf3GikdqsGANumpz3jMzDl8A=;
        b=QpwhXVlNWBZM7xika9/+N1hkuVFoPIgy1boPusupAwvMtRrb5HOP4wcqDOW0+/Zfx8
         IqscAJwiMRMU5yVLM4B4/IRGEZyjBiY/hVeYf1erqHxNpsBnvGCZa1FlkV5WroqXcbud
         X0LpPWwjXJpqYmmlrlZ1/J80JbvlExRZjvmA+tjm8SNDYEYKlWHEzQ1D4yry+RxdU4YT
         jMrFxon71LhF4U6w22N0XV5nSYZ0ut9pEa0jo/mZxabwHU9hzjHN94ibaoquxfjSGNT4
         R3eK2bYQyd1o+mKEtu1GUU04uK6GkeNE6cK0852cyQpPTsNrAYhun2mgSsQzeIQDP3Xt
         XUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P6QWLY5qoG4VquFCoclgf3GikdqsGANumpz3jMzDl8A=;
        b=miUT5tcl2eeufLqyyR6wjFfXvlRKPVb1VqGeLFKvqqV6145xaNqoqgc6RxZQNgCmW4
         8pRRIfFaqJavDd8xqX78M6t/PIqpYGEbmoNVwuNCHDFl6BUKScFPxvedZsCJj4pvA8c1
         miERuDpWeB4YasKZCD8PQTD+lzahLexIThLEzo1LU9kVfqmQH/FbOdne6gMz4/Zi2rRl
         MVwkAQJN22tI29CGEYm1IBvsCbEdadFuSgqGp41QpUrkOWkp3om9CAmF2u20P81iCM1w
         o6bieCQGKAX3hs2PgL6gjZtDdkQKmcNbWr2ejWgJf3wVU8LLRcVn+iGlt5KiW6Bjsljo
         UvGQ==
X-Gm-Message-State: AOAM533GyafOfK4vay8cwZM1gc7AckmsWlxNgk6ItkQVKvUZdYXmyuF3
        wrI4EZZHUFNuCh4dwLKeIjw=
X-Google-Smtp-Source: ABdhPJyxJZy+nLatinoSurbjQsD4jtpKjGglA4d/ARAZq2KMlnlXcWElxOuOCTcbPUQa+WXavgsrCg==
X-Received: by 2002:adf:a109:0:b0:1ed:c2bd:8a57 with SMTP id o9-20020adfa109000000b001edc2bd8a57mr10454065wro.612.1645914339689;
        Sat, 26 Feb 2022 14:25:39 -0800 (PST)
Received: from [192.168.0.30] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id t15-20020adfe44f000000b001edbea974cesm6018625wrm.53.2022.02.26.14.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Feb 2022 14:25:39 -0800 (PST)
Message-ID: <072cf2ab-021c-3ec4-3492-e2608d7b6dac@gmail.com>
Date:   Sat, 26 Feb 2022 22:25:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/11] media: ipu3-cio2: Add support for
 V4L2_PIX_FMT_IPU3_Y10
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-3-djrscally@gmail.com>
 <YhkKcRL57Qg/VWGO@smile.fi.intel.com>
 <25f6d78d-be76-5761-a7f6-2b07c18516ea@gmail.com>
 <CAHp75VfmvMdD1GSE62AvpjqEXx=DW1H+KuMNik+gpp2u0fkVnQ@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <CAHp75VfmvMdD1GSE62AvpjqEXx=DW1H+KuMNik+gpp2u0fkVnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 26/02/2022 18:14, Andy Shevchenko wrote:
> On Sat, Feb 26, 2022 at 4:06 AM Daniel Scally <djrscally@gmail.com> wrote:
>> Hi Andy
>>
>> On 25/02/2022 16:57, Andy Shevchenko wrote:
>>> On Fri, Feb 25, 2022 at 12:07:44AM +0000, Daniel Scally wrote:
>>>> We have platforms where a camera sensor transmits Y10 data to
>>>> the CIO2 device - add support for that (packed) format to the
>>>> ipu3-cio2 driver.
>>> ...
>>>
>>>> -    },
>>> Why?
>>
>> Why have the open and close brace on the same line you mean? Its just
>> the format that the other entries use, so I copied it.
> I meant why you touched that line and as a consequence removed the comma.


Ah - I didn't close my new entry in that table with a comma. I can fix 
that in the next version

>
>>>> +    }, {
>>>> +            .mbus_code      = MEDIA_BUS_FMT_Y10_1X10,
>>>> +            .fourcc         = V4L2_PIX_FMT_IPU3_Y10,
>>>> +            .mipicode       = 0x2b,
>>>> +            .bpp            = 10,
>>>> +    }
>
>
