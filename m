Return-Path: <linux-media+bounces-24233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62768A00AD5
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2025 15:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3159A163B06
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2025 14:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CADF1FA832;
	Fri,  3 Jan 2025 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T6Ow8DXb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D361FA24E
	for <linux-media@vger.kernel.org>; Fri,  3 Jan 2025 14:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735915709; cv=none; b=O+p98vtM3Rulxj85pV8Pni/R/lL455K3Ck/V0LqT54s8lQ0+CcNPqePGj5opB8nWcT103wjHbKMeQsqyaCo0gOIy0a/TMKkF/fCfF7Ydp8ye7bFRZ44IZKL8jt3M67dJf1fSCWycTNtTEz1NcsvhYi4ji4/MYHfEavNOCZMozIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735915709; c=relaxed/simple;
	bh=ARy/vXlaj5ReptwJhzWJ7HDJ7nhAj5kDO9HT4W3uHqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVSaGu/oHF2VexyeEEwHr8e1XdUYkkpL1SbiJzGgxarQl+6pPmkDvwt2Y4MzkgBD0E2gyGG7WVkfLffQ6frG9ds0PCI1elxRtzEdQymCfitY0w+Rkux6RGVSraNS50Q3IIoWNa+KW2kDM+zyhZSRbdDBlPxAWlom5UVhlToVoOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T6Ow8DXb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43618283d48so89635825e9.1
        for <linux-media@vger.kernel.org>; Fri, 03 Jan 2025 06:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735915705; x=1736520505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yoqiwu0ZPISAmlNURS49rP/IFDhT/w9s1QlaAD1nD1w=;
        b=T6Ow8DXbSnTp9usPLpcXy71f8IgIcgLf56e3wn7HUCYnnKgbuUTk2cwgRA0ofHKfQJ
         5+BsxDVNCdJ32wJZDTer2ZFiE6LM7tzoK3kD3yxlj/Q2g9T6eZ30YhULSFQrrRkOiAJ0
         R62bbRo8vpcjLRmIt03cPV8k4YuTw+EqO+R8ekBB/x/KnolE4T5JAqlIy4hdVylY5pU9
         THi0Y+ntV/+GMHFtYGrMrLSXJbFHlVRSVbyS4OIO3bjCXjfjfgsN+QceNp+Ldnx/38YC
         Mk6hiqwzq2Dj+DPYJu62/wk9DhQqieHO3uC8H2LcdDbTldd6DpJRubqgA7B35tyVUQKv
         yNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735915705; x=1736520505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yoqiwu0ZPISAmlNURS49rP/IFDhT/w9s1QlaAD1nD1w=;
        b=jzOw8EHiW6Mes83d2/v92mq6XadFzWOBDkroM/jSGV2L5gk6WmdkoHm1JzDXl5/SHD
         KnW0wBVNhyKCVpZSQigR8wBv99sWxnvAZjx5x3kw198Q35FR/c8M08Ouw+3raQsbs/iD
         CC9R4pOdR3eHoqH1xLnWEN6uAgbKFDGqc0wgolVfDJxt+tmn+EoYmxFDjcmeguYx6zco
         aHyiL4cz5Dwl5Gx7Yzd2jvaud/0RxLftnVmE7f0bt6xcfNe8LsiBwexhaY/UFlUx09bP
         +Cuq/fJIWY0sQD5ABCV9BRHULJDgTPooHSodklpFhPM6hFEhVBNrvZh703mQGA+Nn1HF
         0dDw==
X-Forwarded-Encrypted: i=1; AJvYcCWlZO/AL21I4PcHoRGilNftwlB/NbgLspIKTjw+6rbVmX9tSYNtCw383wDuqTF4XBZt7X9mdafVT69ZSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdQmzRMSSyOZBIWPpxYqEly6ROIrUwi2RdS4cXdm1oPdEx9+Q4
	ro7FWxyEvmt0Kt6jBEVQ+kQGyrZXuPDKrRayAP77dcTPBo4mQEHXztDZTQHbk59eIH3eEuvspj0
	0
X-Gm-Gg: ASbGncvP7gwGv09Mx1v4t9hzrG+QTqagePl0PgVpcAZw/A+Akht5gQs5TjKs97ETKXr
	Kz5STyYrEgYRPoWF12ws8J23qKUs9agNBf0+fo6k0lz9Kd7fAJqWpRxOSlQC9EqHJ36XUONJfPv
	8RP45WRYU9KXilzp2aM0cTNHXsDQbh5xIohYo2FyYPReHDfdyZqvYGBvF6xgyLyfO/SAplhE/Uh
	DWD7DKq0M1kT6oWdVeSnyAeuyaNekmU5oG9uzL7/q4sXbcvEM+4ob0A3mG9MmcrdSmXBw==
X-Google-Smtp-Source: AGHT+IGfednntDvu6ZXrObE1Cj/rDH9xIbJPG+EOjHXzT3RtNhQEXlwqANJ26bIHkmmk2a7qppbxug==
X-Received: by 2002:a05:600c:3b02:b0:434:f609:1af7 with SMTP id 5b1f17b1804b1-43668547462mr416110305e9.4.1735915704896;
        Fri, 03 Jan 2025 06:48:24 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119b6sm523254265e9.22.2025.01.03.06.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 06:48:24 -0800 (PST)
Message-ID: <3e3136e5-cb59-45a8-8bd3-43bf401c14cb@linaro.org>
Date: Fri, 3 Jan 2025 14:48:23 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-5-quic_vikramsa@quicinc.com>
 <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
 <99cf5f7e-43f6-4ac4-a4a2-dc731b695572@oss.qualcomm.com>
 <c7253f5f-eb4a-4636-b0f9-7d284a2f5a8d@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c7253f5f-eb4a-4636-b0f9-7d284a2f5a8d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/12/2024 19:32, Vladimir Zapolskiy wrote:
>>>> +        rst-pins {
>>>> +            pins = "gpio78";
>>>> +            function = "gpio";
>>>> +            drive-strength = <2>;
>>>> +            bias-pull-down;
>>>> +            output-low;
>>>> +        };
>>>
>>> I have doubts that it's proper to embed a reset gpio into driver's
>>> pinctrl suspend/resume power management.
>>>
>>> Konrad, can you please confirm that it's really accepted?
>>>
>>> I'd rather ask to remove this reset pin control.
>>
>> There's certainly some appearances of this in the tree.
>>
>> You could make the argument that it makes sense to prevent 
>> misconfiguration
>> (i.e. the bootloader may set the pin in input mode), but then the counter
>> argument is that the (Linux) gpiod APIs request OUT_LOW/HIGH, and we 
>> would
>> expect that the driver uses that if the GPIO is requested through
>> e.g. reset-gpios.
>>
>> I'm not particularly sure what to recommend here. Krzysztof?
>>
> 
> I'm worried by a possibility that a device reset/shutdown control GPIO 
> could
> be turned off by entering the "sleep" pinctrl setup. If a particular 
> GPIO/pin
> is off, is it still continuously functional as a control GPIO of some 
> device?
> I believe it is not anymore in general, this is my concern here.

I agree for this particular case that rst-pin should be excised.

- RST is an active low signal, which is typically _pulsed_ for a period
   when the sensor is powered to trigger a reset in the state machine of
   the sensor

- What is the use-case of pulling RST down the GPIO in suspend ?
   I'd remove the output-low though it should make no difference as
   the sensor regulators will be off.

- MCLK I think should have a suspend state specified or at least
   I can't think of a good reason right now why what I see here is wrong.

For the default state this patch disables the GPIO pull down bias, which 
to me seems logical and correct.

TBH I don't have a big concern about the RST pin in reset because the 
regulators will be off.

---
bod

