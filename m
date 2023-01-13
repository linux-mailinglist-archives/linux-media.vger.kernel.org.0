Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE9AE669EC6
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 17:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjAMQyq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 11:54:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjAMQyJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 11:54:09 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03337E67
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 08:51:48 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id fy8so53531649ejc.13
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 08:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5VKVZUHVx22mM/bIIAc7NzbLe37QkHYvE9f9wX8QW8=;
        b=vNsbnSKz1GdnDcjANX07Eh1TPUTsE3sZz4UgqxgIxPPW1iAvFUpAcCBfG/px0AQ+Nf
         Bn7Qt61/Rolm0QvEF1QdUwcMezQrgIoX3FVVZDMRpUXUB2x4IAViej4ai7DTtfGYzbT8
         yqIfFZamQr5RV55GiRchpqmvnS5MlwzEnAJX/01cW51i0ukHdpdXWZ83gX57+O/8E6J9
         Qc/gWHCbHTk+sCrrnLRPZrA96jKyX5RcZhlxAi7CpSRd25K9r6vWzCiRrz0a3kjaF/ZT
         iSTQBvsQ40vxKmQ/wE+GgDL8Ht09aPRqv0en/qSBBMmtKfuq9KzW6bfHy8IgqpCnOO/d
         JiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n5VKVZUHVx22mM/bIIAc7NzbLe37QkHYvE9f9wX8QW8=;
        b=zToSvDWcEixBgS/xepgdiHaLhIYmtvA4dbC7TA/BdYkCm2OOWVtOSJJGbs+E8IlTN0
         bwREp/SmbDbvF2Yf2EMlaXR6AI+Wt83repkjs5fsGwZCaCVQ3eAihSeKz3MDyC6G+v0h
         YD3xMvTbmzSJ2t48CjiPflBt3KRegFEJ0aHmjBUcbWu1Jz2Pr5+QpMfYUz54phCjguaC
         xqnAGdqhL6Qdp0kvmSx+1S12zdW+6bUxn7fZaAqUPtDJ6peIsHqfXUWRjqdYuMEv9qNA
         N9/eKy5VCy99oMd78zbGKLRF27FAag+p9AUtR3ltSUoIJ0rXfRGejOYft3l9sJtFU4zb
         pZzQ==
X-Gm-Message-State: AFqh2kqwsZFcXaX9yZryQEBJK+jIkaedg4ZLcUlf/Arxr0sEMioR4t5d
        mGsA9C+1BJScDIikBskmpQ42Fw==
X-Google-Smtp-Source: AMrXdXu+6c75vpvRqaVKxqv3ZA98GJYV1k02Wwz15Qn+yFXkdoMJMK6NmJ348MKGwxaHj3pZHARWPg==
X-Received: by 2002:a17:906:c18d:b0:843:770e:777d with SMTP id g13-20020a170906c18d00b00843770e777dmr68623230ejz.11.1673628706634;
        Fri, 13 Jan 2023 08:51:46 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id en6-20020a056402528600b00499b3d09bd2sm6192043edb.91.2023.01.13.08.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 08:51:46 -0800 (PST)
Message-ID: <58d9c99d-942a-7d55-64dc-31d936076b90@linaro.org>
Date:   Fri, 13 Jan 2023 17:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/16] dt-bindings: media: fsl-pxp: convert to yaml
Content-Language: en-US
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
 <20230112-imx-pxp-v2-1-e2281da1db55@pengutronix.de>
 <bba093d0-e648-61b3-f4d7-b48d43e35920@linaro.org>
 <20230113150943.GC20866@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113150943.GC20866@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/01/2023 16:09, Michael Tretter wrote:
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: fsl,imx6ul-pxp
>>> +      - const: fsl,imx6ull-pxp
>>> +      - const: fsl,imx7d-pxp
>>
>> These three are an enum.
> 
> These are alternatives to the 'items:' entry below.
> 
> Are you suggesting to use the following statement?
> 
> oneOf:
>   - enum:
>       - fsl,imx6ul-pxp
>       - fsl,imx6ull-pxp
>       - fsl,imx7d-pxp
>   - items:
>       - enum:
>           - fsl,imx6sll-pxp
>           - fsl,imx6sx-pxp

Yes.

> 
> Why is this better than the one that I used?

Because that's the convention - use enum for enumeration which nicely
groups all of them and is the easiest to read.

> 
>>
>>> +      - items:
>>> +          - enum:
>>> +              - fsl,imx6sll-pxp
>>> +              - fsl,imx6sx-pxp
>>> +          - const: fsl,imx6ull-pxp
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    const: axi
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +  - clock-names
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - fsl,imx6sx-pxp
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          numItems: 1
>>
>> That's not correct syntax... I am surprised that it works. Did you test
>> the bindings?
> 
> I copied this syntax from renesas,wdt.yaml and ran
> 
> 	make ARCH=arm dtbs_check DT_SCHEMA_FILES=fsl,imx6ull-pxp.yaml
> 
> with SOC_IMX7D=y, SOC_IMX6UL=y, SOC_IMX6SLL=y, and SOC_IMX6SX=y. The latter
> two were not enabled in the v1, which is why it didn't catch the missing
> compatibles.
> 
> On a closer look, I just saw that the checker ignored the schema due to the
> incorrect syntax and didn't produce any further errors. With the syntax fixed,
> the checker now produces also a few more errors about power-domains, which I
> will fix in v3.
> 
> Is this syntax correct?
> 
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - fsl,imx6sx-pxp
>     then:
>       properties:
>         interrupts:
>           minItems: 1

Drop this one


>           maxItems: 1
>     else:
>       properties:
>         interrupts:
>           minItems: 2
>           maxItems: 2
> 
> Michael

Rest is ok

Best regards,
Krzysztof

