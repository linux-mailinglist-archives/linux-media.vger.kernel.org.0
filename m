Return-Path: <linux-media+bounces-50510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 340E6D17674
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A91D33005185
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 08:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B7937BE84;
	Tue, 13 Jan 2026 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tsq6U+lt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315DE365A1E;
	Tue, 13 Jan 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294519; cv=none; b=ltb5my+SCLKY9ksnRsI9DYxuZpPEK2KkJ9gwMwjNAJlVTJhnj97aQterkuAB0h9zJZpZVe+jL2Qr36JqbHBZcmC8bxO5A6DyUKqfjqWDzGfUWvXKAcSxhW5KcYit9wje+LheAOvHW5c0droQyfpgl0eFo94l9z3/wdOtvrmSKyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294519; c=relaxed/simple;
	bh=4S/rde99XVE97iqSvsSZxUFmmiyOWPX4hdHG+ekVsFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgJDDrIsoWavkdEKnn73X8U99GIXA6F+/7NoTmKJQIIA3nfzC20eMo0J7lRvrFi0kA27p5PlpQTX2A6ZDPms/wi6beCAwO3bzNpq5iZweIOMGpaK3SeWhkrg6qO2MBkKxTJVP6cGN0MEKbi8aWmnsPh9WEwzFXWkZ0vFqEtsMbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tsq6U+lt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8978350A;
	Tue, 13 Jan 2026 09:54:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768294487;
	bh=4S/rde99XVE97iqSvsSZxUFmmiyOWPX4hdHG+ekVsFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tsq6U+ltG495/8c3AC3AW8bRmEv4NyWgZBtFpjNLdFAVViLmUakMQ8FuUj92Hk8EV
	 ekVYpAzck7d6FBfT3VWcVglAYGD/IzudMIafwr27iiLDi1uaGkNsCmGytExycntcKY
	 8USIP1sLKKfswcqkUeJnU/JRIRR9daS7xC0X0oC0=
Date: Tue, 13 Jan 2026 09:55:10 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: "jempty.liang" <imntjempty@163.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix NULL dev stream alert for tpg
 sub-device
Message-ID: <aWYHPKMVFu_QC1Ow@zed>
References: <20260113075722.143238-1-imntjempty@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113075722.143238-1-imntjempty@163.com>

Hi Jempty

On Tue, Jan 13, 2026 at 07:57:22AM +0000, jempty.liang wrote:
> Fix "(NULL device *): collect_streams: sub-device 'mali-c55 tpg'
> does not support streams" by setting `sd->dev = mali_c55->dev`
> for isp/resizer/tpg modules.

The missing device name in the error message is just a symptom, I
think this is a geniunely missing part of the subdevice initalization.

I would re-phrase this as

-------------------------------------------------------------------------------
The subdevices registered by the Mali-C55 driver do not have their
'struct device *dev' member initialized. This is visibile when looking
at debug message, as in example:

"(NULL device *): collect_streams: sub-device 'mali-c55 tpg' does not support streams"

Fix this by initializing the *dev field for each subdevice registered
by the Mali-C55 driver.
-------------------------------------------------------------------------------

I wonder if v4l2_device_register_subdev() shouldn't WARN or if return
an error if sd->dev is not initialized. Laurent, Sakari: opinions ?

Thanks
  j

>
> Signed-off-by: jempty.liang <imntjempty@163.com>
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-isp.c     | 1 +
>  drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 1 +
>  drivers/media/platform/arm/mali-c55/mali-c55-tpg.c     | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> index 497f25fbdd13..ce84aad9f1d5 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> @@ -610,6 +610,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
>  	sd->entity.ops = &mali_c55_isp_media_ops;
>  	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
>  	sd->internal_ops = &mali_c55_isp_internal_ops;
> +	sd->dev = mali_c55->dev;
>  	strscpy(sd->name, MALI_C55_DRIVER_NAME " isp", sizeof(sd->name));
>
>  	isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> index a8d739af74b6..c4f46651dcee 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> @@ -1070,6 +1070,7 @@ static int mali_c55_register_resizer(struct mali_c55 *mali_c55,
>  	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>  	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
>  	sd->internal_ops = &mali_c55_resizer_internal_ops;
> +	sd->dev = mali_c55->dev;
>
>  	rsz->pads[MALI_C55_RSZ_SINK_PAD].flags = MEDIA_PAD_FL_SINK;
>  	rsz->pads[MALI_C55_RSZ_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
> index 1af5d2759a83..894f4cf377af 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
> @@ -370,6 +370,7 @@ int mali_c55_register_tpg(struct mali_c55 *mali_c55)
>  	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
>  	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	sd->internal_ops = &mali_c55_tpg_internal_ops;
> +	sd->dev = mali_c55->dev;
>  	strscpy(sd->name, MALI_C55_DRIVER_NAME " tpg", sizeof(sd->name));
>
>  	pad->flags = MEDIA_PAD_FL_SOURCE;
> --
> 2.25.1
>

