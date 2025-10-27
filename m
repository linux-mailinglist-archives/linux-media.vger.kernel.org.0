Return-Path: <linux-media+bounces-45607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C978CC0BB58
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 03:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 756CB3B33E7
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 02:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7762857C6;
	Mon, 27 Oct 2025 02:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="stCzLig6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06041553AA;
	Mon, 27 Oct 2025 02:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761533226; cv=none; b=vGExQdDUo3PqH/zzJDpC7W9a0XGiwcfGMNRjpJ7DDelgP5eKPJtJIHzQ6dzNh7G9mCZbxFwmd297f1aM7SPSdrcGUcM/fpErRvtKO1nVSTRMPrZauMTB4AdQ+eTdhFYFxRo+n7Uwv/NpA13k/CLF0k0zEGq8oyf+NFN9rE+5EmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761533226; c=relaxed/simple;
	bh=rzGqEWG0gWUe+CM1K0uQ5Eq2Dk9tkjdIvPTj9UcKlGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=of0AghKu3Uk2XyJIkDjXz7Vm50L0cwD56zAtiH3Gl6ikGGyeg+Fttx4smfyyRELZ+T3TqC62yL4LYswweB31jXaWnoIBVMb0ebDC4wjGqVef6tD+X6k3sUEHWohSCSsQGL3lNm6j5br66avSG2+a5iDW1bFIisdZtxP0Oo1NSrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=stCzLig6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8E46A7FA;
	Mon, 27 Oct 2025 03:45:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761533115;
	bh=rzGqEWG0gWUe+CM1K0uQ5Eq2Dk9tkjdIvPTj9UcKlGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stCzLig6gu5O9ZTmbeT+37VYf3FSVenAIetgWbWR7Z3LU9z2leZShVNPtRm65JIXc
	 32iXhDP2FxTYWKbkaIJWvpA4T7pOS+92EbHG5YA3v489iqPDzAwubSFTBN/rUVIWcq
	 PjQKaN8sb+2GFsn6KKC5Fhq3uKILmrZ6O1hULPNk=
Date: Mon, 27 Oct 2025 04:46:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Create a specific id namespace for
 output entities
Message-ID: <20251027024648.GA6330@pendragon.ideasonboard.com>
References: <20251022120849.GD727@pendragon.ideasonboard.com>
 <CANiDSCvtqe8MKpb=O-=Mv28dK+g=REi7kpdr-eyAD-mLLpzQJw@mail.gmail.com>
 <20251022124937.GE727@pendragon.ideasonboard.com>
 <CANiDSCscZgwUM0VCpdMvNKq0U2a6kOPbJmd4G8iY3EpsPQvZNw@mail.gmail.com>
 <20251022131236.GG19043@pendragon.ideasonboard.com>
 <CANiDSCsVOsCDjg_KU8Y82h9Ujfro4nQ=f4B1BezAkQtJUKFczg@mail.gmail.com>
 <20251023112459.GJ19043@pendragon.ideasonboard.com>
 <CANiDSCuex8w8GvMuKMyZw5sBCeW0wLteRJy97LG5Z_TDbWZ71w@mail.gmail.com>
 <20251024105441.GB13023@pendragon.ideasonboard.com>
 <CANiDSCuFP=HRu1JUnyomFOYUt-8=SA679dLy+eC8c8Yk0PNxLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuFP=HRu1JUnyomFOYUt-8=SA679dLy+eC8c8Yk0PNxLw@mail.gmail.com>

On Fri, Oct 24, 2025 at 01:00:53PM +0200, Ricardo Ribalda wrote:
> On Fri, 24 Oct 2025 at 12:54, Laurent Pinchart wrote:
> > On Thu, Oct 23, 2025 at 01:47:39PM +0200, Ricardo Ribalda wrote:
> > > On Thu, 23 Oct 2025 at 13:25, Laurent Pinchart wrote:
> > > > On Wed, Oct 22, 2025 at 03:14:09PM +0200, Ricardo Ribalda wrote:
> > > > > On Wed, 22 Oct 2025 at 15:12, Laurent Pinchart wrote:
> > > > > > On Wed, Oct 22, 2025 at 03:08:58PM +0200, Ricardo Ribalda wrote:
> > > > > > > On Wed, 22 Oct 2025 at 14:49, Laurent Pinchart wrote:
> > > > > > > > On Wed, Oct 22, 2025 at 02:29:15PM +0200, Ricardo Ribalda wrote:
> > > > > > > > > On Wed, 22 Oct 2025 at 14:09, Laurent Pinchart wrote:
> > > > > > > > > > On Wed, Oct 22, 2025 at 11:55:16AM +0000, Ricardo Ribalda wrote:
> > > > > > > > > > > Nothing can be connected from an output entity. Which means that no
> > > > > > > > > >
> > > > > > > > > > s/output entity/output terminal. Same below.
> > > > > > > > > >
> > > > > > > > > > Did you mean s/from an/to an/ ?
> > > > > > > > > >
> > > > > > > > > > > other entity can reference an output entity as baSourceId.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Some output terminals have controls, so we need to preserve their ID.
> > > > > > > > > > That's why my proposal only set the UVC_TERM_OUTPUT bit for the
> > > > > > > > > > *streaming* output terminals, not for all output terminals.
> > > > > > > > > >
> > > > > > > > > > > Use this fact to move all the output entities to a different namespace
> > > > > > > > > > > id.
> > > > > > > > > > >
> > > > > > > > > > > The output entities are usually named after the dev_name() of the usb
> > > > > > > > > > > device, so there should not be any uAPI change from this change.
> > > > > > > > > > >
> > > > > > > > > > > Although with this change we can handle some id collisions
> > > > > > > > > > > automagically, change the logic of uvc_alloc_new_entity() to keep
> > > > > > > > > > > showing a warning when a camera has invalid descriptors. Hopefully this
> > > > > > > > > > > message will help vendors fix their invalid descriptors.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > > > > > ---
> > > > > > > > > > > Hi, this patch fixes support for some devices with invalid USB
> > > > > > > > > > > descriptor.
> > > > > > > > > > >
> > > > > > > > > > > It is orthogonal to:
> > > > > > > > > > > https://lore.kernel.org/linux-media/20251021184213.GC19043@pendragon.ideasonboard.com/T/#t
> > > > > > > > > > >
> > > > > > > > > > > Some devices will be fixed by the other patch, other devices will be
> > > > > > > > > > > fixed by this. In my opinion is worth to land both patches.
> > > > > > > > > > >
> > > > > > > > > > > Tested with GRANDSTREAM GUV3100 in a 6.6 kernel.
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++----
> > > > > > > > > > >  1 file changed, 19 insertions(+), 4 deletions(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > > > index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..40f8ae0df89e104992f5d55af3d3539dea3d146e 100644
> > > > > > > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > > > @@ -165,10 +165,14 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
> > > > > > > > > > >       return NULL;
> > > > > > > > > > >  }
> > > > > > > > > > >
> > > > > > > > > > > +#define ENTITY_HARDWARE_ID(id) ((id) & ~UVC_TERM_OUTPUT)
> > > > > > > > > >
> > > > > > > > > > This needs a UVC_ prefix, and should probably go to uvcvideo.h. You can
> > > > > > > > > > also & 0xff, as the UVC descriptors store IDs in 8-bit fields.
> > > > > > > > > >
> > > > > > > > > > > +
> > > > > > > > > > >  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
> > > > > > > > > > >  {
> > > > > > > > > > >       struct uvc_streaming *stream;
> > > > > > > > > > >
> > > > > > > > > > > +     id = ENTITY_HARDWARE_ID(id);
> > > > > > > > > > > +
> > > > > > > >
> > > > > > > > Another comment, I would have done this in the (single) caller, to keep
> > > > > > > > operating on real ids in this function. Or we could pass a struct
> > > > > > > > uvc_entity instead of an int id and rename the function to
> > > > > > > > uvc_stream_for_terminal(), which could better encapsulate the purpose.
> > > > > > >
> > > > > > > Like the second option better.
> > > > > >
> > > > > > I think I do too.
> > > > > >
> > > > > > > > > > >       list_for_each_entry(stream, &dev->streams, list) {
> > > > > > > > > > >               if (stream->header.bTerminalLink == id)
> > > > > > > > > > >                       return stream;
> > > > > > > > > > > @@ -810,10 +814,12 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > > > > > > > > > >       }
> > > > > > > > > > >
> > > > > > > > > > >       /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> > > > > > > > > > > -     if (uvc_entity_by_id(dev, id)) {
> > > > > > > > > > > -             dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
> > > > > > > > > > > +     if (uvc_entity_by_id(dev, ENTITY_HARDWARE_ID(id)))
> > > > > > > > > > > +             dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n",
> > > > > > > > > > > +                     ENTITY_HARDWARE_ID(id));
> > > > > > > > > >
> > > > > > > > > > It's not an error anymore if there's no collision of the full 16-bit ID,
> > > > > > > > > > right ? Should it be demoted to a dev_warn() ?
> > > > > > > > >
> > > > > > > > > if it is OK with you I'd rather keep the dev_err(). If an ISP
> > > > > > > > > manufacturer tests their camera in Linux I want them to really notice
> > > > > > > > > that there is an error.
> > > > > > > >
> > > > > > > > Yes I'm OK with that. It shouldn't happen. We want a dev_err_and_blame()
> > > > > > > > that prints a message to the kernel log and posts messages on social
> > > > > > > > networks to blame the hardware manufacturer.
> > > > > > > >
> > > > > > > > > Besides that, I have implemented all your proposed changes.
> > > > > > > > >
> > > > > > > > > I cannot test it until tomorrow in real hardware. But the changes are
> > > > > > > > > trivial, let me know if I shall send the v2 right now or wait til it
> > > > > > > > > is tested.
> > > > > > > >
> > > > > > > > Up to you, I don't mind either way.
> > > > > > > >
> > > > > > > > If we merge "[PATCH v2] media: uvcvideo: Use heuristic to find stream
> > > > > > > > entity" first, do you plan to revert it to get this patch merged ?
> > > > > > >
> > > > > > > I think they solve two different issues:
> > > > > > >
> > > > > > > - Output terminal id collides with another entity id.
> > > > > > > - Incorrect bTerminalLink
> > > > > >
> > > > > > Do we know of any device affected by that issue ?
> > > > >
> > > > > I bet you there is one :)
> > > >
> > > > I'd rather be cautious and address that if the issue arises. Enabling
> > > > non-compliant behaviour has the drawback of making issues less visible
> > > > to vendors, so I would prefer not working around problems unless we know
> > > > they exist.
> > >
> > > My main goal right now is to solve the regression.
> > >
> > > If you think that this approach is best, please add your review-by and
> > > the following tags to the patch. And let's start landing into upstream
> > > asap.
> >
> > I've done so in v2. Could you check if you're OK with the proposed
> > changes for the commit message and comment ? I'll then send a v3 with
> > all the tags (or you can do so yourself to ack the proposed changes),
> > and Hans or Mauro can pick the patch up as a fix.
> 
> I am fine with you sending the v3.
> 
> HansV has already landed the other patch in /fixes
> 
> So I think the best approach here is:
> 
> 1) Wait until the fix is in media-commiters/next (*)
> 2) Add a revert in uvc/next
> 3) Add this patch in uvc/next

The fix hasn't been merged in v6.18-rc3 yet. If it doesn't land in -rc4
we'll need a different strategy.

> (*) If after 1 you have not posted v3 I will do it with your changes and tags.

I've just posted v3.

> > Thanks for testing the proposed change, I appreciate it.
> >
> > > We can discuss later if we want an extra patch or if we want to wait
> > > for another report.
> > >
> > > Reported-by: Angel4005 <ooara1337@gmail.com>
> > > Closes: https://lore.kernel.org/linux-media/CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com/
> > > Fixes: 0e2ee70291e6 ("media: uvcvideo: Mark invalid entities with id
> > > UVC_INVALID_ENTITY_ID")
> > >
> > > > > > >  We can have the two patches in.  If there is any conflict because we
> > > > > > > land one and then the other I can send a v3 fixing the conflict. Or a
> > > > > > > maintainer can do that, they should be trivial conflicts.
> > > > > > >
> > > > > > > > > > > +
> > > > > > > > > > > +     if (uvc_entity_by_id(dev, id))
> > > > > > > > > > >               id = UVC_INVALID_ENTITY_ID;
> > > > > > > > > > > -     }
> > > > > > > > > > >
> > > > > > > > > > >       extra_size = roundup(extra_size, sizeof(*entity->pads));
> > > > > > > > > > >       if (num_pads)
> > > > > > > > > > > @@ -969,6 +975,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > > > > > > > > > >       struct usb_host_interface *alts = dev->intf->cur_altsetting;
> > > > > > > > > > >       unsigned int i, n, p, len;
> > > > > > > > > > >       const char *type_name;
> > > > > > > > > > > +     unsigned int id;
> > > > > > > > > > >       u16 type;
> > > > > > > > > > >
> > > > > > > > > > >       switch (buffer[2]) {
> > > > > > > > > > > @@ -1107,8 +1114,16 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > > > > > > > > > >                       return 0;
> > > > > > > > > > >               }
> > > > > > > > > > >
> > > > > > > > > > > +             /*
> > > > > > > > > > > +              * Nothing can be connected from an output terminal. To avoid
> > > > > > > > > > > +              * entity-id's collisions in devices with invalid USB
> > > > > > > > > > > +              * descriptors, move the output terminal id to its own
> > > > > > > > > > > +              * namespace.
> > > > > > > > > > > +              */
> > > > > > > > > > > +             id = buffer[3] | UVC_TERM_OUTPUT;
> > > > > > > > > > > +
> > > > > > > > > > >               term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> > > > > > > > > > > -                                         buffer[3], 1, 0);
> > > > > > > > > > > +                                         id, 1, 0);
> > > > > > > > > > >               if (IS_ERR(term))
> > > > > > > > > > >                       return PTR_ERR(term);
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > ---
> > > > > > > > > > > base-commit: ea299a2164262ff787c9d33f46049acccd120672
> > > > > > > > > > > change-id: 20251022-uvc-grandstream-laurent-3f9abb8a0d5b

-- 
Regards,

Laurent Pinchart

