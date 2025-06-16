Return-Path: <linux-media+bounces-34939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E52ADB402
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29210188759A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E1F1F4612;
	Mon, 16 Jun 2025 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K2w4UVfe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D612BEFE2;
	Mon, 16 Jun 2025 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084522; cv=none; b=HXOYgW9rFmfn9E9lPkZIwmkNwDfZQpC+uFTI2nX1iMbMEz2ZeHLA/gQgLXok9pEY4Hm2ev6YszI7n6jlWSLpRLxtFZmnnxRwAJD8mLxJSz9Wa1asjMB6jHR0eynlFXYzuAGg3QlwAGViEcKQ0BoQYOoo6IRYN3gjLjNqGsXw+R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084522; c=relaxed/simple;
	bh=G7S5AH3sLreBuc+SKahbLJg9HZ4XzjVGB9fRXPtFIKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwa96Jnjf+hAnS/bdumVxUZwXzgYc93wfnsFA/y02ZRfgWScEc4UyozZ6HyW/8WgwJF1/mPq9Dc8Z1w29kl14OZ/3L/W2cKkAzDONUb10wElDa2QiDnsKEY/P4LrTulrGhyvlignQpgdHq2JoCilUSUcJJ/bzVusU2k9peb1Y+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K2w4UVfe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-141-184.net.vodafone.it [5.90.141.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2951F346;
	Mon, 16 Jun 2025 16:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750084507;
	bh=G7S5AH3sLreBuc+SKahbLJg9HZ4XzjVGB9fRXPtFIKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2w4UVfeiTpgV1KvG997KELMScf31gmucNJSo5S80Vfatg9gEJ0U95eRC2S76J+h2
	 b9lWGC+NPoIx0sVlO0pbJ2FK+SfyA31/OuSJwoaSsdwjnf1OhpChREu+09B5vx3Chk
	 8vaV2YaLA01lgUAVf7Ma9DFWy7xLYAhcZ+k9DIto=
Date: Mon, 16 Jun 2025 16:35:13 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: vsp1: vsp1_dl: Count display lists
Message-ID: <qypirqm25w3k62j27bk7hmyxpcsompygiaey2fzwp2z7y3t6sf@uncpux7arh4n>
References: <20250529-vsp1_dl_list_count-v1-0-40c6d0e20592@ideasonboard.com>
 <20250529-vsp1_dl_list_count-v1-2-40c6d0e20592@ideasonboard.com>
 <20250616133134.GC10542@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616133134.GC10542@pendragon.ideasonboard.com>

Hi Laurent

On Mon, Jun 16, 2025 at 04:31:34PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Thu, May 29, 2025 at 06:36:31PM +0200, Jacopo Mondi wrote:
> > To detect invalid usage patterns of the display list helpers, store
>
> We can be more precise:
>
> "To detect leaks of display lists, ..."
>
> > in the display list manager the number of available display lists
>
> s/available/allocated/
>
> > when the manager is created and verify that when the display manager
> > is reset the same number of lists is available.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_dl.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> > index 8a3c0274a163..5c4eeb65216f 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> > @@ -214,6 +214,7 @@ struct vsp1_dl_list {
> >   * @pending: list waiting to be queued to the hardware
> >   * @pool: body pool for the display list bodies
> >   * @cmdpool: commands pool for extended display list
> > + * @list_count: display list counter
>
> "number of allocated display lists"
>
> >   */
> >  struct vsp1_dl_manager {
> >  	unsigned int index;
> > @@ -228,6 +229,8 @@ struct vsp1_dl_manager {
> >
> >  	struct vsp1_dl_body_pool *pool;
> >  	struct vsp1_dl_cmd_pool *cmdpool;
> > +
> > +	size_t list_count;
> >  };
> >
> >  /* -----------------------------------------------------------------------------
> > @@ -1073,7 +1076,9 @@ void vsp1_dlm_setup(struct vsp1_device *vsp1)
> >
> >  void vsp1_dlm_reset(struct vsp1_dl_manager *dlm)
> >  {
> > +	size_t dlm_list_count;
> >  	unsigned long flags;
> > +	size_t list_count;
> >
> >  	spin_lock_irqsave(&dlm->lock, flags);
> >
> > @@ -1081,8 +1086,13 @@ void vsp1_dlm_reset(struct vsp1_dl_manager *dlm)
> >  	__vsp1_dl_list_put(dlm->queued);
> >  	__vsp1_dl_list_put(dlm->pending);
> >
> > +	list_count = list_count_nodes(&dlm->free);
> > +	dlm_list_count = dlm->list_count;
>
> dlm->list_count is not documented as protected by the lock. I don't
> think that's an oversight, as it can only be set when the dlm is
> created. You can drop the dlm_list_count variable and use
> dlm->list_count below.
>
Ack

> > +
> >  	spin_unlock_irqrestore(&dlm->lock, flags);
> >
> > +	WARN_ON_ONCE(list_count != dlm_list_count);
> > +
> >  	dlm->active = NULL;
> >  	dlm->queued = NULL;
> >  	dlm->pending = NULL;
> > @@ -1150,6 +1160,7 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
> >  				      + sizeof(*dl->header);
> >
> >  		list_add_tail(&dl->list, &dlm->free);
> > +		dlm->list_count = list_count_nodes(&dlm->free);
>
> Does this need to be done inside the loop, can't you just write
>
> 	dlm->list_count = prealloc;
>
> after the loop ?
>

Oh indeed, this was stupid. Thanks for catching this

> >  	}
> >
> >  	if (vsp1_feature(vsp1, VSP1_HAS_EXT_DL)) {
>
> --
> Regards,
>
> Laurent Pinchart

