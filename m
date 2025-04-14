Return-Path: <linux-media+bounces-30143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B42FA87DA2
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 12:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52EAB165540
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 10:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C76726B2B6;
	Mon, 14 Apr 2025 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kTCW/Sp4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E539D26B2A8
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626372; cv=none; b=CCwnwQk6GX5wKTpMxn9Qy7+2WEGfr2KFoMofYQhq4+ieQ8aLTXCo8u5gD/6b495TLMEXAyZiuV0yX3TSk+yZaNpf5A/iNM6domxZEXkOHNCFhow/0/yPrJN3Kaf09wQxU/YTIXPCAw5u1qJY0nLCNZIcVA62JAm8Qbt/PDv2Iwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626372; c=relaxed/simple;
	bh=axOkP6NTc205XhOa9w7TMVlJ2Ruy5u08gJeU2uxBXGE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FupRg91XpJ5X7q11NYNVOus4cGqLtOlxMVYEJI3MA+pf/b/k1/g9XZMqAwoltw4wBpKGHeVCe/DOHxxv2ELbw0S3J7wHOvJE8QHc+fvTB5q1HyZBOfxEtlbPlsqINqjc1XAnnxL1AXoo/gnSMpVdTtdIvWUfGf4Q7cChRvRw9hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kTCW/Sp4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0782d787so29302385e9.0
        for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744626369; x=1745231169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WAiRw+6AEMtqu5XLeIz/zqxIIUJ+4yNnfRZDXY2auok=;
        b=kTCW/Sp4xkfGdgBLOkHxvnhPuoF8FllcyVkTew7Zr4gKS24HP9qst5DftWUilXqq27
         OBOpZ4X0yWDQG6H/e1xa5NqXtFS2BIpaF38PGYFluRcEBq0VL/vcJhRvOJI5MH6KphgU
         H4cZxTdT0Oi+VBx482CFLRqbeYZG07SlzYf6WiYTKeLEGS96ptEcQ0+N64JDmmGTpIvt
         sm3xCmtcywFZoGVdpNL0vZrWt2OJuoVEVGGRT1GS26ZDPKfg4K4iaH1w1qkqPOfspQPw
         gnXzAeeWT55iyRI/roQHfFu0X4zLiC+zsYjRAWNoKubk+CyJplLhl7FgVvklEYoy43SQ
         UHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626369; x=1745231169;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WAiRw+6AEMtqu5XLeIz/zqxIIUJ+4yNnfRZDXY2auok=;
        b=cz3MGUNYPGMk8yK8uLscgGOriaBxTY4Z39jvpIec3xEGTjASC7SnuxzBZkjhi4Jext
         o8PiSg2kO433Rm+et5SPwU5yWrrZ/SJF3ipz1JNszpCNaQgjTsXsXGiNRQTMe6M2eWOM
         NopA5rz2rYdDsJej0RIH9p1CJZrO56OZQUjjVwEG9f11EQVbVzeXqDMVKLtXkwBuOhV6
         amVByHFfbZzVtHmdZ/0ZdvQkvVp/6F6IrpDfPSFenhEES36UDLJUKvULMef35IBeeWDg
         wxxPkX8q3jKbAWX1s3BzJWjTVGerFe9gkz4FEF2kGWEqp6P+Cmj9uPulvhehrj2sac3L
         00rA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7sP8FQs+IKWZ4DUpZz2jj+m3sFA9A0Surlca+4FZXRZi9MsnjQehbqtsggrG8HNJOAZQHl1nlkBgXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YziqkUVMKjkreLxTAU0y1nvTN7xLLE5TbhTzNdJGz+Iy7K2+CpT
	9Wsx+KMAK9w8q79wkF3QOJieAd/1Ls4AXhaMrpoObXkzz8iAAAEXituwKcgBYJA=
X-Gm-Gg: ASbGncsvQvyRyrrv7nYTOe3vG0q4D0DyTPzBmkbircn9hAhrQB1DUwqfqSR1EnQb23x
	VkfkEPdTC92Ivmm2PWWrleqwqPvfizaybAe670lvRD23DNOSSPEutorTtMQBpFhidl8GoETbigI
	xawr4R+4enauqLhvRqFcjrOsi3nahKyqoqMsuqmwYQKwjx6AME645YXONs7ob3Hh69PX3FhFSm8
	ZISvLGENP3sDip/rDWOIta9NWI2bIVcYfTlXQkV3/QnPejaAg3uajR5+vRAfK5BgpArxiBoP9L1
	5bGIrEZJ3m3+YhV2ysFoJRPif2AGEA21mciv9P/zpIs+nmgu53qxDUszzvZ6CWTGeWnrPesagoj
	kUxwH6rVHIw2L4Pci
X-Google-Smtp-Source: AGHT+IF3yfPKg4s1qCnN4GnM/8MBvLAVhWgFCy6k4OXusWu3X8aq2b3tylwXbrCicC8DSWVM4b6URg==
X-Received: by 2002:a05:6000:2812:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-39eaaea70d6mr6538663f8f.34.1744626369174;
        Mon, 14 Apr 2025 03:26:09 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d6e8sm180459745e9.23.2025.04.14.03.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:26:08 -0700 (PDT)
Message-ID: <137c68d5-36c5-4977-921b-e4b07b22113c@linaro.org>
Date: Mon, 14 Apr 2025 11:26:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] media: iris: Skip destroying internal buffer if not
 dequeued
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-1-acd258778bd6@quicinc.com>
 <811cd70e-dc27-4ce0-b7da-296fa5926f90@linaro.org>
Content-Language: en-US
In-Reply-To: <811cd70e-dc27-4ce0-b7da-296fa5926f90@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/04/2025 13:10, Bryan O'Donoghue wrote:
> On 08/04/2025 16:54, Dikshita Agarwal wrote:
>> Firmware might hold the DPB buffers for reference in case of sequence
>> change, so skip destroying buffers for which QUEUED flag is not removed.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue 
>> internal buffers")
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/ 
>> media/platform/qcom/iris/iris_buffer.c
>> index e5c5a564fcb8..75fe63cc2327 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -396,6 +396,13 @@ int iris_destroy_internal_buffers(struct 
>> iris_inst *inst, u32 plane)
>>       for (i = 0; i < len; i++) {
>>           buffers = &inst->buffers[internal_buf_type[i]];
>>           list_for_each_entry_safe(buf, next, &buffers->list, list) {
>> +            /*
>> +             * skip destroying internal(DPB) buffer if firmware
>> +             * did not return it.
>> +             */
>> +            if (buf->attr & BUF_ATTR_QUEUED)
>> +                continue;
>> +
>>               ret = iris_destroy_internal_buffer(inst, buf);
>>               if (ret)
>>                   return ret;
>>
> 
> iris_destroy_internal_buffers() is called from
> 
> - iris_vdec_streamon_output
> - iris_venc_streamon_output
> - iris_close
> 
> So if we skip releasing the buffer here, when will the memory be released ?
> 
> Particularly the kfree() in iris_destroy_internal_buffer() ?
> 
> iris_close -> iris_destroy_internal_buffers ! -> iris_destroy_buffer
> 
> Is a leak right ?
> 
> ---
> bod

Thinking about this some more, I believe we should have some sort of 
reaping routine.

- The firmware fails to release a buffer, it is up to APSS/Linux
   to run some kind of reaping routine.
   We can debate when is the right time to reset.
   Perhaps instead of ignoring the buffer as you have done here
   we schedule work with a timeout and if the timeout expires then
   this triggers a reset/reap routine.

- Since Linux allocates a buffer on the APSS side, you can't have a
   situation where firmware can indefinitely hold memory.

- APSS is in effect the bus master here since it can assert/deassert
   RESET lines to the firmware, can control regulators and clocks.

So we should have some kind of watchdog logic here.

As alluded to above, what exactly do you do if firmware never returns a 
buffer ? Accept memory leak on the APSS side ?

Rather we should agree when it is appropriate to run a watchdog routine to

1. Timeout firmware not returning a buffer
2. Put the iris/venus hardware into reset
3. Reap leaked memory
4. Restart

I see we have IRQ based watchdog logic but, I don't see that it reaps 
memory.

In any case we should have the ability to reset iris and reclaim/reap 
memory in this type of situation.

Perhaps I'm off on a rant here but, this seems like a problem we should 
address with a more comprehensive solution.

---
bod

