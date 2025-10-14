Return-Path: <linux-media+bounces-44384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 524D8BD880B
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 11:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE09C427653
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632D92FD7BC;
	Tue, 14 Oct 2025 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aWHwgHox"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B922E8E04;
	Tue, 14 Oct 2025 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760434954; cv=none; b=iafkMQBatzPnLwTsjts5swlXOMuIs/kEfQsHx/5HfYqdT5AVBD7lbTPGp2Qe3+Bh+1R4tl0xd/Zmuhfa1JL68pyUP8y8PwDMLW3oxFAQWR/TikSBLiSI9baXDL7bTeCPHCXmHSuF1NHlYjxQbuVjw6DAKkOhbI43H1XISlvbvbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760434954; c=relaxed/simple;
	bh=fyvsiAplX9W/n9nhtuP7G9+XkvoehypKI7yt/ohUwZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKX6lfbDhdpefoWWor74NrxOYbHA6e/MOUbjEjtcoUPZsA5cTZGUfTQ4zywEgjcrkgK0YluuomNrKPKXR/OOlEiBLSavz3NZiEWd1apJLMpezJXv7DL/6KtV79rTPvXtHSvdknlE78vbPChQHr9aoiDO6Nv+aX7V3lmJ4ML+maQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aWHwgHox; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760434950;
	bh=fyvsiAplX9W/n9nhtuP7G9+XkvoehypKI7yt/ohUwZw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aWHwgHoxpOOHTADIbwZAPiqXMEHzCSX0jMxP+GwmabX6ehKRbFBkszUVRpwe9kIGe
	 SEMPr93gS1UOX6deodcJSGBaftl/M2EGulmjX5WV6y51J29p//Ew9DxVchaP3jVzOx
	 rLcKPQPBsEiBEfw96ML/oAik1RTN3fuSHxZHSoc3VZIcnsgWtKrgPYrqLM6tGXuXBI
	 mUr740mZplpK5n816s4UYs0nLmBiwmg/hmlRH6bYH8EYHKHve6U45HHAbh0yw4pFKZ
	 W7jwLyTqSZwikBG8ijce57sjVjqDVWQSTUJSxjUNvphqJvKLGZ3flrspcAAMRHf8+K
	 3Ae0WhwNvi5ZQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8678B17E055D;
	Tue, 14 Oct 2025 11:42:29 +0200 (CEST)
Message-ID: <b0a802b0-e6b8-4a6f-a65c-ad2d11a7c1f6@collabora.com>
Date: Tue, 14 Oct 2025 11:42:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] media: uapi: Introduce V4L2 generic ISP types
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
 <20251014-extensible-parameters-validation-v7-1-6628bed5ca98@ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-1-6628bed5ca98@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

Thanks for your efforts!

On 10/14/25 10:00, Jacopo Mondi wrote:
> Introduce v4l2-isp.h in the Linux kernel uAPI.
> 
> The header includes types for generic ISP configuration parameters
> and will be extended in the future with support for generic ISP statistics
> formats.
> 
> Generic ISP parameters support is provided by introducing two new
> types that represent an extensible and versioned buffer of ISP
> configuration parameters.
> 
> The v4l2_params_buffer represents the container for the ISP
> configuration data block. The generic type is defined with a 0-sized
> data member that the ISP driver implementations shall properly size
> according to their capabilities. The v4l2_params_block_header structure
> represents the header to be prepend to each ISP configuration block.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

> ---
>  MAINTAINERS                         |   6 +++
>  include/uapi/linux/media/v4l2-isp.h | 102 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 108 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46126ce2f968e4f9260263f1574ee29f5ff0de1c..e9ac834d212f88222437e8d806800b2516d44f01 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26853,6 +26853,12 @@ F:	drivers/media/i2c/vd55g1.c
>  F:	drivers/media/i2c/vd56g3.c
>  F:	drivers/media/i2c/vgxy61.c
>  
> +V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
> +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	include/uapi/linux/media/v4l2-isp.h
> +
>  VF610 NAND DRIVER
>  M:	Stefan Agner <stefan@agner.ch>
>  L:	linux-mtd@lists.infradead.org
> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..779168f9058e3bcf6451f681e247d34d95676cc0
> --- /dev/null
> +++ b/include/uapi/linux/media/v4l2-isp.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Video4Linux2 generic ISP parameters and statistics support
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> + */
> +
> +#ifndef _UAPI_V4L2_ISP_H_
> +#define _UAPI_V4L2_ISP_H_
> +
> +#include <linux/stddef.h>
> +#include <linux/types.h>
> +
> +/**
> + * enum v4l2_isp_params_version - V4L2 ISP parameters versioning
> + *
> + * @V4L2_ISP_PARAMS_VERSION_V0: First version of the V4L2 ISP parameters format
> + *				(for compatibility)
> + * @V4L2_ISP_PARAMS_VERSION_V1: First version of the V4L2 ISP parameters format
> + *
> + * V0 and V1 are identical in order to support drivers compatible with the V4L2
> + * ISP parameters format already upstreamed which use either 0 or 1 as their
> + * versioning identifier. Both V0 and V1 refers to the first version of the
> + * V4L2 ISP parameters format.
> + *
> + * Future revisions of the V4L2 ISP parameters format should start from the
> + * value of 2.
> + */
> +enum v4l2_isp_params_version {
> +	V4L2_ISP_PARAMS_VERSION_V0 = 0,
> +	V4L2_ISP_PARAMS_VERSION_V1
> +};
> +
> +#define V4L2_ISP_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> +#define V4L2_ISP_PARAMS_FL_BLOCK_ENABLE		(1U << 1)
> +
> +/*
> + * Reserve the first 8 bits for V4L2_ISP_PARAMS_FL_* flag.
> + *
> + * Driver-specific flags should be defined as:
> + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
> + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(1))
> + */
> +#define V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(n)       ((n) + 8)
> +
> +/**
> + * struct v4l2_isp_params_block_header - V4L2 extensible parameters block header
> + * @type: The parameters block type (driver-specific)
> + * @flags: A bitmask of block flags (driver-specific)
> + * @size: Size (in bytes) of the parameters block, including this header
> + *
> + * This structure represents the common part of all the ISP configuration
> + * blocks. Each parameters block shall embed an instance of this structure type
> + * as its first member, followed by the block-specific configuration data.
> + *
> + * The @type field is an ISP driver-specific value that identifies the block
> + * type. The @size field specifies the size of the parameters block.
> + *
> + * The @flags field is a bitmask of per-block flags V4L2_PARAMS_ISP_FL_* and
> + * driver-specific flags specified by the driver header.
> + */
> +struct v4l2_isp_params_block_header {
> +	__u16 type;
> +	__u16 flags;
> +	__u32 size;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct v4l2_isp_params_buffer - V4L2 extensible parameters configuration
> + * @version: The parameters buffer version (driver-specific)
> + * @data_size: The configuration data effective size, excluding this header
> + * @data: The configuration data
> + *
> + * This structure contains the configuration parameters of the ISP algorithms,
> + * serialized by userspace into a data buffer. Each configuration parameter
> + * block is represented by a block-specific structure which contains a
> + * :c:type:`v4l2_isp_params_block_header` entry as first member. Userspace
> + * populates the @data buffer with configuration parameters for the blocks that
> + * it intends to configure. As a consequence, the data buffer effective size
> + * changes according to the number of ISP blocks that userspace intends to
> + * configure and is set by userspace in the @data_size field.
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
> + * in between. Userspace shall populate the @data_size field with the effective
> + * size, in bytes, of the @data buffer.
> + */
> +struct v4l2_isp_params_buffer {
> +	__u32 version;
> +	__u32 data_size;
> +	__u8 data[] __counted_by(data_size);
> +};
> +
> +#endif /* _UAPI_V4L2_ISP_H_ */
> 


