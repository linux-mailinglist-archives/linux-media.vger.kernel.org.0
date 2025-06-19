Return-Path: <linux-media+bounces-35432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F71AE0E32
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 21:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 194687A4B01
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 19:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AA621CA04;
	Thu, 19 Jun 2025 19:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwEye9gg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F8222F386
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 19:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362475; cv=none; b=DVAuVAuL/y07xGV628inSo6xgTk5K2GEisawlkLYJ3PrV/19TyLqu+vOq2p1o2aOcYHUmIzxC5o+rGeipVbfpFYzbMqpqwz1FyszHQ1gwHcXvWNZt6qb0V/wvFWgCCOm/lk6BOeJoaKKOWibjj/f+M7dfwMMnM0iljqYfPGB3Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362475; c=relaxed/simple;
	bh=WEPqgysH2b56sy2q0Oh6sv/OxKTLVLnKJ64jI4P+DPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azOfune4hMspCUITnruU5Bd6TIxZlummp/3yHosL0D9aHoPwk6cPJ7OPumL99z9yCBGxCE2aw4C5RgNjLT2ITl/jT5l75qg9nw+d1NDO9J+Cu+0YYL+P7aVIUH5Sxf/NEskv06scAOWoNdJTGOQzjt44ZwhIejGPdNoQ2+JAork=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwEye9gg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cf214200so10478065e9.1
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 12:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750362472; x=1750967272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/YzQSu8b3RwwM7ONT/x5qPkpdt9kdrbaTFvzXRTwOA=;
        b=dwEye9ggOs4K4wDRVsUmMxZzQBJ212ilel6aAN3PMsQweFlnRvaTzQfPl40N/Onsma
         mLP5GReYoWzMX16XZkPbAZY03kjEdL0n56O5fMj3kWHiERUfJbnrD6p9iY1N64x4UJWM
         Cq9F6SuIMNu85q0qp0SWwkSOxRaZDXWiAQFNXYllEvmtZkw9UR4ahU3yRHD3kEr5drDQ
         4F+uwrNYbcmC5Rp7nTg5A50s1YOFfuVfhHwAkeLQfZcCm3SHyLQ9vh6u3/M3kkacVCmo
         H4ozFbTZLhJ6Y5nXT2a0c4fhLlj6ZUlQ4LL/fMECqrKmjzPjGcTbHxyOTxWPvcKvzkYe
         vvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750362472; x=1750967272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/YzQSu8b3RwwM7ONT/x5qPkpdt9kdrbaTFvzXRTwOA=;
        b=GW8rGlN42ZNQLOHt+WLNSkiP+q1CS81nydcZZJzwwJPyIUVzKroCJqBcg+2MICcGgq
         3MrjT6VB7J34Ion4RpdxT1ILFna1bftt+6pAInlo5nTr6OEN/ePznPFQ/6p0VJLhiUS9
         5M3n/OrpnX+OCTmDyxnojCf8aC+zOTdHBnNc8qEAuoAjrFWmtCF9cNA+P06FytL56Xje
         UYOCVDiscyb/jyGwpUBNVusq9zkUi/JEml8lZJL6cZzFrcS39IAjJ5FGo4jRO1R5XOrd
         Z6GHOjjh1RP5FTPCekkX/1NR4NoMOvTyrwARcF5R+TqtNnhHZ7upge9JBC4og2UVT6ZC
         QOdw==
X-Forwarded-Encrypted: i=1; AJvYcCUmxENBruuNNtkEiDw3e36fOiW8/npnYS8RjfCtjy/K7FS6HbE73rnnYFIGrXGBORKwklAooVWRs2TXTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGAhpq2vMoKIsRMiCvsxdtlkQnDVSUOHNQv+Kba9R0GmHN6v8L
	hHjltImDe+3jCllq37BUD82Tkzpj+/NpSNkbv+Xmt+aiYSkDjSBaPqgROSzCsSdKShw=
X-Gm-Gg: ASbGncuwe+Mh8MMHHTu7PMBBsjHNSIxcJnJitGuI4g3WQ/XNWWLyIs/uiVA64xPm54w
	VBD6jeKJHmWMNT/tGeLCP4jWMBtvlxhhSOSNf5Xa0rangH09sl/YDrgX/aKJ4YH+Y+2V6R3wsj8
	tk5sWEl4uZ3IhBXvKABE166kq61tiIYWb0nGjCVMGes9k7wMYoW9zw4QJLp9k4UTdhopmqPN1Xp
	nEMwpFS/i2WhqPLU2bAg8qTXRDI+ItCWcRNWr838MZxqesZJIwvCOFCjA6rkNUDJFveCPXPWdUW
	SFM89zd9cpVwSOzdjx3gTWC8gmldBr+26XiE0lW21gA2lngz8XK8ST38zxw7m4dfwS7vB8YuBUt
	5w3HPUPegFGd9CB9YVBIpAp3gzho=
X-Google-Smtp-Source: AGHT+IGZxmlzRtzr8nKo8ssqzf01K/9qytNTtjGgx1suMq0UZxAvJQnnjBU4fFayR2vokX4mkjxP8A==
X-Received: by 2002:a05:6000:2d04:b0:3a5:8d08:6239 with SMTP id ffacd0b85a97d-3a6d12ded65mr161370f8f.21.1750362472312;
        Thu, 19 Jun 2025 12:47:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8e0asm37175085e9.23.2025.06.19.12.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 12:47:51 -0700 (PDT)
Message-ID: <85b2ade8-7283-46cf-9246-f441511ed7c7@linaro.org>
Date: Thu, 19 Jun 2025 20:47:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] media: venus: hfi_plat_v6_lite: Populate decode
 capabilities
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, stanimir.k.varbanov@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-6-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250619142012.1768981-6-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2025 15:20, Jorge Ramirez-Ortiz wrote:
> +static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +};

This looks off, why is there no TYPE_ENC ?

You're declaring the encoder in patch 6/7 - what's going on here ?

---
bod

