Return-Path: <linux-media+bounces-21995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 108179D8682
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF52B284C50
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 13:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EFA1ACDE8;
	Mon, 25 Nov 2024 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYVOJg8W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D696518C322
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732541743; cv=none; b=aoWDZVQVsxEr6zkcO/43RA/Q8Gcjstl2ev8edrb6/SvrGFvFd+CRe9RAUPrBN/vKSLy2yJwERPxgYb6glLDJdP16vr80M+OMc/3m8l3v9gRyHgU3Xy35PXDwGnlD8ViB8rdTvGN+XBSIlvsSZ2Vz0IbI/hSciUDEOXH9SnTbV6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732541743; c=relaxed/simple;
	bh=Xnax3nnbKlbGIH0+2FdhHf5Lzp/Gz10a3mU7EoPgK6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grYaKEbS73zBT4Mcx1o9PD+p7k+tEgDYTD9fRnmGyzDHo8iEQx4Gys5gV40cH/ASH4f02Beoq+VhsSilMjqYPw1YgkjGy1jEa8r6BsNQ2YFAqQP22WcmgEGzN8aKwWb6Qa8pRCf+WgwOo9X4RjqXLu2VJNAeqdzNor3XPkpCvkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zYVOJg8W; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffc80318c9so5728091fa.2
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 05:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732541739; x=1733146539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eq55gZXvy9/PwtHIQWK6REPRRJW0clB3eF4vf3aBdG4=;
        b=zYVOJg8WFJn1Bz2drgTo8ZFEXXgir6sRDLrbFlBiOL2TCXyhwW+ctKoVB93YpMhKcb
         HPNv3h6mu3Ctx9KDAzfbGpV07WIYGzaNXLGJr2PrP01PysiHbP4WUUhPTZcYH4AXXF/J
         gFcpKj+KVpj3bEJH50e4mQfw8JWJv7ryTbiYQwa40+mUKe8MVKxyjZ4CcLEPw2sm/bxq
         sw51YOLQnUJaTf3GD+T0MYnEeNHEFkdClE5RTvGsrJE7SH1Q98taYWa8I8odhF3rwVo1
         dTwBiK2A68QFTcRMWxMOqvijlAOSbVGJ0H6amaQFvzTDjt2JF5xrIb9XjaJqJiZsnrPz
         4PpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541739; x=1733146539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eq55gZXvy9/PwtHIQWK6REPRRJW0clB3eF4vf3aBdG4=;
        b=KKNLnESZgEpyxA3WRuHCA7nmmlZxC9uY2Wp7z21DzTzg6PnPxjNt0szFJMUZW6JMjq
         FZOGX0KCpUsU/OBjpkImZLqu/N6iKq0TbsqYJNexmnSHxM6DxPjuA26iV3tS2cgjAaC7
         uH1LuDrl3ZCxjdteIoK7JeaYd3eaMXv2W0FSWo/Xc2UowoTbI5p311hu2OIheuHU5evp
         YgXfx7bQ5V8rIHRW+IHW7L0geWeSzlK075i0Ilhk7ryILyKdSIZaK9USUu9miJd6eHGI
         7mqWFBQ8Sk9A36q5zdQNkxrjcE+jpuCCUPFdq+JX3yXxN6S9J9KvE+1rgklzGIklv/ni
         2Puw==
X-Forwarded-Encrypted: i=1; AJvYcCVE4khrpW1E2rEM+HcbXY8x/V8xeKiV2DeV/ZPcxBKkKVL7Y6AxO1GQpl01czSE3fB17+gUFRnsJtJFYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf3z9yE90YXgq37U0NBDq2ouIlszn3NG3eBjf4zqRbzXi/fXuw
	F7+dISuBCt01xCmJpgwIljKrYd21Pu0419Xvh/7c5cu8mtprj+VcnaE8d2sfx+k=
X-Gm-Gg: ASbGnctqFWkPwGmG9ZUBDfRyvoyRdS39HS8pH0dnSRj+Yh5mSC+Ge7qsIycY5yJQfb4
	4yQro4iygdzZm/fsVApimTYOForTP/uGE4SAYZHgW6e/ifMnluydFaPMPhkx2pnXW5QTFVlVgZ7
	/zmj1fZKXhr++WT8btb4JcvSdXEKW+7b3CymPGJ0tjPDOvFc3nFb9vVXl+cMkmv7LzNJq5D9xaz
	jc1AI4etVNe9Uq3zGcaxikPOTPtdrD+KULvONbeIBFVlHOmvUfbCnQbukt19B4xqxQm7rJ1wu7j
	PBrtaajwRL11tJNWLW7LQEzgpXSfoQ==
X-Google-Smtp-Source: AGHT+IEmknh+qT9gERNxBA5FaXuJ7uJ0coswtKqHWKtFwA98VdPGxuF8kOcXeQSI3HDaZGo1MjIzBA==
X-Received: by 2002:a2e:bcc5:0:b0:2fa:cc50:3f2 with SMTP id 38308e7fff4ca-2ffa7106027mr62196931fa.5.1732541738965;
        Mon, 25 Nov 2024 05:35:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa4d1713esm15535551fa.8.2024.11.25.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 05:35:37 -0800 (PST)
Date: Mon, 25 Nov 2024 15:35:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: venus: core: add qcs615 platform data
Message-ID: <j4nnlbstclwgoy2cr4dvoebd62by7exukvo6nfekg4lt6vi3ib@tevifuxaawua>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-2-5a376b97a68e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125-add-venus-for-qcs615-v3-2-5a376b97a68e@quicinc.com>

On Mon, Nov 25, 2024 at 11:04:50AM +0530, Renjiang Han wrote:
> Initialize the platform data and enable venus driver probe of QCS615
> SoC.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 423deb5e94dcb193974da23f9bd2d905bfeab2d9..39d8bcf62fe4f72674746b75994cce6cbaee94eb 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -630,6 +630,55 @@ static const struct venus_resources msm8998_res = {
>  	.fwname = "qcom/venus-4.4/venus.mbn",
>  };
>  
> +static const struct freq_tbl qcs615_freq_table[] = {
> +	{ 0, 460000000 },
> +	{ 0, 410000000 },
> +	{ 0, 380000000 },
> +	{ 0, 300000000 },
> +	{ 0, 240000000 },
> +	{ 0, 133333333 },
> +};
> +
> +static const struct bw_tbl qcs615_bw_table_enc[] = {
> +	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
> +	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
> +	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
> +};
> +
> +static const struct bw_tbl qcs615_bw_table_dec[] = {
> +	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
> +	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
> +	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
> +};
> +
> +static const struct venus_resources qcs615_res = {
> +	.freq_tbl = qcs615_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(qcs615_freq_table),
> +	.bw_tbl_enc = qcs615_bw_table_enc,
> +	.bw_tbl_enc_size = ARRAY_SIZE(qcs615_bw_table_enc),
> +	.bw_tbl_dec = qcs615_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(qcs615_bw_table_dec),
> +	.clks = {"core", "iface", "bus" },
> +	.clks_num = 3,
> +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> +	.vcodec_clks_num = 2,
> +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "cx" },
> +	.vcodec_num = 1,
> +	.hfi_version = HFI_VERSION_4XX,
> +	.vpu_version = VPU_VERSION_AR50,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.dma_mask = 0xe0000000 - 1,
> +	.cp_start = 0,
> +	.cp_size = 0x70800000,
> +	.cp_nonpixel_start = 0x1000000,
> +	.cp_nonpixel_size = 0x24800000,
> +	.fwname = "qcom/venus-5.4/venus_s6.mbn",

I really want the firmware discussion of linux-firmware to be solved
first, before we land this patch.

SHort summary: can we use a single image for all 5.4 platforms (by using
v5 signatures, by using v6 signatures, v3 or any other kind of quirk).

> +};
> +
>  static const struct freq_tbl sdm660_freq_table[] = {
>  	{ 979200, 518400000 },
>  	{ 489600, 441600000 },
> @@ -937,6 +986,7 @@ static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>  	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
> +	{ .compatible = "qcom,qcs615-venus", .data = &qcs615_res, },

The hardware seems to be the same as sc7180, only the frequencies
differ. Can we change the driver in a way that we don't have to add
another compat entry just for the sake of changing freqs / bandwidths?

>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

