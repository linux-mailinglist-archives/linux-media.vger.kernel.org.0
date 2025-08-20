Return-Path: <linux-media+bounces-40398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7DBB2DC03
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8E665C5CA1
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD382F5319;
	Wed, 20 Aug 2025 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S335+IH8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964612F0C6B
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755691427; cv=none; b=V2HZDJcfA6KJm3x6JVuVfR2yIL2gF7DDi1VYC89DRIFnIj4DdcSAPEzDXZgXEK2VczqpwhWbc4eZWeuoIfKBnC0zTZUEfGyqQh8KkIq25FOc24TNPAW+tf0HdFpoafq6p0h9oX6UTvTaSrxjzzrqFZkPk0NKoQkmXYPiVYkjloU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755691427; c=relaxed/simple;
	bh=vlwreu9O+be4DJm+hSQtGoS2HuItPDgbl6GwoQIhAyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bhn21FnXa0zUm98e/ZgO7Vj6c6dna87b/Ccp+AoBwtpgqf4+otU8tKtTCcb7IsPmAj41mX7WoA4/hi+xRt+Ob2xlvtu9hRlUQASG7t/i9Li1md0/XMpWL956y5gT30KIrAeKlHIHM2pIxSNwhj6xVwALJXc8QoYxCPaAlEp8JF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S335+IH8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so4271760f8f.1
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 05:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755691424; x=1756296224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m+QUP/qCQ9S9KCnUtcQ8czQ4I1MjpJ0iqHa7qQn/S40=;
        b=S335+IH8/UVj156SIeqrQeE9lboNxIsyzK2SLl3tzUvR+qEJkYr+45gMxtevNakLXw
         LyXOpG86Vyq1lG0ShZxHzH6bmPlXrFGYNwKzvnk/tyjqWtzr9f8wAU1+i3uIq0Icx/Qc
         Y+w/EyiU5FT9Ht3xwyi4XK0ohnde/ZNfLxBIcIqvK/IqrntSG9I0toUwkX62ROSi35fQ
         TRgp0E8FdxNhdhfAtpkhEZ/j+Wnh6OY3Uwk+sJlBFfSiHALILVmCZ+WT/AoG7jM6IczH
         7GbDr0ZOlmY0ww0m4MRrzOSOKXVvYmtdD1mt/j0v42UJ88U/rMKnA1aJOgORjThurDd4
         B4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755691424; x=1756296224;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m+QUP/qCQ9S9KCnUtcQ8czQ4I1MjpJ0iqHa7qQn/S40=;
        b=DsHVfylx6IB11ZFWcwh7OzE2bvGqcaDmwiDrO65PaHWGm8f657DgRV94g0aXONXBsd
         HdenOzSJTd45XQW+ty4PMkfRQp/LDcOzsNCJ9c93XfXmJTD17TWEOOMzqF7F+eM/lFUc
         Gs8932C0jLugr71vcko1MbcK7F6jw80WZfOS+auOWZ6HzM2HS6c5kOueBxGuJQ+EYswZ
         uHXLCDSLy1R/122GKA4EKNPuvZ0YpXfnIOl8EYr5sOCdQ4GcCAlniEk2gX77ZuJd6RLH
         rGq4RDd2CZeUK1OttqT6fC9VX2nGKBkC+bTdsPDuxsjZBqabbH3BYZxV0yeUqW2gpArc
         97dA==
X-Forwarded-Encrypted: i=1; AJvYcCUMDp8Co9eVPJua8irKv+Im6jGlQ+ASMuRLFpJXBCOLk4BBDBHCRGCi1zx6SjkyW9ZHZM/cStYL3l1QdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmIWSLJOEaGUgRgYD2INHM6DuZdHDHdyUegeFUj1JXOZoZH9Q6
	6b5mffAW01syJsmD43e4/X9FYjNglEGhtqiNbHibxfExFurYRIKHNp03eOnn2lV+Tqc=
X-Gm-Gg: ASbGnct5nJXzaNZK9zpRSiNiYRA2ZqMnyOEOMrZREuP7n6x7weU4QA6cX6abMRrT3MZ
	kxDhXmmuh1W36r5cBKNoRE9KmdAAF72/N/ibJKS6n7rEnodj8pDL8cSN3FB8/Gor6XdmApewa1e
	XCXbJ/8t0IMbBX9JLhhdFvAnPwHFnfULk5YiV5p3hLepCDE392m6PkeActkJA1znmXE4vSJsyqB
	xWaukxb44Yw0RgpWW8jsUd4JYbTkIT2TSpcacwziA2fqRv4dlg9GpN2fJDkugrQ5y+5KP7C5QC/
	evxWKydKfZW2TmCoPaJ/6ZjXS1Jngn7tBw4+T0Bs/R3/BPNmma/5kKQuhLa2OiakoSbKGa7kDvK
	jaC/aJt/5jF8Rgckr46eQ1+rZI/e5wW2YhhcNmZUGnRh9QP2yHvH7q3mGEsID8LM=
X-Google-Smtp-Source: AGHT+IErFEbEeDb8woWTaPOJfb3Qgt2FDT/URzIxfoRjH6UkOY7I+WGlkun1wq88CPFRriZlOSAS2A==
X-Received: by 2002:a05:6000:26cd:b0:3b7:93c3:7d49 with SMTP id ffacd0b85a97d-3c32e22a3c5mr1832987f8f.39.1755691423737;
        Wed, 20 Aug 2025 05:03:43 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c07487a009sm7460791f8f.11.2025.08.20.05.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 05:03:42 -0700 (PDT)
Message-ID: <fd9eadb2-a209-4b52-a269-4e45c884bbc1@linaro.org>
Date: Wed, 20 Aug 2025 13:03:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
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
 <20250819165447.4149674-4-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
> Environment—a library present in the Gunyah hypervisor) utilize the
> Peripheral Authentication Service (PAS) from TrustZone (TZ) firmware to
> securely authenticate and reset remote processors via a sequence of SMC
> calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(), and
> qcom_scm_pas_auth_and_reset().
> 
> For memory passed to Qualcomm TrustZone, it must either be part of a
> pool registered with TZ or be directly registered via SHMbridge SMC
> calls.
> 
> When QHEE is present, PAS SMC calls from Linux running at EL1 are
> trapped by QHEE (running at EL2), which then creates or retrieves memory
> from the SHMbridge for both metadata and remoteproc carveout memory
> before passing them to TZ. However, when the SoC runs with a
> non-QHEE-based hypervisor, Linux must create the SHM bridge for both
> metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
> for remoteproc memory (before the call is made to TZ in
> qcom_scm_pas_auth_and_reset()).
> 
> For auth_and_reset() call, first it need to register remoteproc carveout
> memory with TZ via SHMbridge SMC call and then it can trigger
> auth_and_reset SMC call and once the call returns, remoteproc carveout
> memory can be deregisterd with TZ.
> 
> Add qcom_scm_pas_prepare_and_auth_reset() function which does prepare
> the SHMbridge over carveout memory and call auth_and_reset SMC call.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 46 ++++++++++++++++++++++++++
>   include/linux/firmware/qcom/qcom_scm.h |  2 ++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 33187d4f4aef..9a5b34f5bacb 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -759,6 +759,52 @@ int qcom_scm_pas_auth_and_reset(u32 peripheral)
>   }
>   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
>   
> +/**
> + * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the remote processor
> + *
> + * @ctx:	Context saved during call to qcom_scm_pas_ctx_init()
> + *
> + * This function performs the necessary steps to prepare a PAS subsystem,
> + * authenticate it using the provided metadata, and initiate a reset sequence.
> + *
> + * It is typically used when Linux is in control setting up the IOMMU hardware

Is there a non-typical case ?

"This function is used"
> + * for remote subsystem during secure firmware loading processes. The preparation
> + * step sets up shmbridge over the firmware memory before TrustZone access the

shmbridge -> "a shmbridge"
"access" -> "accesses"

> + * firmware memory region for authentication. The authentication step verifies
> + * the integrity and authenticity of the firmware or configuration using secure
> + * metadata. Finally, the reset step ensures the subsystem starts in a clean and
> + * sane state.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx)
> +{
> +	u64 handle;
> +	int ret;
> +
> +	if (!ctx->has_iommu)
> +		return qcom_scm_pas_auth_and_reset(ctx->peripheral);
> +
> +	/*
> +	 * When Linux running at EL1, Gunyah(EL2) traps auth_and_reset call and creates
> +	 * shmbridge on subsystem memory region before it passes the call to TrustZone
> +	 * to authenticate it while when Linux runs at EL2, it needs to create shmbridge
> +	 * before this call goes to TrustZone.
> +	 */

If Linux is running at EL1, Gunyah running at EL2 traps the 
auth_and_reset call, creates a shmbridge in "subsystem memory ? bod: 
which subsystem do you mean here" and then passes the call to TrustZone. 
If Linux is running at EL2 then Linux needs to create the shmbridge 
before calling into TrustZone.

> +	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
> +	if (ret) {
> +		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",
> +			ret, ctx->peripheral);
> +		return ret;
> +	}
> +
> +	ret = qcom_scm_pas_auth_and_reset(ctx->peripheral);
> +	qcom_tzmem_shm_bridge_delete(handle);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
> +
>   /**
>    * qcom_scm_pas_shutdown() - Shut down the remote processor
>    * @peripheral: peripheral id
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index b7eb206561a9..a31006fe49a9 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -79,6 +79,7 @@ struct qcom_scm_pas_ctx {
>   	size_t mem_size;
>   	struct qcom_scm_pas_metadata *metadata;
>   	bool save_mdt_ctx;
> +	bool has_iommu;
>   };
>   
>   void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> @@ -87,6 +88,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>   			    struct qcom_scm_pas_metadata *ctx);
>   void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
>   int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
> +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
>   int qcom_scm_pas_auth_and_reset(u32 peripheral);
>   int qcom_scm_pas_shutdown(u32 peripheral);
>   bool qcom_scm_pas_supported(u32 peripheral);


