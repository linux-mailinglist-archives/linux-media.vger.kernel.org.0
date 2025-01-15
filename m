Return-Path: <linux-media+bounces-24822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394BCA12EBF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 23:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 516AF7A3F53
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 22:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF91E1DDA09;
	Wed, 15 Jan 2025 22:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YHGp0IwV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7AE1DC9BA
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 22:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981510; cv=none; b=GsKM7/aJ1PzZQ7yYQyf1T7Kk76LxVc++NSxsUceTZK6LGRKkbNaBXARXmLW6HPLXWdD7cJMGIXOtka36M4lz7evB4MOg7yqWNV4UdM59t3L740SRabD1CEIqwcftUn3CpxSnNAEPUtOtZVttPYPTubGKb+fP4MHNspKm8qmjZes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981510; c=relaxed/simple;
	bh=QxFEBGcR1CdG6irlGiHovcxB3ftN1n6CSXPIZNE7Bd8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Lu7WU+DAH/S0vjTuWz4ZUdVWMsWBSig2NjMzkCmKUUuDKc12nJuw+bggzCny9t1FLFC9YdaWS0gBJdX6cAWbJOMCf64N6TD2o58BoMjvjPRnaBCTLjO8BtjGPqoE5bVhX/lLsafj/FC/WpPCeLv2AsjzQgcJ8iUkORSZHzRJoVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YHGp0IwV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso1469725e9.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 14:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736981507; x=1737586307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vZEM/yr/sJJ+vK/Kh+SEVlD5R3K0fT0VdR1mPmEBOBc=;
        b=YHGp0IwVyeTxYBzgdt0B/mCs4WpZ+3UZBLf9oCPsq1VzPZ3c6y0plGk76WjLAB/iaE
         GEgV5g56MtpR6OMmQhoZNnxagvuc3Zv9PnL3Z3ACasVcKNyMwGGfbH5aSv6VzvRTOGgg
         OpOxkJoxXKg5GXhurgxqRlViEDgQOoRkHgbamqQuCZD8NUjtSr03i3AnfAmd4EKcP2bb
         wTBAbYT5i8P6lvOzZitk4jbb6mWJs7LhRYmQahEPSenHw7zZl2MS1xhW38MbKHZCx3hu
         oH5kpL57hhctoMbGj46a/49A8JAhj6ZADMFwEBUodR07wp9lmXP7WnZe/0n9MIkt/XaP
         OePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736981507; x=1737586307;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZEM/yr/sJJ+vK/Kh+SEVlD5R3K0fT0VdR1mPmEBOBc=;
        b=vDjeV2fT4IZHVy5yaDMbi6ky9qr/BFtzVMJc2TsrvVCgZKEBg3bT2UKQMrnRjwCd1j
         4wyTJ62+RR/UhjYsIx1VXBOy3Xz+ssT/AdTc7iiL3vh6h9mWwx6Ot6FNFmmJZpvJZZGO
         ToM/q9Z9VhF7JKQtCSvXT37wmAfNldyMxs2xYH6dCabyBSS2Pi/F75KP/5QIV37AQKyZ
         x7+oLmQtMQdzAMHTt/DjhFMlCpyWKXBaPBECTXJMNmNhn+IiX6FeN9ZxvpImK06CKmhN
         Wx6aAJ0cUNWTBn5ZdAWKAXfdfNcpwyy0umUxe4bt8JZ3io70X0nhwy6s+1eg8r138/fm
         IS1w==
X-Forwarded-Encrypted: i=1; AJvYcCXh/E95OxBlivPi0ydlumOEGInDiAtTWphhJhZZAy9sE41wxCjvtKOx2xB6CEHG4kHgsK6ZRvY+oL0t9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCBYxxFgW6tKlaglCqb+UhsE4s1H/r0RpO7/SQoRDj5AapkQsl
	TVeg4UBGsf2vi25ZOLzGxOVey3j0YWJC3xEK9J1Jy2EkVfCx/+HAtkXyOeaB9Cc=
X-Gm-Gg: ASbGncveQlq8eE4PUn4jk6hU/kJHhcM1uvGjhy49hNaZU0uTM8yv4/Epo1zSZYyqsY8
	UPBSlItMSX+VtUXfT3KF/0ow2jyplkdPLatmDTtO+e4ZErdJco3ENSEU/hf+n98RzjaacNJ55Yx
	4xRNlkftGXdqFiIaD0JGWH3ThpBogHuSM161ZO816o5xVWuFr4ZSprtfjOf6syXF5q3uTVqEHcg
	eDHKJWE5oAAVnQ1Um9qytGjttoTkUjJPnTgFyZg6Wi8/ikWT/oHsf3+KMC0qSGL7J3xfA==
X-Google-Smtp-Source: AGHT+IGUheXR4YGw0Ar+spKtPL7X4S4R5Etrl4Vv5SUbRLCIhXQKPJyNUv/uMmmcRx8Nwt1FXOXiag==
X-Received: by 2002:a05:600c:4744:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-436e26f043dmr260503665e9.20.1736981506906;
        Wed, 15 Jan 2025 14:51:46 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac707sm37448145e9.15.2025.01.15.14.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 14:51:46 -0800 (PST)
Message-ID: <42b0bf4c-d39b-4a97-a746-0a1f4c1748a8@linaro.org>
Date: Wed, 15 Jan 2025 22:51:45 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <te2nhzkl2mx3y7vknokzwtr7szfge7dum7sy37ndy6laot5yqn@urv7svjqgmk7>
 <1bcf0995-cb77-4e01-b3e0-14f88dc91140@linaro.org>
Content-Language: en-US
In-Reply-To: <1bcf0995-cb77-4e01-b3e0-14f88dc91140@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/01/2025 22:49, Bryan O'Donoghue wrote:
> Shouldn't there be a parallel venus patch which either has its own 
> module parameter to quiesce binding in favour of iris ?

I almost typed "either has its own variable _or_ reads the iris 
variable" but then didn't.

Shouldn't venus have its own quiescence variable caveated to the 
transition list too ?

Caveated to sm8250.

---
bod

