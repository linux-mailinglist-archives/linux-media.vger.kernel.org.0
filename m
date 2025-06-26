Return-Path: <linux-media+bounces-36016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B40AEA117
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 16:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EC3D4E15DC
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 14:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378C22EACF2;
	Thu, 26 Jun 2025 14:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y43KUiSx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AE62EB5B2
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 14:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948669; cv=none; b=SJgJQ0VlHaMYu63x3zETR2uQyTN80dDR/oUCEgIr+x22pR2icuRMqq1uh+Yy82NcIl+yRLRaJlPr1PGG1tLgdQXnBZEewt7V5g/8bfbkhhhXNqx+cu+0X5i+DDFAuk24g8FoXT6YXQQmuALLllpXX4LA0d+x2VOA3Q2nUcfkyNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948669; c=relaxed/simple;
	bh=j9P7Y9k+d1qUN1LH7k7uyoyd043tfylXAAkm4D+rmLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVO8vzXmq7oMdW7CbjMhpwuFVixBDNhPMcWyoIdiJ2gRPaGXyANdWx5P/UKbcUWsW+N+98IISbsWIR1Icr8JY1XPxfFGu3OAjoani2PKBM+heTfC+IQHmxhoKNW/5NQ/YO5fhJZ6G+GKAnnsRmK1Dva9L/XKQC11eN5NBZO/eGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y43KUiSx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso5725435e9.0
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750948666; x=1751553466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1AOh6zFRHKrc6fml+09g5+eTgQ+NcQY8jLNiJxnmas=;
        b=y43KUiSxwwUsC+kxWzoN08sFvWosK/wOJl8qGBh+YOa8ybgtHl/6v3hbafXtrW5lOH
         PpIOl+U0YsoOjiqD9EDOs1pnhBYAAGQ6flw80Osynu81qp9l27KxZdbUqsJZCA1O7w6d
         +R/r8HRJ1tynzL4MF0BLPX4ZOXyn/MnVRYCpRhpanI1Yzmfa8l01C+aQ87lPz6JaF8x9
         mflGKNCf1eMt2DjGJAwEnSOX+1Mft1OVzpKrg6vxfKIWefUtHGkz84QnNRMXqKBZxo2X
         KrEhVsQBu4m3W9gXgbnLQYr/US60WP0BDBBWUEg3W+r/8OybqtmWwxX3HOB/csmjCW/k
         1UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948666; x=1751553466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1AOh6zFRHKrc6fml+09g5+eTgQ+NcQY8jLNiJxnmas=;
        b=Q7iGi6xVOytcmXJJGBshO/D4bzsWZQ1UJIMwJzLdewhxahOsyEa6UQ+lvDkWiM4UFf
         vcX5PasX7ruvDhGlpshkDpprT6oIvLjoxTvA5hyA65gwMCgZm2NkLLGzlptKupRe5RPo
         1ssUJQHZOcpY0q07LcYiXOphAHlImeNM0X0VtNtbCXOzNq72587/C6sPq1JcpIKAhL0L
         ebmPUWrVmJxeOpzHKLzDzFStbJ6wDxUmkBJCuLsLjL/1Jaa7ijR7PgaQE1W1mN+vx0YZ
         yNVDK0PfsPf/+EPVb8/ZeAQA2IOSZknR+bAD4N8wobQ/GZgj0S8NY/hn9tWlEe4cSIEP
         5MRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtEKaS3g8tc4fMKtnq7ZHPyZ9HKNi0IkU4J3t08GuXJunBQU77ip9ag3RGN+X3F2W+SVVidrcaQ63PgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxShmS+5cixovW8wG/8VzfETAWgVE7jqwvjIaiM51Q1cKrNz636
	ndJwuL7FulM+8nRWJo7awMFtXmIO2awnA5cAW6ZZnNLGnWj1JjYr0OOWom/wLZRMam0=
X-Gm-Gg: ASbGnct+xaL6ctHHZ161XrWLlRoyXc5PD6QIPXrsoSqauID/4xsWmuEDlBul+TigCv9
	tZCcNCjGy3Z5ZVPkCtKMOI8hQgsx3gO2+/0XnRbuBsfCpqrXNOpRxV6pEvgBum6ndCoiN4OcTvi
	4gctFJkFdzUcaLtBMj9BhsEOoD0mpG+FX/pwPPby/sl3dHcWUO71VD2o89cixYJUWc1w8sBjNxL
	5iybKgr2I8Szlvk2PeE/j4yqoTxbAUh6mevE9blueeg57vgPRlrMh2iKaEWRYWNWsN6Amofc6TU
	DxjN82a9neubYd6Y/THnA5zir+vF+XFP1Uple5bcQhvyYSkU/qpC8zFPwha51OC3VHRl1pFG8pq
	x3bvfT0M/YMofw1f6PJT55aLGqGI=
X-Google-Smtp-Source: AGHT+IHTUDQzELvy6oqBw8zJr8Bm+VBPGXCOgJa1zh4Kjeaae/Qc9Ajc6QxCV0Bm5N0eMq1HGfMA7Q==
X-Received: by 2002:a05:600c:190b:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-45381ae45d4mr69774515e9.19.1750948665981;
        Thu, 26 Jun 2025 07:37:45 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b30dsm52097475e9.12.2025.06.26.07.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:37:45 -0700 (PDT)
Message-ID: <4aa924e9-d570-45eb-b874-133f12d00fd5@linaro.org>
Date: Thu, 26 Jun 2025 15:37:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 14:59, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the venus core.
> 
> Video encoding support is not exposed until the relevant hardware
> capabilities are enabled.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 736ef53d988d..f1f211ca1ce2 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
>   	.enc_nodename = "video-encoder",
>   };
>   
> +static const struct freq_tbl qcm2290_freq_table[] = {
> +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
> +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
> +};
> +
> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> +	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
> +};
> +
> +static const struct venus_resources qcm2290_res = {
> +	.freq_tbl = qcm2290_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
> +	.bw_tbl_dec = qcm2290_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
> +	.clks = { "core", "iface", "bus", "throttle" },
> +	.clks_num = 4,
> +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> +	.vcodec_clks_num = 2,
> +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "cx" },
> +	.vcodec_num = 1,
> +	.hfi_version = HFI_VERSION_6XX_LITE,
> +	.vpu_version = VPU_VERSION_AR50_LITE,
> +	.max_load = 352800,
> +	.num_vpp_pipes = 1,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.cp_start = 0,
> +	.cp_size = 0x70800000,
> +	.cp_nonpixel_start = 0x1000000,
> +	.cp_nonpixel_size = 0x24800000,
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/venus-6.0/venus.mbn",
> +	.dec_nodename = "video-decoder",
> +};
> +
>   static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> @@ -1072,6 +1110,7 @@ static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>   	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>   	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, venus_dt_match);

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

