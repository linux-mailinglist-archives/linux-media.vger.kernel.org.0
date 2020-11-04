Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83332A6FE0
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 22:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729141AbgKDVsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 16:48:11 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41905 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727260AbgKDVsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 16:48:10 -0500
Received: by mail-ot1-f67.google.com with SMTP id n15so167272otl.8;
        Wed, 04 Nov 2020 13:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7C/3Lb0bwZBRdurv8E1wsyNxTVaWO6cCodubIto6duA=;
        b=YlVB70vh3DTNpa4Thcrlkh3FK1jeZrIATToglnKq6RNyVSKWyVNLkXcBE684FCNfZD
         PEebID6Lu2Znnrymm/oOeY1VJ1MIvsD5eGZGEvn+uUwXADx8GPjb882nFm1ll9wKubxj
         0rGwlA+Uv6BIxR/NT6MNr/dkqaBs0k6ZFsYNr79EtxzsuVxpM0W+uepuHTXymY5tCN9h
         8r/THxSV/DcMWhJiUaZmHHyckuFt7r46nUE9R1XXBXLXJy6u1ArFBiKv/1cZJ5mgQsDH
         Acu+lPgBG2X5KUlYtOJjBgnY/MFicXWKol7A8GSKFd0W8jMRNzgSHr/R377Ma4zQSYHT
         7GnQ==
X-Gm-Message-State: AOAM532XRGnBCfoF2ErdxkPLb5kBTghMuXz/r2UokHc2buzQbWnhNNIA
        8+kEWCTrIDwKbNz04LSKsQ==
X-Google-Smtp-Source: ABdhPJzK/2g8s8M/SdXP5Y9tjzJM1hX3Ba2FKG+BTArfKY6tFXLj1VMewbDVlUBdSKpRgavD5l7GdQ==
X-Received: by 2002:a9d:6419:: with SMTP id h25mr20652310otl.79.1604526487923;
        Wed, 04 Nov 2020 13:48:07 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h6sm766953otr.28.2020.11.04.13.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 13:48:07 -0800 (PST)
Received: (nullmailer pid 4180264 invoked by uid 1000);
        Wed, 04 Nov 2020 21:48:06 -0000
Date:   Wed, 4 Nov 2020 15:48:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     mchehab@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS
 sensor binding
Message-ID: <20201104214806.GA4175708@bogus>
References: <20201029172947.34315-1-kholk11@gmail.com>
 <20201029172947.34315-3-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029172947.34315-3-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 29, 2020 at 06:29:47PM +0100, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add YAML device tree binding for IMX300 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  .../bindings/media/i2c/sony,imx300.yaml       | 112 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> new file mode 100644
> index 000000000000..8f1d795f8072
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx300.yaml#
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
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  vdig-supply:
> +    description:
> +      Digital I/O voltage supply, 1.15-1.20 volts
> +
> +  vana-supply:
> +    description:
> +      Analog voltage supply, 2.2 volts
> +
> +  vddl-supply:
> +    description:
> +      Digital core voltage supply, 1.8 volts
> +
> +  reset-gpios:

maxItems: 1

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
> +
> +        properties:
> +          data-lanes:
> +            description: |-
> +              The sensor supports either two-lane, or four-lane operation,
> +              but the driver currently supports only four-lane.

What the driver is not relevant. Please define all possible 
configurations. Or just omit? What's the behavior if omitted?

> +            items:
> +              - const: 0
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +
> +          clock-noncontinuous: true
> +
> +          link-frequencies:
> +            $ref: /schemas/types.yaml#/definitions/uint64-array
> +            description:
> +              Allowed data bus frequencies. The driver currently needs
> +              to switch between 780000000 and 480000000 Hz in order to
> +              guarantee functionality of all modes.
> +
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vana-supply
> +  - vdig-supply
> +  - vddl-supply
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
> +            vana-supply = <&imx300_vana>;   /* 2.2v */
> +            vdig-supply = <&imx300_vdig>;   /* 1.2v */
> +            vddl-supply = <&imx300_vddl>;   /* 1.8v */
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
> index c66710dd7e0a..21ba41db0063 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16279,6 +16279,13 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
>  F:	drivers/media/i2c/imx290.c
>  
> +SONY IMX300 SENSOR DRIVER
> +M:	AngeloGioacchino Del Regno <kholk11@gmail.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> +F:	drivers/media/i2c/imx300.c
> +
>  SONY IMX319 SENSOR DRIVER
>  M:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.28.0
> 
