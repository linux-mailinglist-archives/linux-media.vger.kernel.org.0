Return-Path: <linux-media+bounces-37320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09989B004F8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 16:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 162ED56226E
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 14:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04CE272E55;
	Thu, 10 Jul 2025 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jXhvCgOw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEC32727E3;
	Thu, 10 Jul 2025 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157146; cv=none; b=BeBlaCg/w86Fubug4oamNy6puTSBbaCApSGGaN+XFMZAj/3RuG7T36yohDzpBzUfljPUYfQWw/26CEz5vvb7yIYjz7vOXKdf5L2+dFI352Z2h7dz185vzk702jCdNgowzQfGPk9jatSG/oSymB/cHDFjLmxRsptcHhACJru2/YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157146; c=relaxed/simple;
	bh=sT3ywBHEfpXEefoY6lqNZHdBEznFpDC193UbVPYvSgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyFeNZWAdnBSIBGcTylnK9cY8mlrxJqOdHgV9B32zi3fWx+ugVKV0EShqhOeUGA2UuP4SWIuoOHb0uQ6P4EuZDn8SlQtl3ag9E4VsMCzEHULPnwDzlJ1QUw6gOeARM9ub7PqYgJw08zU+lFb5uge81tKg4ny8ZG+WH+n9dLvdDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jXhvCgOw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8002465;
	Thu, 10 Jul 2025 16:18:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752157113;
	bh=sT3ywBHEfpXEefoY6lqNZHdBEznFpDC193UbVPYvSgo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jXhvCgOw19rQH08pYY7xv8WU9lt35cATNzcLSeSiXbUUf3jowuSOpzSRdc/E1aZNf
	 Qk8ytLvt56fSqcj5/VsPM1rD0y98htn9QYvxgB6zwRSs6Lh2k0SJJe2giZkTntq3yn
	 nEi8hhFMX+N2Bd34k4S8D1vaGhtdzdD3k8u+SIaM=
Message-ID: <722f84e6-c253-4ef2-a65d-72f9215c5ab0@ideasonboard.com>
Date: Thu, 10 Jul 2025 15:18:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: v4l2-common: Introduce v4l2-params.c
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
 <20250710-extensible-parameters-validation-v2-5-7ec8918ec443@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250710-extensible-parameters-validation-v2-5-7ec8918ec443@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jacopo - just one nit, but ignore it if you want

On 10/07/2025 14:52, Jacopo Mondi wrote:
> Add to the v4l2 framework an helper function to support drivers
> when validating a buffer of extensible parameters.
>
> Introduce new types in include/media/v4l2-params.h that drivers shall
> use in order to comply with the v4l2-params validation procedure, and
> add a helper functions to v4l2-params.c to perform block and buffer
> validation.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   MAINTAINERS                           |   2 +
>   drivers/media/v4l2-core/Makefile      |   3 +-
>   drivers/media/v4l2-core/v4l2-params.c | 128 ++++++++++++++++++++++++++
>   include/media/v4l2-params.h           | 165 ++++++++++++++++++++++++++++++++++
>   4 files changed, 297 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index beecac86991d988c48d31366ba5201b09ef25715..3d9a8e06c59eb08360d1e8eea85e450a15ee95af 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25973,6 +25973,8 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
> +F:	drivers/media/v4l2-core/v4l2-params.c
> +F:	include/media/v4l2-params.h
>   F:	include/uapi/linux/media/v4l2-extensible-params.h
>   
>   VF610 NAND DRIVER
> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> index 2177b9d63a8ffc1127c5a70118249a2ff63cd759..323330dd359f95c1ae3d0c35bd6fcb8291a33a07 100644
> --- a/drivers/media/v4l2-core/Makefile
> +++ b/drivers/media/v4l2-core/Makefile
> @@ -11,7 +11,8 @@ tuner-objs	:=	tuner-core.o
>   videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
>   			v4l2-event.o v4l2-subdev.o v4l2-common.o \
>   			v4l2-ctrls-core.o v4l2-ctrls-api.o \
> -			v4l2-ctrls-request.o v4l2-ctrls-defs.o
> +			v4l2-ctrls-request.o v4l2-ctrls-defs.o \
> +			v4l2-params.o
>   
>   # Please keep it alphabetically sorted by Kconfig name
>   # (e. g. LC_ALL=C sort Makefile)
> diff --git a/drivers/media/v4l2-core/v4l2-params.c b/drivers/media/v4l2-core/v4l2-params.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e2d27fa595110600ea27f1c14cd3d129c66dcd75
> --- /dev/null
> +++ b/drivers/media/v4l2-core/v4l2-params.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Video4Linux2 extensible parameters helpers
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> + */
> +
> +#include <media/v4l2-params.h>
> +
> +int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
> +				size_t max_size,
> +				v4l2_params_validate_buffer buffer_validate)
> +{
> +	size_t header_size = offsetof(struct v4l2_params_buffer, data);
> +	struct v4l2_params_buffer *buffer = vb2_plane_vaddr(vb, 0);
> +	size_t payload_size = vb2_get_plane_payload(vb, 0);
> +	size_t buffer_size;
> +	int ret;
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
> +	/* Validate the size reported in the parameter buffer header */
> +	buffer_size = header_size + buffer->data_size;
> +	if (buffer_size != payload_size) {
> +		dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
> +			buffer_size, payload_size);
> +		return -EINVAL;
> +	}
> +
> +	/* Driver-specific buffer validation. */
> +	if (buffer_validate) {
> +		ret = buffer_validate(dev, buffer);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_params_buffer_validate);
> +
> +int v4l2_params_blocks_validate(struct device *dev,
> +				const struct v4l2_params_buffer *buffer,
> +				const struct v4l2_params_handler *handlers,
> +				size_t num_handlers,
> +				v4l2_params_validate_block block_validate)
> +{
> +	size_t block_offset = 0;
> +	size_t buffer_size;
> +	int ret;
> +
> +	/* Walk the list of parameter blocks and validate them. */
> +	buffer_size = buffer->data_size;
> +	while (buffer_size >= sizeof(struct v4l2_params_block_header)) {
> +		const struct v4l2_params_handler *handler;
> +		const struct v4l2_params_block_header *block;
> +		bool valid_size = true;
> +
> +		/* Validate block sizes and types against the handlers. */
> +		block = (const struct v4l2_params_block_header *)
> +			(buffer->data + block_offset);
> +
> +		if (block->type >= num_handlers) {
> +			dev_dbg(dev, "Invalid parameters block type\n");
> +			return -EINVAL;
> +		}
> +
> +		if (block->size > buffer_size) {
> +			dev_dbg(dev, "Premature end of parameters data\n");
> +			return -EINVAL;
> +		}
> +
> +		/* It's invalid to specify both ENABLE and DISABLE. */
> +		if ((block->flags & (V4L2_PARAMS_FL_BLOCK_ENABLE |
> +				     V4L2_PARAMS_FL_BLOCK_DISABLE)) ==
> +		     (V4L2_PARAMS_FL_BLOCK_ENABLE |
> +		     V4L2_PARAMS_FL_BLOCK_DISABLE)) {
> +			dev_dbg(dev, "Invalid parameters block flags\n");
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * Match the block reported size against the handler's expected
> +		 * one, but allow the block to only contain the header in
> +		 * case it is going to be disabled.
> +		 */
> +		handler = &handlers[block->type];
> +		if (block->size != handler->size) {
> +			valid_size = false;
> +
> +			if ((block->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) &&
> +			    block->size == sizeof(*block))
> +				valid_size = true;
> +		}
> +		if (!valid_size) {
> +			dev_dbg(dev, "Invalid parameters block size\n");
> +			return -EINVAL;
> +		}

Maybe just


         if (block->size != handler->size) {
             if (!(block->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) ||
                 block->size != sizeof(*block)) {
                 dev_dbg(dev, "Invalid parameters block size\n");
                 return -EINVAL;
             }
         }


But don't bother with a new version if that's the only change.


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> +
> +		/* Driver-specific per-block validation. */
> +		if (block_validate) {
> +			ret = block_validate(dev, block);
> +			if (ret)
> +				return ret;
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
> +EXPORT_SYMBOL_GPL(v4l2_params_blocks_validate);
> diff --git a/include/media/v4l2-params.h b/include/media/v4l2-params.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e8169e559d114af03bb41876111839fbe023ee6d
> --- /dev/null
> +++ b/include/media/v4l2-params.h
> @@ -0,0 +1,165 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Video4Linux2 extensible parameters helpers
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> + */
> +
> +#ifndef V4L2_PARAMS_H_
> +#define V4L2_PARAMS_H_
> +
> +#include <linux/media/v4l2-extensible-params.h>
> +
> +#include <linux/device.h>
> +
> +#include <media/videobuf2-core.h>
> +
> +/**
> + * typedef v4l2_params_block_handler - V4L2 extensible format block handler
> + * @arg: pointer the driver-specific argument
> + * @block: the ISP configuration block to handle
> + *
> + * Defines the function signature of the functions that handle an ISP block
> + * configuration.
> + */
> +typedef void (*v4l2_params_block_handler)(void *arg,
> +					  const struct v4l2_params_block_header *block);
> +
> +/**
> + * struct v4l2_params_handler - V4L2 extensible format handler
> + * @size: the block expected size
> + * @handler: the block handler function
> + * @group: the device-specific group id the block belongs to (optional)
> + * @features: the device-specific features flags (optional)
> + *
> + * The v4l2_params_handler defines the type that driver making use of the
> + * V4L2 extensible parameters shall use to define their own ISP block
> + * handlers.
> + *
> + * Drivers shall prepare a list of handlers, one for each supported ISP block
> + * and correctly populate the structure's field with the expected block @size
> + * (used for validation), a pointer to each block @handler function and an
> + * optional @group and @feature flags, the driver can use to differentiate which
> + * ISP blocks are present on the ISP implementation.
> + *
> + * The @group field is intended to be used as a bitmask of driver-specific
> + * flags to allow the driver to setup certain blocks at different times. As an
> + * example an ISP driver can divide its block handlers in "pre-configure" blocks
> + * and "run-time" blocks and use the @group bitmask to identify the ISP blocks
> + * that have to be pre-configured from the ones that only have to be handled at
> + * run-time. The usage and definition of the @group field is totally
> + * driver-specific.
> + *
> + * The @features flag can instead be used to differentiate between blocks
> + * implemented in different revisions of the ISP design. In example some ISP
> + * blocks might be present on more recent revision than others. Populating the
> + * @features bitmask with the ISP/SoC machine identifier allows the driver to
> + * correctly ignore the blocks not supported on the ISP revision it is running
> + * on. As per the @group bitmask, the usage and definition of the @features
> + * field is totally driver-specific.
> + */
> +struct v4l2_params_handler {
> +	size_t size;
> +	v4l2_params_block_handler handler;
> +	unsigned int group;
> +	unsigned int features;
> +};
> +
> +/**
> + * typedef v4l2_params_validate_buffer - V4L2 extensible parameters buffer
> + *					 validation callback
> + * @dev: the driver's device pointer (as passed by the driver to
> + *	 v4l2_params_buffer_validate())
> + * @buffer: the extensible parameters buffer
> + *
> + * Defines the function prototype for the driver's callback to perform
> + * driver-specific validation on the extensible parameters buffer
> + */
> +typedef int (*v4l2_params_validate_buffer)(struct device *dev,
> +					   const struct v4l2_params_buffer *buffer);
> +
> +/**
> + * v4l2_params_buffer_validate - Validate a V4L2 extensible parameters buffer
> + * @dev: the driver's device pointer
> + * @vb: the videobuf2 buffer
> + * @max_size: the maximum allowed buffer size
> + * @buffer_validate: callback to the driver-specific buffer validation
> + *
> + * Helper function that performs validation of an extensible parameters buffer.
> + *
> + * The helper is meant to be used by drivers to perform validation of the
> + * extensible parameters buffer size correctness.
> + *
> + * The @vb buffer as received from the vb2 .buf_prepare operation is checked
> + * against @max_size and its validated to be large enough to accommodate at
> + * least one ISP configuration block. The effective buffer size is compared
> + * to the data size reported by @cfg to make sure they match.
> + *
> + * If provided, the @buffer_validate callback function is invoked to allow
> + * drivers to perform driver-specific validation (such as checking that the
> + * buffer version is supported).
> + *
> + * Drivers should use this function to validate the buffer size correctness
> + * before performing a copy of the user-provided videobuf2 buffer content into a
> + * kernel-only memory buffer to prevent userspace from modifying the buffer
> + * content after it has been submitted to the driver.
> + *.
> + * Examples of users of this function can be found in
> + * rkisp1_params_prepare_ext_params() and in c3_isp_params_vb2_buf_prepare().
> + */
> +int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
> +				size_t max_size,
> +				v4l2_params_validate_buffer buffer_validate);
> +
> +/**
> + * typedef v4l2_params_validate_block - V4L2 extensible parameters block
> + *					validation callback
> + * @dev: the driver's device pointer (as passed by the driver to
> + *	 v4l2_params_validate())
> + * @block: the ISP configuration block to validate
> + *
> + * Defines the function prototype for the driver's callback to perform
> + * driver-specific validation on each ISP block.
> + */
> +typedef int (*v4l2_params_validate_block)(struct device *dev,
> +					  const struct v4l2_params_block_header *block);
> +
> +/**
> + * v4l2_params_blocks_validate - Validate V4L2 extensible parameters ISP
> + *				 configuration blocks
> + * @dev: the driver's device pointer
> + * @buffer: the extensible parameters configuration buffer
> + * @handlers: the list of block handlers
> + * @num_handlers: the number of block handlers
> + * @block_validate: callback to the driver-specific per-block validation
> + *		    function
> + *
> + * Helper function that performs validation of the ISP configuration blocks in
> + * an extensible parameters buffer.
> + *
> + * The helper is meant to be used by drivers to perform validation of the
> + * ISP configuration data blocks. For each block in the extensible parameters
> + * buffer, its size and correctness are validated against its associated handler
> + * in the @handlers list. Additionally, if provided, the @block_validate
> + * callback is invoked on each block to allow drivers to perform driver-specific
> + * validation.
> + *
> + * Drivers should to use this function to validate the ISP configuration blocks
> + * after having validated the correctness of the vb2 buffer sizes by using the
> + * v4l2_params_buffer_validate() helper first. Once the buffer size has been
> + * validated, drivers should perform a copy of the user-provided buffer into a
> + * kernel-only memory buffer @cfg to prevent userspace from modifying the buffer
> + * content after it has been submitted to the driver, and then call this
> + * function to perform per-block validation.
> + *
> + * Examples of users of this function can be found in
> + * rkisp1_params_prepare_ext_params() and in c3_isp_params_vb2_buf_prepare().
> + */
> +int v4l2_params_blocks_validate(struct device *dev,
> +				const struct v4l2_params_buffer *buffer,
> +				const struct v4l2_params_handler *handlers,
> +				size_t num_handlers,
> +				v4l2_params_validate_block block_validate);
> +
> +#endif /* V4L2_PARAMS_H_ */
>

