Return-Path: <linux-media+bounces-50722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDE6D20EFF
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 19:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDFAE307631E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 18:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C1F32571F;
	Wed, 14 Jan 2026 18:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Kr8yrggs"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E690296BB7;
	Wed, 14 Jan 2026 18:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768416859; cv=none; b=IDWnya2O73Kwmlhf8SlJz9TnoRihAsoRJGYMvR+5WapQVmO8cBoiXnaDqznyfp/9rbXUqk5vz9DaNGT3k9HjTgXq/osFum9+c79p6lfw5tAox0Gi7CKkAGSi+SCzSWHQ7JeKeLC45w09fl/3fu+TPqiIOa6mdr7Jj3L4MlT82oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768416859; c=relaxed/simple;
	bh=u8GL/uWY78HFpYvyzZhlMf8LaZdNgYByZD4HjbNlCfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPbIaIjT3g5x8zUQqP34xyjum9AtSFl48+TjbKDlFqDzfbA4f3Xj/zN7mxovYgK+tpVQfXEhQcGmxTOlKvS+NvPq2DtHTrVnWd6ZRYoIAGZEojAYojOT0a5wPW2nfZX41OLOj0sPRjK8ZiEOLwokllwWfZyV2a3su4m/bxp8wyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Kr8yrggs; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=zcnIuWiSTIZZ0AACUI8rXLp5eXesHA5I/iZOlgjvMlE=; b=Kr8yrggslKb45qc/SMU7bLtOZc
	a6T5AL0DkJtLc0OCBqC/g6HwDweR62qhUZxxhORr9CwZNktdGapst2q5mhiPHGB7dbbWv2BiJHjXl
	hgSsok1QzcLKnrw4WYOMblinhb6RZlAz+7RBcEsnMYfxhB5I05Rm8Qr4seGQXFbhvj1qMwKcx/OKA
	J2QPocAQIsQd14OoTLWOLzXP9cW3hWSWc19e5Mj2DZt4vvtWMEHhMx73rkY97IjDHWNa9DpxJ2K75
	K/w4rfwnHP6J9x8r6omNzfDgqcGV41BCnSwenOZYkNLxmZDmnb/5Z/1qbtbT1jkrP+Aiigwpm6khl
	LrNPOcHg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg60K-0000000AOJo-1FEC;
	Wed, 14 Jan 2026 18:54:04 +0000
Message-ID: <d5ff6967-ddf4-42df-840e-d960f7fab257@infradead.org>
Date: Wed, 14 Jan 2026 10:54:03 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] accel/thames: Add driver for the C7x DSPs in TI
 SoCs
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Nishanth Menon <nm@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Randolph Sapp <rs@ti.com>,
 Jonathan Humphreys <j-humphreys@ti.com>, Andrei Aldea <a-aldea@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
 <20260114-thames-v2-2-e94a6636e050@tomeuvizoso.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260114-thames-v2-2-e94a6636e050@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/14/26 12:46 AM, Tomeu Vizoso wrote:
> Some SoCs from Texas Instruments contain DSPs that can be used for
> general compute tasks.
> 
> This driver provides a drm/accel UABI to userspace for submitting jobs
> to the DSP cores and managing the input, output and intermediate memory.
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  Documentation/accel/thames/index.rst |  28 +++++
>  MAINTAINERS                          |   9 ++
>  drivers/accel/Kconfig                |   1 +
>  drivers/accel/Makefile               |   3 +-
>  drivers/accel/thames/Kconfig         |  26 +++++
>  drivers/accel/thames/Makefile        |   9 ++
>  drivers/accel/thames/thames_core.c   | 155 ++++++++++++++++++++++++++
>  drivers/accel/thames/thames_core.h   |  53 +++++++++
>  drivers/accel/thames/thames_device.c |  93 ++++++++++++++++
>  drivers/accel/thames/thames_device.h |  46 ++++++++
>  drivers/accel/thames/thames_drv.c    | 155 ++++++++++++++++++++++++++
>  drivers/accel/thames/thames_drv.h    |  21 ++++
>  drivers/accel/thames/thames_ipc.h    | 204 +++++++++++++++++++++++++++++++++++
>  drivers/accel/thames/thames_rpmsg.c  | 155 ++++++++++++++++++++++++++
>  drivers/accel/thames/thames_rpmsg.h  |  27 +++++
>  15 files changed, 984 insertions(+), 1 deletion(-)
> 

> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index 1d3a7251b950f39e2ae600a2fc07a3ef7e41831e..8472989cbe22746f1e7292d2401fa0f7424a6c15 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
>  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> -obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> +obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> +obj-$(CONFIG_DRM_ACCEL_THAMES)		+= thames/
> \ No newline at end of file

Please eliminate these warnings.


> diff --git a/drivers/accel/thames/thames_ipc.h b/drivers/accel/thames/thames_ipc.h> new file mode 100644
> index 0000000000000000000000000000000000000000..60297b4bc2ffd990315cb735a96a23429d390f43
> --- /dev/null
> +++ b/drivers/accel/thames/thames_ipc.h
> @@ -0,0 +1,204 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/
> + *
> + * This header defines the RPMSG message structures exchanged between
> + * the Linux kernel (host) and the C7x DSP (remote) firmware for the
> + * Thames DRM/accel driver.
> + */
> +
> +#ifndef _THAMES_IPC_H
> +#define _THAMES_IPC_H
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +#else
> +#include <stdint.h>
> +typedef uint8_t __u8;
> +typedef uint16_t __u16;
> +typedef uint32_t __u32;
> +typedef uint64_t __u64;
> +#endif
> +
> +#define THAMES_SERVICE_NAME "thames-service"
> +
> +/**
> + * @THAMES_MSG_TYPE: Simplified message type enumeration
> + */

"/**" means "this is kernel-doc format", which should look like:

/**
 * enum thames_msg_type - Simplified message type enumeration
 */

and then each enum value should be documented as well.

> +enum thames_msg_type {
> +	/* --- Host (Kernel) -> Remote (DSP) --- */
> +	THAMES_MSG_PING = 0x100, /* Ping message to test communication */
> +	THAMES_MSG_CONTEXT_OP, /* Create/destroy context */
> +	THAMES_MSG_BO_OP, /* Map/unmap buffer objects */
> +	THAMES_MSG_SUBMIT_JOB, /* Submit job for execution */
> +
> +	/* --- Remote (DSP) -> Host (Kernel) --- */
> +	THAMES_MSG_PING_RESPONSE = 0x200,
> +	THAMES_MSG_CONTEXT_OP_RESPONSE,
> +	THAMES_MSG_BO_OP_RESPONSE,
> +	THAMES_MSG_SUBMIT_JOB_RESPONSE,
> +};
> +
> +/**
> + * @THAMES_CONTEXT_OP: Context operation types

 * enum thames_context_op - Context operations types

> + */
> +enum thames_context_op {
> +	THAMES_CONTEXT_CREATE = 0,
> +	THAMES_CONTEXT_DESTROY,
> +};
> +
> +/**
> + * @THAMES_BO_OP: Buffer Object operation types

 * enum thames_bo_op - Buffer Object operation types

> + */
> +enum thames_bo_op {
> +	THAMES_BO_MAP = 0,
> +	THAMES_BO_UNMAP,
> +};
> +
> +/**
> + * @THAMES_RESP_STATUS: Response status codes

 * enum thames_resp_status - Response status codes

> + */
> +enum thames_resp_status {
> +	THAMES_RESP_SUCCESS = 0,
> +	THAMES_RESP_ERR_GENERIC = 1,
> +	THAMES_RESP_ERR_NOMEM = 2,
> +	THAMES_RESP_ERR_INVAL = 3,
> +	THAMES_RESP_ERR_NO_CTX = 4,
> +	THAMES_RESP_ERR_MMU = 5,
> +	THAMES_RESP_ERR_JOB_TIMEOUT = 6,
> +};

Or you could just use "/*" so that they aren't considered as
kernel-doc.


-- 
~Randy


