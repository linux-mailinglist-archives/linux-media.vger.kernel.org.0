Return-Path: <linux-media+bounces-37317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D6BB004BD
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 16:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCDA7161411
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 14:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75207270EB2;
	Thu, 10 Jul 2025 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VpGISEAu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304E986359;
	Thu, 10 Jul 2025 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752156253; cv=none; b=IMSvDWllEkztIwNEYb9LbpMuh1L6/XUzAs3PTUSKhhFLsTFh1WzTU+wxUa15En2h3SR/opVbQyxnRcwcD7xVDAY9f6mmbV35maLHINV+kFdsC9r6Oo7v16w1jxaTLQ/qbPjqOtKXHCgH1QS12HQeTROQ0eMzJ5OQvCdFpDNpWAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752156253; c=relaxed/simple;
	bh=E6E5jC+yON1u4h5qlGeDw0gPDFF8OtXtHZqpoFw4DGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElrbTlGgoEIDN5LEMkhpl036Px/NinsphDQP4e0L2251OeNUhH9M4Gdaq50JIWhwZEnih7QAWMC3zMkyTXB0JvYzUtrUX4a6Bwbi379vPxgNeB499fMBRsqclxGTcltWdZIkc90S1xEvKquBXBwtXWwjh22QzR5wtFXQnW2mt/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VpGISEAu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EA1EB2B;
	Thu, 10 Jul 2025 16:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752156222;
	bh=E6E5jC+yON1u4h5qlGeDw0gPDFF8OtXtHZqpoFw4DGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VpGISEAuZAXMLpX18IZ5UapY0iITq2XHNSw4UrTLojlZSLocKEx0Wiil1cajfc+NJ
	 Og9V3QRo1rGWyPFcLg65r/GjJpQxEf2Z9FpsWfOuqshOWAHi2nijDRG9kc9KfNOj5A
	 2Z5CVy2KRfUoC0VBqfGNvcGbAVjJemKuYBSI0Ft4=
Message-ID: <eff0974a-7217-4e36-84aa-f42fbe5b2882@ideasonboard.com>
Date: Thu, 10 Jul 2025 15:04:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] media: uapi: Convert RkISP1 to V4L2 extensible
 params
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
 <20250710-extensible-parameters-validation-v2-2-7ec8918ec443@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250710-extensible-parameters-validation-v2-2-7ec8918ec443@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 10/07/2025 14:52, Jacopo Mondi wrote:
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
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>   include/uapi/linux/rkisp1-config.h | 67 +++++++++++++-------------------------
>   1 file changed, 23 insertions(+), 44 deletions(-)
>
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 3b060ea6eed71b87d79abc8401eae4e9c9f5323a..fc040c7fb13cf18eaf8d9067e7be38bff120e6f6 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -7,8 +7,13 @@
>   #ifndef _UAPI_RKISP1_CONFIG_H
>   #define _UAPI_RKISP1_CONFIG_H
>   
> +#ifdef __KERNEL__
> +#include <linux/build_bug.h>
> +#endif /* __KERNEL__ */
>   #include <linux/types.h>
>   
> +#include <linux/media/v4l2-extensible-params.h>
> +
>   /* Defect Pixel Cluster Detection */
>   #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
>   /* Black Level Subtraction */
> @@ -1158,26 +1163,21 @@ enum rkisp1_ext_params_block_type {
>   	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
>   };
>   
> -#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> -#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
> +#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	V4L2_PARAMS_FL_BLOCK_DISABLE
> +#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	V4L2_PARAMS_FL_BLOCK_ENABLE
>   
>   /* A bitmask of parameters blocks supported on the current hardware. */
>   #define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS	(V4L2_CID_USER_RKISP1_BASE + 0x01)
>   
>   /**
> - * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
> - *					   header
> + * rkisp1_ext_params_block_header - RkISP1 extensible parameters block header
>    *
>    * This structure represents the common part of all the ISP configuration
> - * blocks. Each parameters block shall embed an instance of this structure type
> - * as its first member, followed by the block-specific configuration data. The
> - * driver inspects this common header to discern the block type and its size and
> - * properly handle the block content by casting it to the correct block-specific
> - * type.
> + * blocks and is identical to :c:type:`v4l2_params_block_header`.
>    *
> - * The @type field is one of the values enumerated by
> + * The type field is one of the values enumerated by
>    * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
> - * interpreted by the driver. The @size field specifies the size of the
> + * interpreted by the driver. The size field specifies the size of the
>    * parameters block and is used by the driver for validation purposes.
>    *
>    * The @flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
> @@ -1193,14 +1193,14 @@ enum rkisp1_ext_params_block_type {
>    * If a new configuration of an ISP block has to be applied userspace shall
>    * fully populate the ISP block configuration and omit setting the
>    * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits
> - * in the @flags field.
> + * in the flags field.
>    *
>    * Setting both the RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and
> - * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the @flags field is not allowed
> + * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the flags field is not allowed
>    * and not accepted by the driver.
>    *
>    * Userspace is responsible for correctly populating the parameters block header
> - * fields (@type, @flags and @size) and the block-specific parameters.
> + * fields (type, flags and size) and the block-specific parameters.
>    *
>    * For example:
>    *
> @@ -1220,17 +1220,8 @@ enum rkisp1_ext_params_block_type {
>    *		bls->config.fixed_val.gb = blackLevelGreenB_;
>    *		bls->config.fixed_val.b = blackLevelBlue_;
>    *	}
> - *
> - * @type: The parameters block type, see
> - *	  :c:type:`rkisp1_ext_params_block_type`
> - * @flags: A bitmask of block flags
> - * @size: Size (in bytes) of the parameters block, including this header
>    */
> -struct rkisp1_ext_params_block_header {
> -	__u16 type;
> -	__u16 flags;
> -	__u32 size;
> -};
> +#define rkisp1_ext_params_block_header v4l2_params_block_header
>   
>   /**
>    * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
> @@ -1594,21 +1585,7 @@ enum rksip1_ext_param_buffer_version {
>   /**
>    * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
>    *
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
>    *
>    * Currently the single RKISP1_EXT_PARAM_BUFFER_V1 version is supported.
>    * When a new format version will be added, a mechanism for userspace to query
> @@ -1624,11 +1601,6 @@ enum rksip1_ext_param_buffer_version {
>    * the maximum value represents the blocks supported by the kernel driver,
>    * independently of the device instance.
>    *
> - * For each ISP block that userspace wants to configure, a block-specific
> - * structure is appended to the @data buffer, one after the other without gaps
> - * in between nor overlaps. Userspace shall populate the @data_size field with
> - * the effective size, in bytes, of the @data buffer.
> - *
>    * The expected memory layout of the parameters buffer is::
>    *
>    *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
> @@ -1678,4 +1650,11 @@ struct rkisp1_ext_params_cfg {
>   	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
>   };
>   
> +#ifdef __KERNEL__
> +/* Make sure the header is type-convertible to the generic v4l2 params one */
> +static_assert((sizeof(struct rkisp1_ext_params_cfg) -
> +	      RKISP1_EXT_PARAMS_MAX_SIZE) ==
> +	      sizeof(struct v4l2_params_buffer));
> +#endif /* __KERNEL__ */
> +
>   #endif /* _UAPI_RKISP1_CONFIG_H */
>

