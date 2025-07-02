Return-Path: <linux-media+bounces-36609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B13AF5D4E
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EF5844480E
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123ED301138;
	Wed,  2 Jul 2025 15:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hV4hAe1F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BD72459D7
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 15:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470315; cv=none; b=Q060OQCHEgDpph3o6thjtcTzBDFwqCsrx7GobSzCCKBwXUQshy2MEYtBNjmkvl1SZc5olSLyCcZe+Xuo+i8/pZxtZ5x15iEWZ5XTO/uIyFSboX7raX5dG0bZZ1RyBA6leNDdtnnkI2axr85mG7wjbLg4iqoAN/VUc6o8+n3zOk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470315; c=relaxed/simple;
	bh=/1kRWoC2EsLIFEi+ZoNxnFy6k7VTG3sy3RXoHv/e3nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hWiKh2EE8FCYabMmATQQf2rlLdbW5D9rUD+3xN8sNCmrsXp7uLKgHfyzT7uJgjb8zY70ilFrjLSDxsapGithkMkAPzA8EQf2fJnHTvmCw7WqWswmj+8zCFgYJl1jfzyr4VOgGKeBPPN2sQIwQjTMShYuAl9dnrGIE/kZHVTaheE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hV4hAe1F; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e62619afso810899f8f.1
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751470310; x=1752075110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LS59bh+aYEEoA2xZkY56WfoUxH9ABdUpUJ8WT1B/mAs=;
        b=hV4hAe1FHqB9kXnKN3sHLNfDx8lxk36b8xdKs045h+9NYQcRUe/FVQsX/V9sLK2yHf
         j4KGYKCQYH1TYRudRJnuq0zHRnyfVLFOkihBi6ChiyCyV+CUPcGtsZkEQ/MKIPd+PdQ8
         FXiWkvzuGGFa/nynbx/PItp6bZEHgj1V8sfoKVe3mWmMb4XfhrY01iMrqqc57z4S6Udf
         HYkl7FHXuSp/Xhs8IlxTXL2WK7KAafJT449dnGfI2AIV04mWoZCPAfcEcwg9P7J+U7hH
         HBgNlL66JxdLaPkjCG1tozXNrjxuR/+rX7fS2ZMtqH6W9oKwj+NhEPmoNvoTCO6KaFmC
         39cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470310; x=1752075110;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LS59bh+aYEEoA2xZkY56WfoUxH9ABdUpUJ8WT1B/mAs=;
        b=u1cbDdpvWUQewV2/sXq/y/joPH3XmIZWdh/EIaIxYGuPPdyQIEhKoNrOKLxAIDpkg8
         0JYs9Z3wOcxzXqEz33P0GNqGa1d4vS8+gy8+K9JSx8igquFlHt/PaPWMYtwj624S4ygi
         lH33t6BZCw1KkL5eMcojj1CjnfuG4xfOO2hpiDu5QNbsEqIEoaFGzjBbo4pa6+ml9Wyd
         HkWk/yfUCvQsl+69Kko6QjzH0/4V0zjR8nOhER0bVrkvNpeXgs26mptEwYWJBe3NSma8
         xbvLk45y4YiVoTLxYRzkUdttTMIQEtHxTpWayi2pU/dn5w7rTkOmvGp5jpwDIfrsduKl
         fLSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRpi3OoDxN2OuKFNDxJeocS8s7VpkD0lO8C2aYO8z0IWhdT/GaDy2Hr/x4hrPvFnGdcjhpRSP3dONytg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2+MSEc1IgguVcT1IAXW03tFceNqxWubnoUd8pZpUqujb0HwXL
	+PfzVhsOhcmzveS6TTfGprRxqnhVYhTPLrkzuZzm8olzLhR1BsuouW5Avxl3O6GHOWc=
X-Gm-Gg: ASbGncs7rsacO9wG+PVC8TXjBOIVAVl7jgoxbp9/UGwM6yR93xEAp6MC7sdtbs6S2NO
	LI/LSxXgip6kyY+31ds95bJcGn9bCxN9KMUzH/sfTjjh1M07jsPTjkrBcUUnet1WxedsUTkHIDd
	pkRSCsLXwr1Ru+giE6pCZShGCpM+QNlbIrJ9s5LAMNHQ7b/x5gyzqf1/AlI0UDJRiVxCXrzBy1a
	x3sGReKnHMsBJhoFAw5ACP6RJA1uZbwJW42mVWZ8iNLAsQrsk/VjC1N2b+pOsLaAk/EQ1gTijT9
	JsdbyXLfps4glEcVE7yOpTQOd5Tv35WC99Wwtyqp8zDNSRslJLMIFRvKj2tTSy/UCpeo/V4Yvtk
	Zu/8Msg==
X-Google-Smtp-Source: AGHT+IES6iUbDyize6ToIJZ0dWMNbjtXPFT0gpuS9it5XKMDA3ArL2EKriSzAXWLW85soefAH74ZZQ==
X-Received: by 2002:a5d:5f52:0:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3b1fb064480mr1055958f8f.0.1751470310428;
        Wed, 02 Jul 2025 08:31:50 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c8esm16506660f8f.55.2025.07.02.08.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:31:49 -0700 (PDT)
Message-ID: <246f847a-df24-48a5-ae8c-97fba7f5b3cf@linaro.org>
Date: Wed, 2 Jul 2025 17:31:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Be explicit in naming of VPU2 power off
 handlers
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
 <dd5717a7-9476-4207-967f-a30e7cb3b3e7@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <dd5717a7-9476-4207-967f-a30e7cb3b3e7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2025 17:07, Bryan O'Donoghue wrote:
>>   {
>>   	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
>>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> index 93b7fa27be3b..8f63f243dd0d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> @@ -24,8 +24,8 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
>>   int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>>   int iris_vpu_prepare_pc(struct iris_core *core);
>>   int iris_vpu_power_on(struct iris_core *core);
>> -int iris_vpu_power_off_controller(struct iris_core *core);
>> -void iris_vpu_power_off_hw(struct iris_core *core);
>> +int iris_vpu2_power_off_controller(struct iris_core *core);
>> +void iris_vpu2_power_off_hw(struct iris_core *core);
>>   void iris_vpu_power_off(struct iris_core *core);
>>   
>>   #endif
> 
> I prefer these names with an explicit v2 more logical/consistent with 
> the hw names.
> 
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Thanks.

I got some patchwork complains, so it seems I missed something which
clang did not catch. There will be a v2.


Best regards,
Krzysztof

