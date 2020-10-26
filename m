Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E48298DF5
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 14:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1775350AbgJZNdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 09:33:47 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:35450 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1775337AbgJZNdr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 09:33:47 -0400
Received: by mail-oo1-f68.google.com with SMTP id n16so1175864ooj.2;
        Mon, 26 Oct 2020 06:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IP4iyQJswqAok5YqCaA2i0INTs3TLOZl4gZPXVizm4k=;
        b=BAbD/XnQyx0qwyRrYeb5dxOZGE39hPTnb/wQm53m6c5SYip1lNf1mjHtJJHYfal5tl
         6kV8PtUB9dLbTnj9mamsLUg5p5n2yv9YNYQO8NBGJJHrg9TYzjqHyj6TO6wCVVNiRJEb
         7UoBFIyq7Kyv3wPE0pCgbdkWkP+s6arlFNytgceXmpih6/ypNy7HEvKXlsoBmgANm5BE
         bAkOytfoyCoSa5lFYGjv2LZkCr1Y16OftIgs2K3sAUBa/QrJTph9Htc6XjlXlylyJb2A
         osKVUhwNfCLm+fdaW5O44AqVE9i+babVwO1WqFarQCO6uLj1NW/odJ+k1WfPf1e5IN9K
         fFHQ==
X-Gm-Message-State: AOAM532LpIS8n1QhiGAX9aZA9TprtzvTgWiUZreXXImNhxRj/5dI/3vb
        SHCcVP5DZ6ZRG+kRioLLRg==
X-Google-Smtp-Source: ABdhPJwwG8ar0qV0qkYQrQi3UOmSi48GDAQAgsW9zYDOfxpN1Y1iuY9C8rW1hpp7KJUy3YYIhmbxsA==
X-Received: by 2002:a4a:e1bc:: with SMTP id 28mr14244535ooy.53.1603719225403;
        Mon, 26 Oct 2020 06:33:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g11sm3496989otl.12.2020.10.26.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 06:33:44 -0700 (PDT)
Received: (nullmailer pid 37444 invoked by uid 1000);
        Mon, 26 Oct 2020 13:33:44 -0000
Date:   Mon, 26 Oct 2020 08:33:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     mchehab@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS
 sensor binding
Message-ID: <20201026133344.GA33253@bogus>
References: <20201018123106.14917-1-kholk11@gmail.com>
 <20201018123106.14917-3-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201018123106.14917-3-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 18, 2020 at 02:31:06PM +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add YAML device tree binding for IMX300 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/imx300.yaml | 115 ++++++++++++++++++

sony,imx300.yaml

>  MAINTAINERS                                   |   8 ++
>  2 files changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx300.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx300.yaml b/Documentation/devicetree/bindings/media/i2c/imx300.yaml
> new file mode 100644
> index 000000000000..82fb19c5018c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx300.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx300.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.3-Inch 8Mpixel Stacked CMOS Digital Image Sensor
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <kholk11@gmail.com>
> +
> +description: |-
> +  The Sony IMX300 is a 1/2.3-inch Stacked CMOS (Exmor-RS) digital image
> +  sensor with a pixel size of 1.08um and an active array size of
> +  5948H x 4140V. It is programmable through I2C interface at address 0x10.
> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> +  4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: sony,imx300
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  VDIG-supply:
> +    description:
> +      Digital I/O voltage supply, 1.15-1.20 volts
> +
> +  VANA-supply:
> +    description:
> +      Analog voltage supply, 2.2 volts
> +
> +  VDDL-supply:
> +    description:
> +      Digital core voltage supply, 1.8 volts
> +
> +  reset-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released (set high) after all supplies are applied.
> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          data-lanes:
> +            description: |-
> +              The sensor supports either two-lane, or four-lane operation.
> +              If this property is omitted four-lane operation is assumed.
> +              For four-lane operation the property must be set to <0 1 2 3>.
> +            items:
> +              - const: 0
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +
> +          clock-noncontinuous:
> +            type: boolean
> +            description: |-
> +              MIPI CSI-2 clock is non-continuous if this property is present,
> +              otherwise it's continuous.

No need to redefine a common property. Just 'clock-noncontinuous: true' 
to indicate using it.

> +
> +          link-frequencies:
> +            $ref: /schemas/types.yaml#/definitions/uint64-array
> +            description:
> +              Allowed data bus frequencies.

Any constraints on frequencies?

> +
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - VANA-supply
> +  - VDIG-supply
> +  - VDDL-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        imx300: sensor@10 {
> +            compatible = "sony,imx300";
> +            reg = <0x10>;
> +            clocks = <&imx300_xclk>;
> +            VANA-supply = <&imx300_vana>;   /* 2.2v */
> +            VDIG-supply = <&imx300_vdig>;   /* 1.2v */
> +            VDDL-supply = <&imx300_vddl>;   /* 1.8v */
> +
> +            port {
> +                imx300_0: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    data-lanes = <0 1 2 3>;
> +                    clock-noncontinuous;
> +                    link-frequencies = /bits/ 64 <780000000 480000000>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c66710dd7e0a..231937d9d16a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16279,6 +16279,14 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
>  F:	drivers/media/i2c/imx290.c
>  
> +SONY IMX300 SENSOR DRIVER
> +M:	AngeloGioacchino Del Regno <kholk11@gmail.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/imx300.yaml
> +F:	drivers/media/i2c/imx300.c
> +
>  SONY IMX319 SENSOR DRIVER
>  M:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.28.0
> 
