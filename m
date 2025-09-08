Return-Path: <linux-media+bounces-41963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F1B48679
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 10:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CDF8189B6DF
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 08:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EEA2E8DFE;
	Mon,  8 Sep 2025 08:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ofvNVgGd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BBC72602;
	Mon,  8 Sep 2025 08:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319529; cv=none; b=psbgdDSECyT5nZExP6pwrPAi7bLadW7n69afxG0kP01t15b8ipZvP7Hp0ZTGcAdm43E86HE1ixAM/Zm+0AoY4f3TW0Z1/TgLBuGD8DY/PzKg9O/Qa/ZWtujoYVNlg2iHL9Erl5qk1OKfbAx3OCh7ilbrjIqLMMah04S0UbRdfaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319529; c=relaxed/simple;
	bh=7bUSwcn7w2XDdj9f0yzxYe0OEUqdAuC/aqzuWAWqKvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+pFl5W4tuR9P6qbkFB97f8g6Qgg992XptiSyS2UQbHZ8OpI36267lSinUnwrKPPE6q8Jxyp+tRtEnZXJlAqL3utc0ctsmeQAPiH39JdvxLyYnopCFHrtCBaIupMz+LXF3LFKaiJm5tjy69bto7CbGRif/r4wIoDf3wKLRz3DbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ofvNVgGd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D5E7A99F;
	Mon,  8 Sep 2025 10:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757319452;
	bh=7bUSwcn7w2XDdj9f0yzxYe0OEUqdAuC/aqzuWAWqKvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofvNVgGdGH7bsWUV85FrSua3yvBqfK1wXFBoGfpwU6PXSccWMt7fkN3oEgt7hJ2AV
	 O5/7HrmnVymMPzSRhsD/IdTEfR66m+wa/C17GmhjUKlH6GZFBY6yromtv/7c9s317H
	 CHbO8m+JcFPeti0+SoirNpzWmuC50AN9tOPnzfJ0=
Date: Mon, 8 Sep 2025 10:18:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/8] media: v4l2-core: Introduce v4l2-params.c
Message-ID: <20250908081824.GA23404@pendragon.ideasonboard.com>
References: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
 <20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f@ideasonboard.com>

On Wed, Aug 20, 2025 at 02:58:13PM +0200, Jacopo Mondi wrote:
> Add to the v4l2 framework an helper function to support drivers

s/an helper/a helper/

> when validating a buffer of extensible parameters.
> 
> Introduce new types in include/media/v4l2-params.h that drivers shall

As for the UAPI, I'd go straight for v4l2-isp.[ch].

> use in order to comply with the v4l2-params validation procedure, and
> add a helper functions to v4l2-params.c to perform block and buffer
> validation.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  MAINTAINERS                           |   2 +
>  drivers/media/v4l2-core/Makefile      |   3 +-
>  drivers/media/v4l2-core/v4l2-params.c | 126 ++++++++++++++++++++++++++
>  include/media/v4l2-params.h           | 164 ++++++++++++++++++++++++++++++++++
>  4 files changed, 294 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 91df04e5d9022ccf2aea4445247369a8b86a4264..008f984c0769691f6ddec8d8f0f461fde056ddb3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26385,6 +26385,8 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
> +F:	drivers/media/v4l2-core/v4l2-params.c
> +F:	include/media/v4l2-params.h
>  F:	include/uapi/linux/media/v4l2-extensible-params.h
>  
>  VF610 NAND DRIVER
> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> index 2177b9d63a8ffc1127c5a70118249a2ff63cd759..323330dd359f95c1ae3d0c35bd6fcb8291a33a07 100644
> --- a/drivers/media/v4l2-core/Makefile
> +++ b/drivers/media/v4l2-core/Makefile
> @@ -11,7 +11,8 @@ tuner-objs	:=	tuner-core.o
>  videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
>  			v4l2-event.o v4l2-subdev.o v4l2-common.o \
>  			v4l2-ctrls-core.o v4l2-ctrls-api.o \
> -			v4l2-ctrls-request.o v4l2-ctrls-defs.o
> +			v4l2-ctrls-request.o v4l2-ctrls-defs.o \
> +			v4l2-params.o
>  
>  # Please keep it alphabetically sorted by Kconfig name
>  # (e. g. LC_ALL=C sort Makefile)
> diff --git a/drivers/media/v4l2-core/v4l2-params.c b/drivers/media/v4l2-core/v4l2-params.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..69fc7fabce9dac3fca5a6b783b86a3b0dfc1d803
> --- /dev/null
> +++ b/drivers/media/v4l2-core/v4l2-params.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Video4Linux2 extensible parameters helpers
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <media/videobuf2-core.h>
> +

The blank line should be before the previous header.

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
> +		if (block->size != handler->size &&
> +		    (!(block->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) ||
> +		    block->size != sizeof(*block))) {
> +			dev_dbg(dev, "Invalid parameters block size\n");
> +			return -EINVAL;
> +		}
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
> index 0000000000000000000000000000000000000000..f42d56a6d6a0383571116345d76ba02fc9ae039d
> --- /dev/null
> +++ b/include/media/v4l2-params.h
> @@ -0,0 +1,164 @@
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
> +struct device;
> +struct vb2_buffer;
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

Only the size is used by the validation helpers. The group and features
fields are used by rkisp1 only. I think we should either generalize the
concepts, or drop them from this structure. The group field, in
particular, should likely be dropped.

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

Don't create mid-layers. If the driver needs to perform additional
validation, do so before or after calling v4l2_params_buffer_validate().

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
> + * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
> + * against @max_size and its validated to be large enough to accommodate at
> + * least one ISP configuration block. The effective buffer size is compared
> + * with the reported data size to make sure they match.
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

Extra period.

> + * Examples of users of this function can be found in
> + * rkisp1_params_prepare_ext_params() and in c3_isp_params_vb2_buf_prepare().

Drop this, git grep is enough to find users.

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

This isn't used in this series. Drop it and introduce it later if needed
by another driver, I can't review the feature without seeing a user.

Another feature that may be helpful to move to the V4L2 core (in a
separate patch or a separate series) is copying the parameters to an
internal buffer.

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
> + * Drivers should use this function to validate the ISP configuration blocks
> + * after having validated the correctness of the vb2 buffer sizes by using the
> + * v4l2_params_buffer_validate() helper first. Once the buffer size has been
> + * validated, drivers should perform a copy of the user-provided buffer into a
> + * kernel-only memory buffer to prevent userspace from modifying the buffer
> + * content after it has been submitted to the driver, and then call this
> + * function to perform per-block validation.
> + *
> + * Examples of users of this function can be found in
> + * rkisp1_params_prepare_ext_params() and in c3_isp_params_vb2_buf_prepare().

Drop this.

> + */
> +int v4l2_params_blocks_validate(struct device *dev,
> +				const struct v4l2_params_buffer *buffer,
> +				const struct v4l2_params_handler *handlers,
> +				size_t num_handlers,
> +				v4l2_params_validate_block block_validate);
> +
> +#endif /* V4L2_PARAMS_H_ */

-- 
Regards,

Laurent Pinchart

