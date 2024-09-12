Return-Path: <linux-media+bounces-18193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FEE97689E
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 14:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CF9B1F25110
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 12:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DBA1A2659;
	Thu, 12 Sep 2024 12:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wm2kivNI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DE51A2639;
	Thu, 12 Sep 2024 12:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142749; cv=none; b=XgGwlLhOoWdGKdHiT8j1llNAhm1mEnDFscaJgg96xAn/2WVRscn8eWz/VzgEWwSRSmY8nqAQoHoTisi4rUnpHJRxuNrMZXzvdFNIchfP4l2JQGAoq0v3ucbkVjNqqJnsiq8WTAHibA36m90JY04YWe6szJFEmy7z2TTXu17eOyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142749; c=relaxed/simple;
	bh=agfC5ZtSxRDKdSEOCCVkvyOM5Vt8+Q5NReccVU8cJ6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyX0IXtYw9sAzRUSrn2A3MUwdmFmmC2bzcpjhn4vQkGdgE5ZpdW6Kogd0MdBgPrZvKtsIoKybUxJuREfTzEJCSl+l6SabN+oeVdIe91Io2skKKFrk97H7aiAsQOmvHsKxbyWsYktCV3JBrLxtw5fAmkafFuMQEMvM122HmGlsYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wm2kivNI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D091F73;
	Thu, 12 Sep 2024 14:04:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726142666;
	bh=agfC5ZtSxRDKdSEOCCVkvyOM5Vt8+Q5NReccVU8cJ6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wm2kivNIsDpZOPp099FU0SUk7ecPkahkuEGu8b23O9Xynhh+SGJ8TEZ79G2bXNK6U
	 yUX3xUMXpuxi3iXGDM4owBih9Zm5wIxe2GUhGVIrbKacruthEEfVgdYQiqXciif4Wo
	 kZXefQcg16UKFUQXWNn6lGjjEjgeASGriq3LLOt8=
Date: Thu, 12 Sep 2024 15:05:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linuxfancy@googlegroups.com, sakari.ailus@linux.intel.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: max96714: add HAS_EVENTS subdev flag
Message-ID: <20240912120510.GB25276@pendragon.ideasonboard.com>
References: <20240910134428.795273-1-tomm.merciai@gmail.com>
 <20240910134428.795273-2-tomm.merciai@gmail.com>
 <20240912104409.GA25276@pendragon.ideasonboard.com>
 <ZuLMUaxn/oTw5dco@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZuLMUaxn/oTw5dco@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

On Thu, Sep 12, 2024 at 01:11:13PM +0200, Tommaso Merciai wrote:
> Hi Laurent,
> 
> On Thu, Sep 12, 2024 at 01:44:09PM +0300, Laurent Pinchart wrote:
> > Hi Tommaso,
> > 
> > On Tue, Sep 10, 2024 at 03:44:27PM +0200, Tommaso Merciai wrote:
> > > Controls can be exposed to userspace via a v4l-subdevX device, and
> > > userspace has to be able to subscribe to control events so that it is
> > > notified when the control changes value. Add missing HAS_EVENTS flag.
> > 
> > How is this supposed to work, given that the driver doesn't implement
> > .subscribe_event() ?
> 
> You are completely right, sorry.
> I think in both cases I'm missing:
> 
> diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
> index 94b1bc000e48..2257b6b807ea 100644
> --- a/drivers/media/i2c/max96714.c
> +++ b/drivers/media/i2c/max96714.c
> @@ -17,6 +17,7 @@
> 
>  #include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
> 
> @@ -488,6 +489,8 @@ static int max96714_log_status(struct v4l2_subdev *sd)
> 
>  static const struct v4l2_subdev_core_ops max96714_subdev_core_ops = {
>         .log_status = max96714_log_status,
> +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
>  };
> 
>  static const struct v4l2_subdev_video_ops max96714_video_ops = {
> 
> Like you suggest. Or I'm wrong?

That looks better :-)

Out of curiosity, what's your use case for control events ?

> > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > ---
> > >  drivers/media/i2c/max96714.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
> > > index 159753b13777..94b1bc000e48 100644
> > > --- a/drivers/media/i2c/max96714.c
> > > +++ b/drivers/media/i2c/max96714.c
> > > @@ -602,7 +602,8 @@ static int max96714_create_subdev(struct max96714_priv *priv)
> > >  		goto err_free_ctrl;
> > >  	}
> > >  
> > > -	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> > > +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > +			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
> > >  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > >  	priv->sd.entity.ops = &max96714_entity_ops;
> > >  

-- 
Regards,

Laurent Pinchart

