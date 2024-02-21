Return-Path: <linux-media+bounces-5515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D7185CD2F
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 01:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDFEE1F234F0
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 00:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF04E3207;
	Wed, 21 Feb 2024 00:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+6SoEQG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ECA17D5;
	Wed, 21 Feb 2024 00:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708477185; cv=none; b=HhDbOf/fk53Nmlvg6ZLG0C+ExBobu4R6UGnZnS636UwhTwuY7fbMR73RDHKdTG0ysHMHfqI5fTI2a3bUc53yAwV9YY2GcmjZh4w5/rGlfI008mDp4+lhuBoFfp5rn2aliZXagKSIcPw16Fz2NHKyQkL3ylqJtrhp+RrPBxLqP04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708477185; c=relaxed/simple;
	bh=AujcxXsI2GmZwiCgxr67BALfTDI6r30TVbTGpOXMtis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZR1//vC9pjdIQhCDfjRRs6/1ZEIXSdb1d6ez8ouEUOf0TqGHgKA2vCreW3M1t1aBfzaQLhxD5jzO0TSUxIvScyTWMf68EJYWhjLqBeIQPAAihAa/4EvxlG2g4sRd2clCIrocIJ1jrTqC5cY9GVcGTTs86QfLkWqIzr+ZSGyzx44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+6SoEQG; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7875c347a29so215682185a.1;
        Tue, 20 Feb 2024 16:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708477182; x=1709081982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V0xiNw2TY1Xto20MDjzn1OJnpZlYS5WxTan3TWFTSco=;
        b=Y+6SoEQGy7n7IreyxH1B1ugQHgkZIc8XBmz2O7jGMbmhWmrY4Na/BI5zTTNEAKk8YR
         rTRdD3XHUppeVZb12Mjz9Qg+PPUW+mY+ZwQJkAXHzKn6jcnqEbAOD8GKAX8ptq+LfNO1
         G3zvoC8tamaE0ANVUyZHWLshpIcM+Wo2kB+Lhj+LCyhXjLi+jsK5h8f2PXb04Et5/KUb
         4Db0W6AbB1oLcIJjSs24wEbzoIM9FgLI2PYYtId3Xst/MZjL59qYcbQYEQxLtX7r5ZCj
         +dGT/r5Mpc6FvPj1KgrfJePSmFehWAvQ+Da2OzHLXkG/Nt8alu3XiZHoaRUA6r3/i6EV
         kxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708477182; x=1709081982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0xiNw2TY1Xto20MDjzn1OJnpZlYS5WxTan3TWFTSco=;
        b=ISNyT/dzeFC1q28R4VrfReLFg9lxgqgPyA8ch4hKL8QfxD6aLgEkXXJAAOIf6F8zeP
         qYI5XiptJCBMVCO3kSEAUTqVuNcVI7PFYab5ghLK5NEvRIy2A9AIycTgqk+O69aEDqFR
         BpZncuED4RyfUhFY38DAu+Dz+I/xB0SHY95BCwdhBuR8GpDZBcyuTF7gTwPpUM+EY90n
         kguIHKlD4iBV3ZRichbt0pJkN9c9/ut7vjE1bUEwjQ9XVjyz2UJS1HPzAA9XVW/2RfMM
         nRmiWGeHuSgVRiMnYt9o9NS/gylJrr+iC1Oj1QV41qsYZym/0EmJqPj8WOD1fQz1WsPL
         tfKw==
X-Forwarded-Encrypted: i=1; AJvYcCUTrP5wKz4pGECGA/3fCj/FpP1LcQcnp9PZV23xWUU/NL4tq2Zs/z87XJ2LRPCuBIJaFeJ8FV7liqmhKYvo1diKGHvjWpUotXSJxzGr6veKgSxsJh1sGqy7H70+SK7vs/S2cijSs08qjpDwawox57R+LZBsZWTCS7W7yngTxa0U04zT6JEi1AFn
X-Gm-Message-State: AOJu0YwhC8fK92cDDTcrlnNvNqJWE1ur7e9BrKgSkODjRxxSxC0EBBIE
	e0ooibt1dntr6l3v1I5OU2nsBfFa3u9t4cVONeJKKStukZV38ozGGwVwURfAh+4=
X-Google-Smtp-Source: AGHT+IGddt2DXBR3Bx8H5Xrc9ATwr5t4aKJPTC2IMHfI0m3zZFa3ZiV3Uv3nHbhXOT/5p7TXIZL23A==
X-Received: by 2002:a05:620a:3956:b0:785:8aed:42a7 with SMTP id qs22-20020a05620a395600b007858aed42a7mr23131409qkn.14.1708477182474;
        Tue, 20 Feb 2024 16:59:42 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::42b6])
        by smtp.gmail.com with ESMTPSA id oo11-20020a05620a530b00b00787188dd406sm3874828qkn.30.2024.02.20.16.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 16:59:41 -0800 (PST)
Date: Tue, 20 Feb 2024 19:59:39 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/20] media: venus: core: Constify all members of the
 resource struct
Message-ID: <ZdVK-4S7XX_m9vBJ@radian>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
 <20230911-topic-mars-v2-7-3dac84b88c4b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911-topic-mars-v2-7-3dac84b88c4b@linaro.org>

On Fri, Feb 09, 2024 at 10:09:51PM +0100, Konrad Dybcio wrote:
> Nothing inside the resource struct needs to be mutable. Sprinkle
> 'const' all over it. A lot of 'const'.

We already have 'const struct venus_resources'. Is that not sufficient?

Maybe it's just style, since the string arrays are const?

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.h | 58 ++++++++++++++++----------------
>  1 file changed, 29 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 6a77de374454..6b1887f7d9cb 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -56,39 +56,39 @@ enum vpu_version {
>  };
>  
>  struct venus_resources {
> -	u64 dma_mask;
> -	const struct freq_tbl *freq_tbl;
> -	unsigned int freq_tbl_size;
> -	const struct bw_tbl *bw_tbl_enc;
> -	unsigned int bw_tbl_enc_size;
> -	const struct bw_tbl *bw_tbl_dec;
> -	unsigned int bw_tbl_dec_size;
> -	const struct reg_val *reg_tbl;
> -	unsigned int reg_tbl_size;
> -	const struct hfi_ubwc_config *ubwc_conf;
> +	const u64 dma_mask;
> +	const struct freq_tbl * const freq_tbl;
> +	const unsigned int freq_tbl_size;
> +	const struct bw_tbl * const bw_tbl_enc;
> +	const unsigned int bw_tbl_enc_size;
> +	const struct bw_tbl * const bw_tbl_dec;
> +	const unsigned int bw_tbl_dec_size;
> +	const struct reg_val * const reg_tbl;
> +	const unsigned int reg_tbl_size;
> +	const struct hfi_ubwc_config * const ubwc_conf;
>  	const char * const clks[VIDC_CLKS_NUM_MAX];
> -	unsigned int clks_num;
> +	const unsigned int clks_num;
>  	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
>  	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
> -	unsigned int vcodec_clks_num;
> -	const char **vcodec_pmdomains;
> -	unsigned int vcodec_pmdomains_num;
> -	const char **opp_pmdomain;
> -	unsigned int vcodec_num;
> +	const unsigned int vcodec_clks_num;
> +	const char * const *vcodec_pmdomains;

This doesn't error on:

	const char *pmdomains[] = { "venus", "vcodec0", "vcodec1" };
	struct venus_resources res;
	res.vcodec_pmdomains = pmdomains;
	res.vcodec_pmdomains = NULL;

> +	const unsigned int vcodec_pmdomains_num;
> +	const char * const * const opp_pmdomain;
> +	const unsigned int vcodec_num;
>  	const char * const resets[VIDC_RESETS_NUM_MAX];
> -	unsigned int resets_num;
> -	enum hfi_version hfi_version;
> -	enum vpu_version vpu_version;
> -	u8 num_vpp_pipes;
> -	u32 max_load;
> -	unsigned int vmem_id;
> -	u32 vmem_size;
> -	u32 vmem_addr;
> -	u32 cp_start;
> -	u32 cp_size;
> -	u32 cp_nonpixel_start;
> -	u32 cp_nonpixel_size;
> -	const char *fwname;
> +	const unsigned int resets_num;
> +	const enum hfi_version hfi_version;
> +	const enum vpu_version vpu_version;
> +	const u8 num_vpp_pipes;
> +	const u32 max_load;
> +	const unsigned int vmem_id;
> +	const u32 vmem_size;
> +	const u32 vmem_addr;
> +	const u32 cp_start;
> +	const u32 cp_size;
> +	const u32 cp_nonpixel_start;
> +	const u32 cp_nonpixel_size;
> +	const char * const fwname;
>  };
>  
>  enum venus_fmt {
>
> -- 
> 2.43.0
>

