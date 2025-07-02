Return-Path: <linux-media+bounces-36596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B98AF5A7B
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 16:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC01948672F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 14:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5165C285418;
	Wed,  2 Jul 2025 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nuvy+jWH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0217C275AFF
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465189; cv=none; b=hJqXXJr4+uWDFUKt5pcwzuO+W6bGjF+oeBG8gmIc+08LO5sdXqLY41NyxVpcgSncb6XFX3CfIJ5y4S/AA9qZ/grJbVT81yIZsO7hMjy0RsEGzZhd8gNwD55bCoXUCjsAvtkF6D0x9oew51a149np7IUvtC/3SVGKF8886L630Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465189; c=relaxed/simple;
	bh=EFSNNOQndvGvCcYvKgWAYJ17t/S6vVQEGqmPrK/aRss=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Qtdmdzfp6maAtg/KEqICeVvJvO9qErq373RWH8qU/cexfY97la5ejDUTE11jydf8qYw6CLT60jbobaavjFd8AB167Ja6mHvr3Ly5JAPhqkwtbOFA67QjEASSFQtuktJALB2WVI7f18+zZ+BwfPbnfHjb8L2O20OavSDVoL6mG6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nuvy+jWH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a577f164c8so942989f8f.2
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751465186; x=1752069986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rCiA90hTUctDSUZs3tArhKn0CSZuzbxFnHheUaEfGU0=;
        b=nuvy+jWHW65/45shkiOLpxVmpaX+Ye+bXU3qxoDP/brdV5KEKED11bmldjDxtgFp3s
         JGE5QoQOeEJzegibPDT7TE45gXA/4YysQ6rG2pW8iy20OD/xS0oY7NMYRFIaQIxlXy7m
         U8FjUIUqISyKl2G3fS0OVoLtv4v5mhsJUTSH3VaLCSicVWFdh1oFQjwo3zYRD2WEHyvE
         nzaMdcHYzo9T7DXvZTMtvanAmcZpNyzhCuOWYftQrT4GkQ5oAunPuKZsP5onO9el4uJX
         u84EXG3k+HHGUTC/iYXQQYJ0xS2nT/CtZ36BTyx06HQ/a6Pty/uestLsXELECviG6OJx
         gd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465186; x=1752069986;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rCiA90hTUctDSUZs3tArhKn0CSZuzbxFnHheUaEfGU0=;
        b=MIOEzkXZy/Llj2AHJ0uCqf15aHKSYAoU155rnsV2aLH1J7kOUpMzhBwHRAONfsReSQ
         JkfKAYiusZlmdzgIHoJL6ILEr+CbvO1EVWKpJytGiTzoXioCgb4Z+RXSi8+lztB8i1w6
         pP6h4DvFT3DqloTwdBcj44h0k1vIMLESMhA80f3pRgeDUfwSTc3r8y4NIEX9HEW4GJeH
         wql8mOFF7Un5ddA0CL8nQtyRTeeGtKSf4ZpB57RRQ/ZYi9ZuUQ6KiYEpe1BrUEu7FQT8
         evld+IGxLhyMfoxEirnshCJ9ggSEPtbCmIK/v3MnwEj+hbPrXCBIeM/T9nAQbIemqC12
         r5IA==
X-Forwarded-Encrypted: i=1; AJvYcCWblps0O5TFm9mG0Ya+7HvPdMtPM11mFdtXwK6kRDK5UPkGm40qbdVYJLVMKTCS/I999pPB+amkZMyNug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG6e1kQojU769Je1k7T29PTeSE7F8lr9mRY967LiYuE2S8toeh
	pKQpZOfBeK4IUgwfpZCDyd4iKXRp3hkgxKRdQ25VqXi5x5m+0ysfSx/TkDuqwrXnE4E=
X-Gm-Gg: ASbGncso3dM7Vgeru3T9o28JaR+cKQnpCSgwwqKwuEzNXIkAwzqk14kOWth7GLj6A7z
	FM7kiceSRgIZ3KtJsH4kS2HcQB4OybwtWuV86dEtFt4EUf8YnMBObQ2iZdPBMdESzxnWPgniW4M
	b1mSaEoy9PLuBylNcq4DtUePj9gUU1/9Iu6YxRSGTPKI0VCMNmUIFDHZpGOQ7Uge6MHMnan5tPu
	pEgzd9AKK0Ls8cFM41fQ1vnI/Nuvn5NIWNjHfMZzPauUvd5+thL8CL8jfgRjoTlEKX75Tfte4at
	7TUy/ET5ZKiA/HGGT1z7rSfMoejCHEEvJUZBOBRk5tGr7y+XnaTMeY399LRuczqAaR+m8mTufK7
	tgpiaAA==
X-Google-Smtp-Source: AGHT+IGxl6POoWUHGZRhEOjgzGDI7etKdUi/7xVqrIdH8pMKVPY188NE/odw4IuUPPWo5M//XpSEpg==
X-Received: by 2002:a05:6000:2086:b0:3a4:d6ed:8e28 with SMTP id ffacd0b85a97d-3b1fe6b71cdmr916283f8f.8.1751465186130;
        Wed, 02 Jul 2025 07:06:26 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ba553sm224912215e9.31.2025.07.02.07.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:06:25 -0700 (PDT)
Message-ID: <9d834444-8dab-4e3f-987b-e1d6d615f61d@linaro.org>
Date: Wed, 2 Jul 2025 16:06:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Be explicit in naming of VPU2 power off
 handlers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
 <803adfad-a601-4d65-b877-e8ec10969698@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <803adfad-a601-4d65-b877-e8ec10969698@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/07/2025 16:02, Konrad Dybcio wrote:
> On 7/2/25 3:42 PM, Krzysztof Kozlowski wrote:
>> Driver implements different callbacks for power off hardware
>> (.power_off_hw) and power off controller (.power_off_controller):
>>
>>  - iris_vpu_power_off_hw + iris_vpu_power_off_controller,
>>  - iris_vpu3_power_off_hardware,
>>  - iris_vpu33_power_off_hardware + iris_vpu33_power_off_controller,
>>
>> The first group (iris_vpu_power_off_hw() and
>> iris_vpu_power_off_controller()) is used on older VPU2 designs but also
>> called from newer ones: iris_vpu3_power_off_hardware() calls
>> iris_vpu_power_off_controller().
>>
>> In the same time there is wrapper iris_vpu_power_off() which calls
>> respective callbacks (the VPU2, VPU3 etc).
>>
>> Let's make it more obvious which function is a generic wrapper over
>> specific VPU/platform callbacks (iris_vpu_power_off()) and which one is
>> the callback by adding "2" to callbacks used on VPU2.  No functional
>> changes.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> [...]
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 9b7c9a1495ee..a2c8a1650153 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -104,7 +104,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>  
>>  disable_power:
>> -	iris_vpu_power_off_hw(core);
>> +	iris_vpu2_power_off_hw(core);
>>  }
>>  
>>  static void iris_vpu33_power_off_hardware(struct iris_core *core)
>> @@ -142,7 +142,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>  
>>  disable_power:
>> -	iris_vpu_power_off_hw(core);
>> +	iris_vpu2_power_off_hw(core);
>>  }
> 
> I don't really like how v3 calls v2 ops internally.. and there's
> nothing really vpu2-specific about what the function does.
> Maybe something along the lines of "iris_disable_resources"?

Context: sm8750 comes with more resources, so it will come with vpu35
doing this differently.

That's why any generic name (non platform specific) is misleading IMO.
This is really disabling/power off for the VPU2, 3 and 3.3. Not newer,
at least after initial look at SM8750.

Best regards,
Krzysztof

