Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 567A86F88F3
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 20:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbjEESs7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 14:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbjEESs6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 14:48:58 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C5F1A1F1
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 11:48:55 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ac8d9399d5so6061281fa.1
        for <linux-media@vger.kernel.org>; Fri, 05 May 2023 11:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683312534; x=1685904534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Crh9fzWfq0MD2HA/mWuy3AwSn4MclmdJjDjdEYt9apw=;
        b=A3BA8gulgqhSMKGoMnA/WTu7e+p1LZh7rNN2V7J17ajT8yI4vic/7rfTY7kHU5eFBe
         TDtDz1GwFXdZ3Yi+jQhQ0aF7GBzhnj7OthbB058Zc0v9fTU9UlP/QRBvE7HO1cLJLXBE
         GOZ1D19yuRtlmxowcHUdD8Q9n+mmX8l/28UoM6F4AV3DhCCMWoMeUAScn9GlsQV5K9d8
         /YnF13t958XSrfgzxJ2OgJBN/FmIM2TiOFYjyezG19sR1Q8XcAoXE9zx/NtMBkaWcB13
         H0/MF7TbtrZSBjobqxoh9xGdZ/xGI/uMtuavMD6ccjIXQv8gkiZAS6Td3oFjtmhVm192
         LCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683312534; x=1685904534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Crh9fzWfq0MD2HA/mWuy3AwSn4MclmdJjDjdEYt9apw=;
        b=YhVWsmPxCFF+zYPOU819Wsf+/nuAzuGaBcBRpxON1+HaRoKNfeswoRjEdBER/iwoVT
         ZwaGSMHkvdB/iiA1qSzLR+kax30gPfeH4YpYptI7UuZPwQk6ZoNk9kdYcQ1JAAUlsvpW
         fs60SLDnGS7tYtfjYgT5kDX2vVIe9hUSCthAngjvi9scBdx1dJZ4+ZRCmN1+wbjmCmBa
         BKnlguV/cUa2eWjE4ERpaA/+A0yg27l3BD0Kj9+/xoE78JLebisx1glnKBN4zIsbfQdG
         dmu1Mk6hkkOEVPaxbOFSqTpJ2K1gn0hxG8r0GoKPHQIAmzP6aJZl2kBTnIgljMnzgMFf
         GMCw==
X-Gm-Message-State: AC+VfDycVNMxNtqudTR3R9bw6x6oeSJ9DU/6Wn+m/d+LUI6Aj/36fA6V
        6nGj2GRx2TUrm4zzea4mpPLSsw==
X-Google-Smtp-Source: ACHHUZ6MB/ZRbiqb+rRR2yJknH8iVNHvoAF46WGJlP3+1O3Eo9MBQbKqyXrbrAEzStwB9WURN0hvvg==
X-Received: by 2002:a19:f702:0:b0:4f0:c18:5114 with SMTP id z2-20020a19f702000000b004f00c185114mr883037lfe.26.1683312534123;
        Fri, 05 May 2023 11:48:54 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id i12-20020ac25d2c000000b004e887fd71acsm376929lfb.236.2023.05.05.11.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 11:48:53 -0700 (PDT)
Message-ID: <e5f7420c-2e09-8a29-0958-da0a74fc98b4@linaro.org>
Date:   Fri, 5 May 2023 20:48:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 02/18] media: venus: hfi_venus: Write to VIDC_CTRL_INIT
 after unmasking interrupts
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        stable@vger.kernel.org
References: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
 <20230228-topic-venus-v2-2-d95d14949c79@linaro.org>
 <bfda6e09-2674-8ef1-11b2-83f631329c51@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <bfda6e09-2674-8ef1-11b2-83f631329c51@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5.05.2023 14:33, Vikash Garodia wrote:
> 
> On 5/4/2023 1:30 PM, Konrad Dybcio wrote:
>> The downstream driver signals the hardware to be enabled only after the
>> interrupts are unmasked, which... makes sense. Follow suit.
> 
> Rephrase the commit text,
> 
> 1. No need to mention downstream driver, if something is buggy, fix it.
Generally I'd agree, however in this specific case the downstream
driver is the only available source of knowledge about what the correct
(or at least working) initialization sequence of this hw block is.

> 
> 2. Avoid "..." and lets make it more formal.
Ack

Konrad
> 
>> Cc: stable@vger.kernel.org # v4.12+
>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
>> index bff435abd59b..8fc8f46dc390 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>> @@ -453,7 +453,6 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
>>       void __iomem *wrapper_base = hdev->core->wrapper_base;
>>       int ret = 0;
>>   -    writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
>>       if (IS_V6(hdev->core)) {
>>           mask_val = readl(wrapper_base + WRAPPER_INTR_MASK);
>>           mask_val &= ~(WRAPPER_INTR_MASK_A2HWD_BASK_V6 |
>> @@ -464,6 +463,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
>>       writel(mask_val, wrapper_base + WRAPPER_INTR_MASK);
>>       writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
>>   +    writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
>>       while (!ctrl_status && count < max_tries) {
>>           ctrl_status = readl(cpu_cs_base + CPU_CS_SCIACMDARG0);
>>           if ((ctrl_status & CPU_CS_SCIACMDARG0_ERROR_STATUS_MASK) == 4) {
> 
> Above code looks good.
> 
> -Vikash
> 
