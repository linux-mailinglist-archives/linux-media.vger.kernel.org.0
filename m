Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29CB302C96
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 21:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732288AbhAYU3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 15:29:03 -0500
Received: from mail-oo1-f53.google.com ([209.85.161.53]:37436 "EHLO
        mail-oo1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbhAYU07 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 15:26:59 -0500
Received: by mail-oo1-f53.google.com with SMTP id q3so3585528oog.4;
        Mon, 25 Jan 2021 12:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FSg4INHSggtMiAtH0ajTU964cpIOeVyZUnN9S+EGu08=;
        b=CmpCUDfpuRUSAmb6shFrFLKveQjc59AL0JcSWc2PMDavvQQrg4NDuh7BiQ7XG2RPO3
         B67coYrR/7ydx8ez2pssBi3POHfDJo3tF+m/aaP0HlP8hwXDSmqivRnu3QQQVJxhmIaV
         LQw3FQjrc7BO1B1URpF1mYYVaUTtl2NjLECG+DldC32CjTL5+uNbbSbMUvXzMr/Fd7RJ
         9OM14TkiSQJYmGPefzNT3M665zg13iI58W5a4pbRpbXC+cLxwmJqnm0gT6KWTYC8EqoZ
         ljMY15owpRbrw/0AQwtq5uRmp03h6Fu2s6jqwX3zok2dGN1RRzCHnUaqygAtvuN+oFhX
         7waA==
X-Gm-Message-State: AOAM533T7swLJVa4+9BBTYKQQO2gm3to+SfZkbuTdH5Nnv6uid4yI2fG
        jgnImaMpv+aFJdnpj/GuEQ==
X-Google-Smtp-Source: ABdhPJzL7dMxUvAQG2Fb/Nrbe0hA/9aUsmo+HOrMyQqwNhQHrIWJfmlR/OLuRmMavJvbMa+ChT92kg==
X-Received: by 2002:a4a:4302:: with SMTP id k2mr1612446ooj.50.1611606377371;
        Mon, 25 Jan 2021 12:26:17 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m15sm3682391otl.11.2021.01.25.12.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 12:26:16 -0800 (PST)
Received: (nullmailer pid 919151 invoked by uid 1000);
        Mon, 25 Jan 2021 20:26:15 -0000
Date:   Mon, 25 Jan 2021 14:26:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
Subject: Re: [PATCH v4 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS
 sensor binding
Message-ID: <20210125202615.GA912502@robh.at.kernel.org>
References: <20210113182934.444727-1-angelogioacchino.delregno@somainline.org>
 <20210113182934.444727-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113182934.444727-3-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 07:29:34PM +0100, AngeloGioacchino Del Regno wrote:
> Add YAML device tree binding for IMX300 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/media/i2c/sony,imx300.yaml       | 112 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> new file mode 100644
> index 000000000000..4fa767feea80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx300.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.3-Inch 25Mpixel Stacked CMOS Digital Image Sensor
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
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
> +    description: |-
> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released (set high) after all supplies are applied.
> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:

This now needs to reference the graph.yaml and video-interfaces.yaml 
schemas. See the media tree or linux-next for examples.

> +        type: object
> +
> +        properties:
> +          data-lanes:
> +            description: |-
> +              The driver only supports four-lane operation.
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
> +          - data-lanes
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
> index ad9abb42f852..5e0f08f48d48 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16633,6 +16633,13 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
>  F:	drivers/media/i2c/imx290.c
>  
> +SONY IMX300 SENSOR DRIVER
> +M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
> +F:	drivers/media/i2c/imx300.c
> +
>  SONY IMX319 SENSOR DRIVER
>  M:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.29.2
> 
