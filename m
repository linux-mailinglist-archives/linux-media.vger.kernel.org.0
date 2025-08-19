Return-Path: <linux-media+bounces-40322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B3BB2CF16
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 00:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FB45527ED2
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 22:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3F0353367;
	Tue, 19 Aug 2025 22:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZBkURGQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF535334E;
	Tue, 19 Aug 2025 22:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755641286; cv=none; b=mst9IBzZeI3iUxgt2LmSSsTdosfvWMJWgyIFmDjDpLHQOYxiAxleZb/Y+UUWBO3tVw1Xs014lDA7oaTq4Kouchb7Vj1FbIKOOLD8sP4Ec9JRbSZjWwaKvaBkDcgm5+GVu6fsqw+lslYcvlJ39nvF5oL4/HFyl5c18CwtImzMOH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755641286; c=relaxed/simple;
	bh=IER2tH70jw4bUvxU7SJwvA7uocCmfea8E42TaoI/+JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EF0MD/B5f39VtUrP9XVWNWsereEONAPHugIharmw9WO3moGGALDgnNTIYMnmXqNcaXfN1UTzR+9qQWVLpEoOBFg7UqslKNCQz930JAmXQoS2daDcHHW9ZWKhjqhiPt+FTqjmuiCPouTU78aYTuJiA/qPRa1qfOUiifat17FUPCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZBkURGQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755641284; x=1787177284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IER2tH70jw4bUvxU7SJwvA7uocCmfea8E42TaoI/+JE=;
  b=iZBkURGQ6VyBfAzvNohivO9tD8v1G/Roq0gJ496OxPWBJSci+9b5MDR0
   gHETXa/ZKIdTppSXox5HEXa82CjY7vrc4uMc32sSSIpwH7J8TrB75z/7k
   GMKTBOYSEy6fcFP3uTyBSjb0wwI6ZGRCxNdvlQjZW6mqpFwUSVIhyZH08
   oDcVHGeToqg1wRIlX/YyqK4Xalp9hfrKvKsoDowq4x0sHHFs9fHlEQdm1
   lzViDOC2YLj1WtHT0ZFqCIyx+luL8s01NM3acHKOY53RlKmGKFc8QeGE9
   UstBRgN/U2THygFwuo6BSpaJ09A7oi7eqLexaSmIv9QhZxg37Yiy9+p0K
   Q==;
X-CSE-ConnectionGUID: eJN6x82ZSeqwEqA6RQ+mBQ==
X-CSE-MsgGUID: ENq5vsZNQjK7K7UZvawM6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="80491876"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="80491876"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 15:08:04 -0700
X-CSE-ConnectionGUID: FnrUrLyiReypiU0rUAmo7A==
X-CSE-MsgGUID: u5PAcqNEQROpMrxv+0NYTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="173324580"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.235])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 15:08:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4123511F8D4;
	Wed, 20 Aug 2025 01:07:58 +0300 (EEST)
Date: Wed, 20 Aug 2025 01:07:58 +0300
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
Subject: Re: [PATCH v3 1/8] media: uapi: Introduce V4L2 extensible params
Message-ID: <aKT1vgHkdc98zOyC@kekkonen.localdomain>
References: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
 <20250819-extensible-parameters-validation-v3-1-9dc008348b30@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-extensible-parameters-validation-v3-1-9dc008348b30@ideasonboard.com>

Hi Jacopo,

Thank you for working on this.

On Tue, Aug 19, 2025 at 04:54:42PM +0200, Jacopo Mondi wrote:
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
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  MAINTAINERS                                       |   6 +
>  include/uapi/linux/media/v4l2-extensible-params.h | 144 ++++++++++++++++++++++
>  2 files changed, 150 insertions(+)
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

How many bits are you shifting left here again?

> + */
> +#define V4L2_PARAMS_FL_PLATFORM_FLAGS(n)	((n) << 8)

n really needs to be unsigned.

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

Would __attribute__((__counted_by__(data_size))) be problematic here?

Perhaps not now but it could be added later on?

> +};
> +
> +#endif /* _UAPI_V4L2_PARAMS_H_ */
> 

-- 
Kind regards,

Sakari Ailus

