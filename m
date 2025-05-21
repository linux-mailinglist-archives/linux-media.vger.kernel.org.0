Return-Path: <linux-media+bounces-33034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D75EABF902
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 17:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB58A17B69E
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2791DE896;
	Wed, 21 May 2025 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9IUi1tP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F4FA92E;
	Wed, 21 May 2025 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840662; cv=none; b=JyY1IN92zoxFodG4c4yJDEsp7JRzEqFSa8I1pmfF8fy96NXjeZCr4TZX9wKy8W+4Y7xI2ZWGtk0SkCAho2MWvwY885A7nFTMKgZmfZv1oagwUqyIEOb1fEpZGm2mHtVzqlvKinJ8DWruQshvpRJW2F3aFvv2NvvlXxm7ozgRSnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840662; c=relaxed/simple;
	bh=kUCnnPeOSrm8mt4CfbncjKmyFQkFlkZd5zL0vOVsP5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qaV4ZHdDtDOXehc2TFLPvm5WS5yThU3DISacmcE7dbJTFRtCM2t/GL24YImq6w1kJEjBWYNaz2PR5sHSXm4z8UucoB6GO9zN0Eyux1YPTe8Vqb1OzO0jodOK7hMXv1jQ2pyLUKuuIN2vfng8GlqCZNrr1pO11PXtazgzQyOTiLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9IUi1tP; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-551efd86048so4599197e87.3;
        Wed, 21 May 2025 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747840659; x=1748445459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bY5S7Wfb5ySyKh5UvVG0WBqudaowOyoDQxB/bdCEle4=;
        b=H9IUi1tPzJKqwvKYaohBcOFlcuQMlETUyxr5MTkH0C5CHwuwpaepyy51Pph8N4u9M1
         AGHV2lMsSkXk1nAtGcjRbMIG3mGNZEO9tBEBWltVY0m0IV1Gk60y+X/bAIST0Iuf0SjO
         pXBLD3uok8acTlahQUA0dX7m3xbWPPu0aiMqaLh7YpO3xnKasymyHGdlcan8v6QNHtHe
         jhvsyX0fFceNbU7oxRhc+he5nYUnzq/ouTTqZxL5UbGhEq59OxtB7QcpzLHtDScNc5bz
         5iPH2j/gRXYwZ9CCfljp1rIFFfbx/SxXVHwDVoNxRlNQfCR0/zOcEAmimBhi1ccwnzmR
         n76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747840659; x=1748445459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bY5S7Wfb5ySyKh5UvVG0WBqudaowOyoDQxB/bdCEle4=;
        b=BxqtTV9mcw3mUDhhR4CQ46/WvmKA1xzxCceAutK0BrPHGF4TWS2yPmZqTmvdp9XRbz
         ym/bHgWd8QxTN0OxiTC4BIysvv/TYLrg6NjJjO0V1wDhNTB8Zr3VQmRYKOsDcfyhyG0V
         Sy5nmjMgz6lmjOlV4Hzrd+n44X3qpD1k8LaXrqKeKNvC/K42Ecns37MyQlIdmjR1a+Lu
         HJapFw7GLwwCln3HmteltRqRdxp7zOIiMGkLBUP7SEZhpIqkQVPScdBrMNlL1AU43E3s
         LV+t7hQXlltmNw4Y7SxhF2vqDe9AP4T3wUQqd/I7ugg2Ha1BDC4jrP9ArMyrNYCPg2cb
         K4rw==
X-Forwarded-Encrypted: i=1; AJvYcCXpdMd7A7CWO+edsGSUyKLucwWLxA4kLesvBkD9ALVfDvNIXM4dbN4Cpl7LpdxOm7mEZUUkhbo26Zvhljw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww2ZmYBcXH9h5CJDEzf7pIDS8a8f9/LjfR/Dbj/3PDc/FYkKG/
	Uh+EPHcSNi8acz2vbXAqHS/Cgq79Sm9eLMPYh2HYdukDL6NrOx/dyvWj
X-Gm-Gg: ASbGncv37MCmb5lfG2bnyY/YSAzds5u+Hosi1E07Hxu8AJLd9/AE7ZrzfM+XgGY34TA
	LNCtAoWSWimb9ZtxfrjxO23wHd6wCgBJHPA+cHhPoEM5VsIvPgEcFwsxNTsnAPjLNSXOLszaQm0
	QG1gj62ZIPTI/An45jX5gZ1fYgpjOntAqyh0QnCkJYDfd13aE59365VZR19ygmmvltbAJ+BWRut
	yVCefb40YeAG1JUDHmMkGoqMwvQYNQdeiwZjYHHjElKH5+J4bw4o6Y/Wln84SLHguHXuzViwTh8
	YMF/h2f32SWyGSPe9UvEUpWjWU5TQd463j53zaQVVP0CG863Ovg/Qj/OVkpRZAp8kSj2uRvnOc/
	vqxXbEna41wmOVsZeEDRRkql1lzkkhzwCQ2S0nZgnCdRtRLF6a3WUwGB5n6E39ljed1/2b0MVL7
	u1MCcudhQGcjGmjx8kmPFDLm0=
X-Google-Smtp-Source: AGHT+IEpTliLMqbAZ45KCj30NQTnQIbtnS7k2akX1eclggrk0SecoLdw9WewNGAj/w+Zp405OJOV5Q==
X-Received: by 2002:a05:6512:3d05:b0:54f:c184:9de with SMTP id 2adb3069b0e04-550e98fbfdbmr7135214e87.35.1747840658971;
        Wed, 21 May 2025 08:17:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:53:1500:e8f4:97c2:d311:5b15? (2001-14ba-53-1500-e8f4-97c2-d311-5b15.rev.dnainternet.fi. [2001:14ba:53:1500:e8f4:97c2:d311:5b15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d476esm986067e87.203.2025.05.21.08.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:17:38 -0700 (PDT)
Message-ID: <b6954169-63d9-4cac-aabd-2df1642f98af@gmail.com>
Date: Wed, 21 May 2025 18:17:37 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] docs: Improve grammar, formatting in Video4Linux
To: Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
 hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-2-hannelotta@gmail.com>
 <871psml4t7.fsf@trenco.lwn.net> <aCqIAkoVr2yvDJbN@archie.me>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <aCqIAkoVr2yvDJbN@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 5/19/25 04:23, Bagas Sanjaya wrote:
> On Sun, May 18, 2025 at 02:08:04AM -0600, Jonathan Corbet wrote:
>>>       description of the correct character encoding for Programme Service
>>>       name strings. Also from RDS specification, PS is usually a single
>>>       eight character text. However, it is also possible to find receivers
>>> -    which can scroll strings sized as 8 x N characters. So, this control
>>> +    which can scroll strings sized as 8 x N characters. Therefore this control
>>
>> This kind of change just seems like churn that isn't really improving
>> the content?
> 
> I prefer the original as both so and therefore have the same meaning.>
>>>   ``V4L2_CID_RDS_TX_ALT_FREQS (__u32 array)``
>>>       The alternate frequencies in kHz units. The RDS standard allows for
>>> -    up to 25 frequencies to be defined. Drivers may support fewer
>>> -    frequencies so check the array size.
>>> +    up to 25 frequencies to be defined. Because drivers may support fewer
>>> +    frequencies, check the array size.
>>
>> Here too, I'm not sure I see the value in this kind of change.
> 
> Again I'm agree.
> 
> Thanks.
> 

Alright, that is two opinions in favor of not changing this. I can send 
a version 2 of this patch series without these.

Thank you for reviewing!

Best regards,

Hanne-Lotta Mäenpää

