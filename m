Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE9445B21AF
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 17:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbiIHPLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 11:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbiIHPLW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 11:11:22 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E481F11C7C9
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 08:11:19 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q7so28266495lfu.5
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=SMFrljKQFeZ7mrqOcjMaMCN0KzVyzr1TIqUCiZr3+Uw=;
        b=Lnc/G9vbOnnC/Qru0Or4jWF60lsTjQKep87b+7LhKWkNJwBpE/zHEKwLyB8razA8Sb
         3dcqmKtWrUMpxvAuHNE3Dgte9t9H/BUJi56/4HORgVE7W/gZFTVyU0QeoLJm2RFcTZmK
         +rWjWqW1ksYynTwITrm4JnRNpUAGuJhSlisEQGXrfyFt1mPA743lL6ZbnQZfqaN/6uqs
         qtMY0CwDQDu911TAEC8BYYk9+1otIX9rnU8bavQvDMifgpw81pCQtiuoU/JEKbjV4EZV
         7SoJ/TOvp9kZQ5EfR8MEbz0x+n76oftCogiqwvmMYmYebKbwToQTes+ebtWJ9vVKGvSD
         mdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=SMFrljKQFeZ7mrqOcjMaMCN0KzVyzr1TIqUCiZr3+Uw=;
        b=odTprWmXrE9R81iZoMdIHpNbVNDQuijKcMNfQXpY9t5WhFRucxtfZqTg8uOc5jOojS
         RWuJxhQxoPHeaWhkGGIrQBjDr2IsYU2L6FtI1NLmPuMBx4VMe3E7/OL9D3lVR1l1fEfQ
         qp6PbwAzoN5JpemLtXvQ/9Q6pSvb0AYSBSHTK3I/Dh0WXTF8GAobJJHbLRPEeMBDXGIW
         XalBuUWKiMhFCEpdQVufJN/xWjp0NreJti4Mqr9zBLxM5osSdhVrbBvSTWVvV2pG0OaZ
         4YhWPnrYZ5VLIcTBXrauUopadzKyzJ4GFIwCUrHp1Bx/qJW26KWQUEDJyHbikN9Jtjhb
         CHOw==
X-Gm-Message-State: ACgBeo38CU7IMFAz9z7cHZ5e9JPijhRPlQ4a2LKMLJ0x/t609mnF4n5y
        PNFxdivRfRguo/BbxjQc4TqMyw==
X-Google-Smtp-Source: AA6agR7TUL6V8bOu369x1uzTLuCM1E6iuOLs+tiwk3Gy4dJZbNcRutp/mgpQcRKf0XIq+nPUivPVpQ==
X-Received: by 2002:a05:6512:32c8:b0:492:f891:8a3a with SMTP id f8-20020a05651232c800b00492f8918a3amr3233766lfg.477.1662649878271;
        Thu, 08 Sep 2022 08:11:18 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a3-20020a056512200300b004946a1e045fsm1804544lfb.197.2022.09.08.08.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 08:11:17 -0700 (PDT)
Message-ID: <7a164961-5b32-8d80-a6f6-8c9f64622085@linaro.org>
Date:   Thu, 8 Sep 2022 17:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Patch v2 01/15] dt-bindings: media: s5p-mfc: Add new DT schema
 for MFC
Content-Language: en-US
To:     Aakarsh Jain <aakarsh.jain@samsung.com>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
        'Smitha T Murthy' <smitha.t@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     m.szyprowski@samsung.com, andrzej.hajda@intel.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, jernej.skrabec@gmail.com,
        benjamin.gaignard@collabora.com, stanimir.varbanov@linaro.org,
        dillon.minfei@gmail.com, david.plowman@raspberrypi.com,
        mark.rutland@arm.com, robh+dt@kernel.org, krzk+dt@kernel.org,
        andi@etezian.org, alim.akhtar@samsung.com,
        aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220907064715.55778-1-smitha.t@samsung.com>
 <CGME20220907063313epcas5p114f793010fd0f2797e93bd83ed18a1d7@epcas5p1.samsung.com>
 <20220907064715.55778-2-smitha.t@samsung.com>
 <08168057-853c-5b17-7d88-dc6c30e82f14@linaro.org>
 <000101d8c382$75750e00$605f2a00$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000101d8c382$75750e00$605f2a00$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/09/2022 14:56, Aakarsh Jain wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>> Sent: 07 September 2022 16:52
>> To: Smitha T Murthy <smitha.t@samsung.com>; linux-arm-
>> kernel@lists.infradead.org; linux-media@vger.kernel.org; linux-
>> kernel@vger.kernel.org; devicetree@vger.kernel.org
>> Cc: m.szyprowski@samsung.com; andrzej.hajda@intel.com;
>> mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
>> ezequiel@vanguardiasur.com.ar; jernej.skrabec@gmail.com;
>> benjamin.gaignard@collabora.com; stanimir.varbanov@linaro.org;
>> dillon.minfei@gmail.com; david.plowman@raspberrypi.com;
>> mark.rutland@arm.com; robh+dt@kernel.org; krzk+dt@kernel.org;
>> andi@etezian.org; alim.akhtar@samsung.com; aswani.reddy@samsung.com;
>> pankaj.dubey@samsung.com; linux-fsd@tesla.com;
>> aakarsh.jain@samsung.com
>> Subject: Re: [Patch v2 01/15] dt-bindings: media: s5p-mfc: Add new DT
>> schema for MFC
>>
>> On 07/09/2022 08:47, Smitha T Murthy wrote:
>>> Adds DT schema for s5p-mfc in yaml format
>>
>> s/Adds/Convert/
>> (as convert to DT schema)
>>
> ok, I will change.
> 
>> Please mention here changes to original binding (I see at least adding
>> iommus and dropping some properties).
>>
> ok. I will make this changes. 
>>>
>>> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
>>> Signed-off-by: Smitha T Murthy <smitha.t@samsung.com>
>>> ---
>>>  .../devicetree/bindings/media/s5p-mfc.txt     |  77 +------------
>>>  .../bindings/media/samsung,s5p-mfc.yaml       | 109
>> ++++++++++++++++++
>>>  2 files changed, 110 insertions(+), 76 deletions(-)  create mode
>>> 100644 Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt
>>> b/Documentation/devicetree/bindings/media/s5p-mfc.txt
>>> index aa54c8159d9f..0b7c4dd40095 100644
>>> --- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
>>> +++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
>>> @@ -1,76 +1 @@
>>> -* Samsung Multi Format Codec (MFC)
>>> -
>>> -Multi Format Codec (MFC) is the IP present in Samsung SoCs which
>>> -supports high resolution decoding and encoding functionalities.
>>> -The MFC device driver is a v4l2 driver which can encode/decode -video
>>> raw/elementary streams and has support for all popular -video codecs.
>>> -
>>> -Required properties:
>>> -  - compatible : value should be either one among the following
>>> -	(a) "samsung,mfc-v5" for MFC v5 present in Exynos4 SoCs
>>> -	(b) "samsung,mfc-v6" for MFC v6 present in Exynos5 SoCs
>>> -	(c) "samsung,mfc-v7" for MFC v7 present in Exynos5420 SoC
>>> -	(d) "samsung,mfc-v8" for MFC v8 present in Exynos5800 SoC
>>> -	(e) "samsung,exynos5433-mfc" for MFC v8 present in Exynos5433
>> SoC
>>> -	(f) "samsung,mfc-v10" for MFC v10 present in Exynos7880 SoC
>>> -
>>> -  - reg : Physical base address of the IP registers and length of memory
>>> -	  mapped region.
>>> -
>>> -  - interrupts : MFC interrupt number to the CPU.
>>> -  - clocks : from common clock binding: handle to mfc clock.
>>> -  - clock-names : from common clock binding: must contain "mfc",
>>> -		  corresponding to entry in the clocks property.
>>> -
>>> -Optional properties:
>>> -  - power-domains : power-domain property defined with a phandle
>>> -			   to respective power domain.
>>> -  - memory-region : from reserved memory binding: phandles to two
>> reserved
>>> -	memory regions, first is for "left" mfc memory bus interfaces,
>>> -	second if for the "right" mfc memory bus, used when no SYSMMU
>>> -	support is available; used only by MFC v5 present in Exynos4 SoCs
>>> -
>>> -Obsolete properties:
>>> -  - samsung,mfc-r, samsung,mfc-l : support removed, please use memory-
>> region
>>> -	property instead
>>
>> When did they become obsolete? Is it enough of time to remove them?
> 
> these properties were there earlier, we didn't added them in obsolete properties.

This is not the answer to my question. Is it enough of time to remove
deprecated properties?



Best regards,
Krzysztof
