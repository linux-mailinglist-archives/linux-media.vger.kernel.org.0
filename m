Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082EA77431F
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 19:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjHHR5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 13:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234058AbjHHR4r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 13:56:47 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC012AF02
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 09:25:41 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bed101b70so840250566b.3
        for <linux-media@vger.kernel.org>; Tue, 08 Aug 2023 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511929; x=1692116729;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rh7yiDqz5JOnOPNrSWe6RNtd/mULecCxFtp8KEyVNnw=;
        b=FmBXaoxliTAroLLQnPmtIsw+AlmuclRXo5FPQq2UxqEKXujM1S/196SsoYiHzCbhje
         pdvlgs52dJ4YCaUwOChM97vPnsllKJwx1UJF8kl3V0XGciDb83ZIWEUCsepkqTs+Eb4P
         UYd8rTGzXsq8DaAxHOPQ3Y7j08KVMVBZ2dxldSLHUZ38EptIhz5AXpGeKkp08XP3ypSP
         dXyQBcji0jHbGTZOYswTA06GXMISRtwNSIv+s7hvBHVTS1yMnL9eIWVesx++O0IN47wU
         NYsEmmfB68tzRcHeYAGYXFCZVImW49BOpQs5+1nWYjBtC6NAQWwiso3JZSp1yIWBKwWa
         GhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511929; x=1692116729;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rh7yiDqz5JOnOPNrSWe6RNtd/mULecCxFtp8KEyVNnw=;
        b=Z0+SgujtK36ek0jXNjV8UdCULCTYGKNYvVl0g5pRQYkAoGhXNbm0RlqTkIBngwH9Ol
         soPJ541goOMIRVp65HilRfEH0mx5tVaCOwqpkShxaItJJaVi8Rw0e1dc0ujxhIZwwfn6
         DLwbVS5c1KtvN9ihGqLnkDBoAfzk5ILs43yF/7yHPyBoE7a0JELbhl8TTNsBmLArfM4M
         Q87OHPcHbRKOmL1PDwNK16W0R/DYp/T4vheEyFRexrXDl1F3lkGWav9DGd8+qdTMyQev
         UbPTVUiV7x6wsT7GfjfuB6YKHnojvwmZi+9gwBLLc/9/jZsnGZtx4pgarYhyc8kYfHLQ
         Rfng==
X-Gm-Message-State: AOJu0YxBvY9TqTz1xSERc1lr6u8Ulyj7gLKaXTAfSrcXUfZlqk0PdVLO
        S68o71UVg+ni1VjNRBUnmK2Fd4a7hRKiqGbfnLc=
X-Google-Smtp-Source: AGHT+IEbOCg9xyA18ITMblbIWlyzPFYOlii2hEzw3GovA2rrE4kb5tpZlfY7zxAoe7VitoQW3rEUTg==
X-Received: by 2002:a2e:914b:0:b0:2b9:4476:ab28 with SMTP id q11-20020a2e914b000000b002b94476ab28mr9271044ljg.38.1691501487657;
        Tue, 08 Aug 2023 06:31:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id l26-20020a1c791a000000b003fe4548188bsm13716497wme.48.2023.08.08.06.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 06:31:27 -0700 (PDT)
Message-ID: <d198429e-d8ca-aeea-e59b-a241dacde658@linaro.org>
Date:   Tue, 8 Aug 2023 15:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/3] media: exynos4-is: fimc-is: replace duplicate pmu
 node with phandle
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230807131256.254243-1-krzysztof.kozlowski@linaro.org>
 <20230807131256.254243-3-krzysztof.kozlowski@linaro.org>
 <20230807231320.svssge6uymw3jiho@intel.intel>
 <84fbcc37-d226-b637-caa1-b24ebaf03d58@linaro.org>
 <20230808114201.ztr22migzzyfsfwq@intel.intel>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808114201.ztr22migzzyfsfwq@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/08/2023 13:42, Andi Shyti wrote:
>>>> +static void __iomem *fimc_is_get_pmu_regs(struct device *dev)
>>>> +{
>>>> +	struct device_node *node;
>>>> +	void __iomem *regs;
>>>> +
>>>> +	node = of_parse_phandle(dev->of_node, "samsung,pmu-syscon", 0);
>>>> +	if (!node) {
>>>> +		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
>>>> +		node = of_get_child_by_name(dev->of_node, "pmu");
>>>> +		if (!node)
>>>> +			return IOMEM_ERR_PTR(-ENODEV);
>>>
>>> in my opinion this should be:
>>>
>>> 		...
>>> 		if (!node)
>>> 			return IOMEM_ERR_PTR(-ENODEV);
>>>
>>> 		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
>>>
>>> Because if you don't have both "samsung,pmu-syscon and "pmu" then
>>> the warning should not be printed and you need to return -ENODEV.
>>
>> Why not? Warning is correct - the driver is trying to find, thus
>> continuous tense "Finding", PMU node via old method.
> 
> Alright, I'll go along with what you're suggesting, but I have to
> say, I find it misleading.
> 
> From what I understand, you're requesting an update to the dtb
> because it's using deprecated methods. However, the reality might 
> be that the node is not present in any method at all.
> 
> Your statement would be accurate if you failed to find the
> previous method but then did end up finding it.
> 
> Relying on the present continuous tense for clarity is a bold
> move, don't you think? :)

I just don't think it matters and is not worth resending.

Best regards,
Krzysztof

