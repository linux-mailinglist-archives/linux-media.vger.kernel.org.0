Return-Path: <linux-media+bounces-40352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F4B2D6FA
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A47BD188ABF0
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 08:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4E92D9ECA;
	Wed, 20 Aug 2025 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UO1Mh796"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51884211A28
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 08:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755679597; cv=none; b=k/IRAWIsTgT58EaxmxU7EbbUweJMI5utsqbyicuf51UsS2Wy/88/nCD83/7SEibrw1wshNPCi7k+be/ibtNILcFLx/g4i5Z+L8tdjPfqdxCAZibwrJjHw09a2zIZiRg3/0AT8krexr1o12hNegNtP85aVrK3YiaCwxSRUf/RKCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755679597; c=relaxed/simple;
	bh=suO3hfcniDB5uSnEPobTeKpDgdZMFT9bBbV1Qjkc+eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjMXU3jmVU4KM14ofStZaVuIO1NKj+iw6eURqGAhFMX6pRiSrKn6+NZUc/Zq4UhhdJ3QwWU9HWqSvJ1lpUL3X5ugXIUzOsQTuUWhGnxKrEP1Nx40Sy7k5FA9ZOXBpfKJR+FYxwg5NV6qILdMiDwIwBT7P+weCboJf5XdFnwNDeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UO1Mh796; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b0c8867so51278955e9.3
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 01:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755679594; x=1756284394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y4AG+oO4F/Ul30Mp0ZZuJ5uNspts20DrHUTMHBfmexc=;
        b=UO1Mh796fr9lHkvdKfYmEW+1c3NRTUh9hhF1Hbf8KOkSIUwDuDRr2hphttu+DszraG
         wwzIO1zWVJKfvva4q6yw1MV97MQMW8EbdCou3iaVzXC94X18chFV4ewNIYbWtWQsKv8f
         wN/lE61YUc3dz8pc3w/3bMcJo0KwdfGvdfeqSFW1heGEDdMPbwp+rv2/grkLFV3ibgxO
         yxYtdwtJ+6Fl25GgJ0u83Dgu062ASXMVskcju0fmRy9uL3IpVBUAeq15R67Xbvl710Lr
         Sfpfglal0mi5c8oJpavY6iHxKLK62GhL6wCVAU+yda5Qm7ahB5kWlT5ThfDIWq6P0Gvl
         gc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755679594; x=1756284394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4AG+oO4F/Ul30Mp0ZZuJ5uNspts20DrHUTMHBfmexc=;
        b=Z3KswT7PqhZJoY5Ns+xexmcqzhvVIm3A/ThWFvs+SWwsZEoTAenPG0+v8ci/NizCa7
         Vom5Brv0ETs2TFRI64QjSePA23o9ACJp05LyB261VymP4Vss1fYHh057DKzZokMCanf6
         qX79LVoufuz53EtAWA+JClRifjiW7EudzZtDYbTFkmGgq3IlDDnQlbN+xhtqJlh5xwHw
         ayrmdjvzV/sXm6s9rcLciKBW/YIrqQhoKlRw1qFDaehOUrWTnMPrXW+q3usaSgrq7R2a
         n/BukAAsdSwvLU4sVbdwU0nUOLmzmpfgXhicHUfX6iuq0uBUur9HZKjCyN97kKEaTh7y
         RUEA==
X-Forwarded-Encrypted: i=1; AJvYcCVaNHo/Pov8FXEQWtLWsOYiyGUepvZ44eatZYqS0hd1G8Lsl0S/zy0MM6MjeEz42+QFa7VNJNum7TxKmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqHEsWAVZCSO+EQPaMw08iUlTFxJT0sstE/elFVxH+z2/GET0p
	6p35q0VgC/7lDv9CpdczOuNAKRfqEfAMmSJeRPmJmJPu7ZraL7jH1FnoX3rsi0vdwNQ=
X-Gm-Gg: ASbGnctVOyk5AxLCYBxkBp8sMCpYrVG7BtaOGc+BPoOZdAI0B0z/90EBQFnT7Ma2Urh
	+JsttESr9NC7CaPJmXLKpD8Z5Ujfk5pxBNifHl0wjnw/ObblElrJx02j/+uXtLgB2Vm2/PppNT/
	ZP8KsnLa6G8kQxAP0R8Lza1HjRkBzeXBsD4NVMn2MxP7ajcPozXb0YsyNHIL38Y6mNAJMW5cM+4
	QYX2ivIDO5a39Vd10FRT4ltRZdGfU0jih8HHcHfj55zDubldIf+iMBtvrJLzMK2fpkhHF1lyF/n
	7aVnem8VY3wInTVOMxpGW8CQH6KLn1ShOwjYVu+HHTonP6gDxBpAPNuW7WMRUdaUphFbmNVIBth
	wMpqcbKwMKdwC2YgVcxEFtltzEGFIFB1gXyw=
X-Google-Smtp-Source: AGHT+IFTiUzC8MVfqThCet8G8O0hQZ4w5t+sTa+meRVQrJvcqjhv55BgfhXIw/O1Al9qTLlBTTZ8Zg==
X-Received: by 2002:a05:600c:4fcd:b0:458:add2:d4b4 with SMTP id 5b1f17b1804b1-45b479a3e26mr15612005e9.12.1755679593431;
        Wed, 20 Aug 2025 01:46:33 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:8a2d:c0da:b2f2:1f41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c1aa3sm6541401f8f.32.2025.08.20.01.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:46:33 -0700 (PDT)
Date: Wed, 20 Aug 2025 10:46:31 +0200
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
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <aKWLZwYVPJBABhRI@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>

On Tue, Aug 19, 2025 at 10:24:46PM +0530, Mukesh Ojha wrote:
> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> or QHEE), which typically handles IOMMU configuration. This includes
> mapping memory regions and device memory resources for remote processors
> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> later removed during teardown. Additionally, SHM bridge setup is required
> to enable memory protection for both remoteproc metadata and its memory
> regions.
> 
> When the hypervisor is absent, the operating system must perform these
> configurations instead.
> 
> Support for handling IOMMU and SHM setup in the absence of a hypervisor
> is now in place. Extend the Iris driver to enable this functionality on
> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> 
> Additionally, the Iris driver must map the firmware and its required
> resources to the firmware SID, which is now specified via the device tree.
> 
> Co-developed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c  |   9 +-
>  drivers/media/platform/qcom/iris/iris_core.h  |   6 +
>  .../media/platform/qcom/iris/iris_firmware.c  | 156 ++++++++++++++++--
>  .../media/platform/qcom/iris/iris_firmware.h  |   2 +
>  4 files changed, 155 insertions(+), 18 deletions(-)
> 
> [...]
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index f1b5cd56db32..e3f2fe5c9d7a 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -3,10 +3,18 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/device.h>
>  #include <linux/firmware.h>
> -#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/kernel.h>
> +#include <linux/iommu.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_device.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/sizes.h>
>  #include <linux/soc/qcom/mdt_loader.h>
>  
>  #include "iris_core.h"
> @@ -17,15 +25,14 @@
>  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  {
>  	u32 pas_id = core->iris_platform_data->pas_id;
> +	struct qcom_scm_pas_ctx *ctx;
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = core->dev;
> -	struct reserved_mem *rmem;
> -	struct device_node *node;
> -	phys_addr_t mem_phys;
> -	size_t res_size;
> -	ssize_t fw_size;
> -	void *mem_virt;
> -	int ret;
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node = NULL;
> +	ssize_t fw_size = 0;
> +	void *mem_virt = NULL;
> +	int ret = 0;
>  
>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>  		return -EINVAL;
> @@ -39,36 +46,64 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  	if (!rmem)
>  		return -EINVAL;
>  
> -	mem_phys = rmem->base;
> -	res_size = rmem->size;
> +	if (core->has_iommu)
> +		dev = core->fw.dev;
>  
> +	ctx = qcom_scm_pas_ctx_init(dev, pas_id, rmem->base, rmem->size, false);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->has_iommu = core->has_iommu;
>  	ret = request_firmware(&firmware, fw_name, dev);
>  	if (ret)
>  		return ret;
>  
>  	fw_size = qcom_mdt_get_size(firmware);
> -	if (fw_size < 0 || res_size < (size_t)fw_size) {
> +	if (fw_size < 0 || rmem->size < (size_t)fw_size) {
>  		ret = -EINVAL;
>  		goto err_release_fw;
>  	}
>  
> -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> +	mem_virt = memremap(rmem->base, rmem->size, MEMREMAP_WC);
>  	if (!mem_virt) {
>  		ret = -ENOMEM;
>  		goto err_release_fw;
>  	}
>  
> -	ret = qcom_mdt_load(dev, firmware, fw_name,
> -			    pas_id, mem_virt, mem_phys, res_size, NULL);
> +	ret = qcom_mdt_pas_load(ctx, firmware, fw_name, mem_virt, NULL);
>  	if (ret)
>  		goto err_mem_unmap;
>  
> -	ret = qcom_scm_pas_auth_and_reset(pas_id);
> +	if (core->has_iommu) {
> +		ret = iommu_map(core->fw.iommu_domain, 0, rmem->base, rmem->size,
> +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);

What is the use case for IOMMU_PRIV here? You don't have this flag for
the qcom_q6v5_pas change.

> +		if (ret)
> +			goto err_mem_unmap;
> +
> +		/*
> +		 * Firmware has no support for resource table for now, so, lets
> +		 * pass NULL and zero for input resource table and input resource
> +		 * table respectively.
> +		 */
> +		ret = qcom_mdt_pas_map_devmem_rscs(ctx, core->fw.iommu_domain, NULL, 0);
> +		if (ret)
> +			goto err_unmap_carveout;
> +	}
> +
> +	ret = qcom_scm_pas_prepare_and_auth_reset(ctx);
>  	if (ret)
> -		goto err_mem_unmap;
> +		goto err_unmap_devmem_rscs;
> +
> +	core->fw.ctx = ctx;
>  
>  	return ret;
>  
> +err_unmap_devmem_rscs:
> +	if (core->has_iommu)
> +		qcom_mdt_pas_unmap_devmem_rscs(ctx, core->fw.iommu_domain);
> +err_unmap_carveout:
> +	if (core->has_iommu)
> +		iommu_unmap(core->fw.iommu_domain, 0, rmem->size);
>  err_mem_unmap:
>  	memunmap(mem_virt);
>  err_release_fw:
> @@ -109,10 +144,97 @@ int iris_fw_load(struct iris_core *core)
>  
>  int iris_fw_unload(struct iris_core *core)
>  {
> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +	struct qcom_scm_pas_ctx *ctx;
> +	int ret;
> +
> +	ctx = core->fw.ctx;
> +	ret = qcom_scm_pas_shutdown(ctx->peripheral);
> +	if (core->has_iommu) {
> +		iommu_unmap(core->fw.iommu_domain, 0, ctx->mem_size);
> +		qcom_mdt_pas_unmap_devmem_rscs(ctx, core->fw.iommu_domain);
> +	}
> +
> +	return ret;
>  }
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
>  	return qcom_scm_set_remote_state(resume, 0);
>  }
> +
> +int iris_fw_init(struct iris_core *core)
> +{
> +	struct platform_device_info info;
> +	struct iommu_domain *iommu_dom;
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	int ret;
> +
> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> +	if (!np)
> +		return 0;

You need a dt-bindings change for this as well. This is documented only
for Venus.

Thanks,
Stephan

