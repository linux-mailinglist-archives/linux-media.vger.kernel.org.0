Return-Path: <linux-media+bounces-19477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7254799AEB1
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 00:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 867CE1C217A8
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 22:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD11A1D0782;
	Fri, 11 Oct 2024 22:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FEZugFtv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6E1CFEAB
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 22:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728685924; cv=none; b=XQl3ZIpVVs7hcB5OUsNhjrkDEdeDBvALVIC9xEe8CpmRBa2RwvtF37GaVmMvbF08JHkJNqI4Sjsw7afnMuh+um5llBF9g4V9lf9GPCWxIRCaAFS/RovalY8/ZrPRy9sDMYc2CS+P/8/OSLGa8scOZYHuPaxuVzBhbF9uUkIU5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728685924; c=relaxed/simple;
	bh=h8jDK5yst+t6SVTBbM8byilTslHC1KtG4mgA8TITvUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQyJ3QQZXs6W8vjVm8sPtKrypNr1r5epVPo39DElvhFM0a9nDw80DtpilXKdUMQsRR6uALurw6o+rtWc3JeAjHO1X1DHFJMU2phuYJes70w3Ik1Uig5883nfRKgAxaBzXooH2FHHF2bQm5sEikyA/59iBtbbW6OcmtIsV42N+NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FEZugFtv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a99650da839so414713066b.2
        for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 15:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728685921; x=1729290721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dYEjVJeWeKBsQqV478t9ZT5xyiJzppDYZSrZjIOGlE=;
        b=FEZugFtvl0J1+0FMamlhH9q/biPNHWhAriA4XtjU9eE2TrkZmD2AsgGyd/5b4Dwfqd
         M8C/3n+++QiIdVNSqZ9qoR5J25Spd71NWkKV9HSeMBynuIEii1+CVgOGX4Qdx6IUcoW/
         G9LNt9b370zP6bA4lo+DrpRGs1ymkKE70mcK32s0B5jrdnWrvySKiEe+wDrNTgNBLH86
         uq3E+yTkJVv74UQwELT9ryfIIvf9CoLUxXHWOI/YMoRll/xjYhnlOwYKN+d+WYfBVFCM
         /kHIXasjVWUzDXkFbOnPLdN1yWGZZyPod6gij9OkPVa07YOi4oFZrIniNrZcKwJ1C9aj
         n3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728685921; x=1729290721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7dYEjVJeWeKBsQqV478t9ZT5xyiJzppDYZSrZjIOGlE=;
        b=Unvgs2Huw/sU3u0OiVejrDBxq+og9aYA94by3YlvQS++fk9ycecugn1fn4TiZrqVzv
         HUwBGYf2+jhTk6LPVeGrfk5RFlo1QtdM1wuoSY78wXxhCpXCc3xsfzRVrq58BQn/efjk
         vWUdF6X2AHhSVbTLx7F8l49EAS8DonKI3vW0T4Ktf6dDrk9vWciq0xx0JZLxlxPWLiCv
         NrED7IoIHIclO2w7hVTIwoiJwlOXZoMAZjx10QAeRz2/7z9CrsXHmR1wifSYXpHCfPBP
         RM+vBqwm28VkYJpofPat32dAV6pkv0BNH+4Iy2yLI8Dnj6HFRQoL7s3+f9l6PZuVB3WN
         xjgg==
X-Forwarded-Encrypted: i=1; AJvYcCVOxLeZVuX/84wP/zpK7HAGK2ERSs5GLVZPRwyUnDwRSefqrzrSzFoSKnnMlzKV8+tZSY4aI63yA1fGEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLfkNfo/B2QtZRkv7GJQXDoDKJ8NF6EKS7bka9+ep4EQFQ0rQ2
	4FLz702dOt7xp4yHxuKAUwGLcySxbYhXcmppKceLxYCoEqPPv8joVyWk03a8Rbg=
X-Google-Smtp-Source: AGHT+IEbKbpnTVUS0yOgo8MSx+Fpz0QB/QAoFKFpoEv8h9F3HBQ1+TmCxeZNTaHD83KXx3oJN9KijA==
X-Received: by 2002:a17:907:1c05:b0:a86:82e2:8c64 with SMTP id a640c23a62f3a-a99e3c9d614mr104196466b.35.1728685921048;
        Fri, 11 Oct 2024 15:32:01 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c03b3sm256498866b.127.2024.10.11.15.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 15:32:00 -0700 (PDT)
Message-ID: <20603976-907a-4254-a79e-23c1f0e06286@linaro.org>
Date: Fri, 11 Oct 2024 23:31:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: dt-bindings: Add
 qcs6490-rb3gen2-vision-mezzanine
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
 <20241011140932.1744124-3-quic_vikramsa@quicinc.com>
 <nsylilmzl6zzukpgih65kmeibbllek6dpgryzkso2ttpuztk2x@3q5xiujcdujo>
 <b3c1431e-9a5d-4c38-ae7d-605d4a2cf3ac@linaro.org>
 <bzszh7m52o3xzeybp4odwki6bz53aqctolrbvvbqizvk4bkj2h@k7r2i2rhgyqs>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <bzszh7m52o3xzeybp4odwki6bz53aqctolrbvvbqizvk4bkj2h@k7r2i2rhgyqs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 22:33, Dmitry Baryshkov wrote:
> See arch/arm64/boot/dts/qcom/Makefile:
> 
> sm8650-hdk-display-card-dtbs    := sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
> 
> dtb-$(CONFIG_ARCH_QCOM) += sm8650-hdk-display-card.dtb

Aha, yes ok _that_ makes sense to me.

---
bod

