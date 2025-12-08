Return-Path: <linux-media+bounces-48442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B9CAE2AC
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 21:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C140A3062212
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 20:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCFE26ED56;
	Mon,  8 Dec 2025 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDf4WUwg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750A119CCF5
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765225828; cv=none; b=P/XtlWSTJecYRgs5gmG362W7rSyYy5i18268YC0RQuNvyS8/FU/QiYdQDBEuS1pCfIfTds9ZEleYOrRUt+0Gyeem+Yc1fd8aItPKeomKGSY90m7zY/4kibOJgt83gbSuDrZetvatjuXsbuw9woG86lvJEV/V2syRCIUYX+b8GaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765225828; c=relaxed/simple;
	bh=4gTfSSNqg+fvlBo7JqVvlKuZT3uQYmbGh0OanIIst0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fsc1JRLsiomD9vooEB6ab/C2gZhzeMi6zTosu5pEtPEp1ZqPKWiXta46E2/buZ8EKJLZqswS1x5HEcl9Z93DymEi8XBvVjv4WInarjJZTc7z8c5UlNdYHCsw28gs1i5+KmKpOz8r1vixALTQM7rKSWkUBFlr4mORcNuoL74bRfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDf4WUwg; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-341988c720aso3818763a91.3
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 12:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765225826; x=1765830626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hVqzapAai2jDs56ozffuGy89QQ/pBXghFLoEyD3GTBM=;
        b=oDf4WUwgGJRuZqQ2/CtTrVYwXogogPtF/dAoeHynN5Y5QEfHaq5L0SYMyXWjaHLoHq
         mC9BEjru4ve3V0whQVjf8dXGj9cd260y6U2nEv5A3Q3WWxLv1opnuafIjxRIV+lxwSlE
         +P6wTNrytlI+QrHxV8B2AU6Ae+7IcNFY30uWzpNKSP/PTAKRJWNaDUlJaudLTSgOOwji
         z+ZwG+QVoh2C4Qt/j1nHyr1vqV6ghmale/kW7SjFwYQUhdKjZd8srwhoFj6x+qB+uiNQ
         Z6qPObQWCPr2scQIK9C12ZhYuhK3snSHp9We4KOuzAXnDcipLTCTOADmHQ1EQeEWuIYk
         YieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765225826; x=1765830626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVqzapAai2jDs56ozffuGy89QQ/pBXghFLoEyD3GTBM=;
        b=rdyFXd7p8vybGsCPjZCkJIwNneyEKUSzkR1S43ivPxvGAEghIDuM3RikpCCEHyywxj
         L2+QWA1rkdB+WiyL+UGRZtS3L3iK8rtwTzPu687U0w3r8FatnQanbH7dTJqP6Tv+28PO
         pYVXlmuequCMRMLQybVCJWmVdUcrFCPYfSra4qyCDNFpMvXTnnCuFKLBDMQwRA2rLF3l
         EKqtBxF7qnO/HIJ6jHqkVNkpaNPRvU+bl92JcsggoeftNkI4dxaJ4PoXHn7qZPFIKJsa
         rduXtJVEJtm8iVEYgGw9YqMY3ni51GqfHFE5uTxI5IbTZajCyGNvoSAhkovrlHT9bIZM
         RwOg==
X-Forwarded-Encrypted: i=1; AJvYcCXBh6aW64DVfMMYMl5OzNDZ1i/+M1Ws8oL8dB5y0hDLrO+ovtkg+IaT19OUwP5Mz5RBNLL81siaRqLR0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7sPp6Oj+SFxay7MDHEbQ8PzYkLeN0yeVicfruaCh3V1UU6Q6
	xEVG/JuEsEFlaGjWZE4jmNV5qiuyQMa9FmE8SC25JwalAK/KstfAvGXliPhdDpo4/B0=
X-Gm-Gg: ASbGncvcUPgXxwQOAmo/1328qCn6K6mhgZBfykgOuUYDPikMLo8nZKDoARbo3fFVAu6
	zz0wD38jtj9/+hOdzgQbwaPjNK/pXdxfL4kIObqJXBJIkMerwTcneszUAZvu8hDlzYSfG1w6cwl
	xKSMXuJGuRDUm0ChT80BTHvnwY8skN+LR3y09zbeKDLRFvjZ36KuDs1Ry+teBm9PYGOFBSQ5gWX
	disctJZxdj+OmV7S3zYRFKTy6lGED3rQMI/3sf70IoRkyD25vk5kMXuLBgk22GVyOvHFdEq/xZ8
	hgRqItuOm6iGvv83Dpdx6iHCFpy1F0TEC55oDBfu76FQ2dvL7aySxH+xAYGYghMvItLFk53kWh+
	xZQCFpxsGeqM+mHjrXQbO3vNsy8KmlYtQQkf1JSPGcK904ODYb7FXM9rEVjs7sxcoc3q07y3aJQ
	D0gV0A7BuhVT2ISk6A2UF3GM6Ea971Fi6kbCabvNSm5MKxkR6PQ36nRo2T7ba+zg==
X-Google-Smtp-Source: AGHT+IEjP0E9NwWrnpIVACYqpa/sxffjy6AzRkSkorC++ujr05swS59yo9HQ4/sJ5bqizoD9pIsRYQ==
X-Received: by 2002:a17:90b:1c03:b0:34a:e9b:26b1 with SMTP id 98e67ed59e1d1-34a0e9b2796mr3171417a91.26.1765225825562;
        Mon, 08 Dec 2025 12:30:25 -0800 (PST)
Received: from [192.168.0.178] (p96936b06.osaknt01.ap.so-net.ne.jp. [150.147.107.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a47ab9d1asm92643a91.0.2025.12.08.12.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 12:30:25 -0800 (PST)
Message-ID: <b1894dcf-4c57-449c-8cd5-8a55be780138@linaro.org>
Date: Mon, 8 Dec 2025 20:30:14 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com>
 <20251130-add-support-for-camss-on-kaanapali-v8-1-143a8265e6e8@oss.qualcomm.com>
 <f4d29f9b-98ce-4e57-9916-5a37927db2a7@linaro.org>
 <2tvkcuipfaa7cn7goynt6jfzlcxg2d7yvvjqizb6p7sf5oqwuj@drqiyr3khoyf>
 <dc0da45b-165c-455a-8e03-7cdd2d2d2ba0@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <dc0da45b-165c-455a-8e03-7cdd2d2d2ba0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2025 05:41, Vijay Kumar Tumati wrote:
> 
> Hi Bryan, we are addressing the things that makes sense for KNP as well 
> in the next revision. Btw, couple things like a separate CSIPHY DT node 
> and ordering of the resources (that were to be added at the end as you 
> advised), I believe are not relevant for KNP. As for the GDSC names, we 
> preferred the module name and it's GDSC name to be consistent so changed 
> the latter as well to VFE. Hope that's ok. Please let us know if you 
> would suggest any further changes to KNP v9 bindings and we can move 
> forward accordingly.

I think its reasonable to omit the CSIPHY split but the other things - 
clock names, namespace consistency with previous version should be 
maintained.

---
bod

