Return-Path: <linux-media+bounces-8949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E589E263
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 20:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD763B22D1D
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 18:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C9A156C67;
	Tue,  9 Apr 2024 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkxYjiG2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E95156999
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 18:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712686624; cv=none; b=nPsq14CrkUNQGlk9Y/FaMGwdx1jCAnZKQ/g420c1XkrR3D6+NbW5vSKDFvpoS87GQA390LV56kLJTvTZINVS+Td0u3mnGj7rVIwLwt4LR/drNGqfBiP1pLfV6Ry+wvkT/FpFsj65eJGZONvFOF1aUjGleMt4iDbN6/blMBr5gRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712686624; c=relaxed/simple;
	bh=8v7Bw7Ml2qSXocRuYkT6D/f4NYEZj9FMUacUtYK7PxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JfCjQS/Tmt3kA//ZhkH1UllN9AIf1Jac32p5x8xvtC4/TZyBSRLFQMozdwwvaRBiJXkx1o2TZSw2gF7kzCga5iOpjS1s9+ruA7QDxeKEE4NFThbsapn08ahXi2ZSkXIcHWqUx16hiN6PjXKYyX0+YlVRPCbx7QMg7c8dWZ3KTXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkxYjiG2; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516cbf3fd3dso6863225e87.2
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712686619; x=1713291419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwRcEqJdl/aKPcyjjUDw4PrMEBdsdFKPMiKh/b3NCj0=;
        b=NkxYjiG27JOn6YNUPIHrMmshU6ip4pbLatylyNZUeFkgXkhlH68Bz1VUkCcjP5FX06
         meJpageOM9/wIFE9wAJvoA5gqGKBKCLHXOmCOXibTZF0OBYecjOVxFqO8OyPE8yyMPNQ
         X/Qs7wn4AsbjklvKP6RbXBZ6txByD2uLVEG9HHSPDbOPHtgGSlKdCsQMlGq+SoR8MtYS
         c6k7jVa1Nn6RaVk3SrFIaN+/tHXWSMcXV/patllyDu0e0fmXuOYH9IJnuyoS48CFVCrn
         6Blk60SAVKH+ZTT1HQeQlTkTVxEGdGH9BffOZn/FfHuTCV+TF9vaVOo8XGgU9kH7tZFi
         ve6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712686619; x=1713291419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwRcEqJdl/aKPcyjjUDw4PrMEBdsdFKPMiKh/b3NCj0=;
        b=Q8r/hPjXLlC+ZPE3CiUjrh2bxtHuaCk2hyGFEFwhjarR0S7NBrDVtCWd1h+oD4dKhI
         fmMUq2T6BO5dTDbvORDm845jWLcNITdR2z7/zZUCYz9ka7xXvaRcLaQY5fUm0tTvKbRF
         7GJX5koDub9Xv6we84axvYzWXox7GZCR6blB8KgZimknuvK5joyXXHBvKl6FUmw1MpbD
         45H0B7dYBF4NHBurTq03RCKdmfTUyFKP9kV6vbXzsBJ2IqKGsKHgQwWFd3Jo7L0dLv37
         uiTK+8MUe2Ui3jViJWJ8Je1mtK7xRIFCNDgHGA8IXfR/SsMEvJ+rknJAj7qmdrenY/sG
         UEAg==
X-Forwarded-Encrypted: i=1; AJvYcCXt5C0iIL2OjQzLoueuANlzByw4fzEJHaFItHuqcPCn9Ui4DdQLnffhg864YfRmTXJUxog84M/RUp3jkQaTP4Mg3yswWxevbcBKBO4=
X-Gm-Message-State: AOJu0YxOJxF0kusTkWA6YzhrQ+fOeeBwWbkq5QJkwR1JUOmeovh//na5
	jX1v8W6V5I3V8A+Yr6zVCZh1EeO9IIZbcr3A+g7ve42FlYR5WO5AwR2sGNyQU9M=
X-Google-Smtp-Source: AGHT+IFi97DTqvvh7mVWzHxai8ZC6jdD8XWkBMYhCggo9XKB7YbQyLLHUqoq4tjk99obPxsTaf1bQQ==
X-Received: by 2002:a05:6512:2c95:b0:516:c600:64e8 with SMTP id dw21-20020a0565122c9500b00516c60064e8mr200709lfb.1.1712686618619;
        Tue, 09 Apr 2024 11:16:58 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x7-20020ac259c7000000b00516dc765e1esm1276627lfn.267.2024.04.09.11.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 11:16:58 -0700 (PDT)
Message-ID: <bc15138c-211a-4b97-8d64-45d2d11b21e9@linaro.org>
Date: Tue, 9 Apr 2024 20:16:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/19] media: venus: pm_helpers: Add kerneldoc to
 venus_clks_get()
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
 <20230911-topic-mars-v3-3-79f23b81c261@linaro.org>
 <80c0ecb3-1157-1d7a-0829-c3b68b65f17f@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <80c0ecb3-1157-1d7a-0829-c3b68b65f17f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/5/24 10:26, Dikshita Agarwal wrote:
> 
> 
> On 3/27/2024 11:38 PM, Konrad Dybcio wrote:
>> To make it easier to understand the various clock requirements within
>> this driver, add kerneldoc to venus_clk_get() explaining the fluff.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 28 ++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index ac7c83404c6e..cf91f50a33aa 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -23,6 +23,34 @@
>>   
>>   static bool legacy_binding;
>>   
>> +/**
>> + * venus_clks_get() - Get Venus clocks that are not bound to a vcodec
>> + * @core: A pointer to the venus core resource
>> + *
>> + * The Venus block (depending on the generation) can be split into a couple
>> + * of clock domains: one for main logic and one for each video core (0-2 instances).
>> + *
>> + * MSM8916 (and possibly other HFIv1 users) only feature the "main logic"
>> + * domain, so this function is the only kind if clk_get necessary there.
>> + *
>> + * MSM8996 (and other HFIv3 users) feature two video cores, with core0 being
>> + * statically defined a decoder and core1 an encoder, with both having
>> + * their own clock domains.
>> + *
>> + * SDM845 features two video cores, each one of which may or may not be
>> + * subdivided into two encoder/decoder threads.
>> + *
>> + * Other SoCs either feature a single video core (with its own clock domain)
>> + * or one video core and one CVP (Computer Vision Processor) core. In both cases
>> + * we treat it the same way (CVP only happens to live near-by Venus on the SoC).
>> + *
>> + * Due to unfortunate developments in the past, we need to support legacy
> why unfortunate? please re-phrase this.

It's unfortunate because another binding has been created to
represent the same hardware to solve a "problem" that could have
been dealt with using a couple lines of C and that we now need to
carry support for.

Konrad

