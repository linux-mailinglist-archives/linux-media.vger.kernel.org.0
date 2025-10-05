Return-Path: <linux-media+bounces-43752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E10EBB9323
	for <lists+linux-media@lfdr.de>; Sun, 05 Oct 2025 02:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8B304346992
	for <lists+linux-media@lfdr.de>; Sun,  5 Oct 2025 00:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE2D4086A;
	Sun,  5 Oct 2025 00:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e8Elcjij"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2621805E;
	Sun,  5 Oct 2025 00:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759623540; cv=none; b=GdNvGWcZGYv10ubZK9FsSQKsbdMm0XrtchO2txgepCon3pFZabXgbJUa6ZCZyINdqUgd27tI3WSzR8Wb6Pcez/7sOMbkazefbq/PK9YsDCey2PLJtu249rqSRljIz27ZJvPOQbfa8dDdU83px0NF/ZQbrol6dPMMrR1/gFJ04F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759623540; c=relaxed/simple;
	bh=4l9sj69irxtNla0xa66UGbzMq8DpnEvviCriNWXsxkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hc8j8LHGh1XKsg/uZohx1nCiu7sfleVS+tjTbfgr8epRpae4BMomy1pdyMG1gb3noG1m9bU0sT0rSPUv2Tz9eHhDvib90SxpRSQ2UFuCzP0gVvvQSrI6yiDkCCvBQ6pYCbAgAUJhx54ayyPHMTvfkmwvNIJRBWhSLDw6NULh5ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e8Elcjij; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0F1C1C6E;
	Sun,  5 Oct 2025 02:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759623443;
	bh=4l9sj69irxtNla0xa66UGbzMq8DpnEvviCriNWXsxkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e8Elcjij7HTuNj0HgeZZTtq0DOMiUCEeEheluRDqVl8H+yi6nCMmyppyGZFiX21EQ
	 yjxThWgNkAp3MEsRqxoMnlu71bLr7jM1EY3AehQ9qFlCv8pmw0vB3+WWTBZlUuo8J8
	 m/2gzSUpiz9ykV5A6zfgdQJEu4r8I2TGGxMXehf8=
Date: Sun, 5 Oct 2025 03:18:47 +0300
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
Subject: Re: [PATCH v5 2/8] media: uapi: Convert RkISP1 to V4L2 extensible
 params
Message-ID: <20251005001847.GB13055@pendragon.ideasonboard.com>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
 <20250915-extensible-parameters-validation-v5-2-e6db94468af3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915-extensible-parameters-validation-v5-2-e6db94468af3@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Sep 15, 2025 at 07:18:11PM +0200, Jacopo Mondi wrote:
> With the introduction of common types for extensible parameters
> format, convert the rkisp1-config.h header to use the new types.
> 
> Factor-out the documentation that is now part of the common header
> and only keep the driver-specific on in place.
> 
> The conversion to use common types doesn't impact userspace as the
> new types are either identical to the ones already existing in the
> RkISP1 uAPI or are 1-to-1 type convertible.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  include/uapi/linux/rkisp1-config.h | 104 ++++++++-----------------------------
>  1 file changed, 22 insertions(+), 82 deletions(-)
> 
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 3b060ea6eed71b87d79abc8401eae4e9c9f5323a..b90d94d3a852fb0af0fe447649487e9e80aca795 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -7,8 +7,13 @@
>  #ifndef _UAPI_RKISP1_CONFIG_H
>  #define _UAPI_RKISP1_CONFIG_H
>  
> +#ifdef __KERNEL__
> +#include <linux/build_bug.h>
> +#endif /* __KERNEL__ */
>  #include <linux/types.h>
>  
> +#include <linux/media/v4l2-isp.h>
> +
>  /* Defect Pixel Cluster Detection */
>  #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
>  /* Black Level Subtraction */
> @@ -1158,79 +1163,26 @@ enum rkisp1_ext_params_block_type {
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
>  };
>  
> -#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> -#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
> +/* For backward compatibility */
> +#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	V4L2_PARAMS_FL_BLOCK_DISABLE
> +#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	V4L2_PARAMS_FL_BLOCK_ENABLE
>  
>  /* A bitmask of parameters blocks supported on the current hardware. */
>  #define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS	(V4L2_CID_USER_RKISP1_BASE + 0x01)
>  
>  /**
> - * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
> - *					   header
> + * rkisp1_ext_params_block_header - RkISP1 extensible parameters block header
>   *
>   * This structure represents the common part of all the ISP configuration
> - * blocks. Each parameters block shall embed an instance of this structure type
> - * as its first member, followed by the block-specific configuration data. The
> - * driver inspects this common header to discern the block type and its size and
> - * properly handle the block content by casting it to the correct block-specific
> - * type.
> + * blocks and is identical to :c:type:`v4l2_params_block_header`.
>   *
> - * The @type field is one of the values enumerated by
> + * The type field is one of the values enumerated by
>   * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
> - * interpreted by the driver. The @size field specifies the size of the
> - * parameters block and is used by the driver for validation purposes.
> - *
> - * The @flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
> - *
> - * When userspace wants to configure and enable an ISP block it shall fully
> - * populate the block configuration and set the
> - * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE bit in the @flags field.
> - *
> - * When userspace simply wants to disable an ISP block the
> - * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bit should be set in @flags field. The
> - * driver ignores the rest of the block configuration structure in this case.
> - *
> - * If a new configuration of an ISP block has to be applied userspace shall
> - * fully populate the ISP block configuration and omit setting the
> - * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits
> - * in the @flags field.
> - *
> - * Setting both the RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and
> - * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the @flags field is not allowed
> - * and not accepted by the driver.
> - *
> - * Userspace is responsible for correctly populating the parameters block header
> - * fields (@type, @flags and @size) and the block-specific parameters.
> - *
> - * For example:
> + * interpreted by the driver.
>   *
> - * .. code-block:: c
> - *
> - *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
> - *		struct rkisp1_ext_params_bls_config *bls =
> - *			(struct rkisp1_ext_params_bls_config *)block;
> - *
> - *		bls->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
> - *		bls->header.flags = RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE;
> - *		bls->header.size = sizeof(*bls);
> - *
> - *		bls->config.enable_auto = 0;
> - *		bls->config.fixed_val.r = blackLevelRed_;
> - *		bls->config.fixed_val.gr = blackLevelGreenR_;
> - *		bls->config.fixed_val.gb = blackLevelGreenB_;
> - *		bls->config.fixed_val.b = blackLevelBlue_;
> - *	}
> - *
> - * @type: The parameters block type, see
> - *	  :c:type:`rkisp1_ext_params_block_type`
> - * @flags: A bitmask of block flags
> - * @size: Size (in bytes) of the parameters block, including this header
> + * The flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
>   */
> -struct rkisp1_ext_params_block_header {
> -	__u16 type;
> -	__u16 flags;
> -	__u32 size;
> -};
> +#define rkisp1_ext_params_block_header v4l2_params_block_header
>  
>  /**
>   * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
> @@ -1594,21 +1546,7 @@ enum rksip1_ext_param_buffer_version {
>  /**
>   * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
>   *
> - * This struct contains the configuration parameters of the RkISP1 ISP
> - * algorithms, serialized by userspace into a data buffer. Each configuration
> - * parameter block is represented by a block-specific structure which contains a
> - * :c:type:`rkisp1_ext_params_block_header` entry as first member. Userspace
> - * populates the @data buffer with configuration parameters for the blocks that
> - * it intends to configure. As a consequence, the data buffer effective size
> - * changes according to the number of ISP blocks that userspace intends to
> - * configure and is set by userspace in the @data_size field.
> - *
> - * The parameters buffer is versioned by the @version field to allow modifying
> - * and extending its definition. Userspace shall populate the @version field to
> - * inform the driver about the version it intends to use. The driver will parse
> - * and handle the @data buffer according to the data layout specific to the
> - * indicated version and return an error if the desired version is not
> - * supported.
> + * This is the driver-specific implementation of :c:type:`v4l2_params_buffer`.
>   *
>   * Currently the single RKISP1_EXT_PARAM_BUFFER_V1 version is supported.
>   * When a new format version will be added, a mechanism for userspace to query
> @@ -1624,11 +1562,6 @@ enum rksip1_ext_param_buffer_version {
>   * the maximum value represents the blocks supported by the kernel driver,
>   * independently of the device instance.
>   *
> - * For each ISP block that userspace wants to configure, a block-specific
> - * structure is appended to the @data buffer, one after the other without gaps
> - * in between nor overlaps. Userspace shall populate the @data_size field with
> - * the effective size, in bytes, of the @data buffer.
> - *
>   * The expected memory layout of the parameters buffer is::
>   *
>   *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
> @@ -1678,4 +1611,11 @@ struct rkisp1_ext_params_cfg {
>  	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
>  };
>  
> +#ifdef __KERNEL__
> +/* Make sure the header is type-convertible to the generic v4l2 params one */
> +static_assert((sizeof(struct rkisp1_ext_params_cfg) -
> +	      RKISP1_EXT_PARAMS_MAX_SIZE) ==
> +	      sizeof(struct v4l2_params_buffer));
> +#endif /* __KERNEL__ */
> +
>  #endif /* _UAPI_RKISP1_CONFIG_H */
> 

-- 
Regards,

Laurent Pinchart

