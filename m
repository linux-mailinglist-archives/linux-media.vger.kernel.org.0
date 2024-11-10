Return-Path: <linux-media+bounces-21231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6AE9C34CE
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 22:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 279DEB21486
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 21:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF47157484;
	Sun, 10 Nov 2024 21:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uNPa1blX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FE14B075
	for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 21:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731274666; cv=none; b=Da/WRTsnRIe5rtlH3Ol0pKNldO2ZFjJ+fumMmM7Z+smY4eRB+fNuFfdlfKLHjFN0+kjudCiucCx98ngvzCFGyjN5m+YhU5nGLBBG21vb7nLBnraaEZWRHZqCd40peq/y6hBVJ3c1jzF1eBdrCgZ8+1Qi5XgkJ6ViUngzS3Sny4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731274666; c=relaxed/simple;
	bh=9gBzSEQEadYKikF5EtPh2kdsYRbjpFtILtx4lVSppog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHU3JN0cCCA1I0kXAcYG67gE8592Hdn9hzJZlHVW/7uvUNR4tS2sE0B7KT7AkdM6DXJ0VnMCBVFIVHdoVQ/hGVdWEiUxQ7KynNpnQ8VftDkB8EI6x3ucM6aEQiBW7SHDf0lnE8Z3QpV59MCbC6lt1p4U6pl6YDRPxcxg/5xdIF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uNPa1blX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43152b79d25so31440725e9.1
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 13:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731274662; x=1731879462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JmYuAa6t8nGCE6+aRkzTSD0KnWIju2Fdo+/2ju5i0sY=;
        b=uNPa1blXkjFC2/D63XeWQLu3lWuhzw5VrLhXkef/teElC/g5kBjpcSUFt0syF6JBN6
         3d5OyzrkAmnty8Lro+fKQbLMR6P/8eGNFJBJYTct2Dgv5ZpeVlnawJfl/mtv5IORvdzL
         7Kw3M5Bv6Q527I6Cp8WQqp4sFiV2DE9y1d7mkSua9+85qrZA1QKEKZrXxJSHwITpg/Dw
         X0Tcd3ZwL3ktjc8Do5FxcfjG5HcvUs/zuewAIFrLFFdqXrMVAd2qF9tma93XgSCltx9Z
         VGMSYCmDXiTWsROIQjjEwns1rHbJdXFKewcoHR9q6o9CwUAm9I3rxVt3HuAPCcOckjuy
         1q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731274662; x=1731879462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmYuAa6t8nGCE6+aRkzTSD0KnWIju2Fdo+/2ju5i0sY=;
        b=bTd4ZEtFDMYF2OPiFThU3YiMXsLW+yrFrk79bc8+r063PdBsimnf6Jopjj40Ulv1SJ
         szWpfe9pTcQ78rs9im45SBDB0yI9UNoqtYX0bnNGZX0DfVENm1LkzEPG6qdsNE/48C/C
         eOOKFvvIr9nvcLO/aHMTlyvVnml+KvUOhMKARizeaOsmXXscJoGj4QFe0havvigaPqh2
         Yh1NI47xjr8XthEYTlwJEQWv52DvYp6syExp6/DGsZEXCqmDuWlKYT+5qyvXbZXXi7f3
         SXOI1O9hBDt32uRpT6OrIs/dXR3Kf4O+v+p0keGpXO+0zd6akQaO/vCISEZIotudOTB0
         Kyvg==
X-Forwarded-Encrypted: i=1; AJvYcCUKUa38j7lzkm2SAiBRzlNCAt1aGPRHmpIWfYCG2IDooLo3cHBGd8FhUTi1zAvXZsU9pDB9H40P+QaWrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ieQa+Rw5VrQC3fOWSmt6tzJEsFXcc7V3eyvZV8+DER7uk6w3
	p/W1s2/4Qtqobs6ILfcViUgXllfwrDP9sm8yjqE+d0Uar1wkhdl1nZTlDTBXbVQ=
X-Google-Smtp-Source: AGHT+IESFYcuK4LbVK1mhuQglwRx3XCzxpihvpAxgd0lw6n74R3kjpaTp1shzNbqrRyh7vHGq7+19w==
X-Received: by 2002:a05:600c:3ca4:b0:431:680e:95d9 with SMTP id 5b1f17b1804b1-432b7517221mr86608905e9.22.1731274662489;
        Sun, 10 Nov 2024 13:37:42 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970d4fsm11456302f8f.5.2024.11.10.13.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 13:37:41 -0800 (PST)
Message-ID: <0d0e76ce-fac9-4cd9-b177-7180daffbf86@linaro.org>
Date: Sun, 10 Nov 2024 21:37:39 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/28] media: iris: introduce iris core state
 management with shared queues
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-4-a88e7c220f78@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241105-qcom-video-iris-v5-4-a88e7c220f78@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 06:55, Dikshita Agarwal wrote:
> Introduce core state management for iris driver with necessary queues
> needed for host firmware communication.
> 
> There are 3 types of queues:
> Command queue - driver to write any command to firmware.
> Message queue - firmware to send any response to driver.
> Debug queue - firmware to write debug messages.
> Initialize and configire shared queues during probe.
> 
> Different states for core:
> IRIS_CORE_DEINIT - default state.
> IRIS_CORE_INIT - core state with core initialized. FW loaded and HW
> brought out of reset, shared queues established between host driver and
> firmware.
> IRIS_CORE_ERROR - error state.
>        -----------
>             |
>             V
>         -----------
>         | DEINIT  |
>         -----------
>             ^
>            / \
>           /   \
>          /     \
>         /       \
>        v         v
>   -----------   ----------.
>   |  INIT  |-->|  ERROR  |
>   -----------   ----------.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   4 +-
>   drivers/media/platform/qcom/iris/iris_core.c       |  46 ++++++
>   drivers/media/platform/qcom/iris/iris_core.h       |  23 +++
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 123 +++++++++++++++
>   drivers/media/platform/qcom/iris/iris_hfi_queue.h  | 175 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   .../platform/qcom/iris/iris_platform_sm8550.c      |   1 +
>   drivers/media/platform/qcom/iris/iris_probe.c      |  20 +++
>   drivers/media/platform/qcom/iris/iris_state.h      |  41 +++++
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   6 +
>   10 files changed, 439 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 6de584090a3a..93711f108a77 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -1,5 +1,7 @@
> -iris-objs += iris_hfi_gen1_command.o \
> +iris-objs += iris_core.o \
> +             iris_hfi_gen1_command.o \
>                iris_hfi_gen2_command.o \
> +             iris_hfi_queue.o \
>                iris_platform_sm8550.o \
>                iris_probe.o \
>                iris_vidc.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> new file mode 100644
> index 000000000000..360a54909ef6
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_state.h"
> +
> +void iris_core_deinit(struct iris_core *core)
> +{
> +	mutex_lock(&core->lock);
> +	iris_hfi_queues_deinit(core);
> +	core->state = IRIS_CORE_DEINIT;
> +	mutex_unlock(&core->lock);
> +}
> +
> +int iris_core_init(struct iris_core *core)
> +{
> +	int ret;
> +
> +	mutex_lock(&core->lock);
> +	if (core->state == IRIS_CORE_INIT) {
> +		ret = 0;
> +		goto exit;
> +	} else if (core->state == IRIS_CORE_ERROR) {
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
> +	core->state = IRIS_CORE_INIT;
> +
> +	ret = iris_hfi_queues_init(core);
> +	if (ret)
> +		goto error;
> +
> +	mutex_unlock(&core->lock);
> +
> +	return 0;
> +
> +error:
> +	core->state = IRIS_CORE_DEINIT;
> +exit:
> +	mutex_unlock(&core->lock);
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 73c835bb6589..5fd11c3f99c5 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -9,7 +9,9 @@
>   #include <linux/types.h>
>   #include <media/v4l2-device.h>
>   
> +#include "iris_hfi_queue.h"
>   #include "iris_platform_common.h"
> +#include "iris_state.h"
>   
>   struct icc_info {
>   	const char		*name;
> @@ -34,6 +36,15 @@ struct icc_info {
>    * @clk_count: count of iris clocks
>    * @resets: table of iris reset clocks
>    * @iris_platform_data: a structure for platform data
> + * @state: current state of core
> + * @iface_q_table_daddr: device address for interface queue table memory
> + * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
> + * @iface_q_table_vaddr: virtual address for interface queue table memory
> + * @sfr_vaddr: virtual address for SFR (Sub System Failure Reason) register memory
> + * @command_queue: shared interface queue to send commands to firmware
> + * @message_queue: shared interface queue to receive responses from firmware
> + * @debug_queue: shared interface queue to receive debug info from firmware
> + * @lock: a lock for this strucure
>    */
>   
>   struct iris_core {
> @@ -51,6 +62,18 @@ struct iris_core {
>   	u32					clk_count;
>   	struct reset_control_bulk_data		*resets;
>   	const struct iris_platform_data		*iris_platform_data;
> +	enum iris_core_state			state;
> +	dma_addr_t				iface_q_table_daddr;
> +	dma_addr_t				sfr_daddr;
> +	void					*iface_q_table_vaddr;
> +	void					*sfr_vaddr;
> +	struct iris_iface_q_info		command_queue;
> +	struct iris_iface_q_info		message_queue;
> +	struct iris_iface_q_info		debug_queue;
> +	struct mutex				lock; /* lock for core related operations */
>   };
>   
> +int iris_core_init(struct iris_core *core);
> +void iris_core_deinit(struct iris_core *core);
> +
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> new file mode 100644
> index 000000000000..bb7e0d747f0f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_hfi_queue.h"
> +
> +static void iris_hfi_queue_set_header(struct iris_core *core, u32 queue_id,
> +				      struct iris_iface_q_info *iface_q)
> +{
> +	iface_q->qhdr->status = 0x1;

What does 0x1 indicate ?

Could this be a define instead of an assigned number ?

> +	iface_q->qhdr->start_addr = iface_q->device_addr;
> +	iface_q->qhdr->header_type = IFACEQ_DFLT_QHDR;
> +	iface_q->qhdr->queue_type = queue_id;
> +	iface_q->qhdr->q_size = IFACEQ_QUEUE_SIZE / sizeof(u32);
> +	iface_q->qhdr->pkt_size = 0; /* variable packet size */
> +	iface_q->qhdr->rx_wm = 0x1;
> +	iface_q->qhdr->tx_wm = 0x1;
> +	iface_q->qhdr->rx_req = 0x1;
> +	iface_q->qhdr->tx_req = 0x0;
> +	iface_q->qhdr->rx_irq_status = 0x0;
> +	iface_q->qhdr->tx_irq_status = 0x0;
> +	iface_q->qhdr->read_idx = 0x0;
> +	iface_q->qhdr->write_idx = 0x0;
> +
> +	/*
> +	 * Set receive request to zero on debug queue as there is no
> +	 * need of interrupt from video hardware for debug messages
> +	 */
> +	if (queue_id == IFACEQ_DBGQ_ID)
> +		iface_q->qhdr->rx_req = 0;
> +}
> +
> +static void
> +iris_hfi_queue_init(struct iris_core *core, u32 queue_id, struct iris_iface_q_info *iface_q)
> +{
> +	struct iris_hfi_queue_table_header *q_tbl_hdr = core->iface_q_table_vaddr;
> +	u32 offset = sizeof(*q_tbl_hdr) + (queue_id * IFACEQ_QUEUE_SIZE);
> +
> +	iface_q->device_addr = core->iface_q_table_daddr + offset;
> +	iface_q->kernel_vaddr =
> +			(void *)((char *)core->iface_q_table_vaddr + offset);
> +	iface_q->qhdr = &q_tbl_hdr->q_hdr[queue_id];
> +
> +	iris_hfi_queue_set_header(core, queue_id, iface_q);
> +}
> +
> +static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
> +{
> +	iface_q->qhdr = NULL;
> +	iface_q->kernel_vaddr = NULL;
> +	iface_q->device_addr = 0;
> +}
> +
> +int iris_hfi_queues_init(struct iris_core *core)
> +{
> +	struct iris_hfi_queue_table_header *q_tbl_hdr;
> +	u32 queue_size;
> +
> +	/* Iris hardware requires 4K queue alignment */
> +	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
> +	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
> +						    &core->iface_q_table_daddr,
> +						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
> +	if (!core->iface_q_table_vaddr) {
> +		dev_err(core->dev, "queues alloc and map failed\n");
> +		return -ENOMEM;
> +	}
> +
> +	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
> +					  &core->sfr_daddr,
> +					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
> +	if (!core->sfr_vaddr) {
> +		dev_err(core->dev, "sfr alloc and map failed\n");
> +		dma_free_attrs(core->dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
> +			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
> +		return -ENOMEM;
> +	}
> +
> +	iris_hfi_queue_init(core, IFACEQ_CMDQ_ID, &core->command_queue);
> +	iris_hfi_queue_init(core, IFACEQ_MSGQ_ID, &core->message_queue);
> +	iris_hfi_queue_init(core, IFACEQ_DBGQ_ID, &core->debug_queue);
> +
> +	q_tbl_hdr = (struct iris_hfi_queue_table_header *)core->iface_q_table_vaddr;
> +	q_tbl_hdr->version = 0;
> +	q_tbl_hdr->device_addr = (void *)core;
> +	strscpy(q_tbl_hdr->name, "iris-hfi-queues", sizeof(q_tbl_hdr->name));
> +	q_tbl_hdr->size = sizeof(*q_tbl_hdr);
> +	q_tbl_hdr->qhdr0_offset = sizeof(*q_tbl_hdr) -
> +		(IFACEQ_NUMQ * sizeof(struct iris_hfi_queue_header));
> +	q_tbl_hdr->qhdr_size = sizeof(q_tbl_hdr->q_hdr[0]);
> +	q_tbl_hdr->num_q = IFACEQ_NUMQ;
> +	q_tbl_hdr->num_active_q = IFACEQ_NUMQ;
> +
> +	 /* Write sfr size in first word to be used by firmware */
> +	*((u32 *)core->sfr_vaddr) = SFR_SIZE;
> +
> +	return 0;
> +}
> +
> +void iris_hfi_queues_deinit(struct iris_core *core)
> +{
> +	if (!core->iface_q_table_vaddr)
> +		return;
> +
> +	iris_hfi_queue_deinit(&core->debug_queue);
> +	iris_hfi_queue_deinit(&core->message_queue);
> +	iris_hfi_queue_deinit(&core->command_queue);
> +
> +	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
> +		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
> +
> +	core->sfr_vaddr = NULL;
> +	core->sfr_daddr = 0;
> +
> +	dma_free_attrs(core->dev, sizeof(struct iris_hfi_queue_table_header),
> +		       core->iface_q_table_vaddr, core->iface_q_table_daddr,
> +		       DMA_ATTR_WRITE_COMBINE);
> +
> +	core->iface_q_table_vaddr = NULL;
> +	core->iface_q_table_daddr = 0;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.h b/drivers/media/platform/qcom/iris/iris_hfi_queue.h
> new file mode 100644
> index 000000000000..54994bb776f1
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.h
> @@ -0,0 +1,175 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _IRIS_HFI_QUEUE_H_
> +#define _IRIS_HFI_QUEUE_H_
> +
> +struct iris_core;
> +
> +/*
> + * Maximum number of buffers which queue can hold until
> + * hardware stops responding and driver times out.
> + */
> +#define IFACEQ_MAX_BUF_COUNT		50

Is there any reason 50 is chosen here ?

Could it be 32, 64 or another 0x10 aligned number ?

> +/*
> + * Max session supported are 16.
> + * this value is used to calcualte the size of
> + * individual shared queue.
> + */
> +#define IFACE_MAX_PARALLEL_SESSIONS	16
> +#define IFACEQ_DFLT_QHDR		0x0101
> +#define IFACEQ_MAX_PKT_SIZE		1024 /* Maximum size of a packet in the queue */
> +
> +/*
> + * SFR: Subsystem Failure Reason
> + * when hardware goes into bad state/failure, firmware fills this memory
> + * and driver will get to know the actual failure reason from this SFR buffer.
> + */
> +#define SFR_SIZE			SZ_4K /* Iris hardware requires 4K queue alignment */
> +
> +#define IFACEQ_QUEUE_SIZE		(IFACEQ_MAX_PKT_SIZE * \
> +					 IFACEQ_MAX_BUF_COUNT * IFACE_MAX_PARALLEL_SESSIONS)
> +
> +/*
> + * Memory layout of the shared queues:
> + *
> + *   ||=================||  ^        ^         ^
> + *   ||                 ||  |        |         |
> + *   ||    Queue Table  || 288 Bytes |         |
> + *   ||      Header     ||  |        |         |
> + *   ||                 ||  |        |         |
> + *   ||-----------------||  V        |         |
> + *   ||-----------------||  ^        |         |
> + *   ||                 ||  |        |         |
> + *   ||  Command Queue  || 56 Bytes  |         |
> + *   ||     Header      ||  |        |         |
> + *   ||                 ||  |        |         |
> + *   ||-----------------||  V       456 Bytes  |
> + *   ||-----------------||  ^        |         |
> + *   ||                 ||  |        |         |
> + *   ||  Message Queue  || 56 Bytes  |         |
> + *   ||     Header      ||  |        |         |
> + *   ||                 ||  |        |         |
> + *   ||-----------------||  V        |         Buffer size aligned to 4k
> + *   ||-----------------||  ^        |         Overall Queue Size = 2,404 KB
> + *   ||                 ||  |        |         |
> + *   ||   Debug Queue   || 56 Bytes  |         |
> + *   ||     Header      ||  |        |         |
> + *   ||                 ||  |        |         |
> + *   ||=================||  V        V         |
> + *   ||=================||           ^         |
> + *   ||                 ||           |         |
> + *   ||     Command     ||         800 KB      |
> + *   ||      Queue      ||           |         |
> + *   ||                 ||           |         |
> + *   ||=================||           V         |
> + *   ||=================||           ^         |
> + *   ||                 ||           |         |
> + *   ||     Message     ||         800 KB      |
> + *   ||      Queue      ||           |         |
> + *   ||                 ||           |         |
> + *   ||=================||           V         |
> + *   ||=================||           ^         |
> + *   ||                 ||           |         |
> + *   ||      Debug      ||         800 KB      |
> + *   ||      Queue      ||           |         |
> + *   ||                 ||           |         |
> + *   ||=================||           V         |
> + *   ||                 ||                     |
> + *   ||=================||                     V
> + */
> +
> +/*
> + * Shared queues are used for communication between driver and firmware.
> + * There are 3 types of queues:
> + * Command queue - driver to write any command to firmware.
> + * Message queue - firmware to send any response to driver.
> + * Debug queue - firmware to write debug message.
> + */
> +
> +/* Host-firmware shared queue ids */
> +enum iris_iface_queue {
> +	IFACEQ_CMDQ_ID,
> +	IFACEQ_MSGQ_ID,
> +	IFACEQ_DBGQ_ID,
> +	IFACEQ_NUMQ, /* not an index */
> +};
> +
> +/**
> + * struct iris_hfi_queue_header
> + *
> + * @status: Queue status, qhdr_state define possible status
> + * @start_addr: Queue start address in non cached memory
> + * @type: qhdr_tx, qhdr_rx, qhdr_q_id and priority defines qhdr type
> + * @q_size: Queue size
> + *		Number of queue packets if pkt_size is non-zero
> + *		Queue size in bytes if pkt_size is zero
> + * @pkt_size: Size of queue packet entries
> + *		0x0: variable queue packet size
> + *		non zero: size of queue packet entry, fixed
> + * @pkt_drop_cnt: Number of packets dropped by sender
> + * @rx_wm: Receiver watermark, applicable in event driven mode
> + * @tx_wm: Sender watermark, applicable in event driven mode
> + * @rx_req: Receiver sets this bit if queue is empty
> + * @tx_req: Sender sets this bit if queue is full
> + * @rx_irq_status: Receiver sets this bit and triggers an interrupt to
> + *		the sender after packets are dequeued. Sender clears this bit
> + * @tx_irq_status: Sender sets this bit and triggers an interrupt to
> + *		the receiver after packets are queued. Receiver clears this bit
> + * @read_idx: Index till where receiver has consumed the packets from the queue.
> + * @write_idx: Index till where sender has written the packets into the queue.
> + */
> +struct iris_hfi_queue_header {
> +	u32 status;
> +	u32 start_addr;
> +	u16 queue_type;
> +	u16 header_type;
> +	u32 q_size;
> +	u32 pkt_size;
> +	u32 pkt_drop_cnt;
> +	u32 rx_wm;
> +	u32 tx_wm;
> +	u32 rx_req;
> +	u32 tx_req;
> +	u32 rx_irq_status;
> +	u32 tx_irq_status;
> +	u32 read_idx;
> +	u32 write_idx;
> +};
> +
> +/**
> + * struct iris_hfi_queue_table_header
> + *
> + * @version: Queue table version number
> + * @size: Queue table size from version to last parametr in qhdr entry
> + * @qhdr0_offset: Offset to the start of first qhdr
> + * @qhdr_size: Queue header size in bytes
> + * @num_q: Total number of queues in Queue table
> + * @num_active_q: Total number of active queues
> + * @device_addr: Device address of the queue
> + * @name: Queue name in characters
> + */
> +struct iris_hfi_queue_table_header {
> +	u32 version;
> +	u32 size;
> +	u32 qhdr0_offset;
> +	u32 qhdr_size;
> +	u32 num_q;
> +	u32 num_active_q;
> +	void *device_addr;
> +	char name[256]; /* NUL-terminated array of characters */
> +	struct iris_hfi_queue_header q_hdr[IFACEQ_NUMQ];
> +};
> +
> +struct iris_iface_q_info {
> +	struct iris_hfi_queue_header *qhdr;
> +	dma_addr_t	device_addr;
> +	void		*kernel_vaddr;
> +};
> +
> +int iris_hfi_queues_init(struct iris_core *core);
> +void iris_hfi_queues_deinit(struct iris_core *core);
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index b3a2903698ff..dac64ec4bf03 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -31,6 +31,7 @@ struct iris_platform_data {
>   	unsigned int clk_tbl_size;
>   	const char * const *clk_rst_tbl;
>   	unsigned int clk_rst_tbl_size;
> +	u64 dma_mask;
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index dba8d3c22ce5..9b305b8e2110 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -36,4 +36,5 @@ struct iris_platform_data sm8550_data = {
>   	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>   	.clk_tbl = sm8550_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.dma_mask = GENMASK(31, 29) - 1,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ce16d894c809..0d858c7b015f 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -168,15 +168,21 @@ static void iris_remove(struct platform_device *pdev)
>   	if (!core)
>   		return;
>   
> +	iris_core_deinit(core);
> +
>   	video_unregister_device(core->vdev_dec);
>   
>   	v4l2_device_unregister(&core->v4l2_dev);
> +
> +	mutex_destroy(&core->lock);
> +	core->state = IRIS_CORE_DEINIT;

This setting of the state is redundant, you've already set the state @ 
iris_core_deinit();

---
bod

