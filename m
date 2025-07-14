Return-Path: <linux-media+bounces-37649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C6B0420E
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58D731A645CA
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B6E259CB6;
	Mon, 14 Jul 2025 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tYsinFTu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A498A2586CA
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752504213; cv=none; b=NSesTtlzIQcyQbx5EI+74ni8MQuat1UqXr0ruKXf1U5Z515vBt5ARhbXl+C8FIChcV1Q0R7Et4NDupyn60S5A8qq0MHq2yFDApoAyBqfL1VhnycqyQUiJHnpdHx25KDug8iC+TsF9765pwnN7T+uHHilji46dEMTajbvK2MHCq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752504213; c=relaxed/simple;
	bh=+NdErqoSXalIYrtUeTTaieZr8gJQiDPFDzFk2W/aqPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAvSIOI1JHI2qGUXRpsEVFfesqLfcyaQ7ZNEpb3oXbaQLWiA0S14D4WRQRF//ZNDh4ObKH7QJ/eRqGSmoXLyPJ3R6qWdDmge6hrKUpEOkfaFGMcnqR8PiFPM5VRrug1OmpO05+KQjjM2bRRW71kTW6aKylnvo7SEDsExy92UJMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tYsinFTu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d54214adso30143645e9.3
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 07:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752504210; x=1753109010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tkk2ePHatcopmrnLKR6jR3UX6aWlk9GOwUaArm5vOU8=;
        b=tYsinFTusDPSHTHilP5txIO4lvaxYHJfjN716cxYVJWRH3CwBCjd5ydxPxKwpFURoz
         DOnwaWkbjaImpLAFrEHcegwJgeVN7NUCAl0mnpkwJOVFFUlopnyhDFawnyLKq0C4e19Y
         AGTe+KMx31RfXzXmZUBsOxTSygheh08XpUwe11MbZrweRZYS/3bU6MlgXl5uvcZRiG17
         ac9eeVgabDZQjEzJa/kqLaRskFPRMwM0NDzjR+hz8xQTRVlv9n3iaXestxq6PVe6H0mD
         bSRYY5BlEanyr2J+X/oXVvdFC/Jd07Yl1jhKbtAhkyIoZ1mHynNGnBSNE0MuysM1kCxB
         +ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504210; x=1753109010;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkk2ePHatcopmrnLKR6jR3UX6aWlk9GOwUaArm5vOU8=;
        b=rpM6KOGVEdaX1bGax7wIyrl+36R/MPx2bZQymHVklhIZ8GKfPQ00/2n+JcpQ9OlowG
         Dw9YL3EQOl9z2th59G2CUMPYGspFmtb7vgqR1HCuWjsNx1lu7q7qgS1IqvmBq7qGNbZe
         ENpd0z3Jt4m4TjqkCoVXx7KNfOIHk6aVZ5eU6JkStBpiBo/m4TgSfW5MVLZCjeylPQI+
         VNGfZO/kanNBrzXzGMmWpkR4a0jA1HNUpJEHSc86JIJzNX12RKQvkF58PKjkiZdfqUNN
         Af53RNRPPJBs2wPC42IaOk8ZVsTGIzyeXigRA2M0HNGPlNZY6m4Oxdsev+ihxlrotJSi
         5aGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuhmaJYdl/7Hw2aRvPeNcyd4F528QI1TE8K6p5yKETAogyuskPr+ML3MnY/j8fzd0UbbtjDOhgDqm1yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycy78aOh3IWgFCe13VPf7M3W1+k3qP2Q/vVCilIXfSf3KY6Hjc
	UV8V5jzTZuVierl5FHHzDZBPo3aSbnUIjRnxW8NOS0weTiWVEcoQw2jjSM3vW2OQl80=
X-Gm-Gg: ASbGncsK8ahw27MS/mtufk9FEwzYDCQjKrImwSnhkjJ1dfyCoR98WRSBsuIX4XBDsRo
	W6uOriIKTVBYd1jSLFQNakPhpNWo46uUUaA6jH/0u5Q+VCcgXhHKXpwUMWXRH96YTs6BCSxjIeo
	RHNbI1huM92lzBF5ut1CdhFmK2IP69sN5qGqWCMRHd6rSHghXDv56Udh1CCZYFuqMnprtR9DcWi
	jUYa0SwS+8d3V1OyhskCoKj5nLB7/03tUttldbvIO+9/ec0TAQDZyoJDECxaRnoNz5Bf1TjU22V
	TckDPj0dddHcD/a+G8tiHP3HJl68Pvi7RwiEsaVD0SIU3305bVMqap1QQLouSH/KmDJqpoA4qPg
	D33C86J7zVxZOpoFkEEZhgMrpA+ffQg+2HzDSsJSdAbG1fRhrL9KDPsEcZRqx+mc=
X-Google-Smtp-Source: AGHT+IEtm3tvKJdmPSDwmiLwsHPDpBMJTkK2dAnaXapIl0i2sB2r0hRgPP5EDIr3l5jWUsMP16oQfg==
X-Received: by 2002:a05:600c:3e0e:b0:456:2379:c238 with SMTP id 5b1f17b1804b1-4562379c49fmr14225815e9.17.1752504210032;
        Mon, 14 Jul 2025 07:43:30 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5103c2asm171484605e9.33.2025.07.14.07.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:43:29 -0700 (PDT)
Message-ID: <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
Date: Mon, 14 Jul 2025 15:43:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/07/2025 15:16, Vladimir Zapolskiy wrote:
>> +#define DEBUG
> 
> Still under debugging?..

oops thanks.

> Well, the phy should be a multimedia device, and this driver is not
> the one, thus you can not use it to connect sensors and put the IP
> into a media pipeline.
Ah no, I don't agree.
Please see my previous email.

---
bod


