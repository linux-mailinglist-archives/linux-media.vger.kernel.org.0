Return-Path: <linux-media+bounces-34716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCFAAD85A0
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9400F160C65
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BE927280C;
	Fri, 13 Jun 2025 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/RR1W6w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F5A2727F7
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803393; cv=none; b=PWzycctWiPSyTkMC0SNnYSEQTw2M9uBvW1RJogV1q4KKHUjE3YMV62gmKGazAmOPjqisVidaL3maPA+f17l9eobheQD0fsZqY9tsy3Fa1E/oJConSTrPvcChvGEYt2B2UM32w2+D9Gm8QgR6Mx+fPnEJcRBf3NT8aiKLgR8lM1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803393; c=relaxed/simple;
	bh=Ndaw6E/1DT8mCCAKumeuIusQOrCN2MR3mwrjjMC25I0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcaaSfBIfc953E3aH0NEcZV0x8UX60K2DfipLBS8BfAUcx8B3X4JyUvRcjv9j/8a3FiD/8kBFauazzjgC13+6csT/sE+CJ+DtOcf7Puk9zMO7JTbk4FZAZ1C54St2/EdnKlMuVe7P9P7Lf/+JqFnlY5wfytFMkHitRxc2KeP9Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/RR1W6w; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so1571083f8f.3
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 01:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749803390; x=1750408190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vw2wbUJHDF5FJbkrTPFuUAQyWojwex3GcPQ3V01XJY=;
        b=K/RR1W6wc7ua4gF1hPXz1JMJNx1efcS69FStc5UtEmq5PYKLMvaPybNxeNUuGj6C/Q
         u+h1Fm547CaIS7uU6uwFG6NSJDr+HA7YHCcs3kWuWKsNWrHiw3B7HijYCSennnQ6uGx2
         nKlSMNU9BuS+n1N/YdLZC80YENNsNKqQjVLJ412cL6B/whMSaaCL2yJj1ZmL3e1YOKPg
         VcqP+r4UXOqCNJf3qg3OU7ShlCrxmkhdOVN8vPrCK7gNASJlS69OLrOeUNGWn+gaB/e4
         zsH28MD7RbpBa87BcjO0NfjeYA6TTxrCWzAZzXjI32w//heweHrZT9zS4lc0fBNYkO2l
         cxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803390; x=1750408190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vw2wbUJHDF5FJbkrTPFuUAQyWojwex3GcPQ3V01XJY=;
        b=Hjxf3k8Qxsbl/23LeLYtgvF2ZvRA1dHNi9iwJxRD5LQLGgHOThIj5LhSrnQXaTOw9s
         pkKYIZWlTxMK3wgQv2pxH58Kcb5pcgnrZvRygEsYOLopkddPqrNp05KyOJrjCLQ0rgUn
         gjEszrz0I+8GwlOZrsZdCWwfn47c8Lxjapx7TY2tqu648NVuOZdyitzlg34LU3Jvjz5o
         WbxXuMDnKnjkGni+5WL9rzNcSmRcjeu9gFXaANMb48LPdp3qxjITS3u5tc8bTVL6XQ9W
         xn6a6f3Utt6KlMTpNF+CQG6P7PTqcgn2RzoVOOHY7bG3ncNfMYmxSiBBpqDBp6PrYcOv
         qxxg==
X-Forwarded-Encrypted: i=1; AJvYcCXcnL03idg1gQVnS0qugXjO8QbnqC5aQFWNEsXkjEM7sU9jJp1rjkfqm/44c9n7ldTs0HJ9SV9WldLz7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk79ZpXquV6ZOoTjT06KaI+yRMIwQhYQ2p2tFd4+DzfhVwSSnC
	3T5R0/jqJ692m0LlNvgFMcI3UEjOYuWLH3VZH/mbHpHEWE0rRotXCEV53XjkRkBxrEs=
X-Gm-Gg: ASbGncvbGlbyOa350qvKGr2/NA9XodLK0CBzcAlb0It4UV7Jd2sOlLdWcOTsSl4LnAs
	5vw8zV5/lUGLFEUtX2HPwlOu6M9weU6ifYwvdaFUA3Vz+fHITCOreXXGtcIg0iJOHOQFV/+8OyD
	mkw0OzmsRfU1RpRm6Eujrmah9aTfXdk6ryOAStKOMYHnq3NHRR1dG6CFqimyyInIl+N04IkVjA8
	tnorPvQZiXpRfZSF0YiIDTO/3J8wnf2Tjf8Iy/ShRGbj/5EhCpIWZ9ZQXZkPp6+fqXXx4xA90em
	s2O/j54vhKThRCDnovucDdCeyFCRmDZcYxPVOSfFGIPdrak3lnXEHyMC4kBq8b223LgyKJgcyYg
	mpJypce7xJqXlN5tnkn+q4drcVFs=
X-Google-Smtp-Source: AGHT+IHi6SlBwjFJOsMDJVRnIHSeQtix9HOeS66GL6NI2gk448DXiXM8fUugtFC2s4okglYnJjCwFQ==
X-Received: by 2002:a05:6000:178b:b0:3a4:f72a:b18a with SMTP id ffacd0b85a97d-3a5686da23dmr2067256f8f.26.1749803390030;
        Fri, 13 Jun 2025 01:29:50 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e244392sm44568325e9.22.2025.06.13.01.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 01:29:49 -0700 (PDT)
Message-ID: <7f76c2df-24bb-486f-b68c-6ca61e7acc8b@linaro.org>
Date: Fri, 13 Jun 2025 09:29:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: qcom: camss: Add support for MSM8939
To: Vincent Knecht <vincent.knecht@mailoo.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
 <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
 <877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org>
 <e73d676ba1901437d471a2a633e94a07b19a3e05.camel@mailoo.org>
 <03f54bb4-ddbb-4be8-9f9b-8328fdb98443@linaro.org>
 <67022a6de185740fa482183f29d574298048d54f.camel@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <67022a6de185740fa482183f29d574298048d54f.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/06/2025 09:28, Vincent Knecht wrote:
> Le vendredi 13 juin 2025 à 09:06 +0100, Bryan O'Donoghue a écrit :
>> On 07/06/2025 22:43, Vincent Knecht wrote:
>>> Le vendredi 06 juin 2025 à 13:59 +0300, Vladimir Zapolskiy a écrit :
>>>> Hello Vincent.
>>>>
>>>> On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
>>>>> From: Vincent Knecht <vincent.knecht@mailoo.org>
>>>>>
>>>>> The camera subsystem for the MSM8939 is the same as MSM8916 except with
>>>>> 3 CSID instead of 2, and some higher clock rates.
>>>>>
>>>>> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
>>>>> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
>>>>> This fixes black stripes across sensor and garbage in CSID TPG outputs.
>>>>>
>>>>> Add support for the MSM8939 camera subsystem.
>>>>>
>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
>>>>
>>>> There was a preceding and partially reviewed changeset published on
>>>> linux-media [1] before v1 of the MSM8939 platform support in CAMSS,
>>>> due to a merge conflict this platform changeset should be rebased IMHO.
>>>>
>>>> [1] https://lore.kernel.org/all/20250513142353.2572563-4-vladimir.zapolskiy@linaro.org/
>>>>
>>>> --
>>>> Best wishes,
>>>> Vladimir
>>>
>>> Thank you, I'll look into it
>>>
>>>
>>
>> I think I will take 8939, plus any of the other now 3 SoCs waiting to be
>> merged with RBs.
>>
>> Bindings consistent with the last 10 years can go ahead. Its not
>> reasonable or in the interests of the community and developers to gate
>> any further.
>>
>> ---
>> bod
> 
> Hi Bryan,
> 
> I've locally made the requested changes for bindings
> (ordering, vdda voltage, style, clock-lanes removal),
> just not gotten around to rebase on Vladimir series.
> 
> So I can still send a new version with just these changes today.
> 
> 
> 

That sounds fine.

---
bod

