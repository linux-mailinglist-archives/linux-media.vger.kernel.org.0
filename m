Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE684D49B7
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 15:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240776AbiCJOeo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 09:34:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344043AbiCJObi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 09:31:38 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73A5EBBAE
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 06:29:28 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 79FED3F32D
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 14:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646922566;
        bh=hwp6Ky+UBrJRSHg4i+lJTamBUoAq8Hop7/mY//2Mbe4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=hRwicyvT5HiX87qz1Y/DQdi37MLOzYQL538Fu5lBLW/9J9Snc4p8IitO2eZGLHT4B
         yb6JiM/idn5beIKQMv6q7vFU+I1m3Qu86osXElfSxneetrnPuf/QJkUdGrYPQNYBHj
         cpqQy0xdK68bhJxqO/fTV8NumgAfi4yRscLdJvpNaja+Lqje85Fyq4FAjSwW2ZKDpq
         O0uR4lXIDP190/YRw6IrDQrsLsK5kkknVXbe0fkz1k/8sg7x2CJTiRKOZ7MEtUX2EG
         l6K11v35u/94ypCjEsak8PLdl2AVcTkV8YN2rT7x4eubVPEXcRQ5DCimzu5h/OxXRt
         ZB8VgnQxSzCNg==
Received: by mail-ej1-f71.google.com with SMTP id x2-20020a1709065ac200b006d9b316257fso3208390ejs.12
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 06:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hwp6Ky+UBrJRSHg4i+lJTamBUoAq8Hop7/mY//2Mbe4=;
        b=ndRIV+90CCmxnnyNeWpKJDICpFPcRI1nhgQD4UtII7HmV+NObdo7gKyGlDSr7Sp/QY
         TPdPRQNBjjvvVsTfERYzUg9qZo1XvV7MC1z5n246HKvobxl54T9rUCEwZnFNpjZw9fXx
         oX8YxheurV6/7HY0qKpN8ptLX2pAokgqfNhD8Z5oahxhOn6HkjDZtRcXZ/YyhhPlny+A
         yPjiLMleprd7NIRM5z/DMXUI7mZoJDYfEauXUlHpFDs6xU1bV3CQjWSNJfG4HpidT3zf
         lDMSpsezdhL90nHEE1v8Pt2tQ4a4PQ4CiTEZ5qzGrCI511mJAuQCSMOM9lUIWxaZGhJa
         8g/A==
X-Gm-Message-State: AOAM532TV3SIKjotj6T9mM0xqhkKGMBnhy+ez38WLbz2Vgpri4l/jUiT
        toO2c6Nke/nr8wbrscJ4BjajY1oeA7JH8zIMk/Qb80MzkRNghKxik9Xf0A0k5vQPXq8r4p4R51S
        hSn3Mw6YEgry79NF/hzLBdye6mLvJSRC01kxGJPLR
X-Received: by 2002:a17:906:7245:b0:6cf:d3c6:8c63 with SMTP id n5-20020a170906724500b006cfd3c68c63mr4260039ejk.677.1646922566026;
        Thu, 10 Mar 2022 06:29:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7Ev2mnxBZlEpVqVQMpzsj789u82+ktkRTOCKPlAE6anRMFsefp2hW8KFgtmBRXCA/ThaKOw==
X-Received: by 2002:a17:906:7245:b0:6cf:d3c6:8c63 with SMTP id n5-20020a170906724500b006cfd3c68c63mr4260010ejk.677.1646922565787;
        Thu, 10 Mar 2022 06:29:25 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id z8-20020a170906270800b006bbd3efa6b8sm1862913ejc.80.2022.03.10.06.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 06:29:25 -0800 (PST)
Message-ID: <d7e2a189-2773-b37a-7449-0b5138e45ded@canonical.com>
Date:   Thu, 10 Mar 2022 15:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] media: dt-bindings: i2c: Document ov5670
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-2-jacopo@jmondi.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220310130829.96001-2-jacopo@jmondi.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/03/2022 14:08, Jacopo Mondi wrote:
> Provide the bindings documentation for Omnivision OV5670 image sensor.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/ov5670.yaml | 93 +++++++++++++++++++

Add the file to maintainers entry.

>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5670.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml
> new file mode 100644
> index 000000000000..dc4a3297bf6f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5670.yaml

Missing vendor prefix in file name.

> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ov5670.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV5670 5 Megapixels raw image sensor
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo@jmondi.org>

Please add also driver maintainer.

> +
> +description: |-
> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
> +  controlled through an I2C compatible control bus.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov5670
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description: Frequency of the xclk clock.

Is the xclk external clock coming to the sensor? If yes, there should be
a "clocks" property.

> +
> +  pwdn-gpios:
> +    description: Reference to the GPIO connected to the PWDNB pin. Active low.

maxItems

> +
> +  reset-gpios:
> +    description:
> +      Reference to the GPIO connected to the XSHUTDOWN pin. Active low.

maxItems

> +
> +  avdd-supply:
> +    description: Analog circuit power. Typically 2.8V.
> +
> +  dvdd-supply:
> +    description: Digital circuit power. Typically 1.2V.
> +
> +  dovdd-supply:
> +    description: Digital I/O circuit power. Typically 2.8V or 1.8V.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            description: The sensor supports 1 or 2 data lanes operations.
> +            minItems: 1
> +            maxItems: 2
> +            items:
> +              maximum: 2

Is '0' also allowed? If not then maybe 'enum: [ 1, 2 ]'

no clock-lanes?

> +
> +          clock-noncontinuous: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clock-frequency
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
> +        ov5670: sensor@36 {
> +            compatible = "ovti,ov5670";
> +            reg = <0x36>;
> +
> +            clock-frequency=<19200000>;

Missing spaces around '='.



Best regards,
Krzysztof
