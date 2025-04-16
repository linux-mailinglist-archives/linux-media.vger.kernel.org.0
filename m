Return-Path: <linux-media+bounces-30332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD1A8B8BA
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBF753ADA0A
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050BC239595;
	Wed, 16 Apr 2025 12:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZWJtg5I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A67724A055
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805879; cv=none; b=IXbtFfxP4CB1owU1mvApQP/nFQTFUtindScJvcGJubwInaw6OKvRdu2d9QPqh5KanI8/Pkijur+8zThJW3g6vjCND5uc47BFVF3D6w5NlxXjXiGYVq8LLB09u9S4yVXU/Ym4dFIdE3mjXvk3+hGX58Q1wNGudGDqFa7oxUqJw+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805879; c=relaxed/simple;
	bh=blUM8MCr3uTpaKRPBWacJbXVRXgWGnt3OS/+m54imjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EezHl61TThIrfVE395CrLTi8OuX+3qfRK5gyeL6AQwSLmi62zO5WQX8J6dJOVf2Gl5H7AGpXl/9Z72W4e0uWE721EJsu5ToiOyMvyZYzmzDFIhOJ69WS64xKRYork56BYdXkL6DEs+WwUqU9//ZRT3/llFzBqDNxPEIxlAyoo+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZWJtg5I; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso8685308f8f.0
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744805876; x=1745410676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7qzmPfGUQphjSn8JU9/K3urNRuVP8doXci+CHrxSN0c=;
        b=tZWJtg5IVCkTYkvWNywL5w0fMeWZmAo63GAkdPaa6k86wyUkLVjP7tTm6v9PckFVlr
         epXL1z7vXbB79v9uDkG0uie+BWTMKuGXgUDebUhQxnfFFIof81Tcsb35WZXXZGXKT15S
         otLJ7HQcI8jKmFN/n48rLYFAflkSl20zF6wCJbOR+xv4Qh8nBYjbbmhMFnShTgNihPqN
         rrxuuDj7a1racBuPHlMhJen1wtx8OmYzDR7tce2mJPHItL47No4yhbglec1oAD6A5Mo5
         iYUZPAN1uRu6C0ESaCh4wrMMxFl/yOMucDt1NE3w5d0FKSutqWcbBTfxxYgVaDVhUhHW
         kjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805876; x=1745410676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7qzmPfGUQphjSn8JU9/K3urNRuVP8doXci+CHrxSN0c=;
        b=YnUhzb6AsUSricKM+2ByTwRVo+MLGKvMwA9Jkl1g+dsFbyP99lzh6AMBsHOkoat26m
         RoyudFwSkCYyatxI1G8ECx61jODX28Ch9eAYP3v/gxkzJfr6R7OkF/Zv9HTJLcnJfJaW
         Xr6zlT4WLkXv6okuYkEjM0TKLQvwjua3lvjllIwHC8waBKCrIcwCk2woA9klYZ9f9PG+
         yzZfcxEp05NsmQcobEnoBE2G+95TID3BwudrITxx+V4pXMhzQvAWdS27433SWNjEDgMS
         uT14SEkqampZBxDn//nVcPkuZ+Hel23n0klJS0xtAJV+JfrfLu7ZXLO5YJ2Ghpk83Bki
         lfMg==
X-Forwarded-Encrypted: i=1; AJvYcCVEh41iyibkR3yT4hgRlXqkEnvDRdlz16V8NRzsu5l907meJ7Vc/n1iO3zUI90Hn+lrLkjwv2r02tlWAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5EaSSzMYrxTj8obgV2c4KFxlvAVl60Ut3lfex9G6Sy0lNz1ZX
	adBmH8eL+MFl0f7AKHa6RInZDowlu5G+M6J+PV0QpzifKVLR0vSW03Bnn6iy26k=
X-Gm-Gg: ASbGncuJiS7ggbM6WQn2UUk3qKeBcrg3Z6IZKWR4TYpnAFWmLMx8M2R7F3vF383bRWf
	nEZ/wkvzXDxIb/ozkUWL3T3tcMLMgr5gvMT3w7nH7EODo0sWiOAh9h48c1x34YQEfFtzPHEdfAK
	/mua5rE91KaDFG3csrMmo6tfPS+a5G6gAr55Wy2YnA75IbKU3pJu6S6VyK1du9fPHpOtTKH+/ca
	/a8X+cE/vOpk8yPKwcFBlN5rVRR6TxBY5sH+1HTBiYvBMYNj85SSC5m/SBQ+kR8QgMbxsFJo0y2
	SQUnRGD1MsFez8sMc8QFb1ztRjzivEtVHYzDv8roIeczJLxJkviibXemu3dvljiif6+w6mLE1lx
	UJmhuzyDjyafh0kb5
X-Google-Smtp-Source: AGHT+IFBKvD/CJgbhatKr7c1PxeSo6YlFCiQLOW9fGCuyRIsJKGMp9wtGO0z/i9mZ4FKq4/l22V4Ig==
X-Received: by 2002:a05:6000:43c6:10b0:39c:1424:1cb3 with SMTP id ffacd0b85a97d-39ee5b0ff12mr1124465f8f.5.1744805875692;
        Wed, 16 Apr 2025 05:17:55 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae978018sm16754251f8f.49.2025.04.16.05.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 05:17:55 -0700 (PDT)
Message-ID: <391e7a1a-ea7f-4299-86df-cb1600428d90@linaro.org>
Date: Wed, 16 Apr 2025 13:17:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] media: qcom: camss: add support for QCM2290 camss
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-4-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250416120908.206873-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 13:09, Loic Poulain wrote:
> The camera subsystem for QCM2290 which is based on Spectra 340.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>   drivers/media/platform/qcom/camss/camss.c     | 146 ++++++++++++++++++
>   2 files changed, 148 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 4bca6c3abaff..c575c9767492 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -340,6 +340,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   		}
>   		break;
>   	case CAMSS_660:
> +	case CAMSS_2290:
>   	case CAMSS_7280:
>   	case CAMSS_8x96:
>   	case CAMSS_8250:
> @@ -1969,6 +1970,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	int ret = 8;
>   
>   	switch (vfe->camss->res->version) {
> +	case CAMSS_2290:
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 06f42875702f..1e0eb2a650a3 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -515,6 +515,138 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
>   	}
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_2290[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 240000000, 341330000, 384000000 },
> +				{ 100000000, 200000000, 268800000 }  },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845

You'll need to specify and .id property

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/74cae7794341fa4f96fef0966f44471f7e2d322f

> +		}
> +	},
> +
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 240000000, 341330000, 384000000 },
> +				{ 100000000, 200000000, 268800000 }  },
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	}
> +};
> +
> +static const struct camss_subdev_resources csid_res_2290[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 192000000, 240000000, 384000000, 426400000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.hw_ops = &csid_ops_340,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 192000000, 240000000, 384000000, 426400000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.hw_ops = &csid_ops_340,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	}
> +};
> +
> +static const struct camss_subdev_resources vfe_res_2290[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
> +				{ 0 },
> +				{ 0 }, },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_340,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
> +				{ 0 },
> +				{ 0 }, },
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_340,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
> +static const struct resources_icc icc_res_2290[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 150000,
> +		.icc_bw_tbl.peak = 300000,
> +	},
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "sf_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};

I think you can get better numbers from downstream for the above.

> +
>   static const struct camss_subdev_resources csiphy_res_660[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -3753,6 +3885,19 @@ static const struct camss_resources msm8996_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources qcm2290_resources = {
> +	.version = CAMSS_2290,
> +	.csiphy_res = csiphy_res_2290,
> +	.csid_res = csid_res_2290,
> +	.vfe_res = vfe_res_2290,
> +	.icc_res = icc_res_2290,
> +	.icc_path_num = ARRAY_SIZE(icc_res_2290),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_2290),
> +	.csid_num = ARRAY_SIZE(csid_res_2290),
> +	.vfe_num = ARRAY_SIZE(vfe_res_2290),
> +	.link_entities = camss_link_entities
> +};
> +
>   static const struct camss_resources sdm660_resources = {
>   	.version = CAMSS_660,
>   	.csiphy_res = csiphy_res_660,
> @@ -3865,6 +4010,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
> +	{ .compatible = "qcom,qcm2290-camss", .data = &qcm2290_resources },
>   	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
Other than that LGTM.
---
bod

