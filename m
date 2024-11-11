Return-Path: <linux-media+bounces-21250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEB09C3B78
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 10:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF801F2346F
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 09:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44902170A2E;
	Mon, 11 Nov 2024 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YzKYiPEi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69AD137747
	for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319152; cv=none; b=MZFopizTmm3lwsIQFJGwsidTa+FeZXKlZ9WqCArdOcYOx21gDYswZcXlUxWHiel16ukDgx+/DNwIRKuBHnXKHfhyNdNQBfS98BtE7q3qwnI/p9d3okDFsgfV8Bqo3g1etXuBwnLvIo4jP7C0j3Zlbh4Fq/1Z49ug/tdnj7EMaks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319152; c=relaxed/simple;
	bh=rmX/8/j1+aqwk0jaNTPAzvUgUid7JEJqSEpvZONmTmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=If259lZ+vgoMgGC4oOFKRlFzI4b8/c4K67iil5jA9LgkJ5k2fJ+SaxTf9w5YaZ80tPynwJKTFVZEnfY4elcfWjH8MvdgjQTZWwkkpmyQlIRtBX0DdnAlbJByzLS779e8mDHdt6xJkSgIfQbtbojVQ+QYewLvXGKL63h03aj01XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YzKYiPEi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so2563806f8f.1
        for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 01:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731319149; x=1731923949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=En8YQ6NnS3SQvR0pBKbw5qKwcq7W7P9L7oOZLO3waWM=;
        b=YzKYiPEimgkYJ8CM/LL8Q4NAsXwsC2M3uvVmm7D/7MRg1kUSgUfY1NkL9R3/tZAPIr
         fWce1e564hzXSjL2c2jTMhf5jw8DDardiLL4zIpAAixGS6W+9/IST6IWkTFQ6hT6f9yJ
         T+DsjC1x6x4gy4+bLDC6neBdT5nHoAP6OV61IfU86Zng2RV6hhwEqtb99wTzKX5Uo0Zn
         4E0/HIYoJJoei7uded4TLncVvSlvX2QSOJhn2mudFhFUv0/h94Ln0LjHwE4T+wGlKSRb
         fZ6aQ2fRyGlQwpG9+aN0gS2KTdDAwLf4RD7f3Td6p26MABSV5peojp1iG/uql9iDjx1q
         ONjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731319149; x=1731923949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=En8YQ6NnS3SQvR0pBKbw5qKwcq7W7P9L7oOZLO3waWM=;
        b=UmtQoMhHhNhX1m04UzVsc3smNnlkIbIzW5GoMf+pCDs+A5LaHc7zE0r1UIMP2ihhYX
         7IrAEjtuvaNqoUGveqDK6sP018uDCKFJ+NgL6K+RZbQSnK/mtnSj87nFAmzVbIyyZSK6
         q7PnsulCyJ6wbRcgx2CZYuIhkmWgkHT5CTNeeDuoNQ9nWqmHFZL8JpMCGz/LspC4pbQK
         K/lcovKYYIIEBDED0HNmAp2Q9thz4XZmhMVXEh5o0wMSkVO9gfwfuCwldhehzxgCRp/B
         +/Ti7fFFLJzqBJrvJG/ZoVr8650q+yBk9+8TeAtUOFBupUi9zDzNUOcbCoCA56DkX6U7
         xRtw==
X-Forwarded-Encrypted: i=1; AJvYcCWu5E9iV/xmjZz7ru8xOeLGbPnciEv+X5+WT7uq7AH2rxcGGKmibCCHV6xi9uXWO3cOd9TzH7GT7imK8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Eut4EQ0tez3njM+Rd9oQjyuT9pPCo7HRfpBIOzeGN1CE4VDu
	MDPWy7sL7zVkqagom3sa1LlR6/aKQSb46OUagOl0axGxTz+t1ZFS1qkCapOgLew=
X-Google-Smtp-Source: AGHT+IEB3NLr9cE5q2bvYPX+LxKJvFqQcMVpePhl617hMa/TP7auC58aVN6Grg16i70Zv65pLjjzIw==
X-Received: by 2002:a5d:47a4:0:b0:37d:4dcc:7fb4 with SMTP id ffacd0b85a97d-381f1863442mr7966807f8f.10.1731319148920;
        Mon, 11 Nov 2024 01:59:08 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970e18sm12373713f8f.10.2024.11.11.01.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:59:08 -0800 (PST)
Message-ID: <537ee97b-97d9-4ed8-9e11-eb3489eeff26@linaro.org>
Date: Mon, 11 Nov 2024 09:59:07 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/28] media: iris: implement video firmware
 load/unload
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-5-a88e7c220f78@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241105-qcom-video-iris-v5-5-a88e7c220f78@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 06:55, Dikshita Agarwal wrote:
> Load/unload firmware in memory via mdt loader. Firmware is loaded as
> part of core initialization and unloaded as part of core
> de-initialization.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/Kconfig           |   2 +
>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>   drivers/media/platform/qcom/iris/iris_core.c       |   8 ++
>   drivers/media/platform/qcom/iris/iris_firmware.c   | 108 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_firmware.h   |  14 +++
>   .../platform/qcom/iris/iris_platform_common.h      |  12 +++
>   .../platform/qcom/iris/iris_platform_sm8550.c      |  10 ++
>   7 files changed, 155 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 8debddec87a5..f92cc7fe9378 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -3,6 +3,8 @@ config VIDEO_QCOM_IRIS
>           depends on VIDEO_DEV
>           depends on ARCH_QCOM || COMPILE_TEST
>           select V4L2_MEM2MEM_DEV
> +        select QCOM_MDT_LOADER if ARCH_QCOM
> +        select QCOM_SCM
>           help
>             This is a V4L2 driver for Qualcomm iris video accelerator
>             hardware. It accelerates decoding operations on various
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 93711f108a77..6906caa2c481 100644
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
> index 000000000000..58a0f532b862
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -0,0 +1,108 @@
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
> +static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> +{
> +	u32 pas_id = core->iris_platform_data->pas_id;
> +	const struct firmware *firmware = NULL;
> +	struct device *dev = core->dev;
> +	struct reserved_mem *rmem;
> +	struct device_node *node;
> +	phys_addr_t mem_phys;
> +	size_t res_size;
> +	ssize_t fw_size;
> +	void *mem_virt;
> +	int ret;
> +
> +	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> +		return -EINVAL;
> +
> +	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> +	if (!node)
> +		return -EINVAL;
> +
> +	rmem = of_reserved_mem_lookup(node);

of_node_put(node);

> +	if (!rmem) {
> +		ret = -EINVAL;
return -EINVAL;
> +		goto err_put_node;

remove

> +	}
> +
> +	mem_phys = rmem->base;
> +	res_size = rmem->size;
> +
> +	ret = request_firmware(&firmware, fw_name, dev);
> +	if (ret)
> +		goto err_put_node;

return ret;

> +
> +	fw_size = qcom_mdt_get_size(firmware);
> +	if (fw_size < 0 || res_size < (size_t)fw_size) {
> +		ret = -EINVAL;
> +		goto err_release_fw;
> +	}
> +
> +	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> +	if (!mem_virt)
> +		goto err_release_fw;
> +
> +	ret = qcom_mdt_load(dev, firmware, fw_name,
> +			    pas_id, mem_virt, mem_phys, res_size, NULL);
> +	if (ret)
> +		goto err_mem_unmap;
> +
> +	ret = qcom_scm_pas_auth_and_reset(pas_id);
> +	if (ret)
> +		goto err_mem_unmap;
> +
> +	return ret;
> +
> +err_mem_unmap:
> +	memunmap(mem_virt);
> +err_release_fw:
> +	release_firmware(firmware);
> +err_put_node:
> +	of_node_put(node);

remove

> +
> +	return ret;
> +}
> +
> +int iris_fw_load(struct iris_core *core)
> +{
> +	struct tz_cp_config *cp_config = core->iris_platform_data->tz_cp_config_data;
> +	int ret;
> +
> +	ret = iris_load_fw_to_memory(core, core->iris_platform_data->fwname);
> +	if (ret) {
> +		dev_err(core->dev, "firmware download failed\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
> +					     cp_config->cp_size,
> +					     cp_config->cp_nonpixel_start,
> +					     cp_config->cp_nonpixel_size);
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
> +	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
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
> index dac64ec4bf03..04bef37b7b77 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -6,6 +6,8 @@
>   #ifndef _IRIS_PLATFORM_COMMON_H_
>   #define _IRIS_PLATFORM_COMMON_H_
>   
> +#define IRIS_PAS_ID				9
> +
>   extern struct iris_platform_data sm8550_data;
>   
>   enum platform_clk_type {
> @@ -19,6 +21,13 @@ struct platform_clk_data {
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
> @@ -32,6 +41,9 @@ struct iris_platform_data {
>   	const char * const *clk_rst_tbl;
>   	unsigned int clk_rst_tbl_size;
>   	u64 dma_mask;
> +	const char *fwname;
> +	u32 pas_id;
> +	struct tz_cp_config *tz_cp_config_data;
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index 9b305b8e2110..96d9d6e816a0 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -24,6 +24,13 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>   	{IRIS_HW_CLK,   "vcodec0_core" },
>   };
>   
> +static struct tz_cp_config tz_cp_config_sm8550 = {
> +	.cp_start = 0,
> +	.cp_size = 0x25800000,
> +	.cp_nonpixel_start = 0x01000000,
> +	.cp_nonpixel_size = 0x24800000,
> +};
> +
>   struct iris_platform_data sm8550_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.icc_tbl = sm8550_icc_table,
> @@ -37,4 +44,7 @@ struct iris_platform_data sm8550_data = {
>   	.clk_tbl = sm8550_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>   	.dma_mask = GENMASK(31, 29) - 1,
> +	.fwname = "qcom/vpu/vpu30_p4.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.tz_cp_config_data = &tz_cp_config_sm8550,
>   };
> 


