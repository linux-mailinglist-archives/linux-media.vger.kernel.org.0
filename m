Return-Path: <linux-media+bounces-21386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AE59C77F8
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 16:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC18428AC93
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 15:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922A91632C6;
	Wed, 13 Nov 2024 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N/96CZy8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E0013CA99
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731513412; cv=none; b=T0GIC378pYHMKnyFQ3j4DHcF4LOjJYQjPTvPQcTUr+Pdf0ZspjwNpuBk2Suob1+I3Wx0AndoKpUHR4sJasOM68w6eYpzAw+bmQwNrBHB27qrGtVYdKLZhmQLSWma7Pq8QzQa2Q9aurvRhhybbtc7WIH5y7ioV9IdEr/gembX3sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731513412; c=relaxed/simple;
	bh=512PZ1dnQnEYJzYlH8f7M+VkBeSt4HIVjfj8UfzH2kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u43+zDv1xlpDT2gJq8wn6toBhg8PcW8IKjTFb0wX1KPdHzbx2UypoFfEDW7u0Zgmaqv+0w4W5+3HVrAZnCbDTNjwVNZIugQk3GW7U1FP3Q7PiDJNWfWDChBSXcR9Vj5Dk0cv29bSzp6O6xoIw22aaM6uhEq3G7rfApOp9XxVQlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N/96CZy8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so57756675e9.3
        for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 07:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731513409; x=1732118209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7XoIUNDgbIVKqvmpsghumU2FCCPcdZHNjSKRfDqBaQ=;
        b=N/96CZy8r5NQWz78LFcWMnD/NqRWrqZYXn8emeRe+oYHh0Cgo9LKGYyVKHHK9vIGJk
         BXVgF1LIaVYoL32GhFqa5EEEAR+tHdbtgfz2DUzCDmEx5DJjwB5ACnkja63PO6YDLtQG
         0pAfYK49abAm/vU9CTjYBcy/j2c3mmOE6BNBmAmVgZ8SPz8wpXJTStjRem1l/f9dttbR
         o3opD+wrtJ90/2OxN9Hx509Nx8C6zoZrxueKlZn5UL5q3oC+oCW8tR+1Hvhzg/ZsWYk0
         hgSA5kHd6ijj5U1gTTvSIfYDfIaQ3lne7KzcLUVA57ezDoKorZXNMaMRJGu3wLWXT7yg
         b1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731513409; x=1732118209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7XoIUNDgbIVKqvmpsghumU2FCCPcdZHNjSKRfDqBaQ=;
        b=pkIwH+V/UDUU3DPjBGtLT+A5AFIyNhVFpwa0748DBZuj+zVRAfre7v9SNvBC1lEE2Z
         Lb8L7y256wGyz+1wftNlrK64TVrXDyjJP/MfEABPwt1ECMxjKufBR+ZymCcj78Q47tw7
         RKwLz3vS/XKSaSjOndQjyx/xkM7HzmYyCjBGCpXqJ9wmCh5B8mNFoY3Ec/pjWPqpZemi
         MS2RrB7igO8AbTbMjbXYl69o/JBdXJVMg6iCTDsDNy7UB0K9cd44oOl2GePgkXCOjahA
         dxvp2QEbKmOILUnV3hW1jaqDdA0hDEQm2jaX/N0/MlGPZ4TIQBSYVQbfLZBY4dOQ3jp0
         KgZg==
X-Forwarded-Encrypted: i=1; AJvYcCVbIjpOjaoDHkIEu+C7aUy49JWwgH8/a8mOm9LDPS/19/EaI65p2DbQRJ7t3hKWhD5QpxC9ObHyT2CBMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPw8o75VbSKymwPSjtfYgwZ4LBk3nzphkEmjtgvcqYPRlJN+X7
	Hzz53uv/4Nq6pHBgbcxll5Gt1VTJu75GjbvRMg+tpRs2sFDG256SP0YlnBfdLFM=
X-Google-Smtp-Source: AGHT+IGRiPY+evblCDCxVkg3CDOQ9hyE0qVJ4e+kMXiZjDE1ryJt8LXVAIOLtdfZSGuqwuFU9EWIWA==
X-Received: by 2002:a05:600c:4e8d:b0:431:52b7:a485 with SMTP id 5b1f17b1804b1-432cce78a1fmr61686205e9.19.1731513408826;
        Wed, 13 Nov 2024 07:56:48 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97ec9fsm18902490f8f.42.2024.11.13.07.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 07:56:48 -0800 (PST)
Message-ID: <be7b67ce-f601-4c93-a8b6-b5660f0e753e@linaro.org>
Date: Wed, 13 Nov 2024 15:56:46 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/28] media: iris: implement video firmware
 load/unload
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-5-a88e7c220f78@quicinc.com>
 <537ee97b-97d9-4ed8-9e11-eb3489eeff26@linaro.org>
 <f16dac0e-aa0f-5984-2cee-3e4e684e93db@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f16dac0e-aa0f-5984-2cee-3e4e684e93db@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/11/2024 05:20, Dikshita Agarwal wrote:
>>> +err_put_node:
>>> +    of_node_put(node);
>> remove
> Sure, Will make the change.
> but are we just trying to avoid using "goto" here?
> 
> Thanks,
> Dikshita

Currently you'd be leaking because you only do the put on the error path.

 > +    rmem = of_reserved_mem_lookup(node);

of_node_put(node);

---
bod

