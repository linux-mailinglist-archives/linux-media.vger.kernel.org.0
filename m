Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0BB13A3295
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 19:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhFJR7y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 13:59:54 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:38672 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhFJR7x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 13:59:53 -0400
Received: by mail-ot1-f41.google.com with SMTP id j11-20020a9d738b0000b02903ea3c02ded8so543289otk.5;
        Thu, 10 Jun 2021 10:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V2+0pbawt/0s4pIlgGvctFlDIbaFKg1ZRcW2jg9lKwU=;
        b=IBmMjdAZDg+p1dGY5Z9F83czaTR4kQ6gPdNz8Xj3qiHniIM2j8spulumCIb28JhZJ6
         brHnmZXm4f+pWL9/6tgO4JTtsTUejLs5ksJmEwPHF/pE59xDK02MD2OOD6QijGZ0ZMrC
         /5w+btVnH/QWciZ+0AR4Yt4+9Ondb7SngJOpRbwGPNZwjgyyaK8ItExLpWLXuwZiyeAa
         m9ALlSRH6qifMBD2GN1hYGSITF5M61D2rF5yVwauFW+AY44ZudfpfW6FDEWiodqy9tPn
         lUKeRnqwPGf6ios3m57zLTdJ7fhn/AFudl8Xmw14kpbJmaMpPpRLQPhcUrQlVZqZADeO
         PUtA==
X-Gm-Message-State: AOAM531dRLbPtSq7sotzfYF7y2XSxk5oqDYsMggou89eG2nn/P033fBY
        K9YQ41PY/AYnzbOdSUT73g==
X-Google-Smtp-Source: ABdhPJwAToOJiC0mSKtLICASE5GDIks9Jjnq5vnMBj4u9NB123xg0atsrTWOBPHjGsKEgaadumLqeQ==
X-Received: by 2002:a9d:526:: with SMTP id 35mr3433392otw.176.1623347860197;
        Thu, 10 Jun 2021 10:57:40 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
        by smtp.gmail.com with ESMTPSA id p10sm787423otf.45.2021.06.10.10.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 10:57:39 -0700 (PDT)
Received: (nullmailer pid 2389055 invoked by uid 1000);
        Thu, 10 Jun 2021 17:57:36 -0000
Date:   Thu, 10 Jun 2021 12:57:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add Intersil ISL79987 DT
 bindings
Message-ID: <20210610175736.GA2337424@robh.at.kernel.org>
References: <20210602132950.4167596-1-m.tretter@pengutronix.de>
 <20210602132950.4167596-2-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602132950.4167596-2-m.tretter@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 02, 2021 at 03:29:49PM +0200, Michael Tretter wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Add bindings for the Intersil ISL79987 analog to MIPI CSI-2 decoder.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-media@vger.kernel.org
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v2:
> 
> - convert binding to yaml
> - change description to match only isl79987
> - replace num-inputs property with multiple ports
> - add reset gpio
> ---
>  .../bindings/media/i2c/isil,isl79987.yaml     | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml b/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> new file mode 100644
> index 000000000000..4aa27511b1ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/isil,isl79987.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intersil ISL79987 Analog to MIPI CSI-2 decoder
> +
> +maintainers:
> +  - Michael Tretter <m.tretter@pengutronix.de>
> +  - Marek Vasut <marex@denx.de>
> +
> +description:
> +  The Intersil ISL79987 is an analog to MIPI CSI-2 decoder which is capable of
> +  receiving up to four analog stream and multiplexing them into up to four MIPI
> +  CSI-2 virtual channels, using one MIPI clock lane and 1/2 data lanes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - isil,isl79987
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      A GPIO spec for the RSTB pin (active high)
> +
> +  pd-gpios:

powerdown-gpios is the somewhat standard name.

> +    maxItems: 1
> +    description:
> +      A GPIO spec for the Power Down pin (active high)
> +
> +  ports:
> +    type: object

Please reference the graph.yaml schema. There's several examples in the 
tree now what this should look like.

> +    description:
> +      A node containing input and output port nodes with endpoint definitions
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt

This is now video-interfaces.yaml, but it's not actually used here.

> +    properties:

> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0

These can be dropped (covered by graph.yaml).

> +      port@0:
> +        type: object
> +        description: Output port
> +
> +    patternProperties:
> +      "^port@[1-4]$":
> +        type: object
> +        description: Input ports
> +
> +    required:
> +      - port@0
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      isl7998x_mipi@44 {
> +        compatible = "isil,isl79987";
> +        reg = <0x44>;
> +        pd-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
> +        reset-gpios = <&gpio3 28 GPIO_ACTIVE_HIGH>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            isl79987_out: endpoint {
> +              remote-endpoint = <&mipi_csi2_in>;
> +              clock-lanes = <0>;
> +              data-lanes = <1 2>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            endpoint {
> +              remote-endpoint = <&camera_0>;
> +            };
> +          };
> +
> +          port@2 {
> +            reg = <2>;
> +            endpoint {
> +              remote-endpoint = <&camera_1>;
> +            };
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.29.2
