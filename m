Return-Path: <linux-media+bounces-45408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C817C02119
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 17:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5796F3AC44D
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7393321CD;
	Thu, 23 Oct 2025 15:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YthVC6E+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E09A2FD1DA
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 15:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761232222; cv=none; b=uzABvI7bfQhqWQNSWVO/3aqoVJEG1b57qMeOZkAxV3yIi2vFRdNHHD//0l/nzXWlMz2mIzdj8+TlmtKCwV0454J4/cMWqPMqejkTFRpdQPokPVSdfKSjczS6sBx6JsX/PmhOfThgqJ746SJuMiLp35o4FO6mUSJZQOg7PCvLLg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761232222; c=relaxed/simple;
	bh=jS/tl8GejEKZt6RyRUeLjGioEbGfBS5hy+RYopZnbH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhxjXn3bTy8GkWkSVPHnIZdtZA/UGcd8Pbw3aQjYoawnSN9WXWkDESH/o1fAo05asoMitXX3rd2vUQ2ndm0oP6x5S6nSnodoiwvmrwSy3Qopt9BcPjVyOqF9YgBqgYms87IeVWb2OcjQrPOkJyLNhungU1DpqSnnVch7Z70xUDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YthVC6E+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b403bb7843eso193425166b.3
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761232219; x=1761837019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rn4sIRMonqJS565U5gIq1HXLsQ6UCMJF5mc7AD7v/+c=;
        b=YthVC6E+XJBfmhpTNYVH+33wa1xEx6g5KnF1E0293MtkhXYDJ96Pe/ZkmEFcF/jFSc
         4sBLje/SBuguemJHF6/+Ru0THsc5a+KAeaeTsNdra/EAG4pXNH1OxvN1gGPHzc6FVamy
         a24Y6XFVCnmlTnw92cvtXG6jb6b9SamLyxmBRXuNPh55EnwbMujkhXtKD05C4SyUYRSJ
         XkgTFg9AiTWeGHvX6v9f3m1ciIfrZr83cSA41i07sxlGVM27xQg/cc0VvO638z18ZTJx
         uFLi1f6plFEcSDZwBfPHvyOMvxNLnvjnD6P79Dl0ZFajOg4G46yXzCcP/Oq1vDoulG0Z
         /0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761232219; x=1761837019;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn4sIRMonqJS565U5gIq1HXLsQ6UCMJF5mc7AD7v/+c=;
        b=enr8aPTMA+QJZvBf6QlxLoJhihBKMB0l5oWKrJ4HbL+Ors/FeUMBuCVHlgbzPmsNWs
         wyFSaHfDLivkKUhBTTh5xMM9dwMezYu9Nu3H4/2Xuz9TTSRpN1K7f2k1++i3alsKLBta
         xZxNe/Xb6BLmcW/4WBUPFHGxqko2mPu8VEVK+7kUniwFf6NmUDRo3UQWfnRqzHhKhohL
         +I+tilNPJ3JPhpZSFEew2MgUN46vsiwN5/1Fnv9pUd5e3Zz+40kXKoxhxNuxCU0U6v3r
         /vC9+Pk8s+eKbLU6wpaPs89LuVicB9VOGE4LdCIZhochqlKCtUgXxUJ3FHk/7GKcO6Ze
         VqvA==
X-Forwarded-Encrypted: i=1; AJvYcCU3D4MjK/652L2WylgYDMxT9hQURBbAs79ZAzvEGu73GXzM7TWimrdWmTvK4kVDJehmy4VNnfIWJ9fbww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJYgb4pQMfUjVA/KE3aPKum+bCnv9qQBx7+033ON6dBZfncvD
	0xdNKEF5iqmDzO+ZG9nFvE/6BJP8per17Vh5KgklGiTiLz9V8IISyurzv0hqFINS0iw=
X-Gm-Gg: ASbGncuqT5ePTgQUQI9jm5W/BiXt7yO0F9XSsTF2PFm11OQa7ABc41e4TNb+KUjngf3
	vY5+Tjvz+biEGl/ChtaqYF78bcCV5Bs247yL5QV8fHy4mdnWOkjMUE+EjFh3zz9r+aZ+BaL54J2
	TWI0hXiT2D5F3YfJagHVar9fmSwSa4x4nw/UI5IKgp632hk2S/TRRaLdo2RyXsB7QsTE3YrH9TX
	izT7RpVHKS20Gr38XKgMfDxbmJj8EUDmeu0WzTTaME1bkjB1dBAptz4ZcMBMB0s8LNkE7rkUhsZ
	TWMBQDmt1ThzaOtN+iJSkBSYAfCOSzxjkgTnxL67I+kp8iVefKNP21F2rK5UiTlbaY/Xdi2vfZM
	yudn6Es/xy9Ir8N4YvZZdFnjxMuV1HZodtNR5HkAxoAMlZC0YeAGnfrtU0FW5qulxeiFHRTQnN7
	V+qCP/evN3lMhTmo2HlrixxX60f2vhsTsSp34jhU6YV2o=
X-Google-Smtp-Source: AGHT+IFCmGOkZ9Z+BeKuh3wMEq5lW31iuMhm0nrc+NyVReMq7zk49cFcweQ3qmk3B8MHXsNho8LhKw==
X-Received: by 2002:a17:907:720b:b0:b54:981c:405c with SMTP id a640c23a62f3a-b647482e031mr2643427666b.65.1761232218798;
        Thu, 23 Oct 2025 08:10:18 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144e4acsm236078366b.63.2025.10.23.08.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:10:18 -0700 (PDT)
Message-ID: <65afd3b4-180b-47b1-b62a-69c3d5711de0@linaro.org>
Date: Thu, 23 Oct 2025 16:10:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: qcom: camss: Add Qualcomm SM8650 CAMSS
 support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
 <sdAbU8fmsm0UsL9ngXMIEFZLkR_xsHeFW5dZ9qTPiJvQMxT1VFzibK3U8IcFz-8i8Z_WVkrH_5q1gn6qozlYAg==@protonmail.internalid>
 <20251017031131.2232687-3-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017031131.2232687-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 04:11, Vladimir Zapolskiy wrote:
> Add the basic support of CAMSS IP on Qualcomm SM8650 SoC powered boards.
> 
> SM8650 CAMSS provides:
> - 6 x CSIPHY,
> - 3 x CSID, 2 x CSID Lite,
> - 3 x VFE, 2 x VFE Lite.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>   drivers/media/platform/qcom/camss/camss.c     | 326 ++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |   1 +
>   3 files changed, 329 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index dff8d0a1e8c2..f76bcf69159a 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -348,6 +348,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8300:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8650:
>   	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
>   		switch (sink_code) {
> @@ -1995,6 +1996,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_8300:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8650:
>   	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
>   		ret = 16;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2fbcd0e343aa..06a184fb9ae3 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2617,6 +2617,317 @@ static const struct resources_icc icc_res_sm8550[] = {
>   	},
>   };
> 
> +static const struct camss_subdev_resources csiphy_res_sm8650[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy01-0p9", "vdd-csiphy01-1p2", },
> +		.clock = { "csiphy0", "csiphy0_timer" },
> +		.clock_rate = {	{ 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.id = 0,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdd-csiphy01-0p9", "vdd-csiphy01-1p2", },
> +		.clock = { "csiphy1", "csiphy1_timer" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.id = 1,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = { "vdd-csiphy24-0p9", "vdd-csiphy24-1p2", },
> +		.clock = { "csiphy2", "csiphy2_timer" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.id = 2,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = { "vdd-csiphy35-0p9", "vdd-csiphy35-1p2", },
> +		.clock = { "csiphy3", "csiphy3_timer" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.id = 3,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators = { "vdd-csiphy24-0p9", "vdd-csiphy24-1p2", },
> +		.clock = { "csiphy4", "csiphy4_timer" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy4" },
> +		.interrupt = { "csiphy4" },
> +		.csiphy = {
> +			.id = 4,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +	/* CSIPHY5 */
> +	{
> +		.regulators = { "vdd-csiphy35-0p9", "vdd-csiphy35-1p2", },
> +		.clock = { "csiphy5", "csiphy5_timer" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000 } },
> +		.reg = { "csiphy5" },
> +		.interrupt = { "csiphy5" },
> +		.csiphy = {
> +			.id = 5,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845,
> +		},
> +	},
> +};
> +
> +static const struct camss_subdev_resources csid_res_sm8650[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = { },
> +		.clock = { "csid", "csiphy_rx" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_gen3,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = { },
> +		.clock = { "csid", "csiphy_rx" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_gen3,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators = { },
> +		.clock = { "csid", "csiphy_rx" },
> +		.clock_rate = { { 400000000 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_gen3,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID3 lite */
> +	{
> +		.regulators = { },
> +		.clock = { "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 400000000, 480000000 },
> +				{ 0 } },
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid_lite0" },
> +		.csid = {
> +			.is_lite = true,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_gen3,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +	/* CSID4 lite */
> +	{
> +		.regulators = { },
> +		.clock = { "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 400000000, 480000000 },
> +				{ 0 } },
> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid_lite1" },
> +		.csid = {
> +			.is_lite = true,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.hw_ops = &csid_ops_gen3,
> +			.formats = &csid_formats_gen2,
> +		},
> +	},
> +};
> +
> +static const struct camss_subdev_resources vfe_res_sm8650[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = { },
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +			   "camnoc_axi", "vfe0_fast_ahb", "vfe0", "cpas_vfe0",
> +			   "qdss_debug_xo",
> +		},
> +		.clock_rate = {	{ 0 },
> +				{ 80000000 },
> +				{ 300000000, 400000000 },
> +				{ 300000000, 400000000 },
> +				{ 0 },
> +				{ 466000000, 594000000, 675000000, 785000000 },
> +				{ 0 },
> +				{ 0 },
> +		},
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.has_pd = true,
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators = { },
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +			   "camnoc_axi", "vfe1_fast_ahb", "vfe1", "cpas_vfe1",
> +			   "qdss_debug_xo",
> +		},
> +		.clock_rate = {	{ 0 },
> +				{ 80000000 },
> +				{ 300000000, 400000000 },
> +				{ 300000000, 400000000 },
> +				{ 0 },
> +				{ 466000000, 594000000, 675000000, 785000000 },
> +				{ 0 },
> +				{ 0 },
> +		},
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.has_pd = true,
> +			.pd_name = "ife1",
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* VFE2 */
> +	{
> +		.regulators = { },
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +			   "camnoc_axi", "vfe2_fast_ahb", "vfe2", "cpas_vfe2",
> +			   "qdss_debug_xo",
> +		},
> +		.clock_rate = { { 0 },
> +				{ 80000000 },
> +				{ 300000000, 400000000 },
> +				{ 300000000, 400000000 },
> +				{ 0 },
> +				{ 466000000, 594000000, 675000000, 785000000 },
> +				{ 0 },
> +				{ 0 },
> +		},
> +		.reg = { "vfe2" },
> +		.interrupt = { "vfe2" },
> +		.vfe = {
> +			.line_num = 3,
> +			.has_pd = true,
> +			.pd_name = "ife2",
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* VFE3 lite */
> +	{
> +		.regulators = { },
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "camnoc_axi",
> +			   "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
> +			   "qdss_debug_xo",
> +		},
> +		.clock_rate = { { 0 },
> +				{ 80000000 },
> +				{ 300000000, 400000000 },
> +				{ 0 },
> +				{ 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 },
> +		},
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* VFE4 lite */
> +	{
> +		.regulators = { },
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "camnoc_axi",
> +			   "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
> +			   "qdss_debug_xo",
> +		},
> +		.clock_rate = {	{ 0 },
> +				{ 80000000 },
> +				{ 300000000, 400000000 },
> +				{ 0 },
> +				{ 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 },
> +		},
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +};
> +
> +static const struct resources_icc icc_res_sm8650[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 38400,
> +		.icc_bw_tbl.peak = 76800,
> +	},
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 2097152,

This value looks dubious.

Not worth holding up the set for though.

> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8300[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -4452,6 +4763,20 @@ static const struct camss_resources sm8550_resources = {
>   	.vfe_num = ARRAY_SIZE(vfe_res_8550),
>   };
> 
> +static const struct camss_resources sm8650_resources = {
> +	.version = CAMSS_8650,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_sm8650,
> +	.csid_res = csid_res_sm8650,
> +	.csid_wrapper_res = &csid_wrapper_res_sm8550,
> +	.vfe_res = vfe_res_sm8650,
> +	.icc_res = icc_res_sm8650,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
> +	.csid_num = ARRAY_SIZE(csid_res_sm8650),
> +	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
> +};
> +
>   static const struct camss_resources x1e80100_resources = {
>   	.version = CAMSS_X1E80100,
>   	.pd_name = "top",
> @@ -4480,6 +4805,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
> +	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>   	{ }
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index a70fbc78ccc3..1875f145995b 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -88,6 +88,7 @@ enum camss_version {
>   	CAMSS_8300,
>   	CAMSS_845,
>   	CAMSS_8550,
> +	CAMSS_8650,
>   	CAMSS_8775P,
>   	CAMSS_X1E80100,
>   };
> --
> 2.49.0
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

