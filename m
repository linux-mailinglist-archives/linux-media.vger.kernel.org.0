Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A137C9902
	for <lists+linux-media@lfdr.de>; Sun, 15 Oct 2023 14:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjJOMjW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Oct 2023 08:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjJOMjV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Oct 2023 08:39:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A88FD6;
        Sun, 15 Oct 2023 05:39:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB896327;
        Sun, 15 Oct 2023 14:39:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697373551;
        bh=dzjnCjwfcqMfcNNHqBSajU7MAd1Z/q6f1+jISiGq4wc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lWTA4B8ogveTLdw4KUrBd92ZacGUfzAzx2gzJrDfDJ/16yA/g2TGCCHhyvM2P68qH
         h3Qg+CWBdsF8xgm9KIiiVa5VvB59fB98tyuRRSlSus/PJLOGaPy//rLMiMPgfRkIBJ
         RWqATi8lPV9zVrOGPW76Wwg/zk0sURwIQGQhPcLY=
Date:   Sun, 15 Oct 2023 15:39:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <20231015123923.GB23177@pendragon.ideasonboard.com>
References: <20231012193737.7251-1-laurent.pinchart@ideasonboard.com>
 <20231012193737.7251-2-laurent.pinchart@ideasonboard.com>
 <aaa41ff2-d2e3-4c25-9654-065a02275619@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaa41ff2-d2e3-4c25-9654-065a02275619@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Thu, Oct 12, 2023 at 09:57:38PM +0200, Krzysztof Kozlowski wrote:
> On 12/10/2023 21:37, Laurent Pinchart wrote:
> 
> Thanks for the changes

You're welcome. Sorry again for missing some of your review comments on
v1.

> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            description:
> > +              This property is for lane reordering between the THP7312 and the
> > +              SoC. The sensor supports either two-lane, or four-lane operation.
> > +              If this property is omitted four-lane operation is assumed. For
> > +              two-lane operation the property must be set to <1 2>.
> > +            minItems: 2
> > +            maxItems: 4
> > +            items:
> > +              maximum: 4
> > +
> > +  sensors:
> > +    type: object
> > +    description: List of connected sensors
> 
> I don't understand why do you list sensors here. From the binding
> description I understood these are external sensors, which usually sit
> on I2C bus.

Good question :-)

The sensors connected to the THP7312 input are controlled over I2C by
the THP7312 itself. The host operating system doesn't have access to
that I2C bus. The sensors are listed here because their power supplies
need to be controlled by the host operating system.

> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^sensor@[01]":
> > +        type: object
> > +        description:
> > +          Sensors connected to the first and second input, with one node per
> > +          sensor.
> > +
> > +        properties:
> > +          thine,model:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            description:
> > +              Model of the connected sensors. Must be a valid compatible string.
> 
> Then why this isn't compatible?

We picked a vendor-specific property to avoid implying that the sensor
nodes will result in devices being created by the host operating system.
I don't mind using "compatible" instead, but as far as I understand, a
compatible string implies that corresponding device DT bindings should
exist, and that won't be the case here necessarily.

> > +
> > +          reg:
> > +            maxItems: 1
> > +            description: THP7312 input port number
> > +
> > +          data-lanes:
> > +            $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
> > +            items:
> > +              maxItems: 4
> > +            description:
> > +              This property is for lane reordering between the THP7312 and the imaging
> > +              sensor that it is connected to.
> > +
> > +        patternProperties:
> > +          ".*-supply":
> > +            description: Power supplies for the sensor
> > +
> > +        required:
> > +          - reg
> > +          - data-lanes
> > +
> > +        additionalProperties: false
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset-gpios
> > +  - clocks
> > +  - vddcore-supply
> > +  - vhtermrx-supply
> > +  - vddtx-supply
> > +  - vddhost-supply
> > +  - vddcmos-supply
> > +  - vddgpio-0-supply
> > +  - vddgpio-1-supply
> > +  - sensors
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        camera@61 {
> > +            compatible = "thine,thp7312";
> > +            reg = <0x61>;
> > +
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&cam1_pins_default>;
> > +
> > +            reset-gpios = <&pio 119 GPIO_ACTIVE_LOW>;
> > +            clocks = <&camera61_clk>;
> > +
> > +            vddcore-supply = <&vsys_v4p2>;
> > +            vhtermrx-supply = <&vsys_v4p2>;
> > +            vddtx-supply = <&vsys_v4p2>;
> > +            vddhost-supply = <&vsys_v4p2>;
> > +            vddcmos-supply = <&vsys_v4p2>;
> > +            vddgpio-0-supply = <&vsys_v4p2>;
> > +            vddgpio-1-supply = <&vsys_v4p2>;
> > +
> > +            orientation = <0>;
> > +            rotation = <0>;
> > +
> > +            sensors {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                sensor@0 {
> > +                    thine,model = "sony,imx258";
> > +                    reg = <0>;
> > +
> > +                    data-lanes = <4 1 3 2>;
> > +
> > +                    dovdd-supply = <&vsys_v4p2>;
> > +                    avdd-supply = <&vsys_v4p2>;
> > +                    dvdd-supply = <&vsys_v4p2>;
> > +                };
> > +            };
> > +
> > +            port {
> > +                thp7312_2_endpoint: endpoint {
> > +                    remote-endpoint = <&mipi_thp7312_2>;
> > +                    data-lanes = <4 2 1 3>;
> > +                };
> > +            };
> > +    	  };
> > +    };

-- 
Regards,

Laurent Pinchart
