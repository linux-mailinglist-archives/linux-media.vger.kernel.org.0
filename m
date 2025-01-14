Return-Path: <linux-media+bounces-24718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 360A6A106EA
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 13:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3E0165E0E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 12:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634D6236A92;
	Tue, 14 Jan 2025 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="rTvBT9ld"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CCF236A65
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 12:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858478; cv=none; b=DINndxwsQlAhMFTm2AV3xpk6Wu9+6gjuU7GbIA9YKojeP16DwUOjxb+TLQySsxxmw1I5vy6pqYP2LAExmh6EqJUzwg/yL0X2BLKx65rzCL2QnU6QV4BJnARqjpmik/RO6obRJyha1NnF/zHzp6PkXT9dTeaUvqsUzESJ6CIQzX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858478; c=relaxed/simple;
	bh=FLtWmFx/9zSfBUetOxKcwpWm37CTSRRd4WdVTedu9WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJKR7EUfhHwICPDgrzVIlUGfs4h7emWGcdf31W+rfNl6sWCqb4O32JfChE7ml3gz3matt1SeRNIOd70IAscdMSUG98EAh1QslZ5NjkuyH2ZE88QRTsQYxIiZ2s60Q/u0btxuKXn9bpHOr8v8SeQVWTa79AEhled8fNai2VDke+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=rTvBT9ld; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hoDHzCgUcNwd/f6b/Qp3Q+mBMmYcz+F5/T0dLjRVess=; b=rTvBT9lduyA7P+z67yjOPBz65i
	qTBd2g5dPueJi6cYU8FuOqFylmJTLNc8FKNjSnVK6Qr/6yVo9r+TCfyhciO8GtA+SXikV//Jr9EV2
	7qAts8B7O6ffKmkn4r6fNML0kH9zJD7V/od2rN5v5TE15cpuE/Uwmy6g6ePMvesdFtduNHLd7s1bm
	9P+B7DlCd0wEOrTIfpPSqpVdUu52UhvwY7ij3freOpM6L3cmrh7WejPyeetfI9LOk8Wu6kCiFc3Z4
	L1vyE2NzS+kFjMEkZXP8du2PCukmsQbdKNh6fJTpdN4EwzazPlqNQMaIkqrA/eJOZKnXDZgpl7Fvu
	onqSaW5Q==;
Received: from 179-125-92-253-dinamico.pombonet.net.br ([179.125.92.253] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tXgEI-00FeGL-SD; Tue, 14 Jan 2025 13:41:11 +0100
Date: Tue, 14 Jan 2025 09:41:05 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomasz Sikora <sikora.tomus@gmail.com>, hverkuil-cisco@xs4all.nl,
	kernel-dev@igalia.com, linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
Message-ID: <Z4ZbYavHz1DpCCwK@quatroqueijos.cascardo.eti.br>
References: <CADBf=5nJVddk-yPVw3T5GH9JEPOxnO8McPJHaxtnPBvLCnp42Q@mail.gmail.com>
 <Z3u2vHFVPYTmCnwj@quatroqueijos.cascardo.eti.br>
 <CADBf=5nS8_cQvG3mRnXe_MGYmFMh=Myf_eptPqN9hgNMu73Wjg@mail.gmail.com>
 <Z36ad0OxZBnQ0Kxx@quatroqueijos.cascardo.eti.br>
 <20250108153637.GE32541@pendragon.ideasonboard.com>
 <Z36gMvN0XxfXwE82@quatroqueijos.cascardo.eti.br>
 <CADBf=5m0WVMJbVfDvpFdqoYdKj=nT+mOW=D-Q2MJJ=TCbsTMuQ@mail.gmail.com>
 <Z3+pQ/xVdpiE/1GN@quatroqueijos.cascardo.eti.br>
 <20250113185059.GA30724@pendragon.ideasonboard.com>
 <CANiDSCtvwUEP+66NiXQRNjxpVyh_XCztJRYwdQQMKWx9p_SOcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtvwUEP+66NiXQRNjxpVyh_XCztJRYwdQQMKWx9p_SOcA@mail.gmail.com>

On Tue, Jan 14, 2025 at 11:01:32AM +0800, Ricardo Ribalda wrote:
> Hi
> 
> On Tue, 14 Jan 2025 at 02:51, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Thu, Jan 09, 2025 at 07:47:31AM -0300, Thadeu Lima de Souza Cascardo wrote:
> > > On Wed, Jan 08, 2025 at 11:14:28PM +0100, Tomasz Sikora wrote:
> > > > Hello,
> > > > you right
> > > > I have in dmsg (line 1228):
> > > > [   12.981124] usb 3-2: Failed to create links for entity 5
> > > > [   12.981126] usb 3-2: Failed to register entities (-22).
> > > >
> > > > full output in my log.
> > >
> > > Thanks, Tomasz.
> > >
> > > Can you test the attached fix? It should still keep the warning about the
> > > multiple units with the same ID, but now it would not return an error nor
> > > warn when registering the entities.
> > >
> > > Cascardo.
> >
> > > From f771f5c4657ed25ae36784bf13992ddbee3161e6 Mon Sep 17 00:00:00 2001
> > > From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > > Date: Thu, 9 Jan 2025 07:37:41 -0300
> > > Subject: [PATCH RFC] media: uvcvideo: restore support for non-compliant devices
> > >
> > > Some real-world devices have multiple units with the same ID. When creating
> > > their media entities, it would lead to warnings and failure to create such
> > > entities. However, the V4L2 devices would still be created and work.
> > >
> > > Restore their support, but still warn about the multiple units with the
> > > same ID. Avoid the failure in navigating through the chain by storing
> >
> > What's "the failure" here ?
> >
> > > pointers to the entities instead of only their IDs.
> >
> > Missing SoB and Fixes tags.
> >
> > The commit message should explain why this is better than reverting
> > 3dd075fe8ebb ("media: uvcvideo: Require entities to have a non-zero
> > unique ID"). I'm wondering if a revert with a clean fix on top may not
> > be easier to review.
> >
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 16 +++++++++++-----
> > >  drivers/media/usb/uvc/uvc_entity.c |  4 +++-
> > >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> > >  3 files changed, 15 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 1a22364f7da9..dd81067f8d30 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -791,10 +791,8 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > >       }
> > >
> > >       /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> > > -     if (uvc_entity_by_id(dev, id)) {
> > > -             dev_err(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
> > > -             return ERR_PTR(-EINVAL);
> > > -     }
> > > +     if (uvc_entity_by_id(dev, id))
> > > +             dev_warn(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
> > >
> > >       extra_size = roundup(extra_size, sizeof(*entity->pads));
> > >       if (num_pads)
> > > @@ -802,7 +800,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > >       else
> > >               num_inputs = 0;
> > >       size = sizeof(*entity) + extra_size + sizeof(*entity->pads) * num_pads
> > > -          + num_inputs;
> > > +          + num_inputs + sizeof(struct uvc_entity *) * num_inputs;
> > >       entity = kzalloc(size, GFP_KERNEL);
> > >       if (entity == NULL)
> > >               return ERR_PTR(-ENOMEM);
> > > @@ -840,6 +838,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > >
> > >       entity->bNrInPins = num_inputs;
> > >       entity->baSourceID = (u8 *)(&entity->pads[num_pads]);
> > > +     entity->source_entities = (struct uvc_entity **)(&entity->baSourceID[num_inputs]);
> > >
> > >       return entity;
> > >  }
> > > @@ -1503,6 +1502,7 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
> > >                               }
> > >
> > >                               forward->baSourceID[0] = source->id;
> > > +                             forward->source_entities[0] = source;
> > >                       }
> > >
> > >                       list_add_tail(&forward->chain, &chain->entities);
> > > @@ -1586,6 +1586,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
> > >                               return -EINVAL;
> > >                       }
> > >
> > > +                     entity->source_entities[i] = term;
> > > +
> > >                       uvc_dbg_cont(PROBE, " %d", term->id);
> > >
> > >                       list_add_tail(&term->chain, &chain->entities);
> > > @@ -1620,6 +1622,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
> > >               return -EINVAL;
> > >       }
> > >
> > > +     (*_entity)->source_entities[0] = entity;
> > > +
> > >       *_entity = entity;
> > >       return 0;
> > >  }
> > > @@ -1783,6 +1787,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
> > >                       goto error;
> > >
> > >               prev->baSourceID[0] = entity->id;
> > > +             prev->source_entities[0] = entity;
> > >               prev = entity;
> > >       }
> > >
> > > @@ -1790,6 +1795,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
> > >               goto error;
> > >
> > >       prev->baSourceID[0] = iterm->id;
> > > +     prev->source_entities[0] = iterm;
> > >
> > >       list_add_tail(&chain->list, &dev->chains);
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > > index cc68dd24eb42..7f42292b7fde 100644
> > > --- a/drivers/media/usb/uvc/uvc_entity.c
> > > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > > @@ -36,7 +36,9 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
> > >               if (!(entity->pads[i].flags & MEDIA_PAD_FL_SINK))
> > >                       continue;
> > >
> > > -             remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
> > > +             remote = entity->source_entities[i];
> > > +             if (remote == NULL)
> > > +                     remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
> >
> > That looks worrying. Why would source_entities[i] be NULL ?
> >
> > Devices with bad descriptors can lead to crashes, and it's important to
> > harden the code. Just warning about duplicate ideas and adding a
> > source_entities array that may or may not point to the right source (and
> > could point to NULL) doesn't seem to go in the right direction.
> >
> > Other options include adding a device-specific quirk that overrides the
> > incorrect entity IDs, or, possibly better, implementing a heuristic to
> > fix those automatically.
> 
> 
> Can't we simply do something like this:
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c
> b/drivers/media/usb/uvc/uvc_driver.c
> index a10d4f4d9f95..b55dc440db26 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -135,6 +135,9 @@ struct uvc_entity *uvc_entity_by_id(struct
> uvc_device *dev, int id)
>  {
>         struct uvc_entity *entity;
> 
> +       if (id == UVC_INVALID_ENTITY_ID)
> +               return NULL;
> +
>         list_for_each_entry(entity, &dev->entities, list) {
>                 if (entity->id == id)
>                         return entity;
> @@ -802,13 +805,13 @@ static struct uvc_entity
> *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
>         /* Per UVC 1.1+ spec 3.7.2, the ID should be non-zero. */
>         if (id == 0) {
>                 dev_err(&dev->udev->dev, "Found Unit with invalid ID 0.\n");
> -               return ERR_PTR(-EINVAL);
> +               id = UVC_INVALID_ENTITY_ID;
>         }
> 
>         /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
>         if (uvc_entity_by_id(dev, id)) {
>                 dev_err(&dev->udev->dev, "Found multiple Units with ID
> %u\n", id);
> -               return ERR_PTR(-EINVAL);
> +               id = UVC_INVALID_ENTITY_ID;
>         }
> 
>         extra_size = roundup(extra_size, sizeof(*entity->pads));
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5e388f05f3fc..2ba8e32260ca 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -41,6 +41,8 @@
>  #define UVC_EXT_GPIO_UNIT              0x7ffe
>  #define UVC_EXT_GPIO_UNIT_ID           0x100
> 
> +#define UVC_INVALID_ENTITY_ID          0xffff
> +
>  /* ------------------------------------------------------------------------
>   * Driver specific constants.
>   */
> 

At first, this looks fine, but the it would still allow for multiple units
on the list with the Invalid ID. We could reserve some range and allocate
from it instead.

For the case in hand, it may just work because there is only one entity
with the duplicate ID, so we only need to allocate one new ID.

Regards.
Cascardo.

> 
> 
> 
> 
> >
> > >               if (remote == NULL || remote->num_pads == 0)
> > >                       return -EINVAL;
> > >
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 07f9921d83f2..a4ee79e4e85b 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -239,6 +239,7 @@ struct uvc_entity {
> > >
> > >       u8 bNrInPins;
> > >       u8 *baSourceID;
> > > +     struct uvc_entity **source_entities;
> > >
> > >       int (*get_info)(struct uvc_device *dev, struct uvc_entity *entity,
> > >                       u8 cs, u8 *caps);
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> 
> 
> 
> --
> Ricardo Ribalda

