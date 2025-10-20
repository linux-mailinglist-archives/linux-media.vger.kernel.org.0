Return-Path: <linux-media+bounces-44993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EDDBEFD38
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C4804EEA0A
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0104D2E92A6;
	Mon, 20 Oct 2025 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bDq9v8Om"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9F01CEAD6;
	Mon, 20 Oct 2025 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947811; cv=none; b=pSZ156Y3xK4hUyEPR7k/SzIjHhXvL9KusqdVPFlbsvA/jdjXQDksTSVKrdub0X+OUiGcllDKe+TjRiiXHHR4juZynku0cr3I8eLlRtP+bB9JhiWy9KuorVIo0j/EnFLGkdvGF9sVacnPouvsiWVF8M2u3atTIWqXLx64H6InpEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947811; c=relaxed/simple;
	bh=4iTaVkDVhtqNyH1zPiNke9J2lhCuLxffwy/MAYaW6jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ML3Sm1cwxREl/Rc3yQuaHCeN02Xvcfb38ralSBD0s66RDCW50ZWaJL3ZSDjVMX3qpYd/4ag0fLif1UEoINeLpgxQNmsjW/1cd6/YGznsvwJ/7wBcQ5R2TPPU7uOX1pSrgQOVHeEv+5fk4m3rbTgiMVA2sYVwxbb7wzLRUFUzbKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bDq9v8Om; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86690E01;
	Mon, 20 Oct 2025 10:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760947700;
	bh=4iTaVkDVhtqNyH1zPiNke9J2lhCuLxffwy/MAYaW6jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDq9v8OmBd8NMgmv/AVhWufA9zEPAt03EEofP3nB8gL5ziak6gTLDnogdbUkz1REJ
	 AnFFeU7D/Rzswq3Xp878D/Qwu5FVi0Tu6k5ylEcT/PSyQmN/aSss+UZWZ9Hv+an0nz
	 qSm5o+QsyH6WWhrK9M7jq9GhneRzmc96/o+EVpAg=
Date: Mon, 20 Oct 2025 10:09:59 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Antoine Bouyer <antoine.bouyer@nxp.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 4/8] media: Documentation: uapi: Add V4L2 ISP
 documentation
Message-ID: <bprg66hg3xoetosl7dwt2rcs6mpcksfalymmyidla6qvdrnm7u@fpn6237j25ir>
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
 <20251014-extensible-parameters-validation-v7-4-6628bed5ca98@ideasonboard.com>
 <e82e7c1d-b4ac-49a0-9b76-d101395c7040@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e82e7c1d-b4ac-49a0-9b76-d101395c7040@collabora.com>

Hi Michael

  thanks for review. I took all comments in but..


On Tue, Oct 14, 2025 at 11:23:29AM +0200, Michael Riesch wrote:
> Hi Jacopo,
>
> Thanks for your efforts!
>
> On 10/14/25 10:00, Jacopo Mondi wrote:
> > [...]
> > +
> > +The uAPI/ABI problem
> > +--------------------
> > +
> > +By upstreaming the metadata formats that describe the parameters and statistics
> > +buffers layout, driver developers make them part of the Linux kernel ABI. As it
> > +sometimes happens for most peripherals in Linux, ISP drivers development is
> > +often an iterative process, where sometimes not all the hardware features are
> > +supported in the first version that lands in the kernel, and some parts of the
> > +interface have to later be modified for bug-fixes or improvements.
>
> Suggestion:
>
> As for most peripherals, ISP driver development in Linux is often an
> iterative process, in which not all of the hardware features are
> supported in the first version. The support for them and/or bug fixes
> may land in the kernel at a later stage.
>
> > +
> > +If any later bug-fix/improvement requires changes to the metadata formats,
>
> s/bug-fix/bug fix
>
> > +this is considered an ABI-breakage that is strictly forbidden by the Linux
>
> s/ABI-breakage/ABI breakage
>
> > +kernel policies. For this reason, any change in the ISP parameters and
> > +statistics buffer layout would require defining a new metadata format.
> > +
> > +For these reasons Video4Linux2 has introduced support for generic ISP parameters
> > +and statistics data types, designed with the goal of being:
> > +
> > +- Extensible: new features can be added later on without breaking the existing
> > +  interface
> > +- Versioned: different versions of the format can be defined without
> > +  breaking the existing interface
> > +
> > +ISP configuration
> > +=================
> > +
> > +Before the introduction of generic formats
> > +------------------------------------------
> > +
> > +Metadata cature formats that describe ISP configuration parameters were most
>
> s/cature/capture
>
> s/most the time/"most of the time" or "typically" or "usually" or
> "normally"?
>
> > +the time realized by defining C structures that reflect the ISP registers layout
> > +and gets populated by userspace before queueing the buffer to the ISP. Each
>
> s/gets/get
>
> > +C structure usually corresponds to one ISP *processing block*, with each block
> > +implementing one of the ISP supported features.
> > +
> > +The number of supported ISP blocks, the layout of their configuration data are
> > +fixed by the format definition, incurring the in the above described uAPI/uABI
> > +problems.
>
> incurring the described uAPI/ABI problems described above.
>

.. this one, for which I think the correct form is

 > +The number of supported ISP blocks, the layout of their configuration data are
 > +fixed by the format definition, incurring in the above described uAPI/uABI
 > +problem.

Thanks
  j

> > +
> > +Generic ISP parameters
> > +----------------------
> > +
> > +The generic ISP configuration parameters format is realized by a defining a
> > +single C structure that contains an header, followed by a binary buffer where
>
> s/an header/a header
>
> > +userspace programs a variable number of ISP configuration data block, one for
> > +each supported ISP feature.
> > +
> > +The :c:type:`v4l2_isp_params_buffer` structure defines the parameters buffer
> > +header which is followed by a binary buffer of ISP configuration parameters.
> > +Userspace shall correctly populate the buffer header with the versioning
> > +information and with the size (in bytes) of the binary data buffer where it will
> > +store the ISP blocks configuration.
> > +
> > +Each *ISP configuration block* is preceded by an header implemented by the
> > +:c:type:`v4l2_isp_params_block_header` structure, followed by the configuration
> > +parameters for that specific block, defined by the ISP driver specific data
> > +types.
> > +
> > +Userspace applications are responsible for correctly populating each block's
> > +header fields (type, flags and size) and the block-specific parameters.
> > +
> > +ISP Block enabling, disabling and configuration
> > +-----------------------------------------------
> > +
> > +When userspace wants to configure and enable an ISP block it shall fully
> > +populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
> > +bit in the block header's `flags` field.
> > +
> > +When userspace simply wants to disable an ISP block the
> > +V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bit should be set in block header's `flags`
> > +field. Drivers accept a configuration parameters block with no additional
> > +data after the header in this case.
> > +
> > +If the configuration of an already active ISP block has to be updated,
> > +userspace shall fully populate the ISP block parameters and omit setting the
> > +V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the
> > +header's `flags` field.
> > +
> > +Setting both the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and
> > +V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the flags field is not allowed and not
> > +accepted.
> > +
> > +Any further extension to the parameters layout that happens after the ISP driver
> > +has been merged in Linux can be implemented by adding new blocks definition
> > +without invalidating the existing ones.
> > +
> > +ISP statistics
> > +==============
> > +
> > +Support for generic statistics format is not yet implemented in Video4Linux2.
> > +
> > +V4L2 ISP uAPI data types
> > +========================
> > +
> > +.. kernel-doc:: include/uapi/linux/media/v4l2-isp.h
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e9ac834d212f88222437e8d806800b2516d44f01..340353334299cd5eebf1f72132b7e91b6f5fdbfe 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26857,6 +26857,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
> >  M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> > +F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
> >  F:	include/uapi/linux/media/v4l2-isp.h
> >
> >  VF610 NAND DRIVER
> >
>
>
> With the comments above addressed,
>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
>
> Thanks and best regards,
> Michael
>
>

