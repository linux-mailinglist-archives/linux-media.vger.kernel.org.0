Return-Path: <linux-media+bounces-37451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B892B01370
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 08:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0740544718
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 06:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE321D5CED;
	Fri, 11 Jul 2025 06:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SMUz1Llx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E3AA92E;
	Fri, 11 Jul 2025 06:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752214948; cv=none; b=AHni6Uq3BAm1yXZQTyqRWjWMd+5aBaE94EgWNGYtOqqHoYT5p2xOdzczxo01pD6aXA/OyNX7nt0Hr7/Yb62Sbo2fkdcVM8MHKMRdXHK8nXPtGmnW2gwslfWhEw76p0BrT0m65Kmn/4Qf4KlkTM46hjkCuBAaTrNOzdIVzVxtFa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752214948; c=relaxed/simple;
	bh=Qr/tu/MUy3g8DLiF28kYywEjEyxEvrphkT23hCYbHUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3REDUQg7Ldx11ekR6Y+XQLYkmbC081jdVBqfavb3y0itLliXgOtrGc0zw5/SjDkpILnXcpGMBJGQZ+vFDsINQ3oWub5XYk4kICPZZv0xZXXbPZBj5SlVzyRLSctmkOO+wDkYs2hvjyC3Da7KGcsehyuE1Asx/MIoHJ95qCzd9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SMUz1Llx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-137-205.net.vodafone.it [5.90.137.205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FC3D4A4;
	Fri, 11 Jul 2025 08:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752214914;
	bh=Qr/tu/MUy3g8DLiF28kYywEjEyxEvrphkT23hCYbHUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMUz1LlxMIRjHm8hbsOjl/OEPHATRkpGVPpWG6DZHnaBqZcy8nILFTxIUv2ygW8Qb
	 y+2pyRikqZB/KzqG1IrHgZk8c0tAN0RUjFiU+HjDnQGnhQ6V/t9dYc1aHmdb4B23JO
	 oQIwNR8kxyzZzIXfSgSuCv4vKUGTE8fGvR9aZvJ8=
Date: Fri, 11 Jul 2025 08:22:18 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/8] media: uapi: Introduce V4L2 extensible params
Message-ID: <z3zfobgsw4jltsescfvrlgpjg5skagrdiehhsdjsl6qjnyhye3@wpnhbt5vesnt>
References: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
 <20250710-extensible-parameters-validation-v2-1-7ec8918ec443@ideasonboard.com>
 <8fee18e6-9955-4b51-8b6b-e70029ec47eb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fee18e6-9955-4b51-8b6b-e70029ec47eb@ideasonboard.com>

Hi Dan

On Thu, Jul 10, 2025 at 03:49:30PM +0100, Dan Scally wrote:
> Hi Jacopo
>
> On 10/07/2025 14:52, Jacopo Mondi wrote:
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
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >   MAINTAINERS                                       |   6 +
> >   include/uapi/linux/media/v4l2-extensible-params.h | 144 ++++++++++++++++++++++
> >   2 files changed, 150 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 658543062bba3b7e600699d7271ffc89250ba7e5..49a9329e5fe8874bdbaca13946ea28bd80134cb3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25968,6 +25968,12 @@ F:	drivers/media/i2c/vd55g1.c
> >   F:	drivers/media/i2c/vd56g3.c
> >   F:	drivers/media/i2c/vgxy61.c
> > +V4L2 EXTENSIBLE PARAMETERS FORMAT
> > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	include/uapi/linux/media/v4l2-extensible-params.h
> > +
> >   VF610 NAND DRIVER
> >   M:	Stefan Agner <stefan@agner.ch>
> >   L:	linux-mtd@lists.infradead.org
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
>
>
> Actually I wonder if a "V4L2_PARAMS_BLOCK_FL_NONE    0" is worthwhile to clear them explicitly?
>

Personally I wouldn't but if that's desired I can add it!

> > +
> > +/*
> > + * Reserve the first 8 bits for V4L2_PARAMS_FL_* flag. Platform-specific flags
> > + * should be defined as:
> > + * #define PLATFORM_SPECIFIC_FLAG0	((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(0))
> > + * #define PLATFORM_SPECIFIC_FLAG1	((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(1))
> > + */
> > +#define V4L2_PARAMS_FL_PLATFORM_FLAGS(n)	((n) << 8)
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
> > +};
> > +
> > +#endif /* _UAPI_V4L2_PARAMS_H_ */
> >

