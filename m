Return-Path: <linux-media+bounces-21597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 266199D2953
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 16:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D486D1F21EF8
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 15:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9F41D07A7;
	Tue, 19 Nov 2024 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PaF7dWVh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11681CF5CA
	for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029177; cv=none; b=GD8yeZdBzaYkMQ5JwWIcKhG929LqwRbGTFZuLQF77Z/0qe4aJ1uMyMXwCd+tB9H9UAnjbJbGeZTOfrxveRUbbGaGjxkzGP4/t0tMJI0QOjPijkPgIhdE6JUPawm8q9J3zB3/sRw9VPn2qHvQqdndm1+AQDv5X3wgacL6FAaDvh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029177; c=relaxed/simple;
	bh=mrd+ef5omKk4kmj9QBZVm/PCvmTVB8GvlJMDSSFnMTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OclVpqtR/Cv0lfoa96c9F6h05J88hVjjIyUcbWDSjE7U/F4Gn0jDNPy+aEnSneUrqdyTcY0bhJySMZaQ9GiA71/v6huK+IVN/BVTvPdSAyOgHQSnhTV/EpyS8dI+3s7fgcMB2TbJYOvO/INf8xg8HKwaYtzXmrhOyINUh+FrWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PaF7dWVh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9ed7d8d4e0so513645666b.1
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 07:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732029174; x=1732633974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1njkv7AEQYLprfmPF/SUU/CkkayzBBsZYgpz9cUBCwU=;
        b=PaF7dWVhRUDFt0DBKnN8OIYMtbFvQsDtEp1Kh0WGPRITJKksB6PsoYctE9OxF5IqEw
         6olRM22/oXj+GCo7ANZNieMX2jvLKs2COEo91TbI0GTx82RjgUd39etotXPZi6KnD3Wa
         I4rA9tili4UprJnKZsC9L/CKPFuGhMVVZJAZ3MB+Q6D5Uc/s63uqncYM4nt2WzRMyjDU
         CF9wqiG95KMrKe1z215sVh+DC/WXg6rB5G2KyaPy8klkv3QFGCTATmu/FsVAY7pqnHV6
         +OHEiKKWOeZIPJ/ERY/H04rEfTBESRmGROEX0AmjY1DHq67XjCz4DxO5XoSNwWfCqJHD
         gPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732029174; x=1732633974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1njkv7AEQYLprfmPF/SUU/CkkayzBBsZYgpz9cUBCwU=;
        b=iW8XHpRaMdXvTo4on/kHveB8/dM+andlEa/0xdDCEFC6UqIdomIZ0X0elwh8RamP/o
         RQNCS7m9QRjjQ4dV8wpZGu8kqt4a9Z7/Bgql4YRQ9Q3TxmcBSvSGQFdnoMuV17hiDn5Z
         bbS/u2rzAnDrCmG6rV9Ri/zjyDjqf+Z36DZrE3PtMohPqS5Rx/1bEGbTzxjnduV4Msj8
         G21OmksH1RagXmRDZg3LLXjelh4NkwSlP4SGqnZYNs8bS1MKZffJBzblgpedcTijmS63
         2c51zCEiPDrUz/tM7zBbTl+MnHWha24J1gvGlw0dozYg496oaPd5HS8q58exDVfNfKAc
         Q4IA==
X-Forwarded-Encrypted: i=1; AJvYcCXF2nMX4V+jmHmfjpGDObj/iBhHBvwSUaIAozbXLtQDzxmyoQDv7AOsRUPJfIb0aZey87T60r85Xu1igA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxEgePoiO73pDpnp+5yQUUzlrDOiA/zTcXzyxbJ+71a9M+WM8p
	LDeNAHV5JeuwUqcWfXu44i3JrGl93NIKCYrg0OzayAxoxpN1vqpHMsJfaS5J8J8=
X-Google-Smtp-Source: AGHT+IHpPhEpx8FCZtw2jo+T5uqwAc8vudJk7VsZfwZwUsidD+p95qcWn6QPKWI6Rv/z0jxfWiKNDg==
X-Received: by 2002:a17:907:a0e:b0:a9a:3da9:6a02 with SMTP id a640c23a62f3a-aa483553f62mr1583241066b.60.1732029174122;
        Tue, 19 Nov 2024 07:12:54 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df779afsm658092866b.85.2024.11.19.07.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 07:12:53 -0800 (PST)
Message-ID: <6b7bcf86-9bc4-4608-9f2e-b14c17e558d8@linaro.org>
Date: Tue, 19 Nov 2024 15:12:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: clock: qcom: Add second power-domain to
 CAMCC
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-3-54075d75f654@linaro.org>
 <91592bff-4042-49c4-b884-8113d0759a3c@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <91592bff-4042-49c4-b884-8113d0759a3c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/11/2024 14:47, Vladimir Zapolskiy wrote:
>> +    maxItems: 2
>>       description:
>> -      A phandle and PM domain specifier for the MMCX power domain.
>> +      A phandle and PM domain specifier for the MMCX or MCX power 
>> domains.
> 
> It's a list of two phandles, not a one or another one. Can you please

Its two for x1e80100 or one for sm8450.

I'll find a way to express this more clearly.

---
bod

