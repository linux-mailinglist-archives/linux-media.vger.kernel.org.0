Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABFFB60F404
	for <lists+linux-media@lfdr.de>; Thu, 27 Oct 2022 11:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234925AbiJ0JuA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Oct 2022 05:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234899AbiJ0Jt5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Oct 2022 05:49:57 -0400
X-Greylist: delayed 157017 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 27 Oct 2022 02:49:52 PDT
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6134B5208F;
        Thu, 27 Oct 2022 02:49:49 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 195371B00153;
        Thu, 27 Oct 2022 12:49:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1666864185;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oe19P2pge1+6I2ZQth02uTIY7mNqLWTuzm0ue/4WyY0=;
        b=T+IDNL9nNesaeEsYpjbxca83VB9rkbj8n9AosXnSrBcKpkhfmd5RmcFYdn25j38ld4URGv
        BaGUTIi3wb24TAnD2IjPsi8px+ZBR8m907QYmiJQQ9rNuHMlNiyRikDONDHF2nZzN8hKwP
        JK3DpA4bLKkHMKUY+TpULnMsPtxR1EIKXC39ClWjhy/4qHVOzLfRQvfmiDre1oJj2Dhtw+
        upvNQVpE0e6ifAyBf1Pm2HN1yQwKGsnaIgeRwuysl7N2g0frFU8yTKVkfRqeeyS4B1Dhw6
        u24RwFNnzb7ZU6x7NA1SUSxE6uC7vSS0m+HhJdZcf5Hol/syhCDDs0w3oUQEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1666864185;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oe19P2pge1+6I2ZQth02uTIY7mNqLWTuzm0ue/4WyY0=;
        b=OTGHq8kxqexA8eJCBv6skHJc4h2y23QQRCoOMy3BCtsx1wwCevfCEDGxUEppja9mITR1Nl
        veUMk9emfchAzujFZwWhFkgjPkXbSwJfIldikgBkNobjDHTZQWrg5cwHXO5Q1mcFTC04Lo
        vjk+/Fovq6OkOEHFsQeyAW9+r+b+Z7W31WjLHghc8dLHBwa6//qSVquUgBmsAkzc0mP/Tr
        Ogak04fde2I2RsQzqeU6/gNHyUQjJvYP/JgINi/6FtVxmg9UyTEmhUlgZoCZ6D7DyUozbJ
        0RTV1Dnu6qGlBqn9fYi/uvfIgNXtSN/ECqpehHasvSzWYlfgB7JVtRCxU331kg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1666864185; a=rsa-sha256;
        cv=none;
        b=vMW2+fSRVDyLX6YRg3vSK+UMKzShcPn8RRlQqXITifIZuFhm2h8hc/C6UaDcL8phfIjizw
        iPA+Da7mReJC5kOAHWLLWiPWwJbbQR3U/vteY9Fok/Mfhjz+lMwZhs8i3Opi3qKqBBdPJW
        ilWzGjx2akbXY9ieqxrIJUeK6ZLSTkFlgKKOlXQ67rXjMLEkHPskwL7EeOZaxQM9DooQnf
        biyeTj1peg9tAnf+6815JHs1BRAlTca/s916f63oCscHdO3WHBRqDN1MaAuw7xgrODQSPt
        Lzk6Ga9smPSurauFUc7mgO0iVooGUFLMJMwsozuCOFhWh6j9nezKrw4MiBff8Q==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AFC63634D3B;
        Thu, 27 Oct 2022 12:49:44 +0300 (EEST)
Date:   Thu, 27 Oct 2022 12:49:44 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Lee Jackson <info@arducam.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [RESEND PATCH 1/2] dt-bindings: media: i2c: Add IMX519 CMOS
 sensor binding
Message-ID: <Y1pUOB5EbCleGGYm@valkosipuli.retiisi.eu>
References: <20220927114442.000026f7@arducam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927114442.000026f7@arducam.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lee,

On Tue, Sep 27, 2022 at 11:44:42AM +0800, Lee Jackson wrote:
> Add YAML device tree binding for IMX519 CMOS image sensor, and
> the relevant MAINTAINERS entries.
> 
> Signed-off-by: Lee Jackson <info@arducam.com>

This should be your own e-mail address.

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

Please see my comments from 5th February.

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
> index a58f1fc6dd47..a2de51d71677 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19007,6 +19007,14 @@ T:	git git://linuxtv.org/media_tree.git
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
Regards,

Sakari Ailus
