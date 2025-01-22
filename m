Return-Path: <linux-media+bounces-25090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 635AAA18902
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 01:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A8BE3AB580
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230D11805B;
	Wed, 22 Jan 2025 00:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IgWw42Xu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B35A4C74
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 00:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737506306; cv=none; b=W+AFrrIH4/NvnwEpEB42Yldt9UEMQ7wAtLni2+/4OS4zCh8zllawVAHiXJAHASHZPpeEOxm8jsIQ3h3j9I69Q6oq7YR8tLRsXgXnWPfdGl8a0CSXscXgakxII3tU7647CBxVTvoAtLdFEI8+f/8Y4AnB4RkU0WcFhkoV3zd5uLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737506306; c=relaxed/simple;
	bh=Vwlnqe02eUNIfSKoIxLM94EO3CtRgJGfr7bz8R2Z7Vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ztyl1r4ncCQCM1AHk1PpTILM44lkJl5LcNP6ZGrVbPQ3Lt6LhXvydBCGhQ/hY8CZ0xJGmUS/7DwMqTxm8uja2sWJxrEqgBbM0TtlKi9Xl8/Ea5Ccmudj1+5QoxhD0l3C8vCS0NrIvzDetBlimVBz8NpUxrnhfZgTKEaL+SShKTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IgWw42Xu; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30241e6b540so4166701fa.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 16:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737506302; x=1738111102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b1dfzYI/MVOERpbPixUp2NK2V4zoI7qi7xBk1OcNhIo=;
        b=IgWw42Xug2ifnFPZu1w/YXD2OBndiQH62GzNRJNDBMnpKnFxSJ5bm6LDOcTezSHcfi
         opX8a7wnWTcRsjx6FcH98FhcfsvsN+TdbFZPfH7q/oF2m2wtyHONZ5DYzHDFA1GGmxs5
         BrLBxy+Xjh0KEyAurpk3ZfSew20omTPhqq7tS/Gf69xBwL0Ty+xzxbfjQvnxP+LrFoCZ
         i7jSCYQcvTRW+cy7RUkv2ik0VE/dJW57mtT9SqHAAsSmy2XZKts5UY4R4jC73oV6rFa3
         Zw38/47jJRHjGbaMWqrqp4C5NGv3rOU5avqiEuVA7OZxo6zBdpRFEe8GWjAXKY1P4fpq
         D23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737506302; x=1738111102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b1dfzYI/MVOERpbPixUp2NK2V4zoI7qi7xBk1OcNhIo=;
        b=GfBsPb1EGnCgrcMw0hMb/NFQ5AnXAopNx6pxBGX0ogCx3iwyWBFYaYgFuuzjUVvVJm
         OMtKliZ1A/W3picMsspuppRMnS7PPEwju3TfVchmVPDqJSsiqquOpDlaHcjaA3wPdL2A
         m74UgJubZF1+pXaovGTVKUYznzE3fcp2yDu9MoUyxFZxAW/7be8twaJ16ru6eHk6T/hJ
         bCEW1dGXvdIFdLro8rSvPk6Xr80WgVBqOQqEpbva71JbfhwNbmmsD1WYa409lSXVZy4Z
         70TK7rYktklwwS6iGcRcpm7MFs4J0L5fztQWUl9WQ3wPOcl4ZCKbidfOluevW4RCnwIR
         4L1g==
X-Gm-Message-State: AOJu0YyxrkMkE+fZXK8eGKCkpJTMdKor0ZuI10gJj8J4zCnvXXjKp80Q
	Vc7WxuNTSaZGOHwyGTLDzaCk/+whdJbTlOMdrw27a3L2TpT19YgtnmhCkV31JBk=
X-Gm-Gg: ASbGnctE9cJsUALNolp6D8lMC/KK4yXxTbyg8VG9dauijTJ8ZUJa+V9MnU1PH7Wqw91
	8lTqo4MsGycMzgMJq/Mj9IQR+J0a7ld127SN9mOt78x72fb7UMGCaPODEsxYFOQXFKKDfW2QwvW
	utsI28dPdJIQIngQWtGrC+zEj1d+aWxliJ5fLwnIBTI0KM4A6WDkQCDaRNEJrJUFtp88SYZLcCb
	RCPFyFlbySU9QR8Y0NhpWTd2YJ8RqLeeZUyfDTF4QAIBr56oXiXfv6G3OL3f+Eze/vkazOIidqV
	nMUZ7uEHDo2jTWtr8dD2NvK11+HD1IZcu9oBogWkrUN3tibi
X-Google-Smtp-Source: AGHT+IHOodgZjOvodfxqLH+Ho00VwpQubXa8XhYo3goI63zGLqo6frtO219KGgjhK7Ii35YvNngqPQ==
X-Received: by 2002:a2e:a9a4:0:b0:300:29ed:b7c1 with SMTP id 38308e7fff4ca-307587aa08emr2197641fa.7.1737506301533;
        Tue, 21 Jan 2025 16:38:21 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed499sm23558031fa.65.2025.01.21.16.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 16:38:20 -0800 (PST)
Message-ID: <e2fe6066-89d7-4e31-a164-f8a2c96e53cd@linaro.org>
Date: Wed, 22 Jan 2025 02:38:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] media: qcom: camss: Add x1e80100 specific support
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-7-44c62a0edcd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-7-44c62a0edcd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/25 17:47, Bryan O'Donoghue wrote:
> Populate CAMSS with x1e80100 specific hooks.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   6 +
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>   drivers/media/platform/qcom/camss/camss.c          | 286 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>   4 files changed, 295 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index fc624a3da1c43..24dd20de014e0 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -754,6 +754,7 @@ static bool csiphy_is_gen2(u32 version)
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_X1E80100:
>   		ret = true;
>   		break;
>   	}
> @@ -842,6 +843,11 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_regs = &lane_regs_sc8280xp[0];
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
>   		break;
> +	case CAMSS_X1E80100:
> +		regs->lane_regs = &lane_regs_x1e80100[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
> +		regs->offset = 0x1000;
> +		break;
>   	case CAMSS_8550:
>   		regs->lane_regs = &lane_regs_sm8550[0];
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 9ffa6bc72cf1e..4f7a559f9992c 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -346,6 +346,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_X1E80100:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>   		{
> @@ -1972,6 +1973,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_X1E80100:
>   		ret = 16;
>   		break;
>   	default:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index a128b1d1c6d57..02fc49ff46d18 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2294,6 +2294,276 @@ static const struct resources_icc icc_res_sm8550[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy-0p8-supply",
> +				"vdd-csiphy-1p2-supply" },

Just a note that for SM8450 there are separate combined 01, 23, and 45
PHY supplies called as 0p9 (not 0p8) and 1p2.

Something similar is expected to be here also, I believe.

FWIW I'm in the process of completing CSIPHY rework to this respect.

> +		.clock = { "csiphy0", "csiphy0_timer" },
> +		.clock_rate = { { 300000000, 400000000, 480000000 },
> +				{ 266666667, 400000000 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.id = 0,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdd-csiphy-0p8-supply",
> +				"vdd-csiphy-1p2-supply" },
> +		.clock = { "csiphy1", "csiphy1_timer" },
> +		.clock_rate = { { 300000000, 400000000, 480000000 },
> +				{ 266666667, 400000000 } },
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.id = 1,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = { "vdd-csiphy-0p8-supply",
> +				"vdd-csiphy-1p2-supply" },
> +		.clock = { "csiphy2", "csiphy2_timer" },
> +		.clock_rate = { { 300000000, 400000000, 480000000 },
> +				{ 266666667, 400000000 } },
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.id = 2,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators = { "vdd-csiphy-0p8-supply",
> +				"vdd-csiphy-1p2-supply" },
> +		.clock = { "csiphy4", "csiphy4_timer" },
> +		.clock_rate = { { 300000000, 400000000, 480000000 },
> +				{ 266666667, 400000000 } },
> +		.reg = { "csiphy4" },
> +		.interrupt = { "csiphy4" },
> +		.csiphy = {
> +			.id = 4,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +};
> +
> +static const struct camss_subdev_resources csid_res_x1e80100[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> +			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 64000000, 80000000 },
> +				{ 80000000,  100000000, 200000000,
> +				  300000000, 400000000 },
> +				{ 300000000, 400000000, 480000000 },
> +				{ 300000000, 400000000, 480000000 }, },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		},
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> +			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 64000000, 80000000 },
> +				{ 80000000,  100000000, 200000000,
> +				  300000000, 400000000 },
> +				{ 300000000, 400000000, 480000000 },
> +				{ 300000000, 400000000, 480000000 }, },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		},
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> +			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 64000000, 80000000 },
> +				{ 80000000,  100000000, 200000000,
> +				  300000000, 400000000 },
> +				{ 300000000, 400000000, 480000000 },
> +				{ 300000000, 400000000, 480000000 }, },
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		},
> +	},
> +	/* CSID_LITE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> +			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 64000000, 80000000 },
> +				{ 80000000,  100000000, 200000000,
> +				  300000000, 400000000 },
> +				{ 300000000, 400000000, 480000000 },
> +				{ 300000000, 400000000, 480000000 }, },
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid_lite0" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID_LITE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> +			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 64000000, 80000000 },
> +				{ 80000000,  100000000, 200000000,
> +				  300000000, 400000000 },
> +				{ 300000000, 400000000, 480000000 },
> +				{ 300000000, 400000000, 480000000 }, },
> +

It's an inconsistency of the added empty line here.

> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid_lite1" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources vfe_res_x1e80100[] = {
> +	/* IFE0 */
> +	{
> +		.regulators = {},
> +		.clock = {"camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
> +			  "cpas_fast_ahb", "cpas_vfe0", "vfe0_fast_ahb",
> +			  "vfe0" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 345600000, 432000000, 594000000, 675000000,
> +				  727000000 }, },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* IFE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
> +			   "cpas_fast_ahb", "cpas_vfe1", "vfe1_fast_ahb",
> +			   "vfe1"  },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 345600000, 432000000, 594000000, 675000000,
> +				  727000000 }, },
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.pd_name = "ife1",
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* IFE_LITE_0 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
> +			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
> +			   "vfe_lite_csid" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 266666667, 400000000, 480000000 }, },
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* IFE_LITE_1 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
> +			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
> +			   "vfe_lite_csid" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 266666667, 400000000, 480000000 }, },
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +};
> +
> +static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
> +	.reg = "csid_wrapper",
> +};
> +
>   /*
>    * camss_add_clock_margin - Add margin to clock frequency rate
>    * @rate: Clock frequency rate
> @@ -3346,6 +3616,21 @@ static const struct camss_resources sm8550_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources x1e80100_resources = {
> +	.version = CAMSS_X1E80100,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_x1e80100,
> +	.csid_res = csid_res_x1e80100,
> +	.vfe_res = vfe_res_x1e80100,
> +	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
> +	.icc_res = icc_res_sc8280xp,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sc8280xp),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
> +	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
> +	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
> +	.link_entities = camss_link_entities
> +};
> +
>   static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
> @@ -3356,6 +3641,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
> +	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 58fc61e7cf7ad..426e80f1c4b52 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -86,6 +86,7 @@ enum camss_version {
>   	CAMSS_8280XP,
>   	CAMSS_845,
>   	CAMSS_8550,
> +	CAMSS_X1E80100,
>   };
>   
>   enum icc_count {
> 

--
Best wishes,
Vladimir

