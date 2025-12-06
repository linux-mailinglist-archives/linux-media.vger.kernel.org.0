Return-Path: <linux-media+bounces-48359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87270CAAF52
	for <lists+linux-media@lfdr.de>; Sun, 07 Dec 2025 00:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF73930AE99B
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 23:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B62E2DA756;
	Sat,  6 Dec 2025 23:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O93fM6QY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F41D7E5C
	for <linux-media@vger.kernel.org>; Sat,  6 Dec 2025 23:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765064171; cv=none; b=BwCd3saL+eI1U07nXFUB8AvD1YCJPufuMQixfpc/Yy1VPnsgFArxBAsE9OCxOk4qy9BwGvv59kIlUjJgqrH2/6Q1hdQvw3WBoMVPfFP9uvAXqMRJxgm4VtPxFQ44pyHVBXZgSGP8DigMXX+bVOeJ5nUwYHYLOqwF18Vtxwdg9m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765064171; c=relaxed/simple;
	bh=n39ZtZQpgqh0rmdsLr3Dvs7oradJKbLY8rLQkbdX4Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dc8Q1jGfV2JVxfbwH0PAXSsVVE/+Rih3xvNspShkb/jdiUmrLfhd1uiA3r43Lizh8pG2Ac5M2dRSPN/tjS8g/KPN1S+UD+CUM55UEoAxdEQVenc3hDU9sYs//us9K1nJb9Kvvp0T5W0VKLzJUbro4OMCvL3NF68AojEZSbRX+qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O93fM6QY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso42749645e9.0
        for <linux-media@vger.kernel.org>; Sat, 06 Dec 2025 15:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765064167; x=1765668967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6OJJA8csQgRWCs4kKgByCAwLtWKbPHN0nnLUeeHWkOI=;
        b=O93fM6QYZtSOR+9TPhShlYS1/SQYKdyJeOmZQy/J2yZadFv8fHDVSWmXJ3Xznwr3Yj
         7y2rhexgh5N8GlwOLRCh9sbtUsIb8Ls7573/M17CQTHP/zf/6LG9RO5zTsGEhf3aY9MR
         nyOC/lto3APVNwefIqk+grhSs6d3s0HKcR4MQXK+2P9PQvf8q9uU69aRn0V+QAPFZSl5
         vmw74HurIax0u1Xz1vcdPX5yigfQsIO2uETYzVc8sTvxPkAXIBnJCRQ68s/t7VjMrD5p
         FpFyqOsG2jEeCokucIx0FvvpJIktIVH1IJiO1MipzNzjZKoAL8/ogWn9Tg5SwGajBzmX
         b8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765064167; x=1765668967;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OJJA8csQgRWCs4kKgByCAwLtWKbPHN0nnLUeeHWkOI=;
        b=kfchTS23tPpsgCLmaGHrfEzlRPpwTEBd4aeAe59PWuhhzB4As+Zk9eCPLw9wloHdcm
         xrLkyuVznjm2714zfCpszPbjJcwcFx8irglf0J65QAd3q9XAZ+inGmCsY+SEfqz9/tR5
         LmHvgo/pHB5eE+Dk3pp3WBkotQBvy0hCm0pNGaLbXvaFF5vLBxDT4FQG1oOA13fK9mAC
         6yW+xPsaqmv0uv9vzAxTIZAiVYhhFBzq0JW56YDIo4zDPqLFvVEV5wKRR/ekTWYyyald
         gGT/rB1yUWBUtjykRTn5QVluVdkjuLXTJM2ffqxE/GuGTu/K9kQ1cNkpIIhUPXbqhSGX
         y5hA==
X-Gm-Message-State: AOJu0YxpZfdxqIMNTaamU5U4AknX0qld2Iz28gd4ZAlkpV8tCR+iT50A
	VYTWkhAmXvErDMK3v1mBA5wbAZm/8iHHyBFyNbCTEaOyBD3Wtm8AD//3+tfFCWHZ86s=
X-Gm-Gg: ASbGnctsbLgVTRt8bqFPaXPyTGd4XNFHPM3jeByiE+Y4scK1ktaC3H9/aIVjCxAcP3q
	K0/Z45PoZ4OYK0A4l1aqbWXkNHv42l+FEtEjszYe544qEadWn72AYjAbrUGNoQf8UazK1MviTNB
	J/WdXOJYU9g6wol3M4W48UhjR0eKr2h6wZoQGhKY8X4zB11enCjx1w8J2Hcjqo6L32RS1M3RA/e
	mreuwqcBdWGdpSkr6/LLHYUoQNWe2MySbVZc+WdzUz1uZHmi/hAkO9UVL4dLuPRCdlULhAXie9s
	90jGc4YNvV4VL0j36747156QKBsKihmG+ivC+YxoL8JJPTryPVfGJlA/EquBDxFT+jx4ixoB/uC
	anHok5UAOAPzKe9dHRYvDuyzvKe72tosIWw5vTngWpOp8+Mlb7lfzz9ORTUb0CEBnh+PZo7grfP
	VIAkicN2pDHFx+SSgKjKz1ZrZfola9qkjJ39PLXOGo1StWakjHnxj7
X-Google-Smtp-Source: AGHT+IEQf012fIeorUGnrSpMbj1n0JAaRqvn4fJv5//pu7fi5eLlEUQnRB82jRweo5J65VWhlj78SA==
X-Received: by 2002:a05:600c:8284:b0:477:5aaa:57a3 with SMTP id 5b1f17b1804b1-47939df534amr37167615e9.2.1765064167485;
        Sat, 06 Dec 2025 15:36:07 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e62sm17312118f8f.35.2025.12.06.15.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 15:36:06 -0800 (PST)
Message-ID: <422cf96b-9f5e-4497-b151-7050f4f11924@linaro.org>
Date: Sat, 6 Dec 2025 23:36:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com>
 <20251110-av1d_stateful_v3-v7-4-9913a15339ce@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251110-av1d_stateful_v3-v7-4-9913a15339ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2025 17:21, Deepa Guthyappa Madivalara wrote:
>   #define HFI_PROP_BUFFER_MARK			0x0300016c
> +#define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
> +#define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
>   #define HFI_PROP_RAW_RESOLUTION		0x03000178
>   #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
> -#define HFI_PROP_OPB_ENABLE			0x03000184
> +#define HFI_PROP_AV1_FILM_GRAIN_PRESENT		0x03000180
> +#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED	0x03000181
> +#define HFI_PROP_AV1_OP_POINT				0x03000182
> +#define HFI_PROP_OPB_ENABLE                 0x03000184
> +#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
> +#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
>   #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
> +#define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197

I'll fix this for you because I'm infinitely sound BUT

#define HFI_PROP_AV1_FILM_GRAIN_PRESENT         0x03000180
#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED        0x03000181
#define HFI_PROP_AV1_OP_POINT                           0x03000182
#define HFI_PROP_OPB_ENABLE                 0x03000184
#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189

please stop using whitespace for tabs !

---
bod

