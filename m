Return-Path: <linux-media+bounces-37319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2239CB004C5
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 16:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46EA5176B45
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 14:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F41C270EB0;
	Thu, 10 Jul 2025 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b8QQKNYj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FBF26B09F;
	Thu, 10 Jul 2025 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752156413; cv=none; b=s8ypnvSl9fUOxDGiV3M7WvFXRjLufEHT9RNKkR7bUwGodmQOHEmAzbML2lxBNBd77Ov00AroZAsH8wvi/u9BbsihOQJ+NG80/hz7xpjRc2riAiqSoRgdXXRGE4Gs11WmM1dp3mhrJIBu/VyHt/eb9QXOMQa2h77sLVJXQDcxVNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752156413; c=relaxed/simple;
	bh=wZyoR1Sk8OiI0zPRrx2vPd/wlyqElWqPnmAESsxLMT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ox4u3chUewpCyb3eJsw3cmGXh6N+CPArVOvj+YN05P/qvNyWdPyE2gjrOoiwhA+JZGu0Q67Arylmy0ch7JEFtzQGT/MwKmoXFYeqQqVHrJ4ulnmu4YQGRYkMW2dMG57lIeDrw9ismHEdpSKYUu1+4YI4CzBWklHBa19HgaZloEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b8QQKNYj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8739B2B;
	Thu, 10 Jul 2025 16:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752156381;
	bh=wZyoR1Sk8OiI0zPRrx2vPd/wlyqElWqPnmAESsxLMT0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b8QQKNYjAwQ8nGR7H41B2ZRKJmzQBeUhOxyVtTa3DCEnk4c1o/XzLo3Keh2Wumuqp
	 S5LC5BcQT3qDh1CLLXXFXVGbiKnbKhDKswagiCYa2T7DOPkE79kShaKVbmfnUeELBE
	 9EA+G2H+n1fkJjdLp04SlCx5WSMNjhq4Nr7vuYSU=
Message-ID: <80b23a96-fde6-43e3-9b24-98099823a6f5@ideasonboard.com>
Date: Thu, 10 Jul 2025 15:06:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: Documentation: uapi: Add V4L2 extensible
 parameters
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com>
 <20250710-extensible-parameters-validation-v2-4-7ec8918ec443@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250710-extensible-parameters-validation-v2-4-7ec8918ec443@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 10/07/2025 14:52, Jacopo Mondi wrote:
> Add documentation for extensible parameters format to the V4L2
> userspace API documentation.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>   .../media/v4l/extensible-parameters.rst            | 89 ++++++++++++++++++++++
>   .../userspace-api/media/v4l/meta-formats.rst       |  1 +
>   MAINTAINERS                                        |  1 +
>   3 files changed, 91 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/extensible-parameters.rst b/Documentation/userspace-api/media/v4l/extensible-parameters.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..c4caa5c1df991d4dd91f986571db55135d15204a
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/extensible-parameters.rst
> @@ -0,0 +1,89 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _extensible-parameters:
> +
> +**********************************
> + V4L2 extensible parameters format
> +**********************************
> +
> +ISP configuration
> +=================
> +
> +ISP configuration parameters are computed by userspace and programmed into a
> +*parameters buffer* which is queued to the ISP driver on a per-frame basis. The
> +layout of the *parameters buffer* generally reflects the ISP peripheral
> +registers layout and is, for this reason, platform specific.
> +
> +The ISP configuration parameters are passed to the ISP driver through a metadata
> +output video node, using the :c:type:`v4l2_meta_format` interface. Each ISP
> +driver defines a metadata format that implements the configuration parameters
> +layout.
> +
> +Metadata output formats that describe ISP configuration parameters are most of
> +the time realized by implementing C structures that reflect the registers layout
> +and gets populated by userspace before queueing the buffer to the ISP. Each
> +C structure usually corresponds to one ISP *processing block*, with each block
> +implementing one of the ISP supported features.
> +
> +The uAPI/ABI problem
> +--------------------
> +
> +By upstreaming data types that describe the configuration parameters layout,
> +driver developers make them part of the Linux kernel ABI. As it sometimes
> +happens for most peripherals in Linux, ISP drivers development is often an
> +iterative process, where sometimes not all the hardware features are supported
> +in the first version that lands in the kernel, and some parts of the interface
> +have to later be modified for bug-fixes or improvements.
> +
> +If any later bug-fix/improvement requires changes to the metadata output format,
> +this is considered an ABI-breakage that is strictly forbidden by the Linux
> +kernel policies. For this reason, each new iteration of an ISP driver support
> +would require defining a new metadata output format, implying that drivers have
> +to be made ready to handle several different configuration formats.
> +
> +A new set of metadata output formats has then to be defined, with the design
> +goals of being:
> +
> +- Extensible: new features can be added later on without breaking the existing
> +  interface
> +- Versioned: different versions of the format can be defined without
> +  breaking the existing interface
> +
> +The extensible parameters format
> +================================
> +
> +Extensible configuration formats are realized by a defining a single C structure
> +that contains a few control parameters and a binary buffer where userspace
> +programs a variable number of *ISP configuration blocks* data.
> +
> +The generic :c:type:`v4l2_params_buffer` defines a base type that each driver
> +can use by properly sizing the data buffer array.
> +
> +Each *ISP configuration block* is identified by an header and contains the
> +parameters for that specific block.
> +
> +The generic :c:type:`v4l2_params_block_header` defines a base type that each
> +driver can re-use as it is or extend appropriately.
> +
> +Userspace applications program in the control buffer only the parameters of the
> +ISP whose configuration has changed for the next frame. The ISP driver parses
> +the configuration parameters and apply them to the hardware register.
> +
> +Any further development that happens after the ISP driver has been merged in
> +Linux and which requires supporting new ISP features can be implemented by
> +adding new blocks definition without invalidating the existing ones. Similarly,
> +any change to the existing ISP configuration blocks can be handled by versioning
> +them, again without invalidating the existing ones.
> +
> +Implementations
> +---------------
> +
> +ISP drivers that define an extensible parameters metadata output format:
> +
> +- :ref:`RkISP1 <v4l2-meta-fmt-rk-isp1-ext-params>`
> +- :ref:`Amlogic C3 ISP <v4l2-meta-fmt-c3isp-params>`
> +
> +V4L2 extensible parameters uAPI data types
> +==========================================
> +
> +.. kernel-doc:: include/uapi/linux/media/v4l2-extensible-params.h
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index bb6876cfc271e1a0543eee4209d6251e1a6a73cc..58eb3c9c962bee008eee27d9c16678213c47baa9 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -12,6 +12,7 @@ These formats are used for the :ref:`metadata` interface only.
>   .. toctree::
>       :maxdepth: 1
>   
> +    extensible-parameters
>       metafmt-c3-isp
>       metafmt-d4xx
>       metafmt-generic
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 49a9329e5fe8874bdbaca13946ea28bd80134cb3..beecac86991d988c48d31366ba5201b09ef25715 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25972,6 +25972,7 @@ V4L2 EXTENSIBLE PARAMETERS FORMAT
>   M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
> +F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
>   F:	include/uapi/linux/media/v4l2-extensible-params.h
>   
>   VF610 NAND DRIVER
>

