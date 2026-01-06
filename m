Return-Path: <linux-media+bounces-50048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0F0CF9424
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 17:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C017430CF72B
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 16:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCCF33C507;
	Tue,  6 Jan 2026 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZXp++uu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007FB33C50B
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715166; cv=none; b=mQc4peufJBfKmq0XwjydOyMETUpgcOgBM1oX9+nBFOuV58D3AWtaDy0XhoP/L3DhFaVJqfVg7Lsl03lLZY9uYXpqUtoiMDq3VxjbVJsQlz5aJg0F7msfBUAVAoVLrHw1JKs/gFZmeP8mXcAzp+MIVOeaq9WqsecwhPJPGMSnwPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715166; c=relaxed/simple;
	bh=ueCY+mvsO/KMOr22nP5/FFGdjy8fsWe2E4gnFXrWFj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q61Amj+qjx6lJnOPszSqa8wjoOIufikdgdNOQpsuGgoNbIzWW6k+vrkI2opuMffmcPnBws2FnaJKQaIkEJKT9xnJxVQhzico1kizhA/ioV6ytgUw7pTKS/+ZxDP2yTxNvAw/XwVtdUBte6ppJhJJ05EQdojKXecBRIEN8eh9eWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZXp++uu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso10714295e9.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 07:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767715162; x=1768319962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4W2C9eI4hJYiNPglW3HtAsZGvKDbpvE4vgVhhGjmOEY=;
        b=eZXp++uuwpRWjoYbziJRzgbS5I164UG9vjDY06oAHGP+jSUgf0yuCOH3hJlXOJcJeX
         oDr3lhaMjQKrosKTiO95z3KuFwC+aGyqhxMqEfr/0L5seG/zyvFbD1T4XnBEHo8eR1rN
         IBwuyyD2npDHrlKrUEgm/psZ07oMXDKtFp3L888bMbd6GeRk6h1y7Iq77XUbdGLNtfCE
         JdSgz5nqOm7s+HcrlR6/AwRxcFIJ2y2UoGSntd5Kkfp+SbjQLr9Y3hPCKgatiIpuHOZj
         azfZhw9ofLL8SK/1tleKihrR26IVNwT/GGYEFgKFdBSc5a3OTN1GOCdkCXAFCmOnzg5Z
         AOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715162; x=1768319962;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4W2C9eI4hJYiNPglW3HtAsZGvKDbpvE4vgVhhGjmOEY=;
        b=l44VzePk4uthf1LoDUaAC7Cab3XzwBU4g20x++7+3WQDwBmSaYu74tg0XglRpA0PXh
         6lzGIMqsqYGazjqn2c9uNPvS1wV7sYeKNULQkFCr/mp2tH/ncamD9o1D9gwcpJLAC5Oj
         XJflbdx/8Dxj+1U6YBbTMWKO9RYoDEkyX+mP6TwAh+SJqDMtwEtMp1NaTtS4kffyDp9N
         klcd3FzVNCW9gDxPMbgVY9cNc6cRHiOZMfEU/NRYhToL+50ljhQqfjgvVn+OMizjuf0z
         2b5NMpgLl8g51NdYhELGF1Q/pf7s11FiwV/u4mOFUiNbOawpezkeOGYwPnrT5Tdm0jAW
         cqew==
X-Gm-Message-State: AOJu0YzeQ4n3Y8IzBlDEXDRHh6v8AMkc6+uOUU3ONfPrWUs6JtrP9uRT
	Ea3VlHHkzZSBjp4PApVx+GEZCvGWQILN4n+/SRGzOUKow6O1KAQmDF4I7o6ftId8DPI=
X-Gm-Gg: AY/fxX4Ytujjk6PBS2HjNAhHAxcBL/n0s2XNH9BvWpFfeWtfCwY+61Ji7uxjtmN9tAK
	PgRPd/B3D31j7z+LcPPM79lrDIaSlCHh0U9dSQX+lSgyovzOs43VtCco2J4oGB5GcE6Lb8pqsP/
	n8C55j/eKNDPu5Ns4u7T9e7RUXueDE6bakh6TK9XeeGNhuM5EQRB7Xl5mV3DWBIFt+06pLwn5UG
	SnfMuf5aN4xWrgilepCQYeS7o/fs0ESNMQnjDOxPdar+ComoSIPOG+CrpnQ9HRrqZ6NuPomY58c
	BOSikGLl4RR6zeiEFmYsNDv2kWPwgI4EW9/iYDvoil22BmwMuNoKjdO3lwjbM/cDSbG3s4AmKfx
	+dRJro9utLdHEsWmtZjR+IUNEQ2pzfsbtnZp4KnMsf3YoB3r/oEuiQAVhRSsiYBqtuIma8qpKHe
	pqQ1hoD2uLBCaACDMgjzI2e+ELDmNbN4THXKsqejeLWA2VX+AN6j70
X-Google-Smtp-Source: AGHT+IE81MyTpOihFiXfQldR76y9pRvsvI6sUpKphTO4w8zyeJMmkWKMGOVun4In3C7kS7nyI4yt/w==
X-Received: by 2002:a05:600c:3115:b0:477:fcb:2267 with SMTP id 5b1f17b1804b1-47d7f06c695mr41487175e9.8.1767715162204;
        Tue, 06 Jan 2026 07:59:22 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d836c7923sm6621335e9.6.2026.01.06.07.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 07:59:21 -0800 (PST)
Message-ID: <c4dd688b-6b57-4dd2-9c3e-4f27e50935e8@linaro.org>
Date: Tue, 6 Jan 2026 15:59:20 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: qcom: camss: add support for SM6150 camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com>
 <20260106-sm6150-camss-v3-2-d1d5c4d02b0b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260106-sm6150-camss-v3-2-d1d5c4d02b0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2026 09:04, Wenmeng Liu wrote:
> +		.regulators = {},

There's no need to initialise this to the empty set.

Anyway, I'll fix it for you on application.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

