Return-Path: <linux-media+bounces-19242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B43679947BF
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 408DBB26B58
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471411DC730;
	Tue,  8 Oct 2024 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JtjM9NNi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DDB1DD54F
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388232; cv=none; b=JoCQC+UewS5xRddwz1vfopMhShdqAsRc/bdrZbPM4EcYu5DFw8oLLVoTVWVax+HWn3/yTCtihGX2KlICpt5QmreMipRg+Td4/93Q1KRPI3u+PtiX3ruo/rrklh4g5+pnAKyIevuN8BJCx4XO5+aBeu+U10WvA7OZ7V0OyKUcbh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388232; c=relaxed/simple;
	bh=AvIf/cAXb7gv7K7QltyPmNlWcZlQEGDKitfw4yfs74I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJ9McPiYHzaVDZYvCNFWYVMxp3fjuL5kCAUx7tEgDc3uemLri4EffmK3PaB6pPARDWyi5LYm/H/FkY1mTyQNL/07lHNYlQTPKS8RLvQvA74eUH4m0jfkbBtlb7ph2rvpRfpMt5QzzPea77dnms8oo7nPuPbDaViMErWs8jM6RGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JtjM9NNi; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539908f238fso6193003e87.2
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728388229; x=1728993029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orTo5qvkhHaghQfSFG2C3pKNVKQQ230FuuT1v/qSo3k=;
        b=JtjM9NNiYxQkGzA/S/xxuo9t6Q+yGrwzd6y85xpZ94kL5jqFzp240qcIFjiAU0J+u8
         SGd5OFo2LaxJQVdTauGk1PPRNMvxy7623p7snz2/hMKB2T45DRZ8QasQmd4xveQpx6u1
         7JaN5I3yDlJBr1+aY6xT+4wcrgDQAYpOYAGjOzaGj6HzRnCkLn+cso2eOpGhmOrkH1wW
         Ag4h1j2fuJNlF7fgmWnNZfrnFuN/GyRYj0OCNeSqHHaXLbpidXH4vgxatBbKrfvCEaKd
         Xg0G7shLWDyCzTRaKMwXq1QiTaljPHnLVCQsWfC0RYiI9TXRJG5Yny2cqd9QhZ1K9B4A
         6JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728388229; x=1728993029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orTo5qvkhHaghQfSFG2C3pKNVKQQ230FuuT1v/qSo3k=;
        b=MxTLPevU3HOLbOUETtqULoTIKT3JVsZCNwDtmZ+pVVM6uwOA+U2OAZ3JWI+mnmzzmf
         8RTF4GS4ohnRKY3JwQtilQ2KwjmOX+ljP1IhNOb03y55p/VcmsIWj8BzKlp5HuUzZcR5
         3qtkd9GGkHi+odUGbXNuL3r1uy8jLafOjGxixkglbceAP2DsgXyr8rDcUeN305Sx3LYM
         3sCzfG+esV90hAVQ6EPodGv/qyroOoqDbZ5VPZiqf7+j7jhnImLi8wrjbLRmJygKb4RN
         cSnJF3Q745ZV4iSonNXDWFQX9FNX6YghSlzWjKdJl9FE0FxtRKgUo2CckaCrer3VSGZq
         6j5g==
X-Forwarded-Encrypted: i=1; AJvYcCUWcl6uiB9KUF6nkKqSAfrL6MrJGT6bSM1RE+6bX1mM6A6JsSCyk9ZpcI+9cpZIoDdWftVp298LiKdGCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXkQEEcTnEQ7anNWZ5a3qKKX4qnk/JodyBBZcmlf06UUl1mIsb
	aYfs7gYGAhqpXa7JP8TE0dyuXv4G9D8HYRPsEm2FvZ64Aaohf2oLO0Yt3izGsOI=
X-Google-Smtp-Source: AGHT+IFmYoMJxA79DffYEVCVfEsjDHlDmeVIQITg9i1+ZFlfwyf0+DWMFtDh0XjYziiaQGCHLlLUvw==
X-Received: by 2002:a05:6512:2810:b0:533:43e2:6ac4 with SMTP id 2adb3069b0e04-539ab9f0ccdmr6848774e87.49.1728388229117;
        Tue, 08 Oct 2024 04:50:29 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9937615e85sm476763566b.175.2024.10.08.04.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 04:50:28 -0700 (PDT)
Message-ID: <27f39cda-932c-4b79-84d4-be78d266ebdf@linaro.org>
Date: Tue, 8 Oct 2024 12:50:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
 <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>
 <datahu33nmsser2p4fb2hyncsujtkwaca377ivwmpc6yj2naut@2sjsbebfm3gf>
 <3f87e855-8779-4df3-8f26-e3d2b611d3e9@linaro.org>
 <313667a6-afcd-44cb-a6f6-0d550e8f68a0@linaro.org>
 <4bf490cb-228d-4f01-a956-cacbafa94e2a@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4bf490cb-228d-4f01-a956-cacbafa94e2a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2024 12:37, Vladimir Zapolskiy wrote:
> 
> I don't have access to datasheets or hardware of sc8280xp powered board,
> someone may either verify, if CAMSS level high type interrupts are
> supported/working at all or not (obviously its current presence in dts is
> insufficient), or check the SoC datasheet.

I've tested both as was submitted and your change.

I _always_ test my patches. I'm not sure there's a datasheet which 
spells this out to be honest.

Rising or High can both be justified, its really down to how your 
interrupt controller latches the state change. However I personally am 
fine with the change you've provided because I trust it fixes an error 
for you.

I didn't try loading and unloading that module but, since you did I'm 
happy to Ack the change and trust your work.

---
bod

