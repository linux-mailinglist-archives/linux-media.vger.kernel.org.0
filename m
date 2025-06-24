Return-Path: <linux-media+bounces-35787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5ADAE667C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 15:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 348E77B29E4
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D723E2C08DA;
	Tue, 24 Jun 2025 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byoPBbY3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023A2C158E
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771774; cv=none; b=rLtPyK4qiw0AYrNawpz12b6miV8V4/qJ0jsJ29a5tMBmplteectEbIVntL+SncieqeCyMiWQbZj4LN63eloEyXFKhSnF9tmN46BPAa9wqodNJnybrr1sAWtHwILInHbqhFwZtHt0Qb65En+PwdbRuAZhrWu8GKVHMm7fU6bE1Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771774; c=relaxed/simple;
	bh=KkGuUQ1jO44VkHngKbwwZg2hXuZAc53zXvsEALMTdVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IipilCreXuVUij7QR0l+0fm0927koQuP+m31z87ZuuEUT7J4rZOYci3X1a1GvgGuMZs1vbzjQ/2l0kUe/XiVrOQa5wj4aZ/irRy71wzSOfJvN/w7J+TH0EI2yH0RZ9zIOVKGvUy74c3plICHqs9pkimN79HpExA+3XIlBH4SV3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=byoPBbY3; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553affea534so371000e87.2
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750771770; x=1751376570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MLKEW0O/I/yGtGiPGESO1OSUMKreNoFwAhjoXeg8po=;
        b=byoPBbY3udkIICsafgYPb2WA1zYbd/DnfFFOxTZ2dK++/oEcxh/b8Ff/njdLq/DeWl
         zXlIxX51LlFu6UjZn5H3xy4phhuqPkN0WV4qQn718NUeGuAl7fyoDTJBhCcG7EGHgLbd
         JxSjelOhTLwdpjHaBc7XPwvrZja9ksrVIAlaE3mbvLFDbDoZrHVRjbweQprkKGNORRCC
         7TyZRldVeLzEX7WVohCPWV3LLLGbrcMi/Lo98gH2OEZXT17HWByBkXXBd9Xc88XOSxQf
         A1bNFHN6cFtj1ZYEdcuZvQgsyMTR5ZEk8slZvPXAK4xw4PecGsBUWmYyRq6OxKadDD6d
         0xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771770; x=1751376570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3MLKEW0O/I/yGtGiPGESO1OSUMKreNoFwAhjoXeg8po=;
        b=nEwXMqzeyjmuZVGD1RAy9P8wH4+V4jk2b24eXu1krI2Ap1Iu84WeMIXOKTxopm+NZV
         JIZWvvhFdl8TTNuEj+pEEA/QQlmHJblIVRqJW1RQA9hBaDBxk2WP7lAbUeIk4bUU9Gul
         N38zBgdmLOXIlKSu6ru/gg31PCfq+chHftsBGpTIWEVq6JbNPOKe6eGbRhp/ZduwPrt6
         +6cDzhXDf2mFoDL31i6kzZCHyy30AQxW8ThHyCosJ4+hosCDIs7UH8ZwytPH3cOkmz9z
         pwpNSdHOKsGQ/QkaaVjASWL+LfUd+UQcaq2CUa5QufWb91UEFThlcuX95MjqNRzFrCVn
         Ps6w==
X-Forwarded-Encrypted: i=1; AJvYcCVquJX4NhJ0rvyZ2uT8UUd2Sz+9hUc5jL3Pu6dIoqWPlNOjCuIHNQRX2bKIPyops5ATS9jz8PiWrLHHPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi6sjO4ZK1hNV4EL6Fnymou0BSWoctbzzJ3pMhrKcP480h08OF
	m4qSbMWiUSbA9K/s5Aaad5MktjVrR1GOc4RwzD9pAKpZP82WI8oggOl0ikvv3x7NbU8=
X-Gm-Gg: ASbGncuN6WjIlTDF/2r7wxQrB0xK7jM3FKDAxmkhgmEio2l7ZFKc8d8lwIMBNKtnqGJ
	K7UOie/+uEVxqxzTpEv7jo58EH6ozZoAKb+DuGxIPYcvU8BO9wIQdmPrZIOIRsmLc69DEolsbwG
	G7ItsbuQ/IalImALynlvArF+dz0HqDUv+JD85Af1oGcKUkCVFGUrK99Z8JisnuwetQFZ+nwI0Or
	43RAtme5Xb/MSGiu/AL9D+VlrXQN9tlzUx3rKwLjDkr5l+JBLedTYc2HQoyPXAu3tUY/0VlzViL
	ImleZIbBCoo2Fa/HK+0uPz0GrG8XrH1SyNWHfPb0zwqS4fOYMCjCVP+bNPRYu3ZPJ3lXof3yR/e
	iB/E5HsLBhd99cUOmKTD4gz3CovMnGG+OLrxXdIjwO6+UtPOBZVQ=
X-Google-Smtp-Source: AGHT+IGvDSwwMCcOPXsenn7I5P7Tg6A5E1lHNYZ5jImzp3hQ4To7P36CxWECrV/a1zEmeSJjd7sc0Q==
X-Received: by 2002:a05:6512:3b8d:b0:553:35ab:30ae with SMTP id 2adb3069b0e04-553e3bfa0e3mr1661558e87.13.1750771770237;
        Tue, 24 Jun 2025 06:29:30 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbba4sm1836925e87.109.2025.06.24.06.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:29:29 -0700 (PDT)
Message-ID: <c29385d4-30ea-4774-9cf9-699b08e29800@linaro.org>
Date: Tue, 24 Jun 2025 16:29:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnects alphabetically
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
 <20250624094253.57441-2-vladimir.zapolskiy@linaro.org>
 <aa56b956-95f3-484d-8afa-058925b95bfd@kernel.org>
 <fff77f71-e21b-43b9-9da5-6cf819add970@linaro.org>
 <5a5b78f7-e156-4c5e-8407-b249040e227d@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <5a5b78f7-e156-4c5e-8407-b249040e227d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 15:04, Krzysztof Kozlowski wrote:
> On 24/06/2025 13:38, Vladimir Zapolskiy wrote:
>> On 6/24/25 13:10, Krzysztof Kozlowski wrote:
>>> On 24/06/2025 11:42, Vladimir Zapolskiy wrote:
>>>> Sort the entries of interconnect and interconnect-names lists in the
>>>> alphabetical order of values in the latter property.
>>>
>>> We do not sort these entries alphabetically and you did not explain why
>>> you are doing this.
>>
>> I did it, because I assume that the preference is to sort all named
>> values alphanumerically.
> 
> Where is such preference documented?

There is no such preference documented, as I stated it was my assumption
and it was based on your firm insistance to apply a particular sorting
order for regs, clocks and interrupts properties. Apparently you are
fine with out of the same sort order for 'interconnects' values, the
criteria of picked properties remains unclear for me.

>>
>> Since my assumption is incorrect, I kindly ask to let me know, which
>> properties should have values sorted by alphanumerical order of
>> ${property}-names values and which are not, there should be a method
>> to distinguish such different properties.
> 
> None of them "should" as in "break ABI" or "change something later". I
> don't understand why again we keep discussing such trivialities which

A triviality for you is not a universal triviality, that's why people
ask questions to remove uncertainty, the question asked above has never
been discussed with me, and the answer is not given also.

Regarding "breaking the ABI", it's been discussed earlier that no dt
binding user in the upstream implies no ABI break practically.

I believe this change shall be dropped from the series, it's not
important at all.

-- 
Best wishes,
Vladimir

