Return-Path: <linux-media+bounces-44411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8768BD9388
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 14:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 827721883ACF
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 12:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673DD3126B7;
	Tue, 14 Oct 2025 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="D6dhODXV"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD4E3126A1;
	Tue, 14 Oct 2025 12:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443651; cv=none; b=ehCf4wjs1NMc8bx+Lm0dIHZyRs90Ee4Y/cGi1uivN65/FRYMkmQCmMX8dfuJfVJl84Ckku/SXruCMu87EIkhYkwgvitXoAlRl5ysNJUaPPfkR2m8JfWOIxphPDtaA5wXj9Kc9Hqr+49pQaEPjVwQ0IbB1rOnaUIADC6hujTQ128=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443651; c=relaxed/simple;
	bh=JmcIbjKLSe1ar0AiJpgb5o/5SVm++VaB0u54HlKmh2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3BlwCiLCmkcIOWzs4iJTmCJXrf5719PmRjIe+WLhBt3ZaefDleDSsAm8BVMHXuBoqhcK5SD7Ld70cQCH/B3dEf2pDpvUxNTEzlXdzKLH1RsiSiL84jlpGLGap1mo0QwzCvdrJMWTm+lNka9lN49Y9aUmP52sdIXB1/sR6aSHmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=D6dhODXV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760443643;
	bh=JmcIbjKLSe1ar0AiJpgb5o/5SVm++VaB0u54HlKmh2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D6dhODXVSdMmQTBDLiNuHmSmHr69iHZKNBsH2S0h2WMXfUMJSYXz4CIf3J2zqEVX1
	 G68VrF9z98s8yoljL9Pcx3bm8uvXs2LN8YeGaOsa9pXNk4rdkBebe4j7Bm3TocsVG8
	 qYqldPwqiKf8hqUkh2V8t7O8Xzchd2D+8GCz2lK+Y9+qPZYwt5fbJ5Gmd4HbqVZhmE
	 b4KEo6icrVEtmcyLsJI5ZfSOSu25EH+cwu2bjg0ngjX1rLgKyAInZ7kUkTeIh/lnrN
	 g5lk3/kSlD4C6cRA1YoRQYFvroXjJF6yJVIuOPA3hB7E14udTD+ljiYTeKm94pniTJ
	 9y6pgZwdq/Gdw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43CF617E055D;
	Tue, 14 Oct 2025 14:07:23 +0200 (CEST)
Message-ID: <fc80e268-e3c7-4320-b8ab-b05a5bd4ff72@collabora.com>
Date: Tue, 14 Oct 2025 14:07:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] media: v4l2-core: Introduce v4l2-isp.c
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
 <20251014-extensible-parameters-validation-v7-5-6628bed5ca98@ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-5-6628bed5ca98@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

Thanks for your efforts! Looks good to me!

On 10/14/25 10:00, Jacopo Mondi wrote:
> Add to the V4L2 framework helper functions to support drivers when
> validating a buffer of V4L2 ISP parameters.
> 
> Driver shall use v4l2_isp_params_validate_buffer_size() to verify the
> size correctness of the data received from userspace, and after having
> copied the data to a kernel-only memory location, complete the
> validation by calling v4l2_isp_params_validate_buffer().
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

> ---
>  MAINTAINERS                        |   2 +
>  drivers/media/v4l2-core/Kconfig    |   4 ++
>  drivers/media/v4l2-core/Makefile   |   1 +
>  drivers/media/v4l2-core/v4l2-isp.c | 128 +++++++++++++++++++++++++++++++++++++
>  include/media/v4l2-isp.h           |  91 ++++++++++++++++++++++++++
>  5 files changed, 226 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 340353334299cd5eebf1f72132b7e91b6f5fdbfe..59ab4a34f72c0430a8d7966942acb2242ad923ca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26858,6 +26858,8 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
> +F:	drivers/media/v4l2-core/v4l2-isp.c
> +F:	include/media/v4l2-isp.h
>  F:	include/uapi/linux/media/v4l2-isp.h
>  
>  VF610 NAND DRIVER
> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> index 331b8e535e5bbf33f22638b2ae8bc764ad5fc407..d50ccac9733cc39a43426ae7e7996dd0b5b45186 100644
> --- a/drivers/media/v4l2-core/Kconfig
> +++ b/drivers/media/v4l2-core/Kconfig
> @@ -82,3 +82,7 @@ config V4L2_CCI_I2C
>  	depends on I2C
>  	select REGMAP_I2C
>  	select V4L2_CCI
> +
> +config V4L2_ISP
> +	tristate
> +	depends on VIDEOBUF2_CORE
> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> index 2177b9d63a8ffc1127c5a70118249a2ff63cd759..329f0eadce994cc1c8580beb435f68fa7e2a7aeb 100644
> --- a/drivers/media/v4l2-core/Makefile
> +++ b/drivers/media/v4l2-core/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
>  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
>  obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
>  obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
> +obj-$(CONFIG_V4L2_ISP) += v4l2-isp.o
>  obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
>  obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
>  obj-$(CONFIG_V4L2_VP9) += v4l2-vp9.o
> diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..35f0b701f1729c3c0ccc34b1c89189b179e0b684
> --- /dev/null
> +++ b/drivers/media/v4l2-core/v4l2-isp.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Video4Linux2 generic ISP parameters and statistics support
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> + */
> +
> +#include <media/v4l2-isp.h>
> +
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +
> +#include <media/videobuf2-core.h>
> +
> +int v4l2_isp_params_validate_buffer_size(struct device *dev,
> +					 struct vb2_buffer *vb,
> +					 size_t max_size)
> +{
> +	size_t header_size = offsetof(struct v4l2_isp_params_buffer, data);
> +	size_t payload_size = vb2_get_plane_payload(vb, 0);
> +
> +	/* Payload size can't be greater than the destination buffer size */
> +	if (payload_size > max_size) {
> +		dev_dbg(dev, "Payload size is too large: %zu\n", payload_size);
> +		return -EINVAL;
> +	}
> +
> +	/* Payload size can't be smaller than the header size */
> +	if (payload_size < header_size) {
> +		dev_dbg(dev, "Payload size is too small: %zu\n", payload_size);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer_size);
> +
> +int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
> +				    const struct v4l2_isp_params_buffer *buffer,
> +				    const struct v4l2_isp_params_block_info *info,
> +				    size_t num_blocks)
> +{
> +	size_t header_size = offsetof(struct v4l2_isp_params_buffer, data);
> +	size_t payload_size = vb2_get_plane_payload(vb, 0);
> +	size_t block_offset = 0;
> +	size_t buffer_size;
> +
> +	/*
> +	 * Currently only the first version of the V4L2 ISP parameters format is
> +	 * supported. We accept both V0 and V1 to support existing drivers
> +	 * compatible with V4L2 ISP that use either 0 or 1 as their "first
> +	 * version" identifiers.
> +	 */
> +	if (buffer->version != V4L2_ISP_PARAMS_VERSION_V0 &&
> +	    buffer->version != V4L2_ISP_PARAMS_VERSION_V1) {
> +		dev_dbg(dev,
> +			"Unsupported V4L2 ISP parameters format version: %u\n",
> +			buffer->version);
> +		return -EINVAL;
> +	}
> +
> +	/* Validate the size reported in the header */
> +	buffer_size = header_size + buffer->data_size;
> +	if (buffer_size != payload_size) {
> +		dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
> +			buffer_size, payload_size);
> +		return -EINVAL;
> +	}
> +
> +	/* Walk the list of ISP configuration blocks and validate them. */
> +	buffer_size = buffer->data_size;
> +	while (buffer_size >= sizeof(struct v4l2_isp_params_block_header)) {
> +		const struct v4l2_isp_params_block_info *block_info;
> +		const struct v4l2_isp_params_block_header *block;
> +
> +		block = (const struct v4l2_isp_params_block_header *)
> +			(buffer->data + block_offset);
> +
> +		if (block->type >= num_blocks) {
> +			dev_dbg(dev,
> +				"Invalid block type %u at offset %zu\n",
> +				block->type, block_offset);
> +			return -EINVAL;
> +		}
> +
> +		if (block->size > buffer_size) {
> +			dev_dbg(dev, "Premature end of parameters data\n");
> +			return -EINVAL;
> +		}
> +
> +		/* It's invalid to specify both ENABLE and DISABLE. */
> +		if ((block->flags & (V4L2_ISP_PARAMS_FL_BLOCK_ENABLE |
> +				     V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)) ==
> +		     (V4L2_ISP_PARAMS_FL_BLOCK_ENABLE |
> +		     V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)) {
> +			dev_dbg(dev, "Invalid block flags %x at offset %zu\n",
> +				block->flags, block_offset);
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * Match the block reported size against the info provided
> +		 * one, but allow the block to only contain the header in
> +		 * case it is going to be disabled.
> +		 */
> +		block_info = &info[block->type];
> +		if (block->size != block_info->size &&
> +		    (!(block->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) ||
> +		    block->size != sizeof(*block))) {
> +			dev_dbg(dev,
> +				"Invalid block size %u (expected %zu) at offset %zu\n",
> +				block->size, block_info->size, block_offset);
> +			return -EINVAL;
> +		}
> +
> +		block_offset += block->size;
> +		buffer_size -= block->size;
> +	}
> +
> +	if (buffer_size) {
> +		dev_dbg(dev, "Unexpected data after the parameters buffer end\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer);
> diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..8b4695663699e7f176384739cf54ed7fa2c578f8
> --- /dev/null
> +++ b/include/media/v4l2-isp.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Video4Linux2 generic ISP parameters and statistics support
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> + */
> +
> +#ifndef _V4L2_ISP_H_
> +#define _V4L2_ISP_H_
> +
> +#include <linux/media/v4l2-isp.h>
> +
> +struct device;
> +struct vb2_buffer;
> +
> +/**
> + * v4l2_isp_params_buffer_size - Calculate size of v4l2_isp_params_buffer
> + * @max_params_size: The total size of the ISP configuration blocks
> + *
> + * Users of the v4l2 extensible parameters will have differing sized data arrays
> + * depending on their specific parameter buffers. Drivers and userspace will
> + * need to be able to calculate the appropriate size of the struct to
> + * accommodate all ISP configuration blocks provided by the platform.
> + * This macro provides a convenient tool for the calculation.
> + */
> +#define v4l2_isp_params_buffer_size(max_params_size) \
> +	(offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
> +
> +/**
> + * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
> + * @dev: the driver's device pointer
> + * @vb: the videobuf2 buffer
> + * @max_size: the maximum allowed buffer size
> + *
> + * This function performs validation of the size of a V4L2 ISP parameters buffer
> + * before the driver can access the actual data buffer content.
> + *
> + * After the sizes validation, drivers should copy the buffer content to a
> + * kernel-only memory area to prevent userspace from modifying it,
> + * before completing validation using v4l2_isp_params_validate_buffer().
> + *
> + * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
> + * against @max_size and it's validated to be large enough to accommodate at
> + * least one ISP configuration block.
> + */
> +int v4l2_isp_params_validate_buffer_size(struct device *dev,
> +					 struct vb2_buffer *vb,
> +					 size_t max_size);
> +
> +/**
> + * struct v4l2_isp_params_block_info - V4L2 ISP per-block info
> + * @size: the block expected size
> + *
> + * The v4l2_isp_params_block_info collects information of the ISP configuration
> + * blocks for validation purposes. It currently only contains the expected
> + * block size.
> + *
> + * Drivers shall prepare a list of block info, indexed by block type, one for
> + * each supported ISP block and correctly populate them with the expected block
> + * size.
> + */
> +struct v4l2_isp_params_block_info {
> +	size_t size;
> +};
> +
> +/**
> + * v4l2_isp_params_validate_buffer - Validate a V4L2 ISP parameters buffer
> + * @dev: the driver's device pointer
> + * @vb: the videobuf2 buffer
> + * @buffer: the V4L2 ISP parameters buffer
> + * @info: the list of per-block validation info
> + * @num_blocks: the number of blocks
> + *
> + * This function completes the validation of a V4L2 ISP parameters buffer,
> + * verifying each configuration block correctness before the driver can use
> + * them to program the hardware.
> + *
> + * Drivers should use this function after having validated the correctness of
> + * the vb2 buffer sizes by using the v4l2_isp_params_validate_buffer_size()
> + * helper first. Once the buffer size has been validated, drivers should
> + * perform a copy of the user provided buffer into a kernel-only memory buffer
> + * to prevent userspace from modifying its content after it has been submitted
> + * to the driver, and then call this function to complete validation.
> + */
> +int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
> +				    const struct v4l2_isp_params_buffer *buffer,
> +				    const struct v4l2_isp_params_block_info *info,
> +				    size_t num_blocks);
> +
> +#endif /* _V4L2_ISP_H_ */
> 


