Return-Path: <linux-media+bounces-34550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8CAD63E3
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFCD21895552
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 23:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D992C2C324A;
	Wed, 11 Jun 2025 23:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sl6C4jI6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482F32580F9;
	Wed, 11 Jun 2025 23:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749684858; cv=none; b=YNC+KCFriHoBCN3tbvG2eSXzxeqEtnzzo/dqqdRP8C7DmwK8C36POUyQhZY9+DJB7UStxgr+s3s+Zh0mM/4TdIimmUMQ7sct6vZvDbcxLEYPZ9llCH7lAQodXgD4nQY68lFKC/fOQpvvKxkiAxSHkLYxMN1W9YZ1Eh1/fTOSyzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749684858; c=relaxed/simple;
	bh=o6hZnDivxTJT+6j6BSK66vXIAR0LsRpdr3dXMxdSQgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBfiw6cyOr7CLZypo1Klddxv935xsenhgHy33keSHjMXKqXc7xyO6ffAqpmcGMelPPsUkkxRZBFORW8Fjyu/5KwirZ88aZPn5F8D96GJAWkwHsxixVBRNem6NrSb2A11TlC3PPQq9ejE+Qj43xOj/QuXim3IF6/TV9JfIjyaQyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sl6C4jI6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF010D52;
	Thu, 12 Jun 2025 01:34:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749684845;
	bh=o6hZnDivxTJT+6j6BSK66vXIAR0LsRpdr3dXMxdSQgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sl6C4jI6C8ePC4p1RukOi9l1IQXIV2N1xwR2vBdS0YcwB+FF2SfcP3jazXsWdq/tk
	 h6gFPUyJidLoWj/2hO6dfKNxp3MuXeqavaBuc/EnQRPz1PXcmwLXre77T27B7YxACF
	 DY+Yet3gNOBzxrSwAv3RaoqQOaYz6WWHEVO8pzbM=
Date: Thu, 12 Jun 2025 02:34:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH 2/3] media: vsp1: Reset FCP for VSPD
Message-ID: <20250611233401.GA14811@pendragon.ideasonboard.com>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
 <20250609-vspx-reset-v1-2-9f17277ff1e2@ideasonboard.com>
 <20250611232956.GQ24465@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611232956.GQ24465@pendragon.ideasonboard.com>

On Thu, Jun 12, 2025 at 02:29:58AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Mon, Jun 09, 2025 at 09:01:43PM +0200, Jacopo Mondi wrote:
> > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > 
> > According to H/W manual v1.00, VSPD must be excecuted
> > FCP_RST.SOFTRST after VI6_SRESET.SRST. So this patch adds it.
> > VSPDL is not applicable.
> 
> According to the R-Car Gen3 H/W manual v1.00, the FCP must be reset
> after resetting the VSPD, except for the VSPDL. Do so.
> 
> > Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > index 3cbb768cf6adc8cb182d8d31c5b9a9d3565785e7..a6e5e10f3ef275c1b081c3d957e6cf356332afce 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/wait.h>
> >  
> >  #include <media/media-entity.h>
> > +#include <media/rcar-fcp.h>
> >  #include <media/v4l2-subdev.h>
> >  
> >  #include "vsp1.h"
> > @@ -22,6 +23,7 @@
> >  #include "vsp1_hgo.h"
> >  #include "vsp1_hgt.h"
> >  #include "vsp1_pipe.h"
> > +#include "vsp1_regs.h"
> >  #include "vsp1_rwpf.h"
> >  #include "vsp1_uds.h"
> >  
> > @@ -512,6 +514,11 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
> >  			pipe->state = VSP1_PIPELINE_STOPPED;
> >  			spin_unlock_irqrestore(&pipe->irqlock, flags);
> >  		}
> > +
> > +		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> > +		    VI6_IP_VERSION_MODEL_VSPD_GEN3)
> > +			ret |= rcar_fcp_soft_reset(vsp1->fcp);
> 
> Wouldn't this be better placed in vsp1_reset_wpf() ?

Also, there's a similar requirement for VSPD in Gen4. I'd address both
in this patch.

> > +
> >  	} else {
> >  		/* Otherwise just request a stop and wait. */
> >  		spin_lock_irqsave(&pipe->irqlock, flags);

-- 
Regards,

Laurent Pinchart

