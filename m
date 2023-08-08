Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9007740B9
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 19:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234061AbjHHRIa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 13:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjHHRHg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 13:07:36 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082F75F87E
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 09:03:07 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so113366b.0
        for <linux-media@vger.kernel.org>; Tue, 08 Aug 2023 09:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510560; x=1692115360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6UQwIyuye8mYS0km2qczmsMo0G4UsG0TMMEf3YJ5cAk=;
        b=Uf4YpY2v2+FPBFO/yaXyCXV5V6tQ/AeNJ//X7OQEKtMMFbFG8SW5zedXAED5VvJwPo
         v+6DcV4SFuQZQjhORvGFOd5247g30vK9+AwayxoDrQ58EugWg/FwtlbgQCmXMxPGh3ps
         8DyQmkI+FGlUOsQVaNeODDRFeJ3T8tKLNW+wWVPkynqbok/hMqK5bqTri6pWYUaHIa4b
         c7GfoZpePDeSvQs7MzTYQvMdTd0vwnNsWlHjOhtEmlyec/Wapc5cQnSBoSvzBsmjxCSo
         RnPTvXyINIW6zTlf0h8KsCpJj+sAgduNUnJRaujsN9/6Rz8Dd2A/dbDO3yvqPdHM50ja
         AHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510560; x=1692115360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UQwIyuye8mYS0km2qczmsMo0G4UsG0TMMEf3YJ5cAk=;
        b=Tj0FVMmqvxH//ghptjLaCINMYXDL9e43zreUMYLGQUULgNUooF3qBZ1pjaBkuSWq8Z
         Dpf3c9aGAW6S6IPuA5SiTH/EJdvEQbnKMip0vzyiuK8hgxebLlk0FaseCdeaDIMsvAyi
         JpzIwnSM3HzpaC4+v/++cUBAiDU7LjngRzZeN//o6v4pzwYFFIbG2MFf7ytTB8nP/GaA
         YsLixbEIJooITWw31QfjUr4GKtmn+4HesnWVOuVq5OP2H3q7UYuUNT8XpmRk7GLc7+CT
         dO/0pGlU6ZZuoeXY4u1BdZAlHcncgbVb7f2c1eBR6cwnTukB1bFQG/T4qSLPP2cFJ7Pw
         zV5A==
X-Gm-Message-State: AOJu0YyjkLwY5Y8NWqja4uImhcqJAuPhiC/e8ab3KhXVAwxUCtk6LuX7
        5nwZQ9Q6zNiU8VnWcQrvAihHEuZBD/SS19w4Vn8=
X-Google-Smtp-Source: AGHT+IEAWtqj6IGMQaxg9T1mvEziRnQ63AxagirqrvclWjlQA6LYi5Gwjfcee2RpFhk/TpTKnyzDKg==
X-Received: by 2002:a5d:5265:0:b0:317:5dcc:b7d4 with SMTP id l5-20020a5d5265000000b003175dccb7d4mr7125084wrc.33.1691490380266;
        Tue, 08 Aug 2023 03:26:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id d18-20020adffbd2000000b003176c6e87b1sm13123307wrs.81.2023.08.08.03.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 03:26:19 -0700 (PDT)
Message-ID: <d8e79173-1f73-0ae1-f698-90cd551dde1a@linaro.org>
Date:   Tue, 8 Aug 2023 12:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: media: Add bindings for Imagination E5010
 JPEG Encoder driver
Content-Language: en-US
To:     Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
        j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
        p-mantena@ti.com, vijayp@ti.com
References: <20230726162615.1270075-1-devarsht@ti.com>
 <b6bddd59-ac78-3f75-828e-cff54766fc72@linaro.org>
 <8fef77fb-d3bf-eab1-0734-919ebf2e61af@ti.com>
 <50d97c30-4926-0bbf-1209-dfd25043e359@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <50d97c30-4926-0bbf-1209-dfd25043e359@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/08/2023 12:20, Devarsh Thakkar wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    const: img,e5010-jpeg-enc
>>>
>>> Your description suggests that this is part of TI SoC. Pretty often
>>> licensed blocks cannot be used on their own and need some
>>> customizations. Are you sure your block does not need any customization
>>> thus no dedicated compatible is needed?
>>>
>>
>> There is a wrapper for interfacing this core with TI SoC, I will recheck this
>> interfacing but I believe nothing changes from programming perspective as
>> there is 1-to-1 maintained between the clocks and signals w.r.t actual E5010
>> core.
>>
> 
> Just to add to above, on a second thought we think it would be  better to
> still have a separate compatible for TI as you suggested (since we have a
> wrapper) so that it allows any customization needed for future. So compatible
> enum would look like :
> 
>     oneOf:
>       - items:
>         - const: ti,e5010-jpeg-enc
>         - const: img,e5010-jpeg-enc
>       - const: img,e5010-jpeg-enc
> 
> Thanks for the suggestion.

Yeah, it's fine, assuming block can be used as img,e5010-jpeg-enc on its
own.

Best regards,
Krzysztof

