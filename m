Return-Path: <linux-media+bounces-50172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1232BD00277
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 22:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A57A030057E1
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 21:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AEB332ED1;
	Wed,  7 Jan 2026 21:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a5nxX0hI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE528318EC9
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 21:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821067; cv=none; b=RlxX7G/XtPnKg/j/1o0MPErQGmSCE2TEb5zc+Fp9+noui/eXnPI9VuMB15H98SlpwLNJ1N4bAubYp/4g0eok2nyydv4/reVdcQpjs+1XWLYqFg8h/7ffshdpzzT5et/GxWFdlGPTpbhfa6V7oHDA1vuTi/MaOfnh2Kg+lC3feB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821067; c=relaxed/simple;
	bh=xuhPSFxHT5dicps+AzXUc5xZwOnIs5QdImrqvGMjdcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktFXdtWXdh/qOLfupZth6hYXvKm3sWmecd9P3YzI+RTKDtRqp5NRNgQt5CFuXp4eAF0+eceo1QV6x04226nd5K4hi5m4F5rPkbbQCNQC6OIbq72xczrD1Rg7KmjLD7ES1kecH+H2sOdaJDM1F9Ni++Ge/4EeR/JY7c8HxBHGp94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a5nxX0hI; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37b9879f5e2so2811491fa.1
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 13:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767821063; x=1768425863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/TDnZeMqywPB6R9BWNPYGT+EayXhfAhq0K6Z+LpKaw=;
        b=a5nxX0hIAJ7aPbLMg7vlyFUOibQiu4qYt8ZBwnIxOwZ8k9dR7oCCCp1EyKKsSrXeq1
         B11XTAWscz6iDk0WdBAzV369nddJIYyibBLDzoov3b/neArkP+UkFujLlkdyU+m6/gCq
         R0+lKQkQtOBpCx4uokSDMUJroxyBGtPbjy5W7uPjw25NWyG2ze1JlzziWQ8f8n4ts2rJ
         7bLc9ePxZo60ovhicFtEMmvKJfZGxZ/PB+mKPKRMnly6QL9PI/6RxrM0cMxdhjxP2wWS
         4Zqo/NCH3w28WQaKZFr5QufFwkzGyZFjWrwIapHE30F4Ftfr2D0EvTeQLS18OKayaP90
         5Ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767821063; x=1768425863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/TDnZeMqywPB6R9BWNPYGT+EayXhfAhq0K6Z+LpKaw=;
        b=K9OCyEA6WV0f6P+EpWH7iFv+JG8ouGCrj6F1o37zPIQBFCj3zC6Tfp32A9Kszj4Tou
         xqJIG/Dfo0oE1fCxZcZsTAJVDNIEj94HHo40amugWORgFlLTUTPx6hhTqYUQsmfYFho6
         3TDCbIlmHCSNQRGOOK6DkXjl80dM5Cwkk6NHkG2MRY2+OE2gPSYfrE0eerXMHfjCINLX
         UwlPXBPf1arLjeNgMB+1De/Akl6wkMa40eiRqrOf556nAHb3ckzjsPqGwtMuMDD2sTpT
         MBTxnY+ac6XZu5w7a5su2Rzp70dpbRHtb4/2B1GQH1G9srezT7OHj1R/H2wuNS/yUCty
         KFzw==
X-Forwarded-Encrypted: i=1; AJvYcCXCCf7yZ/1J7gsfTx933/Ww9i088HOY1uY03OqPCjPl4Dqx+onVZoFKmBFDKdGHzjiH4FvZxsvQhNgQjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylZw47bFvLswB25QoVGhJLS8LkV9TI6bZrrcvhgGgXP49ZLtK2
	AHLtd1S4t+LCYhW+gpoKXZ2xlTClZ2UHgB+9kzLGYzdvZQenBMRq2Pvu1w7qHmxpcaU=
X-Gm-Gg: AY/fxX7xWyPOVqh+nWwC334NEyRdTqv2uFGwj0VBerDKHCLJEdod+1U4QCoWm5LNEiY
	06yqevFL9G/Voaq8cDEeaCxQI1+A3p7Sl9QIhqUiVThI69Fha8pxU/zXpr32tTSJfFGoOQQFc7+
	vgqIre36fr11MvGjpKm7vkNeFdVxv95N3Xl4uvZU+8dVCCcdWGDBw/dWJxoQCz6IsSMRbaFiyhA
	5BbXV2YaJtl1sv3rTr9YQ+m5L4gNcPtkOfwPq6LxTo9y8PB8epOhp4oPyUIcI8gQKTbxfIUwQiu
	OeBMuMGZGp3jrOyoXP2gJTl3p7mTl9FdERQeqJjg6Mlh4KvG2s3LO2IGEARdoQoU5VLvzxI4Gs+
	i/EDDraQgqJDvlxzI0R508rMQQqhB3HVn8v5EPjqTk8DYH+wPp6Ks24FpeOZVJZgK6aOEbJl52C
	zHO1RYpiWMwFs47ZMF8itg9hKh7Ee/Q7p2U7z+ivxi+yLqa/1zDYDFZJCAigcNrI0j/Q==
X-Google-Smtp-Source: AGHT+IFfcRWxAkywDeN2SZBwl0HWgo5W5lepeGrLd7xnmJgoH3TiNoELSgeJNH2HwayG/aI4gRkMSw==
X-Received: by 2002:a2e:bc15:0:b0:37e:6e31:c9bc with SMTP id 38308e7fff4ca-382ff8256famr6465671fa.8.1767821062911;
        Wed, 07 Jan 2026 13:24:22 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3a0039sm11811641fa.4.2026.01.07.13.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 13:24:21 -0800 (PST)
Message-ID: <6d2a582d-a738-4f1e-97c1-d8ee6d9b0882@linaro.org>
Date: Wed, 7 Jan 2026 23:24:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
 <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
 <f09670ed-1aba-4622-94b2-85ade831f7fa@oss.qualcomm.com>
 <e91414c6-fc89-4b38-a5be-f282c8601b5f@linaro.org>
 <3a8e8327-1a55-4822-885a-86fec029952d@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <3a8e8327-1a55-4822-885a-86fec029952d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/7/26 07:55, Wenmeng Liu wrote:
> On 1/7/2026 1:16 PM, Vladimir Zapolskiy wrote:
>> On 1/7/26 05:05, Wenmeng Liu wrote:
>>> On 1/7/2026 2:23 AM, Dmitry Baryshkov wrote:
>>>> On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
>>>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>>>
>>>>> The Talos EVK board does not include a camera sensor
>>>>> by default, this overlay reflects the possibility of
>>>>> attaching an optional camera sensor.
>>>>> For this reason, the camera sensor configuration is
>>>>> placed in talos-evk-camera.dtso, rather than
>>>>> modifying the base talos-evk.dts.
>>>>>
>>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>>> ---
>>>>>     arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>>>>     arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 +++++++++++++
>>>>> +++++++++++++
>>>>
>>>> Is it possible to attach other sensors? If so, overlay name should
>>>> depicit which sensors are attached (compare this to the RBn boards where
>>>> specifying "vision kit" defines all sensors attached to the device).
>>>
>>> Okay, we previously had a discussion on this. I will rename the file to
>>> talos-evk-camera-imx577.dtso.
>>>
>>
>> Other camera or display .dtso names commonly repeat the name given by
>> the vendor, and the bare minimum is to name it the commit message or in
>> the code. Is it Arducam 12.3MP IMX577 Mini Camera Module or something else?
>>
> 
> I believe that modifications for the sensor do not need to include
> Arducam descriptions, because this DTS is intended to support this
> sensor module. Even if it is replaced with another vendor`s IMX577
> sensor, it should still work.
> 

Most probably yes, if the connector type and its pads are one-to-one equal,
but before such another camera sensor module appears, it makes sense to
mention at least in the commit message the exact type of the sensor module,
which has been tested and supported by your change.

Hopefully, it should not be too complicated to add a line into the commit
message, that the change supports Arducam 12.3MP IMX577 Mini Camera Module.

-- 
Best wishes,
Vladimir

