Return-Path: <linux-media+bounces-58869-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFdEJhC04Gn5kwAAu9opvQ
	(envelope-from <linux-media+bounces-58869-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:04:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C28940CAE4
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 12:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B63A7308DFAC
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879E939E6C7;
	Thu, 16 Apr 2026 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ibfpUMIo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF8E39D6C9;
	Thu, 16 Apr 2026 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333812; cv=none; b=SKQqXeN6CKq9I0Bw6/39uKuuM9B7XvFjZ6ABY3PCnRj8kCn0K9HLnPPg/dw5F6NsjJcM8YUmAleEAnTCWlTF9h7xVNgF/csYisezWk6gO7G3advhB2gjHk88LAxMtoGr82UG20QokOGxdKSjvbCnsYJULEzsHcJzX2vWgzknVko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333812; c=relaxed/simple;
	bh=xU0YRBGwBriggxgLXjZw22QsJWm8fTnTLhFj5XHxyrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxlnwGotRF79nOwEdvtxyE86F9QR4XNQ+HTlkAnXKDm6ro5uzDdtmfI0ZE5OLRY57VoN9kbxLLxtHxQ95hruXPjvx1iJrY4V9o1hqPuDOTCR8CuGbvSx5SEzWYvpMTli68jxVGvw1FFxeFBZjU4R7n2rbowKLCy055jYB2zykro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ibfpUMIo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA9745E;
	Thu, 16 Apr 2026 12:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776333713;
	bh=xU0YRBGwBriggxgLXjZw22QsJWm8fTnTLhFj5XHxyrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibfpUMIoXosjkwCmbnsrs3znBqrF2uhU+DiI+npn2jWfluaze1I8wHgga3HUhgCvj
	 oGYQstXOyYGW4BFmgIaa7xlrz50zJvYxmAoQddO48cIz8S+7FKmoY9AaEqrxKbl0gD
	 GQxZR5AuX8rcdxAZ8QR9ebJbc7QedCvenmtAWM9c=
Date: Thu, 16 Apr 2026 12:03:24 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michael.riesch@collabora.com, anthony.mcgivern@arm.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	jai.luthra@ideasonboard.com, paul.elder@ideasonboard.com
Subject: Re: [PATCH v1 02/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible
 statistics definitions
Message-ID: <aeCscV9eJbfswiAY@zed>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
 <20260413160331.2611829-3-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413160331.2611829-3-antoine.bouyer@nxp.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58869-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4C28940CAE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Antoine,
   thanks for the update

On Mon, Apr 13, 2026 at 06:03:22PM +0200, Antoine Bouyer wrote:
> Extend the v4l2-isp extensible format introduced for isp parameters buffer
> to the statistics buffer as well.
>
> Like for ISP configuration purpose, that will help supporting various ISP
> hardware versions reporting different statistics data with less impact on
> userspace.
>
> The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
> definitions, with similar header, versions and flags. V0 and V1 versions
> are provided to match with params versions. On the other side, ENABLE and
> DISABLE flags are not really meaningfull for statistics purpose. So VALID
> and INVALID flags are introduced. Purpose is to force ISP driver to
> validate a statistics buffer, before it is consumed by userspace.

Is this a leftover ?

I don't see VALID and INVALID in this patch and unless I've missed it
badly I don't see them in the next patches.

I'm fine without them, I'm not sure how you intend to use them to
force drivers to validate a statistics buffer.

>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  include/uapi/linux/media/v4l2-isp.h | 148 +++++++++++++++++++---------
>  1 file changed, 100 insertions(+), 48 deletions(-)
>
> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
> index 779168f9058e..e84476280d43 100644
> --- a/include/uapi/linux/media/v4l2-isp.h
> +++ b/include/uapi/linux/media/v4l2-isp.h
> @@ -13,25 +13,33 @@
>  #include <linux/types.h>
>
>  /**
> - * enum v4l2_isp_params_version - V4L2 ISP parameters versioning
> + * enum v4l2_isp_version - V4L2 ISP serialization format versioning
>   *
> - * @V4L2_ISP_PARAMS_VERSION_V0: First version of the V4L2 ISP parameters format
> - *				(for compatibility)
> - * @V4L2_ISP_PARAMS_VERSION_V1: First version of the V4L2 ISP parameters format
> + * @V4L2_ISP_VERSION_V0: First version of the V4L2 ISP serialization format
> + *                       (for compatibility)
> + * @V4L2_ISP_VERSION_V1: First version of the V4L2 ISP serialization format
>   *
>   * V0 and V1 are identical in order to support drivers compatible with the V4L2
> - * ISP parameters format already upstreamed which use either 0 or 1 as their
> - * versioning identifier. Both V0 and V1 refers to the first version of the
> - * V4L2 ISP parameters format.
> + * ISP format already upstreamed which use either 0 or 1 as their versioning
> + * identifier. Both V0 and V1 refers to the first version of the V4L2 ISP
> + * serialization format.
>   *
> - * Future revisions of the V4L2 ISP parameters format should start from the
> + * Future revisions of the V4L2 ISP serialization format should start from the
>   * value of 2.
>   */
> -enum v4l2_isp_params_version {
> -	V4L2_ISP_PARAMS_VERSION_V0 = 0,
> -	V4L2_ISP_PARAMS_VERSION_V1
> +enum v4l2_isp_version {
> +	V4L2_ISP_VERSION_V0 = 0,
> +	V4L2_ISP_VERSION_V1
>  };
>
> +/*
> + * Compatibility with existing users of v4l2_isp_params which pre-date the
> + * introduction of v4l2_isp_stats.
> + */
> +#define v4l2_isp_params_version			v4l2_isp_version
> +#define V4L2_ISP_PARAMS_VERSION_V0		V4L2_ISP_VERSION_V0
> +#define V4L2_ISP_PARAMS_VERSION_V1		V4L2_ISP_VERSION_V1
> +
>  #define V4L2_ISP_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
>  #define V4L2_ISP_PARAMS_FL_BLOCK_ENABLE		(1U << 1)
>
> @@ -39,64 +47,108 @@ enum v4l2_isp_params_version {
>   * Reserve the first 8 bits for V4L2_ISP_PARAMS_FL_* flag.
>   *
>   * Driver-specific flags should be defined as:
> - * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
> - * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(1))
> + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(0))
> + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(1))
>   */
> -#define V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(n)       ((n) + 8)
> +#define V4L2_ISP_FL_DRIVER_FLAGS(n)		((n) + 8)
>
>  /**
> - * struct v4l2_isp_params_block_header - V4L2 extensible parameters block header
> - * @type: The parameters block type (driver-specific)
> + * struct v4l2_isp_block_header - V4L2 extensible block header
> + * @type: The parameters or statistics block type (driver-specific)
>   * @flags: A bitmask of block flags (driver-specific)
> - * @size: Size (in bytes) of the parameters block, including this header
> + * @size: Size (in bytes) of the block, including this header
>   *
> - * This structure represents the common part of all the ISP configuration
> - * blocks. Each parameters block shall embed an instance of this structure type
> - * as its first member, followed by the block-specific configuration data.
> + * This structure represents the common part of all the ISP configuration or
> + * statistic blocks. Each block shall embed an instance of this structure type
> + * as its first member, followed by the block-specific configuration or
> + * statistic data.
>   *
>   * The @type field is an ISP driver-specific value that identifies the block
> - * type. The @size field specifies the size of the parameters block.
> - *
> - * The @flags field is a bitmask of per-block flags V4L2_PARAMS_ISP_FL_* and
> - * driver-specific flags specified by the driver header.
> + * type. The @size field specifies the size of the block, including this
> + * header.
>   */
> -struct v4l2_isp_params_block_header {
> +struct v4l2_isp_block_header {
>  	__u16 type;
>  	__u16 flags;
>  	__u32 size;
>  } __attribute__((aligned(8)));
>
>  /**
> - * struct v4l2_isp_params_buffer - V4L2 extensible parameters configuration
> - * @version: The parameters buffer version (driver-specific)
> - * @data_size: The configuration data effective size, excluding this header
> - * @data: The configuration data
> + * v4l2_isp_params_block_header - V4L2 extensible parameters block header
>   *
> - * This structure contains the configuration parameters of the ISP algorithms,
> - * serialized by userspace into a data buffer. Each configuration parameter
> - * block is represented by a block-specific structure which contains a
> - * :c:type:`v4l2_isp_params_block_header` entry as first member. Userspace
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
> + * This structure represents the common part of all the ISP configuration blocks
> + * and is identical to :c:type:`v4l2_isp_block_header`.
> + *
> + * The @flags field is a bitmask of per-block flags V4L2_ISP_PARAMS_FL_* and
> + * driver-specific flags specified by the driver header.

What if we move this to the documentation of struct v4l2_isp_block_header
and we only document the macro for compatibility reasons like you did
for `v4l2_isp_params_version` ?

We could add the above to the documentation of `struct
v4l2_isp_block_header`:

 * The @flags field is a bitmask of per-block flags. If a block is used for
 * configuration parameters this field can be a combination of
 * V4L2_ISP_PARAMS_FL_ and driver-specific flags.

Depending on the answer on VALID/INVALID we can document the usage of
flags for stats as:

 * The @flags field is a bitmask of per-block flags. If a block is used for
 * configuration parameters this field can be a combination of
 * V4L2_ISP_PARAMS_FL_ and driver-specific flags. If a block is used
 * for statistics this fields is used to report optional
 * driver-specific flags, if any.


> + */
> +#define v4l2_isp_params_block_header v4l2_isp_block_header

If you accept the above suggestion we can simply document this

/**
 * v4l2_isp_params_block_header - V4L2 extensible parameters compatibility
 *
 * Compatibility with existing users of v4l2_isp_params_block_header
 * which pre-date the introduction of v4l2_isp_block_header.
 *.

> +
> +/**
> + * v4l2_isp_stats_block_header - V4L2 extensible statistics block header
> + *
> + * This structure represents the common part of all the ISP statistics blocks
> + * and is identical to :c:type:`v4l2_isp_block_header`.
> + *
> + * The @flags field is a bitmask of driver-specific flags specified by the
> + * driver header, as there is no generic flags for statistics.
> + */
> +#define v4l2_isp_stats_block_header v4l2_isp_block_header

Do we need this or should we use v4l2_isp_block_header unconditionally ?

> +
> +/**
> + * struct v4l2_isp_buffer - V4L2 extensible buffer
> + * @version: The extensible buffer version (driver-specific)
> + * @data_size: The data effective size, excluding this header
> + * @data: The configuration or statistics data
> + *
> + * This structure contains ISP configuration parameters or ISP hardware
> + * statistics serialized into a data buffer. Each block is represented by a
> + * block-specific structure which contains a :c:type:`v4l2_isp_block_header`
> + * entry as first member.
> + *
> + * For a parameters block, userspace populates the @data buffer with

Or:

    * When used for ISP parameters userspace ..

> + * configuration parameters for the blocks that it intends to configure.
> + * As a consequence, the data buffer effective size changes according to the
> + * number of ISP blocks that userspace intends to configure and is set by
> + * userspace in the @data_size field.
> + *
> + * For a statistics block, behavior is the same as for parameters, except that

Or:

    * When used to report ISP statistics the driver populates the
    * @data buffer with statistics for each supported measurement
    * block. The buffer effective size is set by the driver in the
    * @data_size field.

> + * buffer is filled by the ISP driver.
> + *
> + * The buffer is versioned by the @version field to allow modifying
> + * and extending its definition. The writer shall populate the @version field
> + * to inform the reader about the version it intends to use. The reader will
> + * parse and handle the @data buffer according to the data layout specific to
> + * the indicated version and return an error if the desired version is not
>   * supported.

Ack, I think using "writer" and "reader" is clear enough to support
both the params and stats use case. If we want more clarity we can add
to "driver" and "userspace" a "(role)" in the two previous paragraph.
Something like:

    * When used for ISP parameters userspace (the writer) populates
    * the @data buffer ...

>   *
> - * For each ISP block that userspace wants to configure, a block-specific
> - * structure is appended to the @data buffer, one after the other without gaps
> - * in between. Userspace shall populate the @data_size field with the effective
> - * size, in bytes, of the @data buffer.
> + * For each ISP block, a block-specific structure is appended to the @data
> + * buffer, one after the other without gaps in between. The writer shall
> + * populate the @data_size field with the effective size, in bytes, of the
> + * @data buffer.

If we want to describe @data_size here we can remove it from the above
two paragraphs maybe. I think it's fine to have it here only.

>   */
> -struct v4l2_isp_params_buffer {
> +struct v4l2_isp_buffer {
>  	__u32 version;
>  	__u32 data_size;
>  	__u8 data[] __counted_by(data_size);
>  };
>
> +/**
> + * v4l2_isp_params_buffer - V4L2 extensible parameters configuration

s/configuration/compatibility

> + *
> + * This structure contains the configuration parameters of the ISP algorithms,
> + * serialized into a data buffer. It is identical to
> + * :c:type:`v4l2_isp_buffer`.

And here only

 * Compatibility with existing users of v4l2_isp_params_buffer which
 * pre-date the introduction of v4l2_isp_buffer

> + */
> +#define v4l2_isp_params_buffer v4l2_isp_buffer
> +
> +/**
> + * v4l2_isp_stats_buffer - V4L2 extensible statistics buffer
> + *
> + * This structure contains the statistics data from the ISP hardware,
> + * serialized into a data buffer. It is identical to
> + * :c:type:`v4l2_isp_buffer`.
> + */
> +#define v4l2_isp_stats_buffer v4l2_isp_buffer

Same question as per `v4l2_isp_stats_block_header`. Do we need it ?

Thanks
  j

> +
>  #endif /* _UAPI_V4L2_ISP_H_ */
> --
> 2.51.0
>

