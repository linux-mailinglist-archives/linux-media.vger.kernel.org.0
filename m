Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C583660FF4
	for <lists+linux-media@lfdr.de>; Sat,  7 Jan 2023 16:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjAGPa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Jan 2023 10:30:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjAGPa4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Jan 2023 10:30:56 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC596252
        for <linux-media@vger.kernel.org>; Sat,  7 Jan 2023 07:30:55 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id w13so2574950wrk.9
        for <linux-media@vger.kernel.org>; Sat, 07 Jan 2023 07:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMUPJpQBcGtzH4kWcu2nVFwuHCUArPb2603OVSvS0g8=;
        b=qKbLTjgV6/mKknV2sXZHOMV8M/62lt/pDWlLidtOn6zSE7y+zoiMhhrZ6B1nXTPxzz
         n+Zh2YXc7bSzWIbQ7MqL4I857KU/gj675hBuO9FOeF46K/4qno/7sCB3uMRr50OU3RrJ
         CcmGCdmoDWCN3pRBgTNozgITPnCAKKTg39b2Z8tSxa8g4SvYipbjbLyHMfah8LjvF4oS
         Z6xSnh589lfXDOqNYAXre33GE0HAOMj6IJtSLliZbAcgE+GYoV43TlkZqFQ2cwKAJZn9
         BuMx2ULge3aKdnVRh+CGUnXrDpZq6d6Wgy0qwED/Ru3o6F/Jp6tnx89kBG1yzPaKzSxN
         qscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMUPJpQBcGtzH4kWcu2nVFwuHCUArPb2603OVSvS0g8=;
        b=WywDO3YO3ocb+L+AGzp7mzQyhkOvgrxtmvzULOWiiTCmE4QX3d8ip6jA3ppLwGGjd3
         cq9/s7pi7fgUj8Wzpz2pfs3IGs/xuC6gWUncT3KfEfFI/tMYU/hd0QAn9V0u6oswUgiH
         UH6ierA2srDAwfKrjBipmupIEKnukG0sG6pYwjDZwQ83eLUtRrcHaoy8tmXWceVZNMHv
         yn5SsRa5yL+GZiL2YyIcdM3IKyOyGQp7uySexZ7If8/FPguyWw2Msz02YhihjcGYUv8O
         IQwPA4K8fUuZFkosmA2CDlJjwqKCrLWTbwvFwpoh3ipK9wPPMg0V2aqIaoAbbtEHKtTo
         cH8g==
X-Gm-Message-State: AFqh2kojeXvC6OS9hbBVOxc5R91HlrxisS0n71tlGi+GeBMclLH+ZQyU
        PY0eMlPvcMH3VpF+pHX65U663g==
X-Google-Smtp-Source: AMrXdXthestGfcTU9GVlBsBvpk8m7/LoYEiCN9PL+ya2anRQ+O1ant7rRR7S1YwBe5drlwtCxpQRjA==
X-Received: by 2002:a5d:5e91:0:b0:2b8:fe58:d368 with SMTP id ck17-20020a5d5e91000000b002b8fe58d368mr5562051wrb.29.1673105453736;
        Sat, 07 Jan 2023 07:30:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600012c400b002bbb2d43f65sm1380839wrx.14.2023.01.07.07.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jan 2023 07:30:53 -0800 (PST)
Message-ID: <326c8fc5-a6b4-1005-40e7-6dcf0e0b4b7b@linaro.org>
Date:   Sat, 7 Jan 2023 16:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] dt-bindings: media: Add OmniVision OV8858
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20230106203909.184073-1-jacopo@jmondi.org>
 <20230106203909.184073-2-jacopo@jmondi.org>
 <4f1e55bc-9f0b-6411-2957-e68a049f1d6b@linaro.org>
 <20230107151825.6quaenebql3bnjv5@uno.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230107151825.6quaenebql3bnjv5@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/01/2023 16:18, Jacopo Mondi wrote:
> Hi Krzysztof
> 
> On Sat, Jan 07, 2023 at 02:09:54PM +0100, Krzysztof Kozlowski wrote:
>> On 06/01/2023 21:39, Jacopo Mondi wrote:
>>> From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>
>>> Add binding schema for the OmniVision OV8858 8 Megapixels camera sensor.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>  .../bindings/media/i2c/ovti,ov8858.yaml       | 105 ++++++++++++++++++
>>>  1 file changed, 105 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
>>> new file mode 100644
>>> index 000000000000..002461a974f8
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
>>> @@ -0,0 +1,105 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov8858.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: OmniVision OV8858 Image Sensor
>>> +
>>> +maintainers:
>>> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> +  - Nicholas Roth <nicholas@rothemail.net>
>>> +
>>> +description: |
>>> +  The OmniVision OV8858 is a color CMOS 8 Megapixels (3264x2448) image sensor
>>> +  controlled through an I2C-compatible SCCB bus. The sensor transmits images
>>> +  on a MIPI CSI-2 output interface with up to 4 data lanes.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ovti,ov8858
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +    description: XVCLK external clock
>>> +
>>> +  clock-names:
>>> +    const: xvclk
>>> +
>>> +  dvdd-supply:
>>> +    description: Digital Domain Power Supply
>>> +
>>> +  avdd-supply:
>>> +    description: Analog Domain Power Supply
>>> +
>>> +  dovdd-supply:
>>> +    description: I/O Domain Power Supply
>>> +
>>> +  powerdown-gpios:
>>> +    description: PWDNB powerdown GPIO (active low)
>>> +
>>> +  reset-gpios:
>>> +    description: XSHUTDN reset GPIO (active low)
>>
>> Here you need maxItems. I did not propose to remove it here.
>>
> 
> I'm wondering why you can have multiple resets but not multiple
> powerdowns.
> 
> Anyway, how is one supposed to know when maxItems is required or not,
> where should I look ?

gpio-consumer-common.yaml

Best regards,
Krzysztof

