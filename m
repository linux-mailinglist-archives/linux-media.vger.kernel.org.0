Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAAFB716814
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 17:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232558AbjE3PxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 11:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjE3Pwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 11:52:45 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBB3138
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 08:52:21 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2afb2875491so49084921fa.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 08:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685461940; x=1688053940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m3BEM4DE2whDaKsK2b4e2S82huXQzuKkLnB2QThhDvY=;
        b=kriCrcaKTSgb9k9AOnhy6/Sn2dVw2dNCpmaelNW93TqOaaj7IgnZ/Jh4hIpdAjgmsy
         vbnUSBbVxwRDQQ7HVBT2MN9v6fUEaAmrYAfdZeJnBupWcEx4SMpd4dq9VaslH2LloLsX
         lRxkxipGm6pt4Dkw2VQem5zeX7mM4JJ+40emf/k8l/brwEIBuBpV7CcGLthVlWt1rh7n
         qDgACMvPQXLMdZZDVuIoMGp3adm+9ESyIc7rJQigmbnt1ef8RugiiqljUrclcuzM7cN4
         X+v/U84Yah26QsOtzmmNTZwP+ENOBRxqj+nIVk1QypM1DsPl6jDaRq5HjHcKsv1tXHE1
         YICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685461940; x=1688053940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3BEM4DE2whDaKsK2b4e2S82huXQzuKkLnB2QThhDvY=;
        b=ckDNnqQY0wUndCvgqJf5EOkg3dXilqN1yHwg8PRD4p0gNVm4yzEYDeNl28hdov6+Wu
         SmQdCvnxMheV2mH+dYEr6oMBNbaXmYMraVx5Y8e9zmdLAwM0ya9VUszKYWaEGQ3LgdHy
         qxg8sXciIGwzpgqMvoinlzQgE3GuBSs3Hw11IaeBllKipDbg6QEs3F/o3OyDC2ApeadO
         xlNFRn4axccqKyXBHEaQllN9crPgoEck+2V8VxqoD5PWgn3qjynakNN3+VoeS5S+kkm+
         T+0m9RC/ECdDpW46AUvajOORQQyDXerR/TIlp+O/L7bpgfTcOkfCgsY7OwjJaBwy4Ur9
         ahWQ==
X-Gm-Message-State: AC+VfDxKXs9oOTXBAa6JCCw64J1gix4KuBZ/rbEYnO3rJFm762BWYEdq
        KFxQzDIblD7kmixqVVGnT2u4Iw==
X-Google-Smtp-Source: ACHHUZ4IeZnO0GH7AXNm05FMmW11tQecmtsWssrBTV6BksXfeashkRhVdYWYelM94CKRid+mzwaviw==
X-Received: by 2002:a2e:9d17:0:b0:2ae:f706:3d17 with SMTP id t23-20020a2e9d17000000b002aef7063d17mr998481lji.8.1685461940142;
        Tue, 30 May 2023 08:52:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090603c700b0096a68648329sm7480353eja.214.2023.05.30.08.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 08:52:19 -0700 (PDT)
Message-ID: <8835e826-2ef8-bc52-3248-bd347ba7e8c1@linaro.org>
Date:   Tue, 30 May 2023 17:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] media: dt-bindings: alvium: add document YAML binding
Content-Language: en-US
To:     Tommaso Merciai <tomm.merciai@gmail.com>
Cc:     jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        martin.hecht@avnet.eu, linuxfancy@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Gerald Loacker <gerald.loacker@wolfvision.net>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Nicholas Roth <nicholas@rothemail.net>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230526103427.774226-1-tomm.merciai@gmail.com>
 <20230526103427.774226-2-tomm.merciai@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230526103427.774226-2-tomm.merciai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/05/2023 12:34, Tommaso Merciai wrote:
> Add documentation of device tree in YAML schema for the ALVIUM
> Camera from Allied Vision Inc.
> 

Thank you for your patch. There is something to discuss/improve.


> References:
>  - https://www.alliedvision.com/en/products/embedded-vision-solutions
> 
> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> ---
>  .../media/i2c/alliedvision,alvium.yaml        | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/alliedvision,alvium.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium.yaml b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium.yaml
> new file mode 100644
> index 000000000000..5385fe849ffd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license please.

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/alliedvision,alvium.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Alliedvision Alvium Camera
> +
> +maintainers:
> +  - Tommaso Merciai <tomm.merciai@gmail.com>
> +  - Martin Hecht <martin.hecht@avnet.eu>
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: alliedvision,alvium

Missing vendor prefix in vendor-prefixes.yaml

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: XCLK Input Clock

maxItems: 1

> +
> +  clock-names:
> +    const: xclk

Drop names, useless for one entry with generic name.

> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: >
> +      Reference to the GPIO connected to the powerdown pin, if any.

Drop description, it's obvious.

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: >
> +      Reference to the GPIO connected to the reset pin, if any.

Drop description, it's obvious.


> +
> +  streamon-delay:
> +    maxItems: 1
> +    description: >
> +      Delay before camera start capturing frames in us.

Missing vendor prefix (unless it is a common property), missing units
suffix in property name (-us). It's not a list. Why this should be a
hardware property?

> +
> +  rotation:
> +    enum:
> +      - 0
> +      - 180
> +
> +  port:
> +    description: Digital Output Port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          clock-lanes:
> +            const: 0

Blank line

> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4

Four items and each 1 or 4? so <4>, <1>, and what else? Please provide
example for this.

> +            items:
> +              enum: [1, 4]
> +          link-frequencies: true

Drop this one, should not be needed.

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/clock/imx6qdl-clock.h>
> +      #include <dt-bindings/gpio/gpio.h>

Use 4 spaces for example indentation. Not 6.

> +
> +      i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          camera: alvium@3c {

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +              compatible = "alliedvision,alvium";
> +              reg = <0x3c>;
> +              pinctrl-names = "default";
> +              pinctrl-0 = <&pinctrl_csi0_pwn>, <&pinctrl_csi0_rst>, <&pinctrl_csi_mclk>;
> +              clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
> +              clock-names = "xclk";
> +              assigned-clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
> +              assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
> +              assigned-clock-rates = <24000000>;
> +              streamon-delay = <20>;
> +              powerdown-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +              reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> +              status = "okay";

Drop status

> +
> +              port {
> +                  alvium_out: endpoint {
> +                      remote-endpoint = <&mipi_csi_0_in>;
> +                      data-lanes = <1 2 3 4>;

OK, here is the example. You did not test it.



Best regards,
Krzysztof

