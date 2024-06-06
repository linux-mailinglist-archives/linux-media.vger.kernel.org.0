Return-Path: <linux-media+bounces-12626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A13FC8FDD24
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 05:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C70941C2113F
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 03:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EF21DFD1;
	Thu,  6 Jun 2024 03:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFdFxSnA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E722905;
	Thu,  6 Jun 2024 03:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717643127; cv=none; b=mVtLTEDljzsOK4+dQI3RLu9KGw4G+VSqLc+HRYp5dgEP7VaGU7qoN4TMHoiShrjvV44LfM5Q2ombIEExza5wdG6Y6st+pVr/Imw+xUVtLqm3i7Q+eTblxVtAFdrJ4etbLo9RUTRg6iYOIfDBBy2S+6cGoR94IMyH9WI7Yg31hos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717643127; c=relaxed/simple;
	bh=yjncDYervZX+mD5NgXHb2EV+LZxOCOdv4RlOMGPjlCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RM29cG22hEfsCx3gorQ2kGQmUtE2t05A4Hz/IcKUdHl5MQsVV6Y5ILoHVvfQa7gH+tti1SM4AKKPMd+g7wSimwrghFfDOFIea75K3ih6PaoAjeSBT9eFn+nkDIb0JVUDY7lfBgx9mLG1I5RE5T1+Qlmg8qDuJriTs7K6xB+kpiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFdFxSnA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178E7C2BD11;
	Thu,  6 Jun 2024 03:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717643127;
	bh=yjncDYervZX+mD5NgXHb2EV+LZxOCOdv4RlOMGPjlCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFdFxSnAwoz4TrS617i18fN9HxPdeO+OmwFsgL8VXTps/dumhp6FK6c05CGUB8kYu
	 n7ZaYJWhBpM91MqovWBuktjZMOlSXvBZngxLCH/H+0GfHaEBIK1kwrvus/xtjE980B
	 Jir4a5O6GGkefMWzHUFxW6T9LS+V1ZbkQMxngdvyWk8wiohCWKBFjX1omOOA9QgQsm
	 FNUIIxsRnI2MHshuYtXFIxSWu+v3h2mYWFxgQUJ0Ro9aSNj8dXUv6qBcWPLNLExmpx
	 5u5ZafIeOlVYe7Y7Ad7hbrFnN2WUAnmwYefCbtLkWo2uCCr1EVS2Hc0oy20zpyEQRz
	 bYE6fwI+vM4kA==
Date: Wed, 5 Jun 2024 22:05:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: Re: [PATCH v5 2/3] media: venus: add msm8998 support
Message-ID: <yhjdqnkmqht5bz355i4h3sljkyosql2wjz3bgraewjy6mowzoo@upfjvtcduz6z>
References: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
 <eb15a48b-6185-42dd-92ca-8df33b0ea4b5@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb15a48b-6185-42dd-92ca-8df33b0ea4b5@freebox.fr>

On Tue, Jun 04, 2024 at 06:43:07PM GMT, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> Add the missing bits for msm8998 support.
> 
> Downstream vendor code for reference:
> 
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi#L42-53
> 
> qcom,load-freq-tbl =
> 	/* Encoders */
> 	<972000 465000000 0x55555555>, /* 4k UHD @ 30 */
> 	<489600 360000000 0x55555555>, /* 1080p @ 60 */
> 	<244800 186000000 0x55555555>, /* 1080p @ 30 */
> 	<108000 100000000 0x55555555>, /* 720p @ 30 */
> 	/* Decoders */
> 	<1944000 465000000 0xffffffff>, /* 4k UHD @ 60 */
> 	< 972000 360000000 0xffffffff>, /* 4k UHD @ 30 */
> 	< 489600 186000000 0xffffffff>, /* 1080p @ 60 */
> 	< 244800 100000000 0xffffffff>; /* 1080p @ 30 */
> 
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

Mauro, please merge the first two patches through your tree, and I can
merge the dts patch (patch 3/3) through the qcom-tree.

Thanks,
Bjorn

> ---
>  drivers/media/platform/qcom/venus/core.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index ce206b7097541..8b715cb7ab51a 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -587,6 +587,44 @@ static const struct venus_resources msm8996_res = {
>  	.fwname = "qcom/venus-4.2/venus.mbn",
>  };
>  
> +static const struct freq_tbl msm8998_freq_table[] = {
> +	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
> +	{  972000, 465000000 },	/* 4k UHD @ 30 */
> +	{  489600, 360000000 },	/* 1080p @ 60 */
> +	{  244800, 186000000 },	/* 1080p @ 30 */
> +	{  108000, 100000000 },	/* 720p @ 30 */
> +};
> +
> +static const struct reg_val msm8998_reg_preset[] = {
> +	{ 0x80124, 0x00000003 },
> +	{ 0x80550, 0x01111111 },
> +	{ 0x80560, 0x01111111 },
> +	{ 0x80568, 0x01111111 },
> +	{ 0x80570, 0x01111111 },
> +	{ 0x80580, 0x01111111 },
> +	{ 0x80588, 0x01111111 },
> +	{ 0xe2010, 0x00000000 },
> +};
> +
> +static const struct venus_resources msm8998_res = {
> +	.freq_tbl = msm8998_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
> +	.reg_tbl = msm8998_reg_preset,
> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
> +	.clks = { "core", "iface", "bus", "mbus" },
> +	.clks_num = 4,
> +	.vcodec0_clks = { "core" },
> +	.vcodec1_clks = { "core" },
> +	.vcodec_clks_num = 1,
> +	.max_load = 2563200,
> +	.hfi_version = HFI_VERSION_3XX,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.dma_mask = 0xddc00000 - 1,
> +	.fwname = "qcom/venus-4.4/venus.mbn",
> +};
> +
>  static const struct freq_tbl sdm660_freq_table[] = {
>  	{ 979200, 518400000 },
>  	{ 489600, 441600000 },
> @@ -893,6 +931,7 @@ static const struct venus_resources sc7280_res = {
>  static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> -- 
> 2.34.1
> 

