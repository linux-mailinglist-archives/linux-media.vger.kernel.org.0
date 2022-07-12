Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D89E571CD1
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 16:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbiGLOfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 10:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233369AbiGLOei (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 10:34:38 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FA6BA17F
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 07:34:12 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id o12so7490829ljc.3
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ug/OF6J2oXwTqZVMBEkYn2BquejpyxOcMU6lCKPsOiw=;
        b=l/y9HIzpyEkJOeqnG6u5B2HHMrIGXEcNsyB8eskGyasKU/f3L21SLG6HmNEUy0wHLF
         kYE5zgsFF31VJeYe8XbZG61pgOrmUTPPiUO36m1e9Hybb9UninxpdfeT3qNOdEigweBR
         ohb+lhYrX5ufcl/2+1suPCWYTvODB1W7ACt5qMjPBtI3JmKc8euTiO6vTt9c6tUOpXsb
         Z/wZnaC6qFm/TmdroQpdAA7Lpk6monkx2z86miSlF8n0ZWekdXBC0h+Prt9QMCmvx2iQ
         WUMuz+bcvViJDqAy3hlJhdtS/d+sDLqNI0DmAfyOQlOSgF1f3/gV8gj4HwWWChSOcwsh
         JTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ug/OF6J2oXwTqZVMBEkYn2BquejpyxOcMU6lCKPsOiw=;
        b=iodbujkqn/d0Upa75lJ+wbXZafFjGhYwQ7Eb/IoEXie2PO8Ny/u98640rmbWNQiRhL
         dBvhUosGoCMQrOJQE8wsu6jLtlzkhJ1aTKpqGS1NqysYbAC6KCb7S7s83cO1OkPNUoYp
         OUkx5ASHafM/e+o1PQiHyE0Kqu+fQGcmjkgzWy2Rj1+hWyJ53iJBu9MUdnWBjkAGrWya
         Z3ZyAp+MIZbeA6gvP3YWmCmL/HvExW2gxwde7dqG2WpOAWb4lsHahj108DDKsqd9+tpn
         QOk8bh6pexcQXyVQ5OWCn2mkH3NspyrWzOJLPe8xQm8wKXLw6kE/njDwJ4Uk71NhKuXR
         HzdQ==
X-Gm-Message-State: AJIora9Yrq57eKn1csZqYf5yHNAX2MgaDrwXnPnjEte5IBqsYDWsIoSz
        uwE/ica116IrY9o/od0HF+apVMYrpkznKMXf
X-Google-Smtp-Source: AGRyM1tF4EgaUr3sA6G6yymRmUIAQ0IBm7T/lXcufzfIe9MC02+34UA39zT3lg4zp2qYGCELaSfMTw==
X-Received: by 2002:a2e:a789:0:b0:25d:7a05:d179 with SMTP id c9-20020a2ea789000000b0025d7a05d179mr1883429ljf.64.1657636450354;
        Tue, 12 Jul 2022 07:34:10 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id f9-20020a056512360900b0047f8132d10bsm2200047lfs.281.2022.07.12.07.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 07:34:09 -0700 (PDT)
Message-ID: <a09cedbb-0878-d5ad-f3d1-aedc712bdcc7@linaro.org>
Date:   Tue, 12 Jul 2022 16:34:07 +0200
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
 <3359e1bc-54c4-0b10-af9f-05e9f2fb2162@linaro.org>
 <Ys2ErJr3gymnw2Qx@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ys2ErJr3gymnw2Qx@pendragon.ideasonboard.com>
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

On 12/07/2022 16:26, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Tue, Jul 12, 2022 at 02:49:06PM +0200, Krzysztof Kozlowski wrote:
>> On 12/07/2022 12:25, Laurent Pinchart wrote:
>>> On Tue, Jul 12, 2022 at 09:49:45AM +0200, Krzysztof Kozlowski wrote:
>>>> On 12/07/2022 02:02, Laurent Pinchart wrote:
>>>>> The Image Sensing Interface (ISI) combines image processing pipelines
>>>>> with DMA engines to process and capture frames originating from a
>>>>> variety of sources. The inputs to the ISI go through Pixel Link
>>>>> interfaces, and their number and nature is SoC-dependent. They cover
>>>>> both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
>>>>>
>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>> ---
>>>>> Changes since v1:
>>>>>
>>>>> - Fix compatible string checks in conditional schema
>>>>> - Fix interrupts property handling
>>>>> ---
>>>>>  .../bindings/media/nxp,imx8-isi.yaml          | 148 ++++++++++++++++++
>>>>>  1 file changed, 148 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..390dfa03026b
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
>>>>> @@ -0,0 +1,148 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/nxp,imx8-isi.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: i.MX8 Image Sensing Interface
>>>>> +
>>>>> +maintainers:
>>>>> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>> +
>>>>> +description: |
>>>>> +  The Image Sensing Interface (ISI) combines image processing pipelines with
>>>>> +  DMA engines to process and capture frames originating from a variety of
>>>>> +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
>>>>> +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
>>>>> +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - fsl,imx8mn-isi
>>>>> +      - fsl,imx8mp-isi
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  clocks:
>>>>> +    items:
>>>>> +      - description: The AXI clock
>>>>> +      - description: The APB clock
>>>>> +      # TODO: Check if the per-channel ipg_proc_clk clocks need to be specified
>>>>> +      # as well, in case some SoCs have the ability to control them separately.
>>>>> +      # This may be the case of the i.MX8[DQ]X(P)
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: axi
>>>>> +      - const: apb
>>>>> +
>>>>> +  fsl,blk-ctrl:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +    description:
>>>>> +      A phandle referencing the block control that contains the CSIS to ISI
>>>>> +      gasket.
>>>>> +
>>>>> +  interrupts: true
>>>>
>>>> Need generic constraints - min/maxItems.
>>>
>>> I can't set maxItems here, as the value depends on the compatible
>>> string. It's set below as part of the "allOf". I could set minItems to
>>> 1, but I don't really see a point in doing so.
>>
>> Of course you can, just like all other files could.
>>
>> https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57
> 
> I meant I can't set a fixed maximum, other than the max of all max. Is
> there a point in doing do ?

Yes, that's the practice. makes code easier to read and notice all
constraints.


Best regards,
Krzysztof
