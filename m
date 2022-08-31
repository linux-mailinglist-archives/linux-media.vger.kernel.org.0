Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35EB05A8165
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 17:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbiHaPiK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 11:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbiHaPiJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 11:38:09 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C732D8B07
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 08:38:07 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id z23so12177129ljk.1
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 08:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Z3ZI4XvX+f6Y7cApAgLVkRdYETFbOath1sGNU9vupZ4=;
        b=b1POBbSM7lSo25v8dwP/s4rQgN8da2aHfdWJn4/7tA5zV+NX2j6t90LqAqGdIAobhZ
         KBKs3BA72gEuVdgH2XeXiM/bHSbU9ka3o9ebQYyEeotDSimoNq85eQ1+A/T+ih2bI0+T
         Btjb7dr/NMENhTYIEKPgorXhk6m9Y94ZMl0iv8tZiA871/uJpK7pkaxUyXsr7OU8e/zQ
         49jIlJTLFlasPHVQ35sXP6+brdo2LbuFt6rWoruC3UGxcndWYkNeIEKMvXkVAfY33TWe
         ll9ptzpEyIy70Ton+SaM5XyCKnTjVlvbft9hRQ4SJzC16AY7/3a+xBljrCimMLLBKh8q
         pRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Z3ZI4XvX+f6Y7cApAgLVkRdYETFbOath1sGNU9vupZ4=;
        b=sFzE35fUK+miyoOV/Dr2MvLl3wlVPrKdgfcOaC9xRuetxxy37Vyi5IhOL4TCKMoM6S
         D+fJ7D5RdgbOwfnSw5ZoynVufBm9E8GVXP6EA43fIlsWjQ0cDLYBdYlOzZH8YZpERYEt
         UGoS08hNbijgQWVmLrAO1ur45f6FH4Zv3zb3dT0cu1xOPTFw8OVRwz6R1d540jpCjs0w
         CG/78USC7X8ytF9Ba6QWs+Okw9+rjRJ/nZZNmpq4zoBC8yXcFpr68OOKnaMJAB8ThQHV
         N9BqmPM07kIA2zfquO0DVCF1E/L38/yQ6Oet1DGgJRjqx6qX3mES6ZD3UZ2aHQw6cMs2
         PkAA==
X-Gm-Message-State: ACgBeo1JtagQYbLa+ECTmMyYlDeAyH06o6dQMMUJjBkg8EqaHLyH3cQs
        /sNG8YV53IFH0DWYyT2HvNA+wA==
X-Google-Smtp-Source: AA6agR7kqv/zHnly8NtxvS/C0gaan2dRtMD0fcbLdjkGIwJppHTSaRBuicOkowl2LkL1zlTcDp7Ckg==
X-Received: by 2002:a2e:9e81:0:b0:268:894f:8118 with SMTP id f1-20020a2e9e81000000b00268894f8118mr1233938ljk.371.1661960285601;
        Wed, 31 Aug 2022 08:38:05 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id p15-20020ac24ecf000000b0049484d936ccsm402329lfr.24.2022.08.31.08.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 08:38:04 -0700 (PDT)
Message-ID: <22006cfb-d0d6-8364-dc93-23a430ecbb37@linaro.org>
Date:   Wed, 31 Aug 2022 18:38:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: renesas,fcp: Document
 RZ/{G2,V2}L FCPVD bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220831143722.2067457-1-biju.das.jz@bp.renesas.com>
 <20220831143722.2067457-2-biju.das.jz@bp.renesas.com>
 <ac6ed365-a44c-6e48-899a-3d692c61b70f@linaro.org>
 <OS0PR01MB5922C8F9B25D2F54716CD73086789@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922C8F9B25D2F54716CD73086789@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/08/2022 18:32, Biju Das wrote:
>>>  properties:
>>>    compatible:
>>> -    enum:
>>> -      - renesas,fcpv # FCP for VSP
>>> -      - renesas,fcpf # FCP for FDP
>>> +    oneOf:
>>> +      - items:
>>
>> No items here. You have just one item, so it is not a list.
> 
> So you mean, it should be like below.
> Can you please confirm my understanding is correct?
> 
> oneOf:
>    - enum:
>        - renesas,fcpv # FCP for VSP
>        - renesas,fcpf # FCP for FDP
>     - items:
>         - enum:
>             - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
>             - renesas,r9a07g054-fcpvd # RZ/V2L
>             - const: renesas,fcpv   # generic FCP for VSP fallback

Yes

> 
> 
>>> +              - renesas,fcpv # FCP for VSP
>>> +              - renesas,fcpf # FCP for FDP
>>
>>> +          - enum:
>>> +              - renesas,fcpv # FCP for VSP
>>> +              - renesas,fcpf # FCP for FDP
>>> +
>>> +      - items:
>>> +          - enum:
>>> +              - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
>>> +              - renesas,r9a07g054-fcpvd # RZ/V2L
>>> +          - const: renesas,fcpv   # generic FCP for VSP fallback
>>>
>>>    reg:
>>>      maxItems: 1
>>>
>>> -  clocks:
>>> -    maxItems: 1
>>> +  clocks: true
>>> +  clock-names: true
>>
>> Both should have here the widest constraints: minItems:1 and maxItems:3.
> 
> It is taken care in conditional schema right?
> 
> It is same as [1], where wider people including you added Rb tag. 

Yeah, it's fine.

Best regards,
Krzysztof
