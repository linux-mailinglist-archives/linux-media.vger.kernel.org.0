Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 557B6773FD0
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233685AbjHHQxo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbjHHQxH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:53:07 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FC8E5F
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:58:30 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31763b2c5a4so5007391f8f.3
        for <linux-media@vger.kernel.org>; Tue, 08 Aug 2023 08:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510309; x=1692115109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/neN/3MAwPWtJfwm6LVkhUVNl60rPtJxXyh7+fqe70=;
        b=i7BBwkdXriQoAwyGhuQNoP8pToL0dZV7LFjE8qeyJBfD88LbrSvqdc7y5Bclmr9jko
         FB2AQYE6WSrTIV1TR5hjvpBst1TGzo2GsRjld/wt/FheicLSOmS5p1XZmpRDIKVwmGC8
         du7lkJvVkznrW8KPrIfEF7StF56K0bACPlefK0cx84xSZA4oUcmsRVp3xySOSTaO2Ek1
         FjbbSxFcz64NTE7vn7e2/Ua6rDRlZ7nwG1r+DCGWaLI0RFXScLSr6C9/kwvU3/ywAZvf
         L06mDJsIxh280Kme4TpkdzziNuy7S7FH5xyi5k+PzGnrethKgXouTW3O06znNXrzQgRg
         VwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510309; x=1692115109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/neN/3MAwPWtJfwm6LVkhUVNl60rPtJxXyh7+fqe70=;
        b=LLP8NhHma1EPpMfHDbElbVDZ0zm1nR/PiQhbvJTi2HcewKHvraE9hylHZTE8Wtf/Dw
         eNyfm9hIC/NiQQ+zGlNT4zHbx2XwBMsEBm51ImL8CGiGTswMZ+1OSrxP+54BDbxTo/3F
         vuVMHFBobWjWthHETsdoI15aY04z0HKlPy/RU2IhOcmGjm8/Dial1K2ztdA3pIF7jwbz
         H/Y+0QInCNqLCIIfa/xx97zLYZAZvfOy05F9VzaBtRjCcO8LMxJJ8Psgpx7RsHCArdRz
         y/E+q8p1yrkK3Oc+GrvlhuSzTXuE9TeTRBwSZv3L/kx6LAtvbdoBO2kBs4OZ9mCXfjEu
         obug==
X-Gm-Message-State: AOJu0YwbYOyncVtRI73OyXnosrEA4FgB6lkl1yzcRhO3akOToiY+PE1T
        GKNazHEXsCaueFKwTSta8KnRf8fq/PHzxEOwIGQ=
X-Google-Smtp-Source: AGHT+IEhz/h88VbIK+Uxv8RtvehzJEb4HtJYyKbQA5Ljg8jQq5fhiYybRtK6Z0XyqhDAHfl5BtRxaw==
X-Received: by 2002:a17:906:ca:b0:994:47a5:a377 with SMTP id 10-20020a17090600ca00b0099447a5a377mr10240779eji.24.1691475723704;
        Mon, 07 Aug 2023 23:22:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id bw5-20020a170906c1c500b00988f168811bsm6194300ejb.135.2023.08.07.23.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 23:22:03 -0700 (PDT)
Message-ID: <84fbcc37-d226-b637-caa1-b24ebaf03d58@linaro.org>
Date:   Tue, 8 Aug 2023 08:22:01 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230807231320.svssge6uymw3jiho@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/08/2023 01:13, Andi Shyti wrote:
> Hi Krzysztof,
> 
> [...]
> 
>> +static void __iomem *fimc_is_get_pmu_regs(struct device *dev)
>> +{
>> +	struct device_node *node;
>> +	void __iomem *regs;
>> +
>> +	node = of_parse_phandle(dev->of_node, "samsung,pmu-syscon", 0);
>> +	if (!node) {
>> +		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
>> +		node = of_get_child_by_name(dev->of_node, "pmu");
>> +		if (!node)
>> +			return IOMEM_ERR_PTR(-ENODEV);
> 
> in my opinion this should be:
> 
> 		...
> 		if (!node)
> 			return IOMEM_ERR_PTR(-ENODEV);
> 
> 		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
> 
> Because if you don't have both "samsung,pmu-syscon and "pmu" then
> the warning should not be printed and you need to return -ENODEV.

Why not? Warning is correct - the driver is trying to find, thus
continuous tense "Finding", PMU node via old method.

> 
> ... and... "*please* update your DTB", the user might get upset
> and out of sheer spite, decides not to do it – just because! :)

The message is already long enough, why making it longer? Anyone who
ships DTS outside of Linux kernel is doomed anyway...

Best regards,
Krzysztof

