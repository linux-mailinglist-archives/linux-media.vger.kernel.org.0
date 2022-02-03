Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5284A9066
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 23:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355644AbiBCWCF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Feb 2022 17:02:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiBCWCE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Feb 2022 17:02:04 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5416CC061714
        for <linux-media@vger.kernel.org>; Thu,  3 Feb 2022 14:02:04 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 14C0D20151;
        Fri,  4 Feb 2022 00:02:00 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1643925720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bzVyjkFvE6/9m6bk6bTw4QL+j9Zvxo5qLtPkv/HAMIs=;
        b=fNSR2E1ggbYlJN5AOZvG16fItfB/0DoILaWM6WKj+SZka/G1U/1KPgk9sdQrkNLCiVmMhL
        R3DRMzgaooT16YEMKP0fH+HQANdI/E7KlRL6D1yyROwafqI2mTNmk1iuxk4xrMsiGwLHRc
        rslX96lPXFK9QbQpmcBpfO/2cGMUcJQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 999AA634C90;
        Fri,  4 Feb 2022 00:01:59 +0200 (EET)
Date:   Fri, 4 Feb 2022 00:01:59 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Arducam info <info@arducam.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Message-ID: <YfxQ18Yb8e62YOAF@valkosipuli.retiisi.eu>
References: <38FCC5C9-9D03-4C8B-9ADF-896AE2BD90DE@arducam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38FCC5C9-9D03-4C8B-9ADF-896AE2BD90DE@arducam.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1643925720; a=rsa-sha256; cv=none;
        b=CxE7Q3r0NoKAcWJ9k2/CJNWx3X0PksCv9AiN870Khp7UqUEaz3UhpE+Nuvx6Tm8LzM9/+F
        ALNwZpPCVA9kH3JIXKF51i5DKIjL1Pg1tjkzZkRr0JhuakaCOGk/Fsi9MHhNPNaOvisLCn
        9swb0zVeVcPW69T8u5molVDSiGfz8TA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1643925720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bzVyjkFvE6/9m6bk6bTw4QL+j9Zvxo5qLtPkv/HAMIs=;
        b=jyEjtELeG80mVdAkvgSFQld5jq/ykKOeDnEOAjwbmHB0EQNu+81iiyYP/XAz0CyuEFIlp5
        KbiXn02xmS2E8Cjmfm5r/BzcEUFpqWIt55hb9p+ScEmTdiRh7qn72jJjYP74p8DFeNX/S5
        7zcp8yeUZ02Dfgu9E7xsez6MHJSjvow=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lee,

Thanks for the patches. Please see my comments below.

On Tue, Nov 02, 2021 at 04:19:12PM +0800, Arducam info wrote:
> Add YAML device tree binding for IMX519 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Lee Jackson <info@arducam.com>

Is this your real e-mail address?

The From: header and the Signed-off-by: tags should match.

Please also cc v2 to Rob Herring and the devicetree list.

> ---
>  .../devicetree/bindings/media/i2c/imx519.yaml | 113 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx519.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx519.yaml b/Documentation/devicetree/bindings/media/i2c/imx519.yaml
> new file mode 100644
> index 000000000000..717230a21764
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx519.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx519.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony 1/2.5-Inch 16Mpixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Lee Jackson <info@arducam.com>
> +
> +description: |-
> +  The Sony IMX519 is a 1/2.5-inch CMOS active pixel digital image sensor
> +  with an active array size of 4656H x 3496V. It is programmable through
> +  I2C interface. The I2C address is fixed to 0x1A as per sensor data sheet.
> +  Image data is sent through MIPI CSI-2, which is configured as either 2 or
> +  4 data lanes.
> +
> +properties:
> +  compatible:
> +    const: sony,imx519
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  VDIG-supply:
> +    description:
> +      Digital I/O voltage supply, 1.05 volts
> +
> +  VANA-supply:
> +    description:
> +      Analog voltage supply, 2.8 volts
> +
> +  VDDL-supply:
> +    description:
> +      Digital core voltage supply, 1.8 volts
> +
> +  reset-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the xclr pin, if any.
> +      Must be released (set high) after all supplies and INCK are applied.
> +
> +  # See ../video-interfaces.txt for more details

Please refer to video-interfaces.yaml schema instead. See e.g.
Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml .

> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          data-lanes:
> +            description: |-
> +              The sensor supports either two-lane, or four-lane operation.
> +              For two-lane operation the property must be set to <1 2>.
> +            items:
> +              - const: 1
> +              - const: 2

Four lanes are also supported. You could simply use minItems and maxItems
here, as other bindings do.		

> +
> +          clock-noncontinuous:
> +            type: boolean
> +            description: |-
> +              MIPI CSI-2 clock is non-continuous if this property is present,
> +              otherwise it's continuous.

No need for a description, this is in schema. The same for other
properties, too, if there isn't something device specific to say.

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
> +  - VANA-supply
> +  - VDIG-supply
> +  - VDDL-supply
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
> +        imx519: sensor@1a {
> +            compatible = "sony,imx519";
> +            reg = <0x1a>;
> +            clocks = <&imx519_clk>;
> +            VANA-supply = <&imx519_vana>;   /* 2.8v */
> +            VDIG-supply = <&imx519_vdig>;   /* 1.05v */
> +            VDDL-supply = <&imx519_vddl>;   /* 1.8v */
> +
> +            port {
> +                imx519_0: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    data-lanes = <1 2>;
> +                    clock-noncontinuous;
> +                    link-frequencies = /bits/ 64 <493500000>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ee91c5472bc1..5db23bde7e73 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17492,6 +17492,14 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
>  F:	drivers/media/i2c/imx412.c
>  
> +SONY IMX519 SENSOR DRIVER
> +M:	Arducam Kernel Maintenance <info@arducam.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/imx519.yaml
> +F:	drivers/media/i2c/imx519.c
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>

-- 
Kind regards,

Sakari Ailus
