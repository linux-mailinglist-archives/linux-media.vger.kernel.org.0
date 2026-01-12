Return-Path: <linux-media+bounces-50479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B04D13C32
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 16:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9926D300A520
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 15:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0D2361675;
	Mon, 12 Jan 2026 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXsIKePI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09286361667
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232630; cv=none; b=hi7zOu10+uE4F9JKiTjhNm10YoDWXmvmtmQnGfplDyp3R+eMHUpnU4BvmySbzbpSCkM9Iv4CLMCtL2oVVYAqGa54KcfR76kUZs3QXEYRPij8JzSt/05vAhWelSNDWd9hoErskbRpDIy24nnNoIohfqzCKJlJFmK/FYE4M7B67uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232630; c=relaxed/simple;
	bh=bDOKb4bt6pQUBoxgz/5fJcKrJ6eRISq2KUdu/jMV3n0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o31KVySjKmAgSWQXE7155Z0rOwnmJaeo68CXvOYx7w9nZSObvf6S4USqyIanpL49tKOwSALrm2sHFklNS6pn7HuQW6t0DW6yWP9tSRppWfR+u9VBnkxReAEmBpy1DExg0ez1gC2Z/LI7XdZl2LxDPko3YQ3Us6EJ0C52O/6SpVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QXsIKePI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d256c2e6so3209356f8f.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768232627; x=1768837427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CfITgAVylD2bxVCFRISaE2whe/NjaF4IpuobYf1dsMQ=;
        b=QXsIKePIN89K1ES1G3MQqDelrmG0Vh6AYWLKFbLnvHPGPCDOIM80XaHh047YtptK7b
         CV2MUU/ITMmVWnB4VmxUmsqqhBbR57pUaxogaewiqsycalOB16smaygLU2+uvR2zFBfG
         rlYXIXIRL3SwkTW62Sc9xevA9S5hboZl4AIxulj2BOC/Aa4wmCLbSoD4EEUi0pA/gSIv
         YNcCJIloh4ibr0Ipf+DA9jgqYhv1OiIqb65QHXAdQtC0wiSDtMnrhvGhZ2OMP9kX+lAI
         +6vu27A3PMefrQZBW1qQBGpDALlcG0+MWaA03kwayfFPRlDKGrFajKGcNo5/R/os13YH
         KrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768232627; x=1768837427;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfITgAVylD2bxVCFRISaE2whe/NjaF4IpuobYf1dsMQ=;
        b=nBzGj+UeqDBbBGEF7Ymr1sY28t00r73A3pQ7QqEKRPkHOVIfG4ZyFgfLDGQOoFXx8w
         5q8/PqmMbJgFeQmP6ItNofqxZ+rlJdd2ul+lHzhkcaDlaLBdte/zoMVxjPFXM0QBj3My
         f8m+gI35V0jJi8tG767B2u4C+EY2LTgfDhdE/OIN0jGAXe5ITbJ/GbLdynXopOf9J6hx
         zfnXu+WpZ9ORgIHD/DGdsaPRuGKhavr6M8dn6i2ogKMFtzIj7td0Z8CwoS73lo6l3C6L
         hkN38bSTZOVj9BkA5JLnIR4iFHtGD2alJYzmnh/xytBpAkq+eJpyXjukK1oPMXKAo8ek
         YwNw==
X-Forwarded-Encrypted: i=1; AJvYcCW6SvGosgmnYIuDzA+87Rn8C5V9aPE1W+jKgi42/v5/724cTYtfinwt85xyfdoRkG6w5+uQpWeZ6Ek1WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNLmAlqXezUlF2IOqVmDLdayWp50hIW7By8cFQZCCGCLL8Ddta
	MEYOSmr/8TNn8vvnt7DBNEN5fjOCLeKybGU6O/E0sqCZ3nMdPRwMHJoDaMHAos2sQyg=
X-Gm-Gg: AY/fxX4dS10pkJZoAGtVGNy1rSttaM5r13Nr4N2P4X1I3cM59KUG+WoNAmoPXbuCB/X
	RLSw5iDBqUN5VKQTMsNj53hwE5aENBcNAX7disXwni30OS4e4V9i1XmnzwdggIpq71hTS8ApPlx
	ZfZ196bs1UpgOnMLCrp7SI+qPX+LodJHalGXNr3pxXGU/M3XC60dMOHHfjzEjBJiERh+ANp7sU9
	SKgKamM+56qCzGBWHySfTO2EEcFc3joDIlhTcIBmOaQEbnUp1FHm+zlf0+aEUH3AcyFmvF1TT4k
	w4Ky7348SfMTLr2LCvQNak0dy/e/w1ALXOv/lwGptnLY2J0UPsoj9nBiuyANQssXXHFJkT3hz3Q
	nHxjvj8YhpD1TGmK/7GLsYP9MfbFHKRB/NgeqytWkejU8PBBTiWEICQmX9NUsndftgEEK4CP5Aj
	OY1rOwlkdoRZlADUdfD4RCmQAxIK0o2UKicCQGo91B5Q0QTr2q8jnD
X-Google-Smtp-Source: AGHT+IHkTHCS0yDczJqxEufBpsoO4n9Qx7B7U8QsQlmoG/9TL0Rz3x550kM7xKtoXN1SA4fkUD3sXA==
X-Received: by 2002:a05:6000:24c1:b0:431:266:d14d with SMTP id ffacd0b85a97d-432c379f21dmr22844140f8f.47.1768232626951;
        Mon, 12 Jan 2026 07:43:46 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df96asm38525693f8f.28.2026.01.12.07.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 07:43:46 -0800 (PST)
Message-ID: <250743e3-66d8-4a39-a487-947ae1c831b8@linaro.org>
Date: Mon, 12 Jan 2026 15:43:45 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] media: qcom: camss: tpg: Add TPG support for
 multiple targets
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com>
 <20251226-camss_tpg-v7-3-ccb536734805@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251226-camss_tpg-v7-3-ccb536734805@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/12/2025 09:19, Wenmeng Liu wrote:
> Add support for TPG found on LeMans, Monaco, Hamoa.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   drivers/media/platform/qcom/camss/camss-csid-680.c |  16 ++
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  16 ++
>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.c          | 128 ++++++++++
>   5 files changed, 418 insertions(+)
This is causing a regression on Hamoa.

Did you check the camera itself still streams ? For me, camera streaming 
breaks when this patch is applied.

Please look into this.

➞  git bisect good 
  
                 [git:60c1b50b1f2f5] ✖
9d1d90cca34ca66617ade951d42c94d5f086717f is the first bad commit
commit 9d1d90cca34ca66617ade951d42c94d5f086717f
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date:   Fri Dec 26 17:19:12 2025 +0800

     media: qcom: camss: tpg: Add TPG support for multiple targets

     Add support for TPG found on LeMans, Monaco, Hamoa.

     Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
     Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

  drivers/media/platform/qcom/camss/Makefile          |   1 +
  drivers/media/platform/qcom/camss/camss-csid-680.c  |  16 ++++++++
  drivers/media/platform/qcom/camss/camss-csid-gen3.c |  16 ++++++++
  drivers/media/platform/qcom/camss/camss-tpg-gen1.c  | 257 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/media/platform/qcom/camss/camss.c           | 128 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  5 files changed, 418 insertions(+)
  create mode 100644 drivers/media/platform/qcom/camss/camss-tpg-gen1.c

➞  git bisect log 
  
                 [git:60c1b50b1f2f5] ✖
git bisect start
# status: waiting for both good and bad commits
# bad: [2ae8c3645005e9115f39e8aa61dea9ea48cc356e] media: qcom: camss: 
add support for SM6150 camss

git bisect bad 2ae8c3645005e9115f39e8aa61dea9ea48cc356e
# status: waiting for good commit(s), bad commit known
# good: [f89c11002f67740aaed818137d513d6c3dbc348a] dt-bindings: media: 
qcom,x1e80100-camss: Add missing regs, clocks, iommus

git bisect good f89c11002f67740aaed818137d513d6c3dbc348a
# good: [18f74c5866cb470123eb0b39cf3248a09fab3ef9] media: qcom: camss: 
Add common TPG support

git bisect good 18f74c5866cb470123eb0b39cf3248a09fab3ef9
# bad: [9aaf62e09bb1bb17c186addc49984343623df50e] media: qcom: camss: 
csid-340: Fix unused variables

git bisect bad 9aaf62e09bb1bb17c186addc49984343623df50e
# bad: [9d1d90cca34ca66617ade951d42c94d5f086717f] media: qcom: camss: 
tpg: Add TPG support for multiple targets

git bisect bad 9d1d90cca34ca66617ade951d42c94d5f086717f
# good: [60c1b50b1f2f5466c07aeb4148df25227b5f6d55] media: qcom: camss: 
Add link support for TPG

git bisect good 60c1b50b1f2f5466c07aeb4148df25227b5f6d55
# first bad commit: [9d1d90cca34ca66617ade951d42c94d5f086717f] media: 
qcom: camss: tpg: Add TPG support for multiple targets

---
bod

