Return-Path: <linux-media+bounces-43753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A518DBB932C
	for <lists+linux-media@lfdr.de>; Sun, 05 Oct 2025 02:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E422C1898F30
	for <lists+linux-media@lfdr.de>; Sun,  5 Oct 2025 00:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147E98634F;
	Sun,  5 Oct 2025 00:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l2peJZju"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2D22C181;
	Sun,  5 Oct 2025 00:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759623905; cv=none; b=T4qiFTg0g/UXnuisFAcmRPpWimmA1GhEVG01wYPaNB3YDr4giX7acgXqKwuRXzerCzP1CIDqq0X7k62vBXi+cPKM9798hVut41i+ip6p28BMwWX5atI24kwt7wQvTQ1x9eJ9X3WhXWt6M4qMgGU8kZhAa7f5Kw76zwyuDD2kMhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759623905; c=relaxed/simple;
	bh=gQv8rVt3G5Sp/h+9pCG5bWX/kK8RHwN2ZheTAD4EXIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMZleGM/j5w2c39BFJP1u3GbFAY40sM4plFpYpXZx737e97bH0xeCrKtbg8T6b6BZmE/sChaIfUULrdjrRPTIzNxced+VThxf7WssaRPhYXuGojK/UOgbzx7RG1X23K/xfe621dMh4GUeFb9zeXSunQRMd1I5epEHJrM8EadNME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l2peJZju; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9808BC6E;
	Sun,  5 Oct 2025 02:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759623808;
	bh=gQv8rVt3G5Sp/h+9pCG5bWX/kK8RHwN2ZheTAD4EXIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l2peJZjuAyJ81txRk4qoY/Ur0O6bFvvsDsyhwMyer/VKPa5qPb8elcdgidPiibbcX
	 yIqG3zibNUlNupGh5IBzWNANJUxVkcsZmGoQjnn6bruWJpEAry30K2tuUtTNLfKBW/
	 MS99wot2Qevcz3QM/7zLiwV6b2wjw4JBjrzp+hi4=
Date: Sun, 5 Oct 2025 03:24:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antoine Bouyer <antoine.bouyer@nxp.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/8] media: uapi: Convert Amlogic C3 to V4L2
 extensible params
Message-ID: <20251005002453.GC13055@pendragon.ideasonboard.com>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
 <20250915-extensible-parameters-validation-v5-3-e6db94468af3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915-extensible-parameters-validation-v5-3-e6db94468af3@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Sep 15, 2025 at 07:18:12PM +0200, Jacopo Mondi wrote:
> With the introduction of common types for extensible parameters
> format, convert the c3-isp-config.h header to use the new types.
> 
> Factor-out the documentation that is now part of the common header
> and only keep the driver-specific on in place.
> 
> The conversion to use common types doesn't impact userspace as the
> new types are either identical to the ones already existing in the
> C3 ISP uAPI or are 1-to-1 type convertible.

You can reflow the commit message.

> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Keke Li <keke.li@amlogic.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  include/uapi/linux/media/amlogic/c3-isp-config.h | 86 ++++++------------------
>  1 file changed, 20 insertions(+), 66 deletions(-)
> 
> diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
> index ed085ea62a574932c7ad8d59d34b2c5c74a597d8..bf6de55b27a7d4d15effcca5525865650d9070fb 100644
> --- a/include/uapi/linux/media/amlogic/c3-isp-config.h
> +++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
> @@ -6,8 +6,13 @@
>  #ifndef _UAPI_C3_ISP_CONFIG_H_
>  #define _UAPI_C3_ISP_CONFIG_H_
>  
> +#ifdef __KERNEL__
> +#include <linux/build_bug.h>
> +#endif /* __KERNEL__ */
>  #include <linux/types.h>
>  
> +#include <linux/media/v4l2-isp.h>
> +
>  /*
>   * Frames are split into zones of almost equal width and height - a zone is a
>   * rectangular tile of a frame. The metering blocks within the ISP collect
> @@ -176,62 +181,22 @@ enum c3_isp_params_block_type {
>  	C3_ISP_PARAMS_BLOCK_SENTINEL
>  };
>  
> -#define C3_ISP_PARAMS_BLOCK_FL_DISABLE (1U << 0)
> -#define C3_ISP_PARAMS_BLOCK_FL_ENABLE (1U << 1)
> +/* For backward compatibility */
> +#define C3_ISP_PARAMS_BLOCK_FL_DISABLE	V4L2_PARAMS_FL_BLOCK_DISABLE
> +#define C3_ISP_PARAMS_BLOCK_FL_ENABLE	V4L2_PARAMS_FL_BLOCK_ENABLE
>  
>  /**
>   * struct c3_isp_params_block_header - C3 ISP parameter block header
>   *
>   * This structure represents the common part of all the ISP configuration
> - * blocks. Each parameters block shall embed an instance of this structure type
> - * as its first member, followed by the block-specific configuration data. The
> - * driver inspects this common header to discern the block type and its size and
> - * properly handle the block content by casting it to the correct block-specific
> - * type.

+ * blocks and is identical to :c:type:`v4l2_params_block_header`.

>   *
>   * The @type field is one of the values enumerated by

s/@type/type/

Please compile the documentation for the next version. I expect the
'struct c3_isp_params_block_header' above to not be appreciated by
sphinx as there's no corresponding structure.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>   * :c:type:`c3_isp_params_block_type` and specifies how the data should be
> - * interpreted by the driver. The @size field specifies the size of the
> - * parameters block and is used by the driver for validation purposes. The
> - * @flags field is a bitmask of per-block flags C3_ISP_PARAMS_FL*.
> - *
> - * When userspace wants to disable an ISP block the
> - * C3_ISP_PARAMS_BLOCK_FL_DISABLED bit should be set in the @flags field. In
> - * this case userspace may optionally omit the remainder of the configuration
> - * block, which will be ignored by the driver.
> - *
> - * When a new configuration of an ISP block needs to be applied userspace
> - * shall fully populate the ISP block and omit setting the
> - * C3_ISP_PARAMS_BLOCK_FL_DISABLED bit in the @flags field.
> - *
> - * Userspace is responsible for correctly populating the parameters block header
> - * fields (@type, @flags and @size) and the block-specific parameters.
> - *
> - * For example:
> - *
> - * .. code-block:: c
> + * interpreted by the driver.
>   *
> - *	void populate_pst_gamma(struct c3_isp_params_block_header *block) {
> - *		struct c3_isp_params_pst_gamma *gamma =
> - *			(struct c3_isp_params_pst_gamma *)block;
> - *
> - *		gamma->header.type = C3_ISP_PARAMS_BLOCK_PST_GAMMA;
> - *		gamma->header.flags = C3_ISP_PARAMS_BLOCK_FL_ENABLE;
> - *		gamma->header.size = sizeof(*gamma);
> - *
> - *		for (unsigned int i = 0; i < 129; i++)
> - *			gamma->pst_gamma_lut[i] = i;
> - *	}
> - *
> - * @type: The parameters block type from :c:type:`c3_isp_params_block_type`
> - * @flags: A bitmask of block flags
> - * @size: Size (in bytes) of the parameters block, including this header
> + * The flags field is a bitmask of per-block flags C3_ISP_PARAMS_FL_*.
>   */
> -struct c3_isp_params_block_header {
> -	__u16 type;
> -	__u16 flags;
> -	__u32 size;
> -};
> +#define c3_isp_params_block_header v4l2_params_block_header
>  
>  /**
>   * struct c3_isp_params_awb_gains - Gains for auto-white balance
> @@ -498,26 +463,9 @@ struct c3_isp_params_blc {
>  /**
>   * struct c3_isp_params_cfg - C3 ISP configuration parameters
>   *
> - * This struct contains the configuration parameters of the C3 ISP
> - * algorithms, serialized by userspace into an opaque data buffer. Each
> - * configuration parameter block is represented by a block-specific structure
> - * which contains a :c:type:`c3_isp_param_block_header` entry as first
> - * member. Userspace populates the @data buffer with configuration parameters
> - * for the blocks that it intends to configure. As a consequence, the data
> - * buffer effective size changes according to the number of ISP blocks that
> - * userspace intends to configure.
> - *
> - * The parameters buffer is versioned by the @version field to allow modifying
> - * and extending its definition. Userspace should populate the @version field to
> - * inform the driver about the version it intends to use. The driver will parse
> - * and handle the @data buffer according to the data layout specific to the
> - * indicated revision and return an error if the desired revision is not
> - * supported.
> - *
> - * For each ISP block that userspace wants to configure, a block-specific
> - * structure is appended to the @data buffer, one after the other without gaps
> - * in between nor overlaps. Userspace shall populate the @total_size field with
> - * the effective size, in bytes, of the @data buffer.
> + * This is the driver-specific implementation of :c:type:`v4l2_params_buffer`.
> + *
> + * Currently only C3_ISP_PARAM_BUFFER_V0 is supported.
>   *
>   * The expected memory layout of the parameters buffer is::
>   *
> @@ -561,4 +509,10 @@ struct c3_isp_params_cfg {
>  	__u8 data[C3_ISP_PARAMS_MAX_SIZE];
>  };
>  
> +#ifdef __KERNEL__
> +/* Make sure the header is type-convertible to the generic v4l2 params one */
> +static_assert((sizeof(struct c3_isp_params_cfg) - C3_ISP_PARAMS_MAX_SIZE) ==
> +	      sizeof(struct v4l2_params_buffer));
> +#endif /* __KERNEL__ */
> +
>  #endif
> 

-- 
Regards,

Laurent Pinchart

