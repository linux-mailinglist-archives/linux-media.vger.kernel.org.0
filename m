Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 570AA5A8117
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 17:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiHaPUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 11:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbiHaPUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 11:20:12 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24FC20F53
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 08:20:07 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bt10so20440286lfb.1
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=20Vr5j6nd++c5ftjotZW+yVR5V1oPbMNKTijzFjKl40=;
        b=aFdbIJ1+Aq1TthvYLh/QfpRdG6+FgfQi2YYYS+K4e6JOV5wtYhP98ejYf6VDFji/OJ
         ICt084TZEi6kmkyiQibhsdEV6QVbDwt5WOHGW3v+GFYI6ihOKHiA9SKHiVk90iBP0ZqJ
         hJXJm9fPTxpCJEAwKaTQ+zNyqnbz108n7P8OLbkjtDoaZeeUQZcZV1bqAJSp3oWJHFI0
         gFdbhrjNHn3Pd5WK3IIlvuJ8yhFVc5vKx0lfSQehyKfIno7o9IRfwCo9wRv3u8pB/ZLN
         9+UMbFigaQ4POikSJCwK5AABjrB/1BOP6gTL9agtKRg3JRsomBQmNOIYg/lqhCUU7TMW
         aH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=20Vr5j6nd++c5ftjotZW+yVR5V1oPbMNKTijzFjKl40=;
        b=VZQFWoRRSZOBcEtIn+g+A5RI+8ByzeLBdZIXlB9MwLxZEAMANIEeNtNImkLkcyJt92
         VoUUIKb2/bJNmssctl98ewb5JNDC79ybDAgoaswqPJbAmPRJe0x1yHNpt2iOLKYwJHCL
         YOgO+EtdGWanlP21tknVrYRSlnOSWKjFxGQpj8PRosnulwINvJRdYnmqlu1uFABCCV7T
         qfxM/zgYHQFBzeUx4ISvi7CL1v5Vk+MkqMWYDwaTudDHoLgDonebs+TAqmmpgWxbKzAl
         vfydLp6XvmN96SG+8X/hcRa/Uw9OKXHa1VViOIIboYqaJ0tDk2EEQrcZGvpZOklRqYKJ
         dBPQ==
X-Gm-Message-State: ACgBeo2X2TMPaUjIrpXkFnrSrokw4u2f2HqsniKrtOu/Cv5yhtU42js9
        0qYgwdQ9OUM6QDvCcAFC4fN2cw==
X-Google-Smtp-Source: AA6agR6r4qgwUkkOS/Oe7+nmQM/2dnewUJ4KBVkWDdAxTuyTguGN+I9Dy6DNA4dStrUxkOrwELYsFw==
X-Received: by 2002:ac2:4465:0:b0:493:b4:c4ac with SMTP id y5-20020ac24465000000b0049300b4c4acmr9046749lfl.446.1661959205933;
        Wed, 31 Aug 2022 08:20:05 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id y4-20020ac255a4000000b0048137a6486bsm1335295lfg.228.2022.08.31.08.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 08:20:05 -0700 (PDT)
Message-ID: <ac6ed365-a44c-6e48-899a-3d692c61b70f@linaro.org>
Date:   Wed, 31 Aug 2022 18:20:04 +0300
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
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220831143722.2067457-1-biju.das.jz@bp.renesas.com>
 <20220831143722.2067457-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220831143722.2067457-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/08/2022 17:37, Biju Das wrote:
> Document FCPVD found in RZ/G2L alike SoCs. FCPVD block is similar to
> FCP for VSP found on R-Car SoC's . It has 3 clocks compared to 1
> clock on fcpv. Introduce new compatibles renesas,r9a07g044-fcpvd
> for RZ/G2{L,LC} and renesas,r9a07g054-fcpvd for RZ/V2L to handle this
> difference.
> 
> The 3 clocks are shared between du, vspd and fcpvd. Update the bindings
> to reflect this.
> 
> No driver changes are required as generic compatible string
> "renesas,fcpv" will be used as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Documented RZ/{G2,V2}L FCPVD bindings
>  * Introduces new compatibles renesas,r9a07g0{44,54}-fcpvd
>  * Added clock-names property
>  * described clocks.
> ---
>  .../bindings/media/renesas,fcp.yaml           | 46 +++++++++++++++++--
>  1 file changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index 43f2fed8cd33..79a55694b2a2 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -21,15 +21,23 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - renesas,fcpv # FCP for VSP
> -      - renesas,fcpf # FCP for FDP
> +    oneOf:
> +      - items:

No items here. You have just one item, so it is not a list.

> +          - enum:
> +              - renesas,fcpv # FCP for VSP
> +              - renesas,fcpf # FCP for FDP
> +
> +      - items:
> +          - enum:
> +              - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
> +              - renesas,r9a07g054-fcpvd # RZ/V2L
> +          - const: renesas,fcpv   # generic FCP for VSP fallback
>  
>    reg:
>      maxItems: 1
>  
> -  clocks:
> -    maxItems: 1
> +  clocks: true
> +  clock-names: true

Both should have here the widest constraints: minItems:1 and maxItems:3.


Best regards,
Krzysztof
