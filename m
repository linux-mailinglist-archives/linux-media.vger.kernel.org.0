Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 907616D2929
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 22:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbjCaUJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 16:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbjCaUJo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 16:09:44 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC2222218
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 13:09:41 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x17so30416612lfu.5
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680293379;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xw1N8c4NwTk3qWvVTPNQOhGdEVWqHVyp5Ieb2s7Nvq4=;
        b=w/7NOVgTcl9X9jBc2UOGQaQRJ9osCEI9IGgP/jcTr0DoRie/kKsR/Ck8H5W8on02+3
         YalQVrSdXbWyReX8wqMByleypEO9uuCFBpj/75cJO8GW7f4Ih8aqzeTyyE/8ZNl6oQRj
         cB8WovAhdLXFtITD7oZyHq+goJWAT6vFlXtqmtEHMUXLtsGNk5IIUL8u0VX66Rf2vMrE
         C6lWRAfBvszRuila67dLFSKHnbIc0NCv8ozDcYXQP678STS4oDwoL8zhivdljT4RQGkL
         nXPDDon0wTDqHumCcjnwRoEGbmYItGrGBd8UuEY4lKmihzQ3NEmjuhiEc0Cmd+3ThmJ/
         AzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680293379;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xw1N8c4NwTk3qWvVTPNQOhGdEVWqHVyp5Ieb2s7Nvq4=;
        b=lRz8o11/VF1ExYDXkDTJY9redv7tK6hTWSYRat5AdFmog5z48kcwq9bwRfzuxxX0D0
         v0qI70QLWYdIuzIszHIDrmwB43hi9jBy+vDziRDEncZR2Y7YDVTeWI8UTtyir7HOahNN
         PyYAdrSp0aj7157Swke2/lKhacB2xzZtDCW6EZmslFJp783+iWgMJeAGDDwkG1fjB86u
         JGXGXP1uRGkTvXpNOJOdJL5P/zZKxJxb8esb654TpD2Sow9V8GFaGuIMc6vr9/prnUzn
         FhymiH/NuugRzh8QlEvMbZ5LnxE23y+VOkv18RT+kP9EPNgagSd2ZK+myVG9rGcBgJzG
         OFSA==
X-Gm-Message-State: AAQBX9fwNh9oZ2SFsA4tL3lmpv1DoeDIgo9jkBLdtSl+d7Uf/aCsNMC/
        b0bjXXDFlAB9EY2DESAdzdUiepZwmixmxNPjGLw=
X-Google-Smtp-Source: AKy350bylfF6KhOVFpj5VtEzS0A2hRudKCGcRrM6eTpMIQbSHzLZ0ojtju+5tmOdPRFro4hPdY7bYQ==
X-Received: by 2002:a19:ac09:0:b0:4dd:a025:d8e with SMTP id g9-20020a19ac09000000b004dda0250d8emr7668551lfc.47.1680293379631;
        Fri, 31 Mar 2023 13:09:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c25-20020ac244b9000000b004e9c983a007sm502364lfm.289.2023.03.31.13.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 13:09:39 -0700 (PDT)
Message-ID: <91874e63-553f-ced5-ce32-309ac2ebf6e5@linaro.org>
Date:   Fri, 31 Mar 2023 22:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/9] media: dt-bindings: Add bindings for JH7110 Camera
 Subsystem
Content-Language: en-US
To:     Jack Zhu <jack.zhu@starfivetech.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, changhuang.liang@starfivetech.com
References: <20230331121826.96973-1-jack.zhu@starfivetech.com>
 <20230331121826.96973-2-jack.zhu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331121826.96973-2-jack.zhu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/03/2023 14:18, Jack Zhu wrote:
> Add the bindings documentation for Starfive JH7110 Camera Subsystem
> which is used for handing image sensor data.
> 
> Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
> ---
>  .../bindings/media/starfive,jh7110-camss.yaml | 159 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> new file mode 100644
> index 000000000000..0235c70e7793
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/starfive,jh7110-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Starfive SoC CAMSS ISP
> +
> +maintainers:
> +  - Jack Zhu <jack.zhu@starfivetech.com>
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description:
> +  The Starfive CAMSS ISP is a Camera interface for Starfive JH7110 SoC. It
> +  consists of a VIN controller (Video In Controller, a top-level control until)
> +  and an ISP.
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-camss
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: syscon
> +      - const: isp
> +
> +  clocks:
> +    maxItems: 7
> +
> +  clock-names:
> +    items:
> +      - const: apb_func
> +      - const: wrapper_clk_c
> +      - const: dvp_inv
> +      - const: axiwr
> +      - const: mipi_rx0_pxl
> +      - const: ispcore_2x
> +      - const: isp_axi
> +
> +  resets:
> +    maxItems: 6
> +
> +  reset-names:
> +    items:
> +      - const: wrapper_p
> +      - const: wrapper_c
> +      - const: axird
> +      - const: axiwr
> +      - const: isp_top_n
> +      - const: isp_top_axi
> +
> +  power-domains:
> +    items:
> +      - description: JH7110 ISP Power Domain Switch Controller.
> +
> +  interrupts:
> +    maxItems: 4
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving DVP data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#

I don't think we use video-interfaces with port. Are you sure this works
fine? Please extend the example with appropriate properties to check...

> +            unevaluatedProperties: false
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false

Same concerns here.


Best regards,
Krzysztof

