Return-Path: <linux-media+bounces-34607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 646F6AD6D7C
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 12:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A6151BC2E5F
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 10:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEE0235368;
	Thu, 12 Jun 2025 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g0sfK/qh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B7723315A;
	Thu, 12 Jun 2025 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723619; cv=none; b=GPfsrAf/NgevQjN21HP4zBTP2fmjck8lKFL2ESqA9+NZtj/uT37c2Nyoky8HPm3nZDlI6MAfuSOTR4XhBHnsTvsk+jc0wz0N8oElOr1uYM8zRn4wq/S8B2SntgFZKqOmbdwRMILbUKRsu2OeBnsBMOmp/NbVOl2zJMoCLbc1M9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723619; c=relaxed/simple;
	bh=TeQ0oTGNLG+F9KDcQ6FK6W8BtHHFwsQpIJeKJHI9IRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uh+3gU8v4Lpn4DhilTSfhq7T7WjFkVGDFZrGn7MabhQFqECwj6M470AlidMfTYATd/PYd+XI/E84wZaxCJXVLLqM8u77eY/6PGZwhr5yAb5AnCq24V45/HdPdoyxyfAH6MVdPakUeOVs3dE3NVfsanIRWbXvbhvlyu4qwg/Hbwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g0sfK/qh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65BAED6;
	Thu, 12 Jun 2025 12:20:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749723607;
	bh=TeQ0oTGNLG+F9KDcQ6FK6W8BtHHFwsQpIJeKJHI9IRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g0sfK/qhHn13a85LaU/OuqNIwcGcNqLdDI/HIk1X04rmBhPdvshQdu8NYc7fe4WCk
	 +GtSUCxMT7WuAaZCmPvP1PSuE4ny7fKcEzkVOTSV/UzTorbFc1y3XYuthDSnH93RW1
	 ZPH4uma2nTrgVi6wclOlmA/oX9AHFTcQ8QCKhip8=
Date: Thu, 12 Jun 2025 12:20:13 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: vsp1: Reset FCP for VSPX
Message-ID: <rkihvnry5yybz7bjcbanth4yq7svywicmbhksz4ity6buw52ff@tmxefdhvpgaf>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-3-9f17277ff1e2@ideasonboard.com>
 <20250611233611.GR24465@pendragon.ideasonboard.com>
 <6orphbs6syqu6oruppyln4kkepj42c775cs4nj4oygu4xitpx6@tlvab6mntrrx>
 <20250612101215.GE25137@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612101215.GE25137@pendragon.ideasonboard.com>

Hi Laurent

On Thu, Jun 12, 2025 at 01:12:15PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 12, 2025 at 11:48:49AM +0200, Jacopo Mondi wrote:
> > On Thu, Jun 12, 2025 at 02:36:11AM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 09, 2025 at 09:01:44PM +0200, Jacopo Mondi wrote:
> > > > According section "62.3.7.1 "Operation Control Setting
> > >
> > > "According to"
> > >
> > > > IP set VSPX+FCPVX" of the R-Car Gen4 Hardware Manual, FCPX has to
> > > > be reset when stopping the image processing.
> > >
> > > That's only when stopping "image process of VSPX+FCPVX immediately".
> > > Note the "immediately", which involves resetting the VSP too. The code
> > > below waits for the pipeline to stop at the end of the frame. Resetting
> > > the FCP doesn't seem to be required in that case.
> >
> > True, we certainly don't
> >
> > 2. Set value 1 to VSPX register VI6_SRESET.SRST0. VSPX will invoke
> >    termination process immediately.
> >
> > but rather wait for the last frame to complete before stopping the
> > pipeline.
> >
> > Do you think this patch should be dropped ?
>
> I would say so, I don't think there's a need to reset the FCP when
> waiting for the pipeline to stop normally. Or have you noticed issues
> that this patch would solve ?
>

Not really, this comes straight from the upporting of the FCPD reset.

We've been running with an older of this patch that wasn't actually
resetting the FCP and we got no issues. At the same time Niklas has
confirmed running with this version that actually resets the FCP
doesn't introduce regressions.

I'm fine dropping this patch indeed

> > > > Softawre reset the FCPX after the vsp1 pipe has stopped.
> > >
> > > s/Softawre/Software/
> > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > > ---
> > > >  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 7 +++++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > index a6e5e10f3ef275c1b081c3d957e6cf356332afce..c6f2417aabc479384012ab8ab99556029ede1f44 100644
> > > > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > @@ -499,6 +499,7 @@ bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe)
> > > >  int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> > > >  {
> > > >  	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
> > > > +	u32 version = vsp1->version & VI6_IP_VERSION_MODEL_MASK;
> > > >  	struct vsp1_entity *entity;
> > > >  	unsigned long flags;
> > > >  	int ret;
> > > > @@ -515,8 +516,7 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> > > >  			spin_unlock_irqrestore(&pipe->irqlock, flags);
> > > >  		}
> > > >
> > > > -		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> > > > -		    VI6_IP_VERSION_MODEL_VSPD_GEN3)
> > > > +		if (version == VI6_IP_VERSION_MODEL_VSPD_GEN3)
> > > >  			ret |= rcar_fcp_soft_reset(vsp1->fcp);
> > > >
> > > >  	} else {
> > > > @@ -529,6 +529,9 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> > > >  		ret = wait_event_timeout(pipe->wq, vsp1_pipeline_stopped(pipe),
> > > >  					 msecs_to_jiffies(500));
> > > >  		ret = ret == 0 ? -ETIMEDOUT : 0;
> > > > +
> > > > +		if (version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
> > > > +			ret |= rcar_fcp_soft_reset(vsp1->fcp);
> > > >  	}
> > > >
> > > >  	list_for_each_entry(entity, &pipe->entities, list_pipe) {
>
> --
> Regards,
>
> Laurent Pinchart

