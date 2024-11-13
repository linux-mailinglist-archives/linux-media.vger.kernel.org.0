Return-Path: <linux-media+bounces-21344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 384139C6849
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 05:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC30B28525F
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 04:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED9116FF26;
	Wed, 13 Nov 2024 04:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Htusc+1v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B8716D9AA
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 04:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731473926; cv=none; b=tz4g4zjKrw/O0Kin553gFbwAGAtqeBg68N7oCVcf2SSoU+yjEY8cD9pBaftr839dKy/f5d3CypWVzS85Q9u1z81tWZUs4ttb9hOIrwfwfV7suOFOIe0BXtenQ+MMVTGmAFrUp/6TVFwI3zNjF6bYxx8yRkcv5yw0wRvHP3WB7RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731473926; c=relaxed/simple;
	bh=S+o0UUnc/w1BswUzFu3wgHoO+HOzk4rNKsbNSXoFjP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2UGRm7OndQQYPomReRmZlvr4bV0ogv9mx74vO7cJ5JZ6CtwGwRPigCMplFhYShIHspB+doQsjgT9Xskr47QJnQae4bUYC5MJpsL8fMqQcKsVnB8ewiKJO4RRm+Gh9vRppGLhkCEragHuVU7AtmV3d3k7+WLw7jO6UWw2fuZAfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Htusc+1v; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f1d96668so97690e87.3
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 20:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731473922; x=1732078722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMsIYipfpALPvhIGfwa1mXgLOTfT4VERA76o/mx6FoQ=;
        b=Htusc+1vRqBMoLoeabW2xq7pEBqg6HxVZ+qIbvFE6uAfXrMAc/oTHrCCFKnGtTVp/d
         6a4iOaUeiLR1pSDAv/YCWDElQwC4l7iilvRzKTQl0qdnQVXNk3SAr+3S7+ghUFikSkaC
         6lBGU7Dmm8YlIsLAlbAF6ggmLNXCw42+kBUhd86ejk/7FIJ85a0uw/FVGhacz2Be8VMp
         2uFWhxT/FcKgZ76mwY4PCkLq67Rokh/mVlNoENj8DpdU5e9uWVrfMxvG+Lo19W3g6PVi
         Id/tYkA9ekjHmYfzp97dBTP7ryrmUM3xQ7NBZdSxzkZg3wJl8WyI0ctQK1SnM9fO+ImN
         AVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731473922; x=1732078722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMsIYipfpALPvhIGfwa1mXgLOTfT4VERA76o/mx6FoQ=;
        b=bme/W74qyuBgj9YGod7+vfM5H2mfij99vvGgFpzE3tgTF/RGQm2RJRPsqhdAUEuUqa
         Ku4wDbUVvALO+vUBo2kkoxwmcab8IrzxemNjeQhgnv6Ta63XPhyWSRyCnD4m3slDKTzn
         QgBy1QlwxA80pWv72SNokl9bXE/hMKIvMKdyCkPL9XWaxA6yoQbjQxla9UfLNXZDnBSY
         K8Ti9FJMzo73BvY6EE674MOH7a8fg10uo0erI9ARqHzq1QlNtsQpCcHUz4MG7yCcHl2w
         eAV7QQo0DpHs8NErQn1XDLfiaYJwoXusbET9Ha+whRbcaR3W0N1b8ETC8acQvWDO3tAV
         OunA==
X-Gm-Message-State: AOJu0YxX/hXlaqc6Ric8ZLMfKkOI/qSNMTb063lyQvo9qd2Ah/ZrNcpg
	LS+ZvYdWE7Xh0b0KuAPgoW0aKDHPtGYRy1Ws3ue/pbaAn9ICDlG1qe4+T7MOq8A=
X-Google-Smtp-Source: AGHT+IH+gDfi81xRWEnxiQpcxZpnjzsG/ZpB5s64Zb1GsYuFfOjFwEoN5w76C0Lxl+2zdgF3SmtCoQ==
X-Received: by 2002:a05:6512:b94:b0:539:e60a:6dcb with SMTP id 2adb3069b0e04-53d862b0477mr2832585e87.10.1731473922339;
        Tue, 12 Nov 2024 20:58:42 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da010c808sm106560e87.134.2024.11.12.20.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 20:58:40 -0800 (PST)
Message-ID: <6833ebc6-9210-471a-8ca6-5f3605155f33@linaro.org>
Date: Wed, 13 Nov 2024 06:58:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add MSM8953 resources
Content-Language: en-US
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20241103-camss-msm8953-v4-0-48d0ec75958d@mainlining.org>
 <20241103-camss-msm8953-v4-3-48d0ec75958d@mainlining.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241103-camss-msm8953-v4-3-48d0ec75958d@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/24 11:45, Barnabás Czémán wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> This commit describes the hardware layout for the MSM8953
> for the following hardware blocks:
> 
> - 2 x VFE, 3 RDI per VFE
> - 3 x CSID
> - 3 x CSI PHY
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c |   1 +
>   drivers/media/platform/qcom/camss/camss-ispif.c  |   5 +
>   drivers/media/platform/qcom/camss/camss-vfe.c    |   1 +
>   drivers/media/platform/qcom/camss/camss.c        | 170 +++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h        |   1 +
>   5 files changed, 178 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 68a3ea1ba2a5299cf28289dfdb958cfdff3c91e0..5af2b382a843c2b8857339ba28930fe1682c9412 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -596,6 +596,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
>   		return PTR_ERR(csiphy->base);
>   
>   	if (camss->res->version == CAMSS_8x16 ||
> +	    camss->res->version == CAMSS_8x53 ||
>   	    camss->res->version == CAMSS_8x96) {
>   		csiphy->base_clk_mux =
>   			devm_platform_ioremap_resource_byname(pdev, res->reg[1]);
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index a12dcc7ff438c55167bc2981fd399dbf178181df..2dc585c6123dd248a5bacd9c7a88cb5375644311 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -830,6 +830,7 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
>   		ispif_select_cid(ispif, intf, cid, vfe, 1);
>   		ispif_config_irq(ispif, intf, vfe, 1);
>   		if (camss->res->version == CAMSS_8x96 ||
> +		    camss->res->version == CAMSS_8x53 ||
>   		    camss->res->version == CAMSS_660)
>   			ispif_config_pack(ispif,
>   					  line->fmt[MSM_ISPIF_PAD_SINK].code,
> @@ -848,6 +849,7 @@ static int ispif_set_stream(struct v4l2_subdev *sd, int enable)
>   
>   		mutex_lock(&ispif->config_lock);
>   		if (camss->res->version == CAMSS_8x96 ||
> +		    camss->res->version == CAMSS_8x53 ||
>   		    camss->res->version == CAMSS_660)
>   			ispif_config_pack(ispif,
>   					  line->fmt[MSM_ISPIF_PAD_SINK].code,
> @@ -1111,6 +1113,7 @@ int msm_ispif_subdev_init(struct camss *camss,
>   	if (camss->res->version == CAMSS_8x16)
>   		ispif->line_num = 2;
>   	else if (camss->res->version == CAMSS_8x96 ||
> +		 camss->res->version == CAMSS_8x53 ||
>   		 camss->res->version == CAMSS_660)
>   		ispif->line_num = 4;
>   	else
> @@ -1130,6 +1133,7 @@ int msm_ispif_subdev_init(struct camss *camss,
>   			ispif->line[i].nformats =
>   					ARRAY_SIZE(ispif_formats_8x16);
>   		} else if (camss->res->version == CAMSS_8x96 ||
> +			   camss->res->version == CAMSS_8x53 ||
>   			   camss->res->version == CAMSS_660) {
>   			ispif->line[i].formats = ispif_formats_8x96;
>   			ispif->line[i].nformats =
> @@ -1162,6 +1166,7 @@ int msm_ispif_subdev_init(struct camss *camss,
>   		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x16,
>   			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>   	else if (camss->res->version == CAMSS_8x96 ||
> +		 camss->res->version == CAMSS_8x53 ||
>   		 camss->res->version == CAMSS_660)
>   		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x96,
>   			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 83c5a36d071fcc32c4b8a89e4e429dc1820df139..80a62ba11295042802cbaec617fb87c492ea6a55 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -285,6 +285,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   
>   	switch (vfe->camss->res->version) {
>   	case CAMSS_8x16:
> +	case CAMSS_8x53:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>   		{
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index fabe034081ed0a7c0e0fcd8bc76c4eb396cb0067..9fb31f4c18adee886cd0bcf84438a8f27635e07f 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -152,6 +152,160 @@ static const struct camss_subdev_resources vfe_res_8x16[] = {
>   	}
>   };
>   
> +static const struct camss_subdev_resources csid_res_8x53[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = { "vdda" },

I see that you do reuse csiphy_res_8x16 for this platform support, in
this case let me ask you to double check/test that the "vdda" regulator
is actually a CSIPHY regulator, and if so, please move the registration
of the regulators to csiphy_res_8x16 as a preceding change.

In case if my ask is unclear, see commit 0567d0f1cc62 as a reference.

> +		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
> +			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 100000000, 200000000, 310000000,
> +				  400000000, 465000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.hw_ops = &csid_ops_4_7,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_4_7
> +		}
> +	},
> +
> +	/* CSID1 */
> +	{
> +		.regulators = { "vdda" },
> +		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
> +			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 100000000, 200000000, 310000000,
> +				  400000000, 465000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.hw_ops = &csid_ops_4_7,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_4_7
> +		}
> +	},
> +
> +	/* CSID2 */
> +	{
> +		.regulators = { "vdda" },
> +		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
> +			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 100000000, 200000000, 310000000,
> +				  400000000, 465000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.hw_ops = &csid_ops_4_7,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_4_7
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources ispif_res_8x53 = {
> +	/* ISPIF */
> +	.clock = { "top_ahb", "ahb", "ispif_ahb",
> +		   "csi0", "csi0_pix", "csi0_rdi",
> +		   "csi1", "csi1_pix", "csi1_rdi",
> +		   "csi2", "csi2_pix", "csi2_rdi" },
> +	.clock_for_reset = { "vfe0", "csi_vfe0", "vfe1", "csi_vfe1" },
> +	.reg = { "ispif", "csi_clk_mux" },
> +	.interrupt = { "ispif" },
> +};
> +
> +static const struct camss_subdev_resources vfe_res_8x53[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "top_ahb", "ahb", "ispif_ahb",
> +			   "vfe0", "csi_vfe0", "vfe0_ahb", "vfe0_axi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 50000000, 100000000, 133330000,
> +				  160000000, 200000000, 266670000,
> +				  310000000, 400000000, 465000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.has_pd = true,
> +			.pd_name = "vfe0",
> +			.hw_ops = &vfe_ops_4_1,
> +			.formats_rdi = &vfe_formats_rdi_8x16,
> +			.formats_pix = &vfe_formats_pix_8x16
> +		}
> +	},
> +
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "top_ahb", "ahb", "ispif_ahb",
> +			   "vfe1", "csi_vfe1", "vfe1_ahb", "vfe1_axi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 50000000, 100000000, 133330000,
> +				  160000000, 200000000, 266670000,
> +				  310000000, 400000000, 465000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.has_pd = true,
> +			.pd_name = "vfe1",
> +			.hw_ops = &vfe_ops_4_1,
> +			.formats_rdi = &vfe_formats_rdi_8x16,
> +			.formats_pix = &vfe_formats_pix_8x16
> +		}
> +	}
> +};
> +
> +static const struct resources_icc icc_res_8x53[] = {
> +	{
> +		.name = "cam_ahb",
> +		.icc_bw_tbl.avg = 38400,
> +		.icc_bw_tbl.peak = 76800,
> +	},
> +	{
> +		.name = "cam_vfe0_mem",
> +		.icc_bw_tbl.avg = 939524,
> +		.icc_bw_tbl.peak = 1342177,
> +	},
> +	{
> +		.name = "cam_vfe1_mem",
> +		.icc_bw_tbl.avg = 939524,
> +		.icc_bw_tbl.peak = 1342177,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8x96[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -2248,6 +2402,7 @@ static int camss_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	if (camss->res->version == CAMSS_8x16 ||
> +	    camss->res->version == CAMSS_8x53 ||
>   	    camss->res->version == CAMSS_8x96) {
>   		camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
>   		if (!camss->ispif)
> @@ -2389,6 +2544,20 @@ static const struct camss_resources msm8916_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources msm8953_resources = {
> +	.version = CAMSS_8x53,
> +	.icc_res = icc_res_8x53,
> +	.icc_path_num = ARRAY_SIZE(icc_res_8x53),
> +	.csiphy_res = csiphy_res_8x96,
> +	.csid_res = csid_res_8x53,
> +	.ispif_res = &ispif_res_8x53,
> +	.vfe_res = vfe_res_8x53,
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
> +	.csid_num = ARRAY_SIZE(csid_res_8x53),
> +	.vfe_num = ARRAY_SIZE(vfe_res_8x53),
> +	.link_entities = camss_link_entities
> +};
> +
>   static const struct camss_resources msm8996_resources = {
>   	.version = CAMSS_8x96,
>   	.csiphy_res = csiphy_res_8x96,
> @@ -2455,6 +2624,7 @@ static const struct camss_resources sc8280xp_resources = {
>   
>   static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
> +	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 0ce84fcbbd25c7825212beb74073ffd4c70858a8..9da7f48f5dd762d27521d449051892e956693970 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -78,6 +78,7 @@ enum pm_domain {
>   
>   enum camss_version {
>   	CAMSS_8x16,
> +	CAMSS_8x53,
>   	CAMSS_8x96,
>   	CAMSS_660,
>   	CAMSS_845,
> 

--
Best wishes,
Vladimir

