Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49A52671D99
	for <lists+linux-media@lfdr.de>; Wed, 18 Jan 2023 14:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjARNXd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Jan 2023 08:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbjARNXR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Jan 2023 08:23:17 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F61D0DA2
        for <linux-media@vger.kernel.org>; Wed, 18 Jan 2023 04:47:43 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id j34-20020a05600c1c2200b003da1b054057so1312986wms.5
        for <linux-media@vger.kernel.org>; Wed, 18 Jan 2023 04:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gK8o2Y7reHAMOMVQV1NSBRgNT3cGc7DMsQikEldiSbI=;
        b=jtbzq6oRKAc24SZ+A3rDy+tQplPXJxB3XqhjdRocPvAQVmH7d4Y5IqNPLvywIBa4qn
         9vGbE/jjtt8BzzUgKJfYNTwp/i5CG/zYnWXe4bLRLuVA+syACJg/i9ojwv/pB7jefG97
         zO+PqHcKWrUKcnaSzlu6OpI9ZSCyMmB6OTDMiW0AsNm5ipqHzI3xYObWBMt9IfD4Dnty
         jJJop/zZyG+OA82/cMAu50KKtHYUBDtTxt67NIImVfM1HffdIFT+eDzflIiqoOola5l7
         GvV/kGv41OathEVFB6UxTjVGOLvnlf6K0LWG9HlAWz5gdq9zwYKXZUrHoHob6M/TqQkE
         AVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gK8o2Y7reHAMOMVQV1NSBRgNT3cGc7DMsQikEldiSbI=;
        b=4krLSnC6kefrNHsgoFgfQnbR8jbLFL+C5dueIhWgKte0cNNrrvdmgw56fpKDtCJYL0
         ImdpERzFwYK0tInaYodgD3DjV44ji09sscjv9FhR+bRTs1pt0CjxV8p08/xFR8tjzXtm
         4Ao9S8MwpcGC5ThohMYezOs5nN/Wd33gSdInBNWd4NER2G1OJET6SgHWiKLxiIpAz3m4
         /avH+cldEMbJvnNcaIgA9qxpqQbjAV8pIFjtBvIphThOtx1GeTMgx+MtKrrn2KFo84LZ
         bNGzC0oBpGxU8yO94LTQC5BhsXdPcayLPwdw3IxPhOxQGyHLwpoXjP5Zl6uloFqS8CP9
         p02w==
X-Gm-Message-State: AFqh2kozdVQx29tuGDSg6sGQUILLwSvqHN1M5pkK+zBZVk/guEPJbYAY
        8s83MsPLrrgmKjysA9v3goBZjQ==
X-Google-Smtp-Source: AMrXdXuDAKEnalP/OhK8Zy5tavc5exXluG1UAm4pHSXwlJdzB7qa5JtQH+D7YJlwjtCHFr+bpPo96A==
X-Received: by 2002:a05:600c:35d5:b0:3db:fc4:d018 with SMTP id r21-20020a05600c35d500b003db0fc4d018mr3028764wmq.40.1674046061596;
        Wed, 18 Jan 2023 04:47:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f17-20020a1c6a11000000b003d9fba3c7a4sm1782153wmc.16.2023.01.18.04.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 04:47:41 -0800 (PST)
Message-ID: <392acd9d-ab7e-a5d0-67cd-162f49d2e6b6@linaro.org>
Date:   Wed, 18 Jan 2023 13:47:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RESEND v3 01/13] dt-binding: mediatek: add bindings for MediaTek
 mt8195 MDP3 components
Content-Language: en-US
To:     =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20230116032147.23607-1-moudy.ho@mediatek.com>
 <20230116032147.23607-2-moudy.ho@mediatek.com>
 <f24a54f1-2720-3345-9596-bb8d388ba16f@linaro.org>
 <bd6bbc3d126a39dd8b8499e891b152c25b6713a7.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bd6bbc3d126a39dd8b8499e891b152c25b6713a7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/01/2023 09:52, Moudy Ho (何宗原) wrote:
> On Mon, 2023-01-16 at 09:10 +0100, Krzysztof Kozlowski wrote:
>> On 16/01/2023 04:21, Moudy Ho wrote:
> 
> (snip)
> 
>>> +  mediatek,gce-client-reg:
>>> +    description:
>>> +      The register of client driver can be configured by gce with
>>> 4 arguments
>>> +      defined in this property, such as phandle of gce, subsys id,
>>> +      register offset and size.
>>> +      Each subsys id is mapping to a base address of display
>>> function blocks
>>> +      register which is defined in the gce header
>>> +      include/dt-bindings/gce/<chip>-gce.h.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    maxItems: 1
>>
>> items with items syntax instead:
>>
>>
> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml*L42__;Iw!!CTRNKA9wMg0ARbw!lcferrFFP-mshDHNL-rwJLgNKDrXF9fXoljpqL30k5YKTNvCwuC3webzR32VnQQoPeFvSvAewNkeupcT4mjdE_roxWUo$ 
>>  
>>
>>> +
> 
> (snip)
> 
>>> +
>>> +  mediatek,gce-client-reg:
>>> +    description:
>>> +      The register of client driver can be configured by gce with
>>> 4 arguments
>>> +      defined in this property, such as phandle of gce, subsys id,
>>> +      register offset and size.
>>> +      Each subsys id is mapping to a base address of display
>>> function blocks
>>> +      register which is defined in the gce header
>>> +      include/dt-bindings/gce/<chip>-gce.h.
>>
>> Full, real path please, so it could be validated with tools.
>>
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> Sorry to bug you again about this property, could it be changed to
> following form.
> 
>     mediatek,gce-client-reg:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
>       items:
>         items:
>           - description: phandle of GCE
>           - description: GCE subsys id
>           - description: register offset
>           - description: register size
>       description:
>         ... defined in <include/dt-bindings/gce/mt8195-gce.h>.
>      maxItems: 1 
>   
> Also, is the include header path still necessary in this form?

No.

Best regards,
Krzysztof

