Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD9D757136E
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 09:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbiGLHtw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 03:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbiGLHtv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 03:49:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113369CE03
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 00:49:49 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id o7so12547896lfq.9
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2nzDFbOQzhmz/22ypvi14S91HEzakYKEGdQDyNBSOY0=;
        b=K30R07foS4PkukDYXfgfRdxcfQzZ64mmEDIA6OE83yNtpTLbK8Udhtk0b3VVYLuZS9
         UiQkWpBULMSMpVR31zKATQCzrGu88YL3TrLc0mJcR+PbGfuZfeTHHs4QDC/QE637RGGt
         WraEEELQODV/pnxsZnEYkD6IDistT9vRbgCdT8KvmfKAvsFqaZKYTZbupKb1Sp8zi5Sl
         tRGbeYB0wb6WXZM6KBBFchFAfPNFB3hRgw6Ron2oAOBCfv/nbI2+tj6mnPq2FW9pdRE0
         QQqe1L/r+Nc0dKqFilENciRUBIUElXWR8YvBqFmcuGv3SAo6cSnOC0HHw7jVjmscOWpg
         arTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2nzDFbOQzhmz/22ypvi14S91HEzakYKEGdQDyNBSOY0=;
        b=hplgtnLSOOlUzJN2MVmeA+CSnldq53fgMgrsYhimNdNrxfdGKUsJLAFGmKbPJV6JzT
         vTSrU5C/7KlIxbuu+Dy0xPS2kQECEG5UPLP/5Sf1j3+Vyrc1KbFkF0WY1JVJck3qsOdB
         uZCUyeipIIqhh9Py5quNtMpeDE/NOQPLkNLrKvzg9XcHaQxezGZjHfyyFBfXYFPJOSpb
         QyncldHxYowsJIHVJkxAwutzIFO2jLQPylj+8Lh+WUsc9TV7vYv8vC492iOw18sfowMs
         SGTg/2pOgAIpmAd2EPIq7loToJeLFMcurxtXgFNsLP+X9rvoYDcAa3M4C9q4x/Hy08Xt
         sdrA==
X-Gm-Message-State: AJIora9geQkFWRHsW/KvL74GYF1wmoDfXAFO7itwcsiXgB/U5sKkjbO6
        +W7kAa5yxGkgy9X/VcMqCda+7N+o8tjB+0OP
X-Google-Smtp-Source: AGRyM1s7uIrC/au+kDw8CXEA5rnjdHYxZZLGJ3RZwoUeDyjJUKUk9riccSMB5BuxMqz1v2e3X9Qz9A==
X-Received: by 2002:a05:6512:2306:b0:485:8e08:5740 with SMTP id o6-20020a056512230600b004858e085740mr14669012lfu.354.1657612187373;
        Tue, 12 Jul 2022 00:49:47 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id j6-20020a2e3c06000000b0025d5b505df1sm2268080lja.136.2022.07.12.00.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 00:49:46 -0700 (PDT)
Message-ID: <d8b124f4-9ed7-7cc1-a978-60997696646f@linaro.org>
Date:   Tue, 12 Jul 2022 09:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/7] dt-bindings: media: Add i.MX8 ISI DT bindings
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
 <20220712000251.13607-7-laurent.pinchart@ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712000251.13607-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/07/2022 02:02, Laurent Pinchart wrote:
> The Image Sensing Interface (ISI) combines image processing pipelines
> with DMA engines to process and capture frames originating from a
> variety of sources. The inputs to the ISI go through Pixel Link
> interfaces, and their number and nature is SoC-dependent. They cover
> both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Fix compatible string checks in conditional schema
> - Fix interrupts property handling
> ---
>  .../bindings/media/nxp,imx8-isi.yaml          | 148 ++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> new file mode 100644
> index 000000000000..390dfa03026b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -0,0 +1,148 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx8-isi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX8 Image Sensing Interface
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  The Image Sensing Interface (ISI) combines image processing pipelines with
> +  DMA engines to process and capture frames originating from a variety of
> +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mn-isi
> +      - fsl,imx8mp-isi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The AXI clock
> +      - description: The APB clock
> +      # TODO: Check if the per-channel ipg_proc_clk clocks need to be specified
> +      # as well, in case some SoCs have the ability to control them separately.
> +      # This may be the case of the i.MX8[DQ]X(P)
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: apb
> +
> +  fsl,blk-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle referencing the block control that contains the CSIS to ISI
> +      gasket.
> +
> +  interrupts: true

Need generic constraints - min/maxItems.

> +
> +  power-domains: true

Ditto.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Ports represent the Pixel Link inputs to the ISI. Their number and
> +      assignment are model-dependent. Each port shall have a single endpoint.
> +
> +    patternProperties:
> +      "^port@[0-9]$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +
> +    unevaluatedProperties: false

At least one port is always required?


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - fsl,blk-ctrl
> +  - ports
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mn-isi
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        ports:
> +          properties:
> +            port@0:
> +              description: MIPI CSI-2 RX
> +          required:
> +            - port@0
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mp-isi
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 2

You need to describe the items.


Best regards,
Krzysztof
