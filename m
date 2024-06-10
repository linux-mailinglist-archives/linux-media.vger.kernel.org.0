Return-Path: <linux-media+bounces-12855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54A990208B
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 13:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C68D41C20FE3
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 11:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8CF7D40D;
	Mon, 10 Jun 2024 11:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tSfnduN5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7437711A;
	Mon, 10 Jun 2024 11:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718019810; cv=none; b=q8YhLJdZycU7q90F45/XeDV8en6pbe+F7j9ibRmo17b7+l62jRiXIMblgbkXWYqMI8/mS2DdrXxLy1w6KVav0QnfnWcsfBfTjHAD7ee/SSjawPwqNxNiMvP/ON9NIGIJJ9PZIbaNBdm3WnaYcr+pE/ZOYX6s6XI91EMTbGop9kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718019810; c=relaxed/simple;
	bh=A2UrWvpzcV8mD91bwCSuFpb+wTplVoHZLc2I0ye9+58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/aMC2SJpRf2lKR9VgChi2+znViqimudhZIlBrcvCUbcxLANLkTE5WX2SL4N/C1lMXSEjnxxSUe4lddEm4ac8O1QVoZxay7Eov29ktoA44aqNh2I7E1K3BPqnfOYhUiejXmzPiYq4dUJnULhFKnnb4/l1r1Ar+iwN3cCCf5e6y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tSfnduN5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95BB966F;
	Mon, 10 Jun 2024 13:43:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718019795;
	bh=A2UrWvpzcV8mD91bwCSuFpb+wTplVoHZLc2I0ye9+58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSfnduN55Y2h/duvE2uu4wyNYNhEvYg3wqCkgr02/GJF0jfWiJPKHLkuq4SE77TDw
	 SGnipWbyc1DI61bmsR4+Pl2BJ49bmOgcMmhloBVKhMMPQFmdzPh5oHi2JYF6MwQx5O
	 hfI1O9LiR4O3+lNecMDcsO8jT61tNVGhBAdvE8DY=
Date: Mon, 10 Jun 2024 14:43:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	"hn.chen" <hn.chen@sunplusit.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v10 4/6] media: uvcvideo: Allow hw clock updates with
 buffers not full
Message-ID: <20240610114306.GR18479@pendragon.ideasonboard.com>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-4-b08e590d97c7@chromium.org>
 <4kck7oedsnj6kfiv7ykwsjg35qodg5bdktu5t5w3xtg2xuscto@2yh6kfdqwimc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4kck7oedsnj6kfiv7ykwsjg35qodg5bdktu5t5w3xtg2xuscto@2yh6kfdqwimc>

On Wed, May 29, 2024 at 05:03:08PM +0900, Tomasz Figa wrote:
> On Sat, Mar 23, 2024 at 10:48:05AM +0000, Ricardo Ribalda wrote:
> > With UVC 1.5 we get as little as one clock sample per frame. Which means
> > that it takes 32 frames to move from the software timestamp to the
> > hardware timestamp method.
> > 
> > This results in abrupt changes in the timestamping after 32 frames (~1
> > second), resulting in noticeable artifacts when used for encoding.
> > 
> > With this patch we modify the update algorithm to work with whatever
> > amount of values are available.
> > 
> > Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index d6ca383f643e3..af25b9f1b53fe 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -768,10 +768,10 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
> >  
> >  	spin_lock_irqsave(&clock->lock, flags);
> >  
> > -	if (clock->count < clock->size)
> > +	if (clock->count < 2)
> >  		goto done;
> >  
> > -	first = &clock->samples[clock->head];
> > +	first = &clock->samples[(clock->head - clock->count + clock->size) % clock->size];
> >  	last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
> >  
> >  	/* First step, PTS to SOF conversion. */
> > @@ -786,6 +786,18 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
> >  	if (y2 < y1)
> >  		y2 += 2048 << 16;
> >  
> > +	/*
> > +	 * Have at least 1/4 of a second of timestamps before we
> > +	 * try to do any calculation. Otherwise we do not have enough
> > +	 * precision. This value was determined by running Android CTS
> > +	 * on different devices.
> > +	 *
> > +	 * dev_sof runs at 1KHz, and we have a fixed point precision of
> > +	 * 16 bits.
> > +	 */
> > +	if ((y2 - y1) < ((1000 / 4) << 16))
> > +		goto done;
> 
> Not a comment for this patch directly, but...
> 
> This kind of makes me wonder if we don't want to have some documentation
> that specifies what the userspace can expect from the timestamps, so
> that this isn't changed randomly in the future breaking what was fixed
> by this patch.

I think timestamp handling should really be moved to userspace. It will
be easier to handle with floating-point arithmetic there. That would
have been difficult to manage for applications a while ago, but now that
we have libcamera, we could implement it there. This isn't high on my
todo list though.

> Anyway:
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>

-- 
Regards,

Laurent Pinchart

