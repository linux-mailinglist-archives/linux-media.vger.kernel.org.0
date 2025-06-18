Return-Path: <linux-media+bounces-35203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5186CADF240
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 18:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A13207AAA1A
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 16:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2702EF9CF;
	Wed, 18 Jun 2025 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bT7nbDZc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D302EB5C5;
	Wed, 18 Jun 2025 16:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750263433; cv=none; b=kv8SE+fy76dZrCY4nUINoAEKkVoSbZP9kCpmRb8UTP4hI5J/sdaiwWoxVi4TUuGcqEQo7IQmB4RnvlOXWmY/JQ95SYvBAqtVhrdLOE7jyx/FnNCeNTJDO2gQqyzlUYVgjhbcfQBvU/DmhQXVO9pOEnALFPcmRWQ51J2kvBo2Xvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750263433; c=relaxed/simple;
	bh=LvHAISPnuKP0JAizGBeAFTW34TqfjPmaO6MYvTtE4kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XojuIMNujvoTtHNpy32cqGl1bFVWD0k9q2fT6HZFjqFQ1AwKXFgrLDgIhIQnmzYTxZJEtpm+1AGO5FW7ByFb5sJavaqrXtruhjtaw97eKJsxU48iabNBbKWRrfIBnvco3phySKPLbkXcF1XWNb1G093dIuzA/7Nl+n5vYqZGAIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bT7nbDZc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2126BBA;
	Wed, 18 Jun 2025 18:16:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750263417;
	bh=LvHAISPnuKP0JAizGBeAFTW34TqfjPmaO6MYvTtE4kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bT7nbDZcnyE8YIIZ41ykm00LyNL0xdVhLeW6gDdZVdIkTvbLTugQzvHIocymzz4tp
	 WzInzzSU0yjfvBCEJqovS1F/evrTIazal2OVQWGkdVCkZ2mSwuUtKd52NIwHZt6I+f
	 q2rzbAu/0bNtuzephxICkKEH6vfoWqZTOHcxZtSQ=
Date: Wed, 18 Jun 2025 19:16:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] media: vsp1: Use lockdep assertions to enforce
 documented conventions
Message-ID: <20250618161651.GH22102@pendragon.ideasonboard.com>
References: <20250618020150.9863-1-laurent.pinchart@ideasonboard.com>
 <uavxxji4amplptulcligbw2uy64d5tlvx2yscaz2pnqgx5pkwz@rm3ljuui7p3z>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <uavxxji4amplptulcligbw2uy64d5tlvx2yscaz2pnqgx5pkwz@rm3ljuui7p3z>

On Wed, Jun 18, 2025 at 06:11:23PM +0200, Jacopo Mondi wrote:
> On Wed, Jun 18, 2025 at 05:01:49AM +0300, Laurent Pinchart wrote:
> > A few functions have documented locking conventions. Documentation is
> > nice, but runtime checks are better. Enforce the conventions with
> > lockdep assertions.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_dl.c   | 5 +++++
> >  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 3 +++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> > index c660f8539ff5..d732b4ed1180 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/device.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/gfp.h>
> > +#include <linux/lockdep.h>
> >  #include <linux/refcount.h>
> >  #include <linux/slab.h>
> >  #include <linux/workqueue.h>
> > @@ -612,6 +613,8 @@ struct vsp1_dl_list *vsp1_dl_list_get(struct vsp1_dl_manager *dlm)
> >  	struct vsp1_dl_list *dl = NULL;
> >  	unsigned long flags;
> >
> > +	lockdep_assert_not_held(&dlm->lock);
> > +
> >  	spin_lock_irqsave(&dlm->lock, flags);
> >
> >  	if (!list_empty(&dlm->free)) {
> > @@ -639,6 +642,8 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *dl)
> >  	if (!dl)
> >  		return;
> >
> > +	lockdep_assert_held(&dl->dlm->lock);
> > +
> 
> Is it intentional to place this after the !dl check ? Is this to avoid
> a lockdep warning in case !dl ?

The lockdep call derefereces dl.

> Anyway
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> >  	/*
> >  	 * Release any linked display-lists which were chained for a single
> >  	 * hardware operation.
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > index 3cbb768cf6ad..5d769cc42fe1 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > @@ -9,6 +9,7 @@
> >
> >  #include <linux/delay.h>
> >  #include <linux/list.h>
> > +#include <linux/lockdep.h>
> >  #include <linux/sched.h>
> >  #include <linux/wait.h>
> >
> > @@ -473,6 +474,8 @@ void vsp1_pipeline_run(struct vsp1_pipeline *pipe)
> >  {
> >  	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
> >
> > +	lockdep_assert_held(&pipe->irqlock);
> > +
> >  	if (pipe->state == VSP1_PIPELINE_STOPPED) {
> >  		vsp1_write(vsp1, VI6_CMD(pipe->output->entity.index),
> >  			   VI6_CMD_STRCMD);
> >
> > base-commit: d20469375306163719ee458dd83b7d6c1c93d4d1

-- 
Regards,

Laurent Pinchart

