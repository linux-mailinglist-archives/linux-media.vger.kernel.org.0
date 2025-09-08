Return-Path: <linux-media+bounces-41960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B4DB4856D
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3761417C751
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 07:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C692E7F2C;
	Mon,  8 Sep 2025 07:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UGJgzRdV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2452E2DDD;
	Mon,  8 Sep 2025 07:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316959; cv=none; b=EGf00aZZHqzn/DYDbs6pb0egnM0te+lK3WEWUiYQU2p42YT/pG1A0GIuZDLb4refd54OK/JCPfKxErLkRV7whPZgOjlmqOlFcfQdiOFaFAQQhlnCwO21PIFuLxYFXk5GHIXygFIS7sXazjCgmRUtkhiB5Cw5QaEK7i9Lw8DtaLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316959; c=relaxed/simple;
	bh=bcRCmFlg5SOPgDN+bOPwmmHJztDkdYthhsyUM1TV+dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/+AKNA5iuU8Fqy49J3ez3WmTnM5qIP9EFp7UJC6EZM68ssQ2S+4FGD0Lq6y1vvXrQCgKTOdAPHxzi1/nxCcHy+eAkH5zTj8sGuIRyxfqnkKGOxYboOcqolvr6ydXYXEnGtz+DPO3ESwkPLcKRGh6vwzNL7FMaSgmQYbH+qTrAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UGJgzRdV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2046F520;
	Mon,  8 Sep 2025 09:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757316883;
	bh=bcRCmFlg5SOPgDN+bOPwmmHJztDkdYthhsyUM1TV+dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGJgzRdVUwPFtBgFroIVWgH0NewDne1KlizfDDgGd0Ye4TqaTQDaEP0Bv/YE1QhAF
	 kPVdCYpOI2I+JQiXtL0c2vNo3jjN1hTJiX8CXK3WSCGWCjpqACGtBzRI7vRXWK8zCo
	 ijdpYH6AWujODGfQAR3KcquTsjpwUTpRQBxA4e4Q=
Date: Mon, 8 Sep 2025 09:35:34 +0200
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
Subject: Re: [PATCH v4 1/8] media: uapi: Introduce V4L2 extensible params
Message-ID: <20250908073534.GD4105@pendragon.ideasonboard.com>
References: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
 <20250820-extensible-parameters-validation-v4-1-30fe5a99cb1f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820-extensible-parameters-validation-v4-1-30fe5a99cb1f@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Wed, Aug 20, 2025 at 02:58:09PM +0200, Jacopo Mondi wrote:
> Introduce v4l2-extensible-params.h in the Linux kernel uAPI.

I expect more ISP-related helpers, such as extensible statistics
formats, and more. How about already moving this to v4l2-isp.h ?

> The header defines two types that all drivers that use the extensible
> parameters format for ISP configuration shall use to build their own
> format versions.
> 
> The newly introduce type v4l2_params_block represent the

"The v4l2_params_block structure represents the"

except the structure name is v4l2_params_block_header.

> header to be prepend to each ISP configuration block and the
> v4l2_params_buffer type represent the base type for the configuration
> parameters buffer.
> 
> The v4l2_params_buffer represents the container for the ISP
> configuration data block. The generic type is defined with a 0-sized
> data block that specific ISP implementation shall properly size
> according to their capabilities.
> 
> [Add v4l2_params_buffer_size()]
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  MAINTAINERS                                       |   6 +
>  include/uapi/linux/media/v4l2-extensible-params.h | 146 ++++++++++++++++++++++
>  2 files changed, 152 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa45799dfe07de2f54de6d6a1ce0615..67216d1e92d7ac81617bb3c4329e4096aa205706 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26380,6 +26380,12 @@ F:	drivers/media/i2c/vd55g1.c
>  F:	drivers/media/i2c/vd56g3.c
>  F:	drivers/media/i2c/vgxy61.c
>  
> +V4L2 EXTENSIBLE PARAMETERS FORMAT
> +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	include/uapi/linux/media/v4l2-extensible-params.h
> +
>  VF610 NAND DRIVER
>  M:	Stefan Agner <stefan@agner.ch>
>  L:	linux-mtd@lists.infradead.org
> diff --git a/include/uapi/linux/media/v4l2-extensible-params.h b/include/uapi/linux/media/v4l2-extensible-params.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..aca643f505f2705eeca7337f0dd182bcfd1ea60d
> --- /dev/null
> +++ b/include/uapi/linux/media/v4l2-extensible-params.h
> @@ -0,0 +1,146 @@
> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */

Why the MIT license ? And why GPL-2.0+ instead of GPL-2.0 ?

> +/*
> + * Video4Linux2 extensible configuration parameters base types
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> + */
> +
> +#ifndef _UAPI_V4L2_PARAMS_H_
> +#define _UAPI_V4L2_PARAMS_H_
> +
> +#include <linux/stddef.h>
> +#include <linux/types.h>
> +
> +#define V4L2_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> +#define V4L2_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
> +
> +/*
> + * Reserve the first 8 bits for V4L2_PARAMS_FL_* flag.
> + *
> + * Platform-specific flags should be defined as:
> + * #define PLATFORM_SPECIFIC_FLAG0     ((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(0))
> + * #define PLATFORM_SPECIFIC_FLAG1     ((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(1))
> + */
> +#define V4L2_PARAMS_FL_PLATFORM_FLAGS(n)       ((n) + 8)

s/PLATFORM/DRIVER/

> +
> +/**
> + * struct v4l2_params_block_header - V4L2 extensible parameters block header
> + *
> + * This structure represents the common part of all the ISP configuration
> + * blocks. Each parameters block shall embed an instance of this structure type
> + * as its first member, followed by the block-specific configuration data. The
> + * driver inspects this common header to discern the block type and its size and
> + * properly handle the block content by casting it to the correct block-specific
> + * type.

The last sentence is not relevant for the userspace API.

> + *
> + * The @type field is one of the values enumerated by each platform-specific ISP
> + * block types which specifies how the data should be interpreted by the driver.
> + * The @size field specifies the size of the parameters block and is used by the
> + * driver for validation purposes.

 * The @type field is an ISP driver-specific value that identifies the block type.
 * The @size field specifies the size of the parameters block.

but that seems to duplicate the documentation of the fields below. I'd
move the field documentation up, and then only add additional paragraphs
when they contain extra information.

> + *
> + * The @flags field is a bitmask of per-block flags V4L2_PARAMS_FL_* and
> + * platform-specific flags specified by the platform-specific header.

It's not platform-specific but ISP driver-specific (or you could just
write driver-specific).

> + *
> + * Documentation of the platform-specific flags handling is specified by the
> + * platform-specific block header type:
> + *
> + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_block_type`
> + * - Amlogic C3: :c:type:`c3_isp_params_block_type`

I wouldn't mention specific platforms here, that won't really scale.

> + *
> + * Userspace is responsible for correctly populating the parameters block header
> + * fields (@type, @flags and @size) and the block-specific parameters.

This is the kind of information I think I would expect in
Documentation/userspace-api/media/v4l/extensible-parameters.rst more
than here. We usually keep documentation minimal in header files for the
userspace API, and document the behaviour in .rst files. This being
said, if you think having more documentation in the headers is better,
that could work too.

> + *
> + * @type: The parameters block type (platform-specific)
> + * @flags: A bitmask of block flags (platform-specific)
> + * @size: Size (in bytes) of the parameters block, including this header
> + */
> +struct v4l2_params_block_header {
> +	__u16 type;
> +	__u16 flags;
> +	__u32 size;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * v4l2_params_buffer_size - Calculate size of v4l2_params_buffer for a platform
> + *
> + * Users of the v4l2 extensible parameters will have differing sized data arrays
> + * depending on their specific parameter buffers. Drivers and userspace will
> + * need to be able to calculate the appropriate size of the struct to
> + * accommodate all ISP configuration blocks provided by the platform.
> + * This macro provides a convenient tool for the calculation.
> + *
> + * Each driver shall provide a definition of their extensible parameters
> + * implementation data buffer size. As an example:
> + *
> + * #define PLATFORM_BLOCKS_MAX_SIZE		\
> + *	sizeof(platform_block_0)	+	\
> + *	sizeof(platform_block_1)
> + *
> + * #define PLATFORM_BUFFER_SIZE			\
> + *	v4l2_params_buffer_size(PLATFORM_BLOCKS_MAX_SIZE)
> + *
> + * Drivers are then responsible for allocating buffers of the proper size
> + * by assigning PLATFORM_BUFFER_SIZE to the per-plane size of the videobuf2
> + * .queue_setup() operation and userspace shall use PLATFORM_BUFFER_SIZE
> + * when populating the ISP configuration data buffer.

Most if not all of this also seems to be information for drivers, not
for userspace. I doesn't belong in the UAPI documentation.

> + *
> + * @max_params_size: The total size of the ISP configuration blocks
> + */
> +#define v4l2_params_buffer_size(max_params_size) \
> +	(offsetof(struct v4l2_params_buffer, data) + (max_params_size))
> +
> +/**
> + * struct v4l2_params_buffer - V4L2 extensible parameters configuration
> + *
> + * This struct contains the configuration parameters of the ISP algorithms,
> + * serialized by userspace into a data buffer. Each configuration parameter
> + * block is represented by a block-specific structure which contains a
> + * :c:type:`v4l2_params_block_header` entry as first member. Userspace populates
> + * the @data buffer with configuration parameters for the blocks that it intends
> + * to configure. As a consequence, the data buffer effective size changes
> + * according to the number of ISP blocks that userspace intends to configure and
> + * is set by userspace in the @data_size field.
> + *
> + * The parameters buffer is versioned by the @version field to allow modifying
> + * and extending its definition. Userspace shall populate the @version field to
> + * inform the driver about the version it intends to use. The driver will parse
> + * and handle the @data buffer according to the data layout specific to the
> + * indicated version and return an error if the desired version is not
> + * supported.

How does userspace know which versions are supported ?

> + *
> + * For each ISP block that userspace wants to configure, a block-specific
> + * structure is appended to the @data buffer, one after the other without gaps
> + * in between nor overlaps. Userspace shall populate the @data_size field with
> + * the effective size, in bytes, of the @data buffer.
> + *
> + * Drivers shall take care of properly sizing of the extensible parameters
> + * buffer @data array. The v4l2_params_buffer type is defined with a
> + * flexible-array-member at the end, which resolves to a size of 0 bytes when
> + * inspected with sizeof(struct v4l2_params_buffer). This of course is not
> + * suitable for neither buffer allocation in the kernel driver nor for proper
> + * handling in userspace of the @data buffer it has to populate.
> + *
> + * Drivers using this type in their userspace API definition are responsible
> + * for providing the exact definition of the @data buffer size using the
> + * v4l2_params_buffer_size() macro. The size shall be used
> + * by the driver for buffers allocation and by userspace for populating the
> + * @data buffer before queueing it to the driver

Most of those two paragraphs are driver documentation too.

> + *
> + * Drivers that were already using extensible-parameters before the introduction
> + * of this file define their own type-convertible implementation of this
> + * type, see:
> + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_cfg`
> + * - Amlogic C3: :c:type:`c3_isp_params_cfg`

Drop this too.

> + *
> + * @version: The parameters buffer version (platform-specific)
> + * @data_size: The configuration data effective size, excluding this header
> + * @data: The configuration data
> + */
> +struct v4l2_params_buffer {
> +	__u32 version;
> +	__u32 data_size;
> +	__u8 data[] __counted_by(data_size);
> +};
> +
> +#endif /* _UAPI_V4L2_PARAMS_H_ */

-- 
Regards,

Laurent Pinchart

