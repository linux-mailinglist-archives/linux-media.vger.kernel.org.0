Return-Path: <linux-media+bounces-19261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E98D995050
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BB3C1C20D3E
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3CF1DF730;
	Tue,  8 Oct 2024 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v2PDlCkB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F64A1DF733
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394730; cv=none; b=Wnj5ui8bkJQWHadun3JLabEp5O07nj+kpgoClmkNU3ecDdv/wjcDA4gEU7anKM3rJNz8ku2+bsY1wOPXAfv2WBP33zwI9bkfA4KaK8P+FYZzJ01fpbYK9ZiQykERIn2b6w3zj0TlGrqs5PWyPb8AesqU1hLt2kc+mRpEKrP6DrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394730; c=relaxed/simple;
	bh=h+FjKSkkOXseefD4pbrvKcFY0aGc+YhwyzAc773RAps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gP5gVsgogQch/yQnKmMoOdKS07TUeoA8+xFpoiQxWR4e95+G/N7dsmbkNIwBqXR8fLPIkZN2DLk3BNsQ+vKwmzXfyVhnefwokZcxqkdJZSv5l41XaH+/Mu4Z89la7kKuV9o8F8E9TLLYEjT6Mme/B24ClJqGgBD4ApJU07wRshw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v2PDlCkB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c8a2579d94so6659847a12.0
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728394727; x=1728999527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1siymOtXY5RHDnbOyW0As7IZtlkLe8owsnuwCtFRgx4=;
        b=v2PDlCkBw4/J5Zg0ZhbtBSvq1oR2ITjT2w8NBdVYEnEa2qrPRjAX/Ed7RRTwr4Hx6U
         euxSf5e+r9C84FiFxU4LxS8FpZRFfD247Bmwm0IpaSOA606+o5/Z9C0PlVyGxDRV8kFw
         EaLrnqKEisQNiYESnBgjiwfuejlIKx5AhQ98Y1yrfNiRBeVtPdgWu/Ei+GYggn4uYL+E
         ER1pYXWEqKnIc2cbEdhcPvzK+xLsMiFQekRRM87a2kvuagkcR6z+b9fj57elRLcgx9BS
         5ZNL5oJQSM10AWq0smKB1drNHJp9Zd+a6T2+tcw/uKiTLkoJB1mZ7/j9KDFYSEuEENQy
         7nTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394727; x=1728999527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1siymOtXY5RHDnbOyW0As7IZtlkLe8owsnuwCtFRgx4=;
        b=wV/8nrhBZzQTkKbUaJ41DM99jvnmsM4KBlumFaJloGem+58eR2CL/Zm/kC0PV8c/ky
         ulKv46NOKMmO/UyD+8FHU6cF9AEHkCZI5QZzyhQ4oONX82Rqy/XrCYeMFWur8lxsOhEp
         T2pe71Q7lQoc19xoTYTWS8sIw3ucMgyPXbOhDrg4TPoKDtJHPhjKnNKq36n8ak+7ZLsA
         F+uSEpepWGtEEiOtQu0lWcYCB817a18UQkXG9X53VeYm8zrar6FXwhJFDYC4sso4vOiV
         6npWKhGSYMfEosgafi8vrpkAu9jZuTvXcQ5dgOtKUONM45j5eC0pEX4XwrmFkZys232s
         G5Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWL3UbxQhaEOyvOmMKpm9cowvSYtpGkxxtXBnAIxmqnrtTijRA5s5sT3buKYvOiddmz58uSXuAF2lvuEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfDMWhCJ43wLlxzaG5DHzjtbK7J5aWcAtz97DdEGL0GksIVpc
	CDclJ2uuoWY5iWCpX2Webks6dIjcvs3dprzqPkJIbIEc5Z6RAPZwC5WT5SVhNoI=
X-Google-Smtp-Source: AGHT+IH4YpDN7VAUNE5oAu5/pa6AiXE3xvfRMd3SCbzEXaCCV5t2GOBgv+8KJoyJjDYgqXkdiRMMAA==
X-Received: by 2002:a17:906:6a28:b0:a99:3893:d861 with SMTP id a640c23a62f3a-a993894079cmr1146699466b.50.1728394726799;
        Tue, 08 Oct 2024 06:38:46 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a993a3a1badsm462549066b.161.2024.10.08.06.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:38:46 -0700 (PDT)
Message-ID: <289430fc-a49d-471f-8287-ebf7275a625b@linaro.org>
Date: Tue, 8 Oct 2024 14:38:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
 <27f39cda-932c-4b79-84d4-be78d266ebdf@linaro.org>
 <8aa5135b-386a-42bf-923b-6ff999694da8@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8aa5135b-386a-42bf-923b-6ff999694da8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2024 13:01, Krzysztof Kozlowski wrote:
> On 08/10/2024 13:50, Bryan O'Donoghue wrote:
>> On 08/10/2024 12:37, Vladimir Zapolskiy wrote:
>>>
>>> I don't have access to datasheets or hardware of sc8280xp powered board,
>>> someone may either verify, if CAMSS level high type interrupts are
>>> supported/working at all or not (obviously its current presence in dts is
>>> insufficient), or check the SoC datasheet.
>>
>> I've tested both as was submitted and your change.
>>
>> I _always_ test my patches. I'm not sure there's a datasheet which
>> spells this out to be honest.
> 
> Datasheet, HPG, interrupt list in the IP catalog. They all might provide
> some hints, e.g. recommendation.
> 
>>
>> Rising or High can both be justified, its really down to how your
>> interrupt controller latches the state change. However I personally am
>> fine with the change you've provided because I trust it fixes an error
>> for you.
> 
> That's a GIC, right? So most of the GIC interrupts are level high.
> 
> I can easily imagine that 10 years ago one engineer made mistake and
> wrote camss downstream DTS with edge and this kept going, because
> "99.999% it works" and no one will ever hit that 0.001%. And if it is
> hit, we blame something else because debugging is very difficult.
> 
> If this entire patchset is based on downstream driver code, not
> datasheets, then it should be clearly explained in commit msg, not just
> "The expected type is...".
> 
> Why? Because "the expected type" means datasheet or some hardware
> engineer says it, not driver.
> 
> Best regards,
> Krzysztof
> 

Yes, true its entirely possible - likely even that copy/paste is the 
dejure method.

Lets have a poke around the qcom documentation and see if we can come up 
with a definitive answer rooted in the spec.

+1

---
bod

