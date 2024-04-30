Return-Path: <linux-media+bounces-10463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 320148B793D
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 16:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64AC0B22A1D
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 14:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F87917A92F;
	Tue, 30 Apr 2024 14:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="P4xY72de"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F2B17A93D
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714486490; cv=none; b=Je9TFvT9Cr8RCZzVhIVjniuZp4aCF4gigiAnv36h5TCoNq+rQnlWgJ4xqB9HMTmIwiJtnI8A9mhVGmK7tkg6Nxa/uu1U3TNZKrZuArbU0W9jmFYpuryWWvDDwH9LURoB4pYNV4z+5oLkgxg9rf1o4Ge/ZxmyuIitCIMeHgcpamE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714486490; c=relaxed/simple;
	bh=NTGwvE5oTPK+qiXk3TYvQc1vlA1cbXpr4kZtSuS3KHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fefV0YUGyll4p4lWF1Cb7S/z4pG3/7kCaQY3u98LngYQqDMnIhmiA9mpQHW4UbyN3b2mVpL3mebZjH2pWV6w32ea/4eeGaa8yuo35Yx95z9tMIlm0mXmLksZPh6c+PJIRA0qD6GjgzF4HjwmAe3XcFi+IG8mKdRmcFeLIODcv5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=P4xY72de; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41c1b75ca31so18300815e9.2
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714486476; x=1715091276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuJcMbRLUf82KUepIk3TKbpGuDateTsBvHpdeo4lhoI=;
        b=P4xY72deNjVVS7ep4BrZDZDyA6HVMHfAZIcQj2/rnZJrH2NrxfI/Bfr0wBGU5EJCB+
         yuNSZZEH0d/49yex4ngCqoQMAlImIe/mbkkdb18ymKJp6s5TQKEwKD95gHVgNsKv9BRE
         QdjXkQsKi2+thDYKk915sqn69DEQJEbWCrDbCpfQTpaZzoDlFmowwjE0u0tlV4Udm/Fb
         dVccPFl0WjCsvYGMm+XH5OwtJvxi9/i2KUtqFnRqyoBgcgRV+ovg51waH+1Fw/7PnlT9
         WRvd5Lkpp/2/IinSmD6cyetxTfpdG4wN404zDTMykz8lxp9USNz6nz+3EPEHtAmXbf7j
         foXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714486476; x=1715091276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuJcMbRLUf82KUepIk3TKbpGuDateTsBvHpdeo4lhoI=;
        b=VxDnXqyIBcY49h0mg5bsiWDudYQBL9ivut+Gv/z5dK6q+WM+JaRIjw+GB6haCaYYoA
         H0WSqdnpDZZZgrka/0QxBMD5xwga9YXTQD9VJay2jcNfUiM1xPGWgNrRc1b1KpEpQjod
         7otQWq8EOfY30D3jrqAXl3iAtbsspNNYKry80j1Q3+bGs5WWZWYYSaYdF5HCq7IMQUbk
         ZBySa6IoR+SqZS6k6elR46g4UpNtFlPYp2vpy9Mn6ekA8ABWbZrqlbjBW//8a/Ax3A3C
         +0AqnF/Fb8zAZGjWwwa80vvfwhK7EzUACSzvUrhg5EaXRNROTwDZ5ToBU2+FU0UctQlE
         w76w==
X-Forwarded-Encrypted: i=1; AJvYcCX+u/GO+6lPq94mhXYfdRwZokP3lDiweF0ysKPGZ2nFDsfgwDw2ObFrvCRnRYb++gWJxGr8JJF2OJkcnzJSLRMDuTR+wYkD0ljA9Cg=
X-Gm-Message-State: AOJu0YxouyOu5NIane15lp1U0OIaCq8ZYShTuMAvMFWBADQYVkGKbyVd
	B3mzhb6QKFeiGPNMGCEfztLxJ20+LW/5XYXKbyCLnXUtlsec1mPW/ST2lay4PCg=
X-Google-Smtp-Source: AGHT+IFSKfcPM3rOfZybfP+Et3c+Dhy8Xi6uL2xbCb0wZeTmqyvosgGFBcPatPn7+KZSJ7rK2K+kNQ==
X-Received: by 2002:a05:600c:314a:b0:418:fb6f:5f59 with SMTP id h10-20020a05600c314a00b00418fb6f5f59mr12386080wmo.2.1714486476081;
        Tue, 30 Apr 2024 07:14:36 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600c4f0200b0041be78ae1f0sm12292455wmq.2.2024.04.30.07.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 07:14:35 -0700 (PDT)
Message-ID: <b206f776-f402-43b0-8db3-1b16474b3bc8@freebox.fr>
Date: Tue, 30 Apr 2024 16:14:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] media: venus: add MSM8998 support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
 <31072144-8880-483f-880b-8c8ca73b2003@freebox.fr>
 <c805843b-041c-4546-8bf8-ce2a0c71a470@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <c805843b-041c-4546-8bf8-ce2a0c71a470@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2024 01:19, Bryan O'Donoghue wrote:

> On 29/04/2024 17:19, Marc Gonzalez wrote:
>
>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>
>> Add the missing bits for MSM8998 support.
>>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>   drivers/media/platform/qcom/venus/core.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index ce206b7097541..42e0c580e093d 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -587,6 +587,47 @@ static const struct venus_resources msm8996_res = {
>>   	.fwname = "qcom/venus-4.2/venus.mbn",
>>   };
>>   
>> +static const struct freq_tbl msm8998_freq_table[] = {
>> +	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
>> +	{  972000, 520000000 },	/* 4k UHD @ 30 */
>> +	{  489600, 346666667 },	/* 1080p @ 60 */
>> +	{  244800, 150000000 },	/* 1080p @ 30 */
>> +	{  108000,  75000000 },	/* 720p @ 30 */
>> +};
>> +
>> +/*
>> + * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
> 
> Nice touch.
> 
> Does encoding/decoding work on -next sans interconnect support ? I think 
> we discussed on IRC it does but I'll ask again just to confirm.

(We have no use-case for encoding.)
Decoding works, of course.
I would not submit a broken feature :)

(vp9 2560x1440 59.940fps) decodes at x2  (122s for 240s)
(vp9  854x480  29.970fps) decodes at x15 ( 16s for 240s)

I find the performance quite decent.
Though I would have expected a larger performance ratio:
2560x1440 59.940fps = 221 Mpixel/s
 854x480  29.970fps =  12 Mpixel/s

If 1440p decodes at x2, 480p should decode at x30 ?
Or maybe the bottleneck is elsewhere :)

Regards


