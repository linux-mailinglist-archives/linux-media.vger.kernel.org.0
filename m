Return-Path: <linux-media+bounces-36465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35084AF03C7
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 21:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7737516A6FC
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 19:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A82E27FD5B;
	Tue,  1 Jul 2025 19:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LQ9IBkJ9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946A382;
	Tue,  1 Jul 2025 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398197; cv=none; b=VAiuE5CH+IBt/8pPgOW8oX4aiGebxmH3qF0HajyxOVhIyev+9627M+Sf+MnzrZG5uWVAnQUtLrfGvVJe3CAkf8ns61Lg4Uhyb9+Za1Yb8t8kNUAk3l2ZcFsE1++sG2Oz4h6L0IDvPtj6zv6udHsx9POK6kc3G+GtNywU//eFz8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398197; c=relaxed/simple;
	bh=UeQXokiUpfIRKzCV4siHL91mgA1HxJxuNduWOJ0cc/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ct5CiTOe//1QSOgPtbGkw3qcWjltLphjnLRvZ7c/zjMvIkfCtrDjMvxJjHz86vY+43q5HCF0XKW6MtlRXj7syb8Z1BK3airmpr+2VylytZXlX8PqcAvypCKu1LhjNOLBQZ7lXOSVs3n8gqYgmtWsYLEcL1cp/fhvtLIMnDH3QWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LQ9IBkJ9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D5B04778;
	Tue,  1 Jul 2025 21:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751398172;
	bh=UeQXokiUpfIRKzCV4siHL91mgA1HxJxuNduWOJ0cc/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQ9IBkJ9E0I0v8VB4ePqnqGQXO8B6MacZ/vgwdwg/GXmzybL/r52BD0gYWBXAS4er
	 cKvwJsS5e3KuHLR6Znb/VAKxSi+UeCOruuiBrFm5zClONa+rSKsXTG9UYJAtF5zIXQ
	 Wcd87Cr5Qn5C5mKsXIvPOjN9OPBs2jKUXym2txSc=
Date: Tue, 1 Jul 2025 22:29:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Desnes Nunes <desnesn@redhat.com>, hansg@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: avoid variable shadowing in
 uvc_ctrl_cleanup_fh
Message-ID: <20250701192928.GB16835@pendragon.ideasonboard.com>
References: <20250701145240.105959-1-desnesn@redhat.com>
 <CANiDSCs_Pz-wgnYNVA7Zt4RhtgN256i32aCw0mE4XFv3b49ygw@mail.gmail.com>
 <CACaw+ex_T5xS9rw1651TV_z1myXxPGmtpeEB4HWA7S0xU+C9GQ@mail.gmail.com>
 <20250701184134.GC1936@pendragon.ideasonboard.com>
 <CANiDSCt5OZ8dAvZ7G_fic6eCaCsGvmnprjmG9p_9kLbv9cX76A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCt5OZ8dAvZ7G_fic6eCaCsGvmnprjmG9p_9kLbv9cX76A@mail.gmail.com>

On Tue, Jul 01, 2025 at 09:25:59PM +0200, Ricardo Ribalda wrote:
> On Tue, 1 Jul 2025 at 20:42, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Tue, Jul 01, 2025 at 02:20:53PM -0300, Desnes Nunes wrote:
> > > On Tue, Jul 1, 2025 at 1:48 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > > On Tue, 1 Jul 2025 at 16:59, Desnes Nunes <desnesn@redhat.com> wrote:
> > > > >
> > > > > This avoids a variable loop shadowing occurring between the local loop
> > > > > iterating through the uvc_entity's controls and the global one going
> > > > > through the pending async controls of the file handle
> > > > >
> > > > > Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
> > > > If you add a fixes you need to add
> > > > Cc: stable@kernel.org
> > >
> > > Thanks for letting me know
> > >
> > > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > > > > ---
> > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
> > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > index 44b6513c5264..91cc874da798 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > @@ -3260,7 +3260,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> > > > >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > > > >  {
> > > > >         struct uvc_entity *entity;
> > > > > -       int i;
> > > > >
> > > > >         guard(mutex)(&handle->chain->ctrl_mutex);
> > > > >
> > > > > @@ -3278,7 +3277,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > > > >         if (!WARN_ON(handle->pending_async_ctrls))
> > > > >                 return;
> > > > >
> > > > > -       for (i = 0; i < handle->pending_async_ctrls; i++)
> > > >
> > > > nitpick: I would have called the variable i, not j.  For me j usually
> > > > means nested loop. But up to you
> > >
> > > Noted - I used a different variable name because I wanted to
> > > differentiate the loops.
> >
> > Variable declaration in the loop statement is relatively new in the
> > kernel, so there's no consensus yet (to my knowledge) on clear coding
> > styles, but I would have simply used the same variable name in both
> > loops, with two separate declarations:
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 303b7509ec47..6b9486749c3f 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -3299,7 +3299,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >  {
> >         struct uvc_entity *entity;
> > -       int i;
> >
> >         guard(mutex)(&handle->chain->ctrl_mutex);
> >
> > @@ -3317,7 +3316,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >         if (!WARN_ON(handle->pending_async_ctrls))
> >                 return;
> >
> > -       for (i = 0; i < handle->pending_async_ctrls; i++)
> > +       for (unsigned int i = 0; i < handle->pending_async_ctrls; i++)
> >                 uvc_pm_put(handle->stream->dev);
> >  }
> >
> > Is there a downside to this ?
> 
> The toolchain that they are using does not seem to like it,

Well, this is mainline :-)

> and there
> is no benefit for having two initialization vs one.
> 
> (also makes the lines shorter... but that is just a matter of taste).
> 
> I don't really have a preference.

Declaring the variable in the loop statement removes the possibility of
using it outside of the loop. I think that's an improvement in general,
it makes reading the code simpler, and avoids accidental misuse.

> > > > I am also not against your first version with a different commit message.
> > >
> > > Third time's a charm then!
> > >
> > > Will send a v2 with the first version having this commit message.
> > >
> > > Thanks for the review Ricardo,

-- 
Regards,

Laurent Pinchart

