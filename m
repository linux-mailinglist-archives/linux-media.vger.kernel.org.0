Return-Path: <linux-media+bounces-16788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD295F034
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5748EB203E4
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 11:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755B5156C74;
	Mon, 26 Aug 2024 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NQGchA16"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE9014A617;
	Mon, 26 Aug 2024 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724673367; cv=none; b=PSI+CVN6HOQm62ln64o2CbhPDx/LnY6nvqjGQGH3BwqcBK78N9vsT84yBB7RXdTdRGRxe13RPZaiNRricvHIpbWWADi2oKMSO526x4Njyc+NABeLixdTZtlq6r+GnL1nU+arfR56vKS1EKoswCTZ4m+ibm2mYzGq0Z+cdEv1rEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724673367; c=relaxed/simple;
	bh=g8wDuXcKB3rfggHfMwoEYFnydwbq2/dfH63S5/CXx1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLM8FanRtq+wrrWkifOcvw61wZYTny87M1SLPjOD+OsU8Ii9GajqehoF9e9/oAMLCvVevNb/goomVgJN/B/RRSYVOgMJs95apUOLiVHQFatqRyJ0tKc/j5i1uiF58WHZYIf5aSojjtZNdKpAvCNdk5GYRP9n79EfTKu2RofLsLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NQGchA16; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DD66480;
	Mon, 26 Aug 2024 13:54:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724673298;
	bh=g8wDuXcKB3rfggHfMwoEYFnydwbq2/dfH63S5/CXx1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQGchA16Fj31j72VszbO7Ya93WiVuHVDSgjXJ35FTw9b5+ywlnQlzoaH9t/3YkF7U
	 OtjXhEUEw8KLC05Np5eDX6wLnwsmxb+/9FvMOWjYFapFKPKzLxpsh57N8EWloW3xae
	 IqzPJYaNlLcThk4X1XOu/CqWLZulI06QTEIxLjJ4=
Date: Mon, 26 Aug 2024 14:56:00 +0300
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
Subject: Re: [PATCH v2 3/7] media: sun4i_csi: Don't use
 v4l2_subdev_link_validate() for video device
Message-ID: <20240826115600.GA27785@pendragon.ideasonboard.com>
References: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240822154531.25912-4-laurent.pinchart+renesas@ideasonboard.com>
 <2d9c3516-442f-4e41-8620-cc0eaf9b1f03@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2d9c3516-442f-4e41-8620-cc0eaf9b1f03@ideasonboard.com>

On Mon, Aug 26, 2024 at 02:04:44PM +0300, Tomi Valkeinen wrote:
> On 22/08/2024 18:45, Laurent Pinchart wrote:
> > The v4l2_subdev_link_validate() function is a helper designed to
> > validate links whose sink is a subdev. When called on a link whose sink
> > is a video device, it only prints a warning and returns. Its usage in
> > the sun4i_csi driver is wrong, leaving the link from the sub4i_csi
> > subdev to the capture video device unvalidated.
> > 
> > Planned improvements to the v4l2_subdev_link_validate() function will
> > turn the warning into an error, breaking the sun4i_csi driver. As an
> > interim measure, move the warning to the sun4i_csi driver in a custom
> > validation handler, and drop the call to the helper.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Acked-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >   drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > index dbb26c7b2f8d..d07e980aba61 100644
> > --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > @@ -35,8 +35,15 @@ struct sun4i_csi_traits {
> >   	bool has_isp;
> >   };
> >   
> > +static int sun4i_csi_video_link_validate(struct media_link *link)
> > +{
> > +	dev_warn_once(link->graph_obj.mdev->dev,
> > +		      "Driver bug: link validation not implemented\n");
> > +	return 0;
> > +}
> > +
> >   static const struct media_entity_operations sun4i_csi_video_entity_ops = {
> > -	.link_validate = v4l2_subdev_link_validate,
> > +	.link_validate = sun4i_csi_video_link_validate,
> >   };
> >   
> >   static const struct media_entity_operations sun4i_csi_subdev_entity_ops = {
> 
> I fear this might just leave it broken, but I don't have a better idea.

I think it would be fairly easy to implement support for proper
validation in the driver, but it would require access to a device for
testing. This patch doesn't worsen the issue, or make fixing it more
difficult, so I think it's OK for now until someone can send a real fix.

> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

