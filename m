Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D8E26595D
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 08:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgIKG3E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 02:29:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgIKG27 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 02:28:59 -0400
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26E69221EB;
        Fri, 11 Sep 2020 06:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599805738;
        bh=/07ksweJnDkaY/jZOyqLS1uc5qgP+Ig00dI7SY7hqzA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Stvif8Q0Q+4jzaPTrOFqZVH7FsOiK+ZjpASZf0VqH6pCC4T06/a9MREqCXPzAh4jj
         UpWC3JSxCO3VwA5EYoqVK9sZTUnqC+AbKL79Yut0221Kqoy8sM4dXte4AvXZNJtRMC
         CXTGaABVRitunngzpYNY2P15OMd7MPkFrEu9b+eI=
Received: by mail-lj1-f169.google.com with SMTP id k25so11227628ljg.9;
        Thu, 10 Sep 2020 23:28:58 -0700 (PDT)
X-Gm-Message-State: AOAM533x1kC+WTS+8hkMReCpKnRuuzOKccnm6/unEy0rdj5oURYQh5KX
        FrxegK8t4NpanrgYbVMPOhJI9TRkGIuJCKb3rI8=
X-Google-Smtp-Source: ABdhPJxbrNtIKWMmhaEF6K5agc0Sp4FsE1672qJZDzZQfA936iOVKk0jxJE4hvdybwtWXWibtmM0KvwHJsT5ij8A1+Y=
X-Received: by 2002:a2e:b543:: with SMTP id a3mr193808ljn.19.1599805736415;
 Thu, 10 Sep 2020 23:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200910162030.614029-1-jacopo+renesas@jmondi.org>
In-Reply-To: <20200910162030.614029-1-jacopo+renesas@jmondi.org>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Fri, 11 Sep 2020 08:28:40 +0200
X-Gmail-Original-Message-ID: <CAPybu_0+mga9FvOs=aWS90sVnb1ZvYYuP2AUckov60jAXyPqXw@mail.gmail.com>
Message-ID: <CAPybu_0+mga9FvOs=aWS90sVnb1ZvYYuP2AUckov60jAXyPqXw@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: media: imx214: Convert to json-schema
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the port


On Thu, Sep 10, 2020 at 6:17 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>
> Convert the imx214 bindings document to json-schema and update
> the MAINTAINERS file accordingly.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Ricardo Ribalda <ribalda@kernel.org>
> ---
>  .../bindings/media/i2c/sony,imx214.txt        |  53 -------
>  .../bindings/media/i2c/sony,imx214.yaml       | 133 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 134 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt b/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> deleted file mode 100644
> index f11f28a5fda4..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -* Sony 1/3.06-Inch 13.13Mp CMOS Digital Image Sensor
> -
> -The Sony imx214 is a 1/3.06-inch CMOS active pixel digital image sensor with
> -an active array size of 4224H x 3200V. It is programmable through an I2C
> -interface.
> -Image data is sent through MIPI CSI-2, through 2 or 4 lanes at a maximum
> -throughput of 1.2Gbps/lane.
> -
> -
> -Required Properties:
> -- compatible: Shall be "sony,imx214".
> -- reg: I2C bus address of the device. Depending on how the sensor is wired,
> -       it shall be <0x10> or <0x1a>;
> -- enable-gpios: GPIO descriptor for the enable pin.
> -- vdddo-supply: Chip digital IO regulator (1.8V).
> -- vdda-supply: Chip analog regulator (2.7V).
> -- vddd-supply: Chip digital core regulator (1.12V).
> -- clocks: Reference to the xclk clock.
> -- clock-frequency: Frequency of the xclk clock.
> -
> -Optional Properties:
> -- flash-leds: See ../video-interfaces.txt
> -- lens-focus: See ../video-interfaces.txt
> -
> -The imx214 device node shall contain one 'port' child node with
> -an 'endpoint' subnode. For further reading on port node refer to
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Required Properties on endpoint:
> -- data-lanes: check ../video-interfaces.txt
> -- link-frequencies: check ../video-interfaces.txt
> -- remote-endpoint: check ../video-interfaces.txt
> -
> -Example:
> -
> -       camera-sensor@1a {
> -               compatible = "sony,imx214";
> -               reg = <0x1a>;
> -               vdddo-supply = <&pm8994_lvs1>;
> -               vddd-supply = <&camera_vddd_1v12>;
> -               vdda-supply = <&pm8994_l17>;
> -               lens-focus = <&ad5820>;
> -               enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> -               clocks = <&mmcc CAMSS_MCLK0_CLK>;
> -               clock-frequency = <24000000>;
> -               port {
> -                       imx214_ep: endpoint {
> -                               data-lanes = <1 2 3 4>;
> -                               link-frequencies = /bits/ 64 <480000000>;
> -                               remote-endpoint = <&csiphy0_ep>;
> -                       };
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> new file mode 100644
> index 000000000000..0f5e25fa4e9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx214.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/3.06-Inch 13.13MP CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Ricardo Ribalda <ribalda@kernel.org>
> +
> +description: |
> +  The Sony IMX214 is a 1/3.06-inch CMOS active pixel digital image sensor with
> +  an active array size of 4224H x 3200V. It is programmable through an I2C
> +  interface. Image data is sent through MIPI CSI-2, through 2 or 4 lanes at a
> +  maximum throughput of 1.2Gbps/lane.
> +
> +properties:
> +  compatible:
> +    const: sony,imx214
> +
> +  reg:
> +    enum:
> +      - 0x10
> +      - 0x1a
> +
> +  clocks:
> +    description: Reference to the xclk clock.
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description: Frequency of the xclk clock in Hz.
> +
> +  enable-gpios:
> +    description: GPIO descriptor for the enable pin.
> +    maxItems: 1
> +
> +  vdddo-supply:
> +    description: Chip digital IO regulator (1.8V).
> +    maxItems: 1
> +
> +  vdda-supply:
> +    description: Chip analog regulator (2.7V).
> +    maxItems: 1
> +
> +  vddd-supply:
> +    description: Chip digital core regulator (1.12V).
> +    maxItems: 1
> +
> +  flash-leds:
> +    description: See ../video-interfaces.txt
> +
> +  lens-focus:
> +    description: See ../video-interfaces.txt
> +
> +  port:
> +    type: object
> +    description: |
> +      Video output port. See ../video-interfaces.txt.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          data-lanes:
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            description: See ../video-interfaces.txt
> +            anyOf:
> +              - items:
> +                - const: 1
> +                - const: 2
> +              - items:
> +                - const: 1
> +                - const: 2
> +                - const: 3
> +                - const: 4
> +
> +          link-frequencies:
> +            $ref: /schemas/types.yaml#/definitions/uint64-array
> +            description: See ../video-interfaces.txt
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-frequency
> +  - enable-gpios
> +  - vdddo-supply
> +  - vdda-supply
> +  - vddd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera-sensor@1a {
> +            compatible = "sony,imx214";
> +            reg = <0x1a>;
> +            vdddo-supply = <&pm8994_lvs1>;
> +            vddd-supply = <&camera_vddd_1v12>;
> +            vdda-supply = <&pm8994_l17>;
> +            lens-focus = <&ad5820>;
> +            enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> +            clocks = <&camera_clk>;
> +            clock-frequency = <24000000>;
> +
> +            port {
> +                imx214_ep: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <480000000>;
> +                    remote-endpoint = <&csiphy0_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2c9393a7e1ba..cad34960d5ca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16127,7 +16127,7 @@ M:      Ricardo Ribalda <ribalda@kernel.org>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media_tree.git
> -F:     Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
> +F:     Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
>  F:     drivers/media/i2c/imx214.c
>
>  SONY IMX219 SENSOR DRIVER
> --
> 2.28.0
>
