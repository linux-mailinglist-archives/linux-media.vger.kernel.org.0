Return-Path: <linux-media+bounces-34485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B0AD4622
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 00:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 844FB16309D
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 22:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A333428C01A;
	Tue, 10 Jun 2025 22:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQ51gCR4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4472778F34
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 22:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749595954; cv=none; b=tFSLoZSQR6qaFXw0ej9Cw1QZPpSwXpWK6plL+3Hxkt2jRIVN80811fPAlI/VsosK0yTGF6Ijv7YdKROloAau16RtQKYHNJH2aYG4xbHtgEErp+MOq1v0SHFchyQn9cZcTqjAL7B+8H8IUU/hS9rts1hA4tyYijwt2y+52LFZMTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749595954; c=relaxed/simple;
	bh=dGvEL7VFQMEHyCl9uhKD2qLMJqcGj2fNl68zFI+CAcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EfJ/NavhXOmfEH6m8S7ml2C0lkO7zeE3mt7uGeMCaNpYQWs17mfzvKEFd+7Yqgv/aSdYrbUFC31jY6IN7LCeA4XVtl5lEPkPMbtLU9PWjTLP8dF4QmrLz/Wjz1AUTZ6dgGVYcpuOGoas9l87gCCs8cpAhfm1SG1PL6zsfNttJjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQ51gCR4; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55328ae0473so846653e87.3
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 15:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749595949; x=1750200749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDzIKnfoXKVxpTDnGzOlzzRBRZz/lpcLf4ffLk3rm3E=;
        b=DQ51gCR4zyHBQsAO3THxmep1HOUDK+vpZCSjhA94cktIduNcodYUGsXUImm2utb1HR
         lNi594PgRpr0EaFMAxAXtC5hnKB4rmFzprNLmK+/3QLWDdtVAItrMfEJQ97SpG8vtrSG
         C5NRZ/QcOYRTX/FVO9JE3/3pNJJU8komB3YkQczkMF1ALSApqcvltWNYHAWDKu6Aybzd
         HxBRiVLaOF+mbs+JqROqeICRXVF9javIo8MWyFBe2xQIt0wW0c955Vr6X+eRS0Kh3w5S
         aoLP29XsVEdqM2yvJ2RqhrWMHW7XcKv3j0dfbx7CGRhhoFf6sq1t1dzl2kLAO/DJHvBr
         gBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749595949; x=1750200749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDzIKnfoXKVxpTDnGzOlzzRBRZz/lpcLf4ffLk3rm3E=;
        b=b7I6YakwX30XIUjWBCNR63cz7+paQG9WhwBc+RuL9MxaHonf5AWycFlUlbcUy+TU2I
         85VzOs9T/i0ravif1MvEkQQp8aYzHBys9yJRqq6ZfOmRvRe2FCYM3mIxES1U4K/bP+KU
         ywXnO+gr6VWtr8x8+AsihMfYIowwLilCyLq/3Wibd7UcIxCJnAGZD37197pEMgXaSlFc
         0UfKsFVy38KixGt+KuMV4yKcAt2iUALXnJt83bJE2pSS1uUSFI31C+Ja+k1p+tTbzk19
         t9CCMSL7WFO/UbJ7bVe8Yl58RzZ+9ygIQFQNEbjPn3Uz6BfyRTT6SHPiUPt98yySCtHY
         Wvow==
X-Forwarded-Encrypted: i=1; AJvYcCXqziVqyubsDFzuKgRw6f8T03N+NjNCaJpkCX1XNzwl0NSJmlfNyaqrNU5ktlYLhYCY7AgL6wHehUhCJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfNE0OxZq6SgYQ9zhq+OBtVaPTvvFbseDyoCr6ISPiPzqaoX1J
	fjZp42sC7t+f/Hp3Xc8Ico2NjANLvRmutsGJV9av15pMkq6L88f255ISIQn0G7lfxuw=
X-Gm-Gg: ASbGncuHXq2WpWAe91/PsMUAOsHXnUBzfn6HeIkePFCyBrer58GZLIMyoN6a97+kQA0
	eYxldWa1+4VR2DDXmBNXGnJYHsDaA1luvSWoCTqhLY8fqPkM+R8sRJnbEu0PwGX89YGRp9PVtW7
	+L4CNIoQQfAjL9BXBmoptn0BmQztBn4vhvHYgtPs1q0ZM4pPw0abfj4VvC1VxjcUxr5KAq9BN65
	oxWi5JrelaxtK2saorQOURsTWqAALFwu08kOhH+oJyqlBvPDqAgjzI0l/8Wt8FsB/F/z5EgRZO5
	Runs0tKT4mIsz0p3DXnZPIP+8KJUVFlMFKsJJ2Lq5WzCH9q90z1x01F66vu8KMOSEcloE7ZyRlQ
	ffnlOhgxQbXqY5CaaPSxbAR7vokTBPASOp58ZI3sl
X-Google-Smtp-Source: AGHT+IEtuqJcRIG0E5fei0/F3drx/EifVxzaUFRy6V7mzVWAdahdyPi7wDfC9TSKmVZdcMYEaT5BQw==
X-Received: by 2002:a05:6512:39c1:b0:553:2874:8efb with SMTP id 2adb3069b0e04-5539c2482femr113667e87.11.1749595949406;
        Tue, 10 Jun 2025 15:52:29 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d03acsm1722972e87.32.2025.06.10.15.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 15:52:27 -0700 (PDT)
Message-ID: <13db6444-d9e9-4c37-a68d-7ed2c4d52ef6@linaro.org>
Date: Wed, 11 Jun 2025 01:52:27 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
 <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
 <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
 <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
 <b4a7aed0-a05e-4d1b-965f-78e0c5e0709b@linaro.org>
 <10f07a65-0549-443d-889b-d36b3515a237@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <10f07a65-0549-443d-889b-d36b3515a237@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/11/25 01:17, Bryan O'Donoghue wrote:
> On 10/06/2025 22:13, Vladimir Zapolskiy wrote:
>> Hi Konrad.
>>
>> On 6/11/25 00:04, Konrad Dybcio wrote:
>>> On 6/10/25 11:02 PM, Vladimir Zapolskiy wrote:
>>>> On 6/10/25 22:02, Bryan O'Donoghue wrote:
>>>>> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>>>>>
>>>>>>> List feedback from DT people is isp@ is the correct prefix.
>>>>>>>
>>>>>>
>>>>>> My bad, but I don't understand this comment, it seems irrelevant...
>>>>>>
>>>>>> The expressed concern is about the novel label name.
>>>>>
>>>>> I mean to say the feedback from Krzysztof was that we should use isp@
>>>>> not camss@ and I agree.
>>>>>
>>>>
>>>> Let me repeat it thrice, it's okay...
>>>>
>>>> I don't object against the properly selected device tree node name
>>>> "isp",
>>>> here I object against a never used and very questionable label name
>>>> "isp".
>>>>
>>>> Please feel free to ask more questions, if you still find it confusing.
>>>>
>>>> Again, I may missed a discussion about the need to get and use a novel
>>>> label name, then please share a link to it, it'll be very much
>>>> appreciated.
>>>
>>> To hopefully help out:
>>>
>>> label: node-name@unit-address {
>>>      property = value;
>>> };
>>>
>>
>> Thank you, here is a link to the wanted section of the dt specification
>> for Bryan's comprehension:
>>
>> * https://github.com/devicetree-org/devicetree-specification/blob/main/
>> source/chapter6-source-language.rst.
>>
>> If for whatever reason a proposed "isp" label is preferred, then
>> since a label rename is not an ABI change, it would make sense to
>> do a massive change of renaming all camss labels. Otherwise there will
>> be an outstanding incorrespondence/confusion of the label names in
>> board .dts files, and that's bad.
>>
>> -- 
>> Best wishes,
>> Vladimir
> 
> Ah the label, I thought you meant node.

I'm trying to do my best in expressing myself by means of the second
signaling system. As an example when I write "a label" repeatedly, I mean
to transmit "a label" symbol, hence I hope it should not be overly
complicated to understand me.

It's great that the understanding is reached now, it would be better,
if we can save some time in future.

There is no bug introduced in this particular change, however it shall be
fixed and be resubmitted.

--
Best wishes,
Vladimir

