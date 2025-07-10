Return-Path: <linux-media+bounces-37316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E97BB004B6
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 16:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EFF13BFD0C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 14:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E062727E3;
	Thu, 10 Jul 2025 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WUaA9xLW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B890263C92;
	Thu, 10 Jul 2025 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752156187; cv=none; b=q8fLJMZdc2lqqDfrvErxU5TwoxBDJNmb5afa2LL6cM17TryU6VDSZZaEvyUMcUozivJbYMM2H1j8y3TrZ1nK5tb/XSTkkA8i1hSJuX9mWY9EWDGYxaJAx5JOyjy5savDKcgfiyLguO5gIJtuxL42CdV16RYoI8U0fab7LdtLI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752156187; c=relaxed/simple;
	bh=xxgyYy8voCOQBGC85r6GJhF+5zgq25385Rsym1qSLcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLbly3fuArQN/Cwz1spf645ati48A9ftjEKglKrDn6LGms9M9NYIFMCjcpkq1jbrV5c/mHqqv9WmsHuLRVOCg6zdNi2Wg9Cw5hQjEzPFj+YgtQuLE7iFRea1rPSGt7A11mNC1AoLFNG6LZSfxZQpqKg28u0u6jnhnnt5fxSiiqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WUaA9xLW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 280DFB2B;
	Thu, 10 Jul 2025 16:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752156154;
	bh=xxgyYy8voCOQBGC85r6GJhF+5zgq25385Rsym1qSLcQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WUaA9xLWJJzHOqVYmF8i4EPY7434mHYFa6D8PFaZKWhRnTasFdlZp5pmWSw4+Osh+
	 sOYpOB5IXkOSZmhkRIAqnSD5S1LaWtdeYbEGK0yCzoeUYk7ettWU2fZInPlyJBtgYh
	 GSYtaULAbtXUCFKarxH2Hg4nRLQc+/SNZsRfzNBk=
Message-ID: <0cea12d8-4c03-48a2-9f9d-af03590f72e0@ideasonboard.com>
Date: Thu, 10 Jul 2025 15:02:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: uapi: Introduce V4L2 extensible params
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
 <20250710-extensible-parameters-validation-v2-1-7ec8918ec443@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250710-extensible-parameters-validation-v2-1-7ec8918ec443@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo, thanks for the revision

On 10/07/2025 14:52, Jacopo Mondi wrote:
> Introduce v4l2-extensible-params.h in the Linux kernel uAPI.
>
> The header defines two types that all drivers that use the extensible
> parameters format for ISP configuration shall use to build their own
> format versions.
>
> The newly introduce type v4l2_params_block represent the
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
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

Looks good to me:


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   MAINTAINERS                                       |   6 +
>   include/uapi/linux/media/v4l2-extensible-params.h | 144 ++++++++++++++++++++++
>   2 files changed, 150 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 658543062bba3b7e600699d7271ffc89250ba7e5..49a9329e5fe8874bdbaca13946ea28bd80134cb3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25968,6 +25968,12 @@ F:	drivers/media/i2c/vd55g1.c
>   F:	drivers/media/i2c/vd56g3.c
>   F:	drivers/media/i2c/vgxy61.c
>   
> +V4L2 EXTENSIBLE PARAMETERS FORMAT
> +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	include/uapi/linux/media/v4l2-extensible-params.h
> +
>   VF610 NAND DRIVER
>   M:	Stefan Agner <stefan@agner.ch>
>   L:	linux-mtd@lists.infradead.org
> diff --git a/include/uapi/linux/media/v4l2-extensible-params.h b/include/uapi/linux/media/v4l2-extensible-params.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..ace89299a4b37e428c0bc9a72fbc079b1dcda91a
> --- /dev/null
> +++ b/include/uapi/linux/media/v4l2-extensible-params.h
> @@ -0,0 +1,144 @@
> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
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
> +#include <linux/types.h>
> +
> +#define V4L2_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> +#define V4L2_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
> +
> +/*
> + * Reserve the first 8 bits for V4L2_PARAMS_FL_* flag. Platform-specific flags
> + * should be defined as:
> + * #define PLATFORM_SPECIFIC_FLAG0	((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(0))
> + * #define PLATFORM_SPECIFIC_FLAG1	((1U << V4L2_PARAMS_FL_PLATFORM_FLAGS(1))
> + */
> +#define V4L2_PARAMS_FL_PLATFORM_FLAGS(n)	((n) << 8)
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
> + *
> + * The @type field is one of the values enumerated by each platform-specific ISP
> + * block types which specifies how the data should be interpreted by the driver.
> + * The @size field specifies the size of the parameters block and is used by the
> + * driver for validation purposes.
> + *
> + * The @flags field is a bitmask of per-block flags V4L2_PARAMS_FL_* and
> + * platform-specific flags specified by the platform-specific header.
> + *
> + * Documentation of the platform-specific flags handling is specified by the
> + * platform-specific block header type:
> + *
> + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_block_type`
> + * - Amlogic C3: :c:type:`c3_isp_params_block_type`
> + *
> + * Userspace is responsible for correctly populating the parameters block header
> + * fields (@type, @flags and @size) and the block-specific parameters.
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
> + *
> + * Drivers that were already using extensible-parameters before the introduction
> + * of this file define their own type-convertible implementation of this
> + * type, see:
> + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_cfg`
> + * - Amlogic C3: :c:type:`c3_isp_params_cfg`
> + *
> + * @version: The parameters buffer version (platform-specific)
> + * @data_size: The configuration data effective size, excluding this header
> + * @data: The configuration data
> + */
> +struct v4l2_params_buffer {
> +	__u32 version;
> +	__u32 data_size;
> +	__u8 data[];
> +};
> +
> +#endif /* _UAPI_V4L2_PARAMS_H_ */
>

