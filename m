Return-Path: <linux-media+bounces-34393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A0DAD3042
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 10:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB6A188C83F
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 08:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4D2281512;
	Tue, 10 Jun 2025 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAGlQClE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264527EC7D;
	Tue, 10 Jun 2025 08:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543953; cv=none; b=BXtT/vdgIGgeF9kVu7lUShWRgkc+kjXS5PgtfGjtk+JSpQiNl909G40xtDmcsiqOSO8+eGpvG9sh3qcOtXTb8r4O6uL6IuAerLyWJoTZ2IfJx/X3yxwvA3qU+V45c4Jho7okcWtT/Vl2HkgPWsBZNVRqrpm+//CwhSd0QSCIAC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543953; c=relaxed/simple;
	bh=pGvauvieYwYiolCBSn4Lw2JXhkhZQIEF4zRiGV68/AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5obgkf8jSNch8dzf9P0mcY6Hh0qynpSOj8/63IaE421e+s9bKkOJC7jkB196l8od32Q1a0+us21Sfnh3RNuE8CAUiTTOCLtiVdmY37+Rb4NVPYo6S1nQEkQRthJ3CmSPIwz7tpJT6LLLQMvPBEwVmKBjiz4RL2JD2q7CRmFjig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAGlQClE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54d98aa5981so6232039e87.0;
        Tue, 10 Jun 2025 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749543950; x=1750148750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmu5xlM5q+wbKmkDcTikYWeNSMGX5E7OEibClfmyPzg=;
        b=RAGlQClECitGM8MFDvH4MmknYCvvW2os1nfK3hIreEdkOvrTLQwLQ53VkA603WtwX1
         LLaTIG6kWcY82MZ1XsyEpJF9LdmsmPmH2CLrxghaPmQN6Fn5765J3xaY6xUHuhb+1izY
         FASMK6djNdcG+E8DWaufPuGU2laTYbZpc9cJFPu1m25pYZBJc5878PLDKe1TjM2x3KUt
         UBPsAKTlVusRsB71+67/4IoULtcZ8jcP5WBfVFkp7yXSaoL0aLYIunNncqkL+T23257J
         4Y1OXkLpWhtdPb7kMqJJ/RgFnKNd8isIfekD1HwEPrJCuVs9r3KbNIZouDXAEJ2WuYD9
         NR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543950; x=1750148750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmu5xlM5q+wbKmkDcTikYWeNSMGX5E7OEibClfmyPzg=;
        b=KpPS+xDjV3lwrtv6EwHOB2u3JLawkTMDrmGJZGjsT/eQpgQvLug/FgyCR+B1FqwGi8
         KCy/wekamIezQ8ueVPXmc94XwtX9hkwSoYDJpyA68EbnPZT7KqsQn6QqSjUpE0Urdx6v
         eqNBLKP7p+0ZNhVC+W8g64VyxRsWGTk5t6lbbwMb7KfOtgLMpLV6EQgV2+HkSA9P2Pxv
         M7Ksfui173xptG4Pv67S3UIfh8R9Rlk9QtLe4Fe3ZDj6Pw15t5Tj3DbtysnyoR7a7zBJ
         V2J7CLY9pudXLIWH0okTT+hVxZSdhMHBAmLb0wijIfK9OY7Nn+xw1+TXPnUwTumE24fV
         wL1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgNLHW1YvfjVhNsdQrmgY7/T6ykERZdtL/ycgzP4wmClLQEWo+F7hiMZilDYqpPqVsqL7Xn9NiU7/HyTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl0sF7mLq/oIQTICnZTUKAF1vSAiK3ljnqwlO2DzaOHUZohdBC
	sBlJmUReQKFMHrDKtMEtRPGr1y7bMqG7CyjHLKdNnyj9+3C6y2cxqbhC
X-Gm-Gg: ASbGnctEZLzZeqCXP6KRNmcGJgY3Q8UvkU+48tpYl6yqjmgldAPkqHCK5tSpa8ZZfLf
	6p5OLUeuQH4Xj2ERZrCh5Lzx1Ylf8O2ADoombACgq+mD0v6a9RmxsFDGLBvn5lGaCxxsqmf3Gia
	SSngqx0qHBlZUcNEDJlmJ3oOaYX9UZ/U8EL1DajblbgS3LEIElXsqOBCy33CBjFAzdzow++5HwY
	4OkyEpGg55Amh75IenQhDNaT6y3qAHg60zN2HpOlpImIUsax6RkeoJpk5LwnIQ5xPwHBJ6/4wbV
	Yrb8SCC952qpy7WtCqvtrkTPDT6gvrVKjFez3GFvVgfcxQZOriRsxpGKxXV4yRyZRpRTVOhNriZ
	I8ikB5URlI3uP+h8ovu4WlYy7N3BvZ7y0Xlwn5Tjh+eSJ7w62jG/2qxo8Bwa+BFWgX4h9HKqcFx
	cRC/ZEAC/NMvvGCPBSpDbstsE=
X-Google-Smtp-Source: AGHT+IF76hHPrwjSwokvPotgutwwpbFV0e+QYImvflw14pJttizj1RcDHECCl4rbU/F3XGf2N30kew==
X-Received: by 2002:a05:6512:3c91:b0:553:6526:82cd with SMTP id 2adb3069b0e04-55366bdf94emr4141810e87.13.1749543949307;
        Tue, 10 Jun 2025 01:25:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:dbdf:2d4a:ad23:d037? (2001-14ba-6e-3100-dbdf-2d4a-ad23-d037.rev.dnainternet.fi. [2001:14ba:6e:3100:dbdf:2d4a:ad23:d037])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7651sm1453465e87.72.2025.06.10.01.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 01:25:48 -0700 (PDT)
Message-ID: <4d92cc22-3fc5-4ae5-a7d3-490bcbfbd93a@gmail.com>
Date: Tue, 10 Jun 2025 11:25:47 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] docs: Fix typos, improve grammar in Userspace API
To: Jonathan Corbet <corbet@lwn.net>, mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
 hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
 skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-4-hannelotta@gmail.com>
 <874iwoaa94.fsf@trenco.lwn.net>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <874iwoaa94.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/25 00:13, Jonathan Corbet wrote:
> Hanne-Lotta Mäenpää <hannelotta@gmail.com> writes:
> 
>> Fix a typo and improve wording and punctuation in
>> the documentation for Userspace API.
>>
>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
>> ---
>>
>> Notes:
>>      v1 -> v2: No changes
>>
>>   Documentation/userspace-api/sysfs-platform_profile.rst | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Applied, thanks.
> 
> jon

Thank you!

Best regards,

Hanne-Lotta Mäenpää


