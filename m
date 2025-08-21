Return-Path: <linux-media+bounces-40630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4438BB2FE86
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 844E71CE775A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63212BE7D9;
	Thu, 21 Aug 2025 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HanrNcOX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1481829B8D9
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 15:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789840; cv=none; b=oivmT7kuYoj9meJnKQnhEt262GpjxtJOJKVGUn8VVpTmQ8pjoD2uhwL6wUIc2/WZO+5ERBT8ujUGfpRtQyOVPngK7OblDAwz2buR4PxoEYOceyqpq8fdXztBaNWRxm2cI+Kl0yWf2vSsuc6hvAqGjGttKokPkqIg0k+hB55R4SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789840; c=relaxed/simple;
	bh=UpTeEvUXde2h/y0MlnHYEKbLGSvOfX1ukwlLXrY6NaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G8wU2BWfjYFuJGzurA1xuOIXsxIv+Wg/0QJSt7xtZDnnzK/f5uDkfsR9tkuDWnAKig06v8NIiysYkAkoPiN8xOSSkxv+ssJzTgJ1jnyRt67emSUswhOzKJbEpebczbaa/ehoV0A8sNkeNi1vQKi0yXsuqsVLpNOlD7+ohgaKiK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HanrNcOX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so6992605e9.3
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 08:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755789835; x=1756394635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEUJcXv9UThk/7nFPP7IYyDbZugqau7Nfg+gBaYyVKo=;
        b=HanrNcOXNLp8pzZnEMU2FzTF55Ju5EUz2Qj5N6kXq1+IYSIyM5DHzr09wlneMPjS0D
         sIpxhFgOsJpVMWjRixfQmPxsj768rr/HYL9Bgws+zC44qTrqRrxnMM+Xlh6igl73Zhjf
         W9XLhSc1tYtBP0WJ9jlbKnp0uI71d+y8EiffC0d3In2F/jaOfm5y0E7C/h/5zVjn1JxG
         zFz4ivQjyqbPddIsnDWUOyhf60A6T+qfy1hvSxy/OsjnJU56sFeZWOAJE45P1zGttdPP
         gsWui3wuwkJrmIh5eCEwf35FR+MtQBoiJQudExooA1gI/Xo7EFXDs+icAthVjSPCBs/U
         7GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755789835; x=1756394635;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEUJcXv9UThk/7nFPP7IYyDbZugqau7Nfg+gBaYyVKo=;
        b=LYQR9F+TRIIq0h2V/QhsOs/9+9YrPBoUCREmQSR6DACGQrdOEhwUBhtPTJOMLnlXRP
         2+yRETmp/W0yCfKanctQXJgeaaQwv8Q7hUQUZUIJdTRCBaHhb5iQ6sryM0sFl1eIxzNj
         f0ThZgAwk/oNNy9Bjj+Mq8SY3rg8ENZjmYNLU60BJ+PapX6XoplJRVHEpBUQ0BKOWRng
         SLZl5kLQ3ZB/Ekoqo8znpwiQJocUsyaUHsHEl03u2/bKbZ1yBxbIs4wQ884R4rzpodO4
         bGe+G57sIjCGO24AWVAzVG2aZZUjyWdijLxJEVCgF95eWgvglTmmfPxX7y9NAeEbHVMt
         /Dvg==
X-Forwarded-Encrypted: i=1; AJvYcCV7IecovY20x+FDPlyZKA3N0E70+OhJkQ/M4iT2e7N4UWx674O/b2dXDv3YZE4g9xl4G9pYIZ6+McBSww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE/YFDmDjn5TWH/Pa5zHfWrUv/x9sN+UJyR9/dyqX2tLn4IhtP
	lQbDkbD25k/4pgWmmshjA33Vd1Vi6LgufXe12zZFM9UEsxx8TSCX0irMwWQkLTB4BJI=
X-Gm-Gg: ASbGncvYxy8A9JJllVon+kn0jKsa4GQ8K5PQX63SPJnGGJhwJDA5rC9UfVVMBfcGIjG
	FO4GwLxND4HPlyU4B/49oHAgLIljRHcAGYRn40GrjrtcVvAGAd09192w+Ojs8booneRnG8dxz6l
	ssjvio3Ch4ppFeA9VHq4ii0c+1T47mnJrWSglRFdyOxsDqxN71rTmnxCsbiltdJY3UJ4B4ISEUJ
	Rz6gptJ4qlvgUC2X2adkRx2qntD+U85vHyXrYSNdqFlmK3NV1PgMroPP/PLjT5rMO48SH0Ul3hM
	dTWPcBePxKqlEEZvNDg/in1YRojVqbJeCirNdDOKYa1FWev3mcVqkpnp52dBCH0AdueuCcQkqDg
	A/e5TqmxfXT1k2ipDcYLqE5r9Q8kgCBYbgOMoiva8JmYyMi3l8LTPOtIZu/d5VLI=
X-Google-Smtp-Source: AGHT+IEAPnZCQDkPxSmOQov4pdPzH4Z/tAtdFg/6SCypTbPD1PCqkc15LUvKOSl6OYscew3c8+ILrg==
X-Received: by 2002:a05:600c:1f0e:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-45b4d84bbd4mr29561495e9.23.1755789835209;
        Thu, 21 Aug 2025 08:23:55 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c07487986fsm13207272f8f.1.2025.08.21.08.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 08:23:54 -0700 (PDT)
Message-ID: <de4b4872-061c-4f03-ae1d-1ad93b35ed71@linaro.org>
Date: Thu, 21 Aug 2025 16:23:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] firmware: qcom_scm: Add shmbridge support to
 pas_init/release function
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-6-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
> Environment—a library present in the Gunyah hypervisor) utilize the
> Peripheral Authentication Service (PAS) from Qualcomm TrustZone (TZ)
> also called QTEE(Qualcomm Trusted Execution Environment firmware)
> to securely authenticate and reset remote processors via a sequence
> of SMC calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(),
> and qcom_scm_pas_auth_and_reset().
> 
> For memory passed to Qualcomm TrustZone, it must either be part of a
> pool registered with TZ or be directly registered via SHMbridge SMC
> calls.
> 
> When QHEE is present, PAS SMC calls from Linux running at EL1 are
> trapped by QHEE (running at EL2), which then creates or retrieves memory
> from the SHM bridge for both metadata and remoteproc carveout memory
> before passing them to TZ. However, when the SoC runs with a
> non-QHEE-based hypervisor, Linux must create the SHM bridge for both
> metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
> for remoteproc memory (before the call is made to TZ in
> qcom_scm_pas_auth_and_reset()).
> 
> For the qcom_scm_pas_init_image() call, metadata content must be copied
> to a buffer allocated from the SHM bridge before making the SMC call.
> This buffer should be freed either immediately after the call or during
> the qcom_scm_pas_metadata_release() function, depending on the context
> parameter passed to qcom_scm_pas_init_image(). Convert the metadata
> context parameter to use PAS context data structure so that it will also
> be possible to decide whether to get memory from SHMbridge pool or not.
> 
> When QHEE is present, it manages the IOMMU translation context so, in
> absence of it device driver will be aware through device tree that its
> translation context is managed by Linux and it need to create SHMbridge
> before passing any buffer to TZ, So, remote processor driver should
> appropriately set ctx->has_iommu to let PAS SMC function to take care of
> everything ready for the call to work.
> 
> Lets convert qcom_scm_pas_init_image() and qcom_scm_pas_metadata_release()
> to have these awareness.

I like the effort in the commit log here but its also a bit too long.

Please go through these paragraphs and try to reduce down the amount of 
text you are generating.

> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 71 +++++++++++++++++++++-----
>   drivers/remoteproc/qcom_q6v5_pas.c     | 14 ++---
>   drivers/soc/qcom/mdt_loader.c          |  4 +-
>   include/linux/firmware/qcom/qcom_scm.h |  9 ++--
>   4 files changed, 73 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 7827699e277c..301d440f62f3 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -616,6 +616,35 @@ static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
>   	return ret;
>   }
>   
> +static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_ctx *ctx,
> +					    const void *metadata, size_t size)
> +{
> +	struct qcom_scm_pas_metadata *mdt_ctx;
> +	struct qcom_scm_res res;
> +	phys_addr_t mdata_phys;
> +	void *mdata_buf;
> +	int ret;
> +
> +	mdt_ctx = ctx->metadata;
> +	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
> +	if (!mdata_buf)
> +		return -ENOMEM;
> +
> +	memcpy(mdata_buf, metadata, size);
> +	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
> +
> +	ret = __qcom_scm_pas_init_image(ctx->peripheral, mdata_phys, mdata_buf, size, &res);
> +	if (ret < 0 || !mdt_ctx) {

if ret is an error or mdt_ctx is null free the memory

> +		qcom_tzmem_free(mdata_buf);
> +	} else if (mdt_ctx) {

if mdt_ctx is valid do this

> +		mdt_ctx->ptr = mdata_buf;
> +		mdt_ctx->addr.phys_addr = mdata_phys;
> +		mdt_ctx->size = size;
> +	}
> +
> +	return ret ? : res.result[0];

so we can have ctx_mtd valid but return the value at ret but also mtd 
valid and return the res.result[0]

That seems like an odd choice - surely if you are enumerating the 
data-structure the result code we care about is res.result[0] instead of 
ret ?

OK I see this return logic comes from below..

But

drivers/soc/qcom/mdt_loader.c::qcom_mdt_pas_init

ret = qcom_scm_pas_init_image(pas_id, metadata, metadata_len, ctx);
kfree(metadata);
if (ret) {
     /* Invalid firmware metadata */
     dev_err(dev, "error %d initializing firmware %s\n", ret, fw_name);
     goto out;
}

So if ret as returned from your function is > 0 you will leak the memory 
allocated @ mdata_buf ..

Do you expect something else to come along and call 
qcom_scm_pas_metadata_release() ?

> +}
> +
>   /**
>    * qcom_scm_pas_init_image() - Initialize peripheral authentication service
>    *			       state machine for a given peripheral, using the
> @@ -625,7 +654,7 @@ static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
>    *		and optional blob of data used for authenticating the metadata
>    *		and the rest of the firmware
>    * @size:	size of the metadata
> - * @ctx:	optional metadata context
> + * @ctx:	optional pas context
>    *
>    * Return: 0 on success.
>    *
> @@ -634,13 +663,19 @@ static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
>    * qcom_scm_pas_metadata_release() by the caller.
>    */
>   int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_metadata *ctx)
> +			    struct qcom_scm_pas_ctx *ctx)
>   {
> +	struct qcom_scm_pas_metadata *mdt_ctx;
>   	struct qcom_scm_res res;
>   	dma_addr_t mdata_phys;
>   	void *mdata_buf;
>   	int ret;
>   
> +	if (ctx && ctx->has_iommu) {
> +		ret = qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
> +		return ret;
> +	}
> +
>   	/*
>   	 * During the scm call memory protection will be enabled for the meta
>   	 * data blob, so make sure it's physically contiguous, 4K aligned and
> @@ -663,10 +698,11 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>   	ret = __qcom_scm_pas_init_image(peripheral, mdata_phys, mdata_buf, size, &res);
>   	if (ret < 0 || !ctx) {
>   		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> -	} else if (ctx) {
> -		ctx->ptr = mdata_buf;
> -		ctx->phys = mdata_phys;
> -		ctx->size = size;
> +	} else if (ctx->metadata) {
> +		mdt_ctx = ctx->metadata;
> +		mdt_ctx->ptr = mdata_buf;
> +		mdt_ctx->addr.dma_addr = mdata_phys;
> +		mdt_ctx->size = size;
>   	}
>   
>   	return ret ? : res.result[0];

is this return path still valid now that you've functionally decomposed 
into qcom_sm_pas_prep_and_init ?

> @@ -675,18 +711,27 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
>   
>   /**
>    * qcom_scm_pas_metadata_release() - release metadata context
> - * @ctx:	metadata context
> + * @ctx:	pas context
>    */
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx)
>   {
> -	if (!ctx->ptr)
> +	struct qcom_scm_pas_metadata *mdt_ctx;
> +
> +	mdt_ctx = ctx->metadata;
> +	if (!mdt_ctx->ptr)
>   		return;
>   
> -	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
> +	if (ctx->has_iommu) {
> +		qcom_tzmem_free(mdt_ctx->ptr);
> +		mdt_ctx->addr.phys_addr = 0;
> +	} else {
> +		dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr,
> +				  mdt_ctx->addr.dma_addr);
> +		mdt_ctx->addr.dma_addr = 0;
> +	}
>   
> -	ctx->ptr = NULL;
> -	ctx->phys = 0;
> -	ctx->size = 0;
> +	mdt_ctx->ptr = NULL;
> +	mdt_ctx->size = 0;
>   }
>   EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
>   
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index e376c0338576..09cada92dfd5 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -209,9 +209,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>   	 * auth_and_reset() was successful, but in other cases clean it up
>   	 * here.
>   	 */
> -	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>   
>   	return 0;
>   }
> @@ -244,7 +244,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>   	return 0;
>   
>   release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> +	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>   	release_firmware(pas->dtb_firmware);
>   
>   	return ret;
> @@ -313,9 +313,9 @@ static int qcom_pas_start(struct rproc *rproc)
>   		goto release_pas_metadata;
>   	}
>   
> -	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>   
>   	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>   	pas->firmware = NULL;
> @@ -323,9 +323,9 @@ static int qcom_pas_start(struct rproc *rproc)
>   	return 0;
>   
>   release_pas_metadata:
> -	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>   disable_px_supply:
>   	if (pas->px_supply)
>   		regulator_disable(pas->px_supply);
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index 509ff85d9bf6..a1718db91b3e 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -240,7 +240,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
>    */
>   static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>   			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -			       struct qcom_scm_pas_metadata *ctx)
> +			       struct qcom_scm_pas_ctx *ctx)
>   {
>   	const struct elf32_phdr *phdrs;
>   	const struct elf32_phdr *phdr;
> @@ -491,7 +491,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
>   	int ret;
>   
>   	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->peripheral,
> -				  ctx->mem_phys, ctx->metadata);
> +				  ctx->mem_phys, ctx);
>   	if (ret)
>   		return ret;
>   
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a31006fe49a9..bd3417d9c3f9 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -68,7 +68,10 @@ int qcom_scm_set_remote_state(u32 state, u32 id);
>   
>   struct qcom_scm_pas_metadata {
>   	void *ptr;
> -	dma_addr_t phys;
> +	union {
> +		dma_addr_t dma_addr;
> +		phys_addr_t phys_addr;
> +	} addr;
>   	ssize_t size;
>   };
>   
> @@ -85,8 +88,8 @@ struct qcom_scm_pas_ctx {
>   void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
>   			    size_t mem_size, bool save_mdt_ctx);
>   int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_metadata *ctx);
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> +			    struct qcom_scm_pas_ctx *ctx);
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx);
>   int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
>   int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
>   int qcom_scm_pas_auth_and_reset(u32 peripheral);

Please review the error paths here especially WRT to qcom_mdt_pas_init();

---
bod

