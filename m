Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71778554B8E
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 15:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351878AbiFVNnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 09:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352029AbiFVNm7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 09:42:59 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3F5614B
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 06:42:57 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t24so15615316lfr.4
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AG/AGLFtspsBCjlBWHr4/smuRbxFiZY+aRHzoGzHeAY=;
        b=CieY+zlnH1jg/SQSVcK6U9bLI5arZKPjdLkWRSSd2EVfBjGKmIswBsPRcE54zZQLqe
         DO8C92T89CUHrcm6ZHEzNd9NCOPh2TKmPKYYTu9f7Vv1qql8tF9FAis3jft6yPSg+arl
         PSe3oIdVXRpAA4DBAIz44w1Z9QPQ/SfaYmHluyDf1QN6jygMdBmgP3OxXUdTthOWgflo
         rHhb1d+QgjFbYHI79q3GA1H2JZDDu4nSS96QWSP+Ev6qKHIi1x3Y9/mPm+HyxDHBZMU7
         ArfoaVViRhGCsR6+5YvONrgZaM7y5BOxDxfgXb1dFfZp9rqnBTEgaLEPp7u2AkcA8vBD
         2aWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AG/AGLFtspsBCjlBWHr4/smuRbxFiZY+aRHzoGzHeAY=;
        b=G+cOizOn5hr9IZiw+h8LKMNGQQiMynxx/Kht9PokZCWyjJRSM3DPw18DdKD5upeSa+
         YkMe0diU84NloTGsixebpg0M3c4A1DJXVvpyg2VEcFt/kdx3De+QRRVsT7q9GPNfjngM
         aG+5lDZC6uuBSCSfOaR8le7QHWjzWISBtf6jorG8c7wVgCY1IiHNpN5YXwRe/0pWKwJM
         lv6jNxKWE/1n6VAK0xmnrkATf14/hH2/1MigezpOTYC5JR1zB+s0q1t2igGV0Jxuktcm
         oKqDWvV/fIyrITg5rlpz5XuPoE+MAB3T+EnXJIme6Qns08UO46ROrp2Cu6bFqu4V9MQC
         i8Xw==
X-Gm-Message-State: AJIora9WrCVVfIy167O2M3+tVnZ8RgUhZ5pw5jBmMMuSsJM3g1Zjsca1
        c3t91eOaIFP2QaAGZA6o+O0WBg==
X-Google-Smtp-Source: AGRyM1vqCTRYzgAFWer6yh9WUjpiaRcSn4i1Ecj33k+3DUBlyHtVlQDGefbg0GSaFMD1p9ZD0xlZJg==
X-Received: by 2002:a05:6512:61:b0:47f:7f37:fad3 with SMTP id i1-20020a056512006100b0047f7f37fad3mr2140827lfo.318.1655905375526;
        Wed, 22 Jun 2022 06:42:55 -0700 (PDT)
Received: from vkh-ThinkPad-T490 ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id n26-20020a05651203fa00b004795311530asm1627595lfq.209.2022.06.22.06.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 06:42:55 -0700 (PDT)
Date:   Wed, 22 Jun 2022 16:42:49 +0300
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-media@vger.kernel.org, ays@melexis.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com, kieran.bingham+renesas@ideasonboard.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] media: dt-bindings: media: i2c: Add mlx7502x camera
 sensor binding
Message-ID: <20220622134249.GA56966@vkh-ThinkPad-T490>
References: <20220620162525.GA14062@vkh-ThinkPad-T490>
 <d66fe477-9ce7-97c1-4f21-93562c9a5711@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d66fe477-9ce7-97c1-4f21-93562c9a5711@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

Thanks for your review,

On Mon, Jun 20, 2022 at 06:55:40PM +0200, Krzysztof Kozlowski wrote:
> On 20/06/2022 18:25, Volodymyr Kharuk wrote:
> > From: Volodymyr Kharuk <vkh@melexis.com>
> > To: linux-media@vger.kernel.org
> > Cc: Volodymyr Kharuk <vkh@melexis.com>,
> > 	Andrii Kyselov <ays@melexis.com>,
> > 	Mauro Carvalho Chehab <mchehab@kernel.org>,
> > 	Rob Herring <robh+dt@kernel.org>,
> > 	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
> > 	Hyun Kwon <hyun.kwon@xilinx.com>,
> > 	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
> > 	Michal Simek <michal.simek@xilinx.com>,
> > 	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
> > 	devicetree@vger.kernel.org
> > Subject: [PATCH 5/6] media: dt-bindings: media: i2c: Add mlx7502x camera sensor binding
> > Date: Mon, 20 Jun 2022 19:24:36 +0300
> > Message-Id: <fde3ed603f2c605278ab8fe2c0aa03e96ce4fb33.1655738299.git.vkh@melexis.com>
> > X-Mailer: git-send-email 2.36.1
> > In-Reply-To: <cover.1655738299.git.vkh@melexis.com>
> > References: <cover.1655738299.git.vkh@melexis.com>
> > MIME-Version: 1.0
> > Content-Transfer-Encoding: 8bit
> 
> I don't think your email is correct... The easiest to create proper
> patch is to use Git (git format-patch, git send-email).
Actually I've used git format-patch and git send-email.
I wanted to use mutt as sendmail. Mutt didn't understand the header from git send-email.
So now I switched to another sendmail. Now it should be fine.
> 
> 
> > 
> > Add device tree binding of the mlx7502x and update MAINTAINERS
> > 
> > Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> > ---
> >  .../bindings/media/i2c/melexis,mlx7502x.yaml  | 106 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 107 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> > new file mode 100644
> > index 000000000000..0cc6e425caec
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> > @@ -0,0 +1,106 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/melexis,mlx7502x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Melexis ToF 7502x MIPI CSI-2 Sensor Device Tree Bindings
> 
> s/Device Tree Bindings//
> 
> > +
> > +maintainers:
> > +  - Volodymyr Kharuk <vkh@melexis.com>
> > +
> > +description: |-
> > +  Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
> > +  and mipi speeds are 300, 600, 704, 800, 904, 960Mbs. Supported format is RAW12.
> > +  Sensor 75026 is QVGA, while 75027 is VGA sensor.
> > +
> > +properties:
> > +  compatible:
> > +    const: melexis,mlx7502x
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vcc-supply:
> > +    description: VCC supply phandle.
> > +
> > +  hw-trigger-gpio:
> 
> Yoiu need vendor prefix here, because this does not look like standard
> property. Plus "gpios", not "gpio", so:
> melexis,hw-trigger-gpios
> 
> > +    maxItems: 1
> > +    description: Hardware Trigger GPIO Control (active low)
> > +
> > +  reset-gpio:
> 
> reset-gpios
> 
> > +    maxItems: 1
> > +    description: Reset Sensor GPIO Control (active low)
> > +
> > +  leden-gpio:
> 
> vendor prefix + gpios, unless this is "enable-gpios" standard property.
Yes it is enable for another device(illumination), so it not the standard one.
> 
> > +    maxItems: 1
> > +    description: Led driver enanle GPIO Control (active high)
> 
> enable?
Yeap, thanks
> 
> > +
> > +  port:
> > +    description: MIPI CSI-2 transmitter port
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            anyOf:
> 
> oneOf
> although probably has the same effect
Agree.
> 
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +                  - const: 3
> > +                  - const: 4
> > +
> > +          clock-noncontinuous: true
> > +          link-frequencies: true
> > +
> > +        required:
> > +          - data-lanes
> > +          - link-frequencies
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c1 {
> 
> Just "i2c"
> 
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        mlx7502x: camera@57 {
> > +            compatible = "melexis,mlx7502x";
> > +            reg = <0x57>;
> > +
> > +            vcc-supply = <&mlx_7502x_reg>;
> > +            hw-trigger-gpio = <&gpio_exp 2 GPIO_ACTIVE_HIGH>;
> > +            reset-gpio = <&gpio_exp 6 GPIO_ACTIVE_HIGH>;
> > +            leden-gpio = <&gpio_exp 7 GPIO_ACTIVE_HIGH>;
> > +
> > +            port {
> > +                mlx7502x_out_mipi_csi2: endpoint {
> > +                    remote-endpoint = <&mipi_csi2_from_mlx7502x>;
> > +                    data-lanes = <1 2 3 4>;
> > +                    link-frequencies = /bits/ 64 < 960000000
> > +                                                   904000000
> > +                                                   800000000
> > +                                                   704000000
> > +                                                   600000000
> > +                                                   300000000 >;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6b74de976e90..ce052a351fda 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12676,6 +12676,7 @@ M:	Volodymyr Kharuk <vkh@melexis.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Supported
> >  W:	http://www.melexis.com
> > +F:	Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> >  F:	include/uapi/linux/mlx7502x.h
> >  
> >  MELFAS MIP4 TOUCHSCREEN DRIVER
> 
> 
> Best regards,
> Krzysztof

-- 
BR,
Volodymyr Kharuk

