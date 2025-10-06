Return-Path: <linux-media+bounces-43765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A4DBBCEC7
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 03:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F0243B2DCA
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 01:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FDF1A238F;
	Mon,  6 Oct 2025 01:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n2oSBluB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F00B79CD;
	Mon,  6 Oct 2025 01:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759713446; cv=none; b=Sf5CJyYNPa2GMAaOQiw4Z57/+oft/rkfl+roGieK3UBoOQZDbLPg0Q6M7vF/PR90bvTrPkJiTj2AY4waz/88HIwkCCvO9un9BCbCCVaU8g7XzxumlzQ6SsWjfUUN5KS3H2H10dA5f41bkEcKfnBodU8NyYM9EoSmYExJbYm+aLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759713446; c=relaxed/simple;
	bh=8/eFHmJ2/TAkjwxEcF2GH9MG9Oaj28I69fTAhc4Byi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THpYY+vyh9Nsgy7f94UzTn+qHaqgfedATcWa3XwSvkM42br7sncPnR/aivi7xv6yrm9CW3IvqOP6Srvvy4QGrAtbi0BNUoqrfoDL2U4vPqwp+tAGe/iRFqInfVmJMLm3SyKZCdNSrNfBbctlnavQsm/Cqssyi8TpfexDeY+JsL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n2oSBluB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6F6A3C67;
	Mon,  6 Oct 2025 03:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759713350;
	bh=8/eFHmJ2/TAkjwxEcF2GH9MG9Oaj28I69fTAhc4Byi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n2oSBluBMueo9kKk77nXRH6FTnZeEFNYdkLctNEJUGbrNvtkZVStPJV2eLRMnqYG9
	 JobOQ47wYyjPMIUrwgwoxGZfvGv/6iXfji4P/+MzgUgUhD+AqG/RnemHnEvQwTIJyX
	 +wJJX9Pex5WvmbZtSfxVxc+NE11DdpgavcFCUat8=
Date: Mon, 6 Oct 2025 04:17:16 +0300
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
Subject: Re: [PATCH v5 4/8] media: Documentation: uapi: Add V4L2 extensible
 parameters
Message-ID: <20251006011716.GD13055@pendragon.ideasonboard.com>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
 <20250915-extensible-parameters-validation-v5-4-e6db94468af3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915-extensible-parameters-validation-v5-4-e6db94468af3@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Sep 15, 2025 at 07:18:13PM +0200, Jacopo Mondi wrote:
> Add documentation for extensible parameters format to the V4L2
> userspace API documentation.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/v4l/extensible-parameters.rst            | 97 ++++++++++++++++++++++
>  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
>  MAINTAINERS                                        |  1 +
>  3 files changed, 99 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/extensible-parameters.rst b/Documentation/userspace-api/media/v4l/extensible-parameters.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..e95c84f90c1b472360306d97c9b27123cd4bb6af
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/extensible-parameters.rst
> @@ -0,0 +1,97 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _extensible-parameters:
> +
> +*************************************
> +V4L2 extensible ISP parameters format
> +*************************************
> +
> +ISP configuration
> +=================
> +
> +ISP configuration parameters are computed by userspace and programmed into a
> +*parameters buffer* which is queued to the ISP driver on a per-frame basis. The
> +layout of the *parameters buffer* generally reflects the ISP peripheral
> +registers layout and is, for this reason, platform specific.

I wouldn't talk about registers here, you can keep this more generic:

The parameters buffer contains ISP-specific parameters, its layout is
therefore driver-specific.

Except that the goal of this API is to standardize the layout...

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
> +Support for generic ISP parameters buffer has been designed with the goal of
> +being:
> +
> +- Extensible: new features can be added later on without breaking the existing
> +  interface
> +- Versioned: different versions of the format can be defined without
> +  breaking the existing interface

All this sounds more like material for a commit message, although I
suppose some design rationale could make sense in the documentation.

> +
> +The extensible parameters format
> +================================
> +
> +Extensible configuration parameters formats are realized by a defining a single
> +C structure that contains a few control parameters and a binary buffer where

"control parameters" is confusing here.

> +userspace programs a variable number of *ISP configuration blocks* data.
> +
> +The generic :c:type:`v4l2_params_buffer` defines a base type that each driver
> +can use by properly sizing the data buffer array by providing a definition of
> +maximum supported parameters buffer size.
> +
> +Each *ISP configuration block* is identified by an header and contains the

s/an header/a header/

> +parameters for that specific block.
> +
> +The generic :c:type:`v4l2_params_block_header` defines a base type that each
> +driver can re-use as it is or extend appropriately.

I'm sorry, extend how ?

> +
> +Userspace applications are responsible for correctly populating the parameters
> +block header fields (type, flags and size) and the block-specific parameters.
> +
> +When userspace wants to configure and enable an ISP block it shall fully
> +populate the block configuration and set the V4L2_PARAMS_FL_BLOCK_ENABLE
> +bit in the flags field.
> +
> +When userspace simply wants to disable an ISP block the
> +V4L2_PARAMS_FL_BLOCK_DISABLE bit should be set in flags field. The driver
> +ignores the rest of the block configuration structure in this case.

The implementation accepts a header with no data in that case. That
should either be documented here, or not supported.

> +
> +If a new configuration of an ISP block has to be applied, userspace shall fully
> +populate the ISP block configuration and omit setting the
> +V4L2_PARAMS_FL_BLOCK_ENABLE and V4L2_PARAMS_FL_BLOCK_DISABLE bits in
> +the flags field.
> +
> +Setting both the V4L2_PARAMS_FL_BLOCK_ENABLE and V4L2_PARAMS_FL_BLOCK_DISABLE
> +bits in the flags field is not allowed and not accepted.
> +
> +Any further development that happens after the ISP driver has been merged in
> +Linux and which requires supporting new ISP features can be implemented by
> +adding new blocks definition without invalidating the existing ones. Similarly,
> +any change to the existing ISP configuration blocks can be handled by versioning
> +them, again without invalidating the existing ones.

That versioning is unrelated to the version field in the buffer header,
it would be implemented by defining a new block type. This should be
clarified here.

There's lots of room for improvement here, the documentation is very
hard to follow for someone who is not deeply familiar with the concepts
already. With the comments above addressed there won't be anything
fundamentally incorrect though, so this file could be rewritten later.

> +
> +V4L2 extensible parameters uAPI data types
> +==========================================
> +
> +.. kernel-doc:: include/uapi/linux/media/v4l2-isp.h
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index 0de80328c36bf148051a19abe9e5241234ddfe5c..b900ed6af7bd9ad49baf7b5a9eef9423f8abfbcb 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -12,6 +12,7 @@ These formats are used for the :ref:`metadata` interface only.
>  .. toctree::
>      :maxdepth: 1
>  
> +    extensible-parameters
>      metafmt-c3-isp
>      metafmt-d4xx
>      metafmt-generic
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e82c3d0758d6033fe8fcd56ffde2c03c4319fd11..abba872cb63f1430a49a2afbace4b9f9958c3991 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26414,6 +26414,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
>  M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
>  F:	include/uapi/linux/media/v4l2-isp.h
>  
>  VF610 NAND DRIVER

-- 
Regards,

Laurent Pinchart

