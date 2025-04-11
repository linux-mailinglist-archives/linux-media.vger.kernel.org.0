Return-Path: <linux-media+bounces-30021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D143A85DCD
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 14:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E57B4C8559
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 12:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5033C221FA7;
	Fri, 11 Apr 2025 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kX+bB0R+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258E2367DE
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375663; cv=none; b=Aozeyh7DynNAT+ILNdnfB4rNQ1R/l9x4aKn497mPZhnQsf1Sgie1riUnEkCr8xMSRE73/1M/Tf6/SOmDXSgc0D+onJfPd3+1YyzhVXelJ77T8c1v9uB1sIBQMiSd3sgrO1R9rlhSO38bXLvmw/KkeAr5QGl63IoijyKxryY6B7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375663; c=relaxed/simple;
	bh=/9exeZYC0ln75OqXryQRe+XV1cck5q9ppQ2F9YveTOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NC7WLVhAJ5NpyVIKVCLAH6k3gvm/fLVcVQaOZ3bmG7kcNednzQKxCmzCLx6nOIAxhJZQCdDULham690WO2s7ZySuWm0bcqOEUVZ4oj7uks+5VXh2pe5bPrImrlTIRtTTydbjsyj1r+N0p8nEjzh/AsviGYaOEu/njCHym4zCVLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kX+bB0R+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-399737f4fa4so1027335f8f.0
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744375660; x=1744980460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2nnzdriq0ONqeToErv6soefY0Ll+iz/nW/gayWNpY4=;
        b=kX+bB0R+snfXBgtf6Zt/6qE+IbIniXskm1Swsk9vgNXOaoBq54T6M6JON9iULN1V9x
         rZwzuP3GtRYPFR8OGvoevGsK1jLy03zepPxfInaofowkZ1LQ3HRQ2CGVWDTUG4vXzRfN
         Y14+D3C9L5a9wKszkEFmZwefmu1dUbgun87XkJmz8iNWiBNbldhJFylHl0nB0Sdfbhaw
         utOOTRybSw1FkiaiAMLiFJtnxWMbfTrVhDUeV/11NSZN+WIAsLFPWPOPjvar7Znx6ujo
         TITsqybx3EXV/mphJDMGLlBNbYNtc3ruj9i4SoYekHJGl2zSN7+4JT7ATTNGLI8N+VsP
         pabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375660; x=1744980460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2nnzdriq0ONqeToErv6soefY0Ll+iz/nW/gayWNpY4=;
        b=Saubwew3duwV6ntPQASs115XXBquiDFWjZGR+GuG0R9yD8I2HqktG7P59JQ4M+28zO
         BsSagMAuzYtlX2J8LNBu0D3KFj0dBbFZwvgL1sFMZg26X/jTkZm+uqUofgyWRaE4beJ4
         zNZzeOMoz66R5wgvoCZfpmCgGDCJE7WrOdR3A0pzvf7/jA7WAcrKsadE/qWtNCJA1K5S
         /IZ2yWDUrfrkHKhFpaUWmuh88bY9Eyx3bK3FfrTwycjmtSKLhFNunMjrW0eNmi3c30sK
         3mKAKObsvMlYyRIp0zyZd8SYQhHWJeCb7d7zQMFr56lViarwZ4qyVSsSP4MOz4K8lrcg
         9VHA==
X-Forwarded-Encrypted: i=1; AJvYcCViWl52AkFU30Q4NFbsj4JfEmzmqByk6RhlOnEEtRTJUI6CnIdlK5emkPGJ6663XWesjaMEfWFwtAuVlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5evjmU4ohe9HLUV1/GGtuuHMKGP2nRmIUiamhOnJk61atrKk4
	/Z192ALyRfyc0yiu9corLpI0bkgcVO9ppGHxm0DZK1IdUJWho43hD3RZscAS3CE=
X-Gm-Gg: ASbGncsT7zOj1XGpDH4HZz6B4nifVNmMdvfcoKn0mMHNwDMFanT3nwOK/Vweb5lHpbS
	HTMl+UGZEwTB6OsNN2KXDwlaSKKr4PzX/HsvwY//5TnatUa7kwyMJRytwKWNjmaWbd/er+/YBrR
	607uar5TGNX1m6Qy67gWeOqo8YZQ2SgbePc7S79CG4MdAuAkp8t7zmoRUOMpvg8x/TTd5Q7iOUz
	54Ro5E6NdpyHyPHhl5PwyRB+EuMM4cy+vVkVq8wPlY0ntoenOwydY0aMP0QYS/o3cwCtEKAdRAa
	CU5K0yW5UkB3zvrTV/FqVWQclLDnUdkc9M75qeMNTQ0yX5W7jYfDdgrwfRfXJWTAI5ibTVFYeHR
	nA20Zpg==
X-Google-Smtp-Source: AGHT+IGUsechKPxsJWJXcfLxTXrYk8Q3dS5jwa5ESYt5puLqb643rMkJ3V+3UBY2DLpDKknF5+jlAw==
X-Received: by 2002:a05:6000:2483:b0:391:4977:5060 with SMTP id ffacd0b85a97d-39eaaedcb75mr1817205f8f.53.1744375660089;
        Fri, 11 Apr 2025 05:47:40 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572d43sm80924125e9.31.2025.04.11.05.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 05:47:39 -0700 (PDT)
Message-ID: <159f1df0-6c7e-40a5-9c62-ef6ebcb189ba@linaro.org>
Date: Fri, 11 Apr 2025 13:47:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/20] media: iris: Avoid updating frame size to firmware
 during reconfig
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-4-acd258778bd6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-4-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> During reconfig, the firmware sends the resolution aligned to 8 bytes.
> If the driver sends the same resolution back to the firmware the resolution
> will be aligned to 16 bytes not 8.
> 
> The alignment mismatch would then subsequently cause the firmware to
> send another redundant sequence change.
> 
> Fix this by not setting the resolution property during reconfig.
The log implies to me a missing Fixes: tag

---
bod

