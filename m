Return-Path: <linux-media+bounces-34981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D94ADB64A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A7D3174EF5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01CC2874E2;
	Mon, 16 Jun 2025 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCS/55hN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5D3286D6B
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090102; cv=none; b=kW7sUllPalz69766Lq/BFksESGYd2OKUKJ0yNSyYJHnCSuDWbPbyZwH3EX5d1o2v3+d/ItYoLCXMjMzf7e4OKunqevP+qf6mgoxYcfZNDnwdIeoyNp8ZLYPNaYvLmz2wIRBRj/Q+vMhuNTeNyokS9crIAUX+jO8P9s6ybcv/r7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090102; c=relaxed/simple;
	bh=hRBgOq4APKw2y8RYVbZ1gYWD7szlzHz0G09X13KV7qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6pmZEKT/RViamnsuTJoZyaiCkF7HRguOi+av9F8c5bzD0/IktS2Z3rAuXBMq8+mXwLH/v8EIowABfObbNuXEkO8AcmXEE1zJOMeEyGpDobeA3EqDXGLxgoM93pkYdH+xE5j3fsZKfJx3xxAXj9kLfOvt5yen1pbIVJ8XG4+OM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCS/55hN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d54214adso36681635e9.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750090098; x=1750694898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5x30H0yIc6HW7ib5oxYVmHAekW/AqIC/RAZDFhWWGM=;
        b=ZCS/55hNlkd4E3ABvHjuL2k/lcwa2B72q4u7hhnQDvpvn5rQb4ypwJepn6GjeruMDR
         ypH3+YuNB5EpOlmBM6XtfT1TiWWNIpWtkOxmAOKG6Ieg74vZE1gPgfKzp5GCnCzII1Kn
         nWKzriCvHrjkirJ9PAt4QfZAmqc23faMQ928lyZp0dBtZERIkijwrshUPkqATqWTyIra
         /bdHrmJs0bcmjqWUTK5h/C+dTgk2yVsjAGIwMu+gOI/hL7eQdB7d/va0CBj+8tdeF9sp
         kMzRyTJxiUNBKIX63zjt/74sWJxH0wGuA26ucbx5/uaWFo2DX2o0eY+kbHvwGJl+zeL5
         NnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090098; x=1750694898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5x30H0yIc6HW7ib5oxYVmHAekW/AqIC/RAZDFhWWGM=;
        b=Bcr5qZlgzQVSLB4vpSaos5RGK/uZ2wANGZB7ozxYrPN8v7zds7WPsnTocGtHTCu1FH
         B6tXHkXkhcQ+PztP7F4jMJVrDMbkyxGm6LACBI+pszAOEK1F4QnX3KLJtJwrk9x79z7W
         c0Bsyk2bnu2rxlevkGb92ctzRhc/SarSXfKplmsBb5FaNM86oZjMboCejpZ9ox9qFdoK
         MICd8+GuH27JD+6SSH4psENciSkdzXghkjTAI38gWtBm5PiEo+LxLQd9I1BuTUYIPPzg
         5sqHBeEfbkmJS42o3JhSDI4mM1SgtpdCkWA/K+ufJDcQfe2gyt9o3xOihRb0wvFPBKfX
         6Yeg==
X-Forwarded-Encrypted: i=1; AJvYcCV2yzLAifTpLGERMoyNpgeeqtBIkA/PFU0ai9O1n8kngX7+FCK2mCwMqpmKhWW9T7ADBxdnpulouaiOCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweQZU6uCEWgvAyocKVZ3S9bjFOBZpzmUNiU+yuwxg18QzuSGzd
	+HdP4fIwTKURnNzB+sGMAVUJ3ymB69YlZBTXxJA1kRsDkHyUNctEJQrxQ6KJYHDyywA=
X-Gm-Gg: ASbGnctQpovdn9wRQChHhAS0EOyigmAc4PuniqZXxuoMaBmnq0JXAJuLaicWKlX0x3L
	QGS8RbC4xGLI8I3KvXZLGfeV3a4A6JXuQkDnZHyMGaBRm2vV5sq70JpyPQs+D3igs4mlDVzL3b8
	bOUYfxbw+atLOwEhz1VaqXLxOLFrszM/aW7iQpAr4ddjAv2EOQIsI3xFe9x4YoNgMm8frwTBbex
	Y0K+viCGt7RurKV50GMIMe1E4E0soWny9IGhHMcsnyzwettFtr61i92MZ7jMliOwajKsCogxq84
	k63A1O2o/bz0fbrb3E2qlALardvTvrTqSo3jgDj+uINnSlBnmqb23+7oLKrtIONcaXGX7SDyF57
	bznKflGv5YxGF853fNmv7tcH+j+0=
X-Google-Smtp-Source: AGHT+IFprAWkawH42OL4Sz9tt4KKrYG6bZs86pGWjUVLMBCA8Vbyzc5s6Wod8JkjjmaDSK8H+pKM+w==
X-Received: by 2002:a05:600c:500d:b0:450:cabd:160 with SMTP id 5b1f17b1804b1-4533ca46532mr100521395e9.3.1750090098474;
        Mon, 16 Jun 2025 09:08:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm147563205e9.4.2025.06.16.09.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:08:18 -0700 (PDT)
Message-ID: <2df8eeec-406d-4911-9c1b-1aafcc8be8d5@linaro.org>
Date: Mon, 16 Jun 2025 17:08:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: vfe: Fix registration sequencing
 bug
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
 <20250612-linux-next-25-05-30-daily-reviews-v1-2-88ba033a9a03@linaro.org>
 <c90a5fd3-f52e-4103-a979-7f155733bb59@linaro.org>
 <21bc46d0-7e11-48d3-a09d-5e55e96ca122@linaro.org>
 <fe113f83-fbbd-4e3b-8b42-a4f50c7c7489@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fe113f83-fbbd-4e3b-8b42-a4f50c7c7489@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/2025 16:00, Vladimir Zapolskiy wrote:
> Hi Bryan.
> 
> On 6/16/25 17:09, Bryan O'Donoghue wrote:
>> On 13/06/2025 10:13, Vladimir Zapolskiy wrote:
>>>
>>> Per se this concurrent execution shall not lead to the encountered bug,
>>
>> What does that mean ? Please re-read the commit log, the analysis is all
>> there.
> 
> The concurrent execution does not state a problem, moreover it's a feature
> of operating systems.

I don't quite understand what your objection is.

I'm informing the reader of the commit log that one function may execute 
in parallel to another function, this is not so with every function and 
is root-cause of the error.


>>> both an initialization of media entity pads by media_entity_pads_init()
>>> and a registration of a v4l2 devnode inside msm_video_register() are
>>> done under in a proper sequence, aren't they?
>>
>> No, I clearly haven't explained this clearly enough in the commit log.
>>
>> vfe0_rdi0 == /dev/video0 is complete. vfe0_rdi1 is not complete there is
>> no /dev/video1 in user-space.
> 
> Please let me ask for a few improvements to the commit message of the next
> version of the fix.
> 
> Te information like "vfe0_rdi0 == /dev/video0" etc. above vaguely assumes
> so much of the context
Sure but this is a _response_ email to you and you know what vfe0_rdi0 is.

The statement doesn't appear in the commit log.

---
bod

