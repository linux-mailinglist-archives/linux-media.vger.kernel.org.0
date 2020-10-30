Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275A32A0B56
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgJ3QkB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:40:01 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38722 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3QkB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:40:01 -0400
Received: by mail-oi1-f194.google.com with SMTP id 9so7250344oir.5;
        Fri, 30 Oct 2020 09:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XKztsWcZasal2O06qo55L0eJo2O/+Ed23onN3u66G6Y=;
        b=Dapu6PrPHbrKvseok7FCclsfzpK9uQ8zNQ3Nd3WdgYoDa3QYaY9wLetUINyAx4Mgkn
         KjSb3ntzWDu61Zyk+3kYzJScUyn3k3MlCEokr2xhluG5dRpoqrY1l0o6wNKS91svp8CB
         p5MifmJ6G56npLbjR5CWkiAU/vUHWvkngv8GrMQvRKdvnl4d3DZOela0zRzS85u/Pp65
         p/dfqyIau4zP71TpdOC8FWmOs0AT1qL3sHQwEyg9ne40FyISL66YWokVf7iCCJCqGn0v
         usMpab8Y3wOZmdbC2B4Tw/jHyLP/PAjSWwCxfelUx2G6IBdlq1FGMpFTTYz1ytNaC/CK
         rTgg==
X-Gm-Message-State: AOAM532AkESChNo+Ra93AfUfILTrWRs8WmrVrj1Jp+j9DEPxd3/YSioL
        Ye5oLUsIRDDIy6c1hSb8+Q==
X-Google-Smtp-Source: ABdhPJyj/mHVLN92/7MH5CL/dIFYAuNvLkG5xyiLxfWbikKyWL1yAsPDt8TxCNgsD1r7UZmTrtRCWQ==
X-Received: by 2002:aca:5047:: with SMTP id e68mr2115953oib.175.1604075958774;
        Fri, 30 Oct 2020 09:39:18 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g203sm1534170oib.22.2020.10.30.09.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 09:39:18 -0700 (PDT)
Received: (nullmailer pid 3965405 invoked by uid 1000);
        Fri, 30 Oct 2020 16:39:17 -0000
Date:   Fri, 30 Oct 2020 11:39:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, kevin.lhopital@hotmail.com,
        =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add OV8865 bindings
 documentation
Message-ID: <20201030163917.GA3963319@bogus>
References: <20201023175406.504527-1-paul.kocialkowski@bootlin.com>
 <20201023175406.504527-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201023175406.504527-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 23, 2020 at 07:54:04PM +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the OV8865
> image sensor.
> 
> Co-developed-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/media/i2c/ovti,ov8865.yaml       | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> new file mode 100644
> index 000000000000..807f1a94afae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> @@ -0,0 +1,124 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license please. With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov8865.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV8865 Image Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: ovti,ov8865
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: EXTCLK Clock
> +
> +  clock-names:
> +    items:
> +      - const: extclk
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply (internal AVDD is used if missing)
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: Power Down Pin GPIO Control (active low)
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Pin GPIO Control (active low)
> +
> +  port:
> +    type: object
> +    description: Input port, connect to a MIPI CSI-2 receiver
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          remote-endpoint: true
> +
> +          bus-type:
> +            const: 4
> +
> +          clock-lanes:
> +            maxItems: 1
> +
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
> +
> +        required:
> +          - bus-type
> +          - data-lanes
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dvdd-supply
> +  - dovdd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sun8i-a83t-ccu.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c2 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov8865: camera@36 {
> +            compatible = "ovti,ov8865";
> +            reg = <0x36>;
> +
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&csi_mclk_pin>;
> +
> +            clocks = <&ccu CLK_CSI_MCLK>;
> +            clock-names = "extclk";
> +
> +            avdd-supply = <&reg_ov8865_avdd>;
> +            dovdd-supply = <&reg_ov8865_dovdd>;
> +            dvdd-supply = <&reg_ov8865_dvdd>;
> +
> +            powerdown-gpios = <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
> +            reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +
> +            port {
> +                ov8865_out_mipi_csi2: endpoint {
> +                    bus-type = <4>; /* MIPI CSI-2 D-PHY */
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2 3 4>;
> +
> +                    remote-endpoint = <&mipi_csi2_in_ov8865>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.28.0
> 
