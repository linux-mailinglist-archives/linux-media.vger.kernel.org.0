Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE16660050
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 13:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbjAFMeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 07:34:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjAFMeg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 07:34:36 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02F168781
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 04:34:34 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso962970wms.5
        for <linux-media@vger.kernel.org>; Fri, 06 Jan 2023 04:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jF2NwuEVtIyabCQ9D0ubzMuiiBr02z+cf6tpqI8SRzM=;
        b=A2+Li5+4hel0eFx5woAPyWwYJF4ww9ArkhmfMH3UxnS5hyLs4eUTDKDUXe1vgU8UtL
         jsUxYyXVcGYZAKVG7E9jhYaW4roTXmjiU43+rMdJ0wVrNZIwJs635D40fYnlHfNmCz45
         nn3BYqveIpNE2ke/IB7vhO7PxMU2PsAwfS3UdjMCP2YDfB/fabXCJUTwM3ZbfpY4bBad
         dFOetn5+1ZG0rOCnAwS7B1Y1f1s6K0g5fUtNnzqnCF8yoytOdfkoo7pDt+BFaMaBMVzI
         x7VKePZzAFN5PNiqZv6qn6wXJttnla8vtNOYYZRNwxz+YP3kzhFEDeiIb7redmOqEGrU
         FjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jF2NwuEVtIyabCQ9D0ubzMuiiBr02z+cf6tpqI8SRzM=;
        b=H27iHmzB47Hckof3XAYXKrkLqQWORKPt9eSFpVy3acLneEjbPdCpcVkk4YroyhpG9f
         Yx+ohBMOauBlBY2Il89poqnYmwB9W/rquy5J/Y1fzZUL+IUgflgIG+NY4ClS7OJJKx8n
         AEhvFn/vDI6qVNE0H5vweqm4rfcE5iTsYInI1DOdKPG+zcD5XAErPBCa4WUmYfHJr+c7
         wApjqm5OxYCOGSjS9EDz3AG1dtkdzn/ZMdhZWIJKTxN2TGP3SDW7adHsrm6El15svZwK
         KllKXDoXUtHNzPSzgQQirI+8XO7auCCW8XkV/tH87bmh2Wk2dqMDQ1Mad79SEd8KqTtp
         EEcw==
X-Gm-Message-State: AFqh2kpVQphZqQBCzVKJXKmjNeIG4hVZ96oUXLrh3ZyMi5pYMXWk39/g
        4eGKKdrYI/rVrxfsVGIkpkHLig==
X-Google-Smtp-Source: AMrXdXu0bu9AYTf2EdowC6SvotNmFG70r9dWstp+n15xfZItLWoQ+YrxZKVawh4v8BhYADbbfeyMPQ==
X-Received: by 2002:a05:600c:44d4:b0:3cf:7925:7a3 with SMTP id f20-20020a05600c44d400b003cf792507a3mr38805480wmo.24.1673008473337;
        Fri, 06 Jan 2023 04:34:33 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b003d01b84e9b2sm1728409wms.27.2023.01.06.04.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:34:32 -0800 (PST)
Message-ID: <1c53c929-52cc-facd-b068-2de286a57b72@linaro.org>
Date:   Fri, 6 Jan 2023 13:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/8] media: dt-bindings: media: fsl-pxp: convert to yaml
Content-Language: en-US
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-2-m.tretter@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105134729.59542-2-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/01/2023 14:47, Michael Tretter wrote:
> Convert the bindings of the Freescale Pixel Pipeline to YAML.
> 
> The conversion drops the previously listed compatibles for several SoCs.
> It is unclear, if the PXP on these SoCs is compatible to any of the PXPs
> on the existing SoCs and would allow to reuse the already defined
> compatibles. The missing compatibles should be brought back when the
> support for the PXP on these SoCs is added.
> 

Subject: only one "media" prefix.

> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  .../bindings/media/fsl,imx6ull-pxp.yaml       | 62 +++++++++++++++++++
>  .../devicetree/bindings/media/fsl-pxp.txt     | 26 --------
>  2 files changed, 62 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/fsl-pxp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> new file mode 100644
> index 000000000000..e5f227b84759
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop qyotes from both.

> +
> +title: Freescale Pixel Pipeline
> +
> +maintainers:
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +  - Michael Tretter <m.tretter@pengutronix.de>
> +
> +description:
> +  The Pixel Pipeline (PXP) is a memory-to-memory graphics processing engine
> +  that supports scaling, colorspace conversion, alpha blending, rotation, and
> +  pixel conversion via lookup table. Different versions are present on various
> +  i.MX SoCs from i.MX23 to i.MX7.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx6ul-pxp
> +      - fsl,imx6ull-pxp
> +      - fsl,imx7d-pxp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names

Add allOf:if:then restricting interrupts per variant.

> +
> +additionalProperties: False
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx6ul-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +

Best regards,
Krzysztof

