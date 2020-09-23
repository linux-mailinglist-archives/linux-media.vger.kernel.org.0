Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7564275954
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 16:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgIWOEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 10:04:47 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37524 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgIWOEq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 10:04:46 -0400
Received: by mail-io1-f67.google.com with SMTP id y13so23812277iow.4;
        Wed, 23 Sep 2020 07:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/2YIbGPyeDVPWPtl7cPgfN2lbTkXGFerVZnaUBAltaA=;
        b=lj/u2bxYSUABC/FcqNSJwNRXtJ4TCCsRZNr12+oKTFeP0HuRfg0tWAb49ZZ/TCBkGr
         68GP+E33mbgazj6cyg69N/mTaSxHo1dEliRyKl4LRfa8OI1GiKhAKLIP5UzLJybBNElK
         +tY++BC5aCyPfEWiWBQo1EClLKKXKnfEoq2VLcl6Mu5KokBr21ZEFr9UnqduVUPwKFgq
         TqsTJTrpAip23U+PokXQhnJBRjz/GFnuZh2w1MPBpDcwYHEvieYZWGmxz/Iqs70iXcZl
         FfyvJLTu4kochBZ8adhSTbOj4DfDCvCkiNtrHX0j4rUNEn9WKkyqHGbqCxFXCCwr6Hrw
         b2Pw==
X-Gm-Message-State: AOAM533Tf+frFlofEzzMxIs8za/cNBKAAJI6COkGRVU81zIQBGoDYtDU
        8BKqg7kORgqPUWn3n/4p3g==
X-Google-Smtp-Source: ABdhPJxstAEhgQaXKaAuFPlgyAyzZjgHKa6/lnHgGk0H6MXAN1HOfoHNKgPecNsaSTpPJLkpHpfD2A==
X-Received: by 2002:a6b:be46:: with SMTP id o67mr7181697iof.133.1600869885401;
        Wed, 23 Sep 2020 07:04:45 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l6sm10864315ilt.34.2020.09.23.07.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 07:04:44 -0700 (PDT)
Received: (nullmailer pid 644635 invoked by uid 1000);
        Wed, 23 Sep 2020 14:04:43 -0000
Date:   Wed, 23 Sep 2020 08:04:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 1/3] media: dt-bindings: media: Document Rockchip VIP
 bindings
Message-ID: <20200923140443.GA639013@bogus>
References: <20200922165535.1356622-1-maxime.chevallier@bootlin.com>
 <20200922165535.1356622-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922165535.1356622-2-maxime.chevallier@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 22, 2020 at 06:55:33PM +0200, Maxime Chevallier wrote:
> Add a documentation for the Rockchip Camera Interface controller
> binding.
> 
> This controller can be found on platforms such as the PX30 or the
> RK3288, the PX30 being the only platform supported so far.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V3 :
>  - renamed the controller
> 
>  .../bindings/media/rockchip-vip.yaml          | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-vip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vip.yaml b/Documentation/devicetree/bindings/media/rockchip-vip.yaml
> new file mode 100644
> index 000000000000..652c46053b29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-vip.yaml
> @@ -0,0 +1,100 @@
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
> +  Camera Interface for Rockcip platforms
> +
> +properties:
> +  compatible:
> +    const: rockchip,px30-vip
> +
> +  reg:
> +    maxItems: 1
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
> +      - const: hclkf
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
> +    description: phandle to the associated power domain

Drop description.

> +
> +  # See ./video-interfaces.txt for details
> +  port:
> +    type: object
> +    additionalProperties: false

Need a description of the data the port represents.

> +
> +    properties:
> +      endpoint:

You can drop 'endpoint' since you don't have any other endpoint 
properties. 

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
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks

port should be required.

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
> +    	compatible = "rockchip,px30-vip";
> +    	reg = <0x0 0xff490000 0x0 0x200>;
> +    	interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +    	clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>, <&cru SCLK_CIF_OUT>;
> +    	clock-names = "aclk", "hclk", "pclkin";
> +    	resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
> +    	reset-names = "axi", "ahb", "pclkin";
> +    	power-domains = <&power PX30_PD_VI>;
> +            port {

Some indentation problems here.

> +                    vip_in: endpoint {
> +                            remote-endpoint = <&tw9900_out>;
> +                    };
> +            };
> +    };
> +...
> -- 
> 2.25.4
> 
