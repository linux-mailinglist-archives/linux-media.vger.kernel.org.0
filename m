Return-Path: <linux-media+bounces-42851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 137B1B8E79C
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 23:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BB5F3A6828
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 21:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F732459C9;
	Sun, 21 Sep 2025 21:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="oNqlfXSq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB68469D
	for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758491718; cv=none; b=BlWAU8YfIsdBQW7YO0VofyyehD5Xzuw0ckM3URG/sg1IEoozlwmm0UOrMjHoaIvAltZkPba1AZmJHPafgY/ORD4KQMYkCzHq17kMmp3Vc1cfr8zxDq7XmDjKWnVcEeVfOa+mbznTr3G/SjNLJF+t6B4KuyQmeDN/47EbHo9+df4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758491718; c=relaxed/simple;
	bh=EyJ8fj5TXKO1zqVagN84WNA41C9IXYk//Ed4+at5Y2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzXEwXAD8KWLKEp646niupfjly2E6+AGHsUwaPrf2UVeaAb98APgWGR0H28uR2YquXKcZs1JdOBpcdwKJI7WYqUg61UchcknnCEWITO4qaTfBroT1tPFTS84AK+J+dGqajcHZ+aenki1+/PI08RFy85/qLjNDCnLPPZU0aqkt6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=oNqlfXSq; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3324523dfb2so687743a91.0
        for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 14:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1758491715; x=1759096515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NxkrcWAffJWbd8Soo5cpMtJa/Bi74SM3cP6qn4Vqa4U=;
        b=oNqlfXSqMI2u7DP+EMhS7zzPSK4yTRB103MqfSbeRQxqHB7Ek4FhHB9HoceIInHhtN
         FIbvaDB0fAVC8Ze0YPMeW/tHx85ak+g0fmeVqiSjvAtmg0oL5EpPxW7ESSy8sdjrrjAu
         vWUDvnbiGz5HFSGhTMQaxS7/+kS9IQq+wWtSYJkiCStKJ4dwe7CZ/kbpVD5r2K/shBzg
         FZXCYmGslFkwxdeNBBrqo5Q8U605eX9x9n+t1eabyX5feJl1PwulhetYitguDWjqlYsS
         BObT/23DiXVrRN8KUGiz4wiZzC5kj5WgZ8UTLsd3fu1VtuuD8/TMsevE7J3nuNu9o0lT
         EsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758491715; x=1759096515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxkrcWAffJWbd8Soo5cpMtJa/Bi74SM3cP6qn4Vqa4U=;
        b=nxe+Br3p1c8erS7mrY4W13yOM6tuc5HEjtR1qjl0EglJeXyihBwp0nRk+aw4PKxy8D
         IjDAtByKzXb5VbgrhsC2qYBtBaZbW9Iquspus1ruzHKXArfE/B7FUokWnIzKLdj/pw1R
         zF6Aj34FFxAe74KEXQg6vXjWtiGx3rGXqg46jVFV+3yKyMmQBPz33bUGAUuiXOQsDWgN
         hnXy2zM4q1XAy2flqkdNUu0UEPedz77bDbkSZnMdNU25nMYU32Xii32fhBr9Mdma+CVn
         WVgr6VnM6jay0gbWIiZCtphWBCGvPrMZLy7Udx0X+WvNbmWte8Ku7slcq2OWc1pDmXGy
         FwGw==
X-Forwarded-Encrypted: i=1; AJvYcCVHDED9r3Jf5/MWHdUltojg1l0L98X3LQmiKC8Wrwf+9fs3Wrd9YiOwOe9w/cx1iH8mhjm1u5S9arxeHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMIUb4CHf3erK2N5GP0210nbh+dSSK3LIEInvPywqfR2GrHOxW
	a0cnGGcVV90E3eWMjzhJ7F6W3DjLiPf4z+PcpFI0SoL9iQmrznI8CBPriF7ACySuQ0Lc
X-Gm-Gg: ASbGncu/BCogWTcyRcqwVv0cx24JfvHMLDKofJ6mhYVY6mxATQqIsFdFPuwdQqBlWRA
	Rnoe0KAFs2HRrtursEUhhS0MfQ9wKE0p/Zph1zXamRiXNfwYDWfWgF1wHdL77hMXtuciSE83Z28
	Q9ZNuSa8IAyGsCt4rAM3f1i1v6NZAlpX6MKdAfnK0CfsZX7dfmlhsqBsYaYbt8NuK6v+yoHuT3s
	IQRwg6JmMT9gmfIIwcx6LWM5bpj1FM/Lk1kpgkz3RwIYRMUTCyopaeczXHRNucumk+zpsVVrlrw
	9WV5hODfM7knfpu8ltOMyN9EZKrVYjkyFhfbsrJDIaCI7GIlIRe2v8YR2+uQLbO0filhhyykyva
	bI8K1QPhwBXUjCa7nKcZwaSto
X-Google-Smtp-Source: AGHT+IE0yTWR0vQpmc/D49SYOlemm1eVU634PaQPDiEW6NBNM9CXpBBd35OxV7kZ76QLmaG/PZLlCA==
X-Received: by 2002:a17:90b:3d8f:b0:330:72fb:ac13 with SMTP id 98e67ed59e1d1-33097fd56c8mr12229416a91.5.1758491715124;
        Sun, 21 Sep 2025 14:55:15 -0700 (PDT)
Received: from sultan-box ([79.127.217.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5526a9af62sm6188556a12.44.2025.09.21.14.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 14:55:14 -0700 (PDT)
Date: Sun, 21 Sep 2025 14:55:11 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v4 3/7] media: platform: amd: Add isp4 fw and hw interface
Message-ID: <aNB0P18ytI1KopWI@sultan-box>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-4-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911100847.277408-4-Bin.Du@amd.com>

Hi Bin,

On Thu, Sep 11, 2025 at 06:08:43PM +0800, Bin Du wrote:
> ISP firmware controls ISP HW pipeline using dedicated embedded processor
> called ccpu. The communication between ISP FW and driver is using commands
> and response messages sent through the ring buffer. Command buffers support
> either global setting that is not specific to the steam and support stream
> specific parameters. Response buffers contain ISP FW notification
> information such as frame buffer done and command done. IRQ is used for
> receiving response buffer from ISP firmware, which is handled in the main
> isp4 media device. ISP ccpu is booted up through the firmware loading
> helper function prior to stream start. Memory used for command buffer and
> response buffer needs to be allocated from amdgpu buffer manager because
> isp4 is a child device of amdgpu.
> 
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>

[snip]

> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -4,3 +4,4 @@
>  
>  obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>  amd_capture-objs := isp4.o	\
> +			isp4_interface.o \

Align the objects with spaces and remove the trailing backslash.

I.e., change to:

amd_capture-objs := isp4_subdev.o \
		    isp4_interface.o

> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> @@ -0,0 +1,314 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_CMD_RESP_H_
> +#define _ISP4_CMD_RESP_H_
> +

[snip]

> +
> +#endif

Add /* _ISP4_CMD_RESP_H_ */

> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
> new file mode 100644
> index 000000000000..52dcca57ce2e
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_interface.c
> @@ -0,0 +1,955 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <drm/amd/isp.h>
> +#include <linux/iopoll.h>
> +#include <linux/mutex.h>

Remove this linux/mutex.h include, it should come from isp4_interface.h instead
since it is used for a mutex from a isp4_interface.h struct.

> +#include <linux/platform_device.h>
> +
> +#include "isp4_fw_cmd_resp.h"
> +#include "isp4_hw_reg.h"
> +#include "isp4_interface.h"
> +
> +#define ISP4IF_FW_RESP_RB_IRQ_EN_MASK \
> +	(ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK |  \
> +	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK | \
> +	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK | \
> +	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK)
> +
> +struct isp4if_rb_config {
> +	const char *name;
> +	u32 index;
> +	u32 reg_rptr;
> +	u32 reg_wptr;
> +	u32 reg_base_lo;
> +	u32 reg_base_hi;
> +	u32 reg_size;
> +	u32 val_size;
> +	u64 base_mc_addr;
> +	void *base_sys_addr;
> +};
> +
> +/* FW cmd ring buffer configuration */
> +static struct isp4if_rb_config
> +	isp4if_cmd_rb_config[ISP4IF_STREAM_ID_MAX] = {
> +	{
> +		.name = "CMD_RB_GBL0",
> +		.index = 3,
> +		.reg_rptr = ISP_RB_RPTR4,
> +		.reg_wptr = ISP_RB_WPTR4,
> +		.reg_base_lo = ISP_RB_BASE_LO4,
> +		.reg_base_hi = ISP_RB_BASE_HI4,
> +		.reg_size = ISP_RB_SIZE4,
> +	},
> +	{
> +		.name = "CMD_RB_STR1",
> +		.index = 0,
> +		.reg_rptr = ISP_RB_RPTR1,
> +		.reg_wptr = ISP_RB_WPTR1,
> +		.reg_base_lo = ISP_RB_BASE_LO1,
> +		.reg_base_hi = ISP_RB_BASE_HI1,
> +		.reg_size = ISP_RB_SIZE1,
> +	},
> +	{
> +		.name = "CMD_RB_STR2",
> +		.index = 1,
> +		.reg_rptr = ISP_RB_RPTR2,
> +		.reg_wptr = ISP_RB_WPTR2,
> +		.reg_base_lo = ISP_RB_BASE_LO2,
> +		.reg_base_hi = ISP_RB_BASE_HI2,
> +		.reg_size = ISP_RB_SIZE2,
> +	},
> +	{
> +		.name = "CMD_RB_STR3",
> +		.index = 2,
> +		.reg_rptr = ISP_RB_RPTR3,
> +		.reg_wptr = ISP_RB_WPTR3,
> +		.reg_base_lo = ISP_RB_BASE_LO3,
> +		.reg_base_hi = ISP_RB_BASE_HI3,
> +		.reg_size = ISP_RB_SIZE3,
> +	},
> +};
> +
> +/* FW resp ring buffer configuration */
> +static struct isp4if_rb_config
> +	isp4if_resp_rb_config[ISP4IF_STREAM_ID_MAX] = {
> +	{
> +		.name = "RES_RB_GBL0",
> +		.index = 3,
> +		.reg_rptr = ISP_RB_RPTR12,
> +		.reg_wptr = ISP_RB_WPTR12,
> +		.reg_base_lo = ISP_RB_BASE_LO12,
> +		.reg_base_hi = ISP_RB_BASE_HI12,
> +		.reg_size = ISP_RB_SIZE12,
> +	},
> +	{
> +		.name = "RES_RB_STR1",
> +		.index = 0,
> +		.reg_rptr = ISP_RB_RPTR9,
> +		.reg_wptr = ISP_RB_WPTR9,
> +		.reg_base_lo = ISP_RB_BASE_LO9,
> +		.reg_base_hi = ISP_RB_BASE_HI9,
> +		.reg_size = ISP_RB_SIZE9,
> +	},
> +	{
> +		.name = "RES_RB_STR2",
> +		.index = 1,
> +		.reg_rptr = ISP_RB_RPTR10,
> +		.reg_wptr = ISP_RB_WPTR10,
> +		.reg_base_lo = ISP_RB_BASE_LO10,
> +		.reg_base_hi = ISP_RB_BASE_HI10,
> +		.reg_size = ISP_RB_SIZE10,
> +	},
> +	{
> +		.name = "RES_RB_STR3",
> +		.index = 2,
> +		.reg_rptr = ISP_RB_RPTR11,
> +		.reg_wptr = ISP_RB_WPTR11,
> +		.reg_base_lo = ISP_RB_BASE_LO11,
> +		.reg_base_hi = ISP_RB_BASE_HI11,
> +		.reg_size = ISP_RB_SIZE11,
> +	},
> +};
> +
> +/* FW log ring buffer configuration */
> +static struct isp4if_rb_config isp4if_log_rb_config = {
> +	.name = "LOG_RB",
> +	.index = 0,
> +	.reg_rptr = ISP_LOG_RB_RPTR0,
> +	.reg_wptr = ISP_LOG_RB_WPTR0,
> +	.reg_base_lo = ISP_LOG_RB_BASE_LO0,
> +	.reg_base_hi = ISP_LOG_RB_BASE_HI0,
> +	.reg_size = ISP_LOG_RB_SIZE0,
> +};
> +
> +static struct isp4if_gpu_mem_info *isp4if_gpu_mem_alloc(struct isp4_interface *ispif, u32 mem_size)
> +{
> +	struct isp4if_gpu_mem_info *mem_info;
> +	struct device *dev = ispif->dev;
> +	int ret;
> +
> +	if (!mem_size)
> +		return NULL;

mem_size is never zero, remove this check.

> +
> +	mem_info = kzalloc(sizeof(*mem_info), GFP_KERNEL);

No need for kzalloc, use kmalloc here instead.

> +	if (!mem_info)
> +		return NULL;
> +
> +	mem_info->mem_size = mem_size;

mem_info->mem_size is not used anywhere, remove it.

> +	ret = isp_kernel_buffer_alloc(dev, mem_info->mem_size, &mem_info->mem_handle,
> +				      &mem_info->gpu_mc_addr, &mem_info->sys_addr);
> +	if (ret) {
> +		kfree(mem_info);
> +		return NULL;
> +	}
> +
> +	return mem_info;
> +}

[snip]

> +static int isp4if_gpu_mem_free(struct isp4_interface *ispif, struct isp4if_gpu_mem_info *mem_info)
> +{
> +	struct device *dev = ispif->dev;
> +
> +	if (!mem_info) {
> +		dev_err(dev, "invalid mem_info\n");
> +		return -EINVAL;
> +	}
> +
> +	isp_kernel_buffer_free(&mem_info->mem_handle, &mem_info->gpu_mc_addr, &mem_info->sys_addr);
> +
> +	kfree(mem_info);
> +
> +	return 0;
> +}
> +
> +static int isp4if_dealloc_fw_gpumem(struct isp4_interface *ispif)
> +{
> +	int i;
> +
> +	if (ispif->fw_mem_pool) {
> +		isp4if_gpu_mem_free(ispif, ispif->fw_mem_pool);
> +		ispif->fw_mem_pool = NULL;
> +	}
> +
> +	if (ispif->fw_cmd_resp_buf) {
> +		isp4if_gpu_mem_free(ispif, ispif->fw_cmd_resp_buf);
> +		ispif->fw_cmd_resp_buf = NULL;
> +	}
> +
> +	if (ispif->fw_log_buf) {
> +		isp4if_gpu_mem_free(ispif, ispif->fw_log_buf);
> +		ispif->fw_log_buf = NULL;
> +	}
> +
> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
> +		if (ispif->metainfo_buf_pool[i]) {
> +			isp4if_gpu_mem_free(ispif, ispif->metainfo_buf_pool[i]);
> +			ispif->metainfo_buf_pool[i] = NULL;
> +		}
> +	}
> +
> +	return 0;
> +}

isp4if_gpu_mem_free() and isp4if_dealloc_fw_gpumem() can be simplified and made
more robust against copy+paste errors, and their return values are not used
anywhere. Plus, the mem_info argument to isp4if_gpu_mem_free() is never NULL, so
there is redundant NULL pointer checking.

Change to the following:

static void isp4if_gpu_mem_free(struct isp4if_gpu_mem_info **mem_info_ptr)
{
	struct isp4if_gpu_mem_info *mem_info = *mem_info_ptr;

	if (!mem_info)
		return;

	*mem_info_ptr = NULL;
	isp_kernel_buffer_free(&mem_info->mem_handle, &mem_info->gpu_mc_addr,
			       &mem_info->sys_addr);
	kfree(mem_info);
}

static void isp4if_dealloc_fw_gpumem(struct isp4_interface *ispif)
{
	int i;

	isp4if_gpu_mem_free(&ispif->fw_mem_pool);
	isp4if_gpu_mem_free(&ispif->fw_cmd_resp_buf);
	isp4if_gpu_mem_free(&ispif->fw_log_buf);

	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++)
		isp4if_gpu_mem_free(&ispif->metainfo_buf_pool[i]);
}

> +static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
> +{
> +	struct device *dev = ispif->dev;
> +	unsigned int i;

`i` doesn't need to be unsigned. Remove unsigned to make it consistent with
other ISP4IF_MAX_STREAM_BUF_COUNT loops.

> +
> +	ispif->fw_mem_pool = isp4if_gpu_mem_alloc(ispif, FW_MEMORY_POOL_SIZE);
> +	if (!ispif->fw_mem_pool)
> +		goto error_no_memory;
> +
> +	ispif->fw_cmd_resp_buf =
> +		isp4if_gpu_mem_alloc(ispif, ISP4IF_RB_PMBMAP_MEM_SIZE);
> +	if (!ispif->fw_cmd_resp_buf)
> +		goto error_no_memory;
> +
> +	ispif->fw_log_buf =
> +		isp4if_gpu_mem_alloc(ispif, ISP4IF_FW_LOG_RINGBUF_SIZE);
> +	if (!ispif->fw_log_buf)
> +		goto error_no_memory;
> +
> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
> +		ispif->metainfo_buf_pool[i] =
> +			isp4if_gpu_mem_alloc(ispif,
> +					     ISP4IF_META_INFO_BUF_SIZE);
> +		if (!ispif->metainfo_buf_pool[i])
> +			goto error_no_memory;
> +	}
> +
> +	return 0;
> +
> +error_no_memory:
> +	dev_err(dev, "failed to allocate gpu memory\n");
> +	return -ENOMEM;
> +}
> +
> +static u32 isp4if_compute_check_sum(u8 *buf, u32 buf_size)

Change `u8 *buf` to `const u8 *buf`.

Change `u32 buf_size` to `size_t buf_size` just to be consistent with buf_size
coming from sizeof().

> +{
> +	u32 checksum = 0;
> +	u8 *surplus_ptr;
> +	u32 *buffer;
> +	u32 i;

Change the 3 variables above to:

	const u8 *surplus_ptr;
	const u32 *buffer;
	size_t i;

> +
> +	buffer = (u32 *)buf;

Change cast to `(const u32 *)`

> +	for (i = 0; i < buf_size / sizeof(u32); i++)
> +		checksum += buffer[i];
> +
> +	surplus_ptr = (u8 *)&buffer[i];

Change cast to `(const u32 *)`

> +	/* add surplus data crc checksum */
> +	for (i = 0; i < buf_size % sizeof(u32); i++)
> +		checksum += surplus_ptr[i];
> +
> +	return checksum;
> +}
> +
> +void isp4if_clear_cmdq(struct isp4_interface *ispif)
> +{
> +	struct isp4if_cmd_element *buf_node = NULL;
> +	struct isp4if_cmd_element *tmp_node = NULL;

Remove unnecessary initialization of buf_node and tmp_node.

> +
> +	guard(mutex)(&ispif->cmdq_mutex);
> +
> +	list_for_each_entry_safe(buf_node, tmp_node, &ispif->cmdq, list) {
> +		list_del(&buf_node->list);
> +		kfree(buf_node);
> +	}

Move the whole list to a local LIST_HEAD(free_list) variable and then release
the lock. Then you can list_for_each_entry_safe() without needing to do a
list_del() every time, and you won't need to hold the lock the whole time.

> +}

[snip]

> +static struct isp4if_cmd_element *isp4if_append_cmd_2_cmdq(struct isp4_interface *ispif,
> +							   struct isp4if_cmd_element *cmd_ele)
> +{
> +	struct isp4if_cmd_element *copy_command = NULL;

Remove unnecessary initialization of copy_command.

> +
> +	copy_command = kmemdup(cmd_ele, sizeof(*cmd_ele), GFP_KERNEL);
> +	if (!copy_command)
> +		return NULL;
> +
> +	guard(mutex)(&ispif->cmdq_mutex);
> +
> +	list_add_tail(&copy_command->list, &ispif->cmdq);
> +
> +	return copy_command;
> +}
> +
> +struct isp4if_cmd_element *isp4if_rm_cmd_from_cmdq(struct isp4_interface *ispif, u32 seq_num,
> +						   u32 cmd_id)
> +{
> +	struct isp4if_cmd_element *buf_node = NULL;
> +	struct isp4if_cmd_element *tmp_node = NULL;

Remove unnecessary initialization of buf_node and tmp_node.

> +
> +	guard(mutex)(&ispif->cmdq_mutex);
> +
> +	list_for_each_entry_safe(buf_node, tmp_node, &ispif->cmdq, list) {
> +		if (buf_node->seq_num == seq_num &&
> +		    buf_node->cmd_id == cmd_id) {
> +			list_del(&buf_node->list);
> +			return buf_node;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif, enum isp4if_stream_id stream,
> +				    struct isp4fw_cmd *cmd)
> +{
> +	struct isp4if_rb_config *rb_config;
> +	struct device *dev = ispif->dev;
> +	u8 *mem_sys;
> +	u32 wr_ptr;
> +	u32 rd_ptr;
> +	u32 rreg;
> +	u32 wreg;
> +	u32 len;
> +
> +	rb_config = &isp4if_cmd_rb_config[stream];
> +	rreg = rb_config->reg_rptr;
> +	wreg = rb_config->reg_wptr;
> +	mem_sys = (u8 *)rb_config->base_sys_addr;
> +	len = rb_config->val_size;
> +
> +	if (isp4if_is_cmdq_rb_full(ispif, stream)) {
> +		dev_err(dev, "fail no cmdslot (%d)\n", stream);
> +		return -EINVAL;
> +	}
> +
> +	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
> +	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
> +
> +	if (rd_ptr > len) {
> +		dev_err(dev, "fail (%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
> +			stream, rd_ptr, len, wr_ptr);
> +		return -EINVAL;
> +	}
> +
> +	if (wr_ptr > len) {
> +		dev_err(dev, "fail (%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
> +			stream, wr_ptr, len, rd_ptr);
> +		return -EINVAL;
> +	}
> +
> +	if (wr_ptr < rd_ptr) {
> +		memcpy((mem_sys + wr_ptr),
> +		       (u8 *)cmd, sizeof(struct isp4fw_cmd));
> +	} else {
> +		if ((len - wr_ptr) >= (sizeof(struct isp4fw_cmd))) {
> +			memcpy((mem_sys + wr_ptr),
> +			       (u8 *)cmd, sizeof(struct isp4fw_cmd));
> +		} else {
> +			u32 size;
> +			u8 *src;
> +
> +			src = (u8 *)cmd;
> +			size = len - wr_ptr;
> +
> +			memcpy((mem_sys + wr_ptr), src, size);
> +
> +			src += size;
> +			size = sizeof(struct isp4fw_cmd) - size;
> +			memcpy((mem_sys), src, size);
> +		}
> +	}
> +
> +	wr_ptr += sizeof(struct isp4fw_cmd);
> +	if (wr_ptr >= len)
> +		wr_ptr -= len;
> +
> +	isp4hw_wreg(ispif->mmio, wreg, wr_ptr);
> +
> +	return 0;
> +}
> +
> +static inline enum isp4if_stream_id isp4if_get_fw_stream(u32 cmd_id)
> +{
> +	return ISP4IF_STREAM_ID_1;
> +}
> +
> +static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *package,
> +			      u32 package_size, wait_queue_head_t *wq, u32 *wq_cond, u32 *seq)
> +{
> +	enum isp4if_stream_id stream = isp4if_get_fw_stream(cmd_id);
> +	struct isp4if_cmd_element command_element = {};

Remove command_element per comments further down.

> +	struct isp4if_gpu_mem_info *gpu_mem = NULL;

gpu_mem is never changed from NULL, remove this variable.

> +	struct isp4if_cmd_element *cmd_ele = NULL;
> +	struct isp4if_rb_config *rb_config;
> +	struct device *dev = ispif->dev;
> +	struct isp4fw_cmd cmd = {};

Use memset() to guarantee padding bits of cmd are zeroed, since this may not
guarantee it on all compilers.

> +	u64 package_base = 0;
> +	u32 seq_num;
> +	u32 rreg;
> +	u32 wreg;
> +	int ret;
> +
> +	if (package_size > sizeof(cmd.cmd_param)) {
> +		dev_err(dev, "fail pkgsize(%u)>%zu cmd:0x%x,stream %d\n",
> +			package_size, sizeof(cmd.cmd_param), cmd_id, stream);
> +		return -EINVAL;
> +	}
> +
> +	rb_config = &isp4if_resp_rb_config[stream];
> +	rreg = rb_config->reg_rptr;
> +	wreg = rb_config->reg_wptr;
> +
> +	guard(mutex)(&ispif->isp4if_mutex);
> +
> +	ret = read_poll_timeout(isp4if_is_cmdq_rb_full, ret, !ret, ISP4IF_MAX_SLEEP_TIME * 1000,
> +				ISP4IF_MAX_SLEEP_COUNT * ISP4IF_MAX_SLEEP_TIME * 1000, false,
> +				ispif, stream);
> +
> +	if (ret) {
> +		u32 rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
> +		u32 wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
> +
> +		dev_err(dev,
> +			"failed to get free cmdq slot, stream (%d),rd %u, wr %u\n",
> +			stream, rd_ptr, wr_ptr);
> +		return -ETIMEDOUT;
> +	}
> +
> +	cmd.cmd_id = cmd_id;
> +	switch (stream) {
> +	case ISP4IF_STREAM_ID_GLOBAL:
> +		cmd.cmd_stream_id = STREAM_ID_INVALID;
> +		break;
> +	case ISP4IF_STREAM_ID_1:
> +		cmd.cmd_stream_id = STREAM_ID_1;
> +		break;
> +	default:
> +		dev_err(dev, "fail bad stream id %d\n", stream);
> +		return -EINVAL;
> +	}
> +
> +	if (package && package_size)
> +		memcpy(cmd.cmd_param, package, package_size);
> +
> +	seq_num = ispif->host2fw_seq_num++;
> +	cmd.cmd_seq_num = seq_num;
> +	cmd.cmd_check_sum =
> +		isp4if_compute_check_sum((u8 *)&cmd, sizeof(cmd) - 4);

Change `- 4` to `- sizeof(u32)`

> +
> +	if (seq)
> +		*seq = seq_num;
> +	command_element.seq_num = seq_num;
> +	command_element.cmd_id = cmd_id;
> +	command_element.mc_addr = package_base;
> +	command_element.wq = wq;
> +	command_element.wq_cond = wq_cond;
> +	command_element.gpu_pkg = gpu_mem;
> +	command_element.stream = stream;
> +	/*
> +	 * only append the fw cmd to queue when its response needs to be waited for,
> +	 * currently there are only two such commands, disable channel and stop stream
> +	 * which are only sent after close camera
> +	 */
> +	if (wq && wq_cond) {
> +		cmd_ele = isp4if_append_cmd_2_cmdq(ispif, &command_element);
> +		if (!cmd_ele) {
> +			dev_err(dev, "fail for isp_append_cmd_2_cmdq\n");
> +			return -ENOMEM;
> +		}
> +	}

The kmemdup() is unnecessary. Remove the isp4if_append_cmd_2_cmdq() function and
change this to:

	if (wq && wq_cond) {
		cmd_ele = kmalloc(sizeof(*cmd_ele), GFP_KERNEL);
		if (!cmd_ele) {
			dev_err(dev, "fail for allocating cmd_ele\n");
			return -ENOMEM;
		}

		cmd_ele->seq_num = seq_num;
		cmd_ele->cmd_id = cmd_id;
		cmd_ele->wq = wq;
		cmd_ele->wq_cond = wq_cond;

		guard(mutex)(&ispif->cmdq_mutex);
		list_add_tail(&copy_command->list, &ispif->cmdq);
	}

> +
> +	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
> +	if (ret) {
> +		dev_err(dev, "fail for insert_isp_fw_cmd camId (0x%08x)\n", cmd_id);
> +		if (cmd_ele) {
> +			isp4if_rm_cmd_from_cmdq(ispif, cmd_ele->seq_num, cmd_ele->cmd_id);

Using isp4if_rm_cmd_from_cmdq() sort of implies that there is a risk that
cmd_ele may have been removed from the list somehow, even though the fw cmd
insertion failed? In any case, either make it truly safe by assuming that it's
unsafe to dereference cmd_ele right now, or just delete cmd_ele directly from
the list under the lock.

> +			kfree(cmd_ele);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int isp4if_send_buffer(struct isp4_interface *ispif, struct isp4if_img_buf_info *buf_info)
> +{
> +	struct isp4fw_cmd_send_buffer cmd = {};

Use memset() to guarantee padding bits are zeroed, since this may not guarantee
it on all compilers.

> +
> +	cmd.buffer_type = BUFFER_TYPE_PREVIEW;
> +	cmd.buffer.vmid_space.bit.vmid = 0;
> +	cmd.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> +	isp4if_split_addr64(buf_info->planes[0].mc_addr,
> +			    &cmd.buffer.buf_base_a_lo,
> +			    &cmd.buffer.buf_base_a_hi);
> +	cmd.buffer.buf_size_a = buf_info->planes[0].len;
> +
> +	isp4if_split_addr64(buf_info->planes[1].mc_addr,
> +			    &cmd.buffer.buf_base_b_lo,
> +			    &cmd.buffer.buf_base_b_hi);
> +	cmd.buffer.buf_size_b = buf_info->planes[1].len;
> +
> +	isp4if_split_addr64(buf_info->planes[2].mc_addr,
> +			    &cmd.buffer.buf_base_c_lo,
> +			    &cmd.buffer.buf_base_c_hi);
> +	cmd.buffer.buf_size_c = buf_info->planes[2].len;
> +
> +	return isp4if_send_fw_cmd(ispif, CMD_ID_SEND_BUFFER, &cmd,
> +				  sizeof(cmd), NULL, NULL, NULL);
> +}
> +
> +static void isp4if_init_rb_config(struct isp4_interface *ispif, struct isp4if_rb_config *rb_config)
> +{
> +	u32 lo;
> +	u32 hi;
> +
> +	isp4if_split_addr64(rb_config->base_mc_addr, &lo, &hi);
> +
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +		    rb_config->reg_rptr, 0x0);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +		    rb_config->reg_wptr, 0x0);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +		    rb_config->reg_base_lo, lo);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +		    rb_config->reg_base_hi, hi);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +		    rb_config->reg_size, rb_config->val_size);
> +}
> +
> +static int isp4if_fw_init(struct isp4_interface *ispif)
> +{
> +	struct isp4if_rb_config *rb_config;
> +	u32 offset;
> +	int i;
> +
> +	/* initialize CMD_RB streams */
> +	for (i = 0; i < ISP4IF_STREAM_ID_MAX; i++) {
> +		rb_config = (isp4if_cmd_rb_config + i);
> +		offset = ispif->aligned_rb_chunk_size *
> +			 (rb_config->index + ispif->cmd_rb_base_index);
> +
> +		rb_config->val_size = ISP4IF_FW_CMD_BUF_SIZE;
> +		rb_config->base_sys_addr =
> +			(u8 *)ispif->fw_cmd_resp_buf->sys_addr + offset;
> +		rb_config->base_mc_addr =
> +			ispif->fw_cmd_resp_buf->gpu_mc_addr + offset;
> +
> +		isp4if_init_rb_config(ispif, rb_config);
> +	}
> +
> +	/* initialize RESP_RB streams */
> +	for (i = 0; i < ISP4IF_STREAM_ID_MAX; i++) {
> +		rb_config = (isp4if_resp_rb_config + i);
> +		offset = ispif->aligned_rb_chunk_size *
> +			 (rb_config->index + ispif->resp_rb_base_index);
> +
> +		rb_config->val_size = ISP4IF_FW_CMD_BUF_SIZE;
> +		rb_config->base_sys_addr =
> +			(u8 *)ispif->fw_cmd_resp_buf->sys_addr + offset;
> +		rb_config->base_mc_addr =
> +			ispif->fw_cmd_resp_buf->gpu_mc_addr + offset;
> +
> +		isp4if_init_rb_config(ispif, rb_config);
> +	}
> +
> +	/* initialize LOG_RB stream */
> +	rb_config = &isp4if_log_rb_config;
> +	rb_config->val_size = ISP4IF_FW_LOG_RINGBUF_SIZE;
> +	rb_config->base_mc_addr = ispif->fw_log_buf->gpu_mc_addr;
> +	rb_config->base_sys_addr = ispif->fw_log_buf->sys_addr;
> +
> +	isp4if_init_rb_config(ispif, rb_config);
> +
> +	return 0;
> +}
> +
> +static int isp4if_wait_fw_ready(struct isp4_interface *ispif, u32 isp_status_addr)
> +{
> +	struct device *dev = ispif->dev;
> +	u32 timeout_ms = 100;
> +	u32 interval_ms = 1;
> +	u32 reg_val;
> +
> +	/* wait for FW initialize done! */
> +	if (!read_poll_timeout(isp4hw_rreg, reg_val, reg_val & ISP_STATUS__CCPU_REPORT_MASK,
> +			       interval_ms * 1000, timeout_ms * 1000, false,
> +			       GET_ISP4IF_REG_BASE(ispif), isp_status_addr))
> +		return 0;
> +
> +	dev_err(dev, "ISP CCPU FW boot failed\n");
> +
> +	return -ETIME;
> +}
> +
> +static void isp4if_enable_ccpu(struct isp4_interface *ispif)
> +{
> +	u32 reg_val;
> +
> +	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET);
> +	reg_val &= (~ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET, reg_val);
> +
> +	usleep_range(100, 150);
> +
> +	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL);
> +	reg_val &= (~ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK);
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL, reg_val);
> +}
> +
> +static void isp4if_disable_ccpu(struct isp4_interface *ispif)
> +{
> +	u32 reg_val;
> +
> +	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL);
> +	reg_val |= ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK;
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL, reg_val);
> +
> +	usleep_range(100, 150);
> +
> +	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET);
> +	reg_val |= ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK;
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET, reg_val);
> +}
> +
> +static int isp4if_fw_boot(struct isp4_interface *ispif)
> +{
> +	struct device *dev = ispif->dev;
> +
> +	if (ispif->status != ISP4IF_STATUS_PWR_ON) {
> +		dev_err(dev, "invalid isp power status %d\n", ispif->status);
> +		return -EINVAL;
> +	}
> +
> +	isp4if_disable_ccpu(ispif);
> +
> +	isp4if_fw_init(ispif);
> +
> +	/* clear ccpu status */
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_STATUS, 0x0);
> +
> +	isp4if_enable_ccpu(ispif);
> +
> +	if (isp4if_wait_fw_ready(ispif, ISP_STATUS)) {
> +		isp4if_disable_ccpu(ispif);
> +		return -EINVAL;
> +	}
> +
> +	/* enable interrupts */
> +	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SYS_INT0_EN,
> +		    ISP4IF_FW_RESP_RB_IRQ_EN_MASK);
> +
> +	ispif->status = ISP4IF_STATUS_FW_RUNNING;
> +
> +	dev_dbg(dev, "ISP CCPU FW boot success\n");
> +
> +	return 0;
> +}
> +
> +int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream, void *resp)
> +{
> +	struct isp4fw_resp *response = resp;
> +	struct isp4if_rb_config *rb_config;
> +	struct device *dev = ispif->dev;
> +	u32 rd_ptr_dbg;
> +	u32 wr_ptr_dbg;
> +	void *mem_sys;
> +	u64 mem_addr;
> +	u32 checksum;
> +	u32 rd_ptr;
> +	u32 wr_ptr;
> +	u32 rreg;
> +	u32 wreg;
> +	u32 len;
> +
> +	rb_config = &isp4if_resp_rb_config[stream];
> +	rreg = rb_config->reg_rptr;
> +	wreg = rb_config->reg_wptr;
> +	mem_sys = rb_config->base_sys_addr;
> +	mem_addr = rb_config->base_mc_addr;
> +	len = rb_config->val_size;
> +
> +	rd_ptr = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), rreg);
> +	wr_ptr = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), wreg);
> +	rd_ptr_dbg = rd_ptr;
> +	wr_ptr_dbg = wr_ptr;
> +
> +	if (rd_ptr > len) {
> +		dev_err(dev, "fail (%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
> +			stream, rd_ptr, len, wr_ptr);
> +		return -EINVAL;
> +	}
> +
> +	if (wr_ptr > len) {
> +		dev_err(dev, "fail (%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
> +			stream, wr_ptr, len, rd_ptr);
> +		return -EINVAL;
> +	}
> +
> +	if (rd_ptr < wr_ptr) {
> +		if ((wr_ptr - rd_ptr) >= (sizeof(struct isp4fw_resp))) {
> +			memcpy((u8 *)response, (u8 *)mem_sys + rd_ptr,
> +			       sizeof(struct isp4fw_resp));
> +
> +			rd_ptr += sizeof(struct isp4fw_resp);
> +			if (rd_ptr < len) {
> +				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +					    rreg, rd_ptr);
> +			} else {
> +				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
> +					stream, rd_ptr, len, wr_ptr);
> +				return -EINVAL;
> +			}
> +
> +		} else {
> +			dev_err(dev, "sth wrong with wptr and rptr\n");
> +			return -EINVAL;
> +		}
> +	} else if (rd_ptr > wr_ptr) {
> +		u32 size;
> +		u8 *dst;
> +
> +		dst = (u8 *)response;
> +
> +		size = len - rd_ptr;
> +		if (size > sizeof(struct isp4fw_resp)) {
> +			mem_addr += rd_ptr;
> +			memcpy((u8 *)response,
> +			       (u8 *)(mem_sys) + rd_ptr,
> +			       sizeof(struct isp4fw_resp));
> +			rd_ptr += sizeof(struct isp4fw_resp);
> +			if (rd_ptr < len) {
> +				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +					    rreg, rd_ptr);
> +			} else {
> +				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
> +					stream, rd_ptr, len, wr_ptr);
> +				return -EINVAL;
> +			}
> +
> +		} else {
> +			if ((size + wr_ptr) < (sizeof(struct isp4fw_resp))) {
> +				dev_err(dev, "sth wrong with wptr and rptr1\n");
> +				return -EINVAL;
> +			}
> +
> +			memcpy(dst, (u8 *)(mem_sys) + rd_ptr, size);
> +
> +			dst += size;
> +			size = sizeof(struct isp4fw_resp) - size;
> +			if (size)
> +				memcpy(dst, (u8 *)(mem_sys), size);
> +			rd_ptr = size;
> +			if (rd_ptr < len) {
> +				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
> +					    rreg, rd_ptr);
> +			} else {
> +				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
> +					stream, rd_ptr, len, wr_ptr);
> +				return -EINVAL;
> +			}
> +		}
> +	} else {
> +		return -ETIME;
> +	}
> +
> +	checksum = isp4if_compute_check_sum((u8 *)response, sizeof(struct isp4fw_resp) - 4);

Change `- 4` to `- sizeof(u32)`

> +
> +	if (checksum != response->resp_check_sum) {
> +		dev_err(dev, "resp checksum 0x%x,should 0x%x,rptr %u,wptr %u\n",
> +			checksum, response->resp_check_sum, rd_ptr_dbg, wr_ptr_dbg);
> +
> +		dev_err(dev, "(%u), seqNo %u, resp_id (0x%x)\n", stream,
> +			response->resp_seq_num,
> +			response->resp_id);
> +
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int isp4if_send_command(struct isp4_interface *ispif, u32 cmd_id, void *package, u32 package_size)
> +{
> +	return isp4if_send_fw_cmd(ispif, cmd_id, package, package_size, NULL, NULL, NULL);
> +}
> +
> +int isp4if_send_command_sync(struct isp4_interface *ispif, u32 cmd_id, void *package,
> +			     u32 package_size, u32 timeout)
> +{
> +	struct device *dev = ispif->dev;
> +	DECLARE_WAIT_QUEUE_HEAD(cmd_wq);
> +	u32 wq_cond = 0;
> +	int ret;
> +	u32 seq;
> +
> +	ret = isp4if_send_fw_cmd(ispif, cmd_id, package, package_size, &cmd_wq, &wq_cond, &seq);
> +
> +	if (ret) {
> +		dev_err(dev, "send fw cmd fail %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = wait_event_timeout(cmd_wq, wq_cond != 0, msecs_to_jiffies(timeout));

Instead of wq and wq_cond, use a `struct completion`.

> +	if (ret == 0) {
> +		struct isp4if_cmd_element *ele;
> +
> +		ele = isp4if_rm_cmd_from_cmdq(ispif, seq, cmd_id);
> +		kfree(ele);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +void isp4if_clear_bufq(struct isp4_interface *ispif)
> +{
> +	struct isp4if_img_buf_node *buf_node = NULL;
> +	struct isp4if_img_buf_node *tmp_node = NULL;

Remove unnecessary initialization of buf_node and tmp_node.

> +
> +	guard(mutex)(&ispif->bufq_mutex);
> +
> +	list_for_each_entry_safe(buf_node, tmp_node, &ispif->bufq, node) {
> +		list_del(&buf_node->node);
> +		kfree(buf_node);
> +	}

Move the whole list to a local LIST_HEAD(free_list) variable and then release
the lock. Then you can list_for_each_entry_safe() without needing to do a
list_del() every time, and you won't need to hold the lock the whole time.

> +}
> +
> +void isp4if_dealloc_buffer_node(struct isp4if_img_buf_node *buf_node)
> +{
> +	kfree(buf_node);
> +}
> +
> +struct isp4if_img_buf_node *isp4if_alloc_buffer_node(struct isp4if_img_buf_info *buf_info)
> +{
> +	struct isp4if_img_buf_node *node = NULL;
> +
> +	node = kmalloc(sizeof(*node), GFP_KERNEL);
> +	if (node)
> +		node->buf_info = *buf_info;
> +
> +	return node;
> +};

Remove superfluous ; after the }.

> +
> +struct isp4if_img_buf_node *isp4if_dequeue_buffer(struct isp4_interface *ispif)
> +{
> +	struct isp4if_img_buf_node *buf_node = NULL;

Remove the unnecessary initialization of buf_node.

> +
> +	guard(mutex)(&ispif->bufq_mutex);
> +
> +	buf_node = list_first_entry_or_null(&ispif->bufq, typeof(*buf_node), node);
> +	if (buf_node)
> +		list_del(&buf_node->node);
> +
> +	return buf_node;
> +}
> +
> +int isp4if_queue_buffer(struct isp4_interface *ispif, struct isp4if_img_buf_node *buf_node)
> +{
> +	int ret;
> +
> +	ret = isp4if_send_buffer(ispif, &buf_node->buf_info);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&ispif->bufq_mutex);
> +
> +	list_add_tail(&buf_node->node, &ispif->bufq);
> +
> +	return 0;
> +}
> +
> +int isp4if_stop(struct isp4_interface *ispif)
> +{
> +	isp4if_disable_ccpu(ispif);
> +
> +	isp4if_dealloc_fw_gpumem(ispif);
> +
> +	return 0;
> +}
> +
> +int isp4if_start(struct isp4_interface *ispif)
> +{
> +	int ret;
> +
> +	ret = isp4if_alloc_fw_gpumem(ispif);
> +	if (ret)
> +		return -ENOMEM;

Return ret instead of -ENOMEM, since isp4if_alloc_fw_gpumem() returns -ENOMEM.

> +
> +	ret = isp4if_fw_boot(ispif);
> +	if (ret)
> +		goto failed_fw_boot;
> +
> +	return 0;
> +
> +failed_fw_boot:
> +	isp4if_dealloc_fw_gpumem(ispif);
> +	return ret;
> +}
> +
> +int isp4if_deinit(struct isp4_interface *ispif)
> +{
> +	isp4if_clear_cmdq(ispif);
> +
> +	isp4if_clear_bufq(ispif);
> +
> +	mutex_destroy(&ispif->cmdq_mutex);
> +	mutex_destroy(&ispif->bufq_mutex);
> +	mutex_destroy(&ispif->isp4if_mutex);
> +
> +	return 0;
> +}
> +
> +int isp4if_init(struct isp4_interface *ispif, struct device *dev, void __iomem *isp_mmip)
> +{
> +	ispif->dev = dev;
> +	ispif->mmio = isp_mmip;
> +
> +	ispif->cmd_rb_base_index = 0;
> +	ispif->resp_rb_base_index = ISP4IF_RESP_CHAN_TO_RB_OFFSET - 1;
> +	ispif->aligned_rb_chunk_size = ISP4IF_RB_PMBMAP_MEM_CHUNK & 0xffffffc0;
> +
> +	mutex_init(&ispif->cmdq_mutex); /* used for cmdq access */
> +	mutex_init(&ispif->bufq_mutex); /* used for bufq access */
> +	mutex_init(&ispif->isp4if_mutex); /* used for commands sent to ispfw */
> +
> +	INIT_LIST_HEAD(&ispif->cmdq);
> +	INIT_LIST_HEAD(&ispif->bufq);
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.h b/drivers/media/platform/amd/isp4/isp4_interface.h
> new file mode 100644
> index 000000000000..5b94985cdc44
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_interface.h
> @@ -0,0 +1,149 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_INTERFACE_
> +#define _ISP4_INTERFACE_

It seems strange that isp4_interface.h has so many include dependencies and yet
doesn't #include anything on its own. Maybe the includes needed by
isp4_interface.h should be moved into isp4_interface.h?

> +
> +#define ISP4IF_RB_MAX (25)
> +#define ISP4IF_RESP_CHAN_TO_RB_OFFSET (9)
> +#define ISP4IF_RB_PMBMAP_MEM_SIZE (16 * 1024 * 1024 - 1)
> +#define ISP4IF_RB_PMBMAP_MEM_CHUNK (ISP4IF_RB_PMBMAP_MEM_SIZE \
> +	/ (ISP4IF_RB_MAX - 1))
> +#define ISP4IF_HOST2FW_COMMAND_SIZE (sizeof(struct isp4fw_cmd))
> +#define ISP4IF_FW_CMD_BUF_COUNT 4
> +#define ISP4IF_FW_RESP_BUF_COUNT 4
> +#define ISP4IF_MAX_NUM_HOST2FW_COMMAND (40)
> +#define ISP4IF_FW_CMD_BUF_SIZE (ISP4IF_MAX_NUM_HOST2FW_COMMAND \
> +	* ISP4IF_HOST2FW_COMMAND_SIZE)
> +#define ISP4IF_MAX_SLEEP_COUNT (10)
> +#define ISP4IF_MAX_SLEEP_TIME (33)
> +
> +#define ISP4IF_META_INFO_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
> +#define ISP4IF_MAX_STREAM_BUF_COUNT 8
> +
> +#define ISP4IF_FW_LOG_RINGBUF_SIZE (2 * 1024 * 1024)
> +
> +#define ISP4IF_MAX_CMD_RESPONSE_BUF_SIZE (4 * 1024)
> +
> +#define GET_ISP4IF_REG_BASE(ispif) (((ispif))->mmio)
> +
> +enum isp4if_stream_id {
> +	ISP4IF_STREAM_ID_GLOBAL = 0,
> +	ISP4IF_STREAM_ID_1 = 1,
> +	ISP4IF_STREAM_ID_MAX = 4
> +};
> +
> +enum isp4if_status {
> +	ISP4IF_STATUS_PWR_OFF,
> +	ISP4IF_STATUS_PWR_ON,
> +	ISP4IF_STATUS_FW_RUNNING,
> +	ISP4IF_FSM_STATUS_MAX
> +};
> +
> +struct isp4if_gpu_mem_info {
> +	u32	mem_domain;
> +	u64	mem_size;
> +	u32	mem_align;

mem_domain, mem_size, and mem_align are all unused. Remove them.

> +	u64	gpu_mc_addr;
> +	void	*sys_addr;
> +	void	*mem_handle;
> +};
> +
> +struct isp4if_img_buf_info {
> +	struct {
> +		void *sys_addr;
> +		u64 mc_addr;
> +		u32 len;
> +	} planes[3];
> +};
> +
> +struct isp4if_img_buf_node {
> +	struct list_head node;
> +	struct isp4if_img_buf_info buf_info;
> +};
> +
> +struct isp4if_cmd_element {
> +	struct list_head list;
> +	u32 seq_num;
> +	u32 cmd_id;
> +	enum isp4if_stream_id stream;
> +	u64 mc_addr;

stream and mc_addr are not used for anything, remove them.

> +	wait_queue_head_t *wq;
> +	u32 *wq_cond;
> +	struct isp4if_gpu_mem_info *gpu_pkg;

gpu_pkg is not used for anything, remove it.

> +};
> +
> +struct isp4_interface {
> +	struct device *dev;
> +	void __iomem *mmio;
> +
> +	struct mutex cmdq_mutex; /* used for cmdq access */
> +	struct mutex bufq_mutex; /* used for bufq access */

It makes more sense for cmdq_mutex and bufq_mutex to be spin locks since they
are only held briefly for list traversal.

> +	struct mutex isp4if_mutex; /* used to send fw cmd and read fw log */
> +
> +	struct list_head cmdq; /* commands sent to fw */
> +	struct list_head bufq; /* buffers sent to fw */
> +
> +	enum isp4if_status status;
> +	u32 host2fw_seq_num;
> +
> +	/* FW ring buffer configs */
> +	u32 cmd_rb_base_index;
> +	u32 resp_rb_base_index;
> +	u32 aligned_rb_chunk_size;
> +
> +	/* ISP fw buffers */
> +	struct isp4if_gpu_mem_info *fw_log_buf;
> +	struct isp4if_gpu_mem_info *fw_cmd_resp_buf;
> +	struct isp4if_gpu_mem_info *fw_mem_pool;
> +	struct isp4if_gpu_mem_info *
> +		metainfo_buf_pool[ISP4IF_MAX_STREAM_BUF_COUNT];
> +};

[snip]

> +
> +#endif

Add /* _ISP4_INTERFACE_ */

> -- 
> 2.34.1
> 

Sultan

