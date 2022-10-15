Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0AFA5FFA32
	for <lists+linux-media@lfdr.de>; Sat, 15 Oct 2022 15:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiJONRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Oct 2022 09:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiJONRM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Oct 2022 09:17:12 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB0F4D149
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 06:17:11 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id y10so4902310qvo.11
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 06:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgRe8FExVz3GkkvoaaG9sGhymMB0PRwWjEbFxn6Jfss=;
        b=l8pIr4sinoKUjWeipxRKIZ4oXm0ZoyoEdMLntlfg3I8d2d+o3gEDkvKbeMV4mdGZM9
         pbWNz1n+CPFeyEowUoqwctEYOovkQ1fqDRm8G+D9Aa9hNlctlztjkQ40WdqsM3ren7G8
         Tn+4VgnJ9HjAUuHoe/tkgklIyGV/C4LCZO0Qy9a+X3Q39s5OUZkc0G5qkbdiwkwbtid0
         DxAP+DpCZLLbqYCKwXzeHKqOmZaxZOYNUcBjHDKReduIISgMbwpiYm8SgwfTjZwLfZQw
         qlLJTpQaq7MbySaWBBqABO0ce6fFRduBW7gMJdziQlsV2tu/3UMsXEcqsilSKuNVA/Ly
         CKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgRe8FExVz3GkkvoaaG9sGhymMB0PRwWjEbFxn6Jfss=;
        b=Vps3umJ+nxGak7qC4Jujw7Sliw6ILJlzfNOt+lNYuN6jAXVrAWP9Ja09VNHv3Dw6a9
         yUuOCeG0Joek2yF18N4QSh6y3DcCsmm37BGaFs656HmfyopLoWmnyeUIjvS+i2aOLZYI
         9V1tbK2qNv+jByYpkEQxSJ6t4rjdRAEdBeO5iA5OISRwzyqfl7W2fyZt4mQQLY64hQaj
         N46VhKNJBrIjFphMiwOUlG7oaROHkvWzoXPBL+jw9NrIEF4N2fe86JQTLP+u23evFxOL
         TU35JH9mN0XXJZxbCUYQaC4OhO+DzTugUjAl9dlfMkTsd18zu9BWVqryXOnrHoyBA+sr
         2eVg==
X-Gm-Message-State: ACrzQf2IJAENC4vpYcf04on5ea0bLrTbF9+TLf9zGF0VyKE8TSKS+3W1
        DYVoLnnWGVYQm2oeMORrlZOLVg==
X-Google-Smtp-Source: AMsMyM6zyp0J3UGIsDFNwMFzEPuj7ARj7VGL3aJ2WLojj8HlMPHHcidekN3FLnw/8rXbQp4cVl86dw==
X-Received: by 2002:ad4:5e8a:0:b0:4b1:b225:dbc1 with SMTP id jl10-20020ad45e8a000000b004b1b225dbc1mr2023264qvb.94.1665839830343;
        Sat, 15 Oct 2022 06:17:10 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:161:5720:79e9:9739? ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id h8-20020a05620a284800b006eeb51bb33dsm5046162qkp.78.2022.10.15.06.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 06:17:09 -0700 (PDT)
Message-ID: <2928a80c-6c5d-c7e0-10f1-4c3b18dab525@linaro.org>
Date:   Sat, 15 Oct 2022 09:17:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 1/5] media: dt-bindings: ov5645: Convert OV5645 binding
 to a schema
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Shawn Tu <shawnx.tu@intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221014183459.181567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221014183459.181567-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAL_JsqKC_BJDJLLFck_0CbQ-0rZ0oVWMAdiwwGep23nh2pP19g@mail.gmail.com>
 <CA+V-a8vMLuzJ8h5UDNXUiZRXPV1vJ9gguUMywe_+sPcU8tK+tA@mail.gmail.com>
 <20221014214029.GA2937999-robh@kernel.org>
 <Y0pLDFMsFmHhC/R8@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y0pLDFMsFmHhC/R8@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/10/2022 01:54, Laurent Pinchart wrote:
> Hi Rob,
> 
> On Fri, Oct 14, 2022 at 04:40:29PM -0500, Rob Herring wrote:
>> On Fri, Oct 14, 2022 at 10:27:53PM +0100, Lad, Prabhakar wrote:
>>> On Fri, Oct 14, 2022 at 10:05 PM Rob Herring <robh+dt@kernel.org> wrote:
>>>> On Fri, Oct 14, 2022 at 1:35 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>>>>>
>>>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>>>
>>>>> Convert the simple OV5645 Device Tree binding to json-schema.
>>>>>
>>>>> The previous binding marked the below properties as required which was a
>>>>> driver requirement and not the device requirement so just drop them from
>>>>> the required list during the conversion.
>>>>> - clock-frequency
>>>>> - enable-gpios
>>>>> - reset-gpios
>>>>>
>>>>> Also drop the "clock-names" property as we have a single clock source for
>>>>> the sensor and the driver has been updated to drop the clk referencing by
>>>>> name.
>>>>
>>>> Driver requirements are the ABI!
>>>>
>>>> This breaks a kernel without the driver change and a DTB that has
>>>> dropped the properties.
>>>>
>>> I already have a patch for the driver [0] which I missed to include
>>> along with the series.
>>
>> You completely miss the point. Read the first sentence again. Changing 
>> driver requirements changes the ABI.
>>
>> This breaks the ABI. The driver patch does not help that.
> 
> I'm not following you here. If the DT binding makes a mandatory property
> optional, it doesn't break any existing platform. The only thing that
> would not work is a new DT that doesn't contain the now optional
> property combined with an older driver that makes it required. That's
> not a regression, as it would be a *new* DT.

You're right although in-tree DTS are now not compatible with older
kernels. So it is not only about new DTS, it is about our kernel DTS
which requires new kernel to work.

DTS are exported and used by other systems, thus if someone blindly
takes this new DTS without clock-names, his kernel/OS/bootloader might
stop working.

That is however a more relaxed requirement than kernel ABI against old DTS.

> 
>>>> Also, with 'clock-names' dropped, you've just introduced a bunch of
>>>> warnings on other people's platforms. Are you going to 'fix' all of
>>>> them?
>>>>
>>> Yes I will fix them, once the patch driver patch [0] is merged in.
>>
>> Why? You are just making extra work. We have enough warnings as-is to 
>> fix.
> 
> I agree that a DT binding change should patch all in-tree DTS to avoid
> introducing new warnings.

Yes.

Best regards,
Krzysztof

