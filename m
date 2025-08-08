Return-Path: <linux-media+bounces-39103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05511B1E543
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 11:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BECF1170F87
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1019425CC4D;
	Fri,  8 Aug 2025 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ydXIEDL5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B068F23B62C
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643732; cv=none; b=h7c6P03eVFSIWuqC31dDVEbSDdJVVXfKLx+96IQxR1iY3fjz1HF10Gre5XQbLYLdOW9eUkqeEAagFNbGQQIraim4e644nOjNtfjyaXkJfGFkDcKxCkRYZoM96zBbbTLOQsHi9IiJPEwMdlLUbX/djpDiAr4MjZCJOVhKJefH6ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643732; c=relaxed/simple;
	bh=fDzavJLkQQRW13faP4JIo9BN2hll5Ct+MBqPxVN6J7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncQ6+Rz1EXhjernjtYKtNxkCoibkl1lG49x7QmNJEhC5WrNPOwz1ubWZ2OPitcls0xzhqaLx2pZJy9t2/KkRTBo+DRun7H87khm/2b6qSLtM8g3Hq8vx9M8rjMxnvNqrW6O7bllr7InWKteqrb+hX3H0o2yP4MmJ+qvhbU165BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ydXIEDL5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-459d44d286eso13151815e9.0
        for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754643729; x=1755248529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XcB29esXATuhjwQh2nnDRB1ldhsISGsvF6rcqzubLyU=;
        b=ydXIEDL5s6IEpk3HGWRXJzmq7PXjUVDDJgjc6jz75VH0Q/DOZ26CdueEBfCL9UVuu3
         86ntg2oHijBZMGQc0MewUNMmRJ1BrPlbckuEDqzOpfWjSKOWZBNCKL3mLy2ia5H3mtmD
         JoA/Wsq+v+frqi9L2MrMyMaV/BavofetGY99IALFCtEzQpH/X+PxVyYcyO9CPW/wpyF0
         aVZJd2DueU5dLr9+PF93NJTLlaERNkq99PrXvV3Qa5UH2ZbB90W56pFVjj6X5KYz4F0i
         IwNDAwCKnSEzNp1W0mAmbK1UDD5pH68ryvDCONbJ/q0gspA/HkIh/D+RH5ZmZwaCSV28
         c8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643729; x=1755248529;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XcB29esXATuhjwQh2nnDRB1ldhsISGsvF6rcqzubLyU=;
        b=oyzh3Eq3SXPvyL4kaXKhe03bzWXdcBjXcbzmg3LANFsGmSKxzjX4MikewnNcwagC4N
         7svHC4XkRa2nS1a6gWW1fNFpMG8YEvIlcfbIc7+JQcdc0WrjdEMEW4sSSTmZr1+jyWwQ
         7Zj0EWHLHtiRQx5iBzEfCTEGnnjJkCTStmSPzpibytOOWtKw+Dtgzw+RzcFpalJllkkN
         WG2ohAtLPdApd6wzbKIN72fw9GD4Tc6+k66K7cUsAfONqCqG5ibrw+KAi+mBujoIJpuv
         rDGI2ZulccQ49hUoO5xAzEFFKRDwFamMeOC3yc6AUNuz/0wwefBxNFy/Sb7LAeBTnO5O
         XQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkamxeeOnW5AzGxVegyTu/axy1KFVXmMlm0A6ftr1hNwlM2jYja1EcNhBGEcM878LWJjQmG8DBUzxbHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgB17deZJvW3ViCDfjCApRcRDaLQY4ESWAJDIsM8TWCxQc4sSN
	zKtUl26oPQOr7OcbtCNz64jvLEWqFlo/vOryNcaQM6RnkBaVIWt2BvVBCZmKPtiJEVk=
X-Gm-Gg: ASbGncsjAhS4sxh20Y7DwOyJGmgueKD8yG06nFIdlC5F8QUHa31/05qSMiBIJq0MGbb
	wj8Dq14lwApveP4NrVDC8OPtzuBV+B8yslpImvLkSRVEhw4Bg6oceSu6KrBU3qZV07Mk8aZYToW
	GnX0RZw7QlqRliS4NmIXRERHtvpUCSCixluoR3rYpbp+PkcK10bFuIDpL7w0++2oswVWWQo+RJa
	0ijeALJ6eIcCG7NKaiQ9QAsONPjHNpGS2e6h2yNjUNU5857A84y4ijvnJ/Pj0PtyUQFzyteINNW
	SoReNI06GpCzeGDNObKKpMfy/H6hNY0C6F79hW5A9ihl5Vr6v7zdp78NEYPsQoF2TTfe6296ySy
	nDN0RCafVOddKud47qAc3Jo6QPb5jaIA1jrOMCWJTP4ppPi95nW8zvinqPgBoYWo=
X-Google-Smtp-Source: AGHT+IF4xWpCF3XDsGBbn+mook9Gvgj49NOgEPXm0we3aHZF2BikwKecUFu5oecUVvF8h37VelrB2Q==
X-Received: by 2002:a05:6000:2482:b0:3b6:162a:8e08 with SMTP id ffacd0b85a97d-3b8f97c56bfmr6003028f8f.12.1754643728792;
        Fri, 08 Aug 2025 02:02:08 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e0a24bf1sm153914825e9.1.2025.08.08.02.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:02:08 -0700 (PDT)
Message-ID: <00db8dc6-f8a6-42cc-ba5c-803ab56b9a06@linaro.org>
Date: Fri, 8 Aug 2025 10:02:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
 <20250808085300.1403570-7-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250808085300.1403570-7-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2025 09:52, Jorge Ramirez-Ortiz wrote:
> Add a qcm2290 compatible binding to the Venus core.
> 
> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> encode at 1280x720 (HD).
> 
> The driver is not available to firmware versions below 6.0.55 due to an
> internal requirement for secure buffers.
> 
> The bandwidth tables incorporate a conservative safety margin to ensure
> stability under peak DDR and interconnect load conditions.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 9604a7eed49d..a7c960d1d818 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1070,10 +1070,60 @@ static const struct venus_resources sc7280_res = {
>   	.enc_nodename = "video-encoder",
>   };
>   
> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> +};
> +
> +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> +};
> +
> +static const struct firmware_version min_fw = {
> +	.major = 6, .minor = 0, .rev = 55,
> +};
> +
> +static const struct venus_resources qcm2290_res = {
> +	.bw_tbl_dec = qcm2290_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
> +	.bw_tbl_enc = qcm2290_bw_table_enc,
> +	.bw_tbl_enc_size = ARRAY_SIZE(qcm2290_bw_table_enc),
> +	.clks = { "core", "iface", "bus", "throttle" },
> +	.clks_num = 4,
> +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> +	.vcodec_clks_num = 2,
> +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "cx" },
> +	.vcodec_num = 1,
> +	.hfi_version = HFI_VERSION_4XX,
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
> +	.enc_nodename = "video-encoder",
> +	.min_fw = &min_fw,
> +};
> +
>   static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>   	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
> +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
>   	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>   	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>   	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

