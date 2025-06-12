Return-Path: <linux-media+bounces-34601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC1CAD6C97
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A5C21BC156D
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E47022D4F1;
	Thu, 12 Jun 2025 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jli64Hwt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F54220F07C;
	Thu, 12 Jun 2025 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721735; cv=none; b=g+07jPv3j6M+5OnOpq/2Ol8f7TjehsslnCSIcD17tCaYcJvBhZh1dHPmnAi9IBCFKhESHS5OEjbY4a59nrfITs0Wci1s6Mnd/gyWo9PevzBT5ENRUtMg52TYiGesbOLsvLp5ie+chWm+/uJ34gFjcthetVRLBqM2nlgbmiW2Xe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721735; c=relaxed/simple;
	bh=kJ2+lNHQLhfSmlhfsLbUorJniNFTFhc7ezjx003b3Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtgfI+cIcEIg6Hs6ywVTOmMuC1V1B5MPT4UL1VPcueNBbpIRvDHfJs5OnShiRuLrzIHwxnDkOi7sfP4nnx1CtHy+jmbgXWZY3e+HnWYMfx9BgKibHyaIktud/r7/tzVuOttKekeU/u9ZhEMuGUbFM0kWYhqD49/E0613JMH4VYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jli64Hwt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2C55B5;
	Thu, 12 Jun 2025 11:48:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749721723;
	bh=kJ2+lNHQLhfSmlhfsLbUorJniNFTFhc7ezjx003b3Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jli64HwtT4nkh0viSF11oXbB+VNk7XcIiBuGGvPpaIEixsVzKHpEcFtQOFLbWVg3F
	 8inQsDBCC2yCSTA0nOY/Jb1ejjjnpYpn/rbINsr1hvL0P0z0rM2VxoXxD5mCl9UF8f
	 49I7MQ/tMMDX1DgCxGgxWxrWqPpSQfX73bxnuu4Q=
Date: Thu, 12 Jun 2025 11:48:49 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: vsp1: Reset FCP for VSPX
Message-ID: <6orphbs6syqu6oruppyln4kkepj42c775cs4nj4oygu4xitpx6@tlvab6mntrrx>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-3-9f17277ff1e2@ideasonboard.com>
 <20250611233611.GR24465@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611233611.GR24465@pendragon.ideasonboard.com>

Hi Laurent
On Thu, Jun 12, 2025 at 02:36:11AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Jun 09, 2025 at 09:01:44PM +0200, Jacopo Mondi wrote:
> > According section "62.3.7.1 "Operation Control Setting
>
> "According to"
>
> > IP set VSPX+FCPVX" of the R-Car Gen4 Hardware Manual, FCPX has to
> > be reset when stopping the image processing.
>
> That's only when stopping "image process of VSPX+FCPVX immediately".
> Note the "immediately", which involves resetting the VSP too. The code
> below waits for the pipeline to stop at the end of the frame. Resetting
> the FCP doesn't seem to be required in that case.
>

True, we certainly don't

2. Set value 1 to VSPX register VI6_SRESET.SRST0. VSPX will invoke
   termination process immediately.

but rather wait for the last frame to complete before stopping the
pipeline.

Do you think this patch should be dropped ?


> > Softawre reset the FCPX after the vsp1 pipe has stopped.
>
> s/Softawre/Software/
>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > index a6e5e10f3ef275c1b081c3d957e6cf356332afce..c6f2417aabc479384012ab8ab99556029ede1f44 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > @@ -499,6 +499,7 @@ bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe)
> >  int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> >  {
> >  	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
> > +	u32 version = vsp1->version & VI6_IP_VERSION_MODEL_MASK;
> >  	struct vsp1_entity *entity;
> >  	unsigned long flags;
> >  	int ret;
> > @@ -515,8 +516,7 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> >  			spin_unlock_irqrestore(&pipe->irqlock, flags);
> >  		}
> >
> > -		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> > -		    VI6_IP_VERSION_MODEL_VSPD_GEN3)
> > +		if (version == VI6_IP_VERSION_MODEL_VSPD_GEN3)
> >  			ret |= rcar_fcp_soft_reset(vsp1->fcp);
> >
> >  	} else {
> > @@ -529,6 +529,9 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> >  		ret = wait_event_timeout(pipe->wq, vsp1_pipeline_stopped(pipe),
> >  					 msecs_to_jiffies(500));
> >  		ret = ret == 0 ? -ETIMEDOUT : 0;
> > +
> > +		if (version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
> > +			ret |= rcar_fcp_soft_reset(vsp1->fcp);
> >  	}
> >
> >  	list_for_each_entry(entity, &pipe->entities, list_pipe) {
>
> --
> Regards,
>
> Laurent Pinchart

