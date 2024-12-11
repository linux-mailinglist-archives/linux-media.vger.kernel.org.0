Return-Path: <linux-media+bounces-23228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B259ED90D
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 22:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8CDD282D13
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 21:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEC41EE7C5;
	Wed, 11 Dec 2024 21:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTYsyoXA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC5B1D8DFE
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 21:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733953889; cv=none; b=UsjR1AtoMoYGJBjJfrPUseUVfEqJA+aO9atc2lCHOn5AQjbulzTywYFn28g9lp55OMxDkGjbMkEicf87rfkwF4LACgxT5ofGP1OpCUUSWLISqJdBHeg4AUTDOjX/P9jvLAGMdfDPxepuk8pVk5rLWcI7TaLFI2ob6d6tcb8zcSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733953889; c=relaxed/simple;
	bh=+yXy6BdoGXWelmBPHZc9qjX32NLjGhezQ6I9xpgzboQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjlAfJ8F4cHN8fSDD5PhxyYCuPCIK3MmC93BkNPTsjdYTb11Yjz5SI7MSBme0o5sIog2QpY+RF9WqofK1iYpdZGJcz4EC7R7viiSjSIbeGktbNWl4KkiJWv+JKaOTBVoJnw2LBOPkkAdOvHrLe9Lvn/8HpJuExzTjEn3XDOWq3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTYsyoXA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso68947985e9.3
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 13:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733953884; x=1734558684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYzZ2PTeVoUiFSlhq2/NIk9JdJyxHxV5vtC1J1yNmdA=;
        b=jTYsyoXAwzydUppFwqJbLYePw3LsROjGZ2CpwhZDd+Y96kIdriPcF3eJL1Ni0i5eE3
         zl83iTGfma+BvaQkdp1i/vnziGhYoJtoG4MoCqwxOjOMbJTmeYcWXBKmg1IcGEgR994i
         Pl7sYVexMxOOK/lBUb582Bm/O1Oy48dIIbPZmlAUvYDIe4Yeu8Q3Fq3FFH4nuEQpHn4u
         HkgYkvCiRkoh4GJj57MEwqZyVYLBxFjtCSxNa5CA5GwxF4kgepWBEvTnA7wMiqmywBVg
         xAhlRAEMhMIUgSIMS5dGCjyo/7t5BeG/WRV9gKABMdd7ZOOwr3o3laEZnqxsnOFd5bi1
         vLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733953884; x=1734558684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TYzZ2PTeVoUiFSlhq2/NIk9JdJyxHxV5vtC1J1yNmdA=;
        b=I4fDpDWoXebPud0dj6trfy7gDjEr745Kxr82kowRgVtxHEZmQN+ZzwNc/wH5Hy3WSD
         zRpeowAkGYzKagkvs6MiJI8f2IWZDg+QxYgpMT1A2aRs8moE8jsL5027HUUa/HGVL3uV
         pMdi3vjaPRtew/nQaycnl+T35xYNYhuFTsBYxe8bOB4gxQNndG2ujnK9PlXwtjaJS7jD
         1aSc0k5yb9x/4H2UZF/l/ixvbCjffk6/n/sPDl/wuQbq07G3OtstVYHeoXyJAffzny4w
         h003CEAW+TwnUVs035wkjypflXTHPLnla1zsFSjSMgap/LEHgipVueVsZSvDKd5ezy18
         ypkw==
X-Forwarded-Encrypted: i=1; AJvYcCV8QKX+hP4vuEVGASs0xqMfu75i7bU3f67BbDxQkNbO33ZLp0XUxQcoGGs6j2FVhNkgXeAd8WlbVeBZBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/44fqVKSRH0r2Fao73kDsigKN8OE7khxTf05xaFR0jsAcD0Ib
	eQbyPeT2NdCqNbrn2/usyqkKSL9oG6OR3F+x6qXQzSFyyddxkYER9DLOpOtpfYc=
X-Gm-Gg: ASbGncsqEwl4H658cyUaZbFF+fPBsLYRf/hHhAKJYA/AwqFrnSHtixV2RHqrb18AUtb
	jGJeMOdw8IHSUdMBcXLz20v2lcoEPj5MrfkQXCKnLy9hdAEP5VldSLzp3cJljvP2mCxLGFRzHzw
	ePBsRk404eJjUEXqQMMCYheSuURhkFCOVsfSkOIwV+gwEhI8Zyo4S2zJVtgKbSaujMjt6q9bj1m
	T8IuY7b3izrKgo1/CBjFqXwENuI3xnpW7bifS4+5cruwvbE3c9jqS07GJHhdW9wvX8=
X-Google-Smtp-Source: AGHT+IERXM+Ul/wVHE5MSVkvGGBpzhvPZr2RXymggc+966GoIeTF4nY9lep+HP04CYzBcnnukQoIDA==
X-Received: by 2002:a05:6000:4609:b0:385:df73:2f18 with SMTP id ffacd0b85a97d-3864cecfe06mr3576948f8f.51.1733953884252;
        Wed, 11 Dec 2024 13:51:24 -0800 (PST)
Received: from [192.168.0.27] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da119abbsm240218815e9.43.2024.12.11.13.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 13:51:23 -0800 (PST)
Message-ID: <3108fcd7-7b6e-4205-bf15-529c850e2b5f@linaro.org>
Date: Wed, 11 Dec 2024 21:51:22 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] media: qcom: camss: csiphy-3ph: Add Gen2 v2.1.2
 two-phase MIPI CSI-2 DPHY support
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-15-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241211140738.3835588-15-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 14:07, Depeng Shao wrote:
> Add a PHY configuration sequence and PHY resource for the sm8550 which
> uses a Qualcomm Gen 2 version 2.1.2 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports two-phase D-PHY mode.
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

