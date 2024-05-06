Return-Path: <linux-media+bounces-10849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9508BCAD4
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 11:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2719828233A
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 09:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74CB8142E92;
	Mon,  6 May 2024 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WCnffufY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE9F142E84;
	Mon,  6 May 2024 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714988239; cv=none; b=gFCZr8lPx376L6Uo1baTyWVJyfMn75UDsfozAa0mfnkrSuLUQiz/Nh5VxHkdku6NLSMjq3gZK6Pbtj6tAocoD5NXAbE0uRaWNleR8PybN/d8WTzoMwnlbZvkQfBJ/cDTqM10CO1X87iOFosiDM6DExU2S/uDN8NifzTtPCVRvfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714988239; c=relaxed/simple;
	bh=SILtgVjw+D82Ch4cKtWdhCIgnfQCx2pEJq1KD/Bo9hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsbtfgeTEGsQecWkyDFCZF2DOJ2tivWHpuQ3nwUpLrJGYMakz4iC02h+F2IW2+fsjiVfoozI+BVIhsxQ6aI1JhFCLF4+ozjEXAJKWYKaTxu3DpaQnAzfY4zs5QVrvAlBhEaJbxHULtj2xQ0DpOlYYtNg1OuTaZluvT2vZyqWu3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WCnffufY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB2A5A98;
	Mon,  6 May 2024 11:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714988234;
	bh=SILtgVjw+D82Ch4cKtWdhCIgnfQCx2pEJq1KD/Bo9hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCnffufYd7kY7LZnndoviLTDVBvDiT3mpIjeox5+iAkgJrbv5rMwLXECPxTT15Ef0
	 cR00iZAtHOvWWcuKabQ0dy6QT2COUYXzvuUpanC28F+qVqvc9v9L9hozB46cPKkBtc
	 XhRApvIeVFOLhxUEao2cQOgN6nBfT1PepYnBBSAo=
Date: Mon, 6 May 2024 11:37:13 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 11/11] media: max9286: Use frame interval from subdev
 state
Message-ID: <4oanq2grddcqyoqu3phsf5vudpnm76q2xcnra4ygcq7akkfzty@uccgntq2zvcb>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-12-jacopo.mondi@ideasonboard.com>
 <20240505213611.GI23227@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240505213611.GI23227@pendragon.ideasonboard.com>

Hi Laurent

On Mon, May 06, 2024 at 12:36:11AM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Fri, May 03, 2024 at 05:51:26PM +0200, Jacopo Mondi wrote:
> > Use the frame interval stored in the subdev state instead of storing
> > a copy in the driver private structure.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/max9286.c | 52 +++++++++++++++++--------------------
> >  1 file changed, 24 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index cc7ee35560fc..4ddbc247395f 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -197,8 +197,6 @@ struct max9286_priv {
> >  	struct v4l2_ctrl *pixelrate_ctrl;
> >  	unsigned int pixelrate;
> >
> > -	struct v4l2_fract interval;
> > -
> >  	unsigned int nsources;
> >  	unsigned int source_mask;
> >  	unsigned int route_mask;
> > @@ -571,11 +569,14 @@ static void max9286_set_video_format(struct max9286_priv *priv,
> >  		      MAX9286_INVVS | MAX9286_HVSRC_D14);
> >  }
> >
> > -static void max9286_set_fsync_period(struct max9286_priv *priv)
> > +static void max9286_set_fsync_period(struct max9286_priv *priv,
> > +				     struct v4l2_subdev_state *state)
> >  {
> > +	struct v4l2_fract *interval;
>
> const
>

../drivers/media/i2c/max9286.c:993:29: error: assignment of member ‘numerator’ in read-only object
  993 |         interval->numerator = 0;

