Return-Path: <linux-media+bounces-34750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E48D3AD8B91
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA30B1892BE9
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 12:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA74C272806;
	Fri, 13 Jun 2025 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DYg7B2dB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64443275AEE
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816362; cv=none; b=XZsDdvxmk3il8z9eL0pcp1JMZ9/gFZ0eQfx4Qu9a7Jzp8eVY0au+7P1Ot0l1jRrlEMdD9qjpNFL7zevjDiwWEkvtqax+lAjr1GCL1w8Aa/dlnZZ9kvzNH8Q0YDbK5FyTtIo0sZO7tdG1wfiS86DGvOtipIJVJuUmtOWcH5MnDXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816362; c=relaxed/simple;
	bh=2UrFFgOswSPh2C5dGzSoD42CxvehITsQmFtkJbw2tfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JgKkTkQL4xvIyJWsAZu+IcueiEZvBFNiU14KZQSYeSL4f9Nml8LvaompsijRZKPip8BCQS6oZPDwjZnfOYFr01knBdx6tA5elhqVPMVT/FhSoXKXrfMc/MHi9WMZ5sUAIXXzxnzb0wt4z3FI1yuSZYdAZVZwEIkg1yys0zKlZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DYg7B2dB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54690d369so2086525f8f.3
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 05:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749816359; x=1750421159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezZ3om80+8wTckLGLk4euno4vPWbqfb7vjKUnBPCItQ=;
        b=DYg7B2dBHc0pkboS/9H/yCjCBCMgC3PD/UkU0GqYe2g9TijD0ACOPheaN8YliwChzC
         5yLtxMHsIMC0zesPt8g6+uqJE0Cvr/JAefZS/8U3+NoL4Z8VA/jg6sSFd++IHgMlli2d
         KgHCGlI8DbTePBL+OUL8OS2NkF8qtuV2TXmWyYTW6tWS2HZaqqS1808xqk4UlBX83+nU
         m0vuf0Ul9CFtJ8998FlFN3SCvv26wCp1WXoHBIJ5Ex1iB/KokvSGYpmXsJoibGOamxfu
         lOJG2dzhkefSh06S353uTL09WVXaB2V9zpFNj9G9hslVdOKIjbu5Q9jofhgCpnx+l4zx
         EQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749816359; x=1750421159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezZ3om80+8wTckLGLk4euno4vPWbqfb7vjKUnBPCItQ=;
        b=RMbO42RAQ5/vzm4TME4mhDCp4k3sYMmamA4k3IKMYFgh/VLvp9i8V7PiHfKi/xVLWn
         MPBNZ65t+aNkvayxdWXQbMjfsp/FS4B6vEs9aXKygjYTDmAdXbqBJc7dY35wk7wRAmpL
         Si6EDmgoBXYXhFQXYGLdY2DGVtxMwBx0VpgwHAZQ7Wnv1klgSW8M886mSgvhCQ0YZDO1
         nvZh9sSRv07KxtH8Qvb2RrM5Ip5tzDR3Nec0Sa3Z+nmRS4JWGl4FMjx9vc3uZ00GD9SJ
         JUyF8hr3exHApKRiMWYTcEoD1th+EOvUBERvklF8opZXgSoV01WmD/keH2CjN867GU9z
         5u/A==
X-Forwarded-Encrypted: i=1; AJvYcCWUSZp2uBZ1XoYwLjrfZ4/I44G8LDDY8DVM76GUROwXPeTl5Z75GonUrAWR9IFfN8hjwT4xCVn19e2+aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Fmhqj0fFT8g/O3ABTYvEKvu3GsXSwmiW2zNxyKDr5rUvXhix
	c5OaEyytnNbAdW8EfPKKD7BcdQgX/1yBWM/R3iunb7aUlvSjo8qYkeXALcIjaNntqaw=
X-Gm-Gg: ASbGncsvM20edZQJ5MdS5HnB0Kyx6bHHKhlptdXN2D4V/Q5RtKcjVebpb5zLCg0zd/b
	UEE63flmH7ML97Xk8gTxt79PIfVa3ld2KZek0gRbruXhoCQkQMrWLOgBEgTVf7IyGc0L7ieCoF8
	u2cs5bf8Zt6vXcWKpUCQVizyITxz/cV5IeuxNXitZKUrGKTmK3XqqY52fXX0oDCeixnyK/tg0sS
	qFV1EM5/uzwjhx2YHTkgDl8aI+F31Aop6KqNjx7WuCReKc8htnDRSpfG8RXFCSs5LWjD+Fdn99t
	++0RpxAxf/zx5N7v85TbIBl86vyIrVc5qmwvuilwm21j00wbEtpePAI2vzdU7LT7iRUzwXazc4T
	lki82JdU8Q9IW5g0SmguyU4YkXmY=
X-Google-Smtp-Source: AGHT+IEhgG6sw/MTwwpOekg0psaag8qHgVPHdditd9mh4vmyj+KCnkStsZpDGIC58gJqzP6xAf1AhQ==
X-Received: by 2002:a05:6000:2304:b0:3a3:4baa:3f3d with SMTP id ffacd0b85a97d-3a5686dfbcemr2203429f8f.6.1749816358606;
        Fri, 13 Jun 2025 05:05:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2522b1sm49614825e9.25.2025.06.13.05.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 05:05:58 -0700 (PDT)
Message-ID: <37eec3b5-1e57-498d-8ead-891d1e5f96d4@linaro.org>
Date: Fri, 13 Jun 2025 13:05:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, krzk@kernel.org, dave.stevenson@raspberrypi.com,
 hdegoede@redhat.com, jai.luthra@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 grosikop@amd.com, king.li@amd.com, dantony@amd.com, vengutta@amd.com,
 dongcheng.yan@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <174981257597.425770.15369432320575770694@ping.linuxembedded.co.uk>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <174981257597.425770.15369432320575770694@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 12:02, Kieran Bingham wrote:
> Quoting Hao Yao (2025-06-13 05:55:46)
>> Hi Pratap,
>>
>> Thanks for your patch.
>>
>> This patch is written for your camera sensor module, which seems very
>> different from those already applied on Dell laptops (some of "Dell Pro"
>> series). Looking into the driver, I think this version will break the
> Have there been existing efforts from Intel to upstream support for that
> device?

FWIW +1

Qualcomm devices - Acer Swift 14 AI, HP OmniBook x14 both use this sensor.

I'd expect though that aside from OF bindings, regulators and clocks 
that any upstream configuration with the right number of lanes would 
"just work", including this one from AMD.

That has been the experience picking up OV02E10 and OV02C10 from the 
IPU6 repository where its ACPI binding and repurposing to OF/Qcom.

So how incompatible could OV05C10 be between different x86/ACPI systems 
? Less than the gap between x86/ACPI and Arm/OF you'd imagine.

Getting any OV05C10 driver upstream would be great, we can work from 
there to bridge whatever gap needs be for !AMD.

---
bod

