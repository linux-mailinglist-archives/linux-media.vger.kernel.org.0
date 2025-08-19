Return-Path: <linux-media+bounces-40324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5C6B2CF49
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 00:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 935E01C40401
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 22:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFBC3054CD;
	Tue, 19 Aug 2025 22:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5ZAZaY4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B6827E1AC;
	Tue, 19 Aug 2025 22:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755642055; cv=none; b=OhaMQkQF71vaQWCMUFLPZOVVVO88e60fMiQesWhU7gDpNgfHOYlzbKZyfABRfpsmGc3bLKhwVbdP4E+ggGUUnjcVaCUSbUBjVl5VuESgHBxuKUiRj8rRDCPTcUVn6gnbXP0BUuTJLoktji+DV3UtySgW9gBTjzVzA7ev3Mewo2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755642055; c=relaxed/simple;
	bh=0uo3k1XYjiEJ4XvxcQ7Gf0m/s5nmNqT8/MeqEb8lcYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxEqNJNlkQGCxmrw8r9s+IqIz2CO8fOkv4d1ZWJL4TFgdNavm/jsc6F+Nvk1UtDee8UXpK1+LKYb/UUG4ORI3rThpi2gJ0gTyCa84yi0r2LKMyiA27Ljx/vAo0xmWSd8zcTb0HAquWNk7cBP0gjDYzs8rVR6oYud+OOhs0bK5NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5ZAZaY4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755642054; x=1787178054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0uo3k1XYjiEJ4XvxcQ7Gf0m/s5nmNqT8/MeqEb8lcYs=;
  b=O5ZAZaY4Z6JRPraB3ppdb+GjeZSKYifzQXJBT3irofURT+Dss7w3pHLm
   RRITfxrikJ/oNl495w3SebnNNIDnt8yS6AHZkk07FPVWNikx/WQUCu8O9
   9lx7UeClezfrs1LO63tMXZXl76pUsJqlHnhAV2eMRNvZ+Ql4mSMa8BoJw
   mSw9BEAKSmIUX7Ipfrg1s5WyfMvgSZL843b0XGr+kpHaPmsAcjmY5F91n
   D2IMnCsd5vT2lEjX201ZkF0h8RBqZYzhU+goT7JXGJstTFCR+D0pfTlLO
   lTFXai5KeRu+89rCIgphg+cxLe5khv9hUwDkL2iUrdRGGH+VS2q9dstxE
   Q==;
X-CSE-ConnectionGUID: 8npvvx+7QzWBwKBaEjzb9A==
X-CSE-MsgGUID: EKHkbFXmTfuMdZeu1F6slw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57829660"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57829660"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 15:20:52 -0700
X-CSE-ConnectionGUID: gDNrxXQXSNSnVg6S4V2Hww==
X-CSE-MsgGUID: J0+NOCL9SY6QLtIxaoL5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168378063"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.235])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 15:20:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4C39D11F8D4;
	Wed, 20 Aug 2025 01:20:47 +0300 (EEST)
Date: Wed, 20 Aug 2025 01:20:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/8] media: v4l2-common: Introduce v4l2-params.c
Message-ID: <aKT4vz-XeTgSo125@kekkonen.localdomain>
References: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
 <20250819-extensible-parameters-validation-v3-5-9dc008348b30@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-extensible-parameters-validation-v3-5-9dc008348b30@ideasonboard.com>

Hi Jacopo,

In the subject:

s/common/params/

On Tue, Aug 19, 2025 at 04:54:46PM +0200, Jacopo Mondi wrote:
> Add to the v4l2 framework an helper function to support drivers
> when validating a buffer of extensible parameters.
> 
> Introduce new types in include/media/v4l2-params.h that drivers shall
> use in order to comply with the v4l2-params validation procedure, and
> add a helper functions to v4l2-params.c to perform block and buffer
> validation.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  MAINTAINERS                           |   2 +
>  drivers/media/v4l2-core/Makefile      |   3 +-
>  drivers/media/v4l2-core/v4l2-params.c | 123 +++++++++++++++++++++++++
>  include/media/v4l2-params.h           | 165 ++++++++++++++++++++++++++++++++++
>  4 files changed, 292 insertions(+), 1 deletion(-)
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
> index 0000000000000000000000000000000000000000..8eeb12414c0981c13725a59d1668c5798b9fcf50
> --- /dev/null
> +++ b/drivers/media/v4l2-core/v4l2-params.c
> @@ -0,0 +1,123 @@
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

There's also hweight*(); up to you.

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
> +			if (!(block->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) ||
> +			      block->size != sizeof(*block)) {

You could merge the two conditions.

> +				dev_dbg(dev, "Invalid parameters block size\n");
> +				return -EINVAL;
> +			}
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
> index 0000000000000000000000000000000000000000..a8a4cc721bc4a51d8a6f9c7c009b34dfa3579229
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

Alphabetic order?

> +
> +#include <media/videobuf2-core.h>

Please use forward declarations instead of including the entire header
here.

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
> + */
> +int v4l2_params_blocks_validate(struct device *dev,
> +				const struct v4l2_params_buffer *buffer,
> +				const struct v4l2_params_handler *handlers,
> +				size_t num_handlers,
> +				v4l2_params_validate_block block_validate);
> +
> +#endif /* V4L2_PARAMS_H_ */
> 

-- 
Regards,

Sakari Ailus

