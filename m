Return-Path: <linux-media+bounces-39847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD8B25646
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 00:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8CAB1C27141
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 22:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773A82F39D0;
	Wed, 13 Aug 2025 22:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vkGkQIJs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E392F39A0
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 22:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755122893; cv=none; b=mPeHTyB9z/YgU0WyK9v74snvNlgL7clR141sepkFiXPec9rhesGdHFVgmsaDTFdnk0Bi8i8RapOZAJ1U3js669mR99nSsuC5aK7fA6k6bAQXq979eviaGUlqk377hYlSZFlx831omNmYL5wP6vzf3czXsbsqX91sEa5Syi3T/D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755122893; c=relaxed/simple;
	bh=cOzIQCDUe0+XfgNsEEQjPQSKEdXLsnLnzVTF/W0TXu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WwJc6POO4d+GHPddaLJ8qjhNtY48Rx2jwXSt2jB0lqE2Rlszat/O+GjvKwQ7IxOl8uA+kEQ6VE0teitjjLZ1KHl6A/hPpmJU4SN5blndqyMoSoh+9SaKpgIbYAhrYMCZgJ7MYgCc05PCskA+b102S8+cg5sMCNJuTRvYRLDug7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vkGkQIJs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b05a49cso2038805e9.1
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 15:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755122890; x=1755727690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGvnQRJXrX042hXZ7hl3cbdusCF8NvFI3WtV50e38aE=;
        b=vkGkQIJsWqSPiZZC6YLLjsbxXjlOyAsYyT1ZQ7cVABKoyDzXDJATUU26BFiP/IFdlG
         n/ltDr/oNkdsdLx1OpcXUyFHTSVjiK2Bpgv6fYUMDCV2ATxCu6OULjgxjlr7/6wIdNCN
         nc43n8WuYPTHQfNHEkxXtTVKkDYNzgJWNs6DWBOOZX8JKnDMRdUK58wYHG4U6Jcet+zX
         24Y2fyhjXvw0v3Lp6YDHvj/9TxjdkcQugSeGmFLYUibP4ikbGw34LAxko/cPLaWc3I/7
         TpqYpDnvg3b5ABUGKjkABLOnVe3PLXmrRtKegPKzuENd3pQqinXvyelIl6yeutvEmjDd
         fTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755122890; x=1755727690;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGvnQRJXrX042hXZ7hl3cbdusCF8NvFI3WtV50e38aE=;
        b=ZxVRJg+2WOZgvBJ3FNCowaC5ToCQigqCEsCH68v3Sejj0LV16kUjXzTv0fhIoDPRkW
         +dpTKkwdYM3wv34tq6WjVnxTQr3KUhF5oLm1bvfESsfMyJ1Fpdwa6R/UCKViECHR7rRg
         P3vGaMdi8nCLYL52DF2hHLRdNv4qC9dgBqvpx55E/aRfUZUfoE4nRiQAhrxUrvoMZ7yP
         d4hYTuJCTjqRevvG+aO3B1pg5InreshkSzt/683tJlwu0aVjgk5dUC+n+PEZUboFYpAv
         Vmaq+SzBihihWt9ut3ueoR1Leirodtn80dWYOmGxDhWiLbwl3+5uGdDIyesFvsBSvEwz
         fXfg==
X-Forwarded-Encrypted: i=1; AJvYcCVIV/+hz16CoFHn2Cnsek9TVnY7x0X0wMgC7EbM3RiWF/A5gheFDObPdLQjEVOA27kub/2sKdcuiNUiCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+6VyrB1EQw0MKaXkby+4jhIS8YLWmgYmSssj+j7ezdsHYisbj
	juy5bs3TVpnJLuXnQJNHbcFUQUv0+H0L3SYOyA2bCPpgZ3XKdvSOiQvAj2V8aB2veGgbzY43gBe
	snp7s1qk=
X-Gm-Gg: ASbGnctUFpUxzXsziSbuPS78E8TmSo5XWcIrmPj74FVKMtHTvLyQzRxek4iJAkItbzL
	B1sv2XZoxHo8mgt/OI9YwAso3zYwtfgAXlppjMlt3hLAF8gDg9MaR80aIua170hIhEFk8ChFe6m
	S7OOWT1kVZWor6AMYRLI0Alzs5pzmiXOZEmVTwagqG4ukE/ZS1OxJUGb1k9IhKb+0cZqQYRUevc
	tlbrsHXHms8By7pT3tl1pwTlPhZJr3ULJ0RB6urw57+58G1jr6+8OtkfNakL5lcfOWSDJz8VJup
	GqpKxzAQPShK2ZC+XJRLzGxIYIG+PGBP/fLJF9xAE5XQJa634NO8uMtjnjtAgW0q7dSA4FL3yiK
	5m/HyGiZoLISqxDB201S+CtJUSgtndJKxUYweZNUmoQm4HD//3Hh/KJyl8qwrZbET
X-Google-Smtp-Source: AGHT+IGAYNm27ZVowf7WspE+IzHrbkyB12Y7kx7nFsTZoij4WqyQxBHxHb7jlAy5R2YCjfPtWok4gg==
X-Received: by 2002:a05:600c:3b93:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-45a1b605070mr2758535e9.2.1755122889639;
        Wed, 13 Aug 2025 15:08:09 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453aeasm50861002f8f.40.2025.08.13.15.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:08:09 -0700 (PDT)
Message-ID: <5dafef36-72bc-4958-9348-57d9ff4a10d1@linaro.org>
Date: Wed, 13 Aug 2025 23:08:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: Use of_reserved_mem_region_to_resource() for
 "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Ming Qian <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250813214949.897858-1-robh@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813214949.897858-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 22:49, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>   - Rebase on v6.17-rc1
> ---
>   drivers/media/platform/amphion/vpu_core.c     | 40 +++++--------------
>   .../media/platform/qcom/iris/iris_firmware.c  | 18 +++------
>   drivers/media/platform/qcom/venus/firmware.c  | 19 +++------
>   3 files changed, 21 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
> index da00f5fc0e5d..168f0514851e 100644
> --- a/drivers/media/platform/amphion/vpu_core.c
> +++ b/drivers/media/platform/amphion/vpu_core.c
> @@ -10,7 +10,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> -#include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
> @@ -542,47 +542,30 @@ const struct vpu_core_resources *vpu_get_resource(struct vpu_inst *inst)
>   
>   static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *np)
>   {
> -	struct device_node *node;
>   	struct resource res;
>   	int ret;
>   
> -	if (of_count_phandle_with_args(np, "memory-region", NULL) < 2) {
> -		dev_err(core->dev, "need 2 memory-region for boot and rpc\n");
> -		return -ENODEV;
> +	ret = of_reserved_mem_region_to_resource(np, 0, &res);
> +	if (ret) {
> +		dev_err(core->dev, "Cannot get boot-region\n");
> +		return ret;
>   	}
>   
> -	node = of_parse_phandle(np, "memory-region", 0);
> -	if (!node) {
> -		dev_err(core->dev, "boot-region of_parse_phandle error\n");
> -		return -ENODEV;
> -	}
> -	if (of_address_to_resource(node, 0, &res)) {
> -		dev_err(core->dev, "boot-region of_address_to_resource error\n");
> -		of_node_put(node);
> -		return -EINVAL;
> -	}
>   	core->fw.phys = res.start;
>   	core->fw.length = resource_size(&res);
>   
> -	of_node_put(node);
> -
> -	node = of_parse_phandle(np, "memory-region", 1);
> -	if (!node) {
> -		dev_err(core->dev, "rpc-region of_parse_phandle error\n");
> -		return -ENODEV;
> -	}
> -	if (of_address_to_resource(node, 0, &res)) {
> -		dev_err(core->dev, "rpc-region of_address_to_resource error\n");
> -		of_node_put(node);
> -		return -EINVAL;
> +	ret = of_reserved_mem_region_to_resource(np, 1, &res);
> +	if (ret) {
> +		dev_err(core->dev, "Cannot get rpc-region\n");
> +		return ret;
>   	}
> +
>   	core->rpc.phys = res.start;
>   	core->rpc.length = resource_size(&res);
>   
>   	if (core->rpc.length < core->res->rpc_size + core->res->fwlog_size) {
>   		dev_err(core->dev, "the rpc-region <%pad, 0x%x> is not enough\n",
>   			&core->rpc.phys, core->rpc.length);
> -		of_node_put(node);
>   		return -EINVAL;
>   	}
>   
> @@ -594,7 +577,6 @@ static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *np)
>   	if (ret != VPU_CORE_MEMORY_UNCACHED) {
>   		dev_err(core->dev, "rpc region<%pad, 0x%x> isn't uncached\n",
>   			&core->rpc.phys, core->rpc.length);
> -		of_node_put(node);
>   		return -EINVAL;
>   	}
>   
> @@ -606,8 +588,6 @@ static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *np)
>   	core->act.length = core->rpc.length - core->res->rpc_size - core->log.length;
>   	core->rpc.length = core->res->rpc_size;
>   
> -	of_node_put(node);
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index f1b5cd56db32..40448429ba97 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -19,8 +19,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>   	u32 pas_id = core->iris_platform_data->pas_id;
>   	const struct firmware *firmware = NULL;
>   	struct device *dev = core->dev;
> -	struct reserved_mem *rmem;
> -	struct device_node *node;
> +	struct resource res;
>   	phys_addr_t mem_phys;
>   	size_t res_size;
>   	ssize_t fw_size;
> @@ -30,17 +29,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>   	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>   		return -EINVAL;
>   
> -	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> -	if (!node)
> -		return -EINVAL;
> -
> -	rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> -	if (!rmem)
> -		return -EINVAL;
> +	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> +	if (ret)
> +		return ret;
>   
> -	mem_phys = rmem->base;
> -	res_size = rmem->size;
> +	mem_phys = res.start;
> +	res_size = resource_size(&res);
>   
>   	ret = request_firmware(&firmware, fw_name, dev);
>   	if (ret)
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 66a18830e66d..37c0fd52333e 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -9,7 +9,6 @@
>   #include <linux/iommu.h>
>   #include <linux/io.h>
>   #include <linux/of.h>
> -#include <linux/of_address.h>
>   #include <linux/of_reserved_mem.h>
>   #include <linux/platform_device.h>
>   #include <linux/of_device.h>
> @@ -83,8 +82,7 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>   			 phys_addr_t *mem_phys, size_t *mem_size)
>   {
>   	const struct firmware *mdt;
> -	struct reserved_mem *rmem;
> -	struct device_node *node;
> +	struct resource res;
>   	struct device *dev;
>   	ssize_t fw_size;
>   	void *mem_va;
> @@ -94,15 +92,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>   	*mem_size = 0;
>   
>   	dev = core->dev;
> -	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> -	if (!node) {
> -		dev_err(dev, "no memory-region specified\n");
> -		return -EINVAL;
> -	}
> -
> -	rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> -	if (!rmem) {
> +	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> +	if (ret) {
>   		dev_err(dev, "failed to lookup reserved memory-region\n");
>   		return -EINVAL;
>   	}
> @@ -117,8 +108,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>   		goto err_release_fw;
>   	}
>   
> -	*mem_phys = rmem->base;
> -	*mem_size = rmem->size;
> +	*mem_phys = res.start;
> +	*mem_size = resource_size(&res);
>   
>   	if (*mem_size < fw_size || fw_size > VENUS_FW_MEM_SIZE) {
>   		ret = -EINVAL;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

