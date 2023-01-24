Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F088F679F98
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 18:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbjAXRF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 12:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233508AbjAXRFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 12:05:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D834DE16;
        Tue, 24 Jan 2023 09:05:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A4B89B8110F;
        Tue, 24 Jan 2023 17:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94CAC433D2;
        Tue, 24 Jan 2023 17:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674579859;
        bh=NH0vwjYHuVoJyfCc0IFYChVcGaOjWHhovN7LOhiKaOs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=J5qhTjd6C6ZhzhuJUw156CyxTcxk++1NMk+NpyhVk1zqJJN3LCcYRYDKCHQPfjTYD
         WzfaLX7zygQgXpcBs27FHcNIrozRf2wszdq+jEE/MWzkNAhpOJ0tqHf0n5VfDEwGWc
         Ss8bExmIufr2BdC506sMdodM/L+dUWRE78G+GcDXpLbpwtfdB2Rwi/63ibioWABvcp
         EO6tjSTiy2u6MpENRyZ2GvRSzr/DJoyu11NbOa3/HIijOtYExNppc0PQAYpjNcD5dq
         VjaxxwgRQwDpYo52G3PRb4YnqTq/QkCJmW1t/28PNGeBufZaOINGRwlRVtrhHP88QQ
         Js9S10UKRYq4Q==
Message-ID: <949e3330-8c3d-6106-fbf8-cab820801cfc@kernel.org>
Date:   Tue, 24 Jan 2023 18:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v1 1/2] dtbindings: media: i2c: Add IMX708 CMOS sensor
 binding
Content-Language: en-US
To:     Naushir Patuck <naush@raspberrypi.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20230124150546.12876-1-naush@raspberrypi.com>
 <20230124150546.12876-2-naush@raspberrypi.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230124150546.12876-2-naush@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/01/2023 16:05, Naushir Patuck wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> 
> Add YAML devicetree binding for IMX708 CMOS image sensor.
> Let's also add a MAINTAINERS entry for the binding and driver.
> 

1. Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

2/ Subject: drop second/last, redundant "binding". The "dt-bindings"
prefix is already stating that these are bindings.

> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> ---
>  .../devicetree/bindings/media/i2c/imx708.yaml | 119 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx708.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx708.yaml b/Documentation/devicetree/bindings/media/i2c/imx708.yaml
> new file mode 100644
> index 000000000000..db1331951fce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx708.yaml

This must match compatible - missing vendor prefix.

> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx708.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.3-Inch 12Mpixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +
> +description: |-
> +  The Sony IMX708 is a 1/2.3-inch CMOS active pixel digital image sensor
> +  with an active array size of 4608H x 2592V. It is programmable through
> +  I2C interface. The I2C address is fixed to 0x1A as per sensor data sheet.
> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> +  4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: sony,imx708
> +
> +  reg:
> +    description: I2C device address

Drop description.

> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  VDIG-supply:

lowercase, also in other places

> +    description:
> +      Digital I/O voltage supply, 1.1 volts
> +
> +  VANA1-supply:
> +    description:
> +      Analog1 voltage supply, 2.8 volts
> +
> +  VANA2-supply:
> +    description:
> +      Analog2 voltage supply, 1.8 volts
> +
> +  VDDL-supply:
> +    description:
> +      Digital core voltage supply, 1.8 volts
> +
> +  reset-gpios:

maxItems: 1

> +    description: |-
> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released (set high) after all supplies and INCK are applied.
> +
> +  # See ../video-interfaces.txt for more details

I don't think we have this file.

> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:

Take a look at new bindings and use them as example. This is all done
differently.

> +          data-lanes:
> +            description: |-
> +              The sensor supports either two-lane, or four-lane operation.
> +              For two-lane operation the property must be set to <1 2>.
> +            items:
> +              - const: 1
> +              - const: 2
> +
> +          clock-noncontinuous:
> +            type: boolean
> +            description: |-
> +              MIPI CSI-2 clock is non-continuous if this property is present,
> +              otherwise it's continuous.
> +
> +          link-frequencies:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint64-array
> +            description:
> +              Allowed data bus frequencies.
> +
> +        required:
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - VANA1-supply
> +  - VANA2-supply
> +  - VDIG-supply
> +  - VDDL-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {

Drop 0

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        imx708: sensor@1a {
> +            compatible = "sony,imx708";
> +            reg = <0x1a>;
> +            clocks = <&imx708_clk>;
> +            VANA1-supply = <&imx708_vana1>; /* 1.8v */
> +            VANA2-supply = <&imx708_vana2>; /* 2.8v */
> +            VDIG-supply = <&imx708_vdig>;   /* 1.1v */
> +            VDDL-supply = <&imx708_vddl>;   /* 1.8v */
> +
> +            port {
> +                imx708_0: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    data-lanes = <1 2>;
> +                    clock-noncontinuous;
> +                    link-frequencies = /bits/ 64 <450000000>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f1c9aa89f6a4..7edeed53de4e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19503,6 +19503,13 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
>  F:	drivers/media/i2c/imx412.c
>  
> +M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/imx708.yaml
> +F:	drivers/media/i2c/imx708.c

There is no such file.


Best regards,
Krzysztof

