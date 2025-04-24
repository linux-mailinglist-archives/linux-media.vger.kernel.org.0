Return-Path: <linux-media+bounces-30896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C73DA9A276
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 08:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54B911708F2
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 06:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A7B176AC8;
	Thu, 24 Apr 2025 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sWYjbipT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B109F1ABED9
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 06:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745476809; cv=none; b=HaXnjI9RDopKBRvOyAzBq22LLLZWY4rd9HrxeG0AHMbvvMsCMg3iEukZ/SKnJ4TDY868+efmBDLCfeFyqiZRDPzshL2KbMMiwr42BMzJP0ac5gG/udEUpfa2HlSxhLVFmIfMeT55zg6T/M5sY94MgtuxP2SRjHuskRELKwo9dII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745476809; c=relaxed/simple;
	bh=n/EtL309SWS43VFBzrQ2115mc96wexuYCVq1BpP3F8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+9MVpTTWlrfk+3y2i5IVya+/BtK/+yaj4jN4gGLqrUccnCNzpsH4caW+UTYhPGyoyny617pqOfvkMHr+6D+Ki6WOhrBJpIMas+vwMzG0NVfKtagig7L6Trn9CuQlSIXYSO5lDMP6X4Fynes2f5opSII6kgFhhsIzeAKElyG4vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sWYjbipT; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e82396baaeso109860a12.1
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 23:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745476806; x=1746081606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YHOVy0d6Jr81U5d80aHhQf/9l+Z+pnlxKv7sXKN+lK0=;
        b=sWYjbipTU482vOem2XXKKpEXNw+ADf0tTUxG0hWMJjoLn1Ef326qH02vHSamkHA46D
         QirSKO4XJTl8aFtFBWHnGxNvWMi3X1seUP4DL/o2UwVHZI/uHV1L4C+55zud1Jr8sH/+
         q4eJ5TA1kgu+9INukenrj+NOW71q5Vf6m8XDbTvhwv7eJDBhynZ+BBZARlrhGGHmNFDo
         SqEgj60gNzxUNVTPYoPahXzQ2+o9HjHknb9UJjrvCNkQjJu/wz2wURzvNLCYsXvQhY07
         LrWNTdcyw9Ef8wGJvlgX+kBv8GUbdVfbPw3IFRX+Eie3wPXjLFFZqCo/v23ciAHl2F8T
         1acA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745476806; x=1746081606;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHOVy0d6Jr81U5d80aHhQf/9l+Z+pnlxKv7sXKN+lK0=;
        b=TCMpSogzwpQV0ARjQDWdrDV+e+0nYhDp2XZuXYgf6Vd0IyqC+ewfrK+MKA06dJGpn2
         H1FsYgZVSecxfgHs+QnJ/MLeNJ0ZedwE2riei4aH6AiOgM9/BqAlV/QxG6UXMNOm7Xxq
         WqUxYpUcBIC5mK4UBUgE13DApWqz+E2OpToTiUiSj91Q3iEBxippq7jxo3bZ7W86H27e
         7Vz0dfG89KxR39XF8wGRrP8SNtE+l8E8YqOyDCgoIXRxaNaSZQJhLLKTn1lab9PnEwfJ
         CtmGXXJFsiuOj08AHWGsjewqvaNc1q7vbkUhOOQM6r20xIPXhBRZ0UkqXSW0GFGh8xUz
         peQg==
X-Forwarded-Encrypted: i=1; AJvYcCU7fDBtKfQpTl0pCyC2lx81vitmcVXYDnOuQA36JEzHLmo5JOwwHi6WYXGRUNsOUJuM/4eY4gQ+3Q9oaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMm+7QnWcH346W0jec24Srlrp5wG4Gy9TBNA8g+5ByMxQPdCdr
	MNxnFka5CKDCDCtmPSSDgn7XThN/gKI7+dgyFBnYXJHhGXXTjWVD7XMUhgH/2Ac=
X-Gm-Gg: ASbGnctpI97OwuZk+hjl3C271QZYMTpLKVSkqge8l9iGJz3377fzOVvi2Y3TzzUR8HO
	7TqbTIILqzv3W377bxNYm2zxgv5IsEVsNDZecS8fyCoVsX5sQI4OCO3wT/e0bUoG7oa3EIbAXL4
	9tC0e0LM8SkgE4mZQ7+hcbecPq99wRaExSm1pv8OZycnHkK7jLrYrnPsm9W8UZ3g5hpxAFvMUwQ
	SJmXkDihfHbw4XvFzXSJegRD0xYf23V80g10mzaEaAxf4G54NABGJyG88TKS7R/GIxxaOTcdIa5
	0lMalFkATd5ElhJBLM4AdT5qFxngPxJQUxlkhT6zzBCMSjpDFd7RBup1/SY=
X-Google-Smtp-Source: AGHT+IEBjSa7BEvi/m7HE+DJPaUWRCsNtnzB4sH4oGiI1fsR12c0IUMic4Va6Q3p9IyF2GmVP3cekA==
X-Received: by 2002:a17:907:96a1:b0:ac7:25c9:5142 with SMTP id a640c23a62f3a-ace572b460emr52391766b.7.1745476805908;
        Wed, 23 Apr 2025 23:40:05 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59bbdbb5sm55424866b.90.2025.04.23.23.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 23:40:05 -0700 (PDT)
Message-ID: <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
Date: Thu, 24 Apr 2025 08:40:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/2025 14:14, Bryan O'Donoghue wrote:
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: top
> +
> +  vdd-csiphy-0p8-supply:

Same comment as other series on the lists - this is wrong name. There
are no pins named like this and all existing bindings use different name.

> +    description:
> +      Phandle to a 0.8V regulator supply to a PHY.
> +
> +  vdd-csiphy-1p2-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to a PHY.

Best regards,
Krzysztof

