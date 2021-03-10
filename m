Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89FE833452F
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 18:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbhCJRc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 12:32:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbhCJRcU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 12:32:20 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCD5C061761
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 09:32:20 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id 7so24270277wrz.0
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 09:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DlAZFPFmBhu6prOt5DuDCXZS0io3cSso7QLySifK5A8=;
        b=SGNwPC4ZqU20llgFsedS5GXQ1OxaIKLj5mH/1/qCeDrB/jT7p+G1f2ysaPPnMkyyDy
         TspyOvWUytu33ZhujK4OQA0p3l6rey2Mv6yXBdz8Md7GnIfQ2wZqnZ7NdFj07u88i8MK
         hCmgy3ReKIdO1AqarPaK160HfIyXmRWXRc+sCbGXIWCOx4XhfOIl8BBB0DOdnX+XgZwx
         xps/3snfsoxEJKqu4dfz1GS2A118c7krND75HF/CMQf2DAr9/HrMyNwmSRtBu8GLhfSu
         2nNawnNcHqiWWrBhXQ+ti2eER+Xk2VUdZ2bDdVr9YMPU+JYKhL2pX2vrfCPxgvdb8Pmt
         1Dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DlAZFPFmBhu6prOt5DuDCXZS0io3cSso7QLySifK5A8=;
        b=qWsHqEJtnTF4g1iUi6ejW0QgATRx054MSY2JtFrUR8Fif+ZXhQQSXVWlHIzNXM8Jlm
         rRrKKSrzOpOtTs51asRPrQhkc/TXKdZfWuzNF6BkSvedC91o7WST5S9HdPjrZaZ22tQ6
         smt7Ia5VM08MXHBsXYgxzTqsn6JCRGTucUaB/7y9obkN49ISgUdAU7vygFr5yNI7fpZ8
         TspN/1/QfMXgytZhRKs8qol6zrdDKVVgU40yW3vDLHNvrtdlq5Tckh1aLBVKvFarnPpf
         1RKQXCYydMfKGxyA6BRbUatkZGLizfex/7v93MkyghIskVnjYCY6H5JOB2PmV0BN57ZQ
         k8bA==
X-Gm-Message-State: AOAM533AN6CjxRc0U57/YYI+XvYfT7tfUaLu0Vv1RBpXWKMZQ4/zkX/y
        EBfALyqYm8EZJjQIQtKNlizn8w==
X-Google-Smtp-Source: ABdhPJx/WiUiO5meLImUgfHp2XodefXH+4QQB7qWGzqihxKbKXhLgk2ZP2ihnmuq6F0qUWQilwflbg==
X-Received: by 2002:adf:e582:: with SMTP id l2mr4662816wrm.207.1615397539010;
        Wed, 10 Mar 2021 09:32:19 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e1sm16464wrd.44.2021.03.10.09.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 09:32:18 -0800 (PST)
Subject: Re: [PATCH 04/25] media: venus: core,pm: Vote for min clk freq during
 venus boot
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-5-bryan.odonoghue@linaro.org>
 <21b09fd4-0b4c-3acb-ece2-f1a710bbd3fd@linaro.org>
 <94133e43-d250-7359-6cfe-c4956f5185dc@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <c0ef2f92-ef80-adc4-3530-949e0a5b3e4e@linaro.org>
Date:   Wed, 10 Mar 2021 17:33:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <94133e43-d250-7359-6cfe-c4956f5185dc@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/03/2021 15:01, Stanimir Varbanov wrote:
> 
> 
> On 2/23/21 3:25 PM, Stanimir Varbanov wrote:
>>
>>
>> On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
>>> From: Dikshita Agarwal <dikshita@codeaurora.org>
>>>
>>> Vote for min clk frequency for core clks during prepare and enable clocks
>>> at boot sequence. Without this the controller clock runs at very low value
>>> (9.6MHz) which is not sufficient to boot venus.
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   drivers/media/platform/qcom/venus/pm_helpers.c | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> index 4f5d42662963..767cb00d4b46 100644
>>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> @@ -41,10 +41,24 @@ static int core_clks_get(struct venus_core *core)
>>>   static int core_clks_enable(struct venus_core *core)
>>>   {
>>>   	const struct venus_resources *res = core->res;
>>> +	const struct freq_tbl *freq_tbl = NULL;
>>> +	unsigned int freq_tbl_size = 0;
>>> +	unsigned long freq = 0;
>>
>> no need to initialize to zero.
>>
>>>   	unsigned int i;
>>>   	int ret;
>>>   
>>> +	freq_tbl = core->res->freq_tbl;
>>> +	freq_tbl_size = core->res->freq_tbl_size;
>>
>> could you initialize those at the variables declaration?
>>
>>> +	if (!freq_tbl)
>>> +		return -EINVAL;
>>> +
>>> +	freq = freq_tbl[freq_tbl_size - 1].freq;
>>> +
>>>   	for (i = 0; i < res->clks_num; i++) {
>>> +		ret = clk_set_rate(core->clks[i], freq);
>>
>> I'm not sure that we have to set the rate for all core->clks[i] ?
> 
> Confirmed. This produces regressions on db410c (I haven't tested on
> other platforms yet).
> 
>>
>>> +		if (ret)
>>> +			goto err;
>>> +
>>>   		ret = clk_prepare_enable(core->clks[i]);
>>>   		if (ret)
>>>   			goto err;
>>>
>>
> 

OK, I have this now on db410c

I made a tree out of

svarbanov-linux-tv/venus-for-next-v5.13
+
svarbanov-linux-tv/venus-msm8916-fixes - minor fix here integrating on 
top of 5.13

and then put the sm8250 changes on top of that

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=tracking-qcomlt-sm8250-venus-integrated-sm8250

So confirm db410c works up to tag 
tracking-qcomlt-sm8250-venus-integrated-sm8250-02+svarbanov-linux-tv/venus-msm8916-fixes

I'll work on fixing your feedback on that putative branch.

---
bod
