Return-Path: <linux-media+bounces-50798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59158D24E60
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 15:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C55330873B6
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 14:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532D93A1E8A;
	Thu, 15 Jan 2026 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j3E/u6vN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8933A1E73;
	Thu, 15 Jan 2026 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768486555; cv=none; b=qy1FUicgmwiBG5qcy+ch3Q4xHA2fIIY6QRobnMlblHkEYpeM/RZu9Oqvfn1eVtCz8BkpV1irYrK9d4+ot1SDuCKfJW3nlNHa7HDreQ9wMtx3R2tnxU5qTsnohMYguizixWpwhjNFFSSYsVeaaFhfUfDEWJCjR1gC6gpEAzDtFi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768486555; c=relaxed/simple;
	bh=qZYpJfWYuLpDMFBOwjbgtxKxXHRkbNOcn7vu93bZAEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbm+4my9e6VPEipEqSXOnjkVQRETP6mRqYxTNDOaFi4sXmmsxvgI7aQANiAWElp5+klYsNceu5oD25EMW2B7fczpRw+Yth/EJwSpraHuFVWmaVRSDtgpxlCmJJYjiCSctTGXIvjWGWN0lWtD3bYuMnSAzNm0f2/R04Pu7Kvnc7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j3E/u6vN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [212.249.222.222])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A93C465;
	Thu, 15 Jan 2026 15:15:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768486524;
	bh=qZYpJfWYuLpDMFBOwjbgtxKxXHRkbNOcn7vu93bZAEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3E/u6vNR3RmbM6rHKVbXHW3NVtc+X53koaKbNoDZ4e/ifcU8xGHybeNAV+DqUn5k
	 akV33jhOXCw88hKX/m56lX07rXqOBnj8Bjr6n/4zm0gvCS4yvUPErD/JL0sx5vocl9
	 xh5JhxToD27jfs1ynVlMJFNZ1IAE4SiLvvAGn94Q=
Date: Thu, 15 Jan 2026 15:15:47 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: "jempty.liang" <imntjempty@163.com>, jacopo.mondi@ideasonboard.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: mali-c55: Fix NULL dev stream alert for
 tpg/rsz/isp sub-device
Message-ID: <aWj2WJJQbZDaarKc@zed>
References: <20260114015033.153793-1-imntjempty@163.com>
 <f2d4d945-4a11-4124-b8f6-5c78dac14f52@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2d4d945-4a11-4124-b8f6-5c78dac14f52@ideasonboard.com>

Hi Dan, Jempty

On Thu, Jan 15, 2026 at 02:09:48PM +0000, Dan Scally wrote:
> Hi Jempty, thanks for the patch
>
> On 14/01/2026 01:50, jempty.liang wrote:
> > The subdevices registered by the Mali-C55 driver do not have their
> > 'struct device *dev' member initialized. This is visibile when looking
>
> s/visibile/visible
>
> The commit header also needs correcting really, as it still suggests that
> fixing the printout is the goal. Perhaps something like "media: mali-c55:
> Initialise dev member for struct v4l2_subdev"?

Right, sorry, I missed the commit message during review

>
> With that:
>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>
> > at debug message, as in example:
> >
> > "(NULL device *): collect_streams: sub-device 'mali-c55 tpg' does not
> >   support streams"
> >
> > Fix this by initializing the *dev field for each subdevice registered
> > by the Mali-C55 driver.
> >
> > Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Oh, no need to, I simply reviewed the patch :)

> > Signed-off-by: jempty.liang <imntjempty@163.com>

With Dan's suggestion:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> > ---
> >   drivers/media/platform/arm/mali-c55/mali-c55-isp.c     | 1 +
> >   drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 1 +
> >   drivers/media/platform/arm/mali-c55/mali-c55-tpg.c     | 1 +
> >   3 files changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > index 497f25fbdd13..ce84aad9f1d5 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > @@ -610,6 +610,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
> >   	sd->entity.ops = &mali_c55_isp_media_ops;
> >   	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
> >   	sd->internal_ops = &mali_c55_isp_internal_ops;
> > +	sd->dev = mali_c55->dev;
> >   	strscpy(sd->name, MALI_C55_DRIVER_NAME " isp", sizeof(sd->name));
> >   	isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> > index a8d739af74b6..c4f46651dcee 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> > @@ -1070,6 +1070,7 @@ static int mali_c55_register_resizer(struct mali_c55 *mali_c55,
> >   	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> >   	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
> >   	sd->internal_ops = &mali_c55_resizer_internal_ops;
> > +	sd->dev = mali_c55->dev;
> >   	rsz->pads[MALI_C55_RSZ_SINK_PAD].flags = MEDIA_PAD_FL_SINK;
> >   	rsz->pads[MALI_C55_RSZ_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
> > index 1af5d2759a83..894f4cf377af 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
> > @@ -370,6 +370,7 @@ int mali_c55_register_tpg(struct mali_c55 *mali_c55)
> >   	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> >   	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> >   	sd->internal_ops = &mali_c55_tpg_internal_ops;
> > +	sd->dev = mali_c55->dev;
> >   	strscpy(sd->name, MALI_C55_DRIVER_NAME " tpg", sizeof(sd->name));
> >   	pad->flags = MEDIA_PAD_FL_SOURCE;
>

