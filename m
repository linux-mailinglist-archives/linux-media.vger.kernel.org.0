Return-Path: <linux-media+bounces-40532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EEFB2F05A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 10:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E495A243B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7138B2EA148;
	Thu, 21 Aug 2025 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gd1NkhYU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E682E9EB1
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 08:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763236; cv=none; b=RPVsWqQnUCMmVRzMPVtrnge8Foikv7XvPtO2TsMiiPiCmmHw/sT5yDHlKIRY3JTGrGQtzAvjXG8Uz1lwvmHa4sbNC5CLWNhu4q9M1ur0M6zsSFRLmlafm1/4atWi5dog/BYIv8qnVNRdDDTyFDMykPcerv61Ml957mucickTEkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763236; c=relaxed/simple;
	bh=nSdFX6YFiyQhA1sMkUP24ByKKzkW03EQP5slt9hoFcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEFi+qbjAMpjSkJFcikAMd0QzxJyVZRPajZdUE4HjidDpdSa1LUQ4vBiSgwFQFdb6qXCcKEJ0hdtniSv2PoVCeewhgo7ctONo/Kg6LVRH2J4d9zo+Mq4uy7oyq2DPsLZMGvgjGKDLA9Jxj8nkEZFkWSBx21VVh9/ri6vw9/aNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gd1NkhYU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b4a25ccceso3672515e9.3
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 01:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755763232; x=1756368032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4CZogp1YICkFW9UCwIu4Zro2p9ruYldDB1qCwvtg0I=;
        b=Gd1NkhYUBfQwfUD8TZb9oSdAWpAYuflXMXItstJrNGoypTRMYeUhF75PozduoYWqsa
         paL1eYVkC1Brjnqar3K9mNro6inOd4EqrKXgIQBF8czynhSw7IrTLhb55i1oFlXUKtku
         0G72HJiRyb/zof+VPXn1jY6e/OmHZ2R0b1G1iVYkMbEZV3NOxv3bEC2fQYFVTlUPcxal
         Juygx3u3sp3U5dwcL1gJO6FK++nev6NYivgV5L7nxcwJpQWeLigQctFoe6p1SIs61FDn
         LNCkWsuRPSJeNawA5lWAMdvvObFttVYiGAXu82fkcQ1TfQyqmjWMT4tI3E1oRIP46WNM
         x+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763232; x=1756368032;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4CZogp1YICkFW9UCwIu4Zro2p9ruYldDB1qCwvtg0I=;
        b=IViRlI53f2TC0rdL5fzJVuVyuFOAlZQbCFxHmGEFqSvdhubAKrPRGqzK1tKlCam/EV
         RcRrLA8zSfFeGTgTLIrDSRlKAFca82SJth260e8l+LQktvx2kgI4DvBQPas3EaJE99as
         W9PmMGZ3uzVR27sObnBqLkhDlv85/IB/Bq/TYPO0QC93oM80nWBRu85+YaNMzRetHVKV
         Vp7cuBS27s7VlwWOoqproOz/nV3sW1ziIMj/a9y4uYrLR2ocC9Xfu5Nx+0DfVnMCD+Ch
         nsnViQAl5Ie5AbI1gNT7Lmx8DFX/6FMCg4MUIvU6gakJkl6rhrSMgZt+oV7XL/CGL1PV
         f3Sw==
X-Gm-Message-State: AOJu0YzIVGuRURjWhq/slGcojoUvdBSWsyrP4eFOX7WX7Rik5TFlnE/V
	aVbqoOMU0K01kG15641/8t/NnHRfWQj1ZH7v/mHm25Td3726WGV2r1ZybvdiTLdAC1c=
X-Gm-Gg: ASbGncsuxMKuPx24QvP5h1K1lmv7ldt7yxZ471NPZeHgfjd+HoUsvVz2XzWqmosUScv
	knYVpBsTUQs1GYT/wyCIPSiEmmDh3bt75R3OOyGf88sn1l4m1yArwCMwwHy047QR0vW2hiZip/5
	c5gbOdudCCT2mtM8lB2MNSpX6aHEfp/MKuy7gE6O5rHXECmgEaGEYBgZvd3QKwjhOdXZq457wsf
	D/36LtdNj7DN0yuBeV1uyeIdb/enPK7ZVG7CdCvM72tZK8fuUS1mLgv5yyi6H/CP/19AgMxbNE0
	WHWKI3TSzd/h1ceYsAqQ27RM8mVL9LqPdqKyNHd4Y+G6tqu4QryFzQSbTQVuRqoHzIPCdPhhSBV
	cZFQw/w73qvCU0+PNs9CAloH9RLd7wvKbElY0/zwsGsJdS32haxUDNGjX2WVSt+8=
X-Google-Smtp-Source: AGHT+IH6Fqdcvjum39HyYWBDMdga7HLUho0U+lPcQsWM3iSqd4stDmY2DPoOefkvyeKyeOFswOcWHA==
X-Received: by 2002:a05:6000:26cb:b0:3b9:1684:e10 with SMTP id ffacd0b85a97d-3c49549d218mr1161419f8f.23.1755763232064;
        Thu, 21 Aug 2025 01:00:32 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db41103sm16897695e9.15.2025.08.21.01.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 01:00:31 -0700 (PDT)
Message-ID: <2a6f2c48-1a05-460e-951b-417fb617e737@linaro.org>
Date: Thu, 21 Aug 2025 09:00:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix module removal if firmware download
 failed
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250820-topic-sm8x50-iris-remove-fix-v1-1-07b23a0bd8fc@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250820-topic-sm8x50-iris-remove-fix-v1-1-07b23a0bd8fc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/08/2025 18:06, Neil Armstrong wrote:
> Fix remove if firmware failed to load:
> qcom-iris aa00000.video-codec: Direct firmware load for qcom/vpu/vpu33_p4.mbn failed with error -2
> qcom-iris aa00000.video-codec: firmware download failed
> qcom-iris aa00000.video-codec: core init failed
> 
> then:
> $ echo aa00000.video-codec > /sys/bus/platform/drivers/qcom-iris/unbind
> 
> Triggers:
> genpd genpd:1:aa00000.video-codec: Runtime PM usage count underflow!
> ------------[ cut here ]------------
> video_cc_mvs0_clk already disabled
> WARNING: drivers/clk/clk.c:1206 at clk_core_disable+0xa4/0xac, CPU#1: sh/542
> <snip>
> pc : clk_core_disable+0xa4/0xac
> lr : clk_core_disable+0xa4/0xac
> <snip>
> Call trace:
>   clk_core_disable+0xa4/0xac (P)
>   clk_disable+0x30/0x4c
>   iris_disable_unprepare_clock+0x20/0x48 [qcom_iris]
>   iris_vpu_power_off_hw+0x48/0x58 [qcom_iris]
>   iris_vpu33_power_off_hardware+0x44/0x230 [qcom_iris]
>   iris_vpu_power_off+0x34/0x84 [qcom_iris]
>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>   iris_remove+0x20/0x48 [qcom_iris]
>   platform_remove+0x20/0x30
>   device_remove+0x4c/0x80
> <snip>
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> video_cc_mvs0_clk already unprepared
> WARNING: drivers/clk/clk.c:1065 at clk_core_unprepare+0xf0/0x110, CPU#2: sh/542
> <snip>
> pc : clk_core_unprepare+0xf0/0x110
> lr : clk_core_unprepare+0xf0/0x110
> <snip>
> Call trace:
>   clk_core_unprepare+0xf0/0x110 (P)
>   clk_unprepare+0x2c/0x44
>   iris_disable_unprepare_clock+0x28/0x48 [qcom_iris]
>   iris_vpu_power_off_hw+0x48/0x58 [qcom_iris]
>   iris_vpu33_power_off_hardware+0x44/0x230 [qcom_iris]
>   iris_vpu_power_off+0x34/0x84 [qcom_iris]
>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>   iris_remove+0x20/0x48 [qcom_iris]
>   platform_remove+0x20/0x30
>   device_remove+0x4c/0x80
> <snip>
> ---[ end trace 0000000000000000 ]---
> genpd genpd:0:aa00000.video-codec: Runtime PM usage count underflow!
> ------------[ cut here ]------------
> gcc_video_axi0_clk already disabled
> WARNING: drivers/clk/clk.c:1206 at clk_core_disable+0xa4/0xac, CPU#4: sh/542
> <snip>
> pc : clk_core_disable+0xa4/0xac
> lr : clk_core_disable+0xa4/0xac
> <snip>
> Call trace:
>   clk_core_disable+0xa4/0xac (P)
>   clk_disable+0x30/0x4c
>   iris_disable_unprepare_clock+0x20/0x48 [qcom_iris]
>   iris_vpu33_power_off_controller+0x17c/0x428 [qcom_iris]
>   iris_vpu_power_off+0x48/0x84 [qcom_iris]
>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>   iris_remove+0x20/0x48 [qcom_iris]
>   platform_remove+0x20/0x30
>   device_remove+0x4c/0x80
> <snip>
> ------------[ cut here ]------------
> gcc_video_axi0_clk already unprepared
> WARNING: drivers/clk/clk.c:1065 at clk_core_unprepare+0xf0/0x110, CPU#4: sh/542
> <snip>
> pc : clk_core_unprepare+0xf0/0x110
> lr : clk_core_unprepare+0xf0/0x110
> <snip>
> Call trace:
>   clk_core_unprepare+0xf0/0x110 (P)
>   clk_unprepare+0x2c/0x44
>   iris_disable_unprepare_clock+0x28/0x48 [qcom_iris]
>   iris_vpu33_power_off_controller+0x17c/0x428 [qcom_iris]
>   iris_vpu_power_off+0x48/0x84 [qcom_iris]
>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>   iris_remove+0x20/0x48 [qcom_iris]
>   platform_remove+0x20/0x30
>   device_remove+0x4c/0x80
> <snip>
> ---[ end trace 0000000000000000 ]---
> 
> Skip deinit if initialization never succeeded.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 0fa0a3b549a23877af57c9950a5892e821b9473a..8406c48d635b6eba0879396ce9f9ae2292743f09 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -15,10 +15,12 @@ void iris_core_deinit(struct iris_core *core)
>   	pm_runtime_resume_and_get(core->dev);
>   
>   	mutex_lock(&core->lock);
> -	iris_fw_unload(core);
> -	iris_vpu_power_off(core);
> -	iris_hfi_queues_deinit(core);
> -	core->state = IRIS_CORE_DEINIT;
> +	if (core->state != IRIS_CORE_DEINIT) {
> +		iris_fw_unload(core);
> +		iris_vpu_power_off(core);
> +		iris_hfi_queues_deinit(core);
> +		core->state = IRIS_CORE_DEINIT;
> +	}
>   	mutex_unlock(&core->lock);
>   
>   	pm_runtime_put_sync(core->dev);
> 
> ---
> base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
> change-id: 20250820-topic-sm8x50-iris-remove-fix-76f86621d6ac
> 
> Best regards,

missing a fixes tag, once included please add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

