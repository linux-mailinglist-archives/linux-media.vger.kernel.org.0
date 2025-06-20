Return-Path: <linux-media+bounces-35493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B26F7AE1C06
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 15:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F2DD1BC6E8C
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 13:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C322E28C03F;
	Fri, 20 Jun 2025 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HD/assl/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6053225777
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 13:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425857; cv=none; b=YoZR2jAbtHiBQzh6KNSiEdAbPqbDdN2bnr8EoQ2oS1br/rj9pWPsGb2DHvj2osWGukfUyQmessnidz6pW+Uh/QF2NP3xVJjEYif1jysgBVHS+T2lnAw4c4u4RY0EFSyu00r1aiR4KXzrWkfwx9NLJEv4wvTYPUQ0mtV4ma97vco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425857; c=relaxed/simple;
	bh=HiQ+k0r4k1SU3T20jnVucGd0pJFOJHMji7452IqE1jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6sTCbIzSoSA5FcAtwFZzm7FUp3OqEM+XXqiNyTyra1yjgvJR0XVohXlQlvS4esYKvSTiQd1fTGdsY7imAuzomeYAAoK/gji+ar6bnDnAoJ5Vt3jge12o8XAfLlN4zLufuWamwR+5fxL9FdjIvvb4tnLoANeSJ1d9HGxs/Bmihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HD/assl/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9A43C0B;
	Fri, 20 Jun 2025 15:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750425838;
	bh=HiQ+k0r4k1SU3T20jnVucGd0pJFOJHMji7452IqE1jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HD/assl/VZyMWiV6GTybYC55H+iAvtzMC8yQ3Sk5Ol8ThkgE+IaOjgpyB79BeHJOh
	 1rlom36wzJsY8AL0TwdCTeHmJYUIp9c3AI6A2yMaK5M2JkEg8wTcequOhQ5zQbGFqi
	 M2EuVAsj+Qdi1zo/HsPM9tn0p1nA2oMx7+Ycr6rI=
Date: Fri, 20 Jun 2025 15:24:09 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 24/64] media: uapi: ccs: Add metadata layout for MIPI
 CCS embedded data
Message-ID: <ozeebjfleygstzllqdbjzbigt6i36uplgp2ausgni4ksarnvub@nmjhju3f6rvt>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-25-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-25-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:56PM +0300, Sakari Ailus wrote:
> Add new metadata layout (V4L2_METADATA_LAYOUT_CCS) for MIPI CCS embedded
> data.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/meta-formats.rst  |  1 +
>  .../media/v4l/metadata-layouts.rst            | 39 +++++++++++++++++++
>  .../media/v4l/subdev-formats.rst              |  5 +++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  4 files changed, 46 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/metadata-layouts.rst
>
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index bb6876cfc271..c9b908d5fbea 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -15,6 +15,7 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-c3-isp
>      metafmt-d4xx
>      metafmt-generic
> +    metadata-layouts
>      metafmt-intel-ipu3
>      metafmt-pisp-be
>      metafmt-pisp-fe
> diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
> new file mode 100644
> index 000000000000..5f717d54d1ca
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
> @@ -0,0 +1,39 @@
> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> +
> +.. _media_metadata_layouts:
> +
> +Metadata Layouts
> +----------------
> +
> +The :ref:`metadata layout control <image_source_control_metadata_layout>`
> +specifies the on-bus layout of the metadata on pads with a :ref:`generic
> +metadata mbus code <media-bus-format-generic-meta>` independently of the bit
> +depth.

This has been reviewed by 2 people already, so it might be not having
this clear, but I guess the intention is to say that the metadata
layout control describes how data on the bus should be interpreted by
userspace while the generic metadata mbus code only defines the sample
size ?

I don't really get that from the above paragraph. Feel free to ignore
if it's me only :)


> +
> +.. _media-metadata-layout-ccs:
> +
> +MIPI CCS Embedded Data Layout (``V4L2_METADATA_LAYOUT_CCS``)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
> +metadata layout for sensor embedded data, identified by
> +``V4L2_CID_METADATA_LAYOUT`` control value ``V4L2_METADATA_LAYOUT_CCS``, which
> +is used to store the register configuration used for capturing a given
> +frame. The layout itself is defined in the CCS specification.
> +
> +The CCS embedded data format (code ``0xa``) definition includes three levels:
> +
> +1. Padding within CSI-2 bus :term:`Data Unit` as documented in the MIPI CCS
> +   specification.
> +
> +2. The tagged data format as documented in the MIPI CCS specification.
> +
> +3. Register addresses and register documentation as documented in the MIPI CCS
> +   specification.
> +
> +The ``V4L2_METADATA_LAYOUT_CCS`` metadata layout value shall be used only by
> +devices that fulfill all three levels above.
> +
> +This metadata layout code is only used for "2-byte simplified tagged data
> +format" (code ``0xa``) but their use may be extended further in the future, to
> +cover other CCS embedded data format codes.
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index d6d0e9a0eee1..0bcbf3063dbc 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8510,6 +8510,11 @@ content is more or less device specific but the data is transmitted and received
>  by multiple devices that do not process the data in any way, simply writing
>  it to system memory for processing in software at the end of the pipeline.
>
> +The exact layout of the data generated by the device is reported by the
> +:ref:`V4L2_CID_METADATA_LAYOUT <image_source_control_metadata_layout>`
> +control. For in-memory formats, :ref:`Generic line-based metadata formats
> +<v4l2-format-generic-meta>` are used.
> +
>  "b" in an array cell signifies a byte of data, followed by the number of the bit
>  and finally the bit number in subscript. "x" indicates a padding bit.
>
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index bb8b0b174a43..23112f256da1 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1234,6 +1234,7 @@ enum v4l2_jpeg_chroma_subsampling {
>  	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
>
>  #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
> +#define V4L2_METADATA_LAYOUT_CCS		1U
>
>  /* Image processing controls */
>
> --
> 2.39.5
>
>

