Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52FC777C757
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 08:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234796AbjHOGCk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 02:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234787AbjHOGCK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 02:02:10 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3422B106
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 23:02:04 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe5c0e5747so29737185e9.0
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 23:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692079323; x=1692684123;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6wjkIKXmOaC3qza9ogWX1PomwYcyCLkZwNgjvdvmF0=;
        b=FqTAU0K1pTfh5WW9XG7/+VbWaNfxNE0P1Cgd7FNwP+5Kit3dZqstnLRbm5EVOiLBPB
         HXb4GjGcGfzsfJQIsnjMa7niQEnd4GfQOl/ntuRTxXnzL+sLBzCrOMDqOAOQBCVsd67l
         SP+gPQWmoH1oNOjwezxaKNMl+MM7xgXBAWlwVBebPL8fG0wlaQpzATWjgKhprw4Z6yRD
         toXiUiJuQF1rB0Crq50oF9ypUXkLbJiTXbx/RyHBPA5Civjxn+jX7J7kGwLof4oWmzOn
         Vf9BpD3SaIjpV8FNhqsmL9yiWAe8bWGjLf8ENiv7bMSbO2FWL0PolRcWjKLBckmjQMwh
         RVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692079323; x=1692684123;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6wjkIKXmOaC3qza9ogWX1PomwYcyCLkZwNgjvdvmF0=;
        b=fSuP1nGg76agt4JT56XouV4RpPrTbCCzKKEAc2VfkI2FXKJ6zrXLfzGvpNTwq0RNcv
         1MHnpfoU9DpiyeWWiqUECp9XtQTip1Ezf+PQyY0yjxd6UoJy1lSJlyK0B/uraTiJsyfZ
         FkO+pf39d/5jZ00Xw0+dkKkEWp8r5H6GkHL1X5RwvYJIrF2kiOq0z+HlhauxVtrRQbkk
         ITwk/rImGsccTkf9BKqSStGEgohSxT6BnJPHMD5OxOiN71FvG0N4wuoAM7gtV3C3Yzjp
         3lhmOTsVgSdNXDd3Vafgdt4QurfVuL6Z15PHBVCOy3fKFIx/LZ99s7PvdKLDmpcWDdT8
         dmEw==
X-Gm-Message-State: AOJu0Yw9FGbw1dS/3o6A2ZhODjUOMzBHt7cReLTVmxE+/K543f+kxslZ
        2FsYrcJOx7Ej2+Xc1ehFGtRp+g==
X-Google-Smtp-Source: AGHT+IHgHo0QXSlNn4F4uyvrQSqk9Lo79B56aRJmWoK2BovwZJenEVz07aEzcZNE1duJw8q8vT/y0w==
X-Received: by 2002:a7b:c04d:0:b0:3fe:4341:a5aa with SMTP id u13-20020a7bc04d000000b003fe4341a5aamr782291wmc.8.1692079322615;
        Mon, 14 Aug 2023 23:02:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id a9-20020a5d5089000000b0031434c08bb7sm16733802wrt.105.2023.08.14.23.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 23:02:02 -0700 (PDT)
Message-ID: <552c1bd6-0c91-071e-bd11-8d7c8feb7bc5@linaro.org>
Date:   Tue, 15 Aug 2023 08:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/3] media: exynos4-is: fimc-is: replace duplicate pmu
 node with phandle
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Andi Shyti <andi.shyti@kernel.org>
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
 <9520cdcb-5262-f429-b7bc-35c4cda08c12@xs4all.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9520cdcb-5262-f429-b7bc-35c4cda08c12@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/08/2023 11:49, Hans Verkuil wrote:
> Hi Krzysztof,
> 
> On 08/08/2023 01:13, Andi Shyti wrote:
>> Hi Krzysztof,
>>
>> [...]
>>
>>> +static void __iomem *fimc_is_get_pmu_regs(struct device *dev)
>>> +{
>>> +	struct device_node *node;
>>> +	void __iomem *regs;
>>> +
>>> +	node = of_parse_phandle(dev->of_node, "samsung,pmu-syscon", 0);
>>> +	if (!node) {
>>> +		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
>>> +		node = of_get_child_by_name(dev->of_node, "pmu");
>>> +		if (!node)
>>> +			return IOMEM_ERR_PTR(-ENODEV);
>>
>> in my opinion this should be:
>>
>> 		...
>> 		if (!node)
>> 			return IOMEM_ERR_PTR(-ENODEV);
>>
>> 		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
>>
>> Because if you don't have both "samsung,pmu-syscon and "pmu" then
>> the warning should not be printed and you need to return -ENODEV.
> 
> I agree with Andi for this part.
> 
> The only time you want to see this message is if samsung,pmu-syscon is
> missing AND pmu is present. If both are missing, then just return ENODEV as
> it was before.

OK, understood. I will send a v3.

Best regards,
Krzysztof

