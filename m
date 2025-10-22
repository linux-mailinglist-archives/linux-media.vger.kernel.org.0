Return-Path: <linux-media+bounces-45268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AE2BFCB33
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3564D500F14
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B5C34B688;
	Wed, 22 Oct 2025 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJwrqEJF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5834BA2A
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144703; cv=none; b=g1fClZZxzfPE8GQEqqfwsyqAAoYYc+3O3UquR2ZB5FoV55VCyZ7WD/ayKg2UTCcnRB7EZqEmZhK87AvAzZghCVYbBe16zq1fDsxZGlC1Qu6HLyVYPXSY13dSQzK4sYwGKbE9cXX0AnFkjx7+l5xZ6YZ3L8ZPjltfNQ7q1Z6Y3sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144703; c=relaxed/simple;
	bh=+lNmP55ZvOzuboNbO6AIVCl9ja7et+pSFN7b3PWR5y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PusSAS++E2gjKSJnd+GaJqrw0OzbVJRmIY4mqOIw1Mf1SVl+65UKuzo91Ma1em5XQbKx3siaHZq1VunwxCiBZgsteXSNSMKPKq+aalpwPIuro+RLsnAeClkc/UQqAMldApuoQlKJhHl67fC0faxSmlDACqNoeMqWbVYLq0cK3Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nJwrqEJF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4711f156326so55226985e9.1
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761144700; x=1761749500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9yHRG4JI34JOJGAAS4v922SyM9JvWMCsMtr/NEHzv4=;
        b=nJwrqEJFfgmVd1xfG3+yEqcERLAYqQqP7g+emT+JGXxxT0JsxR4pjYAb/5FeuBoycz
         3tE4G4T5IqH1tV5ExrhfjZZhI83G8R6LDsGm8hjvMXKHjO8m2qV4r01SCkVwUvgCNka1
         WI6rhCeYbucijaGAYMrWo32Ub6ZYMkDEnbfL6wqQtDRpiXuG0t99EQigE+q6+yl6XuqT
         M6nVb1z6i3mDqELqkBNRJIonBSVYvRCgTSbV2tMIIUwMMPd+zizVmIxbnnDZICCepPb7
         yu3c4dpgEzCf9b/C7Z06K2RwGPY0tkGOc9O+mWWOx1Yf+Fvd9Wf/ueabd4IcxWsO3DxB
         UFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144700; x=1761749500;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9yHRG4JI34JOJGAAS4v922SyM9JvWMCsMtr/NEHzv4=;
        b=uVjICC13I+XrLy5P2k//N5oH4mlanaRU40AtxNBuzOqTYnmTrMJAg3BFW6fyYGRJ6U
         k4pluCCshZ3Nf+69lXyVxnrowZNgJYgMU07JrmuDtpXaUCFnHlOvn23r4oi7AkjCpyQR
         JkPKM8BpTq+KG9X9ZLkqVKwtAR0wsmn99yXw5wYpO0C/JdSKTtD1yclMrefg6gDCw0tH
         4hfxW/skG7h7T5mlsAuCJ6suay6OlIQOL+ZkfOgyv2Jr1aCKCVvY2cv8dJOetf3z5FPT
         G82qkevW/9kRkDQ/1M7JyqdWNLme0yqf8DhLh+t2iO+IvaE/NoumAz23bxjIEdlQ/m/6
         FN3g==
X-Forwarded-Encrypted: i=1; AJvYcCUu0zyzanhIcubDipi1H3SgxE6rQIyUbKmLco7zrIhDAEibqbMUgaViURAVkl3ZqDI10OqW0vA3F5Pncg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLm0en61QtFJ24CjPMGbjlfXVrmMm9uLM5RDq5dqs7Vakf71lI
	BqA4FgAxBVg/XwTjw1j0ehMNVgUuj6JRpp1Q87427RlH3rNN1/QQggmH5XbRaa8WiE0=
X-Gm-Gg: ASbGnct2UTOD0aBlHTajguOz94PAv8/HTM1dhQxeDBQH8P1oXr7Twln7+bXKlZBHp3J
	JRqRP/3OlZZbohNyfzSobd2+rqTu2UKXug+xop3ISe5anxm3VyuNwBYVm5H51bzSttE/C0SDyhp
	vIuaxfvqOzcrwfoLOH2mxZHkVg12UogAl0niyMpGg0kyEBmctrU7/6cdbqQUVB1gN8lMpIGu5yO
	SNArbfm8jpVhS8lMBLq6ILCefc7G5xcfGuMGYdAtji80FRgRPpMrDc008HwsPcloxgP9uqEy0g2
	fKvsrSOuB94epVknZsBSW0X3Qss2uH3SAaMIPuLyLdxSNmq0pVFSiZvwo9tEvAhcosfS/qyGJm0
	ybpBJyNTXxoAqegdjXtY5+qWiFmSmIKvUwHYG3rRm6C8mdbKPEZKhVdDl1ybLh+NcshIPNQ/q6U
	0M5CPWxHQTWWytU4T3RTs+ddxLEhQYosRbo37adxsitwRbFOyjTl8f
X-Google-Smtp-Source: AGHT+IFN6BO2X6wxeB5Z3DkFGrzuZyz4TUKDb57huKKbsjsVDAwxVSn99GksYUGwPErkTVppl8SPxw==
X-Received: by 2002:a05:600c:3b8d:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-471179176b9mr179678425e9.28.1761144699894;
        Wed, 22 Oct 2025 07:51:39 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42d828asm48802225e9.17.2025.10.22.07.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 07:51:39 -0700 (PDT)
Message-ID: <bf23808a-4f49-47b6-ba13-1200d4b4c0dc@linaro.org>
Date: Wed, 22 Oct 2025 15:51:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <20251017-knp_video-v2-1-f568ce1a4be3@oss.qualcomm.com>
 <c9d8f76a-513f-4a09-bba4-cb8f0df1d2fe@kernel.org>
 <034bf6f4-0a49-4973-8536-28526b3409d1@oss.qualcomm.com>
 <d19b1279-3031-43b9-ac73-7e5f990802ed@kernel.org>
 <e1bfadd4-2d53-1953-beef-1350594c5010@oss.qualcomm.com>
 <miU0eB2Bl_rKVzJMoTPUR2-GweFHwQntP9c8-zLL57CgPPMD3ZEZm3_X61Q9Oao6tZMS4ypn2FsCfdAuauKuhA==@protonmail.internalid>
 <mtlwpa3m46qwrfjcpa7wapjjnllxopoip4mpnomw2ngteb6btf@2z4hrjr74bts>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <mtlwpa3m46qwrfjcpa7wapjjnllxopoip4mpnomw2ngteb6btf@2z4hrjr74bts>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/2025 10:37, Dmitry Baryshkov wrote:
>> EL2 DTS for kaanapali is not yet posted to handle secure SIDs. While it is in
>> development, describing the secure stream-ids would ensure to cover all the
>> hardware generated IDs.
> EL2 is a slightly different topic, it most likely requires additional
> changes, etc. I'd suggest focusing on a normal usecase first and getting
> the EL2 sorted out separately.

Is the conversion to EL2 only for compute then, Kanaapali is a gunyah 
system - Linux running @ EL1 here ?

---
bod

