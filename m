Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D4270726C
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 21:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjEQTlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 15:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjEQTlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 15:41:51 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165AEE42
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 12:41:49 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-510b4e488e4so2151270a12.3
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 12:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684352507; x=1686944507;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AE8+B3pWQ4l7QxfBqXUnPyiVc+aZlt+BtRcwXsFR3Kg=;
        b=JeDzLUDQ2pq/eW+97XnNWJdM/lObXBgEGxcH7lBWg6seb0FFwdy+Skry85v27s6EvM
         QkKH/tarHJPDjjQLK1puuvgut2LSyAGVlXvtgQk85PVSFy2ZrpUXtZCoQdoEG4NYgMJq
         ecYIECc3PBpmL8RasuQeCZ8hXX7hhxfC2bTTNXwk7kQw9Yp3FrTvUxxIvUe9j2IPmmj8
         XYAnodyLH69Fi5r5Z0kVGXZz57/Xitgrslunok7K0u2BrSApjH7yzTPKUGDHH4SwwMj1
         bnIg4tChp1M9aS3koD+8rutqnoTrCa3Cc+09L8PFzVd5FnecZA/i+KSehJoymjAUhr21
         QwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684352507; x=1686944507;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AE8+B3pWQ4l7QxfBqXUnPyiVc+aZlt+BtRcwXsFR3Kg=;
        b=ISs1B+nwYGyywoKIdZuqG5v98gppQvY8kzgbgi0PZYsFbBt45ZvsuCu01oY6X6I9MA
         SaGHqikJQamZLNpzpRAR5Qb+ffuHPpyRGBPRGy4j2sf/5d+WyT8Hhx7H0ObP+VFJArDN
         inXMe+KHXUNJnVEIZdu2H1fhd0Qvf9qSJjRoy6bffnAgucYC+RA/KO6nGnFCTz7Qt2xr
         sEVGJNuYftKZGD96z0nHEWiQpKRLKHhhXAW1H4QAo0KhPuPLap1GXUWCo8yhcBKnbeX2
         zc2Xpp6aKwitiOyboUVJ65jPAQyjfMUSveYGY/rZgxlWP+Bb6w+Pd8tZI6SMgVo9r033
         0nZw==
X-Gm-Message-State: AC+VfDzij7UmiNpbpo/Qua6w4J8U1BvTLnH9Mg5MGZCpEmCpt7ANZJ7v
        Ag8+dJ7usgHqRg9zTYpSeJTq3g==
X-Google-Smtp-Source: ACHHUZ4Qg3tRhWiRB2mnHGaX2Qu65CxTKUwvjCQnfKZkAA1h5PCV5S9tuiMPT1sXlI8/YMjQYOhZ5A==
X-Received: by 2002:a17:907:8a04:b0:95f:de3c:6c98 with SMTP id sc4-20020a1709078a0400b0095fde3c6c98mr39648716ejc.58.1684352507571;
        Wed, 17 May 2023 12:41:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7a:e7cc:21b3:c435? ([2a02:810d:15c0:828:d7a:e7cc:21b3:c435])
        by smtp.gmail.com with ESMTPSA id og16-20020a1709071dd000b0096637a19dcasm12671085ejc.4.2023.05.17.12.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 12:41:47 -0700 (PDT)
Message-ID: <ffd620e7-66ae-2921-85c0-c81070c09e01@linaro.org>
Date:   Wed, 17 May 2023 21:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alexandre Bailon <abailon@baylibre.com>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, jstephan@baylibre.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, khilman@baylibre.com,
        nbelin@baylibre.com, bero@baylibre.com
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
 <f0469fcb-a1ef-77a2-a8ab-40ab8d91bff7@linaro.org>
In-Reply-To: <f0469fcb-a1ef-77a2-a8ab-40ab8d91bff7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/05/2023 21:38, Krzysztof Kozlowski wrote:
> On 17/05/2023 16:52, Alexandre Bailon wrote:
>> This adds the device tree bindings for the APU DRM driver.
>>
>> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
>> Reviewed-by: Julien Stephan <jstephan@baylibre.com>
> 
> There are so many errors in this patch... that for sure it was not
> tested. Reduced review, except what was already said:
> 
>> ---
>>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
>> new file mode 100644
>> index 000000000000..6f432d3ea478
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: AI Processor Unit DRM
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,apu-drm
> 
> drm is not hardware. Drop everywhere or explain the acronym. If you
> explain it like Linux explains, then: drm is not hardware.
> 
>> +
>> +  remoteproc:
>> +    maxItems: 2
>> +    description:
>> +      Handle to remoteproc devices controlling the APU
> 
> Missing type/ref. Does not look like generic property, so missing vendor
> prefix.
> 
>> +
>> +  iova:
>> +    maxItems: 1
>> +    description:
>> +      Address and size of virtual memory that could used by the APU
> 
> So it is a reg?
> 
>> +
>> +required:
>> +  - compatible
>> +  - remoteproc
>> +  - iova
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    apu@0 {
> 
> Where is reg? @0 says you have it...
> 
>> +      compatible = "mediatek,apu-drm";
>> +      remoteproc = <&vpu0>, <&vpu1>;
>> +      iova = <0 0x60000000 0 0x10000000>;
> 
> Why would you store virtual address, not real, in DT? Let's say you have
> some randomization like KASLR. How is it going to work? Drop, it is not
> hardware property.

Actually RANDOMIZE_BASE. KASLR randomizes the physical.

Best regards,
Krzysztof

