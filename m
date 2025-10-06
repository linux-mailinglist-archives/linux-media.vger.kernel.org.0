Return-Path: <linux-media+bounces-43770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D67BBBD54E
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 10:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BD5E18944DA
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 08:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8205625DB12;
	Mon,  6 Oct 2025 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dytqAlAy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFE114B953;
	Mon,  6 Oct 2025 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739285; cv=none; b=K6xTSADJX+qLWRhQdIQGx+p7lfemKL+cJv1MbvV2vxpRADug5/i2R1cZ2q/IoLWFXUrO53hsPD0cjopNJc4fxjubQ0te4+Ijqb6RbkZMXrSoZtrL201xK7ns69iRu3GmooUz6bviPn8tmiNUe+tC9c9G+vqtO9FjcbfhUBV0jHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739285; c=relaxed/simple;
	bh=nY1ffIYHxaS7/UTXDq2c0xm+e3UwHeS4td9f5pR/p6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNTAh8zkENGyqTmDMCta+kt3qGU8auug1FAJR4zVtUtqb0d/ib/Jz9+R8XFkL18qQ7udhCP9o3mlKmUHjeFyaIDnqDFZu97u7TOIbI7DrCleGI2lrehmYliW/BPzlQYGhi03rQWAfHZBBIF7B4u46zI9W4ZgzCIJyKr4L8TrYAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dytqAlAy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1BBBA2273;
	Mon,  6 Oct 2025 10:26:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759739186;
	bh=nY1ffIYHxaS7/UTXDq2c0xm+e3UwHeS4td9f5pR/p6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dytqAlAyI85a+qLoMIyrTJKCTdP5Fqlm3Zh6cqZhu45XmgLQSjuN4+paTqYOOuaHn
	 JwxHMs1VZHYcEAq5NOih+2520PrTVtqByCfumDkGVXysVl+E+QCalJpBictoscbF8Y
	 xg5/g7QqRkV0dS9Z1ttP7S3khkdLb2M45I6jvY84=
Date: Mon, 6 Oct 2025 11:27:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antoine Bouyer <antoine.bouyer@nxp.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/8] media: uapi: Introduce V4L2 generic ISP types
Message-ID: <20251006082751.GA16422@pendragon.ideasonboard.com>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
 <20250915-extensible-parameters-validation-v5-1-e6db94468af3@ideasonboard.com>
 <20251005000602.GA13055@pendragon.ideasonboard.com>
 <badf4971-0916-45f9-952c-09963c6cb19a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <badf4971-0916-45f9-952c-09963c6cb19a@ideasonboard.com>

On Mon, Oct 06, 2025 at 09:15:47AM +0100, Daniel Scally wrote:
> On 05/10/2025 01:06, Laurent Pinchart wrote:
> > On Mon, Sep 15, 2025 at 07:18:10PM +0200, Jacopo Mondi wrote:
> >> Introduce v4l2-isp.h in the Linux kernel uAPI.
> >>
> >> The header includes types for generic ISP configuration parameters
> >> and will be extended in future with support for generic ISP statistics
> > 
> > s/in future/in the future/
> > 
> > (and you can reflow the commit message)
> > 
> >> formats.
> >>
> >> Generic ISP parameters support is provided by introducing two new
> >> types that represent an extensible and versioned buffer of ISP
> >> configuration parameters.
> >>
> >> The v4l2_params_block_header structure represents the header to be
> >> prepend to each ISP configuration block and the v4l2_params_buffer type
> >> represents the base type for the configuration parameters buffer.
> > 
> > The second part of the sentence describes the same structure as the next
> > paragraph.
> > 
> >> The v4l2_params_buffer represents the container for the ISP
> >> configuration data block. The generic type is defined with a 0-sized
> >> data member that the ISP driver implementations shall properly size
> >> according to their capabilities.
> > 
> > This will be easier to understand if you describe v4l2_params_buffer
> > first.
> > 
> > The commit message would benefit from being rewritten.
> > 
> >> [Add v4l2_params_buffer_size()]
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> ---
> >>   MAINTAINERS                         |   6 +++
> >>   include/uapi/linux/media/v4l2-isp.h | 100 ++++++++++++++++++++++++++++++++++++
> >>   2 files changed, 106 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index ee8cb2db483f6a5e96b62b6f2edd05b1427b69f5..e82c3d0758d6033fe8fcd56ffde2c03c4319fd11 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -26410,6 +26410,12 @@ F:	drivers/media/i2c/vd55g1.c
> >>   F:	drivers/media/i2c/vd56g3.c
> >>   F:	drivers/media/i2c/vgxy61.c
> >>   
> >> +V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
> >> +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> +L:	linux-media@vger.kernel.org
> >> +S:	Maintained
> >> +F:	include/uapi/linux/media/v4l2-isp.h
> >> +
> >>   VF610 NAND DRIVER
> >>   M:	Stefan Agner <stefan@agner.ch>
> >>   L:	linux-mtd@lists.infradead.org
> >> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..b838555dce2b290a14136ab09ea4d2dfdc95b26b
> >> --- /dev/null
> >> +++ b/include/uapi/linux/media/v4l2-isp.h
> >> @@ -0,0 +1,100 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> >> +/*
> >> + * Video4Linux2 generic ISP parameters and statistics support
> >> + *
> >> + * Copyright (C) 2025 Ideas On Board Oy
> >> + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> + */
> >> +
> >> +#ifndef _UAPI_V4L2_ISP_H_
> >> +#define _UAPI_V4L2_ISP_H_
> >> +
> >> +#include <linux/stddef.h>
> >> +#include <linux/types.h>
> >> +
> >> +#define V4L2_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> >> +#define V4L2_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
> >> +
> >> +/*
> >> + * Reserve the first 8 bits for V4L2_PARAMS_FL_* flag.
> >> + *
> >> + * Driver-specific flags should be defined as:
> >> + * #define PLATFORM_SPECIFIC_FLAG0     ((1U << V4L2_PARAMS_FL_DRIVER_FLAGS(0))
> > 
> > s/PLATFORM/DRIVER/
> > 
> >> + * #define PLATFORM_SPECIFIC_FLAG1     ((1U << V4L2_PARAMS_FL_DRIVER_FLAGS(1))
> >> + */
> >> +#define V4L2_PARAMS_FL_DRIVER_FLAGS(n)       ((n) + 8)
> >> +
> >> +/**
> >> + * struct v4l2_params_block_header - V4L2 extensible parameters block header
> >> + *
> >> + * This structure represents the common part of all the ISP configuration
> >> + * blocks. Each parameters block shall embed an instance of this structure type
> >> + * as its first member, followed by the block-specific configuration data. The
> >> + * driver inspects this common header to discern the block type and its size and
> >> + * properly handle the block content.
> > 
> > The last sentence is not relevant for the UAPI.
> > 
> >> + *
> >> + * The @type field is an ISP driver-specific value that identifies the block
> >> + * type. The @size field specifies the size of the parameters block.
> >> + *
> >> + * The @flags field is a bitmask of per-block flags V4L2_PARAMS_FL_* and
> >> + * driver-specific flags specified by the driver header.
> >> + *
> >> + * @type: The parameters block type (driver-specific)
> >> + * @flags: A bitmask of block flags (driver-specific)
> >> + * @size: Size (in bytes) of the parameters block, including this header
> > 
> > I think the fields usually go right after the structure name, followed
> > by the rest of the documentation.
> > 
> >> + */
> >> +struct v4l2_params_block_header {
> >> +	__u16 type;
> >> +	__u16 flags;
> >> +	__u32 size;
> >> +} __attribute__((aligned(8)));
> >> +
> >> +/**
> >> + * v4l2_params_buffer_size - Calculate size of v4l2_params_buffer for a platform
> >> + *
> >> + * Users of the v4l2 extensible parameters will have differing sized data arrays
> >> + * depending on their specific parameter buffers. Drivers and userspace will
> >> + * need to be able to calculate the appropriate size of the struct to
> >> + * accommodate all ISP configuration blocks provided by the platform.
> >> + * This macro provides a convenient tool for the calculation.
> >> + *
> >> + * @max_params_size: The total size of the ISP configuration blocks
> >> + */
> >> +#define v4l2_params_buffer_size(max_params_size) \
> >> +	(offsetof(struct v4l2_params_buffer, data) + (max_params_size))
> > 
> > This isn't used in this series as far as I can tell, and neither is it
> > used in your libcamera implementation. I'd drop the macro (as well as
> > the mention in the commit message).
> 
> This is because the rkisp1 and c3 ISP implementations are already merged with a custom parameters 
> buffer struct defined at [1] and [2]. There the array size is set to the max size macro. This series 
> just asserts that the header part is a size match for struct v4l2_params_buffer to guarantee 
> compatibility, so throughout those drivers they can use sizeof(struct c3_isp_params_cfg) or the 
> rkisp equivalent and it's fine.
> 
> For new users that don't have a custom struct in their uAPI and are relying on struct 
> v4l2_params_buffer we can't just do sizeof(), so the idea was for this to provide a canonical way 
> for the size calculation to be done across both the kernel and userspace.
> 
> If we decide that it's worth keeping but want a user in this series to justify its inclusion, it 
> could be used in patches 2 and 3 - I'll reply to patch 2 in a second to indicate where.

Will it be used by userspace too for the Mali C55, or only by the kernel
driver ?

> [1] https://elixir.bootlin.com/linux/v6.17/source/include/uapi/linux/rkisp1-config.h#L1675
> [2] https://elixir.bootlin.com/linux/v6.17/source/include/uapi/linux/media/amlogic/c3-isp-config.h#L558>
>
> >> +
> >> +/**
> >> + * struct v4l2_params_buffer - V4L2 extensible parameters configuration
> >> + *
> >> + * This struct contains the configuration parameters of the ISP algorithms,
> > 
> > s/struct/structure/
> > 
> >> + * serialized by userspace into a data buffer. Each configuration parameter
> >> + * block is represented by a block-specific structure which contains a
> >> + * :c:type:`v4l2_params_block_header` entry as first member. Userspace populates
> >> + * the @data buffer with configuration parameters for the blocks that it intends
> >> + * to configure. As a consequence, the data buffer effective size changes
> >> + * according to the number of ISP blocks that userspace intends to configure and
> >> + * is set by userspace in the @data_size field.
> >> + *
> >> + * The parameters buffer is versioned by the @version field to allow modifying
> >> + * and extending its definition. Userspace shall populate the @version field to
> >> + * inform the driver about the version it intends to use. The driver will parse
> >> + * and handle the @data buffer according to the data layout specific to the
> >> + * indicated version and return an error if the desired version is not
> >> + * supported.
> >> + *
> >> + * For each ISP block that userspace wants to configure, a block-specific
> >> + * structure is appended to the @data buffer, one after the other without gaps
> >> + * in between nor overlaps. Userspace shall populate the @data_size field with
> > 
> > I think you can drop "nor overlaps", nobody in their right mind should
> > think the blocks could be overlayed :-)
> > 
> >> + * the effective size, in bytes, of the @data buffer.
> >> + *
> >> + * @version: The parameters buffer version (driver-specific)
> >> + * @data_size: The configuration data effective size, excluding this header
> >> + * @data: The configuration data
> > 
> > Move the fields up just after the structure name.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> >> + */
> >> +struct v4l2_params_buffer {
> >> +	__u32 version;
> >> +	__u32 data_size;
> >> +	__u8 data[] __counted_by(data_size);
> >> +};
> >> +
> >> +#endif /* _UAPI_V4L2_ISP_H_ */

-- 
Regards,

Laurent Pinchart

