Return-Path: <linux-media+bounces-45240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74496BFC21C
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 15:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3334E6211E2
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 13:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272953446C3;
	Wed, 22 Oct 2025 13:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JT0vXf2U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533382F2905;
	Wed, 22 Oct 2025 13:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138772; cv=none; b=cz2y6wjoef385kkLOG/bIRh3oa1l7HCxeHrmXuhqyV51Oj0GOYE8pQBNYtRcsL3V/Fr3/mKkxQeyibIrfAGmlQHcc7J37IKRduMabnGKV3/hewfQRQCWfDC3efCMcNtuFsWwW7WdxtJ1u606lw8ymE1JRpuXsJdBDlidq5P2fpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138772; c=relaxed/simple;
	bh=NZXfvbDnYtsn32+yxldQ8FmDVlqNET5ZpEtO4ZBZynA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UStPULybyCGJa2Eh4+0inwcfqR9ZnFeZaSWYofM7v+B2qc6wSTBHpwpDTNwrLcDldTwizT67MVYut0eAMbe+1H7eGkXdaDRQU0XgJuvsIhMlLMt7bYPNt/BY2pdTrYQb+ggN46IK0Eglcb6JzOAE1SQPIyY+qtn5AKtcrW0w+v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JT0vXf2U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4EA0713E2;
	Wed, 22 Oct 2025 15:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761138663;
	bh=NZXfvbDnYtsn32+yxldQ8FmDVlqNET5ZpEtO4ZBZynA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JT0vXf2UhpgXFkYY5gnjPceuHIesiJvYJ+ufJ1dIwBIM7mA37KlubTHv0EmTmjUS3
	 DD8IimppTrrg7oRUfYkgBbFqIfjpacvZK6waseHxuFQEYEpT5R3u7TOjR5Qd6zOtR9
	 YTtJPGbs2J0GiGtsRursYxwOMsgAyWRkfk/RTU4g=
Date: Wed, 22 Oct 2025 16:12:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Create a specific id namespace for
 output entities
Message-ID: <20251022131236.GG19043@pendragon.ideasonboard.com>
References: <20251022-uvc-grandstream-laurent-v1-1-0925738a3484@chromium.org>
 <20251022120849.GD727@pendragon.ideasonboard.com>
 <CANiDSCvtqe8MKpb=O-=Mv28dK+g=REi7kpdr-eyAD-mLLpzQJw@mail.gmail.com>
 <20251022124937.GE727@pendragon.ideasonboard.com>
 <CANiDSCscZgwUM0VCpdMvNKq0U2a6kOPbJmd4G8iY3EpsPQvZNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCscZgwUM0VCpdMvNKq0U2a6kOPbJmd4G8iY3EpsPQvZNw@mail.gmail.com>

On Wed, Oct 22, 2025 at 03:08:58PM +0200, Ricardo Ribalda wrote:
> On Wed, 22 Oct 2025 at 14:49, Laurent Pinchart wrote:
> > On Wed, Oct 22, 2025 at 02:29:15PM +0200, Ricardo Ribalda wrote:
> > > On Wed, 22 Oct 2025 at 14:09, Laurent Pinchart wrote:
> > > > On Wed, Oct 22, 2025 at 11:55:16AM +0000, Ricardo Ribalda wrote:
> > > > > Nothing can be connected from an output entity. Which means that no
> > > >
> > > > s/output entity/output terminal. Same below.
> > > >
> > > > Did you mean s/from an/to an/ ?
> > > >
> > > > > other entity can reference an output entity as baSourceId.
> > > > >
> > > >
> > > > Some output terminals have controls, so we need to preserve their ID.
> > > > That's why my proposal only set the UVC_TERM_OUTPUT bit for the
> > > > *streaming* output terminals, not for all output terminals.
> > > >
> > > > > Use this fact to move all the output entities to a different namespace
> > > > > id.
> > > > >
> > > > > The output entities are usually named after the dev_name() of the usb
> > > > > device, so there should not be any uAPI change from this change.
> > > > >
> > > > > Although with this change we can handle some id collisions
> > > > > automagically, change the logic of uvc_alloc_new_entity() to keep
> > > > > showing a warning when a camera has invalid descriptors. Hopefully this
> > > > > message will help vendors fix their invalid descriptors.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > > Hi, this patch fixes support for some devices with invalid USB
> > > > > descriptor.
> > > > >
> > > > > It is orthogonal to:
> > > > > https://lore.kernel.org/linux-media/20251021184213.GC19043@pendragon.ideasonboard.com/T/#t
> > > > >
> > > > > Some devices will be fixed by the other patch, other devices will be
> > > > > fixed by this. In my opinion is worth to land both patches.
> > > > >
> > > > > Tested with GRANDSTREAM GUV3100 in a 6.6 kernel.
> > > > > ---
> > > > >  drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++----
> > > > >  1 file changed, 19 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > > index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..40f8ae0df89e104992f5d55af3d3539dea3d146e 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > @@ -165,10 +165,14 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
> > > > >       return NULL;
> > > > >  }
> > > > >
> > > > > +#define ENTITY_HARDWARE_ID(id) ((id) & ~UVC_TERM_OUTPUT)
> > > >
> > > > This needs a UVC_ prefix, and should probably go to uvcvideo.h. You can
> > > > also & 0xff, as the UVC descriptors store IDs in 8-bit fields.
> > > >
> > > > > +
> > > > >  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
> > > > >  {
> > > > >       struct uvc_streaming *stream;
> > > > >
> > > > > +     id = ENTITY_HARDWARE_ID(id);
> > > > > +
> >
> > Another comment, I would have done this in the (single) caller, to keep
> > operating on real ids in this function. Or we could pass a struct
> > uvc_entity instead of an int id and rename the function to
> > uvc_stream_for_terminal(), which could better encapsulate the purpose.
> 
> Like the second option better.

I think I do too.

> > > > >       list_for_each_entry(stream, &dev->streams, list) {
> > > > >               if (stream->header.bTerminalLink == id)
> > > > >                       return stream;
> > > > > @@ -810,10 +814,12 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > > > >       }
> > > > >
> > > > >       /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> > > > > -     if (uvc_entity_by_id(dev, id)) {
> > > > > -             dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
> > > > > +     if (uvc_entity_by_id(dev, ENTITY_HARDWARE_ID(id)))
> > > > > +             dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n",
> > > > > +                     ENTITY_HARDWARE_ID(id));
> > > >
> > > > It's not an error anymore if there's no collision of the full 16-bit ID,
> > > > right ? Should it be demoted to a dev_warn() ?
> > >
> > > if it is OK with you I'd rather keep the dev_err(). If an ISP
> > > manufacturer tests their camera in Linux I want them to really notice
> > > that there is an error.
> >
> > Yes I'm OK with that. It shouldn't happen. We want a dev_err_and_blame()
> > that prints a message to the kernel log and posts messages on social
> > networks to blame the hardware manufacturer.
> >
> > > Besides that, I have implemented all your proposed changes.
> > >
> > > I cannot test it until tomorrow in real hardware. But the changes are
> > > trivial, let me know if I shall send the v2 right now or wait til it
> > > is tested.
> >
> > Up to you, I don't mind either way.
> >
> > If we merge "[PATCH v2] media: uvcvideo: Use heuristic to find stream
> > entity" first, do you plan to revert it to get this patch merged ?
> 
> I think they solve two different issues:
> 
> - Output terminal id collides with another entity id.
> - Incorrect bTerminalLink

Do we know of any device affected by that issue ?

>  We can have the two patches in.  If there is any conflict because we
> land one and then the other I can send a v3 fixing the conflict. Or a
> maintainer can do that, they should be trivial conflicts.
> 
> > > > > +
> > > > > +     if (uvc_entity_by_id(dev, id))
> > > > >               id = UVC_INVALID_ENTITY_ID;
> > > > > -     }
> > > > >
> > > > >       extra_size = roundup(extra_size, sizeof(*entity->pads));
> > > > >       if (num_pads)
> > > > > @@ -969,6 +975,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > > > >       struct usb_host_interface *alts = dev->intf->cur_altsetting;
> > > > >       unsigned int i, n, p, len;
> > > > >       const char *type_name;
> > > > > +     unsigned int id;
> > > > >       u16 type;
> > > > >
> > > > >       switch (buffer[2]) {
> > > > > @@ -1107,8 +1114,16 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > > > >                       return 0;
> > > > >               }
> > > > >
> > > > > +             /*
> > > > > +              * Nothing can be connected from an output terminal. To avoid
> > > > > +              * entity-id's collisions in devices with invalid USB
> > > > > +              * descriptors, move the output terminal id to its own
> > > > > +              * namespace.
> > > > > +              */
> > > > > +             id = buffer[3] | UVC_TERM_OUTPUT;
> > > > > +
> > > > >               term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> > > > > -                                         buffer[3], 1, 0);
> > > > > +                                         id, 1, 0);
> > > > >               if (IS_ERR(term))
> > > > >                       return PTR_ERR(term);
> > > > >
> > > > >
> > > > > ---
> > > > > base-commit: ea299a2164262ff787c9d33f46049acccd120672
> > > > > change-id: 20251022-uvc-grandstream-laurent-3f9abb8a0d5b

-- 
Regards,

Laurent Pinchart

