Return-Path: <linux-media+bounces-27339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E46A4C3F1
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C011E3A65E9
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 14:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0BB214210;
	Mon,  3 Mar 2025 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PN2MtFey"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879E020FA9D
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741013783; cv=none; b=QBfFpHmNNhN+4LfR0k/FctjVLsIti1COTXO4NaY3eTjFmaXMtaVTiivpK62fVT3xNhUJuQgPvxTDbQXMuZSPDrV7H4/NGP1SqL2n+b6RNMGrm0dzS3p2yfdpvc6Ju4nhqW4qbfJp6l3jZg6aAo765linAFlYwTSN2I90lknblMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741013783; c=relaxed/simple;
	bh=lSFrNOYTs2ebMzVPy9mCvDUTf4C+oW1azbWapwfMyGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bA3BQtbqWrkCZI5xe0uoRjfc0n+vweRb4MQPm7SJwxjb59PSxjVm4T+nKGoTySsPViv5MZ9dTVZ22iVXCMPkmnp7VP2Xyu+8l6cnd/k56quLyWGYCY7tjuKEz1UjUAVdKNW4hcWJSPhQJqhui3eeAPdof3wP7MHHQvaDdcTm8yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PN2MtFey; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4398e3dfc66so41010835e9.0
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 06:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741013778; x=1741618578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RbOOxP9Odw79YNeXSBNNWZeLoIIK9XfazEkCOs3S38s=;
        b=PN2MtFeyRN/2FOiMZ6eTv/AGsaMove3HE7zZUKXhBJ0/1vwVyRDDnLEef2OAyN8m1d
         TSBfhb05CX93ElJAGvJGvv1MHxzujTOHjT9CBkxJjVRpqSqzosEJbBtctB01r2ox4QEx
         84PTq9NhcCN1cwzE2E54PMzUO0A36Z1tqyicgKDu4GyCiDJcxKvxfI3dMt3ubo66H7Cl
         rdOeg7vgk1fBlVmnANXsyHwyqJuJdRi8XqUJRSuHTgvBVYvJzqBoXJXGhrS6pJtr0wUt
         KKI9yEZmP7wIIzGbhpYGIY9+aktBvF1WuUbk80hEbzTQ8Xrd+LoL8H9aok+Sjec0z9uw
         qjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741013778; x=1741618578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbOOxP9Odw79YNeXSBNNWZeLoIIK9XfazEkCOs3S38s=;
        b=XW1QISubFg0yqTPRXrtuIY9mAYylxmqjWIyUcOO4DnEOjbNJOe3sVUM6eMlXuMZ0D9
         LHtx52V+SVhySbvoGgDefwzKiVZvbmo6AQnRbl1AlNHTaCqL5BmuFAnlJTJGwFL8ochX
         9Hd3+ohTkDzVlmb8ixy8wP/E/lY23gon1MWu9ar7nNLLPFYc2zC0HX2XaSttizk27K4o
         YXLJtn7wd1nDL7Yrf367zVOX2Ha6WG79kNymbMpTL4/8c0+B3fA9JGeF7PkABuBMwBst
         iuEDjIAVSHzPAOTmpfJ93AQDG33HB+17wGnji09bWpMVDuLGY9IisByU3Wugxd7Z4PFD
         NjwQ==
X-Gm-Message-State: AOJu0YxCkQ2ECtD1q2JnuhQkLesxqwNY4U8Ud4OzpZ3rp290zZK94lkM
	zJiaqHbUrJDUjDqs//DMK1KhQrLsjLkehm8/QNkvJKvIi2vPLIfEqmhmqx7IyHk=
X-Gm-Gg: ASbGncuWnmGQ0LLRpidgwsSNq9/+u2GfouYPUDkqJIorABuR1dwlblm2pwE639loSAk
	tlCawjtbFiaKVwvaVzXspFe3GqGsFKoKLZajDBQE/osAhlqVNwZcdz46h+CDAAj70gtzDthdxYZ
	4CTtTsMdup/sNwdnt5UapigBKuUz5PbEWTkN3KpGWVT2YM4mHHsA9zvT0QPdv61WOd3mRAzq7/Y
	ji9K5jMpfE+7BwAdXPipOOJhkPWQEv4xBua2AO6ohK2njV82qkaOx142bwxO0V9pu435kMIwKj7
	qzpdeNuxsiH1N0aEFTfN1Sg2Q/0JeqrvBYP48fjg5zL+2fhEmPy3Ubxk5KyKZuGVMSipdyoQnEY
	G00MlyxfIHw==
X-Google-Smtp-Source: AGHT+IHQTE8UgpNl0+iqYndm1kEDyeG8ZC6z7YUg02JZH40XU0wlpeVtikbYwt+M3QrfOEWZgq6wSw==
X-Received: by 2002:a05:600c:3146:b0:439:8c6d:7ad9 with SMTP id 5b1f17b1804b1-43bb453dedcmr61168635e9.31.1741013777738;
        Mon, 03 Mar 2025 06:56:17 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab2ee361dsm137795585e9.0.2025.03.03.06.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 06:56:17 -0800 (PST)
Message-ID: <2ac68f21-cea8-400c-8a61-3638e545bac8@linaro.org>
Date: Mon, 3 Mar 2025 14:56:16 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] venus driver fixes to avoid possible OOB read
 access
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Vedang Nagar <quic_vnagar@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
 <c3b27e55-f627-417c-bb62-3189f248fb99@linaro.org>
 <7bf1aeaa-e1bd-412b-90fc-eda30b5f5b37@quicinc.com>
 <19109672-2856-457f-b1f6-305abc6c4434@linaro.org>
 <ba1e7a20-2f68-15e0-bc4a-fe52bc4036cc@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ba1e7a20-2f68-15e0-bc4a-fe52bc4036cc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/03/2025 13:12, Vikash Garodia wrote:
> 
> On 3/2/2025 9:26 PM, Bryan O'Donoghue wrote:
>> On 02/03/2025 11:58, Vedang Nagar wrote:
>>>>
>>>> The basic question : what is the lifetime of the data from RX interrupt to
>>>> consumption by another system agent, DSP, userspace, whatever ?
>>> As mentioned in [1], With the regular firmware, after RX interrupt the data
>>> can be considered as valid until next interrupt is raised, but with the rouge
>>> firmware, data can get invalid during the second read and our intention is to
>>> avoid out of bound access read because of such issues.
>>
>> This is definitely the part I don't compute.
>>
>> 1. RX interrupt
>> 2. Frame#0 Some amount of time data is always valid
> This is not correct. Its not the amount of time which determines the validity of
> the data, its the possibility of rogue firmware which, if incase, puts up the
> date in shared queue, would always be invalid, irrespective of time.
> 
>> 3. RX interrupt - new data
>> 4. Frame#1 new data delivered into a buffer
>>
>> Are you describing a case between RX interrupts 1-3 or a case after 1-4?
>>
>> Why do we need to write code for rouge firmware anyway ?
> It is a way to prevent any possibility of OOB, similar to how any API does check
> for validity of any arguments passed to it, prior to processing.
>>
>> And the real question - if the data can be invalidated in the 1-3 window above
>> when is the safe time to snapshot that data ?
>>
>> We seem to have alot of submissions to deal with 'rouge' firmware without I
>> think properly describing the problem of the _expected_ data lifetime.
>>
>> So
>>
>> a) What is the expected data lifetime of an RX buffer between one
>>     RX IRQ and the next ?
>>     I hope the answer to this is - APSS owns the buffer.
>>     This is BTW usually the case in these types of asymmetric setups
>>     with a flag or some other kind of semaphore that indicates which
>>     side of the data-exchange owns the buffer.
>>
>> b) In this rouge - buggy - firmware case what is the scope of the
>>     potential race condition ?
>>
>>     What I'd really like to know here is why we have to seemingly
>>     memcpy() again and again in seemingly incongrous and not
>>     immediately obvious places in the code.
>>
>>     Would we not be better advised to do a memcpy() of the entire
>>     RX frame in the RX IRQ handler path if as you appear to me
>>     suggesting - the firmware can "race" with the APSS
>>     i.e. the data-buffer ownership flag either doesn't work
>>     or isn't respected by one side in the data-exchange.
>>
>> Can we please have a detailed description of the race condition here ?
> Below is the report which the reporter reported leading to OOB, let me know if
> you are unable to deduce the trail leading to OOB here.
> 
> OOB read issue is in function event_seq_changed, please reference below code
> snippet:
> 
> Buggy code snippet:
> 
> static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
>          struct hfi_msg_event_notify_pkt *pkt)
> ...
> num_properties_changed = pkt->event_data2; //num_properties_changed is from
> message and is not validated.
> ...
> data_ptr = (u8 *)&pkt->ext_event_data[0];
> do {
>   ptype = *((u32 *)data_ptr);
>   switch (ptype) {
>   case HFI_PROPERTY_PARAM_FRAME_SIZE:
>    data_ptr += sizeof(u32);
>    frame_sz = (struct hfi_framesize *)data_ptr;
>    event.width = frame_sz->width;
> ...
>   }
>   num_properties_changed--;
> } while (num_properties_changed > 0);
> ```
> There is no validation against `num_properties_changed = pkt->event_data2`, so
> OOB read occurs.
>>
>> I don't doubt the new memcpy() makes sense to you but without this detailed
>> understanding of the underlying problem its virtually impossible to debate the
>> appropriate remediation - perhaps this patch you've submitted - or some other
>> solution.
>>
>> Sorry to dig into my trench here but, way more detail is needed.
>>
>>> [1]: https://lore.kernel.org/lkml/4cfc1fe1-2fab-4256-9ce2-
>>> b4a0aad1069e@linaro.org/T/#m5f1737b16e68f8b8fc1d75517356b6566d0ec619
>>>>
>>>> Why is it in this small specific window that the data can change but not
>>>> later ? What is the mechanism the data can change and how do the changes you
>>>> propose here address the data lifetime problem ?
>>> Currently this issue has been discovered by external researchers at this
>>> point, but if any such OOB issue is discovered at later point as well then we
>>> shall fix them as well.
>>
>> Right but, I'm looking for a detailed description of the problem.
>>
>> Can you describe from RX interrupt again what the expected data lifetime of the
>> RX frame is, which I hope we agree is until the next RX interrupt associated
>> with a given buffer with an ownership flag shared between firmware and APSS -
>> and then under what circumstances that "software contract" is being violated.
>>
>>> Also, with rougue firmware we cannot fix the data lifetime problem in my
>>> opinion, but atleast we can fix the out of bound issues.
>>>>
>>>> Without that context, I don't believe it is really possible to validate an
>>>> additional memcpy() here and there in the code as fixing anything.
>>> There is no additional memcpy() now in the v2 patch, but as part of the fix,
>>> we are just trying to retain the length of the packet which was being read in
>>> the first memcpy() to avoid the OOB read access.
>>
>> I can't make a suggestion because - personally speaking I still don't quite
>> understand the data-race you are describing.
> Go through the reports from the reporter, it was quite evident in leading upto
> OOB case.
> Putting up the sequence for you to go over the interrupt handling and message
> queue parsing of the packets from firmware
> 1.
> https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/media/platform/qcom/venus/hfi_venus.c#L1082
> 2.
> https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L816
> 3. event handling (this particular case)
> https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L658
> 4.
> https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L22
> 
> the "struct hfi_msg_event_notify_pkt *pkt" pkt here is having the data read from
> shared queue.
> 
>>
>> I get that you say the firmware is breaking the contract but, without more
>> detail on _how_ it breaks that contract I don't think it's really possible to
>> validate your fix here, fixes anything.
>>
>> ---
>> bod
> 
> Regards,
> Vikash

I'll go through all of these links given here, thanks.

Whatever the result of the review, this detail needs to go into the 
commit log so that a reviewer can reasonably read the problem 
description and evaluate against submitted code as a fix.

---
bod

