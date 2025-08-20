Return-Path: <linux-media+bounces-40350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA2EB2D6D2
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6D64161CE5
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 08:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039712D8DDD;
	Wed, 20 Aug 2025 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mzmhAOh1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0502C2343
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755679231; cv=none; b=CAyASIF1nNii9pFU7/3NzQbuOujuGIvFZv11JUBkoRDjZmcFDMj/nft5fGvkv3d/6L4s+xZcUWGy2jAifAlmXkDTuM+hTP3w0KTvgtXPbKgd1y7jwUVqO/mjYxRhacFqKpeq902pvhsMnSfOaBCR3a6NIEsKokQag1/89QGfMyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755679231; c=relaxed/simple;
	bh=2Bf5pSIDeaXdAnMClIAwjBEtZlm5MH5beZ6hVM9tf1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNcNknYIla7XhMQ41uhfvayTjT6vpGSIhGPCWY9/xynaT3wr4FaCz9kghgJfZVYUv73Mw6h86HbZCxc7WcsuO64wyvslkdtnrLYZUkMLOrhHS6FI0kA/iUz+NcVK5CXMuVVSwHF/K2FELGwshhKabQTBbY6rbF7Xcc+5mZmyMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mzmhAOh1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b00a65fso32333055e9.0
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 01:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755679228; x=1756284028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uDAEpI+NfZxgApYknmtsZIG8RB0U0WX8Cx+vFwuFF1Y=;
        b=mzmhAOh1OZTSIW+yj55LRwhSnj5zBlU0mZaXWQQQ6qtSZhosqNQr3nX9njKQELyB/o
         OwNHlAwN0cv4NoLko2EehhMrAuSZvh+96/r4kBkewwRGOmiRLl807QV0nqrRjX3k3q/+
         KIIOwykItEKnMVsS7k0kb1a4+pZ/jvXQ7k/BvnCvbAjTexVxUKwTMBsyywIqv/MBaxmA
         xmgHOY1T1a22tYuK+IZGmByBAthYXn3KVVP1XIB/y8icDJcdhCHXjjJi9wLgoSLLR6Br
         xA1LWzssreysvY60tBnnBP8y9rOlDgfCzLjqX17u7bB71KPh4TDZsnInOSl8K/BPBgs/
         VwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755679228; x=1756284028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDAEpI+NfZxgApYknmtsZIG8RB0U0WX8Cx+vFwuFF1Y=;
        b=Ju9gU8jcihik7Ud6purB1G+vsd/sPgPP3JLEnX99DjmAKPgX3TNY1y4Yj1aCmJP8N/
         nWOBrzophyCw7g2LObFHZCH2J+C8AQtufSnFiz6Iy8VMxtxAnqdGrg8lqrbUN7DQD1OT
         LX+ZIYf8KSiezjsOynv9FWcBSGXUoXjt4CFd0PhhTqgg14FM4ZfKZBRceSzfH2TH81vX
         Q3ZiZ98pPpsYsxYTPrrE6gHeREnSnqBuIg4RHC9uQxirrnp7IO6e2ZaDowSQMDuikbKy
         Q7pgDs7eAh/TaOzKHgj05MS2ccyy/hwRcNswLNgzxvBPeiNNql5v3JZ/hpQWbaNskRRe
         LMPw==
X-Forwarded-Encrypted: i=1; AJvYcCURCYq+rPc3I+WV9dVBvkfwNYrp3MT5E77i7bIZGoiQ0VKDarR7D1kBUVkBvLHZni68yBtHPjCxW68pkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUqP5b0UtpDRONf8N2RJ63YEM49RavPNDiMUGXK+WK3BfUUlXZ
	HjzV+vQFU4xy+2gNXzaEzAxS0nkA8DJU1xrJa1tde7qIa2edp11ImPr87835P6jIWNE=
X-Gm-Gg: ASbGncurAdQSW3FR36jIArJh59kEiT0p/r9FSAt0cvR6SUhOftNp+wWmHPIbDTPgduW
	SMCjlKY4jOXs7vMeCGLEfcxAdfY1V8eDkKXDYxYJwwEi4qHxN/dPrj9kHLf8zI4ArvhKo4XByOZ
	Fvj+if71tGSnI8gv00jSGDNHeBoojEL9Td8eFe+0g8kpI97vI+7unZ79HrnAk7naxCIaXmthA54
	U2gTfnWSrmhhUgCFXwfXZzRnEf4XbSpf+HkTgNFFsLMghzMoqW5mBVaTRLhwqou9XanbeTQGdhx
	EjG4qtu2gUIb8ZWEZVuzwX2bi5Oq3cFp6nCUkoljx/TRGAPMmZ+y7Lo5wEpYmzvZ7rh8RYoWrnJ
	1zEgKPHeuXjojJeok7AyMGbEOexA8CXe4mVlX/7bQHQ+QwQ==
X-Google-Smtp-Source: AGHT+IHakuPXJb6UDVHhwXpy7g5RVnX29BC7QeSWaXwaUg59mxu2UH0QUGlOgcXzbq0X2DsjOIEiJA==
X-Received: by 2002:a5d:5f81:0:b0:3b8:d15f:45a2 with SMTP id ffacd0b85a97d-3c32c52bb4dmr1325595f8f.14.1755679227764;
        Wed, 20 Aug 2025 01:40:27 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:8a2d:c0da:b2f2:1f41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c1715sm7255505f8f.36.2025.08.20.01.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:40:27 -0700 (PDT)
Date: Wed, 20 Aug 2025 10:40:25 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS
 support with IOMMU managed by Linux
Message-ID: <aKWJ-c6B5Pvjw_jx@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-11-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819165447.4149674-11-mukesh.ojha@oss.qualcomm.com>

On Tue, Aug 19, 2025 at 10:24:45PM +0530, Mukesh Ojha wrote:
> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> or QHEE), which typically handles IOMMU configuration. This includes
> mapping memory regions and device memory resources for remote processors
> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> later removed during teardown. Additionally, SHM bridge setup is
> required to enable memory protection for both remoteproc metadata and
> its memory regions.
> 
> When the aforementioned hypervisor is absent, the operating system must
> perform these configurations instead.
> 
> When Linux runs as the hypervisor (at EL2) on a SoC, it will have its
> own device tree overlay file that specifies the firmware stream ID now
> managed by Linux for a particular remote processor. If the iommus
> property is specified in the remoteproc device tree node, it indicates
> that IOMMU configuration must be handled by Linux. In this case, the
> has_iommu flag is set for the remote processor, which ensures that the
> resource table, carveouts, and SHM bridge are properly configured before
> memory is passed to TrustZone for authentication. Otherwise, the
> has_iommu flag remains unset, which is the default behavior.
> 
> Enables Secure PAS support for remote processors when IOMMU configuration
> is managed by Linux.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 63 +++++++++++++++++++++++++++---
>  1 file changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 1e0f09bf1ef2..180528bcd57c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> [...]
> @@ -424,7 +459,8 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>  	if (!rproc->has_iommu)
>  		return ret;
>  
> -	ret = qcom_scm_pas_get_rsc_table(pas->pas_id, NULL, 0, &output_rt, &output_rt_size);
> +	ret = qcom_scm_pas_get_rsc_table(pas->pas_ctx, NULL, 0,
> +					 &output_rt, &output_rt_size);

Unrelated formatting change, should be in previous commit.

>  	if (ret) {
>  		dev_err(pas->dev, "error %d getting resource_table\n", ret);
>  		return ret;
> @@ -726,6 +762,20 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  
> +	if (of_property_present(pdev->dev.of_node, "iommus")) {

I think you need a dt-bindings change for this? You had one in v1, but
dropped it entirely for some reason.

> +		struct of_phandle_args args;
> +
> +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
> +						 "#iommu-cells", 0, &args);
> +		if (ret < 0)
> +			return ret;
> +
> +		rproc->has_iommu = true;
> +		of_node_put(args.np);
> +	} else {
> +		rproc->has_iommu = false;
> +	}
> +
>  	rproc->auto_boot = desc->auto_boot;
>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>  
> @@ -800,6 +850,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	if (!pas->dtb_pas_ctx)
>  		goto remove_ssr_sysmon;
>  
> +	pas->pas_ctx->has_iommu = pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;

Nitpick: I think this would look cleaner if you separate it into two
lines (only one assignment on each line).

Thanks,
Stephan

