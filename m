Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 702933D69BA
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 00:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbhGZWFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 18:05:10 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:34412 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhGZWFK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 18:05:10 -0400
Received: by mail-io1-f54.google.com with SMTP id y200so13932506iof.1;
        Mon, 26 Jul 2021 15:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JJi5/NipfYexXfhOBVu2EGHhfRXUbMtu0cckqDFhtN0=;
        b=G0OR7GZS1UP7KQl+h+kHf1CCu33AqXTr1mSAdrqACOzz8sC/WP0yFEC+VXB3FNNVD2
         JKOASIhgjIsy6rd1fGTNYML97Y38IA7WUjD64w3vA5nuA7L6lYITB1GtSxN+WUNpXrsm
         NP+StMrxKSN72zCkOKSkyz3gPL60xUJg1RKG1xf/Pq5Oh44b5XKdMMiu8ksDjScBUxBA
         ab+VKNh4x83EK7921Nmgon69mFYnmzACSHE2aeaGzjpHcewc0WDUb/03fjrGXMUgJzDv
         gSonFBwMgjj55iG0gmtHBXizJJosPqze2x+TCRcCtkIUmxxTQar4DR5zC41zvWjt6y4j
         8bBQ==
X-Gm-Message-State: AOAM531Lrt+vn2VpqlDI03evSblmw/ypLPVGTlLV5g7mpf5NtBfGBf/5
        hUWo8JJT1akDs28cJuI/Aw==
X-Google-Smtp-Source: ABdhPJy39IzTna8jPg2pqRO6jCjYdkoweHSDDyHg9mHz2ShVWHZRTv0XHk5Mnj1YeSPt0pgM8FWR8A==
X-Received: by 2002:a6b:3e8b:: with SMTP id l133mr16345712ioa.137.1627339537187;
        Mon, 26 Jul 2021 15:45:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z13sm767248iop.18.2021.07.26.15.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:45:36 -0700 (PDT)
Received: (nullmailer pid 1014418 invoked by uid 1000);
        Mon, 26 Jul 2021 22:45:34 -0000
Date:   Mon, 26 Jul 2021 16:45:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC v3] dt-binding: media: document ON Semi AR0521 sensor
 bindings
Message-ID: <20210726224534.GB1009398@robh.at.kernel.org>
References: <m37dhkdrat.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m37dhkdrat.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 21, 2021 at 10:06:34AM +0200, Krzysztof Hałasa wrote:
> This file documents DT bindings for the AR0521 camera sensor driver.
> 
> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> ---
> Changes from v2:
> - changed "xclk" to "extclk"
> - power regulator names etc.
> - video output port properties
> - cosmetics
> - UTF-8 experiments :-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
> new file mode 100644
> index 000000000000..785bae61bb5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/onnn,ar0521.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor AR0521 MIPI CSI-2 sensor
> +
> +maintainers:
> +  - Krzysztof Hałasa <khalasa@piap.pl>
> +
> +description: |-
> +  The AR0521 is a raw CMOS image sensor with MIPI CSI-2 and
> +  I2C-compatible control interface.
> +
> +properties:
> +  compatible:
> +    const: onnn,ar0521
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: extclk
> +
> +  vaa-supply:
> +    description:
> +      Definition of the regulator used as analog (2.7 V) voltage supply.
> +
> +  vdd-supply:
> +    description:
> +      Definition of the regulator used as digital core (1.2 V) voltage supply.
> +
> +  vdd_io-supply:
> +    description:
> +      Definition of the regulator used as digital I/O (1.8 V) voltage supply.
> +
> +  reset-gpios:
> +    description: reset GPIO, usually active low
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port

$ref: /schemas/graph.yaml#/$defs/port-base
unevaluatedProperties: false


> +    description: |
> +      Video output port.
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#

           unevaluatedProperties: false

> +
> +        properties:
> +          data-lanes:
> +            anyOf:
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
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - vaa-supply
> +  - vdd-supply
> +  - vdd_io-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +
> +    i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ar0521: camera-sensor@36 {
> +                    compatible = "onnn,ar0521";
> +                    reg = <0x36>;
> +                    pinctrl-names = "default";
> +                    pinctrl-0 = <&pinctrl_mipi_camera>;
> +                    clocks = <&clks IMX6QDL_CLK_CKO>;
> +                    clock-names = "extclk";
> +                    reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> +                    vaa-supply = <&reg_2p7v>;
> +                    vdd-supply = <&reg_1p2v>;
> +                    vdd_io-supply = <&reg_1p8v>;
> +
> +                    port {
> +                           mipi_camera_to_mipi_csi2: endpoint {
> +                                    remote-endpoint = <&mipi_csi2_in>;
> +                                    data-lanes = <1 2 3 4>;
> +                            };
> +                    };
> +            };
> +    };
> 
> -- 
> Krzysztof "Chris" Hałasa
> 
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
> 
