Return-Path: <linux-media+bounces-40346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA29BB2D5E0
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53FB25E3B36
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 08:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BCA2D94B8;
	Wed, 20 Aug 2025 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ckZCzp/V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E4021B9FD;
	Wed, 20 Aug 2025 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755677679; cv=none; b=lDDZJHBhIIU2h/EspUeXQE/rCyUkkZvSmJd0gzmQl+FlIkc0+V2w+0IXTtdVaGu9vsRZKaL0FRAXSxjkVhES283otdR64ERT+1wXJWypTTIee8Fn8UW3mLnQZlih0ahYGvsfMMHbsm4e/+5WmlqVP5v+4AT4Wc5zh14Zyl2QW+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755677679; c=relaxed/simple;
	bh=b6AtRuuA1TXkxxwL5R1M9uifXTiUHK8TAQNwC7mBoN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCrFiEUq538RK5Cfp9QHMuQpuHXko+cE4ja5Vc/9Ld0A0sadlRYfy03JmAPgeXbw0za+qIGH5l2jB1K2IFzh0htOVHSYhPfuBM+T1QMn2WigI/s7xAiuMbVovILs5SF/AGI8ZCRBuUNzLSduxG5F14vO2VHgzsWeOUmcYr2KBds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ckZCzp/V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-62-213.net.vodafone.it [5.90.62.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59AD9C1;
	Wed, 20 Aug 2025 10:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755677609;
	bh=b6AtRuuA1TXkxxwL5R1M9uifXTiUHK8TAQNwC7mBoN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckZCzp/V9Zn36VMtZYp5vwEAwqMfkfrpxJRMD7Z+sMU5U7Sc3h+gcaRLyLdlNthTA
	 wzdeKzE2qC83ePNN/HsF+dnctQrC7g/mufBDPBFRmPN79hnJnVnttUmGOo4tNfxoTl
	 QRY2ndvyOyRyUQR3McogTwKeK0YUEZrlyqsqJ/gE=
Date: Wed, 20 Aug 2025 10:14:25 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/8] media: uapi: Introduce V4L2 extensible params
Message-ID: <agdhonmdt65z64akognraphaikdjmqs4bi4hodrmeeyblrybmr@r4id3zou6ecz>
References: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
 <20250819-extensible-parameters-validation-v3-1-9dc008348b30@ideasonboard.com>
 <aKT1vgHkdc98zOyC@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKT1vgHkdc98zOyC@kekkonen.localdomain>

Hi Sakari

On Wed, Aug 20, 2025 at 01:07:58AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thank you for working on this.
>

Thanks for the quick review

> On Tue, Aug 19, 2025 at 04:54:42PM +0200, Jacopo Mondi wrote:
> > Introduce v4l2-extensible-params.h in the Linux kernel uAPI.
> >
> > The header defines two types that all drivers that use the extensible
> > parameters format for ISP configuration shall use to build their own
> > format versions.
> >
> > The newly introduce type v4l2_params_block represent the
> > header to be prepend to each ISP configuration block and the
> > v4l2_params_buffer type represent the base type for the configuration
> > parameters buffer.
> >
> > The v4l2_params_buffer represents the container for the ISP
> > configuration data block. The generic type is defined with a 0-sized
> > data block that specific ISP implementation shall properly size
> > according to their capabilities.
> >
> > [Add v4l2_params_buffer_size()]
> >
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  MAINTAINERS                                       |   6 +
> >  include/uapi/linux/media/v4l2-extensible-params.h | 144 ++++++++++++++++++++++
> >  2 files changed, 150 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fe168477caa45799dfe07de2f54de6d6a1ce0615..67216d1e92d7ac81617bb3c4329e4096aa205706 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26380,6 +26380,12 @@ F:	drivers/media/i2c/vd55g1.c
> >  F:	drivers/media/i2c/vd56g3.c
> >  F:	drivers/media/i2c/vgxy61.c
> >
> > +V4L2 EXTENSIBLE PARAMETERS FORMAT
> > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	include/uapi/linux/media/v4l2-extensible-params.h
> > +
> >  VF610 NAND DRIVER
> >  M:	Stefan Agner <stefan@agner.ch>
> >  L:	linux-mtd@lists.infradead.org
> > diff --git a/include/uapi/linux/media/v4l2-extensible-params.h b/include/uapi/linux/media/v4l2-extensible-params.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..ace89299a4b37e428c0bc9a72fbc079b1dcda91a
> > --- /dev/null
> > +++ b/include/uapi/linux/media/v4l2-extensible-params.h
> > @@ -0,0 +1,144 @@
> > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
> > +/*
> > + * Video4Linux2 extensible configuration parameters base types
> > + *
> > + * Copyright (C) 2025 Ideas On Board Oy
> > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > + */
> > +
> > +#ifndef _UAPI_V4L2_PARAMS_H_
> > +#define _UAPI_V4L2_PARAMS_H_
> > +
> > +#include <linux/types.h>
> > +
> > +#define V4L2_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> > +#define V4L2_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
> > +
> > +/*
> > + * Reserve the first 8 bits for V4L2_PARAMS_FL_* flag. Platform-specific flags
> > + * should be defined as:
> > + * #define PLATFORM_SPECIFIC_FLAG0	((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(0))
> > + * #define PLATFORM_SPECIFIC_FLAG1	((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(1))
>
> How many bits are you shifting left here again?

More than what I wanted to

The shift in V4L2_PARAMS_FL_PLATFORM_FLAGS is a leftover from a
previous version, sorry about that

>
> > + */
> > +#define V4L2_PARAMS_FL_PLATFORM_FLAGS(n)	((n) << 8)
>
> n really needs to be unsigned.

Any idea how to guarantee that ?

I think I will:

#define V4L2_PARAMS_FL_PLATFORM_FLAGS(n)	((n) + 8)

So that users can:

 * #define PLATFORM_SPECIFIC_FLAG0	((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(0))
 * #define PLATFORM_SPECIFIC_FLAG1	((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(1))

>
> > +
> > +/**
> > + * struct v4l2_params_block_header - V4L2 extensible parameters block header
> > + *
> > + * This structure represents the common part of all the ISP configuration
> > + * blocks. Each parameters block shall embed an instance of this structure type
> > + * as its first member, followed by the block-specific configuration data. The
> > + * driver inspects this common header to discern the block type and its size and
> > + * properly handle the block content by casting it to the correct block-specific
> > + * type.
> > + *
> > + * The @type field is one of the values enumerated by each platform-specific ISP
> > + * block types which specifies how the data should be interpreted by the driver.
> > + * The @size field specifies the size of the parameters block and is used by the
> > + * driver for validation purposes.
> > + *
> > + * The @flags field is a bitmask of per-block flags V4L2_PARAMS_FL_* and
> > + * platform-specific flags specified by the platform-specific header.
> > + *
> > + * Documentation of the platform-specific flags handling is specified by the
> > + * platform-specific block header type:
> > + *
> > + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_block_type`
> > + * - Amlogic C3: :c:type:`c3_isp_params_block_type`
> > + *
> > + * Userspace is responsible for correctly populating the parameters block header
> > + * fields (@type, @flags and @size) and the block-specific parameters.
> > + *
> > + * @type: The parameters block type (platform-specific)
> > + * @flags: A bitmask of block flags (platform-specific)
> > + * @size: Size (in bytes) of the parameters block, including this header
> > + */
> > +struct v4l2_params_block_header {
> > +	__u16 type;
> > +	__u16 flags;
> > +	__u32 size;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * v4l2_params_buffer_size - Calculate size of v4l2_params_buffer for a platform
> > + *
> > + * Users of the v4l2 extensible parameters will have differing sized data arrays
> > + * depending on their specific parameter buffers. Drivers and userspace will
> > + * need to be able to calculate the appropriate size of the struct to
> > + * accommodate all ISP configuration blocks provided by the platform.
> > + * This macro provides a convenient tool for the calculation.
> > + *
> > + * Each driver shall provide a definition of their extensible parameters
> > + * implementation data buffer size. As an example:
> > + *
> > + * #define PLATFORM_BLOCKS_MAX_SIZE		\
> > + *	sizeof(platform_block_0)	+	\
> > + *	sizeof(platform_block_1)
> > + *
> > + * #define PLATFORM_BUFFER_SIZE			\
> > + *	v4l2_params_buffer_size(PLATFORM_BLOCKS_MAX_SIZE)
> > + *
> > + * Drivers are then responsible for allocating buffers of the proper size
> > + * by assigning PLATFORM_BUFFER_SIZE to the per-plane size of the videobuf2
> > + * .queue_setup() operation and userspace shall use PLATFORM_BUFFER_SIZE
> > + * when populating the ISP configuration data buffer.
> > + *
> > + * @max_params_size: The total size of the ISP configuration blocks
> > + */
> > +#define v4l2_params_buffer_size(max_params_size) \
> > +	(offsetof(struct v4l2_params_buffer, data) + (max_params_size))
> > +
> > +/**
> > + * struct v4l2_params_buffer - V4L2 extensible parameters configuration
> > + *
> > + * This struct contains the configuration parameters of the ISP algorithms,
> > + * serialized by userspace into a data buffer. Each configuration parameter
> > + * block is represented by a block-specific structure which contains a
> > + * :c:type:`v4l2_params_block_header` entry as first member. Userspace populates
> > + * the @data buffer with configuration parameters for the blocks that it intends
> > + * to configure. As a consequence, the data buffer effective size changes
> > + * according to the number of ISP blocks that userspace intends to configure and
> > + * is set by userspace in the @data_size field.
> > + *
> > + * The parameters buffer is versioned by the @version field to allow modifying
> > + * and extending its definition. Userspace shall populate the @version field to
> > + * inform the driver about the version it intends to use. The driver will parse
> > + * and handle the @data buffer according to the data layout specific to the
> > + * indicated version and return an error if the desired version is not
> > + * supported.
> > + *
> > + * For each ISP block that userspace wants to configure, a block-specific
> > + * structure is appended to the @data buffer, one after the other without gaps
> > + * in between nor overlaps. Userspace shall populate the @data_size field with
> > + * the effective size, in bytes, of the @data buffer.
> > + *
> > + * Drivers shall take care of properly sizing of the extensible parameters
> > + * buffer @data array. The v4l2_params_buffer type is defined with a
> > + * flexible-array-member at the end, which resolves to a size of 0 bytes when
> > + * inspected with sizeof(struct v4l2_params_buffer). This of course is not
> > + * suitable for neither buffer allocation in the kernel driver nor for proper
> > + * handling in userspace of the @data buffer it has to populate.
> > + *
> > + * Drivers using this type in their userspace API definition are responsible
> > + * for providing the exact definition of the @data buffer size using the
> > + * v4l2_params_buffer_size() macro. The size shall be used
> > + * by the driver for buffers allocation and by userspace for populating the
> > + * @data buffer before queueing it to the driver
> > + *
> > + * Drivers that were already using extensible-parameters before the introduction
> > + * of this file define their own type-convertible implementation of this
> > + * type, see:
> > + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_cfg`
> > + * - Amlogic C3: :c:type:`c3_isp_params_cfg`
> > + *
> > + * @version: The parameters buffer version (platform-specific)
> > + * @data_size: The configuration data effective size, excluding this header
> > + * @data: The configuration data
> > + */
> > +struct v4l2_params_buffer {
> > +	__u32 version;
> > +	__u32 data_size;
> > +	__u8 data[];
>
> Would __attribute__((__counted_by__(data_size))) be problematic here?

Nice, didn't know about that. Read a bit through [1] and [2] and
there's one thing that it is not clear to me:

From [2]:

* 'p->array' has _at least_ 'p->count' number of elements
  available all the time.  This relationship must hold even
  after any of these related objects are updated during the
  program.

I wonder what "number of elements available all the time" means. It is
simply about the fact that the allocated space that follows the
flexible array member should be larger that the p->count value ?

I played a bit with __counted__by() and it seems to be the the case.

[1] https://embeddedor.com/blog/2024/06/18/how-to-use-the-new-counted_by-attribute-in-c-and-linux/
[2] https://gcc.gnu.org/pipermail/gcc-patches/2024-May/653123.html
>
> Perhaps not now but it could be added later on?

I do expect applications in user-space that populates an extensible
parameters buffer to:

1) Operate on a large-enough data[] as the driver allocates the buffer
on their behalf using the per-platform MAX_SIZE (see
RKISP1_EXT_PARAMS_MAX_SIZE in example)

2) Populate the data[] array one block at the time. They can update
data_size easily before accessing data[]

So I presume we could as well add it right away ?

>
> > +};
> > +
> > +#endif /* _UAPI_V4L2_PARAMS_H_ */
> >
>
> --
> Kind regards,
>
> Sakari Ailus

