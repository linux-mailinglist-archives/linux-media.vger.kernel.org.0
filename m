Return-Path: <linux-media+bounces-23251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B638B9EE06A
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 08:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B964518868C7
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 07:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8721B20B805;
	Thu, 12 Dec 2024 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yf51mtGd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6F020B1E3
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 07:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733989353; cv=none; b=ex7oCN22VuEGsq++5Ds/phzaVmv1wJqLVYghfVJ/IFyNTYpDXiu/Vg/pS7Qk/k49fOBwo4HYJtedJBiEog25A3Q1/MLao3K8n5Yl7NxMx9jGwd0Qhp5wP3gSzPDhZuHjryxo/MuBdipdXPxoaYrXsUzgPJy+uAa1FBe9NWhSA4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733989353; c=relaxed/simple;
	bh=lCCQie4pQ1F9vSOZNO0l3UQB38u97D8jap8/KM8tuB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCXG/WE5gdguo2RLvGA0+JdMBXr1FWMxz7DRvMRNccTRHJyu9IU9m5rL6dfpBXo5UltUnths+71hZPAgpZyuT8b7TIcIANtdny+HxOuItVS7XGvZs1SyCu4cJzNlwTyDDaj/CUTMR/N130L4JX13R+LM5SfIVjzTdHRZIvcii0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yf51mtGd; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401f859ad8so51536e87.1
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 23:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733989350; x=1734594150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fb6HVbCShRnjLJanLtEWXGGQsHuXVT1l5Vx7FnmvFko=;
        b=yf51mtGdpgJqIoW1gLN0gt15FPracGC9CQ/kvx8r46KGzLBvfFtAOmaVNhiru1CGO9
         XrsAC3WNQ5Ze7Z2VXfCCn7rA+lyytucPpFgXf0L6yMFCX5pu9gN62EKKiO+AcE5xI5Qc
         iwCOqXUYKLH5MHraP3nLVZCNW+1Ln2UvlU4GPHtw8eUts8kLjI2jL8T3HXMwYzlMjfkd
         WfnHRWVCvBPlA1r6Hepe8dcYMlcuEzSKf7/HJBUt9uftXjp9RMNy9jQx038Hdz8qXqup
         IWTP0AdfP3GHiQsc1x0DJMefZDqXq518QGZyyUEnfLTPEZKFnohGWuM90O1VSRFIN5f7
         fYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733989350; x=1734594150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fb6HVbCShRnjLJanLtEWXGGQsHuXVT1l5Vx7FnmvFko=;
        b=wE7+3Ks0yXMBNJoQxs2f1nfsIh/AWlyDiwePWaSuYzk3l2z1IGtD5k8Fxiw2omJ0Wr
         R7o1ymjeIqRBAjExXtyj3cnpUUs1tgP0ad+1DtTo0TW4HERZmY94QksCGc59XO1h+d++
         s1CyFfVb3TucUBIpr86tVd1FgxRZZJPLn97vrdvsr6SalyJo8YOpW9BLE+DgsvlSeorK
         DnVDDvrxdA7bsKyF94XOytPdPlzfE/Cc0zbeOEchTmhD3j8nhGPc3myylmSawpOiSV2p
         BvN7SjMMDoUmqx0Rf9ZeKP3aZRwBf/7msHljoAVXpob3NU7yE4g7a+PWRMODNZNzG6W+
         eFRg==
X-Forwarded-Encrypted: i=1; AJvYcCW7/sva2591L6KsOUrDnuCKStFZ9PxTLsXDZZrY0/xRgBY5WZcXYCuWPqiujNab113Gd0JKZY3E/FU57Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ93NDzif7o6tpfiAGZjAHWbxwY2P+hCKjZO/e0A7NEYBaxn5K
	7yFVSfPtS+ZkHkEy8+9EHn24q7V1sdKQxQyPPebqM9yVx0u1MRxWE4ZnE03wH3c=
X-Gm-Gg: ASbGncvgqDCN6DPVBvUQjTLFz5rLsYadt/COrbvYqplpeditDJWY50sA23KxNt4XjDT
	bjZvDjFEWlEQJsEAW9S5PaMO3Yw5ETqPjGdGDst8Ao3w2KJmTFlC2OFb1X3Pep58+tyNhRwptwZ
	Q4rG16eNa5lpx5vPAYJ+lOlo4aMYaV+mB03VGfWybgdhtV33TNHCuNUNhC3h5QpLxySjshUs5hL
	lLrFMHVE9JTt3I/z3wOgzRsmMcIie7df+GNgw6XDqtfkjMUJeDEj3IZqq4alejFjT1hIdyW94D7
	eJBymptpyMJZDj4u3Y1QYYSAxvbA0ay8D88=
X-Google-Smtp-Source: AGHT+IHHF3eBrkcbLgZjV07jB++O6f1X9HXUZITRIyKBGz5tBzelSPFXBegqOWH9Yj6quetQS7N+aA==
X-Received: by 2002:a05:6512:b01:b0:540:1b2d:8edf with SMTP id 2adb3069b0e04-54032c30272mr48070e87.1.1733989350220;
        Wed, 11 Dec 2024 23:42:30 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5402042ad64sm1142957e87.178.2024.12.11.23.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 23:42:28 -0800 (PST)
Message-ID: <f5e2c304-c2b2-409b-9300-9b236c2e3354@linaro.org>
Date: Thu, 12 Dec 2024 09:42:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] media: qcom: camss: Add callback API for RUP update
 and buf done
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-10-quic_depengs@quicinc.com>
 <1ac23fa1-fc35-45fb-9338-d5f304c869ba@linaro.org>
 <dcfaf9ef-87bf-4ec5-bf86-5c432380ae9a@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dcfaf9ef-87bf-4ec5-bf86-5c432380ae9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/24 03:32, Bryan O'Donoghue wrote:
> On 12/12/2024 01:09, Vladimir Zapolskiy wrote:
>>>
>>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> It's unexpected to see two your Signed-off-by: tags, either one is invalid
>> or the authorship of the change shall be changed appropriately.
> 
> TBH I thought nothing of this at all.
> 
> @Depeng for the record you can add Co-developed-by with my SOB.
> 

Thank you, then this will become aligned with Documentation/process/5.Posting.rst

--
Best wishes,
Vladimir

