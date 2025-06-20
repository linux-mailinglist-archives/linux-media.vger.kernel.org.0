Return-Path: <linux-media+bounces-35490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 892DEAE1AE5
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 14:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB5837AFB1C
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 12:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FABB28A1D0;
	Fri, 20 Jun 2025 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="djMVE7xF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C3E2080E8
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 12:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422367; cv=none; b=T+t1LccXeNQD0V8Ba+Yjad4jd0h27tkJMbhjCfNtffwuNtzesKPSBXpVZIsDuh4cxML0leC7nNyowEuBY4RQXoDs+LOo1f+zIxsnVLR43d9rb18tJTnOOWB/vvCVeDDVvIq8SrGjC4T1sZUUZlDPMzpj7JTjKa8yij77LZYpvbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422367; c=relaxed/simple;
	bh=T0Qx8KQWK4/64bkA2RdcTEG5pL4UiOo00vqiFnIdCeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtxeDW2CkxTx06KPbFKD8I9/OLulBTeESMFj7cWZrJntopbhw4KC9M6oeNsvNfMNtdsAEu6fBha0GWqeR6jP0u0BVlKczh8PXaWmqSSZ82Qj5sOeuihx5quBiqP2flcKqQZ28DqVUsb+8RdI8nYB3JApuazQqwK/Q4Uv5DS90Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=djMVE7xF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDC1F7FA;
	Fri, 20 Jun 2025 14:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750422348;
	bh=T0Qx8KQWK4/64bkA2RdcTEG5pL4UiOo00vqiFnIdCeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djMVE7xF6WRTbud3q/GdEsmGgb1TVw4Tk6cIBlHsrOeXQeCeiBJcSm0iiSY78a8O9
	 2EIUsLL6bwUAx26OvoES4UyeSniMu0qloFjCDnAQIDI43cpxqHOQwe3lT4W2tgjQIQ
	 b9x1aXsfk3ydNdpukYUSFIv2p0FkUhdLmKUCo/wo=
Date: Fri, 20 Jun 2025 14:25:59 +0200
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
Subject: Re: [PATCH v10 21/64] media: uapi: Add V4L2_CID_METADATA_LAYOUT
 control
Message-ID: <2x6i5l2hvovqpjrmi4uvmpcgwfeicbrdugxzb3yzkugndnlf3w@7ghsqaw54ziq>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-22-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-22-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:53PM +0300, Sakari Ailus wrote:
> The metadata layout control defines the layout of the metadata on the bus.
> It is used on sub-devices that use generic metadata mbus codes on at least
> on one of the pads.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-source.rst      | 6 ++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                   | 1 +
>  include/uapi/linux/v4l2-controls.h                          | 2 ++
>  3 files changed, 9 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 3cb7ee1b0aed..64c0f9ff5b1b 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -145,3 +145,9 @@ Image Source Control IDs
>      of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
>      ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
>      ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> +
> +``V4L2_CID_METADATA_LAYOUT (integer)``
> +    The metadata layout control defines the on-bus metadata layout for metadata
> +    streams. The control is used in conjunction with :ref:`generic metadata
> +    formats <media-bus-format-generic-meta>` formats to specify the layout of the
> +    data.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 9ec65998a8f7..a7ea380de5ee 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1157,6 +1157,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
>  	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
>  	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
> +	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
>
>  	/* Image processing controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 740bf8544446..bb8b0b174a43 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1233,6 +1233,8 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_COLOR_PATTERN_FLIP_BOTH \
>  	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
>
> +#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
> +

We now have

V4L2_CID_COLOR_PATTERN
V4L2_CID_METADATA_LAYOUT

Should the two names be aligned ? V4L2_CID_COLOR_LAYOUT ? Or is it not
necessary ?

Should this be a read only control as well ?


>  /* Image processing controls */
>
>  #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
> --
> 2.39.5
>
>

