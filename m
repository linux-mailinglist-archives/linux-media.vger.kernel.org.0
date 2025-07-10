Return-Path: <linux-media+bounces-37298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D3EB002DB
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EEC04A58F5
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7B3270EAB;
	Thu, 10 Jul 2025 13:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="caf15gYc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEB01D540;
	Thu, 10 Jul 2025 13:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152677; cv=none; b=CXMGLnDRKa4r20NVbfCjGBUPPSkdcpZiWBECzDqidkcFK5+KZgALPX3axWkXWPpjJJJv2K25xpjBj79qRFi9Aez8IMrHCFRH6Chnuu7LAG0p182XuzXoqIi3S+Ej97S6KTAF52alD7ArcBzRCoE0GsUZcMtpRV5l6aZEwxDWTg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152677; c=relaxed/simple;
	bh=R2o6VolemiqIBI/AU6ABD4AF8DEA/SOLp1Y2k20X77E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGWuo1i/+uTQyZDH5mMvEu8Ku5buFzJZBg/g7AWhTF9WtBYN9S27TeBLj0EsgLyHhMM6pCAIyEzos2myY6iOdLxXHCHYXyVKYd7Rquy3dn3ShiFwnllG9B53qCvrYysv5HvgXXZkC8bULpSu5BC3jUqSPRCHOl7vKxlgaXLwFoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=caf15gYc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-137-205.net.vodafone.it [5.90.137.205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 697647E4;
	Thu, 10 Jul 2025 15:03:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752152642;
	bh=R2o6VolemiqIBI/AU6ABD4AF8DEA/SOLp1Y2k20X77E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=caf15gYcQXtgfw6ogGaAOQshKxH74EQL0avqxXX0OyZFd6dN1p0aqeLnhGovS8p5g
	 YCoR/x51v263YcZMLiJUnfhRxXXtRGY7frgpLZHl5seioSOS4AJjiPad1kVI8rGstw
	 w3YHz4yusYN2Or08wVpxLhjd+zTYAs4GyykBrkZU=
Date: Thu, 10 Jul 2025 15:04:20 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] media: v4l2-common: Introduce v4l2-params.c
Message-ID: <7wfgcfstaswdibsgswjwxnvt7njoxs4cwqdv7z67ymov4hj7ig@5bgxqqh3ixza>
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
 <20250708-extensible-parameters-validation-v1-5-9fc27c9c728c@ideasonboard.com>
 <76fc695d-facb-4207-a724-d97797d7d0c8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76fc695d-facb-4207-a724-d97797d7d0c8@ideasonboard.com>

Hi Dan

On Thu, Jul 10, 2025 at 01:42:39PM +0100, Dan Scally wrote:
> Hi Jacopo, thanks for the patchset
>
> On 08/07/2025 11:40, Jacopo Mondi wrote:
> > Add to the v4l2 framework an helper function to support drivers
> s/an helper function/helper functions
> > when validating a buffer of extensible parameters.
> >
> > Introduce new types in include/media/v4l2-params.h that driver shall
> s/driver/drivers
> > use in order to comply with the v4l2-params validation procedure, and
> > add a single helper function to v4l2-params.c.
> There's two functions?

Thanks, just a few minutes before I was about to send v2 :)

> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >   MAINTAINERS                           |   2 +
> >   drivers/media/v4l2-core/Makefile      |   3 +-
> >   drivers/media/v4l2-core/v4l2-params.c | 106 ++++++++++++++++++++++
> >   include/media/v4l2-params.h           | 166 ++++++++++++++++++++++++++++++++++
> >   4 files changed, 276 insertions(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index beecac86991d988c48d31366ba5201b09ef25715..3d9a8e06c59eb08360d1e8eea85e450a15ee95af 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25973,6 +25973,8 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >   L:	linux-media@vger.kernel.org
> >   S:	Maintained
> >   F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
> > +F:	drivers/media/v4l2-core/v4l2-params.c
> > +F:	include/media/v4l2-params.h
> >   F:	include/uapi/linux/media/v4l2-extensible-params.h
> >   VF610 NAND DRIVER
> > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > index 2177b9d63a8ffc1127c5a70118249a2ff63cd759..323330dd359f95c1ae3d0c35bd6fcb8291a33a07 100644
> > --- a/drivers/media/v4l2-core/Makefile
> > +++ b/drivers/media/v4l2-core/Makefile
> > @@ -11,7 +11,8 @@ tuner-objs	:=	tuner-core.o
> >   videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
> >   			v4l2-event.o v4l2-subdev.o v4l2-common.o \
> >   			v4l2-ctrls-core.o v4l2-ctrls-api.o \
> > -			v4l2-ctrls-request.o v4l2-ctrls-defs.o
> > +			v4l2-ctrls-request.o v4l2-ctrls-defs.o \
> > +			v4l2-params.o
> >   # Please keep it alphabetically sorted by Kconfig name
> >   # (e. g. LC_ALL=C sort Makefile)
> > diff --git a/drivers/media/v4l2-core/v4l2-params.c b/drivers/media/v4l2-core/v4l2-params.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3fb320aec900ee4a05c595f2e14c6ee0d8710669
> > --- /dev/null
> > +++ b/drivers/media/v4l2-core/v4l2-params.c
> > @@ -0,0 +1,106 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Video4Linux2 extensible parameters helpers
> > + *
> > + * Copyright (C) 2025 Ideas On Board Oy
> > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > + */
> > +
> > +#include <media/v4l2-params.h>
> > +
> > +int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
> > +				size_t max_size,
> > +				v4l2_params_validate_buffer buffer_validate)
> > +{
> > +	size_t header_size = offsetof(struct v4l2_params_buffer, data);
> > +	struct v4l2_params_buffer *buffer = vb2_plane_vaddr(vb, 0);
> > +	size_t payload_size = vb2_get_plane_payload(vb, 0);
> > +	size_t buffer_size;
> > +	int ret;
> > +
> > +	/* Payload size can't be greater than the destination buffer size */
> > +	if (payload_size > max_size) {
> > +		dev_dbg(dev, "Payload size is too large: %zu\n", payload_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Payload size can't be smaller than the header size */
> > +	if (payload_size < header_size) {
> > +		dev_dbg(dev, "Payload size is too small: %zu\n", payload_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Validate the size reported in the parameter buffer header */
> > +	buffer_size = header_size + buffer->data_size;
> > +	if (buffer_size != payload_size) {
> > +		dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
> > +			buffer_size, payload_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Driver-specific buffer validation. */
> > +	if (buffer_validate) {
> > +		ret = buffer_validate(dev, buffer);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_params_buffer_validate);
> > +
> > +int v4l2_params_blocks_validate(struct device *dev,
> > +				const struct v4l2_params_buffer *buffer,
> > +				const struct v4l2_params_handler *handlers,
> > +				size_t num_handlers,
> > +				v4l2_params_validate_block block_validate)
> > +{
> > +	size_t block_offset = 0;
> > +	size_t buffer_size;
> > +	int ret;
> > +
> > +	/* Walk the list of parameter blocks and validate them. */
> > +	buffer_size = buffer->data_size;
> > +	while (buffer_size >= sizeof(struct v4l2_params_block)) {
> > +		const struct v4l2_params_handler *handler;
> > +		const struct v4l2_params_block *block;
> > +
> > +		/* Validate block sizes and types against the handlers. */
> > +		block = (const struct v4l2_params_block *)
> > +			(buffer->data + block_offset);
> > +
> > +		if (block->type >= num_handlers) {
> > +			dev_dbg(dev, "Invalid parameters block type\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (block->size > buffer_size) {
> > +			dev_dbg(dev, "Premature end of parameters data\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		handler = &handlers[block->type];
> > +		if (block->size != handler->size) {
>
> In the C55 set I also check for just a header here:
>
>
> if (block->size != handler->size &&
>
>     block->size != sizeof(*block) {
>
>
> That way if all userspace wants to do is disable the block they can just
> fill in the header with the flags set appropriately. The handlers  of course
> need to be careful not to try to access past the header in that case.
>

I think that's right. Both the existing implementations in rkisp1 and
c3 allows that

rkisp1
 * When userspace simply wants to disable an ISP block the
 * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bit should be set in @flags field. The
 * driver ignores the rest of the block configuration structure in this case.

c3
 * When userspace wants to disable an ISP block the
 * C3_ISP_PARAMS_BLOCK_FL_DISABLED bit should be set in the @flags field. In
 * this case userspace may optionally omit the remainder of the configuration
 * block, which will be ignored by the driver.

So that's probably something we want to allow yes.

I'll take the suggestion in, thanks for checking





> > +			dev_dbg(dev, "Invalid parameters block size\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		/* Driver-specific per-block validation. */
> > +		if (block_validate) {
> > +			ret = block_validate(dev, block);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +
> > +		block_offset += block->size;
> > +		buffer_size -= block->size;
> > +	}
> > +
> > +	if (buffer_size) {
> > +		dev_dbg(dev, "Unexpected data after the parameters buffer end\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_params_blocks_validate);
> > diff --git a/include/media/v4l2-params.h b/include/media/v4l2-params.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..55f08c646a943fef11eaeddff842fae00b8422d4
> > --- /dev/null
> > +++ b/include/media/v4l2-params.h
> > @@ -0,0 +1,166 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Video4Linux2 extensible parameters helpers
> > + *
> > + * Copyright (C) 2025 Ideas On Board Oy
> > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > + */
> > +
> > +#ifndef V4L2_PARAMS_H_
> > +#define V4L2_PARAMS_H_
> > +
> > +#define _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
> > +#include <linux/media/v4l2-extensible-params.h>
> > +
> > +#include <linux/device.h>
> > +
> > +#include <media/videobuf2-core.h>
> > +
> > +/**
> > + * typedef v4l2_params_block_handler - V4L2 extensible format block handler
> > + * @arg: pointer the driver-specific argument
> s/pointer/pointer to
> > + * @block: the ISP configuration block to handle
> > + *
> > + * Defines the function signature of the functions that handle an ISP block
> > + * configuration.
> > + */
> > +typedef void (*v4l2_params_block_handler)(void *arg,
> > +					  const struct v4l2_params_block *block);
> > +
> > +/**
> > + * struct v4l2_params_handler - V4L2 extensible format handler
> > + * @size: the block expected size
> > + * @handler: the block handler function
> > + * @group: the device-specific group id the block belongs to (optional)
> > + * @features: the device-specific features flags (optional)
> > + *
> > + * The v4l2_params_handler defines the type that driver making use of the
> > + * V4L2 extensible parameters shall use to define their own ISP block
> > + * handlers.
> > + *
> > + * Drivers shall prepare a list of handlers, one for each supported ISP block
> > + * and correctly populate the structure's field with the expected block @size
> > + * (used for validation), a pointer to each block @handler function and an
> > + * optional @group and @feature flags, the driver can use to differentiate which
> > + * ISP blocks are present on the ISP implementation.
> > + *
> > + * The @group field is intended to be used as a bitmask of driver-specific
> > + * flags to allow the driver to setup certain blocks at different times. As an
> > + * example an ISP driver can divide its block handlers in "pre-configure" blocks
> > + * and "run-time" blocks and use the @group bitmask to identify the ISP blocks
> > + * that have to be pre-configured from the ones that only have to be handled at
> > + * run-time. The usage and definition of the @group field is totally
> > + * driver-specific.
> > + *
> > + * The @features flag can instead be used to differentiate between blocks
> > + * implemented in different revisions of the ISP design. In example some ISP
> > + * blocks might be present on more recent revision than others. Populating the
> > + * @features bitmask with the ISP/SoC machine identifier allows the driver to
> > + * correctly ignore the blocks not supported on the ISP revision it is running
> > + * on. As per the @group bitmask, the usage and definition of the @features
> > + * field is totally driver-specific.
> > + */
> > +struct v4l2_params_handler {
> > +	size_t size;
> > +	v4l2_params_block_handler handler;
> > +	unsigned int group;
> > +	unsigned int features;
> > +};
> > +
> > +/**
> > + * typedef v4l2_params_validate_buffer - V4L2 extensible parameters buffer
> > + *					 validation callback
> > + * @dev: the driver's device pointer (as passed by the driver to
> > + *	 v4l2_params_buffer_validate())
> > + * @buffer: the extensible parameters buffer
> > + *
> > + * Defines the function prototype for the driver's callback to perform
> > + * driver-specific validation on the extensible parameters buffer
> > + */
> > +typedef int (*v4l2_params_validate_buffer)(struct device *dev,
> > +					   const struct v4l2_params_buffer *buffer);
> > +
> > +/**
> > + * v4l2_params_buffer_validate - Validate a V4L2 extensible parameters buffer
> > + * @dev: the driver's device pointer
> > + * @vb: the videobuf2 buffer
> > + * @max_size: the maximum allowed buffer size
> > + * @buffer_validate: callback to the driver-specific buffer validation
> > + *
> > + * Helper function that performs validation of an extensible parameters buffer.
> > + *
> > + * The helper is meant to be used by drivers to perform validation of the
> > + * extensible parameters buffer size correctness.
> > + *
> > + * The @vb buffer as received from the vb2 .buf_prepare operation is checked
> > + * against @max_size and its validated to be large enough to accommodate at
> > + * least one ISP configuration block. The effective buffer size is compared
> > + * to the data size reported by @cfg to make sure they match.
> > + *
> > + * If provided, the @buffer_validate callback function is invoked to allow
> > + * drivers to perform driver-specific validation (such as checking that the
> > + * buffer version is supported).
> > + *
> > + * Drivers should use this function to validate the buffer size correctness
> > + * before performing a copy of the user-provided videobuf2 buffer content into a
> > + * kernel-only memory buffer to prevent userspace from modifying the buffer
> > + * content after it has been submitted to the driver.
> > + *.
> > + * Examples of users of this function can be found in
> > + * rkisp1_params_prepare_ext_params() and in c3_isp_params_vb2_buf_prepare().
> > + */
> > +int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
> > +				size_t max_size,
> > +				v4l2_params_validate_buffer buffer_validate);
> > +
> > +/**
> > + * typedef v4l2_params_validate_block - V4L2 extensible parameters block
> > + *					validation callback
> > + * @dev: the driver's device pointer (as passed by the driver to
> > + *	 v4l2_params_validate())
> > + * @block: the ISP configuration block to validate
> > + *
> > + * Defines the function prototype for the driver's callback to perform
> > + * driver-specific validation on each ISP block.
> > + */
> > +typedef int (*v4l2_params_validate_block)(struct device *dev,
> > +					  const struct v4l2_params_block *block);
> > +
> > +/**
> > + * v4l2_params_blocks_validate - Validate V4L2 extensible parameters ISP
> > + *				 configuration blocks
> > + * @dev: the driver's device pointer
> > + * @buffer: the extensible parameters configuration buffer
> > + * @handlers: the list of block handlers
> > + * @num_handlers: the number of block handlers
> > + * @block_validate: callback to the driver-specific per-block validation
> > + *		    function
> > + *
> > + * Helper function that performs validation of the ISP configuration blocks in
> > + * an extensible parameters buffer.
> > + *
> > + * The helper is meant to be used by drivers to perform validation of the
> > + * ISP configuration data blocks. For each block in the extensible parameters
> > + * buffer, its size and correctness are validated against its associated handler
> > + * in the @handlers list. Additionally, if provided, the @block_validate
> > + * callback is invoked on each block to allow drivers to perform driver-specific
> > + * validation.
> > + *
> > + * Drivers should to use this function to validate the ISP configuration blocks
> > + * after having validated the correctness of the vb2 buffer sizes by using the
> > + * v4l2_params_buffer_validate() helper first. Once the buffer size has been
> > + * validated, drivers should perform a copy of the user-provided buffer into a
> > + * kernel-only memory buffer @cfg to prevent userspace from modifying the buffer
> > + * content after it has been submitted to the driver, and then call this
> > + * function to perform per-block validation.
> > + *
> > + * Examples of users of this function can be found in
> > + * rkisp1_params_prepare_ext_params() and in c3_isp_params_vb2_buf_prepare().
> > + */
> > +int v4l2_params_blocks_validate(struct device *dev,
> > +				const struct v4l2_params_buffer *buffer,
> > +				const struct v4l2_params_handler *handlers,
> > +				size_t num_handlers,
> > +				v4l2_params_validate_block block_validate);
> > +
> > +#endif /* V4L2_PARAMS_H_ */
> >
>

