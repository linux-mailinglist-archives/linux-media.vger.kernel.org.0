Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8E6571A73
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 14:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbiGLMtN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 08:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233268AbiGLMtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 08:49:12 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD98A33A04
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 05:49:10 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a9so13733976lfk.11
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 05:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qrqtlheWpIuiLv0pU8Fpifgo1zn85e8H4UeJO5Ls16I=;
        b=FsHjn5jCWzYtIPEb1roZuo0d61/+hwQ3DFDw/MZyL6os5i/FL7GpyBo34CaLOoXf0J
         Ec5Dc59BBL5nCM9THF6ZYf+Y65wBWMPyF81nXvqevjBY8Qzv+iwCbBPaAzwBlzmUoSNJ
         qjXh5gwTzi5izYe7QeQ0HGoPcwZiDIX1PrpNt6CXJ+w00UJkOyu1NO89LyCh02uArby+
         a88wcG0yFTg0CFJWKSHa4MYGCGuGTyj0YKGcHV6CCEnxL6UnjW+isOK6Yz8bVPwawPzR
         n7wRlSappDHSaPdIc1aj+sGC9UTOvU/XAwN0JU+RN9/f1j9cKyhyPhb/PlrHc+5zqGfc
         lTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qrqtlheWpIuiLv0pU8Fpifgo1zn85e8H4UeJO5Ls16I=;
        b=nhCJ/XYyaJODoFWUMKT6DEFdm/Ko1RdWESyt4IQmWF3+1Y4H2mitnX40Hg0+NIUrgq
         BmUKeXCn5ycXTnQK4ivv9HmpkGQUH9yPX3IAhjilmf+EwYENpct50+XfKcpiAtd3F1PY
         x2ffLVdsOdzNQtLdXHkhHSkZzHlGGoxdUNdXqpvbbh483PJkFGf67AS4QbBedutwCe6a
         W9Cg2jDBVNCuhS0Zvn4GPkyO3Vyz36Ko4MLmglGU3Af7ctOvMW1yEmmJTES/L3yn8jqe
         byYb0pmVYjyMDLm8LE0ZJGN1hQN2aMDgW+bIrRuyjWbzNQNtkmyCPYtcBDEAVquCB914
         Uqnw==
X-Gm-Message-State: AJIora9uAfvbYCuFA2KtwpjbEyqW4tCA4uOkyk0vOHgg7anx77IAAgMN
        rnfiP8FiwC3WbLEJstAbsUXhKA==
X-Google-Smtp-Source: AGRyM1v2BjKNQ4OAZh9N8FS2QOSHH4dLEcFyRiwRJk0YA5cVWE75802fGVBUoW5WrBHJr1y1b2SU3A==
X-Received: by 2002:a05:6512:ba6:b0:489:d128:837e with SMTP id b38-20020a0565120ba600b00489d128837emr9402801lfv.544.1657630149122;
        Tue, 12 Jul 2022 05:49:09 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id 3-20020a2e0503000000b0025d39993856sm2419436ljf.127.2022.07.12.05.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 05:49:08 -0700 (PDT)
Message-ID: <3359e1bc-54c4-0b10-af9f-05e9f2fb2162@linaro.org>
Date:   Tue, 12 Jul 2022 14:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/7] dt-bindings: media: Add i.MX8 ISI DT bindings
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
 <20220712000251.13607-7-laurent.pinchart@ideasonboard.com>
 <d8b124f4-9ed7-7cc1-a978-60997696646f@linaro.org>
 <Ys1MKFknchDYKR/1@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ys1MKFknchDYKR/1@pendragon.ideasonboard.com>
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

On 12/07/2022 12:25, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Tue, Jul 12, 2022 at 09:49:45AM +0200, Krzysztof Kozlowski wrote:
>> On 12/07/2022 02:02, Laurent Pinchart wrote:
>>> The Image Sensing Interface (ISI) combines image processing pipelines
>>> with DMA engines to process and capture frames originating from a
>>> variety of sources. The inputs to the ISI go through Pixel Link
>>> interfaces, and their number and nature is SoC-dependent. They cover
>>> both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>> Changes since v1:
>>>
>>> - Fix compatible string checks in conditional schema
>>> - Fix interrupts property handling
>>> ---
>>>  .../bindings/media/nxp,imx8-isi.yaml          | 148 ++++++++++++++++++
>>>  1 file changed, 148 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
>>> new file mode 100644
>>> index 000000000000..390dfa03026b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
>>> @@ -0,0 +1,148 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/nxp,imx8-isi.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: i.MX8 Image Sensing Interface
>>> +
>>> +maintainers:
>>> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> +
>>> +description: |
>>> +  The Image Sensing Interface (ISI) combines image processing pipelines with
>>> +  DMA engines to process and capture frames originating from a variety of
>>> +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
>>> +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
>>> +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - fsl,imx8mn-isi
>>> +      - fsl,imx8mp-isi
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: The AXI clock
>>> +      - description: The APB clock
>>> +      # TODO: Check if the per-channel ipg_proc_clk clocks need to be specified
>>> +      # as well, in case some SoCs have the ability to control them separately.
>>> +      # This may be the case of the i.MX8[DQ]X(P)
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: axi
>>> +      - const: apb
>>> +
>>> +  fsl,blk-ctrl:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      A phandle referencing the block control that contains the CSIS to ISI
>>> +      gasket.
>>> +
>>> +  interrupts: true
>>
>> Need generic constraints - min/maxItems.
> 
> I can't set maxItems here, as the value depends on the compatible
> string. It's set below as part of the "allOf". I could set minItems to
> 1, but I don't really see a point in doing so.

Of course you can, just like all other files could.

https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57

> 
>>> +
>>> +  power-domains: true
>>
>> Ditto.
> 
> I'll fix this one.
> 
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +    description: |
>>> +      Ports represent the Pixel Link inputs to the ISI. Their number and
>>> +      assignment are model-dependent. Each port shall have a single endpoint.
>>> +
>>> +    patternProperties:
>>> +      "^port@[0-9]$":
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        unevaluatedProperties: false
>>> +
>>> +    unevaluatedProperties: false
>>
>> At least one port is always required?
> 
> That's a fair assumption I think. How would you express that ? There's
> no patternRequired as far as I know. Note that the device-dependent
> ports are described in the "allOf" section below, where "required" is
> set per device model.

required:
 - port@0

> 
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +  - clock-names
>>> +  - fsl,blk-ctrl
>>> +  - ports
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: fsl,imx8mn-isi
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          maxItems: 1
>>> +        ports:
>>> +          properties:
>>> +            port@0:
>>> +              description: MIPI CSI-2 RX
>>> +          required:
>>> +            - port@0
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: fsl,imx8mp-isi
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          maxItems: 2
>>
>> You need to describe the items.
> 
> It's one interrupt per pipeline. Can I add the description to the
> generic interrupts property instead of documenting each item
> individually ? Something along the lines of
> 
>   interrupts:
>     description: Processing pipeline interrupts, one per pipeline
> 

This sounds good, thanks!


Best regards,
Krzysztof
