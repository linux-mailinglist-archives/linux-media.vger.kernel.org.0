Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E473742E245
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 21:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233679AbhJNT4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 15:56:47 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:40619 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbhJNT4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 15:56:46 -0400
Received: by mail-ot1-f54.google.com with SMTP id s18-20020a0568301e1200b0054e77a16651so9751791otr.7;
        Thu, 14 Oct 2021 12:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JPDCV7jRJwustScVV2I4EPabdLIyy/HHraYI7adzlYg=;
        b=pLnV72ZOpQ/VA3909CAA+QDpz6E4IGXLLGgbc/N2xFhMR/RGMngiq+09u5tCi2K+Tx
         cMeVxwkUxeaHFrGkRtnOtB8m786rcZUpmI0NdMzRTA1v/NyiA2cNXJrR3v7ZPSLEWkN8
         6dr1KBSATVVcPomg8iB/aOL5JykCJ/fxi8b2haWP2AYY+mPb0TQ61LJfdnr3iSdF6iJW
         inHDP+B/pqzJIcogH7i2DBx5h3q8Jg4AEnUesHjPtZQOq8ntLcEvp0cXed8JVkEYeiaS
         HrO3ktJWI6WNTOmUPDQHc39Zk346g4A5hN0WUPD8LvJe9V5G/j+92E3Wli19BEm+zjhu
         kJmg==
X-Gm-Message-State: AOAM533sji6sV3+yBCq7xYPKS3evtZL9T5sJ4t5Ggt9bnBh13nPAfziV
        ggoO2th2T5ZcEenlOHaHzUrhCPcVDw==
X-Google-Smtp-Source: ABdhPJz9iygn6Jid8WOEYpTOB3KoBhPIlssRtgUX+LyK6h45pe8mnfse8OX+SJUxJsvEiSV5nzJGMQ==
X-Received: by 2002:a05:6830:1c64:: with SMTP id s4mr4299211otg.174.1634241281006;
        Thu, 14 Oct 2021 12:54:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v5sm740163ote.72.2021.10.14.12.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 12:54:40 -0700 (PDT)
Received: (nullmailer pid 3814021 invoked by uid 1000);
        Thu, 14 Oct 2021 19:54:39 -0000
Date:   Thu, 14 Oct 2021 14:54:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Anil Kumar Mamidala <anil.mamidala@xilinx.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@iki.fi, naveenku@xilinx.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for
 AP1302
Message-ID: <YWiK/xXEQwC5HgWD@robh.at.kernel.org>
References: <20211006113254.3470-1-anil.mamidala@xilinx.com>
 <20211006113254.3470-2-anil.mamidala@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006113254.3470-2-anil.mamidala@xilinx.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 06, 2021 at 05:32:54AM -0600, Anil Kumar Mamidala wrote:
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
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
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
> +  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
> +  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
> +  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
> +  Frames are output side by side or on two virtual channels.
> +
> +  The sensors must be identical. They are connected to the AP1302 on dedicated
> +  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
> +  from the host.

In your case, but in general I'd assume whatever sensors are used here 
could be attached directly to an SoC with a built-in ISP? The model and 
power supplies you specify wouldn't be different, so I think the same 
binding could be used for both. Though here, you probably just need a 
subset. More below.

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

Then make it a compatible string and move into each child node.

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

items:
  - enum: [ 0, 1]

> +
> +        patternProperties:
> +          ".*-supply":

You need to list the supplies out. I would make this a schema for the 
sensor along with compatible. Here, you could either reference those if 
you want to document the list of supported sensors or don't reference 
them and just document 'reg'. With a compatible, the schema will be 
applied anyways.

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
> 
