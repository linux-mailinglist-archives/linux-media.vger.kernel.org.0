Return-Path: <linux-media+bounces-27530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0BCA4EEDB
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 21:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 483683A9B9F
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1E3204F61;
	Tue,  4 Mar 2025 20:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXfdPzfE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C21255250
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121681; cv=none; b=lAT1Zr8TTEruDFWinScpQnvg/lCB5cIH7pG+hWGsM6TZBOjkos5illzLhGStk86b1mTKVwHSpgDDb0gCoTFXGRCBFtXVZVB22p7+S8EDzmR3awupv6m3kElWF2Cu+Lsfnu7fXZ2ey56w7Jw8frhRrMoH6xRm2oCCDVqKingtUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121681; c=relaxed/simple;
	bh=4YVqOK61xx6ybzPmoW75jTuHGNHJK+27NwkAqvhAD7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9FdOpR/D246UxI3j76dW2y2dLFWC7IkARkrUnDfk5cwLk/mDXAalBLcYPQ8Jk7txN/HBqYFvqihZZolCuJsKXHy5koziDEimSXdjrrEOQSHGky+JY4UN8oMq4qxTcY+8sjNLCs8JmrbHK3XdCptRjjPR/JnhdGvul+v7Q9Hv6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXfdPzfE; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-307bc125e2eso67595601fa.3
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 12:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741121678; x=1741726478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9S5RcvtMlSmmNkHaVMZQhGkdtEWYN039+ylDnNnTkA0=;
        b=PXfdPzfEz5oyl/Zm1pzTWlGTkVCgtjFUg8033Wy+ssHglM59MtmLTEHb/Kjs0Ibarj
         CNAewORfeXspv8f0UqPMOPWxoDpzds2RIZ+bvkhfmYTyfSNWKg88yh9Tqx/4zX6KfZCZ
         aMPM0jcCxlHVSPY/XKnvT0GrP8dP4nZHbilln40O9OM87Sh5ZLTeqsZylEKULYjaO5AB
         7H1hM3gDUig3JldDvUU267DKB55nS1+QqgrFth9CEEiygZCuP4pMLPmuOiA644DsgEp8
         HMBvQ9Wq+9SDG9fEwg10hTZodsI+2CaaNlL3yn6C+imzXjupAhaoplz2KaoE9qsCGJr0
         FAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741121678; x=1741726478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9S5RcvtMlSmmNkHaVMZQhGkdtEWYN039+ylDnNnTkA0=;
        b=blI6BDGYop+0rH8sKUnjI6ZJWGZbG2FdTkUxtcFSSqfD/t77HxXIPgGd2S+QeOmGU+
         qHAY4iZHBJJoGYJTI6/oLTRkhjDbqupZ0xk9YFBEo8FpN6zl3wTt9fLwz4efPzepnO9J
         qK0vTtooJU9guy+9Ve5uUWqnH0fWIBjNLIlBBbqfeeN/BxwYGUZ0ecabmGI6rvCyNYmO
         2kLKE5Ld9EeaPtsz+4/CkpOMeOqyAwBB/W/5/UcvObdUkrk5+Jy7H3Fpc4A8t35T/KEW
         HP0w1BAj8KqlvItoD+A7t0tRSha1xR9tJ1+lTcYGVlEbvAa6SAY7VygtKYKbBprxIoPp
         2T2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrvwKVqXDWBnXU3jCdEAwqjunxq55+9clZHKIJ6f+XyMgrh7fjLfoElaW32pkP7HnvU2xSf63y5aG4NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZCuSin468ylg0Kt9C2k93CPmzWWB74mIjgft8zpPvjzjMl7+
	XtksOz0V0OMNUujfDEQn3LH5OqVOZpWRMNy28rt6X8ZjpGZrho9du5vg/bRtYl8=
X-Gm-Gg: ASbGnct+d9WyNhueAObQW1mhSh0en6aW8eXGy/Yy7jUJPbuAV58Uumw4S6MW3a4fMeQ
	iKz/797J5JElwg64EhO8vfgJAWTjdAqNFTD7gUICCNlR7NklGVGPP5skue4KHR6DZWZPHmtCcbM
	kZ+MoT4Dj+Nyi8kIjIvHbvlrYmlWVJLERFaV7zcTE/YaZq/PpSSZSpV14Y75bSJzzm4HZ4Eac5y
	3x47+yfPAgoYlRChQoe+ZfHcdP1E5SIwvvBIiyaN2thJsvv1IfezFmTLG8zqCujtrvSoNcPvoS3
	vclO+vrMWn3ap8eYKOOw9VkKnFcyj7ww9AlKbfyOEJK1kfeE4SJ2SEB5Wum+pjSlKGLFrjJLB0U
	XQBhQpEPuYNoYY2KhopgFCbJU
X-Google-Smtp-Source: AGHT+IF3JoZTickLvOwPVXpKhIHGvL/BsrsLrH9J55lj1fNWZZWbbOx5aHG2lsArXNVAi8obot0l4g==
X-Received: by 2002:a05:6512:2809:b0:545:2776:8529 with SMTP id 2adb3069b0e04-5497d32f42dmr166318e87.5.1741121677871;
        Tue, 04 Mar 2025 12:54:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495d268a42sm992081e87.175.2025.03.04.12.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 12:54:36 -0800 (PST)
Date: Tue, 4 Mar 2025 22:54:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 6/8] media: venus: core: Add SC8280XP resource struct
Message-ID: <6pe6kcz2vnxqnrrb2xtan5edtxslqzfpk2ccxg64rpc77lcrd7@rgxqeoldurjv>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-6-279c7ea55493@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-6-279c7ea55493@linaro.org>

On Tue, Mar 04, 2025 at 01:07:12PM +0000, Bryan O'Donoghue wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add SC8280XP configuration data and related compatible.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Link: https://lore.kernel.org/r/20230731-topic-8280_venus-v1-6-8c8bbe1983a5@linaro.org
> [ johan: rebase on 6.9-rc1; convert vcodec_pmdomains ]
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> [ bod: added static video encoder/decoder desciptors ]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 47 ++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index dbce635f9fa45..3d23a5919462d 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1116,6 +1116,52 @@ static const struct venus_resources sc7280_res = {
>  	.enc_nodename = "video-encoder",
>  };
>  
> +static const struct freq_tbl sc8280xp_freq_table[] = {
> +	{ 0, 239999999 },
> +	{ 0, 338000000 },
> +	{ 0, 366000000 },
> +	{ 0, 444000000 },
> +	{ 0, 533000000 },
> +	{ 0, 560000000 },
> +};
> +
> +static const struct venus_resources sc8280xp_res = {
> +	.freq_tbl = sc8280xp_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(sc8280xp_freq_table),
> +	.reg_tbl = sm8350_reg_preset,
> +	.reg_tbl_size = ARRAY_SIZE(sm8350_reg_preset),
> +	.bw_tbl_enc = sm8250_bw_table_enc,
> +	.bw_tbl_enc_size = ARRAY_SIZE(sm8250_bw_table_enc),
> +	.bw_tbl_dec = sm8250_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> +	.clks = { "core", "iface" },
> +	.clks_num = 2,
> +	.resets = { "core" },
> +	.resets_num = 1,
> +	.vcodec0_clks = { "vcodec0_core" },
> +	.vcodec_clks_num = 1,
> +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "mx", NULL },
> +	.vcodec_num = 1,
> +	.max_load = 7833600, /* 7680x4320@60fps */
> +	.hfi_version = HFI_VERSION_6XX,
> +	.vpu_version = VPU_VERSION_IRIS2,
> +	.num_vpp_pipes = 4,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.dma_mask = GENMASK(31, 29) - 1,
> +	.cp_start = 0,
> +	.cp_size = 0x25800000,
> +	.cp_nonpixel_start = 0x1000000,
> +	.cp_nonpixel_size = 0x24800000,
> +	.fwname = "qcom/vpu-2.0/venus.mbn",

qcom/vpu/vpu20_p1.mbn

> +	.dec_nodename = "video-decoder",
> +	.enc_nodename = "video-encoder",
> +};
> +
> +
>  static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res },
> @@ -1125,6 +1171,7 @@ static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2 },
>  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res },
>  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res },
> +	{ .compatible = "qcom,sc8280xp-venus", .data = &sc8280xp_res },
>  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res },
>  	{ .compatible = "qcom,sm8350-venus", .data = &sm8350_res },
>  	{ }
> 
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry

