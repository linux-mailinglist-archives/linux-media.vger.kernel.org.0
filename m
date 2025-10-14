Return-Path: <linux-media+bounces-44382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D0EBD86B8
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 11:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B6494F8D99
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209A12E7160;
	Tue, 14 Oct 2025 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hDc+EcM3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490382080C1;
	Tue, 14 Oct 2025 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433814; cv=none; b=Wle3vjpd5KFtWm2gGHZCheLjWeyAOona+hnV78Jpbr1UPOqOJI+V32KpFL3h8eDzaYmykrTTGvLwn4lVmL/0yXCV+nntm/ReWPx8PDuxd5DJvFFRJzRLHfrTtxMV2RRlRsTbSI4Focjk+yIWvBtRoLqrMlH3ay1t/K8sPm2il+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433814; c=relaxed/simple;
	bh=c4Ter1k+l2031VS1wEDhFTTsF7XzTSEc5HpxZV87q0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIA85+tc4I7scqE0cgJoRTxMSKITKqBL42cJ17geMdJLWZ/eRwVF6MTBpfePhjgGw6tnbJ32taAs8r8jk6spuhKCRqotUGM9/gmRxrQ3P9g8/wwsi/wry8/vjrviyEHmkUx7QJHO+sPmeAHGZwDzZge3UGGON3wNVW8dO8it3cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hDc+EcM3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760433810;
	bh=c4Ter1k+l2031VS1wEDhFTTsF7XzTSEc5HpxZV87q0Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hDc+EcM3MZWzV7bN9i3J9KDBnRw/5tWRtouPjs4rbezEI/f0qExavMyLOORUx9iob
	 McMkjjWVowAuIGZRYz6OaRIhLDHfKilGEcJxid9LlNZFbx4cgLBCQmQNAQFJ+2iXDg
	 l65D0PJ0gY2W9uYlnnudhHC8joSKi8BDFKNR+PTI5p9/ppNIsJcf23QMTxorYhpVwp
	 pdwg2mrnoTrNX08j5wQbb1CVBlLsllIGAlBMxSRYZOuwxDsaNHDoA4EqaXceFQE+5x
	 y8ou4ISkjpeZ1c/4n5LMMewvV/r75XvSACqMwnvDViKnG5Bct2JQQQcByG9Qlm041u
	 OqQJWNecIHcFg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B52E317E1283;
	Tue, 14 Oct 2025 11:23:29 +0200 (CEST)
Message-ID: <e82e7c1d-b4ac-49a0-9b76-d101395c7040@collabora.com>
Date: Tue, 14 Oct 2025 11:23:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] media: Documentation: uapi: Add V4L2 ISP
 documentation
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
 <20251014-extensible-parameters-validation-v7-4-6628bed5ca98@ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-4-6628bed5ca98@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

Thanks for your efforts!

On 10/14/25 10:00, Jacopo Mondi wrote:
> [...]
> +
> +The uAPI/ABI problem
> +--------------------
> +
> +By upstreaming the metadata formats that describe the parameters and statistics
> +buffers layout, driver developers make them part of the Linux kernel ABI. As it
> +sometimes happens for most peripherals in Linux, ISP drivers development is
> +often an iterative process, where sometimes not all the hardware features are
> +supported in the first version that lands in the kernel, and some parts of the
> +interface have to later be modified for bug-fixes or improvements.

Suggestion:

As for most peripherals, ISP driver development in Linux is often an
iterative process, in which not all of the hardware features are
supported in the first version. The support for them and/or bug fixes
may land in the kernel at a later stage.

> +
> +If any later bug-fix/improvement requires changes to the metadata formats,

s/bug-fix/bug fix

> +this is considered an ABI-breakage that is strictly forbidden by the Linux

s/ABI-breakage/ABI breakage

> +kernel policies. For this reason, any change in the ISP parameters and
> +statistics buffer layout would require defining a new metadata format.
> +
> +For these reasons Video4Linux2 has introduced support for generic ISP parameters
> +and statistics data types, designed with the goal of being:
> +
> +- Extensible: new features can be added later on without breaking the existing
> +  interface
> +- Versioned: different versions of the format can be defined without
> +  breaking the existing interface
> +
> +ISP configuration
> +=================
> +
> +Before the introduction of generic formats
> +------------------------------------------
> +
> +Metadata cature formats that describe ISP configuration parameters were most

s/cature/capture

s/most the time/"most of the time" or "typically" or "usually" or
"normally"?

> +the time realized by defining C structures that reflect the ISP registers layout
> +and gets populated by userspace before queueing the buffer to the ISP. Each

s/gets/get

> +C structure usually corresponds to one ISP *processing block*, with each block
> +implementing one of the ISP supported features.
> +
> +The number of supported ISP blocks, the layout of their configuration data are
> +fixed by the format definition, incurring the in the above described uAPI/uABI
> +problems.

incurring the described uAPI/ABI problems described above.

> +
> +Generic ISP parameters
> +----------------------
> +
> +The generic ISP configuration parameters format is realized by a defining a
> +single C structure that contains an header, followed by a binary buffer where

s/an header/a header

> +userspace programs a variable number of ISP configuration data block, one for
> +each supported ISP feature.
> +
> +The :c:type:`v4l2_isp_params_buffer` structure defines the parameters buffer
> +header which is followed by a binary buffer of ISP configuration parameters.
> +Userspace shall correctly populate the buffer header with the versioning
> +information and with the size (in bytes) of the binary data buffer where it will
> +store the ISP blocks configuration.
> +
> +Each *ISP configuration block* is preceded by an header implemented by the
> +:c:type:`v4l2_isp_params_block_header` structure, followed by the configuration
> +parameters for that specific block, defined by the ISP driver specific data
> +types.
> +
> +Userspace applications are responsible for correctly populating each block's
> +header fields (type, flags and size) and the block-specific parameters.
> +
> +ISP Block enabling, disabling and configuration
> +-----------------------------------------------
> +
> +When userspace wants to configure and enable an ISP block it shall fully
> +populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
> +bit in the block header's `flags` field.
> +
> +When userspace simply wants to disable an ISP block the
> +V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bit should be set in block header's `flags`
> +field. Drivers accept a configuration parameters block with no additional
> +data after the header in this case.
> +
> +If the configuration of an already active ISP block has to be updated,
> +userspace shall fully populate the ISP block parameters and omit setting the
> +V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the
> +header's `flags` field.
> +
> +Setting both the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and
> +V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the flags field is not allowed and not
> +accepted.
> +
> +Any further extension to the parameters layout that happens after the ISP driver
> +has been merged in Linux can be implemented by adding new blocks definition
> +without invalidating the existing ones.
> +
> +ISP statistics
> +==============
> +
> +Support for generic statistics format is not yet implemented in Video4Linux2.
> +
> +V4L2 ISP uAPI data types
> +========================
> +
> +.. kernel-doc:: include/uapi/linux/media/v4l2-isp.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9ac834d212f88222437e8d806800b2516d44f01..340353334299cd5eebf1f72132b7e91b6f5fdbfe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26857,6 +26857,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
>  M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
>  F:	include/uapi/linux/media/v4l2-isp.h
>  
>  VF610 NAND DRIVER
> 


With the comments above addressed,

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael


