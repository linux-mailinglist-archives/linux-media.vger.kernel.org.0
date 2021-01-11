Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23312F21C9
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 22:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730551AbhAKV1d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 16:27:33 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:41978 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbhAKV1c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 16:27:32 -0500
Received: by mail-ot1-f50.google.com with SMTP id x13so271790oto.8;
        Mon, 11 Jan 2021 13:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jrbTgbbsB7ucHyxqU5kyUyc0pfYnA0fSrAb67IIDtuY=;
        b=lOj00gPgeaftJP2L3gEs6aOay07NSnEVss1gizfSnxhaRKjHp5JRezqjO3/6jhEnIA
         aePwR0nWixslYGhwiWsStftYLMhRsw4YqIzYCKnaeh/iwwlqbii0r7TUMo8xRKHTD1GS
         SHRxIR51LDQHReLEryqyAAQlqt3G68HPaskriBYTr8M62BoTNWykr9Bxa98g0XKIrOug
         rfZOYdaMR1k1VCwmTQRTws1ojZsImlipuYYZ1MwA8c7aw4qTSxKNq0cWy5ii14jzuYC7
         NTecmNJ+vepwLGvJ25VLuB+wZQN7TkBEoE36HPjXy7D0C8ckrYyCsMC5fLAVWQCUjMnm
         e9MQ==
X-Gm-Message-State: AOAM530L++DYcvhmNeRvY1rKwiljO4BOXuGf1j2aVw7WlhbETWRViKnI
        Xw3BxDGn7l8uE1cx3aTuHidHllK8YA==
X-Google-Smtp-Source: ABdhPJxAknhS0Ub3hT/iS75EucEXTks5a7hr8NkJJy7o+yxvBdn8Urgg0jfNQOiJtfQAoonW70R++g==
X-Received: by 2002:a9d:7a48:: with SMTP id z8mr744043otm.146.1610400411252;
        Mon, 11 Jan 2021 13:26:51 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v3sm155081ool.16.2021.01.11.13.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 13:26:50 -0800 (PST)
Received: (nullmailer pid 3089505 invoked by uid 1000);
        Mon, 11 Jan 2021 21:26:49 -0000
Date:   Mon, 11 Jan 2021 15:26:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 1/3] media: dt-bindings: media: Document Rockchip VIP
 bindings
Message-ID: <20210111212649.GA3086014@robh.at.kernel.org>
References: <20201229161724.511102-1-maxime.chevallier@bootlin.com>
 <20201229161724.511102-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229161724.511102-2-maxime.chevallier@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 29, 2020 at 05:17:22PM +0100, Maxime Chevallier wrote:
> Add a documentation for the Rockchip Camera Interface controller
> binding.
> 
> This controller can be found on platforms such as the PX30 or the
> RK3288, the PX30 being the only platform supported so far.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v3: Renamed the controller to "vip"
> 
> v4: fixed the binding to get a compiling example
> 
> v5: Fixed the binding even more, the 'endpoint' description was missing
> 
>  .../bindings/media/rockchip-vip.yaml          | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-vip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vip.yaml b/Documentation/devicetree/bindings/media/rockchip-vip.yaml
> new file mode 100644
> index 000000000000..93055273b32f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-vip.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip-vip.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip VIP Camera Interface
> +
> +maintainers:
> +  - Maxime Chevallier <maxime.chevallier@bootlin.com>
> +
> +description: |-
> +  Camera Interface for Rockchip platforms
> +
> +properties:
> +  compatible:
> +    const: rockchip,px30-vip
> +
> +  reg:
> +    maxItems: 2

Need to define what each 'reg' entry represents.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ACLK
> +      - description: HCLK
> +      - description: PCLK IN
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: pclkin
> +
> +  resets:
> +    items:
> +      - description: AXI
> +      - description: AHB
> +      - description: PCLK IN
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +      - const: pclkin
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  # See ./video-interfaces.txt for details
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description: A connection to a sensor or decoder
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          remote-endpoint: true
> +
> +        required:
> +          - remote-endpoint
> +
> +    required:
> +      - endpoint

You can drop everything for 'endpoint'. Just need 'port'.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/px30-cru.h>
> +    #include <dt-bindings/power/px30-power.h>
> +
> +    vip: vip@ff490000 {
> +        compatible = "rockchip,px30-vip";
> +        reg = <0x0 0xff490000>, <0x0 0x200>;
> +        interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
> +        clock-names = "aclk", "hclk", "pclkin";
> +        resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
> +        reset-names = "axi", "ahb", "pclkin";
> +        power-domains = <&power PX30_PD_VI>;
> +        port {
> +            vip_in: endpoint {
> +                remote-endpoint = <&tw9900_out>;
> +            };
> +        };
> +    };
> +...
> -- 
> 2.25.4
> 
