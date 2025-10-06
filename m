Return-Path: <linux-media+bounces-43793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 736CDBBE6BE
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 17:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 539484EB94C
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 15:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8DB2D6E6E;
	Mon,  6 Oct 2025 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZA12634j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8FE2D738E;
	Mon,  6 Oct 2025 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759762812; cv=none; b=uxrhuQ0pcSOFOcu+R10mikqUx+xQqpmnX/9WoIk5A59mlvcyfwu5F94TBp7xa06YYf2mY/H2zREJUpML5EmoSYKWYN0fPG2L2DRHJ1ETQ5VO1PWLVx+wCRg9n0QQekGf+Lxsalhj9NAqCf2umYCIu3l5W1uAe8/Tp+e0W/rE8D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759762812; c=relaxed/simple;
	bh=46J1PPuvG8Gm4UhljYx+4lHnM1HtO2zBmP19JPtdw1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIppZHxcxcLMqo2jywgFSzgGwXhJnNSWRyRefruKiM9PLLskP6Or/KZcP2GLcmzNXu7h+dflMPXpGj2jMDWlJnWD14m+ozr86hC9ySfbzKdN3NmEPkMH/TYfRip5bZDJbWboaXQyKoTPzBaHwoWssJmaGc6bMskeG3Y/x03fzjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZA12634j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9D60B0B;
	Mon,  6 Oct 2025 16:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759762713;
	bh=46J1PPuvG8Gm4UhljYx+4lHnM1HtO2zBmP19JPtdw1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZA12634j1YDlCN2699XCLG6/lYx3E4/ky/Dg5EjoUFUzUhcFY+FFsrU5AwJiNbSY/
	 JN9vTldoYXYHVNQriyjbGMLezz9SzseCYP3LLprkeDyChfbdCxGU1RXGC46TNDkexN
	 E6RpMpvksUf91TjfS1uH/PejWam914fcy+0UzEYI=
Date: Mon, 6 Oct 2025 17:00:02 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Keke Li <keke.li@amlogic.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Dan Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Antoine Bouyer <antoine.bouyer@nxp.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/8] media: v4l2-core: Introduce v4l2-isp.c
Message-ID: <oxdz45eeadwm3ok5cddqbgshj4xlnllm6qvtajnbr4lbcpj7eh@h3ysovvnrjbw>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
 <20250915-extensible-parameters-validation-v5-5-e6db94468af3@ideasonboard.com>
 <20251006004741.GA29231@pendragon.ideasonboard.com>
 <20251006010806.GB3305@pendragon.ideasonboard.com>
 <ylea2fwhdzpo6fqkgk4g5frlriiawd5lyn6vjbghcmswfmy7hq@j7jksyyjkzkb>
 <20251006145146.GG5944@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251006145146.GG5944@pendragon.ideasonboard.com>

On Mon, Oct 06, 2025 at 05:51:46PM +0300, Laurent Pinchart wrote:
> On Mon, Oct 06, 2025 at 12:28:01PM +0200, Jacopo Mondi wrote:
> > On Mon, Oct 06, 2025 at 04:08:06AM +0300, Laurent Pinchart wrote:
> > > On Mon, Oct 06, 2025 at 03:47:43AM +0300, Laurent Pinchart wrote:
> > > > On Mon, Sep 15, 2025 at 07:18:14PM +0200, Jacopo Mondi wrote:
> > > > > Add to the v4l2 framework helper functions to support drivers
> > > >
> > > > s/v4l2/V4L2/
> > > >
> > > > > when validating a buffer of extensible ISP parameters.
> > > > >
> > > > > Introduce new types in include/media/v4l2-isp.h that drivers shall use
> > > > > in order to comply with the generic ISP parameters validation procedure,
> > > > > and add helper functionss to v4l2-isp.c to perform blocks and buffer
> > > > > validation.
> > > > >
> > > > > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > ---
> > > > >  MAINTAINERS                        |   2 +
> > > > >  drivers/media/v4l2-core/Kconfig    |   4 ++
> > > > >  drivers/media/v4l2-core/Makefile   |   1 +
> > > > >  drivers/media/v4l2-core/v4l2-isp.c | 108 +++++++++++++++++++++++++++++++++++++
> > > > >  include/media/v4l2-isp.h           | 100 ++++++++++++++++++++++++++++++++++
> > > > >  5 files changed, 215 insertions(+)
> > > > >
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index abba872cb63f1430a49a2afbace4b9f9958c3991..5e0e4208ebe6c58a9ea0834e1ebb36abd2de06e1 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -26415,6 +26415,8 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > >  L:	linux-media@vger.kernel.org
> > > > >  S:	Maintained
> > > > >  F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
> > > > > +F:	drivers/media/v4l2-core/v4l2-isp.c
> > > > > +F:	include/media/v4l2-isp.h
> > > > >  F:	include/uapi/linux/media/v4l2-isp.h
> > > > >
> > > > >  VF610 NAND DRIVER
> > > > > diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> > > > > index 331b8e535e5bbf33f22638b2ae8bc764ad5fc407..d50ccac9733cc39a43426ae7e7996dd0b5b45186 100644
> > > > > --- a/drivers/media/v4l2-core/Kconfig
> > > > > +++ b/drivers/media/v4l2-core/Kconfig
> > > > > @@ -82,3 +82,7 @@ config V4L2_CCI_I2C
> > > > >  	depends on I2C
> > > > >  	select REGMAP_I2C
> > > > >  	select V4L2_CCI
> > > > > +
> > > > > +config V4L2_ISP
> > > > > +	tristate
> > > > > +	depends on VIDEOBUF2_CORE
> > > > > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > > > > index 2177b9d63a8ffc1127c5a70118249a2ff63cd759..329f0eadce994cc1c8580beb435f68fa7e2a7aeb 100644
> > > > > --- a/drivers/media/v4l2-core/Makefile
> > > > > +++ b/drivers/media/v4l2-core/Makefile
> > > > > @@ -29,6 +29,7 @@ obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
> > > > >  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
> > > > >  obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
> > > > >  obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
> > > > > +obj-$(CONFIG_V4L2_ISP) += v4l2-isp.o
> > > > >  obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
> > > > >  obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
> > > > >  obj-$(CONFIG_V4L2_VP9) += v4l2-vp9.o
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..e350bdaf53b5502e1ec2a4989c20df1100ab2d2a
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/v4l2-core/v4l2-isp.c
> > > > > @@ -0,0 +1,108 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > > +/*
> > > > > + * Video4Linux2 generic ISP parameters and statistics support
> > > > > + *
> > > > > + * Copyright (C) 2025 Ideas On Board Oy
> > > > > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > + */
> > > > > +
> > > > > +#include <linux/bitops.h>
> > > > > +#include <linux/device.h>
> > > > > +
> > > > > +#include <media/videobuf2-core.h>
> > > > > +#include <media/v4l2-isp.h>
> > > >
> > > > v4l2-isp goes first.
> > > >
> > > > > +
> > > > > +int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
> > > > > +				size_t max_size)
> > > > > +{
> > > > > +	size_t header_size = offsetof(struct v4l2_params_buffer, data);
> > > > > +	struct v4l2_params_buffer *buffer = vb2_plane_vaddr(vb, 0);
> > > > > +	size_t payload_size = vb2_get_plane_payload(vb, 0);
> > > > > +	size_t buffer_size;
> > > > > +
> > > > > +	/* Payload size can't be greater than the destination buffer size */
> > > > > +	if (payload_size > max_size) {
> > > > > +		dev_dbg(dev, "Payload size is too large: %zu\n", payload_size);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	/* Payload size can't be smaller than the header size */
> > > > > +	if (payload_size < header_size) {
> > > > > +		dev_dbg(dev, "Payload size is too small: %zu\n", payload_size);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	/* Validate the size reported in the parameter buffer header */
> > > > > +	buffer_size = header_size + buffer->data_size;
> > > > > +	if (buffer_size != payload_size) {
> > > > > +		dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
> > > > > +			buffer_size, payload_size);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > >
> > > > This check needs to go to v4l2_params_blocks_validate() as it has to be
> > > > performed on the data after copying.
> > > >
> >
> > I'm not sure. The aim of pre-validation (if we want to call it in this
> > way) is to check the correctness of the userspace provided buffer, and
> > the function as its main argument the vb2 buffer pointer for this
> > reason.
> >
> > Isn't it important to check that the sizes are correct before doing a
> > mem copy ?
>
> This check reads buffer->data_size. It can be modified by userspace
> after the check and before doing the copy, which will lead to an invalid
> value being used in v4l2_params_blocks_validate(). Pre-copy validation
> can't use anything from within the buffer.

The helper is intended to be called in the .buf_prepare callback,
which is in the QBUF ioctl call path. Is there a window where
userspace could modify the buffer during the ioctl call ?

>
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(v4l2_params_buffer_validate);
> > > > > +
> > > > > +int v4l2_params_blocks_validate(struct device *dev,
> > > > > +				const struct v4l2_params_buffer *buffer,
> > > > > +				const struct v4l2_params_handler *handlers,
> > > > > +				size_t num_handlers)
> >
> > While the actual "validation" checks the content of v4l2_params_buffer
> > after it has been copied to a kernel-only memory location. If I would
> > have to check its size I would have to receive here the vb2 buffer size
> > as argument (which the drivers should have just used as argument to
> > the memcpy). It feels a bit mixing two things (that's also why I liked
> > having a 'buffer validate' and a 'blocks validate' function, but I
> > won't argue)
> >

Could you provide then the design for a nice interface where the vb2
buffer size can be passed to this function if validation of the vb2
buffer size should be moved here ?

> > > > > +{
> > > > > +	size_t block_offset = 0;
> > > > > +	size_t buffer_size;
> > > > > +
> > > > > +	/* Walk the list of parameter blocks and validate them. */
> > > > > +	buffer_size = buffer->data_size;
> > > > > +	while (buffer_size >= sizeof(struct v4l2_params_block_header)) {
> > > > > +		const struct v4l2_params_handler *handler;
> > > > > +		const struct v4l2_params_block_header *block;
> > > > > +
> > > > > +		/* Validate block sizes and types against the handlers. */
> > > > > +		block = (const struct v4l2_params_block_header *)
> > > > > +			(buffer->data + block_offset);
> > > > > +
> > > > > +		if (block->type >= num_handlers) {
> > > > > +			dev_dbg(dev, "Invalid parameters block type\n");
> > > >
> > > > I'd print the type and offset in the message to ease debugging.
> > > >
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > > +
> > > > > +		if (block->size > buffer_size) {
> > > > > +			dev_dbg(dev, "Premature end of parameters data\n");
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > > +
> > > > > +		/* It's invalid to specify both ENABLE and DISABLE. */
> > > > > +		if ((block->flags & (V4L2_PARAMS_FL_BLOCK_ENABLE |
> > > > > +				     V4L2_PARAMS_FL_BLOCK_DISABLE)) ==
> > > > > +		     (V4L2_PARAMS_FL_BLOCK_ENABLE |
> > > > > +		     V4L2_PARAMS_FL_BLOCK_DISABLE)) {
> > > > > +			dev_dbg(dev, "Invalid parameters block flags\n");
> > > >
> > > > Same here (print the flags and offset).
> > > >
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > > +
> > > > > +		/*
> > > > > +		 * Match the block reported size against the handler's expected
> > > > > +		 * one, but allow the block to only contain the header in
> > > > > +		 * case it is going to be disabled.
> > > > > +		 */
> > > > > +		handler = &handlers[block->type];
> > > > > +		if (block->size != handler->size &&
> > > > > +		    (!(block->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) ||
> > > > > +		    block->size != sizeof(*block))) {
> > > > > +			dev_dbg(dev, "Invalid parameters block size\n");
> > > >
> > > > And here too (print the size and offset).
> > > >
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > > +
> > > > > +		block_offset += block->size;
> > > > > +		buffer_size -= block->size;
> > > > > +	}
> > > > > +
> > > > > +	if (buffer_size) {
> > > > > +		dev_dbg(dev, "Unexpected data after the parameters buffer end\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(v4l2_params_blocks_validate);
> > > > > diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..2ad62c6169eef3d0fb8d245de56cc6bd7e6227e4
> > > > > --- /dev/null
> > > > > +++ b/include/media/v4l2-isp.h
> > > > > @@ -0,0 +1,100 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > > > +/*
> > > > > + * Video4Linux2 generic ISP parameters and statistics support
> > > > > + *
> > > > > + * Copyright (C) 2025 Ideas On Board Oy
> > > > > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > + */
> > > > > +
> > > > > +#ifndef V4L2_PARAMS_H_
> > > > > +#define V4L2_PARAMS_H_
> > > >
> > > > V4L2_ISP_H_
> > > >
> > > > > +
> > > > > +#include <linux/media/v4l2-isp.h>
> > > > > +
> > > > > +struct device;
> > > > > +struct vb2_buffer;
> > > > > +
> > > > > +/**
> > > > > + * typedef v4l2_params_block_handler - V4L2 extensible format block handler
> > > >
> > > > As commented on 1/8, let's use the v4l2_isp_ prefix.
> > > >
> > > > > + * @arg: pointer the driver-specific argument
> > > > > + * @block: the ISP configuration block to handle
> > > > > + *
> > > > > + * Defines the function signature of the functions that handle an ISP block
> > > > > + * configuration.
> > > > > + */
> > > > > +typedef void (*v4l2_params_block_handler)(void *arg,
> > > > > +					  const struct v4l2_params_block_header *block);
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_params_handler - V4L2 extensible format handler
> > > > > + * @size: the block expected size
> > > > > + * @handler: the block handler function
> > > > > + *
> > > > > + * The v4l2_params_handler defines the type that driver making use of the
> > > > > + * V4L2 extensible parameters shall use to define their own ISP block
> > > > > + * handlers.
> > > > > + *
> > > > > + * Drivers shall prepare a list of handlers, one for each supported ISP block
> > > > > + * and correctly populate the structure's field with the expected block @size
> > > > > + * (used for validation) and a pointer to each block @handler function.
> > > > > + */
> > > > > +struct v4l2_params_handler {
> > > > > +	size_t size;
> > > > > +	v4l2_params_block_handler handler;
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * v4l2_params_buffer_validate - Validate a V4L2 extensible parameters buffer
> > > >
> > > > As this is the pre-copy validation, what would you think of calling the
> > > > function v4l2_isp_params_pre_validate_buffer() ? The next function would
> > > > be called v4l2_isp_params_validate_buffer(), as they're both about
> > > > buffer validation. I'm also OK to keep the current names (with a
> > > > v4l2_isp_ prefix).
> > > >
> > > > I'm also thinking that the copy could be moved to the helper, but it can
> > > > be done later.
> > > >
> > > > > + * @dev: the driver's device pointer
> > > > > + * @vb: the videobuf2 buffer
> > > > > + * @max_size: the maximum allowed buffer size
> > > > > + * @buffer_validate: callback to the driver-specific buffer validation
> > > >
> > > > You forgot to drop the documentation for this argument.
> > > >
> > > > > + *
> > > > > + * Helper function that performs validation of an extensible parameters buffer.
> > > > > + *
> > > > > + * The helper is meant to be used by drivers to perform validation of the
> > > > > + * extensible parameters buffer size correctness.
> > > > > + *
> > > > > + * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
> > > > > + * against @max_size and its validated to be large enough to accommodate at
> > > > > + * least one ISP configuration block. The effective buffer size is compared
> > > > > + * with the reported data size to make sure they match.
> > > > > + *
> > > > > + * Drivers should use this function to validate the buffer size correctness
> > > > > + * before performing a copy of the user-provided videobuf2 buffer content into a
> > > > > + * kernel-only memory buffer to prevent userspace from modifying the buffer
> > > > > + * content after it has been submitted to the driver.
> > > > > + */
> > > > > +int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
> > > > > +				size_t max_size);
> > > > > +
> > > > > +/**
> > > > > + * v4l2_params_blocks_validate - Validate V4L2 extensible parameters ISP
> > > > > + *				 configuration blocks
> > > > > + * @dev: the driver's device pointer
> > > > > + * @buffer: the extensible parameters configuration buffer
> > > > > + * @handlers: the list of block handlers
> > > >
> > > > array of block handlers
> > > >
> > > > > + * @num_handlers: the number of block handlers
> > > > > + *
> > > > > + * Helper function that performs validation of the ISP configuration blocks in
> > > > > + * an extensible parameters buffer.
> > > > > + *
> > > > > + * The helper is meant to be used by drivers to perform validation of the
> > > > > + * ISP configuration data blocks. For each block in the extensible parameters
> > > > > + * buffer, its size and correctness are validated against its associated handler
> > > > > + * in the @handlers list.
> > > >
> > > > You need to explain somewhere that the handlers array is indexed by
> > > > block type.
> > > >
> > > > > + *
> > > > > + * Drivers should use this function to validate the ISP configuration blocks
> > > > > + * after having validated the correctness of the vb2 buffer sizes by using the
> > > > > + * v4l2_params_buffer_validate() helper first. Once the buffer size has been
> > > > > + * validated, drivers should perform a copy of the user-provided buffer into a
> > > > > + * kernel-only memory buffer to prevent userspace from modifying the buffer
> > > > > + * content after it has been submitted to the driver, and then call this
> > > > > + * function to perform per-block validation.
> > > >
> > > > There's room for improvement in the documentation. I think it would be
> > > > clearer if you explained the big picture in
> > > > Documentation/userspace-api/media/v4l/extensible-parameters.rst
> > >
> > > My bad, that should be Documentation/driver-api/media/v4l2-isp.rst.
> > >
> > > > (pre-validation, copy and post-validation), and only focussed on what
> > > > those two functions do in their kerneldoc. That can be done later,
> > > > nothing that you say here is incorrect.
> > > >
> > > > With the other comments addressed,
> > > >
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > >
> > > > > + */
> > > > > +int v4l2_params_blocks_validate(struct device *dev,
> > > > > +				const struct v4l2_params_buffer *buffer,
> > > > > +				const struct v4l2_params_handler *handlers,
> > > > > +				size_t num_handlers);
> > > > > +
> > > > > +#endif /* V4L2_PARAMS_H_ */
>
> --
> Regards,
>
> Laurent Pinchart
>

