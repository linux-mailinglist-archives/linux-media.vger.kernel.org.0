Return-Path: <linux-media+bounces-30013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E125AA85BAB
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 13:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B754A1B603EE
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 11:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FAE278174;
	Fri, 11 Apr 2025 11:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zc1P6Ea0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB7A238C21
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371000; cv=none; b=eiOhJh2f0Kvw0VFYq1QkSj1QfGe69gu2Nmie2VZVLOjTOO+MdYRnnNJ+AxK9Yv3vgfXbQ1gjhnd+hRvEIhCJGqDX4KyL1TxJ4cumxjhNXcc6izHLKJvXfpxYRzclnX4MAol5u5cOGI1iiHlOnJmFYgRVom1NmYXjrHBiu6IUNPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371000; c=relaxed/simple;
	bh=ITobTNBm1Gc5v5V7gvduzfEIZJrc0D/tLtfm5cITmQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLIaZNy15JHphbaooCoFkJx1qukhfga2B1+0NeWEYOl9y9VkWytNJ4Ig5+zPUkO4VPNT0+rUV0thgtSaSJ/8q8OgmSmOnBDg5vQi+Up25Ta8Q33qs3p7gdEpDf+Kns0xHOR0x9mPQQwrbIayqyI3Ww5utM8dPSJkr+WVGH8IDbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zc1P6Ea0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913b539aabso1071223f8f.2
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 04:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370997; x=1744975797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OPqkV2HVldL4zhFmR5iYsDPH20L6kRmLSe3SyWadxe8=;
        b=zc1P6Ea0UhcjXdjcxTDCo01WrMFHgj6sTXijSS4j9BrdkEmIJllxi8uD93Wdz2yL2y
         J+O9vVmpD/8P+idr0yEXzKr1rYuXql2iTrmf+flIUKT6vpvn8nD5OaqgctjNG81icWpn
         QfWym6DED8aKxwWH3V5ETutUnpddVnI78ksjtHjro2nlcpWPdWjcjTPDId/GwrsDimPq
         PcoaMuhmCO9cXhqaE32tEMJO7HE7TOjbmcxTOC8IOdJwh3kuGxBsRz40jPZN4rHO8Gt+
         e8TXyheHtRi3Kb4PgE0WuzfPUXfsg4Sg2rkb4nsPQugweli3eMvtovnvOJMw1H1z5FAD
         GH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370997; x=1744975797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPqkV2HVldL4zhFmR5iYsDPH20L6kRmLSe3SyWadxe8=;
        b=JeeIVz8yo3rwKW5DNZF4pkAvXgczo2jYhImCoMrRKQXp6r3q1x4V1pxAV31GywI4MF
         emyqZBntzMfn5WiUgj0FdTMD3LBptN4x+l6Rr7WA9q2gbo53ptxTu6zGL3M5FeRx3P4s
         rgaoYZWdhpz/DHDcYb2C/ep+v+wNU3WZgzO1Iu5PJtNdylKjYefOsoON3Ryjjmq9Ww5C
         2kHp7zGY1/B2HaAZM0Nrj83iDCgKuIp64eExNBHvp8OJHVVjkKQb2LhhjP1nWf9BXOkq
         lBn8YDQljgpC0CwC4YKdIh4OuHmoTe3lhl7ntWwA0NI+XZ0bhBOYjRCRHUNlN966LeTd
         hVhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqe6eycigyKlWbZ3Np4kd97l2H1JkH1p5j4l53fiX412e1SnRnWW/F+XfV7OSQkZVCvbkMBW/N/yD7Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxePO6dxgkU6zmIFkftnpefO+6AI2eXHte/jfd3EinNo3m2P9Jm
	KUgqsEBE/O5XVddz7Vznzs4N1G2xfrrngcA0Na/VqmJUmOVRuokunPUHtEilXdQ=
X-Gm-Gg: ASbGnct1BjHggMC8mjYJgpLtoB8tCO9lUU0GES1lC/YPAiFVFc5NL+S6rcLRoSbg2KH
	+6D+Tkb/W42CgBRLIOctWcaPF19lk2vhCLQKLV02iSWKFqBX3ldy08cXZveAh/0ZwvWyz5ptEcF
	gXmtiPbJHsDMrtXxql0jBkks7ug+fHve3Mhx6NmuTsCzQDlprLMH39v4svNEt3E6w5W1wMBYcHP
	HUoRHWndBvL5MO0NspU2V2Rv4IPM9BGWvo2Dg90gXLFncbPySzGQ9AkA2MAzjdItIKjgtWgU6mg
	Z3G/dewCOd4P9kSIIB6btQY0/nP2cKvrYnB00MJkg4PBRHv+3gGIMosJhiwagnms3+vKh1fHBys
	WUOyyyeP4jCxBR2+k
X-Google-Smtp-Source: AGHT+IG3/taatt+v25pIkOfJoKgD5wRRb35FWlNZ8G2ZXlKNOep1C2wahmiGGvzzfmex6GFbSNFb9g==
X-Received: by 2002:a05:6000:18a5:b0:39c:2692:4259 with SMTP id ffacd0b85a97d-39ea51f5a85mr1888827f8f.21.1744370996902;
        Fri, 11 Apr 2025 04:29:56 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5ec3sm81423945e9.39.2025.04.11.04.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:29:56 -0700 (PDT)
Message-ID: <5f10d82a-904a-46ba-b0a2-b9f1c1d307c0@linaro.org>
Date: Fri, 11 Apr 2025 12:29:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 8/8] media: platform: qcom/iris: add sm8650 support
To: neil.armstrong@linaro.org, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-8-44a431574c25@linaro.org>
 <919203d2-cae2-4ed8-8144-8303d185d773@linaro.org>
 <8005927b-8a2a-4e7b-b317-8db29501510c@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8005927b-8a2a-4e7b-b317-8db29501510c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2025 09:11, Neil Armstrong wrote:
>> This LGTM one thing is I think you should convert the sm8250 stuff 
>> into a corresponding iris_catalog_gen1.c
> 
> This is done in patch 1
> 
> Neil

True, patches 1 & 2 didn't hit my inbox.

Never mind.

---
bod

