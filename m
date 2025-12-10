Return-Path: <linux-media+bounces-48598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F6ECB40ED
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 22:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1199E311F427
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2432F329C65;
	Wed, 10 Dec 2025 21:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FH0LPmbJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248A330216D
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765401999; cv=none; b=GnXBdlFTaEFPpvDHuwNQ6nH2uqW6X4w+0yZswUqYm4/M1OApmVJ3caE2fIWK+z7DiKUOLiiHb2xRC6AwCDi5/6/MHGDgyXf3x7+dTH+KGbokE/AcbxRJ2ZJmWTjgKi3mmfeQqxMkariHqzM8vt32ijYM+8YxYmcn/hSXcb8nRqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765401999; c=relaxed/simple;
	bh=p3TIbq0R04u/FpENpp+SgAGS/YPFFARo8ydHHOWFLVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkxGdmx0miDu/ObONanIfL2XsGuuG27Z+csIzGqv2cCHKDVm+BSSKOVazPNTWGSyOwMq9xuiH+l6GmiRGOW2S6Ae8do/AM97/wsuUyzMcgr8hpUEF66lLmmzkO+tZFImZccJhNApt7Ao3fx+vxQi7IzC0p7GoiX2BJt0rRFMLl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FH0LPmbJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29e1b8be48fso2985365ad.1
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 13:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765401997; x=1766006797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnAZV48Qb8Z1eRTAl/r3BNX0BH8DNBEAh/DYRdoY1zA=;
        b=FH0LPmbJWq/2TghmzPXQWhUeE5XXcIARIm/ijhteKGB+Cb9+brpWkso4RmmAkhuf6s
         Jrzvr09N8Ramo3Ia9NmqY9psj2tdviXPA3dStZFs1vyqK0i+MfktSQHrzyEIV2JJtfEn
         idP0ALV2ikJlfU4svAZixylmFlPfqHLUAEWGLLd28xp64XKqGS8QeoVKTi3ETGgRVYR4
         6NtQendyfOblOHHz/rJ/lI9kNkTzkOIWluxcBal7JeAJq3bfTc1acLamAlBsjaS08sHi
         wiR/NOR/Tj5tztDW99vgUFnAeiqfYGGJdxH1/JxQ/4S1FQnVUYd2l3TMb1/2TjSLNRiF
         1KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765401997; x=1766006797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnAZV48Qb8Z1eRTAl/r3BNX0BH8DNBEAh/DYRdoY1zA=;
        b=ZnRKTn96SQaFA/4KwHTpwJ5mOfMKfYJX6+pjA55EjG8hJzBA6JsDS5OEABJyw5+AcJ
         x0zAkSvASUslqflc7jwUbaJMQGAfVWkh2NVkAFgzNNlIWehZ6rMmHaLR1KScunfuNtY9
         RaVyviK6LcO9/VRDrqMHMHwB1LciwQuxmr+E5UJoQAM3Jy/wtyhoRI4L9S/f7fXhqUZL
         6s0OM5S/EIZ3aDaIljyqXpnN8+NYjU7gnpuGErTXStT3hsLToR1k3T4gvds4qT2p4lsS
         wf4tH8TYFhWfFi/0XYYDYDxZjZ3zFKMYalO4zD0BFXr4Y8M+0fziDDrTK/amXJjF8fM6
         cQzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQm3VELET4plfSOo72EjO0z3NCMlCw8XnXuNEtAgwjbxvyG6HvjMpTEh85RYzq4ZhiSb+snBX/Y/Lt8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1upuFKbtUKdaJLTNHQxN70FnGY/l9p260gJrTjnqavgpgy0zy
	5n25f79wy7A8QQmGRkFth1/xtojbBSm0f4++mh/gHl34pgvHt3z3kZPPzPknbDJ9Ejw=
X-Gm-Gg: AY/fxX4kjlXtqGy4mgiWMNmkcA5vV9HArg7qi4BgqvNnxRU9aMOp71jVO4kyJi6YGC5
	c5ROr8CJoMdkHsuZ5t05uLiqbLfSjxuREEioIGOM2Z2OH85edv+MmPI+3zVdNNXzU5YOGuDOw8h
	D+UzZGNckhlhIYomvkM8TT5x6jUX8OVXcSqbWbzIEgaCP9G0XnsWm+UieTu4kN/0TceepazprAC
	B5v2GleqOsObF21/mnGsq/qC58h1Ozqmq9X3LPiqYKf2XQns7ptYe+o4ZUU4NKz6W41MSNxp/oJ
	g2EYigLSQeKbXjRWOoj+1CrtW7vdzPtLmE1aPlk2EvCD+gIPRIkPNM6T3vFwEElbha9IFOMRYof
	5wvsBc1S8Ml3yrgFynpqBIIICnvlCQ1TzgZV4NKcwKY0NonE4+1sJItsCd/UdPV2GLrJz8cOH+b
	kHRTedKtf7aeyUKYd3okqyebq6PSY2UtZlCVw+750l2wWVi7/ns77M5+RreE8=
X-Google-Smtp-Source: AGHT+IEzNSdU/YLLXpbFyGQxKDrGLYDcehreWFcYn2Qp+Tm1TZgR9cIY5gNkUR7m6V5ePuEYYhm8UQ==
X-Received: by 2002:a17:903:3c65:b0:295:59ef:df96 with SMTP id d9443c01a7336-29ec22ca939mr38293055ad.13.1765401997270;
        Wed, 10 Dec 2025 13:26:37 -0800 (PST)
Received: from [10.237.118.45] (M106185144161.v4.enabler.ne.jp. [106.185.144.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea040376sm2629855ad.72.2025.12.10.13.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 13:26:36 -0800 (PST)
Message-ID: <bc7784b8-b63f-4739-ba22-2fd7e2c23928@linaro.org>
Date: Wed, 10 Dec 2025 21:26:26 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: iris: Move vpu register defines to common
 header file
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-4-8d11d840358a@oss.qualcomm.com>
 <4pxuzfdcwr56gtt4rjgodvtmf6cgprpb3czyrqjktx6qk5kryb@njj7xwtnnjpi>
 <4411f6ee-478f-487e-8f95-bf0959363e97@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4411f6ee-478f-487e-8f95-bf0959363e97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2025 15:47, Vikash Garodia wrote:
> 
> On 12/10/2025 8:33 PM, Dmitry Baryshkov wrote:
>> On Wed, Dec 10, 2025 at 06:06:02PM +0530, Vikash Garodia wrote:
>>> Some of vpu4 register defines are common with vpu3x. Move those into the
>>> common register defines header. This is done to reuse the defines for
>>> vpu4 in subsequent patch which enables the power sequence for vpu4.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>
>> You have missed my CdB / SoB tags here.
> 
> Sure thing.
> 
> Bryan,
> 
> let me know if you can add while raising the PR, or else i can send a 
> new revision.
> 
> Regards,
> Vikash
> 

Its fine b4 trailers --update will pull this.

---
bod

