Return-Path: <linux-media+bounces-26416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B7BA3CB24
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 22:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE7AC189F0B9
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 21:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D47253F21;
	Wed, 19 Feb 2025 21:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O+fORw/e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0012225334E
	for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 21:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999501; cv=none; b=nB0Ds1DUBtYBl1c/l+fG0D2fMt10lKFVoCKR+nvKNBpImYKO/7XO+Okoxj/7Qg2OyIFwcwTKrOU/siyIx5dOECmo+4TtGLerqExJQNQN4c/lHkv0NgXJJQ2Rf0wLT3eGXoMRkR1G3YHzG50kz3EKBYqdpSw9zsrBKN3LFF9sHzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999501; c=relaxed/simple;
	bh=PGa2rQkVCqGcvdXSluNZLLuuyUMqnsgHGaONK+L9V6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lyWzftz5jf9Wv+2pf48B3Dgm7Oq/Rp693LAX2Ge3BN2TU4m06I6JAtvTu7LwEJqATOEfnZu8Cbg6OuFAsO1qSJPnBOKoqGvZHjzEVgNa+wvEMFrAdzmhLczWUb0X/DXk6OgTzQ7qzLSzD2SRGG8rpZBcPhXzo7mjQg4Ll3zg88I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O+fORw/e; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3cfc8772469so793465ab.3
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 13:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739999499; x=1740604299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F7tT1yGSGZCPiLi9cXfTaPfy6ZirM2yQLUSmm+s4CHQ=;
        b=O+fORw/eYI6jQ0Gyl1bCr7f5dwvESaJ0z9fYsJRInKyAnlIpfieJQjhlpScW53v9t4
         az6i5akq1zr2KiPXCXA6Z7CNiuRoyBbPo87utrbAzlV0GGoMgmZdFeuokviRD5FSNXMm
         96T/zbJkOC6m63nFcCz5l8DmK5bQpOI2ZcInk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999499; x=1740604299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7tT1yGSGZCPiLi9cXfTaPfy6ZirM2yQLUSmm+s4CHQ=;
        b=O2YOMEPd2//LxJfBYiFnxK6+mgeU9gM3r9ZtjxyZtPH/Euau3a74jsQbK56g2eLgiC
         0CWSvqN3DuxwV+kg2yqgScNWlFMFT6Cea9VxuxUSJ2bVMW2cnqnUlNMY8VGD+HZnYZ2D
         N1Wf+U8H2K/vrgXah/o62SBuRhbRvugXefve2QmssVrBK0NGkiJEvt3HN/rFrlFQ/JBf
         aNqzLwtuxkFKSEe1aLq7ulHcGed+hSe7nqLbUyVCJXu4V5PTy2UdwWEPrqCMNPDI77oX
         yPzEeGjDInBp/Xl3sshFa+4P7NA22YBH6fpMZRkrbULj9W5DP34XypAZ+tDBy2Wi8QUI
         M1VQ==
X-Gm-Message-State: AOJu0Yx/0mR+oxZfbH96RkcPNIAcMB0/xkbcnR4Jb4uev/fOPZTnrSAv
	ijbvSPILfwrI0lvpTJaVpJJ+WsvV7w9ZQIz8vOshHnkUtMfi5tntqV07FSeCdcI=
X-Gm-Gg: ASbGnctVXk4x+0Wx30/xfa9Ve1virDHWwJrttmpvHEMhcHEySGtVwHkkDYFsQL14Tb2
	1WlwNShcKxIPs/3bR1rKlbJgT9vVbNm3OnypTri2yhL1vilmrCY0qJu62B+akjefJ/iVDQcBSvO
	AsE2pvhA5TRt1xKVo5xQzsQGaZYHU3HcnoYlvmUEGFCpp5T3GKxqsv0X7g2nBviVU0F+nQBtay2
	YZ8R/bnBYCopBN1PpmkPyJ9iYYmda6Zvexnm0m0rN47fORQJZpk9Kszfk3Rvv1NQYamyNhSpiya
	JoaSE3eGYC2oOYQF0/PWPB0KEg==
X-Google-Smtp-Source: AGHT+IHbiMmd6pm4ztK7iXzR9xSSArO8wZLiPdQ+1D9ZO47Ndh+1S88a89JINVkpcr76FT7K9xHfWg==
X-Received: by 2002:a05:6e02:12e5:b0:3d1:97dc:2f93 with SMTP id e9e14a558f8ab-3d2b538ad3cmr49413385ab.20.1739999499041;
        Wed, 19 Feb 2025 13:11:39 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4eeaa4f5958sm1178326173.32.2025.02.19.13.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:11:38 -0800 (PST)
Message-ID: <bed99965-09ad-4468-a5dd-f9615ffaf54e@linuxfoundation.org>
Date: Wed, 19 Feb 2025 14:11:37 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: vim2m: print device name after registering device
To: Matthew Majewski <mattwmajewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250219190501.295976-1-mattwmajewski@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250219190501.295976-1-mattwmajewski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/19/25 12:05, Matthew Majewski wrote:
> Move the v4l2_info() call displaying the video device name after the
> device is actually registered.
> 
> This fixes a bug where the driver was always displaying "/dev/video0"
> since it was reading from the vfd before it was registered.
> 
> Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
> ---

Thanks. Applied for 6.15-rc1 to be included in pull request to media
maintainer.

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=vimc

thanks,
-- Shuah

