Return-Path: <linux-media+bounces-37318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A5EB0049F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 16:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03AC67AD9EB
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 14:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D87270EB2;
	Thu, 10 Jul 2025 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RL3faLlP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E0E86359;
	Thu, 10 Jul 2025 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752156316; cv=none; b=sfcWuOH4ZfosZpTB60+owu3fhKMkS9siAXAYazvr4R/O4i06tbDPpr5lVpoA1sC5h7TnICjNb97tNDfNIjlUyDp36Sf1YwCu7ng9bP6NBOajrW5AoS3C4l/saY5o9eoUvDi/nDUpq7f9XipU1voVOQc8lNf5vrxKbhYFIJ/GWtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752156316; c=relaxed/simple;
	bh=Zu0mClNS7+sxxgVa0p7ZYy72Q23B1pqGZfOdOe9mBM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqZQ3hHdYVOyAGPJIjPdL+LH1MLljOuEUCHRK+CLN/Luz2h2/fEkASkRJl3RxUwaRfCIpyv9QBXMYGDhbj9kX14KfDeUt0rQY/bhrdmNiB+DDTDF6zkVikFaX4QS9hYU2W9sv6zsunBPbWRxnolyMELY7IcUPBbwU57cizdKlDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RL3faLlP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1529B2B;
	Thu, 10 Jul 2025 16:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752156285;
	bh=Zu0mClNS7+sxxgVa0p7ZYy72Q23B1pqGZfOdOe9mBM4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RL3faLlPvXX8dwvPDdbt+hKSUhVDPlkXoiKRnemZCwgSnwDkOXCdOSoca3RP94ZKZ
	 9Qcmptm7HpbB8k9xI3X9hO//UnXK3VbEK1Qyq1/Dlj4Emb3VW1Kgg9jgbLW1Qfvwof
	 EVu1oXqdIzq/q6L3F9qGApDwZ4EXTdAAkrPQYfqA=
Message-ID: <97ae2619-52b9-4d83-9243-1274eef0c0d1@ideasonboard.com>
Date: Thu, 10 Jul 2025 15:05:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] media: uapi: Convert Amlogic C3 to V4L2 extensible
 params
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
 <20250710-extensible-parameters-validation-v2-3-7ec8918ec443@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250710-extensible-parameters-validation-v2-3-7ec8918ec443@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 10/07/2025 14:52, Jacopo Mondi wrote:
> With the introduction of common types for extensible parameters
> format, convert the c3-isp-config.h header to use the new types.
>
> Factor-out the documentation that is now part of the common header
> and only keep the driver-specific on in place.
>
> The conversion to use common types doesn't impact userspace as the
> new types are either identical to the ones already existing in the
> C3 ISP uAPI or are 1-to-1 type convertible.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   include/uapi/linux/media/amlogic/c3-isp-config.h | 48 ++++++++----------------
>   1 file changed, 15 insertions(+), 33 deletions(-)
>
> diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
> index ed085ea62a574932c7ad8d59d34b2c5c74a597d8..15d3ac289ece610132e1d4b43ecd56b7ef527ef6 100644
> --- a/include/uapi/linux/media/amlogic/c3-isp-config.h
> +++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
> @@ -6,8 +6,13 @@
>   #ifndef _UAPI_C3_ISP_CONFIG_H_
>   #define _UAPI_C3_ISP_CONFIG_H_
>   
> +#ifdef __KERNEL__
> +#include <linux/build_bug.h>
> +#endif /* __KERNEL__ */
>   #include <linux/types.h>
>   
> +#include <linux/media/v4l2-extensible-params.h>
> +
>   /*
>    * Frames are split into zones of almost equal width and height - a zone is a
>    * rectangular tile of a frame. The metering blocks within the ISP collect
> @@ -183,11 +188,6 @@ enum c3_isp_params_block_type {
>    * struct c3_isp_params_block_header - C3 ISP parameter block header
>    *
>    * This structure represents the common part of all the ISP configuration
> - * blocks. Each parameters block shall embed an instance of this structure type
> - * as its first member, followed by the block-specific configuration data. The
> - * driver inspects this common header to discern the block type and its size and
> - * properly handle the block content by casting it to the correct block-specific
> - * type.
>    *
>    * The @type field is one of the values enumerated by
>    * :c:type:`c3_isp_params_block_type` and specifies how the data should be
> @@ -223,15 +223,8 @@ enum c3_isp_params_block_type {
>    *			gamma->pst_gamma_lut[i] = i;
>    *	}
>    *
> - * @type: The parameters block type from :c:type:`c3_isp_params_block_type`
> - * @flags: A bitmask of block flags
> - * @size: Size (in bytes) of the parameters block, including this header
>    */
> -struct c3_isp_params_block_header {
> -	__u16 type;
> -	__u16 flags;
> -	__u32 size;
> -};
> +#define c3_isp_params_block_header v4l2_params_block_header
>   
>   /**
>    * struct c3_isp_params_awb_gains - Gains for auto-white balance
> @@ -498,26 +491,9 @@ struct c3_isp_params_blc {
>   /**
>    * struct c3_isp_params_cfg - C3 ISP configuration parameters
>    *
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
>    *
>    * The expected memory layout of the parameters buffer is::
>    *
> @@ -561,4 +537,10 @@ struct c3_isp_params_cfg {
>   	__u8 data[C3_ISP_PARAMS_MAX_SIZE];
>   };
>   
> +#ifdef __KERNEL__
> +/* Make sure the header is type-convertible to the generic v4l2 params one */
> +static_assert((sizeof(struct c3_isp_params_cfg) - C3_ISP_PARAMS_MAX_SIZE) ==
> +	      sizeof(struct v4l2_params_buffer));
> +#endif /* __KERNEL__ */
> +
>   #endif
>

