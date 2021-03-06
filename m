Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BC332FB48
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 16:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbhCFPBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 10:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhCFPB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 10:01:28 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4005BC06175F
        for <linux-media@vger.kernel.org>; Sat,  6 Mar 2021 07:01:28 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id d13so7294904edp.4
        for <linux-media@vger.kernel.org>; Sat, 06 Mar 2021 07:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VpvLVXBiTEsa/PBM9ITTWtxz9hZ9Ki5SE/hgW8uahas=;
        b=WupEUS+T5692Lf2k8o56FQ/Ey1sxfZkHzh2JKV6EqWrs1H/mI8PmBNBu6bvAp6kb4d
         ZfKbsP3U1ZXprNVgSKnvK8d4BEkyM+QrCu4GZCESvym5S9Dke7wb7zrzCHE17N9QK1hx
         e3evHVt7ttrVr27Pe5LXoBfCq/MD3zNoBp0UnIswkAh9k4TNdbFgRDRqIY1adgEgFaOL
         FjEX4myMCAtTNGiepMGIgvnmsNCMQRU3/qiFYAfO1f0IO6YsDgo4HiUaVo0AXUqfqv7x
         mxHC7IDbOBtTcuTNPRX9JPUuIfnI05d+qoK8MsHydgFhSn/lFPuYRPxdmImxUrnrRA3M
         uuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VpvLVXBiTEsa/PBM9ITTWtxz9hZ9Ki5SE/hgW8uahas=;
        b=aQgEpQ/nZPZI7efjjyUAYKjXXG3N7Y67eUyKw8LAk61W9N0aXW1JNfcIxUghm+D+Sg
         pgz26uyBaPMzK0lbHBZ8pgeKZqaBQObCK9FJi4wNK1EYV+vBT+UvochLMuGY7LWfP/EZ
         uWcaY0GRxYbniQN+wG8rLSoScJFBKZ3Vnz1hsONJCmHvUs4qA3uijmRPFzFfrBfMPqnO
         m6AnB/pKQmnrCBNeFS55+qVUi/niK68TXXmslj7Cg68B40nIOwEBlCDOsiHiouJssh/L
         YKzqCw+kQCD9+oVTuM1sDYPodqZ4kBrJSr64GLNRw7TtgufqG96xvpvcVR6tU9ClOjHD
         1uxg==
X-Gm-Message-State: AOAM530jBt1p77mFKE+//pCc6cmeawTZr+P2dmt7/TaehL56y4gwFEPn
        f4OjCTbieCicowb/HgAoGLWrj8qoRvSFqg==
X-Google-Smtp-Source: ABdhPJxWrifYqmG5mfpo/Uo1XqgTf8zXoRtHqnp8LzjkyC8lptLbBiUg1e3iVJMOelBL4P2EXB55Cw==
X-Received: by 2002:aa7:c709:: with SMTP id i9mr2293788edq.319.1615042886758;
        Sat, 06 Mar 2021 07:01:26 -0800 (PST)
Received: from [192.168.1.16] (95-43-196-84.ip.btc-net.bg. [95.43.196.84])
        by smtp.googlemail.com with ESMTPSA id t27sm3296256ejc.62.2021.03.06.07.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 07:01:26 -0800 (PST)
Subject: Re: [PATCH 04/25] media: venus: core,pm: Vote for min clk freq during
 venus boot
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-5-bryan.odonoghue@linaro.org>
 <21b09fd4-0b4c-3acb-ece2-f1a710bbd3fd@linaro.org>
Message-ID: <94133e43-d250-7359-6cfe-c4956f5185dc@linaro.org>
Date:   Sat, 6 Mar 2021 17:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <21b09fd4-0b4c-3acb-ece2-f1a710bbd3fd@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/23/21 3:25 PM, Stanimir Varbanov wrote:
> 
> 
> On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
>> From: Dikshita Agarwal <dikshita@codeaurora.org>
>>
>> Vote for min clk frequency for core clks during prepare and enable clocks
>> at boot sequence. Without this the controller clock runs at very low value
>> (9.6MHz) which is not sufficient to boot venus.
>>
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/pm_helpers.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index 4f5d42662963..767cb00d4b46 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -41,10 +41,24 @@ static int core_clks_get(struct venus_core *core)
>>  static int core_clks_enable(struct venus_core *core)
>>  {
>>  	const struct venus_resources *res = core->res;
>> +	const struct freq_tbl *freq_tbl = NULL;
>> +	unsigned int freq_tbl_size = 0;
>> +	unsigned long freq = 0;
> 
> no need to initialize to zero.
> 
>>  	unsigned int i;
>>  	int ret;
>>  
>> +	freq_tbl = core->res->freq_tbl;
>> +	freq_tbl_size = core->res->freq_tbl_size;
> 
> could you initialize those at the variables declaration?
> 
>> +	if (!freq_tbl)
>> +		return -EINVAL;
>> +
>> +	freq = freq_tbl[freq_tbl_size - 1].freq;
>> +
>>  	for (i = 0; i < res->clks_num; i++) {
>> +		ret = clk_set_rate(core->clks[i], freq);
> 
> I'm not sure that we have to set the rate for all core->clks[i] ?

Confirmed. This produces regressions on db410c (I haven't tested on
other platforms yet).

> 
>> +		if (ret)
>> +			goto err;
>> +
>>  		ret = clk_prepare_enable(core->clks[i]);
>>  		if (ret)
>>  			goto err;
>>
> 

-- 
regards,
Stan
