Return-Path: <linux-media+bounces-40349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D9B2D6CC
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C975A7985
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 08:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE8827147D;
	Wed, 20 Aug 2025 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IzdfKpyE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615652D3ED0
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 08:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755678979; cv=none; b=hJdgriP7FyOY64hswX0ZQNw7Vc0+Cy17Oyh4uWE6sQqEX2ypckNTmzxRyfhdSt87OValH273J7WPnVX+Ps5bknHRGBCA7zv8eCg4CGvcQQGb0MXrYBdrwEsDE/tlyeXrNFD63oQ8Iiumoj4aALI+N2zY7CrW5PR9QsiQi9FrEjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755678979; c=relaxed/simple;
	bh=+qSVbXUS/clmIdfv3OXHciTtkLmQKmbi6XRnW5pvU3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5L2J6MAWz+KqMGlkkDfJBmSgG5bfXJUyMtqPTyd4BqkQpJ9/53BRAtpO4heqat2ZFLvWVhq9nU3gS5wT/Q6McbFThbZ2a1APoLReydaa6/A3mUznC0OjdP+ZUgJnPa5ygtnapfZmOYwlJWrEqZGSEtnu5KsKQIVKOKmFMNtn2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IzdfKpyE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9ba300cb9so461993f8f.1
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 01:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755678976; x=1756283776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YAr6jehsKiHEOUhuldij9V65ueaJsFRa/9UyVncK9fg=;
        b=IzdfKpyEBOYk1Vpro1pk4mjX1StKeqYl5RURFsPu+nyW2sHQWJxL3qgkOYv0PpIReh
         0wRlgtqdasHieIBPCR7jNRIiHNyRFOzHYWYqEQ6NmDJ2pTCsb9AOZFTJrRfuj3ZGJdMq
         Rjup9nZGwXhparjpCmTLce9nBm29YepRBN7nVDJlyODZUYeXNH5djPXfe18mEsBK065K
         a1J8o88MI0iCX0HbRqBtzJc8ivwwVU2915u5ujE1jCtimjfxMptgc0DOlVyYay4ElDBK
         IbffjBHoX89beIcOazhzcVma57/vuOjCqCsLyuvDvl6uDVfIn/cIB6di327gu/GaRy1g
         WX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755678976; x=1756283776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAr6jehsKiHEOUhuldij9V65ueaJsFRa/9UyVncK9fg=;
        b=dQeh1710/qdY356WGJrpLyrPaj5UB8vKIrMqVr/Jsz9HRlApcjpQ122FXj95Ay5Y3W
         uJMDvP7nF6/uv0hRxdWsCLtuCcyGA47j1+4ArUuk0EHG0I3JxtncD6TyyDwVJfhwyNz+
         k4AD0bN71C5sqvxwSnk0EdL2ePSbXMbjiY/4XRlBKVgypSCzCjHon2NwnbEJNyFy35ti
         lvjE43GzFM7/lR7dKuYHx41nmIFGMpokrjBYpFZfHlxBXRZ/P4O1VmZUEYODUxZG/uz4
         Tv/5y+LVK1qlz04iBGd1VepV+t6OedHbWyc8/DZL/wG7GxU22Y8LT1La/UwvyL61Y0zt
         PMGg==
X-Forwarded-Encrypted: i=1; AJvYcCUH4Teq/D2rtK5MrAxTm9FGELzQm/NXplgJg0Ff5FU/Q9stwS3TO8KNYo+SoUcOdQqaVYo45Gmbdg+Gvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaix8xuBByR0fidIwRvLUpYHithcXbbQL058s3Q3c5po215Cki
	84g0wsqMW6U25Luhc9DrKqPwpSnzZnrJtT0eqLGZRmUYW2OzVLNROhKl3P65jkVUifA=
X-Gm-Gg: ASbGnctdSmAnYMICK4SOOHEoS56bmOPEDecN6cCd4t//ddOmANuHwRX018WUYgDZKln
	h4XdLHaxhsX1HX4O0uEW1p9LLGcUmb8kughDtvQm+JwmBfJcwhTnSQY1BVVd8vrXiNObREf03Bw
	r0XLsPaIF7ed8aMUitLiZ3sUwMIggQuJ+fNS6adGuLOjo6E5aDK/mg3tM9OGmt7dNc2sYFuPw3Z
	tiwafAFgcv9ApSo1SZgmydmkEeEDYYaJ7Bnj22OdxhjIvW/sd3pz65dauUoEkcejqF0TsWGPk9K
	odAJxcQEqK0Z5qCW6E7rS6ZOJlVKF28YignvqGTyFTMxjJGs55o4poPrWDnyaHYVKlAaDWoXiJX
	wVXkeC2VC3IFh2TTS+wnm7h68OClHafr4hGo=
X-Google-Smtp-Source: AGHT+IGi+nraIikmoF7WftFp0em6MhyjlDmSPu86zOKlpKavPilVFf76gYO+pgNSjEXMVIEPdoHeBA==
X-Received: by 2002:a05:6000:2c0d:b0:3b7:775d:e923 with SMTP id ffacd0b85a97d-3c12a803871mr4177431f8f.4.1755678975484;
        Wed, 20 Aug 2025 01:36:15 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:8a2d:c0da:b2f2:1f41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4976bc73sm16131425e9.6.2025.08.20.01.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:36:15 -0700 (PDT)
Date: Wed, 20 Aug 2025 10:36:10 +0200
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
Subject: Re: [PATCH v2 09/11] remoteproc: pas: Extend parse_fw callback to
 parse resource table
Message-ID: <aKWI-izL5BooL61p@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-10-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819165447.4149674-10-mukesh.ojha@oss.qualcomm.com>

On Tue, Aug 19, 2025 at 10:24:44PM +0530, Mukesh Ojha wrote:
> Extend parse_fw callback to include SMC call to get resource
> table from TrustZone to leverage resource table parse and
> mapping and unmapping code reuse from the framework.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c  | 33 +++++++++++++++++++++++++++--
>  drivers/soc/qcom/mdt_loader.c       |  1 -
>  include/linux/soc/qcom/mdt_loader.h |  2 ++
>  3 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 09cada92dfd5..1e0f09bf1ef2 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -408,6 +408,35 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
>  	return pas->mem_region + offset;
>  }
>  
> +static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct qcom_pas *pas = rproc->priv;
> +	size_t output_rt_size = MAX_RSCTABLE_SIZE;
> +	void *output_rt;
> +	int ret;
> +
> +	ret = qcom_register_dump_segments(rproc, fw);
> +	if (ret) {
> +		dev_err(pas->dev, "Error in registering dump segments\n");
> +		return ret;
> +	}
> +
> +	if (!rproc->has_iommu)
> +		return ret;
> +
> +	ret = qcom_scm_pas_get_rsc_table(pas->pas_id, NULL, 0, &output_rt, &output_rt_size);

In PATCH 07/11 you have support for "static" resources that can be part
of the firmware binary, but then you never make use of it. Like in the
iris patch you just give in NULL, 0 for input_rt, even though,
(presumably?) the remoteproc framework has support for parsing the
resource table from the ELF firmware image.

I would suggest adding a comment here justifying this and perhaps
something to the commit message. I do see value in having the
qcom_scm_pas_get_rsc_table() properly defined with input RT support, but
it's not obvious from the description of your patches that this is
effectively dead code right now(?).

> +	if (ret) {
> +		dev_err(pas->dev, "error %d getting resource_table\n", ret);
> +		return ret;
> +	}
> +
> +	rproc->cached_table = output_rt;
> +	rproc->table_ptr = rproc->cached_table;
> +	rproc->table_sz = output_rt_size;
> +
> +	return ret;
> +}
> +
>  static unsigned long qcom_pas_panic(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> @@ -420,7 +449,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.start = qcom_pas_start,
>  	.stop = qcom_pas_stop,
>  	.da_to_va = qcom_pas_da_to_va,
> -	.parse_fw = qcom_register_dump_segments,
> +	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  };
> @@ -430,7 +459,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
>  	.start = qcom_pas_start,
>  	.stop = qcom_pas_stop,
>  	.da_to_va = qcom_pas_da_to_va,
> -	.parse_fw = qcom_register_dump_segments,
> +	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  	.coredump = qcom_pas_minidump,
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index ea7034c4b996..8456cca3f3e0 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -22,7 +22,6 @@
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/mdt_loader.h>
>  
> -#define MAX_RSCTABLE_SIZE	SZ_16K;

I'm confused why there is a semicolon here suddenly. Did you edit this
patch by hand?

Applying: remoteproc: pas: Extend parse_fw callback to parse resource table
Patch failed at 0009 remoteproc: pas: Extend parse_fw callback to parse resource table
error: patch failed: drivers/soc/qcom/mdt_loader.c:22
error: drivers/soc/qcom/mdt_loader.c: patch does not apply

>  #define RSC_TABLE_HASH_BITS	     5  // 32 buckets
>  
>  DEFINE_HASHTABLE(qcom_pas_rsc_table_map, RSC_TABLE_HASH_BITS);
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 62f239f64dfb..92ad862e733e 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -8,6 +8,8 @@
>  #define QCOM_MDT_TYPE_HASH	(2 << 24)
>  #define QCOM_MDT_RELOCATABLE	BIT(27)
>  
> +#define MAX_RSCTABLE_SIZE	SZ_16K
> +
>  struct device;
>  struct firmware;
>  struct qcom_scm_pas_ctx;

You added this define yourself in PATCH 08/11, so just add it in the
right place directly. Make sure you scroll through your patch set before
sending to make sure all changes are in the right commit. :-)

Thanks,
Stephan

