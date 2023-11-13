Return-Path: <linux-media+bounces-213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F647E9A8A
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E02351F20F3E
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9561C2BC;
	Mon, 13 Nov 2023 10:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kGPW07ts"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE51C29E
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:50:14 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3ADCB
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 02:50:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BB9910A;
	Mon, 13 Nov 2023 11:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699872584;
	bh=GbCHWsdmUdFS3RY8AQQ4QfblTxK2/MOUq/g4VAqnxDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kGPW07tsj/etWriEIDj9Yek+w1w/76p5Rjz57z6JOjkSGfdeDrlHT0nZzstMrlKTV
	 9jesuwZ6tbbuxI/kmZy5/cDlX5euSb3fxkAr7Z5El4sPzoW0aTuRpy4OAxwKto2K7l
	 94vtKRLhGU6IAo8rIYT0IcFvgXV8gAAPJi2bSC+0=
Date: Mon, 13 Nov 2023 12:50:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 1/2] media: v4l2-subdev: Drop unreacheable warning
Message-ID: <20231113105016.GA24338@pendragon.ideasonboard.com>
References: <20231113101718.6098-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231113101718.6098-2-laurent.pinchart+renesas@ideasonboard.com>
 <ZVH9iO5XPay8In_R@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZVH9iO5XPay8In_R@valkosipuli.retiisi.eu>

On Mon, Nov 13, 2023 at 10:42:16AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Mon, Nov 13, 2023 at 12:17:17PM +0200, Laurent Pinchart wrote:
> > The v4l2_subdev_link_validate_get_format() function warns if the pad
> > given as argument belongs to a non-subdev entity. This can't happen, as
> > the function is called from v4l2_subdev_link_validate() only (indirectly
> > through v4l2_subdev_link_validate_locked()), and that function ensures
> > that both ends of the link are subdevs.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 8 --------
> >  1 file changed, 8 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index be86b906c985..67d43206ce32 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1184,14 +1184,6 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
> >  	struct v4l2_subdev *sd;
> >  	int ret;
> >  
> > -	if (!is_media_entity_v4l2_subdev(pad->entity)) {
> > -		WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
> > -		     "Driver bug! Wrong media entity type 0x%08x, entity %s\n",
> > -		     pad->entity->function, pad->entity->name);
> > -
> > -		return -EINVAL;
> > -	}
> > -
> >  	sd = media_entity_to_v4l2_subdev(pad->entity);
> 
> It'd be good to check sd is non-NULL here, although pad presumably is
> always a pad of a sub-device entity.

It's guaranteed by the caller. Is there a specific reason you think a
check would be good ?

> >  
> >  	fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;

-- 
Regards,

Laurent Pinchart

