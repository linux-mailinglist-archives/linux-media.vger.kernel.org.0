Return-Path: <linux-media+bounces-44708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAFFBE2D4A
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8638A584833
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8D6319609;
	Thu, 16 Oct 2025 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ht3Bvgny"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0298431961E;
	Thu, 16 Oct 2025 10:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610606; cv=none; b=t63TXklZoNH8rkiqYcLAyzBn4A336fgGCyrELmGDX2Z5r7D0NJyifrQRdl6G7NRWLG6HPWHwSEfoYlnUReZsIqIMnWDZVqtZnf4bE/K4NQTw9NezjqQU1Qkrk09znLdH/tlClgTXe0v8TXQwTYKXSqSAt37HNvuKYY1SRe6ui3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610606; c=relaxed/simple;
	bh=6oDqTTQNPa3hjTV43ytvjp3i0Ej8ZJ5aNHwNeKgT9wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fplcgaQ3mEa9h/7hi0+81A48tYKId0+WARe0dtc4q8KgYP7QOYjOeX3nfnXbvbHga5DwYnmza2E77PEVyWAhmWxTh5XkTAefqmgMm9dXQQX8uruh7ZsRqZEPzjoDtg7k6U2ZSZMpL/X2ProUX6MaddUeTta3PDzU/WPKEfopTMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ht3Bvgny; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419BDC113D0;
	Thu, 16 Oct 2025 10:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760610604;
	bh=6oDqTTQNPa3hjTV43ytvjp3i0Ej8ZJ5aNHwNeKgT9wI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ht3BvgnyTHBlim2BpFe/HnnDeGnbArjq+Mq82LeeZiFYKhPsxL4dmHVjKkZWVcXta
	 SGt3UnK8Z9fytsqLjpD8E6EJa6EJ0XX4sPwYPTbm+wPlDqc2H80yI7iNKbksKixh2y
	 JD52CzoI2uiTcA0D4MdCokPzu8iY8szsMH7IjDiNZVrwgmcQztHPBEL+XzAFcgYJJ/
	 u4koIp4V8wlvXAjD8DOCUsTJ+TSJeu1wPnm+Cnv39TgkLX9oi9xVm2hBhafb+eCp7m
	 zGkRrPGOuDwitjjq6reaHhyFOwrfSXdRqOA+w08p0HPFHa1pxppdK0or3/a8kmlJ/M
	 zVkuEaWTBS50w==
Message-ID: <1d4d4627-7fe9-43b2-8622-8ffc078e30a6@kernel.org>
Date: Thu, 16 Oct 2025 11:29:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: add support for SM6150 camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-2-e7f64ac32370@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251016-sm6150-camss-v1-2-e7f64ac32370@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2025 11:22, Wenmeng Liu wrote:
> The camera subsystem for SM6150 which is based on Spectra 230.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Your commit log needs more detail.

- VFE17x version what ?
- CSID version .. gen2 so CSID 480 is it ?
- CSIPHY process node would be nice


> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>   drivers/media/platform/qcom/camss/camss.c          | 186 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>   4 files changed, 191 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index a229ba04b158739ddfe4076bdd28167a309f13ea..7bc524a9c4bbe3a316e366868e9d636e58d5956a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -908,6 +908,7 @@ static bool csiphy_is_gen2(u32 version)
>   
>   	switch (version) {
>   	case CAMSS_2290:
> +	case CAMSS_6150:
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> @@ -996,6 +997,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>   		break;
>   	case CAMSS_2290:
> +	case CAMSS_6150:
>   		regs->lane_regs = &lane_regs_qcm2290[0];

You don't need to specify the array index for that.

>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
>   		break;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index dff8d0a1e8c228878d03d95aaf91f262b208f9e7..2ec796b6f82d67d7a1bc332a0d770a8185ba3fdd 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -341,6 +341,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   		break;
>   	case CAMSS_660:
>   	case CAMSS_2290:
> +	case CAMSS_6150:
>   	case CAMSS_7280:
>   	case CAMSS_8x96:
>   	case CAMSS_8250:
> @@ -1989,6 +1990,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	int ret = 8;
>   
>   	switch (vfe->camss->res->version) {
> +	case CAMSS_6150:
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2fbcd0e343aac9620a5a30719c42e1b887cf34ed..51e2522d4d01dd7bb4581c721544835c47b09c38 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1318,6 +1318,178 @@ static const struct camss_subdev_resources vfe_res_845[] = {
>   	}
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_6150[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
> +		.clock = { "csiphy0", "csiphy0_timer" },
> +		.clock_rate = { { 269333333, 384000000 },
> +				{ 269333333 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
> +		.clock = { "csiphy1", "csiphy1_timer" },
> +		.clock_rate = { { 269333333, 384000000 },
> +				{ 269333333 } },
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
> +		.clock = { "csiphy2", "csiphy2_timer" },
> +		.clock_rate = { { 269333333, 384000000 },
> +				{ 269333333 } },
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources csid_res_6150[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe0_cphy_rx", "vfe0_csid" },
> +		.clock_rate = { { 269333333, 384000000 },
> +				{ 320000000, 540000000 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe1_cphy_rx", "vfe1_csid" },
> +		.clock_rate = { { 269333333, 384000000 },
> +				{ 320000000, 540000000 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.is_lite = false,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe_lite_cphy_rx", "vfe_lite_csid" },
> +		.clock_rate = { { 269333333, 384000000 },
> +				{ 320000000, 540000000 } },
> +		.reg = { "csid_lite" },
> +		.interrupt = { "csid_lite" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources vfe_res_6150[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "soc_ahb",
> +			   "vfe0", "vfe0_axi"},
> +		.clock_rate = { { 0 },
> +				{ 400000000 },
> +				{ 80000000 },
> +				{ 37500000, 40000000 },
> +				{ 360000000, 432000000, 540000000, 600000000 },
> +				{ 265000000, 426000000 } },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "soc_ahb",
> +			   "vfe1", "vfe1_axi"},
> +		.clock_rate = { { 0 },
> +				{ 400000000 },
> +				{ 80000000 },
> +				{ 37500000, 40000000 },
> +				{ 360000000, 432000000, 540000000, 600000000 },
> +				{ 265000000, 426000000 } },
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife1",
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "soc_ahb",
> +			   "vfe_lite" },
> +		.clock_rate = { { 0 },
> +				{ 400000000 },
> +				{ 80000000 },
> +				{ 37500000, 40000000 },
> +				{ 360000000, 432000000, 540000000, 600000000 } },
> +		.reg = { "vfe_lite" },
> +		.interrupt = { "vfe_lite" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
> +static const struct resources_icc icc_res_sm6150[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 38400,
> +		.icc_bw_tbl.peak = 76800,
> +	},
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -4438,6 +4610,19 @@ static const struct camss_resources sc7280_resources = {
>   	.vfe_num = ARRAY_SIZE(vfe_res_7280),
>   };
>   
> +static const struct camss_resources sm6150_resources = {
> +	.version = CAMSS_6150,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_6150,
> +	.csid_res = csid_res_6150,
> +	.vfe_res = vfe_res_6150,
> +	.icc_res = icc_res_sm6150,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sm6150),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_6150),
> +	.csid_num = ARRAY_SIZE(csid_res_6150),
> +	.vfe_num = ARRAY_SIZE(vfe_res_6150),
> +};
> +
>   static const struct camss_resources sm8550_resources = {
>   	.version = CAMSS_8550,
>   	.pd_name = "top",
> @@ -4478,6 +4663,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>   	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
> +	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index a70fbc78ccc307c0abc2f3c834fb1e2dafd83c6b..b60556f2f226104adb48908bdb436f389fb1e1ad 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -79,6 +79,7 @@ enum pm_domain {
>   enum camss_version {
>   	CAMSS_660,
>   	CAMSS_2290,
> +	CAMSS_6150,
>   	CAMSS_7280,
>   	CAMSS_8x16,
>   	CAMSS_8x53,
> 

---
bod

