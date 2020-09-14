Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1886C269436
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 19:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgINRyE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 13:54:04 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:37189 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgINRx5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 13:53:57 -0400
Received: by mail-il1-f193.google.com with SMTP id q4so421297ils.4;
        Mon, 14 Sep 2020 10:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2qj8tRwwb6mL83OdJiTqiFtTk2+6xjuz2fEjNrt8UOA=;
        b=bLg83qzTSRF5HwOaljMJkzL1nUBn5dPdLbvT6ZjYWZQmmr9misnlDASY1i+z7bwftD
         A0lw9ABGMIYYErqaOQLIwAB5UHBnKfTCCflIDGxosjrXIlLHB/xw5btHvk1NcUPqeXQB
         C5y+e/3+4wl3wcDIE9mO3MlD37SqaYwU6sxKPESxrA7syInEd+wtpFAD5YysxcZ3OZ+t
         XaRumQLwmZbHcDjuxOMRbcWMUh+L2Ej+8AaHNXqE8idgrObyx9k1zU2bvCIrf5sz8zir
         I9dqjQ9hfUCM75V9I02Ug3hepw4UWuSeAfhn0G5Hg4DQ6Q5U0uW0KExAPV4nqn4pd9he
         cCZQ==
X-Gm-Message-State: AOAM530QGbpre6ukfMgOKJSAj60e+oS4ie1zns1fD09R81tzt3sJZukv
        caaAyMCDVx0eR76UT3h4cw==
X-Google-Smtp-Source: ABdhPJwZuEEOjA/38pkz+xsbLFQQ6WIEeX2g3Z1se/ADcSs7SpH1DoVj5rbLnF/FSEQ/Gu+Mov/xKQ==
X-Received: by 2002:a92:7c03:: with SMTP id x3mr13668869ilc.241.1600106036059;
        Mon, 14 Sep 2020 10:53:56 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c6sm3414096ils.86.2020.09.14.10.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 10:53:55 -0700 (PDT)
Received: (nullmailer pid 4136085 invoked by uid 1000);
        Mon, 14 Sep 2020 17:53:53 -0000
Date:   Mon, 14 Sep 2020 11:53:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        mark.rutland@arm.com, mripard@kernel.org, wens@csie.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add documentation for
 ov8865
Message-ID: <20200914175353.GA4127535@bogus>
References: <20200828131134.12113-1-kevin.lhopital@bootlin.com>
 <20200828131134.12113-2-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200828131134.12113-2-kevin.lhopital@bootlin.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 28, 2020 at 03:11:32PM +0200, Kévin L'hôpital wrote:
> Add a documentation for the sensor ov8865 from Omnivision.
> 
> Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> ---
>  .../devicetree/bindings/media/i2c/ov8865.yaml | 165 ++++++++++++++++++

Use the compatible string for the filename.

>  1 file changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8865.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ov8865.yaml
> new file mode 100644
> index 000000000000..468ddfd48c7a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8865.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: (GPL-2.0 0R BSD-2-Clause)
> +# Copyright (C) 2020 Kévin L'hôpital
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ov8865.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV8865 Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Kévin L'hôpital <kevin.lhopital@bootlin.com>
> +
> +description: |-
> +  The Omnivision OV8865 is a image sensor that supports up to 3264x2448. It
> +  provides a 10 bits output format and a MIPI CSI2 interface (up to 4-lane).
> +  This chip is programmable through I2C.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov8865
> +
> +  reg:
> +    maxItems: 1
> +
> +  pinctrl-names:
> +    description:
> +      Default name for the ov8865 pinctrl.
> +
> +  pinctrl-0:
> +    description:
> +      Pinctrl for the ov8865.

You can drop pinctrl-*. They are automatically added.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Input clock name for the sensor.
> +
> +    items:
> +      - const: xclk
> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +
> +  dovdd-supply:
> +    description:
> +      Definition of the regulator used as interface power supply.
> +
> +  vdd2-supply:
> +    description:
> +      Definition of the regulator used as digital power supply
> +
> +  afvdd-supply:
> +    description:
> +      Definition of the regulator used as actuator power supply.
> +
> +  powerdown-gpios:
> +    description:
> +      reference to the GPIO connceted to the powerdown pin. This is an active
> +      low signal on the OV8865.
> +
> +  reset-gpios:
> +    description:
> +      Reference to the GPIO connected to the reset pin. This is an active low
> +      signal for the OV8865.
> +
> +  rotation:
> +    description:
> +      Position of the sensor, the valid values are 0 (sensor mounted upright)
> +      and 180 (sensor mounted upside down).

Constraints, not free form text:

enum: [ 0, 180 ]

> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      A node containing an output port node with an endpoint definition as
> +      documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          data-lanes:
> +            description:
> +              The driver only supports four-lane operation.

Not relevant to the h/w description.

> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +          clock-lanes:
> +            items:
> +              const: 0

If fixed in the h/w, it doesn't need to be in DT.

> +
> +          bus-type:
> +            description:
> +              The driver only supports the MIPI CSI2
> +            items:
> +              const: 4

Both of the above comments apply here...

> +
> +        required:
> +          - data-lanes
> +          - clock-lanes
> +          - bus-type
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - pinctrl-names
> +  - pinctrl-0
> +  - clocks
> +  - clock-names
> +  - avdd-supply
> +  - dovdd-supply
> +  - vdd2-supply
> +  - afvdd-supply
> +  - powerdown-gpios
> +  - reset-gpios
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
> +         #address-cells = <1>;
> +         #size-cells = <0>;
> +          ov8865: camera@36 {
> +                 compatible = "ovti,ov8865";
> +                 reg = <0x36>;
> +                 pinctrl-names = "default";
> +                 pinctrl-0 = <&csi_mclk_pin>; 
> +                 clocks = <&ccu CLK_CSI_MCLK>;
> +                 clock-names ="xclk";
> +                 avdd-supply = <&reg_ov8865_avdd>;
> +                 dovdd-supply = <&reg_ov8865_dovdd>;
> +                 vdd2-supply = <&reg_ov8865_vdd2>;
> +                 afvdd-supply = <&reg_ov8865_afvdd>;
> +                 powerdown-gpios = <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
> +                 reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +                 rotation = <180>;
> +
> +                 port {
> +                      ov8865_to_mipi_csi2: endpoint {
> +                                 remote-endpoint = <&mipi_csi2_from_ov8865>;
> +                                 data-lanes = <1 2 3 4>;
> +                                 clock-lanes = <0>;
> +                                 bus-type = <4>; /* V4L2_FWNODE_BUS_TYPE_CSI2_DPHY */
> +                      };
> +                 };
> +           };
> +    };
> +
> +...
> -- 
> 2.17.1
> 
