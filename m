Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C12D6010A4
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 15:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiJQN6l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 09:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbiJQN6X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 09:58:23 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6757647D2
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 06:58:16 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id sc25so25067373ejc.12
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 06:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l6qb7EnwWd+MujPJIdP+A0aq3ZXuoSEIdKGZ1nIKSBU=;
        b=WSmB0k/y+owfGHpr7XZueKvVYyAsF/HG2UJkVCUUx80g+eJoYbIqb/Dd3iKZLzj+2a
         HlXroWuTmESs69/ky6M71ERjUYT0Vgsf4U5UkSc+wysCnkS4//hW4yDcQOwaXUBF4Q0l
         QlzgDugDExrrxJbmObFjv51ilttgLbTJ6OxO3DA/mqtlTFNdZ9H9Hkj2Trmw1KWe4XRJ
         mzHAbc0kqWVnDlm4nJvp4rcv9pVxJXTXVZoQ60+RffoBNNYo5wcQQecPszl5ii9yD+y1
         jqu6e6CBQEPtJlqtbAG6nBWTvYhhzBZOweeGHTMEqmI6aYFNMdv3uUnS8GM6/rliDWd4
         9hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6qb7EnwWd+MujPJIdP+A0aq3ZXuoSEIdKGZ1nIKSBU=;
        b=5qQLrbBr+kneJP+8150JDaiOTVOdEykYkZg3MTo6m1bTA86YpJ2qCvImG+xkb/tSWG
         VSwurFxWF21GlJClH6BklcRJJkoS0nqsm1pX9LuPPMsdg/UMxBibr3y1GM+i2sdf0sml
         4PRmIG1L1Ev6nc4lUXVHzniECEp1NMQ6aiiu1hwKZm6doNT0HtT7DQyKnhg16o6XbplY
         9MZ3x89mwPZap32QbBraTyJjbNaMpk0EPGtjnYv901LQZXmEvJw7V9ybdtzBTECmHuP2
         rc2rvedODGBlysZiGPxpKlIOVUs1O+xuhDmYDwEyi5Xn50LuDDwbawnpt3HCxsdiLglc
         GjRw==
X-Gm-Message-State: ACrzQf3LsFPan32KoloYJ+U/Kpov5MOoOrCq6bQIU9ZyiwdjwR0auFtC
        UIUNe5gdfuLz6/zQq202liawI/uxIPMyuWePASBsRQ==
X-Google-Smtp-Source: AMsMyM4Ov26cj1GiYz2ZhZkbdyGIWCXwoTehLQKTtCSomF/ccslqb6E03xaDlUVPloPpohLqaFpy9ZrmfmEJj3op23o=
X-Received: by 2002:a17:907:97c1:b0:791:98b8:9ab8 with SMTP id
 js1-20020a17090797c100b0079198b89ab8mr765215ejc.425.1666015094221; Mon, 17
 Oct 2022 06:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com> <20221016061523.30127-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20221016061523.30127-2-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 17 Oct 2022 14:57:58 +0100
Message-ID: <CAPY8ntCH5qc9cMHEjyX2K-2spibi=zp8vdvexz1Coouyp5sKWg@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] media: dt-bindings: Convert imx290.txt to YAML
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Sun, 16 Oct 2022 at 07:15, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Convert the Sony IMX290 DT binding from text to YAML. Add Manivannan as
> a maintainer given that he is listed in MAINTAINERS for the file, as
> volunteering myself.
>
> The name of the input clock, "xclk", is wrong as the hardware manual
> names it INCK. As the device has a single clock, the name could be
> omitted, but that would require a corresponding change to the driver and
> is thus a candidate for further patches.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/i2c/imx290.txt  |  57 --------
>  .../bindings/media/i2c/sony,imx290.yaml       | 129 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 130 insertions(+), 58 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.txt b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> deleted file mode 100644
> index a3cc21410f7c..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/imx290.txt
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -* Sony IMX290 1/2.8-Inch CMOS Image Sensor
> -
> -The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
> -Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
> -interfaces. The sensor output is available via CMOS logic parallel SDR output,
> -Low voltage LVDS DDR output and CSI-2 serial data output. The CSI-2 bus is the
> -default. No bindings have been defined for the other busses.
> -
> -Required Properties:
> -- compatible: Should be "sony,imx290"
> -- reg: I2C bus address of the device
> -- clocks: Reference to the xclk clock.
> -- clock-names: Should be "xclk".
> -- clock-frequency: Frequency of the xclk clock in Hz.
> -- vdddo-supply: Sensor digital IO regulator.
> -- vdda-supply: Sensor analog regulator.
> -- vddd-supply: Sensor digital core regulator.
> -
> -Optional Properties:
> -- reset-gpios: Sensor reset GPIO
> -
> -The imx290 device node should contain one 'port' child node with
> -an 'endpoint' subnode. For further reading on port node refer to
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Required Properties on endpoint:
> -- data-lanes: check ../video-interfaces.txt
> -- link-frequencies: check ../video-interfaces.txt
> -- remote-endpoint: check ../video-interfaces.txt
> -
> -Example:
> -       &i2c1 {
> -               ...
> -               imx290: camera-sensor@1a {
> -                       compatible = "sony,imx290";
> -                       reg = <0x1a>;
> -
> -                       reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> -                       pinctrl-names = "default";
> -                       pinctrl-0 = <&camera_rear_default>;
> -
> -                       clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
> -                       clock-names = "xclk";
> -                       clock-frequency = <37125000>;
> -
> -                       vdddo-supply = <&camera_vdddo_1v8>;
> -                       vdda-supply = <&camera_vdda_2v8>;
> -                       vddd-supply = <&camera_vddd_1v5>;
> -
> -                       port {
> -                               imx290_ep: endpoint {
> -                                       data-lanes = <1 2 3 4>;
> -                                       link-frequencies = /bits/ 64 <445500000>;
> -                                       remote-endpoint = <&csiphy0_ep>;
> -                               };
> -                       };
> -               };
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> new file mode 100644
> index 000000000000..21377daae026
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx290.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX290 1/2.8-Inch CMOS Image Sensor
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |-
> +  The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with Square
> +  Pixel for Color Cameras. It is programmable through I2C and 4-wire
> +  interfaces. The sensor output is available via CMOS logic parallel SDR
> +  output, Low voltage LVDS DDR output and CSI-2 serial data output. The CSI-2
> +  bus is the default. No bindings have been defined for the other busses.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sony,imx290
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description: Input clock (37.125 MHz or 74.25 MHz)
> +    items:
> +      - const: xclk
> +
> +  clock-frequency:
> +    description: Frequency of the xclk clock in Hz
> +
> +  vdda-supply:
> +    description: Analog power supply (2.9V)
> +
> +  vddd-supply:
> +    description: Digital core power supply (1.2V)
> +
> +  vdddo-supply:
> +    description: Digital I/O power supply (1.8V)
> +
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: |
> +      Video output port
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            anyOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +          link-frequencies: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - clock-frequency
> +  - vdda-supply
> +  - vddd-supply
> +  - vdddo-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        imx290: camera-sensor@1a {
> +            compatible = "sony,imx290";
> +            reg = <0x1a>;
> +
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&camera_rear_default>;
> +
> +            clocks = <&gcc 90>;
> +            clock-names = "xclk";
> +            clock-frequency = <37125000>;
> +
> +            vdddo-supply = <&camera_vdddo_1v8>;
> +            vdda-supply = <&camera_vdda_2v8>;
> +            vddd-supply = <&camera_vddd_1v5>;
> +
> +            reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                imx290_ep: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <445500000>;

Minor nit that this won't work with the current Linux driver due to a
driver restriction implementing the recommended settings from Sony.
OV8865 has the same restrictions and notes it in the binding[1]. I
don't know if this is the preferred approach or not.

  Dave

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/media/i2c/ov8856.yaml#L78

> +                    remote-endpoint = <&csiphy0_ep>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 72b9654f764c..c431fd20e89b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18982,7 +18982,7 @@ M:      Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media_tree.git
> -F:     Documentation/devicetree/bindings/media/i2c/imx290.txt
> +F:     Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
>  F:     drivers/media/i2c/imx290.c
>
>  SONY IMX319 SENSOR DRIVER
> --
> Regards,
>
> Laurent Pinchart
>
