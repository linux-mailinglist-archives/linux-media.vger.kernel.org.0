Return-Path: <linux-media+bounces-16791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E295F120
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7158728D503
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C0F188920;
	Mon, 26 Aug 2024 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U9KZRW9i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FAA187FFC;
	Mon, 26 Aug 2024 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674502; cv=none; b=VsgBu3gQ6610UwN3qDVFphlLQN30sKaH2vESrdZcs8jIumzXUaU/MXr7VGwUeAa+IeDA5GwX/uvWGRYypgFVir0HCXdfp0mLTa1ldA0ezIMw0o29tUHu3elIyaLUAA8SV7JmOc2aOrVhv5fQ2KFY3p0cu3wkqoTr8otxw0tpOqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674502; c=relaxed/simple;
	bh=XCzKRnWgptDlWZvITt9TivpoZzWNn7GVEY+n2tqcuNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RE3k2Pwk2VQS5hjdXCw3bb79AzWQwnPv6rcWz79nhcRyBVqnK3Wsrpv0ilURy4PBVvzYw0WMJ/P4LUurnbJlu/Ixpf90Pzpp/xgnmrtJHe3iXPgGRzeAvwKnC2kkCKcJWxSsc4gFOe0L6SGb2yr8gy+6DiB2Nf142AQ8+scfeZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U9KZRW9i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D984F6CA;
	Mon, 26 Aug 2024 14:13:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724674432;
	bh=XCzKRnWgptDlWZvITt9TivpoZzWNn7GVEY+n2tqcuNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9KZRW9iHNaOCnlaNEDalbvq6Da2e0R6mT7LsHamS6TOgvnrf4GixdULn+0IEG32L
	 xXCAxVFqHG30qADKOC/ndUL0AsTqYg/W2AHwy+3JNHgi3QdMdxVmUK7+aYDFDNY40G
	 oPDz8mjMr0G3uBURshLzVoixaA99xPyyIFMAVnBI=
Date: Mon, 26 Aug 2024 15:14:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 6/7] media: renesas: vsp1: Implement .link_validate()
 for video devices
Message-ID: <20240826121454.GD27785@pendragon.ideasonboard.com>
References: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240822154531.25912-7-laurent.pinchart+renesas@ideasonboard.com>
 <05718b7f-0c57-4217-97e1-ef4785d38c01@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <05718b7f-0c57-4217-97e1-ef4785d38c01@ideasonboard.com>

Hi Tomi,

On Mon, Aug 26, 2024 at 02:49:44PM +0300, Tomi Valkeinen wrote:
> On 22/08/2024 18:45, Laurent Pinchart wrote:
> > The v4l2_subdev_link_validate() helper prints a warning if the
> > .link_validate() operation is not implemented for video devices
> > connected to the subdevs. Implement the operation to silence the
> > warning.
> > 
> > Ideally validation of the link between the video device and the subdev
> > should be implemented in that operation. That would however break
> > userspace that does not configure formats on all video devices before
> > starting streaming. While this mode of operation may not be considered
> > valid by the V4L2 API specification (interpretation differ), it is
> > nonetheless supported by the vsp1 driver at the moment and used by at
> > least the vsp1 unit test suite, and possibly other userspace
> > applciations. Removing it would be a regression.
> 
> "applications"
> 
> If the media graph is validated when the first stream is enabled, does 
> that mean that when the graph is "enabled", we can never change e.g. the 
> resolution, even for streams that have not been enabled and even if all 
> the drivers would support this?

In the general case, yes. Drivers can already support this use case by
implementing their own link validation. Improvements to generic helpers
could also be possible in the future.

> The pad interdependency should help there, right? Would it help here, too?

Possibly, yes.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >   .../media/platform/renesas/vsp1/vsp1_video.c  | 22 +++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > index fdb46ec0c872..e728f9f5160e 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > @@ -1081,6 +1081,27 @@ static const struct v4l2_file_operations vsp1_video_fops = {
> >   	.mmap = vb2_fop_mmap,
> >   };
> >   
> > +/* -----------------------------------------------------------------------------
> > + * Media entity operations
> > + */
> > +
> > +static int vsp1_video_link_validate(struct media_link *link)
> > +{
> > +	/*
> > +	 * Ideally, link validation should be implemented here instead of
> > +	 * calling vsp1_video_verify_format() in vsp1_video_streamon()
> > +	 * manually. That would however break userspace that start one video
> > +	 * device before configures formats on other video devices in the
> > +	 * pipeline. This operation is just a no-op to silence the warnings
> > +	 * from v4l2_subdev_link_validate().
> > +	 */
> > +	return 0;
> > +}
> > +
> > +static const struct media_entity_operations vsp1_video_media_ops = {
> > +	.link_validate = vsp1_video_link_validate,
> > +};
> > +
> >   /* -----------------------------------------------------------------------------
> >    * Suspend and Resume
> >    */
> > @@ -1215,6 +1236,7 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
> >   
> >   	/* ... and the video node... */
> >   	video->video.v4l2_dev = &video->vsp1->v4l2_dev;
> > +	video->video.entity.ops = &vsp1_video_media_ops;
> >   	video->video.fops = &vsp1_video_fops;
> >   	snprintf(video->video.name, sizeof(video->video.name), "%s %s",
> >   		 rwpf->entity.subdev.name, direction);

-- 
Regards,

Laurent Pinchart

