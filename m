Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747EE41C4C3
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 14:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343655AbhI2Mbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Sep 2021 08:31:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:41486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343531AbhI2Mbj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Sep 2021 08:31:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D167561411
        for <linux-media@vger.kernel.org>; Wed, 29 Sep 2021 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632918598;
        bh=5rnHvr0BF5s+YZH/met1nyLsw0AUo0J7FUy2IUl9yUA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UC16IDcDDWx+tNDs5J0+B7vkOIdXARiUOqxYvSD844K2r/RzBaWnqriNZTYjwUFrF
         ug6jJsv+35IFyFnuUg8wb9NV2OEyCgJswrbnUwCjMeyl24peBTweyseVm9aU30WrzT
         acgcNWBQkzPiUqOk6wLI/Q1SHy8tG3Av0ZZQwNurAFX6bruqFlxKo9itzmGABN3jWj
         TffDZ8QrfLHAjfv4rssd/Kd9bTZSII5UFcDF/jsLMgsfoK6qGfh/CB53MW7S3OXYyT
         rUDaBEJPvJFxIN28r9GgUXbw/WdzabZZRF48fVhc4ISEF+3Lv+nTtFeazCqvHBG+3i
         UvBfDrhG5s56w==
Received: by mail-ed1-f50.google.com with SMTP id ba1so8042264edb.4
        for <linux-media@vger.kernel.org>; Wed, 29 Sep 2021 05:29:58 -0700 (PDT)
X-Gm-Message-State: AOAM530suNI6/xXXf8Ze7p4b0mjeIgBmgGhKt1mIrKtpl1WyF+x2N7Nm
        Ed4Se8jbIFmab2GAY6M3h5ec66IsCtSm9PL+QA==
X-Google-Smtp-Source: ABdhPJzxYbaRwYSRSxLUHqJm4XNYDy+bTOPIFqHppH2y0CiAfecgcAfdRRtW9M+hpaH4s9lbsyIaGhB4f/VCVl3vMeY=
X-Received: by 2002:a17:906:c10e:: with SMTP id do14mr9391722ejc.84.1632918597252;
 Wed, 29 Sep 2021 05:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com>
 <1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com> <SJ0PR02MB85147532A85305993AAA9D7FB7DB9@SJ0PR02MB8514.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB85147532A85305993AAA9D7FB7DB9@SJ0PR02MB8514.namprd02.prod.outlook.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 29 Sep 2021 07:29:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKc_z5+ToAr60Dfcq1U1O_qHKVgLe2fn1mOkoxRXss2iQ@mail.gmail.com>
Message-ID: <CAL_JsqKc_z5+ToAr60Dfcq1U1O_qHKVgLe2fn1mOkoxRXss2iQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for AP1302
To:     Anil Kumar Mamidala <amamidal@xilinx.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>,
        Naveen Kumar Gaddipati <naveenku@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 15, 2021 at 2:07 PM Anil Kumar Mamidala <amamidal@xilinx.com> wrote:
>
> Hi Rob Herring,
>
> Can you please review the patch and provide your valuable feedback.

It's not reviewed because you didn't send to the DT list. Please
resend so that checks run and it's in my queue.

>
> Thanks and regards,
> Anil.
>
> -----Original Message-----
> From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> Sent: Wednesday, September 8, 2021 2:26 PM
> To: linux-media@vger.kernel.org; sakari.ailus@iki.fi; robh+dt@kernel.org
> Cc: Naveen Kumar Gaddipati <naveenku@xilinx.com>; Anil Kumar Mamidala <amamidal@xilinx.com>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Stefan Hladnik <stefan.hladnik@gmail.com>; Florian Rebaudo <frebaudo@witekio.com>
> Subject: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for AP1302
>
> The AP1302 is a standalone ISP for ON Semiconductor sensors.
> Add corresponding DT bindings.
>
> Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> ---
>  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 202 +++++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> new file mode 100644
> index 0000000..d96e9db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor AP1302 Advanced Image Coprocessor
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Anil Kumar M <anil.mamidala@xilinx.com>
> +
> +description: |-
> +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It
> +interfaces to
> +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the
> +two
> +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> +  Frames are output side by side or on two virtual channels.
> +
> +  The sensors must be identical. They are connected to the AP1302 on
> + dedicated  I2C buses, and are controlled by the AP1302 firmware. They
> + are not accessible  from the host.
> +
> +properties:
> +  compatible:
> +    const: onnn,ap1302
> +
> +  reg:
> +    description: I2C device address.
> +    maxItems: 1
> +
> +  clocks:
> +    description: Reference to the CLK clock.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Reference to the GPIO connected to the RST pin (active low).
> +    maxItems: 1
> +
> +  standby-gpios:
> +    description:
> +      Reference to the GPIO connected to the STANDBY pin (active high).
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description: MIPI CSI-2 output interface to the host.
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +        unevaluatedProperties: false
> +
> +        properties:
> +          clock-noncontinuous:
> +            type: boolean
> +
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +        required:
> +          - data-lanes
> +
> +  sensors:
> +    type: object
> +    description: List of connected sensors
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      onnn,model:
> +        $ref: "/schemas/types.yaml#/definitions/string"
> +        description: |
> +          Model of the connected sensors. Must be a valid compatible string.
> +
> +          If no sensor is connected, this property must no be specified, and
> +          the AP1302 can be used with it's internal test pattern generator.
> +
> +    patternProperties:
> +      "^sensor@[01]":
> +        type: object
> +        description: |
> +          Sensors connected to the first and second input, with one node per
> +          sensor.
> +
> +        properties:
> +          reg:
> +            description: AP1302 input port number
> +            maxItems: 1
> +
> +        patternProperties:
> +          ".*-supply":
> +            description: Power supplies for the sensor
> +
> +        required:
> +          - reg
> +
> +        additionalProperties: false
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +
> +    # How can we express that onnn,model requires one sensor object to be set ?
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +  - sensors
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
> +        camera@3c {
> +            compatible = "onnn,ap1302";
> +            reg = <0x3c>;
> +
> +            clocks = <&clk24mhz>;
> +
> +            reset-gpios = <&pio 102 GPIO_ACTIVE_LOW>;
> +            standby-gpios = <&pio 40 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                isp1_out: endpoint {
> +                    remote-endpoint = <&seninf_in1>;
> +                    data-lanes = <1 2 3 4>;
> +                };
> +            };
> +
> +            sensors {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                onnn,model = "onnn,ar0144";
> +
> +                sensor@0 {
> +                    reg = <0>;
> +
> +                    vdd-supply = <&mt6358_vcamd_reg>;
> +                    vaa-supply = <&mt6358_vcama1_reg>;
> +                    vddio-supply = <&reg_1p8v_ext>;
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@3c {
> +            compatible = "onnn,ap1302";
> +            reg = <0x3c>;
> +
> +            clocks = <&topckgen 0>;
> +
> +            reset-gpios = <&pio 102 GPIO_ACTIVE_LOW>;
> +            standby-gpios = <&pio 40 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                isp2_out: endpoint {
> +                    remote-endpoint = <&seninf_in1>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +
> +            sensors {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };
> +
> +...
> --
> 2.7.4
>
