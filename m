Return-Path: <linux-media+bounces-25259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42046A1B282
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 10:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47847188FF46
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 09:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE7C218EB4;
	Fri, 24 Jan 2025 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iEDEAWqS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3CC320B;
	Fri, 24 Jan 2025 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737710539; cv=none; b=Fcs7m5oTMUYxK2TjjtVdm1nP5jcZ+wucEGx1/z3b0cXO7grQcWoRY2JOpGza64S0TxxSyX2o28zbliAUKXP4Pd7oPg0LWt0Qa1ClFYgn8DvpLTj5xhk99IwB3dUiK+crCSDMGQb2/qYun25z17N4bSPXn02PfmbEzuusv9P308c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737710539; c=relaxed/simple;
	bh=K2Xxy2Jw4H0u+kOMqmfGKbwvi89egxnMK7xmvjMNp3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPjVoA/TvcQGG9FT9x3MFqBh9wNWT3EmcuXtfx5EIJAYrqPUjPlEjGVA6JcyPVimYFemjBVwh1C8aNP5ihOA/wq1kVphyEG5jEbt9MMd1KIQgd5fZVlOJXYHSmC4UPHQqKHDkTDMvvarIZbVoAtgBxw6qRAq7TFMEBRp+1hqqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iEDEAWqS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7285B465;
	Fri, 24 Jan 2025 10:21:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737710465;
	bh=K2Xxy2Jw4H0u+kOMqmfGKbwvi89egxnMK7xmvjMNp3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEDEAWqSO5sXr4K2KqZPB0WllBSJg8fVTpzkbS5qzpAN+CkPhA4aKPGpLAqLxeMo9
	 MYcGp748jfSyA1paj/uFvZNSI5ZVDKBnXCSLCeTfqxNI3gjTJpnF8UQGVCzlzugCl0
	 dit7zSa8T4u3BN+M3d3KNkvbnBjODqgHhFuWP6Dc=
Date: Fri, 24 Jan 2025 11:21:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/6] media: vsp1: dl: Use singleshot DL for VSPX
Message-ID: <20250124092159.GB24731@pendragon.ideasonboard.com>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
 <20250123-v4h-iif-v1-3-7b4e5299939f@ideasonboard.com>
 <20250123214445.GC10642@pendragon.ideasonboard.com>
 <qss3vbdg7gwwhuluamffnlu5pxqkb6w7vn3taut3jm62anoi4x@zmqky7yom6wu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <qss3vbdg7gwwhuluamffnlu5pxqkb6w7vn3taut3jm62anoi4x@zmqky7yom6wu>

On Fri, Jan 24, 2025 at 09:44:06AM +0100, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Thu, Jan 23, 2025 at 11:44:45PM +0200, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Thu, Jan 23, 2025 at 06:04:04PM +0100, Jacopo Mondi wrote:
> > > The vsp1_dl library allows to program a display list and feed it
> > > continuously to the VSP2. As an alternative operation mode, the library
> > > allows to program the VSP2 in 'single shot' mode, where a display list
> > > is submitted to the VSP on request only.
> > >
> > > Currently the 'single shot' mode is only available when the VSP2 is
> > > controlled by userspace, while it works in continuous mode when driven
> > > by DRM, as frames have to be submitted to the display continuously.
> > >
> > > For the VSPX use case, where there is no uapi support, we should however
> > > work in single-shot mode as the ISP driver programs the VSPX on
> > > request.
> > >
> > > Initialize the display lists in single shot mode in case the VSP1 is
> > > controlled by userspace or in case the pipeline features an IIF entity,
> > > as in the VSPX case.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > ---
> > >  drivers/media/platform/renesas/vsp1/vsp1_dl.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> > > index ad3fa1c9cc737c92870c087dd7cb8cf584fce41b..b8f0398522257f2fb771b419f34b56e59707476b 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> > > @@ -1099,7 +1099,12 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
> > >  		return NULL;
> > >
> > >  	dlm->index = index;
> > > -	dlm->singleshot = vsp1->info->uapi;
> > > +	/*
> > > +	 * uapi = single shot mode;
> > > +	 * DRM = continuous mode;
> > > +	 * VSPX = single shot mode;
> > > +	 */
> > > +	dlm->singleshot = (vsp1->info->uapi || vsp1->iif);
> >
> > I'm wondering if we should make this a bit more generic, and allow the
> > caller to select the mode of operation. It could be passed as a flag to
> > vsp1_dl_list_commit() and stored in the vsp1_dl_list.
> >
> > There is however no use case at the moment to switch between singleshot
> > and continuous modes on a per display list basis. Implementing support
> > for that may be overkill, but on the other hand, the implementation
> > seems very simple, so it's not a big effort. The main and possibly only
> > reason why we may not want to do that now is because the display list
> > helpers haven't been tested to successfully switch between the modes, so
> > we may falsely advertise something as supported. Despite that, as no
> > caller would attempt switching, it wouldn't cause an issue.
> 
> I would simply avoid upstreaming code I can't test, and changing the
> singleshot mode between commit might create contentions with
> vsp1_dlm_irq_frame_end() which inspects dlm->singleshot.

I had considered that when looking at the code. Moving the single shot
flag to the vsp1_dl_list, vsp1_dlm_irq_frame_end() would check the flag
from that structure instead of getting it from the dlm, so I don't think
it would be an issue. That's the reason why I'm in two minds about this,
I think it would be easy to do, with very low risk for our use cases,
but indeed the switch itself wouldn't be fully tested.

> > What do you think ? What do you feel would be cleaner ?
> >
> > >  	dlm->vsp1 = vsp1;
> > >
> > >  	spin_lock_init(&dlm->lock);

-- 
Regards,

Laurent Pinchart

