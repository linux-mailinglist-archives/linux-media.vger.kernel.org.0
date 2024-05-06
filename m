Return-Path: <linux-media+bounces-10854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CD58BCC0B
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 12:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 329D31C213B5
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 10:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB904204B;
	Mon,  6 May 2024 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JkVmeUyA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4A663B8;
	Mon,  6 May 2024 10:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714991566; cv=none; b=qcCi0CcvDOpydm0pw43fjybzZ2ffKyxGrGkxFcML6TEBvfXVnfy2sHcqKYOq5zFZyUVk6bloeraRNElj5FaqsXQHK3EGuAmLqnMIY0wRDJoKjPpgyuaxbuwEMDEVk0cAH+bvfkNXIB7hT3EeB/qAJDqYfI8u+aNeVXevBqcaZHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714991566; c=relaxed/simple;
	bh=vzwdjVTQkvZ4ndBkerQm7ZkaiaPAagOhRhf1UKOdVSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cwg6Iftn0j8yfupCu+EgG9gR4L2vYFPAOlsrJqZdE8L12Z64focqMcJSRre6ozqDjWkoVH0UjAbdlxHSnA76iLO/Lqfp8m33jkmjre23ZebwUIXhVMR+TGYbdDTIMt6MuvYTj7Y+LeXFyJQERE4MKHjqqOl9nxMrQH0XHPnus5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JkVmeUyA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FD2882E;
	Mon,  6 May 2024 12:32:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714991559;
	bh=vzwdjVTQkvZ4ndBkerQm7ZkaiaPAagOhRhf1UKOdVSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkVmeUyAbQLgo/bdRwYotdZuQ5M66zZNVMas9VIooyl7pXTxp8ASQStVjIeEqxkib
	 YQRxehHWpoDQFm8+4fV9JMNIb7l5IF09JuWjP59t7dTZoXQ7DjpF18ih9g0MUQvfk1
	 g/rNZU2DLqJK89v6rL2rIQtNXsOasNenxXufQbow=
Date: Mon, 6 May 2024 13:32:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 11/11] media: max9286: Use frame interval from subdev
 state
Message-ID: <20240506103232.GA21429@pendragon.ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-12-jacopo.mondi@ideasonboard.com>
 <20240505213611.GI23227@pendragon.ideasonboard.com>
 <4oanq2grddcqyoqu3phsf5vudpnm76q2xcnra4ygcq7akkfzty@uccgntq2zvcb>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4oanq2grddcqyoqu3phsf5vudpnm76q2xcnra4ygcq7akkfzty@uccgntq2zvcb>

On Mon, May 06, 2024 at 11:37:13AM +0200, Jacopo Mondi wrote:
> On Mon, May 06, 2024 at 12:36:11AM GMT, Laurent Pinchart wrote:
> > On Fri, May 03, 2024 at 05:51:26PM +0200, Jacopo Mondi wrote:
> > > Use the frame interval stored in the subdev state instead of storing
> > > a copy in the driver private structure.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/max9286.c | 52 +++++++++++++++++--------------------
> > >  1 file changed, 24 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > > index cc7ee35560fc..4ddbc247395f 100644
> > > --- a/drivers/media/i2c/max9286.c
> > > +++ b/drivers/media/i2c/max9286.c
> > > @@ -197,8 +197,6 @@ struct max9286_priv {
> > >  	struct v4l2_ctrl *pixelrate_ctrl;
> > >  	unsigned int pixelrate;
> > >
> > > -	struct v4l2_fract interval;
> > > -
> > >  	unsigned int nsources;
> > >  	unsigned int source_mask;
> > >  	unsigned int route_mask;
> > > @@ -571,11 +569,14 @@ static void max9286_set_video_format(struct max9286_priv *priv,
> > >  		      MAX9286_INVVS | MAX9286_HVSRC_D14);
> > >  }
> > >
> > > -static void max9286_set_fsync_period(struct max9286_priv *priv)
> > > +static void max9286_set_fsync_period(struct max9286_priv *priv,
> > > +				     struct v4l2_subdev_state *state)
> > >  {
> > > +	struct v4l2_fract *interval;
> >
> > const
> 
> ../drivers/media/i2c/max9286.c:993:29: error: assignment of member ‘numerator’ in read-only object
>   993 |         interval->numerator = 0;

That's the .init_state() implementation. There you can't make it const,
but in max9286_set_fsync_period() it should be fine.

-- 
Regards,

Laurent Pinchart

