Return-Path: <linux-media+bounces-37763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613DDB0562C
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 11:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75BCB4E3AC3
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9438C2D63E0;
	Tue, 15 Jul 2025 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LdtSC1Y2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B992D5439
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752571243; cv=none; b=EjuEo0ecc2M2zwSCZ0fBc9N7t56tZrslPavySmk9sg938B7nGNmFhxzPcKOA3ycBVb1VnBLzhQX8SjgW3xCIRRwuj+WnD30J4zwjXdUSv2xWklVoo66VSK6Ecqg8tv6kcT6gVrv0npFbrdofs2zgyInFChKXHHJz7jmdXsArNFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752571243; c=relaxed/simple;
	bh=OemvodW9GzFSWJ4bb89tBFPOUPsA8BlJ18STvzza4Fc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sZtUDbsclZyv31wRixtkkDauTHT1CXm2rMY65i+pryTGeo6BVy7e7mxzfa5Ety+VacrIoP5BUxlqaGdxv5o0ysuG26wJxJOAObHjmSXPjLBG2LxZQ4Buk/gcHefJvwtmcE6G0XJrXEJOSbmtrLndcdym3XabwXv9IP2ca+HpImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LdtSC1Y2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so515036f8f.3
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752571240; x=1753176040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1E/qonGhUcmwHnVeNtDrr44q90xBTvb4uBQ3BxXBTvY=;
        b=LdtSC1Y2auoIaZVcI4O1ov66jnwQLqo68Ub5IubuzSILZ4ONQIdAwqozLPSUj3Mg3w
         xoIu5dD+FBCS9AhXA84gYR+a3rWJBeY7WJIfXKma+kwLAYYo6cx8cFSvCqiJtMXN9sBh
         34hlsPY5xU2ADQ2oCI6aSK5WZmDIpxVTS66SkcSJVN9jX4UyhhstdnjBWNoghsbf/iFN
         x+okl9l9mcZAuWHgUk7KQMx8pVU56QZibuZdjz3nuUonrepV4I4I4FqCCyYPToisAdmA
         qzEIeILIEFxQi7ii3AyV2U8uNBI7EdbZpngXYYNng5PVijSzh1/80OJhKcLmesRT2ws/
         lZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752571240; x=1753176040;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1E/qonGhUcmwHnVeNtDrr44q90xBTvb4uBQ3BxXBTvY=;
        b=MOzkUf6DHxtp+t0KxFI+RgKavdfoQIbp7k0NIq0Rn4LwEOdu/EPgzCz8ckB10EgddU
         2TrzB9eRV/WOPO83udAquVl9CMeeaofRzoVq33o8joGKGgk3wMG9YaYx3aK96vKVNgPh
         aG8sJj0Q+sN9k+SI0smYCDjyI+o70WepxaUkKG07QqQ8wm+j2WNd4vu3kM6lOPQl8qX1
         +LY9EnpJ2Eg4H7yI5iXGMS25oazASf44yuiqYXLbOu6xTOCg0ixheir+PgWIKKL6W+py
         BemqWvMUqg/Vbxs3TZ3pknwYPWDm/jXYV4gsLuy+DD+q6xuo0a5w8fPvP79M/cPBGyG7
         WDBw==
X-Forwarded-Encrypted: i=1; AJvYcCX007/NPVDG5ubgziigS5zrtGf23UadWxMkdMgVwTlTvqkVLMiXYhb/K7mB5IPuDXSK/+Ao1D5D2Levcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaniyNpTdxHxvhbZ5dZyDXVnYNThIgaXYgXlDkoCDS1WJxAYq0
	aa+knD/nNuLF0HB9hNpOv5/PjVvqyJe95rxbpX1PezVQo99Fo/lQX3E0itBu2TlgrK4=
X-Gm-Gg: ASbGncuA0VziMK2NkWIG6N5/WOsTcVu1+TLPwOYILa9FYM/KSfxTvaas4WQQU0q8UhY
	dDqebGuwAUvGe2XtT5r05NQp+VFcdbbrWezoElSeg2KJ3LS21Rkm5BuCewfxzRvrWDUkpVDEVpQ
	LPUzCvCn0/LegxW13og4MvSCOE5IqmaadbGpMvvt/wuLm/eHdWUs6F8CZZPvdJBDJ5WD7jG2xFg
	yNrsPEMt6mxGStFJMc22fyipFzC6H7ioxkfyEJJCl4zz1RBM0n5NuYqiVN+P0lLkoLvr6j3WN/i
	90bNonm9E0XWyhPgfhXqqJsKQdqjIzl5vjDak2e146OQC5UMWqeoW1RdSXVHp9BDnlHmtNqe9Hh
	F6obl65jnBHrUom4KlhnfOgX5U3xFNT9yCrlS3sNBoQ==
X-Google-Smtp-Source: AGHT+IFgIrYKr5kPaWqOLL/LuDRPX4sYpz05RkS2bwD3IMEJN9VB46qV3MMA7UHaEpKlBugRNoBDJw==
X-Received: by 2002:a05:600c:8207:b0:455:f59e:fdab with SMTP id 5b1f17b1804b1-45629191380mr4115915e9.5.1752571239496;
        Tue, 15 Jul 2025 02:20:39 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e14e82sm14696167f8f.71.2025.07.15.02.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:20:38 -0700 (PDT)
Message-ID: <c70fd6c6-1a65-41ee-b0e1-f6c792867009@linaro.org>
Date: Tue, 15 Jul 2025 11:20:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: MAINTAINERS: Document actual maintainership
 by Bryan O'Donoghue
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, bryan.odonoghue@linaro.org,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
References: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
 <8772c48f-348b-8a68-2099-562a29b9dd8d@quicinc.com>
 <b83cc20b-44d2-4635-a540-7a9c0d36cdb5@linaro.org>
 <a4dfc82b-79df-3e3c-0964-a99db222c6e6@quicinc.com>
 <4f79424f-0005-4978-8c6d-6b726ee7e4ab@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <4f79424f-0005-4978-8c6d-6b726ee7e4ab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2025 09:06, Krzysztof Kozlowski wrote:
> On 15/07/2025 09:00, Vikash Garodia wrote:
>>
>> On 7/15/2025 12:14 PM, Krzysztof Kozlowski wrote:
>>> On 15/07/2025 07:51, Vikash Garodia wrote:
>>>>
>>>> On 7/14/2025 8:46 PM, Krzysztof Kozlowski wrote:
>>>>> Bryan O'Donoghue reviews and applies patches for both Iris and Venus
>>>>> Qualcomm SoC video codecs (visible in git log as his Signed-off-by and
>>>>> in pull requests like [1]), so he is de facto the maintainer responsible
>>>>> for the code.  Reflect this actual state my changing his entry from
>>>>> reviewer to maintainer and moving the entry to alphabetical position by
>>>>> first name.
>>>>
>>>> NAK.
>>>>
>>>> The roles and responsibilities are well agreed by media maintainer(Hans), with
>>>> Bryan part of that discussion, w.r.t code contributions to iris and sending
>>>> patches to media tree. The only reason Bryan post the patches is that Hans wants
>>>> single PR for patches across Qualcomm media drivers (Camss/Videoss)
>>>
>>> That's the maintainer role, so Bryan is the maintainer. I am documenting
>>> actual status and your NAK is naking what? That Bryan cannot handle patches?
>> I would say, you are reading too much into it, i updated what we have discussed
>> and agreed upon the different roles for managing venus and iris drivers.
> 
> Reading too much? Bryan HANDLES THE PATCHES.
> 
> That's it.
> 
> There is nothing "too much here".
> 
> Person handling the patches IS the maintainer. Full stop.

Based on email you forwarded to me and some more feedback I got, I think
I understood what would be the solution to satisfy your point of not
changing existing entry and solve my problem of maintainer handling
patches not being listed anywhere as maintainer. I will solve it v2.

Best regards,
Krzysztof

