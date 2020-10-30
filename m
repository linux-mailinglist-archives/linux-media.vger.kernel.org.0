Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE102A0B4E
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgJ3QhN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:37:13 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44111 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgJ3QhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:37:12 -0400
Received: by mail-ot1-f67.google.com with SMTP id m26so6047785otk.11;
        Fri, 30 Oct 2020 09:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tON2DYpRhaN1RpQeoSWQVw8FGd03p7OznarWViYiQhQ=;
        b=TD+bQx0rbOKT/TtUwhSKG6z7l8+j+3NCp6m3cjeZABoMAOzdKzhyllVF7u7UkisWhe
         kt7Ui/BnytKXew0EnjufLAYz3oVByvqAbljPwCtZuEKqQVprDf/pVR0r3iUCEE6Gq/HF
         JhcOdm47EYM1A8LQ550TgXMZIr53WY50c9uPZVMilRI1NrY7/+SAycHgU80cb07ht5Ra
         iR0q/IId09VK07JUeBW7cWBC5gx8IaV1UR+oLIrC4QgLWsDQaZuEOMZi3Bagavh1dby/
         DRm1woRqk/56CLskXTcap2N5x9zk+eApDoPkQIELO/LKMHQWmXTcyeV+Di4rAoLQBYgH
         01Jg==
X-Gm-Message-State: AOAM531SQya5gfuamgu5sxJ5N6Rq0Wr4miog3kZy/Vqq3clqtrJ9jfqf
        5AR3Y4WRVumgTIcBz8APXg==
X-Google-Smtp-Source: ABdhPJyArF2iu/YEd1ILY0V/G9i9SCSsBRVS2xnFFvYp1bMQMQVB51XPwuP7kPTqftcIbcWWc3DCFA==
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr2186323oti.107.1604075831553;
        Fri, 30 Oct 2020 09:37:11 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r8sm1366884otq.43.2020.10.30.09.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 09:37:10 -0700 (PDT)
Received: (nullmailer pid 3962933 invoked by uid 1000);
        Fri, 30 Oct 2020 16:37:09 -0000
Date:   Fri, 30 Oct 2020 11:37:09 -0500
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
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add OV5648 bindings
 documentation
Message-ID: <20201030163709.GA3960634@bogus>
References: <20201023174944.504358-1-paul.kocialkowski@bootlin.com>
 <20201023174944.504358-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023174944.504358-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 23, 2020 at 07:49:43PM +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the OV5648
> image sensor.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/media/i2c/ovti,ov5648.yaml       | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> new file mode 100644
> index 000000000000..347af925b450
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license please. With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5648.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV5648 Image Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: ovti,ov5648
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XVCLK Clock
> +
> +  clock-names:
> +    items:
> +      - const: xvclk
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
> +            maxItems: 2
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
> +    #include <dt-bindings/clock/sun8i-v3s-ccu.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov5648: camera@36 {
> +            compatible = "ovti,ov5648";
> +            reg = <0x36>;
> +
> +            dvdd-supply = <&ov5648_dvdd>;
> +            avdd-supply = <&ov5648_avdd>;
> +            dovdd-supply = <&ov5648_dovdd>;
> +            clocks = <&ov5648_xvclk 0>;
> +            clock-names = "xvclk";
> +
> +            ov5648_out: port {
> +                ov5648_out_mipi_csi2: endpoint {
> +                    bus-type = <4>; /* MIPI CSI-2 D-PHY */
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2>;
> +
> +                    remote-endpoint = <&mipi_csi2_in_ov5648>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.28.0
> 
