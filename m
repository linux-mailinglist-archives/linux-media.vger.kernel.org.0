Return-Path: <linux-media+bounces-27304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D58A4B2BF
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 16:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D205C7A5E3B
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 15:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C03B1E990B;
	Sun,  2 Mar 2025 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZUpOoDb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BAF1E8351
	for <linux-media@vger.kernel.org>; Sun,  2 Mar 2025 15:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740930970; cv=none; b=pDNuKh+IuA7hm8tbRLB/m89ZSgczXClgZjryalt49JboV/F1bQMBPOaXqZzXjxeqTkUwdD2CJp0IuyVnhSlA7mIPz/uqCdUDfvH+eyPOgofg0M/wQyCZpOypqvHDyqbsX/ogHWNDeOPOTLyc9vNDfFYO92CiyP2KfdcQ+9vt9QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740930970; c=relaxed/simple;
	bh=H8X4S94pGAKOquO0l2C2cojT9a6H8qXbxIRVykkPpQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MA9yFZpyenl6L4VnpU6HEijI3DqOpQQJZnM3IiTLKREzdrq50a6fFAmAGPnBY/23LqEkzTv7vuFE5HLFMKa6+1IAu3O5FhOfDgMbLpZKWRCPKbPzUSPadDcSbES1rqpZq9wpi6jXQd1VQ7w9QlVQrm+1Ii3fwdjKVsBdU61Cwc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZUpOoDb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so24834545e9.0
        for <linux-media@vger.kernel.org>; Sun, 02 Mar 2025 07:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740930967; x=1741535767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hlpIq9SPuf0qn1v2edQTVWT/w0C8xiNzl1ulEaeBlbw=;
        b=UZUpOoDb5Gn07chugCDy61oyPhAXj+3aVWWz/P8n/a+3wmU7w8Ow7A/nLLBFIMYldj
         xChVIE9nn0t5vErEFtSSInvFUsmCQpkh2ec999UvziRRX7D71OZThHffUUrvgk/+Kfar
         I2Q3yNqPW8Q/8xKQJJYHfVIwlYu7byiRnS3bQCqKBBE4D0Jvry+u6RISiNXWuVsejqT5
         6b3zkqazt4zylqtfeV/8gUVzujq/VNZosSFPc5vPg6TxpjX59iLwKnpz9z7pGLRA78lC
         lPThFrvZP88RMv1ql2mlCVfeECd4aHCUi9ne6YGaNmE+gb48zIVptKtwOgFPSR+w2ol0
         2tuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740930967; x=1741535767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlpIq9SPuf0qn1v2edQTVWT/w0C8xiNzl1ulEaeBlbw=;
        b=qYnvEIh/IaYVGpMyALmXbW5jGI7AMJe2k0J39OvFZJzaZyzZOx5qFJW8HvhmvJM3ei
         0Oo0Ei7f1rZkmnvmyBh4BQNRB22qViOSvxLJoPtdv9vxne07yHqY/0a3kfY2BI93tiyL
         kK0539xnIsgV3AD9cvNu7VzoQtlq8QE3w5+jvTgq+uTiB0uHHiBKD6jpMBCP6KgjmWv0
         VjXijE3rcnZqwhmjIqcLfCkd2rjWPi8ztOsizOfAizpI7GxS3os4sONBTUEbZD0DdY0A
         D9xyEU8rmMuB4u7MfH4LvwL/sdV37IQBBgF7fW+FfXpt8BhwvzeRaaKKyqdSe6WuRDif
         lzXg==
X-Gm-Message-State: AOJu0Yx6/m4rBQqV4+dGQrIPeBe4k4+wcij8ibWW/xrtcDHG78aTxz7e
	aLLLmzWMz7MjMvwp1lEGQsM6eX+noTPy6KZoa6Odr2rvZN8sjO/E67is1IkY1rwO5qjunjuXLFu
	F
X-Gm-Gg: ASbGnctIIFQohYpfqgjKaPl3p8bAuYTbdXsvybZDEQpw7TG78rpoS7FDbz5ga61qCZu
	y7VXKMF8ALvYeYZePEqJgguhWOWSewOP96fBc63lGi/9/vQqoGhKiujoBSE+z0vtdNtdEqxSEJI
	K/HuArUI26uWGWcfcyVkor02bhQ2FJgtROuFlflEfRps2GiCoYiSQRv2xkn9I80jAD6s1p5KN+E
	iCjd8R2paKYkB4aimLNA8kmezv1Sd3JHWEekIbr5hagV/zD5M7ect9gSvFHg8D86GB9tZMeG63k
	jyOdkGIV6vzkFUnpiGvFe2D1WtzH6FQq87/73Teb4PrtIlLDIni9kTXAZADcIuqGm9rCUxK3MOm
	6ykSr+wpdKw==
X-Google-Smtp-Source: AGHT+IHhDgttzslV/5SoS5Hp8trBu+m77gcArllf4u4+s29M07vSbx2XO1Tt/k0SG6UzXxJv1kT95A==
X-Received: by 2002:a05:600c:2292:b0:43b:c0fa:f9ce with SMTP id 5b1f17b1804b1-43bc0fafff1mr5402165e9.14.1740930966691;
        Sun, 02 Mar 2025 07:56:06 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f839asm127814985e9.2.2025.03.02.07.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 07:56:06 -0800 (PST)
Message-ID: <19109672-2856-457f-b1f6-305abc6c4434@linaro.org>
Date: Sun, 2 Mar 2025 15:56:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] venus driver fixes to avoid possible OOB read
 access
To: Vedang Nagar <quic_vnagar@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
 <c3b27e55-f627-417c-bb62-3189f248fb99@linaro.org>
 <7bf1aeaa-e1bd-412b-90fc-eda30b5f5b37@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7bf1aeaa-e1bd-412b-90fc-eda30b5f5b37@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2025 11:58, Vedang Nagar wrote:
>>
>> The basic question : what is the lifetime of the data from RX 
>> interrupt to consumption by another system agent, DSP, userspace, 
>> whatever ?
> As mentioned in [1], With the regular firmware, after RX interrupt the 
> data can be considered as valid until next interrupt is raised, but with 
> the rouge firmware, data can get invalid during the second read and our 
> intention is to avoid out of bound access read because of such issues.

This is definitely the part I don't compute.

1. RX interrupt
2. Frame#0 Some amount of time data is always valid
3. RX interrupt - new data
4. Frame#1 new data delivered into a buffer

Are you describing a case between RX interrupts 1-3 or a case after 1-4?

Why do we need to write code for rouge firmware anyway ?

And the real question - if the data can be invalidated in the 1-3 window 
above when is the safe time to snapshot that data ?

We seem to have alot of submissions to deal with 'rouge' firmware 
without I think properly describing the problem of the _expected_ data 
lifetime.

So

a) What is the expected data lifetime of an RX buffer between one
    RX IRQ and the next ?
    I hope the answer to this is - APSS owns the buffer.
    This is BTW usually the case in these types of asymmetric setups
    with a flag or some other kind of semaphore that indicates which
    side of the data-exchange owns the buffer.

b) In this rouge - buggy - firmware case what is the scope of the
    potential race condition ?

    What I'd really like to know here is why we have to seemingly
    memcpy() again and again in seemingly incongrous and not
    immediately obvious places in the code.

    Would we not be better advised to do a memcpy() of the entire
    RX frame in the RX IRQ handler path if as you appear to me
    suggesting - the firmware can "race" with the APSS
    i.e. the data-buffer ownership flag either doesn't work
    or isn't respected by one side in the data-exchange.

Can we please have a detailed description of the race condition here ?

I don't doubt the new memcpy() makes sense to you but without this 
detailed understanding of the underlying problem its virtually 
impossible to debate the appropriate remediation - perhaps this patch 
you've submitted - or some other solution.

Sorry to dig into my trench here but, way more detail is needed.

> [1]: https://lore.kernel.org/lkml/4cfc1fe1-2fab-4256-9ce2- 
> b4a0aad1069e@linaro.org/T/#m5f1737b16e68f8b8fc1d75517356b6566d0ec619
>>
>> Why is it in this small specific window that the data can change but 
>> not later ? What is the mechanism the data can change and how do the 
>> changes you propose here address the data lifetime problem ?
> Currently this issue has been discovered by external researchers at this 
> point, but if any such OOB issue is discovered at later point as well 
> then we shall fix them as well.

Right but, I'm looking for a detailed description of the problem.

Can you describe from RX interrupt again what the expected data lifetime 
of the RX frame is, which I hope we agree is until the next RX interrupt 
associated with a given buffer with an ownership flag shared between 
firmware and APSS - and then under what circumstances that "software 
contract" is being violated.

> Also, with rougue firmware we cannot fix the data lifetime problem in my 
> opinion, but atleast we can fix the out of bound issues.
>>
>> Without that context, I don't believe it is really possible to 
>> validate an additional memcpy() here and there in the code as fixing 
>> anything.
> There is no additional memcpy() now in the v2 patch, but as part of the 
> fix, we are just trying to retain the length of the packet which was 
> being read in the first memcpy() to avoid the OOB read access.

I can't make a suggestion because - personally speaking I still don't 
quite understand the data-race you are describing.

I get that you say the firmware is breaking the contract but, without 
more detail on _how_ it breaks that contract I don't think it's really 
possible to validate your fix here, fixes anything.

---
bod

