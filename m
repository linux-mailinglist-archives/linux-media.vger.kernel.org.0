Return-Path: <linux-media+bounces-17274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D419671BA
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 15:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0773B1F22443
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 13:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2971111AA;
	Sat, 31 Aug 2024 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1hh+iJb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232EF1D131B
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110303; cv=none; b=mZq+t4UBmQvEatOiB65KcBzmtvqqIPn3cEqBOrEPoWU5i8T701Mim2qLb2dpnvHsb7M7Riatu1c6mLAGC9LKjAYDqZAu68qBVBT2IvvGHcrqFyl0YZD1Hjfs/41dnaqiJ3WT9QmljXb8C0r42GY/ljKayNNxa9JAYUHP51x8Kxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110303; c=relaxed/simple;
	bh=mu13EQ9HoQejLYVNxt2U8RKRikdH3YeZJxgItcqJ/1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBO1lrRCzgm1URiPfq4gO21otxT9QYPrMQMFn/e7FjUw0fM/mdFfkyZtu4xLA67eAoVufEt2Ppokc0u/7yx11tKB2FuvXAXS0TZPoyNJwcfQiP+SthNFOR7sbDI6zqGUlv1DVYUug3cHyiZ0MtQtdSJY62JkNXCCY+zRd9YvsLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1hh+iJb; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-534366c1aa2so2837947e87.1
        for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 06:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725110298; x=1725715098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJkTnaPWIP3xGBTfa2SPoHVtOVzpX0uKAT2t6dy54EM=;
        b=a1hh+iJbox7UcgTuAp6MNR2ePkcTlYDPewA5oDq/HbnO+ve5O84RRLMAs6NiPtQV4H
         ogGStaIi3+Xv4KXMrPnavc6Jz7CPfDMev+6eK74HLJC8sayc7QHmKe1JX+tLQBZDYCN1
         dhN5pcROFKCESfkh6nAaraaRDuSytpaCo12evEfVU8KFiuFE6gJwOWou1zoogngbZdoU
         Lk41EHMG44mArGu+2hwXQCbPGrt0Dh7BGcD8sSbDV9C6kqBTzONOcj+R4kDpxKo29pBs
         HOTh+RR0UhgwqXG6D4EW/zEbsmHBTc7R3JhAG3emU6dvAoseqkObv+s1T6hZWU9KYwz3
         lOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725110298; x=1725715098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJkTnaPWIP3xGBTfa2SPoHVtOVzpX0uKAT2t6dy54EM=;
        b=I8LFeRoZsk8gZKjB4IA9cjiz9W4VjxoQ6Ct/7AQL6u/swG1PLkIq5WlVmGDP0BR50I
         9nEm1ar53ATLz5WqBdrXbDIgyrx0u+v7Dh6ObmOU5eaOxVgbRMQCYdWMHPq8hwWmkCQb
         RwvRYWRlY9vbwUI2F15GkqxWvVPwBsgamsF7ENeZH7EsjyPm5tHy+vEaYGQcUNH1DNr5
         Bw5EpwDEmUvhbyyecWg54eT78JYzffXVkL9LCJCho+NrqR7W3hUyp5KVm7286Wl1DUm/
         jLlQgp60YgQ63UUZ5lxJhlp5jfHcTx5m6oySz5W1+YI5oyS5cWFeJlR6XulbFGLR/TXD
         blLA==
X-Gm-Message-State: AOJu0Yy0VOAHtijvM2+TrK6MTiygyghIpttZtgOZTHsS1Eqbvh/C4oz1
	dka7BC17bVUZ7aStWwF1IhTBZ6UaJyEKKesh6llZKVMNxHWOlnr2or5uIVlwVlw36P1A/dw8Hly
	0
X-Google-Smtp-Source: AGHT+IGPOz7dvYo89+4zvzcBxzz/93RdbGmQWnTvKAy390yr3LyXNraYmjVZVSj51lwW56kV+d9PFw==
X-Received: by 2002:a05:6512:3d0f:b0:533:46de:30a0 with SMTP id 2adb3069b0e04-53546b9c0cemr3283704e87.54.1725110297376;
        Sat, 31 Aug 2024 06:18:17 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891a3e9dsm325824366b.108.2024.08.31.06.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 06:18:17 -0700 (PDT)
Message-ID: <293f3ddd-531b-443f-a58c-a789337e2b35@linaro.org>
Date: Sat, 31 Aug 2024 14:18:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/29] media: iris: implement video firmware
 load/unload
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-7-c5fdbbe65e70@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240827-iris_v3-v3-7-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> Load/unload firmware in memory via mdt loader.
> Firmware is loaded as part of core initialization
> and unloaded as part of core de-initialization.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/Kconfig           |   2 +
>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>   drivers/media/platform/qcom/iris/iris_core.c       |   8 ++
>   drivers/media/platform/qcom/iris/iris_firmware.c   | 146 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_firmware.h   |  14 ++
>   .../platform/qcom/iris/iris_platform_common.h      |  12 ++
>   .../platform/qcom/iris/iris_platform_sm8250.c      |  10 ++
>   .../platform/qcom/iris/iris_platform_sm8550.c      |  10 ++
>   8 files changed, 203 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 4b757bb8adf3..ea518760c65c 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -3,6 +3,8 @@ config VIDEO_QCOM_IRIS
>           depends on VIDEO_DEV
>           depends on ARCH_QCOM || COMPILE_TEST
>           select V4L2_MEM2MEM_DEV
> +        select QCOM_MDT_LOADER if ARCH_QCOM
> +        select QCOM_SCM
>           help
>             This is a V4L2 driver for Qualcomm Iris video accelerator
>             hardware. It accelerates decoding operations on various
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 48d54e53a576..ddd4c994a0b9 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -1,4 +1,5 @@
>   iris-objs += iris_core.o \
> +             iris_firmware.o \
>                iris_hfi_gen1_command.o \
>                iris_hfi_gen2_command.o \
>                iris_hfi_queue.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 360a54909ef6..8c7d53c57086 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -4,11 +4,13 @@
>    */
>   
>   #include "iris_core.h"
> +#include "iris_firmware.h"
>   #include "iris_state.h"
>   
>   void iris_core_deinit(struct iris_core *core)
>   {
>   	mutex_lock(&core->lock);
> +	iris_fw_unload(core);
>   	iris_hfi_queues_deinit(core);
>   	core->state = IRIS_CORE_DEINIT;
>   	mutex_unlock(&core->lock);
> @@ -33,10 +35,16 @@ int iris_core_init(struct iris_core *core)
>   	if (ret)
>   		goto error;
>   
> +	ret = iris_fw_load(core);
> +	if (ret)
> +		goto error_queue_deinit;
> +
>   	mutex_unlock(&core->lock);
>   
>   	return 0;
>   
> +error_queue_deinit:
> +	iris_hfi_queues_deinit(core);
>   error:
>   	core->state = IRIS_CORE_DEINIT;
>   exit:
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> new file mode 100644
> index 000000000000..55bbcc798f4c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/firmware.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/soc/qcom/mdt_loader.h>
> +
> +#include "iris_core.h"
> +#include "iris_firmware.h"
> +
> +#define MAX_FIRMWARE_NAME_SIZE	128
> +
> +static int iris_protect_cp_mem(struct iris_core *core)
> +{
> +	struct tz_cp_config *cp_config;
> +	int ret;
> +
> +	cp_config = core->iris_platform_data->tz_cp_config_data;
> +
> +	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
> +					     cp_config->cp_size,
> +					     cp_config->cp_nonpixel_start,
> +					     cp_config->cp_nonpixel_size);
> +	if (ret)
> +		dev_err(core->dev, "failed to protect memory(%d)\n", ret);
> +
> +	return ret;
> +}
> +
> +static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> +{
> +	const struct firmware *firmware = NULL;
> +	struct device_node *node = NULL;
> +	struct reserved_mem *rmem;
> +	phys_addr_t mem_phys = 0;
> +	void *mem_virt = NULL;
> +	size_t res_size = 0;
> +	ssize_t fw_size = 0;
> +	struct device *dev;
> +	int pas_id = 0;
> +	int ret;
> +
> +	if (!fw_name || !(*fw_name) || !core)
> +		return -EINVAL;
> +
> +	dev = core->dev;
> +
> +	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> +		return -EINVAL;
> +
> +	pas_id = core->iris_platform_data->pas_id;
> +
> +	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> +	if (!node)
> +		return -EINVAL;
> +
> +	rmem = of_reserved_mem_lookup(node);
> +	if (!rmem) {
> +		ret = -EINVAL;
> +		goto err_put_node;
> +	}
> +
> +	mem_phys = rmem->base;
> +	res_size = rmem->size;
> +
> +	ret = request_firmware(&firmware, fw_name, dev);
> +	if (ret) {
> +		dev_err(core->dev, "failed to request fw \"%s\", error %d\n",
> +			fw_name, ret);
> +		goto err_put_node;
> +	}
> +
> +	fw_size = qcom_mdt_get_size(firmware);
> +	if (fw_size < 0 || res_size < (size_t)fw_size) {
> +		ret = -EINVAL;
> +		dev_err(core->dev, "out of bound fw image fw size: %ld, res_size: %lu\n",
> +			fw_size, res_size);
> +		goto err_release_fw;
> +	}
> +
> +	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> +	if (!mem_virt) {
> +		dev_err(core->dev, "failed to remap fw memory phys %pa[p]\n",
> +			&mem_phys);
> +		goto err_release_fw;
> +	}
> +
> +	ret = qcom_mdt_load(dev, firmware, fw_name,
> +			    pas_id, mem_virt, mem_phys, res_size, NULL);
> +	if (ret) {
> +		dev_err(core->dev, "error %d loading fw \"%s\"\n",
> +			ret, fw_name);
> +		goto err_mem_unmap;
> +	}
> +	ret = qcom_scm_pas_auth_and_reset(pas_id);
> +	if (ret) {
> +		dev_err(core->dev, "error %d authenticating fw \"%s\"\n",
> +			ret, fw_name);
> +		goto err_mem_unmap;
> +	}
> +
> +	return ret;
> +
> +err_mem_unmap:
> +	memunmap(mem_virt);
> +err_release_fw:
> +	release_firmware(firmware);
> +err_put_node:
> +	of_node_put(node);
> +	return ret;
> +}
> +
> +int iris_fw_load(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_load_fw_to_memory(core, core->iris_platform_data->fwname);
> +	if (ret) {
> +		dev_err(core->dev, "firmware download failed\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = iris_protect_cp_mem(core);
> +	if (ret) {
> +		dev_err(core->dev, "protect memory failed\n");
> +		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +int iris_fw_unload(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +	if (ret)
> +		dev_err(core->dev, "firmware unload failed with ret %d\n", ret);
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.h b/drivers/media/platform/qcom/iris/iris_firmware.h
> new file mode 100644
> index 000000000000..8d4f6b7f75c5
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _IRIS_FIRMWARE_H_
> +#define _IRIS_FIRMWARE_H_
> +
> +struct iris_core;
> +
> +int iris_fw_load(struct iris_core *core);
> +int iris_fw_unload(struct iris_core *core);
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5287fdf913bc..9c919367f9d7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -6,6 +6,8 @@
>   #ifndef _IRIS_PLATFORM_COMMON_H_
>   #define _IRIS_PLATFORM_COMMON_H_
>   
> +#define IRIS_PAS_ID				9
> +
>   extern struct iris_platform_data sm8550_data;
>   extern struct iris_platform_data sm8250_data;
>   
> @@ -20,6 +22,13 @@ struct platform_clk_data {
>   	const char *clk_name;
>   };
>   
> +struct tz_cp_config {
> +	u32 cp_start;
> +	u32 cp_size;
> +	u32 cp_nonpixel_start;
> +	u32 cp_nonpixel_size;
> +};
> +
>   struct iris_platform_data {
>   	struct iris_inst *(*get_instance)(void);
>   	const struct icc_info *icc_tbl;
> @@ -33,6 +42,9 @@ struct iris_platform_data {
>   	const char * const *clk_rst_tbl;
>   	unsigned int clk_rst_tbl_size;
>   	u64 dma_mask;
> +	const char *fwname;
> +	u32 pas_id;
> +	struct tz_cp_config *tz_cp_config_data;
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 664cb2b359a3..36bcb1b851ed 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -25,6 +25,13 @@ static const struct platform_clk_data sm8250_clk_table[] = {
>   	{IRIS_HW_CLK,   "vcodec0_core" },
>   };
>   
> +static struct tz_cp_config tz_cp_config_sm8250 = {
> +	.cp_start = 0,
> +	.cp_size = 0x25800000,
> +	.cp_nonpixel_start = 0x01000000,
> +	.cp_nonpixel_size = 0x24800000,
> +};
> +
>   struct iris_platform_data sm8250_data = {
>   	.get_instance = iris_hfi_gen1_get_instance,
>   	.icc_tbl = sm8250_icc_table,
> @@ -38,4 +45,7 @@ struct iris_platform_data sm8250_data = {
>   	.clk_tbl = sm8250_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
>   	.dma_mask = GENMASK(31, 29) - 1,
> +	.fwname = "qcom/vpu/vpu20_p4.mbn",


RB5/sm8250 on this kernel

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-stable-24-08-29-iris-v3-rb5?ref_type=heads

CONFIG_QCOM_VENUS = m

Loads fine and I can run this simple smoke test

ffplay -loglevel debug -codec:video h264_v4l2m2m -i sample-5s.mp4
gst-launch-1.0 -vvv -e filesrc location=sample-5s.mp4 ! qtdemux ! 
parsebin ! v4l2h264dec ! autovideosink


CONFIG_QCOM_IRIS = m

[    2.130077] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7 
counters available
[   12.282381] qcom-iris aa00000.video-codec: Adding to iommu group 13
[   12.463983] qcom-iris aa00000.video-codec: Direct firmware load for 
qcom/vpu/vpu20_p4.mbn failed with error -2
[   12.474396] qcom-iris aa00000.video-codec: failed to request fw 
"qcom/vpu/vpu20_p4.mbn", error -2
[   12.490919] qcom-iris aa00000.video-codec: firmware download failed
[   12.516391] qcom-iris aa00000.video-codec: core init failed

In venus the firmware name is

.fwname = "qcom/vpu-1.0/venus.mbn"

What firmware reference are you testing on with your rb5/sm8250 stuff ?

Mine is linux-firmware / Debian sid.

root@linaro-gnome:~# dpkg -S /lib/firmware/qcom/vpu-1.0/venus.mbn
firmware-qcom-soc: /lib/firmware/qcom/vpu-1.0/venus.mbn

https://packages.debian.org/sid/firmware-qcom-soc

Anyway I don't see much logic/justification for the firmware string change.

---
bod

