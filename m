Return-Path: <linux-media+bounces-24722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25157A10A90
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 16:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD6C73A7FF3
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 15:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99861156887;
	Tue, 14 Jan 2025 15:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mzSjI2zJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879B814A4C1
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 15:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736868050; cv=none; b=qbLMLOL83XujoLIftlgCK4VcGEa9DzevMno3FAuZlce3VgrJ5HJwZPvJIdMDzB5SVHMeZrsTVU94Sk8xUYYtl5AWI8Rk3+uVadz6IIVqoARucYNPOUd+LETElT0eTlRGdEUA3Y1s5FTsgF+edWnVxbvy+dyrRxE/CCkgukay52Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736868050; c=relaxed/simple;
	bh=hleinIF5zOvEG927eJdNqKNeAnpkYjnCTVZeu2Uj0UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3b0cVXNKOlNKpJPIljs2ndxQNqTI4GvxpgQZ4kkyieuMdf323XvHKApAiYYWPsNglGJ76iEKs7DFhjKfgBKzIbsWxqfNhDG4LjcCOPBJm+/2NgVQ8hO7C+IMeojHnfT1ueL3/8a1kCQVdZYCocfGFxkaj0SY2Mw15gwPo7y3R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mzSjI2zJ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so49087161fa.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 07:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736868045; x=1737472845; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IKDHRDfA5qhpTV4mOcPcg9mZZFl3NHkbGM8BFwsHo+E=;
        b=mzSjI2zJ8g4f9FGezfnTjGjGkPQ9mQV5xFTJzzW1L/q/3W7nIO4lYy/KWOBKG/s5cw
         HsXX3KrjDBwjFuWfJnlcnVF0D9FhRSqs4RfvCySFQ2ckYAlgpgUyTMs3hNmJ9hxZOUwR
         msdsTy1k30jmb+bfBlZSjhdeB2/KqKQKspn64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736868045; x=1737472845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKDHRDfA5qhpTV4mOcPcg9mZZFl3NHkbGM8BFwsHo+E=;
        b=qypkL/8jV/REzEkxc0O+7OnX1KILHkrzJOQEffHRTd0EumKD4l5vzi040P0oGNkznO
         nGWc7TD9bmiodrV/lpjT5ndh7I5lBHlRLlp8eMC5IB94yeqtNxncW61wL6tHfRuHRTJP
         eyIsbX01AVbatgBpoDHo5VftsnHgyyxs0Sav9qFN2qxWvglFzJl7aYiaYxldwXRqykZp
         S3VVucp6tKQ8GhIN+LgQ8or3JzMtmYrTqS78WAKyC/rieSi5xWJ75YM/ss6NU/S9a9cI
         sqPmw4rjOqR+TzZ2UNSiLeccs8Gqbrhk9A/hvPreJScWz/QWL59pEozt96ePl2VIbjRL
         BizA==
X-Forwarded-Encrypted: i=1; AJvYcCXh7I5BHjnqILinW8W2qPR+lV2SDg0OUXlwGAuOY69UkDK86Dd8QQt5dHB7Br/k8hlPug8v56Yj0VNCUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrR3UDy0fjNIRZ/XF2CnD8rmfdLcRgQOOfE6O1YF3YH64KHAux
	nviinPOoC1Wq3V5IgdNXZHLVdiKjLe1pMhK/0jyVWjKN6P1UthWIxgKAcMqqcgHQR8Ix52ZhJGs
	=
X-Gm-Gg: ASbGncuMygJkR7hvf9TrHRJoRIBmrftvTbBP66tHoJAfkuXrj9aCSRN1OcWf4FktXa1
	afxy7hm76ilWK4RvIvJ0S38lIqTZ3Q0nKSA3ijUdwmkTADxC2/jWGwpjShJXcm/Lytjh8SscLsJ
	cVGxoYVgep5VeeOZWX4Ehmm2cPzZ7nEw6u0gMzf6D2WOotoDhyQL1bXh8okiTOD8xNZv0B5fTp2
	XvHwvYEcJAuvVHk4hkyGauXbmfVbrCRrxs6zCgVYgwYFCgeamTKiosJbKQvw3qFdH75vs2U06LQ
	5RVXaSSsh7m6zYMYVHttvUE=
X-Google-Smtp-Source: AGHT+IG4KG5VOf3jf9IHsd2NBLY1Z/O0+K5u7I8y+KUdWDFRwUzkp00U478jAEebmUiIT3evMNpKmw==
X-Received: by 2002:a2e:a781:0:b0:302:1aed:f62a with SMTP id 38308e7fff4ca-305f45a0a1emr82099601fa.21.1736868045485;
        Tue, 14 Jan 2025 07:20:45 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0ad0dcsm18488151fa.3.2025.01.14.07.20.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 07:20:43 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30229d5b21cso45137781fa.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 07:20:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZtIDDwqamUJFwRhQIfrvLCXuHN+WJqoiIloTS8iiDdKJsA7pXnUDUJMUAZRS7L82kIbFYtLU9hmhzMA==@vger.kernel.org
X-Received: by 2002:a05:651c:1a0c:b0:2fc:9622:794b with SMTP id
 38308e7fff4ca-305f45a4294mr79783001fa.24.1736868043302; Tue, 14 Jan 2025
 07:20:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADBf=5nJVddk-yPVw3T5GH9JEPOxnO8McPJHaxtnPBvLCnp42Q@mail.gmail.com>
 <Z3u2vHFVPYTmCnwj@quatroqueijos.cascardo.eti.br> <CADBf=5nS8_cQvG3mRnXe_MGYmFMh=Myf_eptPqN9hgNMu73Wjg@mail.gmail.com>
 <Z36ad0OxZBnQ0Kxx@quatroqueijos.cascardo.eti.br> <20250108153637.GE32541@pendragon.ideasonboard.com>
 <Z36gMvN0XxfXwE82@quatroqueijos.cascardo.eti.br> <CADBf=5m0WVMJbVfDvpFdqoYdKj=nT+mOW=D-Q2MJJ=TCbsTMuQ@mail.gmail.com>
 <Z3+pQ/xVdpiE/1GN@quatroqueijos.cascardo.eti.br> <20250113185059.GA30724@pendragon.ideasonboard.com>
 <CANiDSCtvwUEP+66NiXQRNjxpVyh_XCztJRYwdQQMKWx9p_SOcA@mail.gmail.com> <Z4ZbYavHz1DpCCwK@quatroqueijos.cascardo.eti.br>
In-Reply-To: <Z4ZbYavHz1DpCCwK@quatroqueijos.cascardo.eti.br>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 14 Jan 2025 23:20:30 +0800
X-Gmail-Original-Message-ID: <CANiDSCvx4syyRhsX5v_kzFN4dR0JUoB8c0pY4Tf+JB318M=qYA@mail.gmail.com>
X-Gm-Features: AbW1kvZYOGH6_7kwojNEKBC7bNE_vVquN5dYF32qBZENCbXOvRL07EUSByenVmk
Message-ID: <CANiDSCvx4syyRhsX5v_kzFN4dR0JUoB8c0pY4Tf+JB318M=qYA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomasz Sikora <sikora.tomus@gmail.com>, hverkuil-cisco@xs4all.nl, kernel-dev@igalia.com, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com, 
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 20:41, Thadeu Lima de Souza Cascardo
<cascardo@igalia.com> wrote:
>
> On Tue, Jan 14, 2025 at 11:01:32AM +0800, Ricardo Ribalda wrote:
> > Hi
> >
> > On Tue, 14 Jan 2025 at 02:51, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Thu, Jan 09, 2025 at 07:47:31AM -0300, Thadeu Lima de Souza Cascardo wrote:
> > > > On Wed, Jan 08, 2025 at 11:14:28PM +0100, Tomasz Sikora wrote:
> > > > > Hello,
> > > > > you right
> > > > > I have in dmsg (line 1228):
> > > > > [   12.981124] usb 3-2: Failed to create links for entity 5
> > > > > [   12.981126] usb 3-2: Failed to register entities (-22).
> > > > >
> > > > > full output in my log.
> > > >
> > > > Thanks, Tomasz.
> > > >
> > > > Can you test the attached fix? It should still keep the warning about the
> > > > multiple units with the same ID, but now it would not return an error nor
> > > > warn when registering the entities.
> > > >
> > > > Cascardo.
> > >
> > > > From f771f5c4657ed25ae36784bf13992ddbee3161e6 Mon Sep 17 00:00:00 2001
> > > > From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > > > Date: Thu, 9 Jan 2025 07:37:41 -0300
> > > > Subject: [PATCH RFC] media: uvcvideo: restore support for non-compliant devices
> > > >
> > > > Some real-world devices have multiple units with the same ID. When creating
> > > > their media entities, it would lead to warnings and failure to create such
> > > > entities. However, the V4L2 devices would still be created and work.
> > > >
> > > > Restore their support, but still warn about the multiple units with the
> > > > same ID. Avoid the failure in navigating through the chain by storing
> > >
> > > What's "the failure" here ?
> > >
> > > > pointers to the entities instead of only their IDs.
> > >
> > > Missing SoB and Fixes tags.
> > >
> > > The commit message should explain why this is better than reverting
> > > 3dd075fe8ebb ("media: uvcvideo: Require entities to have a non-zero
> > > unique ID"). I'm wondering if a revert with a clean fix on top may not
> > > be easier to review.
> > >
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 16 +++++++++++-----
> > > >  drivers/media/usb/uvc/uvc_entity.c |  4 +++-
> > > >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> > > >  3 files changed, 15 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index 1a22364f7da9..dd81067f8d30 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -791,10 +791,8 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > > >       }
> > > >
> > > >       /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> > > > -     if (uvc_entity_by_id(dev, id)) {
> > > > -             dev_err(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
> > > > -             return ERR_PTR(-EINVAL);
> > > > -     }
> > > > +     if (uvc_entity_by_id(dev, id))
> > > > +             dev_warn(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
> > > >
> > > >       extra_size = roundup(extra_size, sizeof(*entity->pads));
> > > >       if (num_pads)
> > > > @@ -802,7 +800,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > > >       else
> > > >               num_inputs = 0;
> > > >       size = sizeof(*entity) + extra_size + sizeof(*entity->pads) * num_pads
> > > > -          + num_inputs;
> > > > +          + num_inputs + sizeof(struct uvc_entity *) * num_inputs;
> > > >       entity = kzalloc(size, GFP_KERNEL);
> > > >       if (entity == NULL)
> > > >               return ERR_PTR(-ENOMEM);
> > > > @@ -840,6 +838,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > > >
> > > >       entity->bNrInPins = num_inputs;
> > > >       entity->baSourceID = (u8 *)(&entity->pads[num_pads]);
> > > > +     entity->source_entities = (struct uvc_entity **)(&entity->baSourceID[num_inputs]);
> > > >
> > > >       return entity;
> > > >  }
> > > > @@ -1503,6 +1502,7 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
> > > >                               }
> > > >
> > > >                               forward->baSourceID[0] = source->id;
> > > > +                             forward->source_entities[0] = source;
> > > >                       }
> > > >
> > > >                       list_add_tail(&forward->chain, &chain->entities);
> > > > @@ -1586,6 +1586,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
> > > >                               return -EINVAL;
> > > >                       }
> > > >
> > > > +                     entity->source_entities[i] = term;
> > > > +
> > > >                       uvc_dbg_cont(PROBE, " %d", term->id);
> > > >
> > > >                       list_add_tail(&term->chain, &chain->entities);
> > > > @@ -1620,6 +1622,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
> > > >               return -EINVAL;
> > > >       }
> > > >
> > > > +     (*_entity)->source_entities[0] = entity;
> > > > +
> > > >       *_entity = entity;
> > > >       return 0;
> > > >  }
> > > > @@ -1783,6 +1787,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
> > > >                       goto error;
> > > >
> > > >               prev->baSourceID[0] = entity->id;
> > > > +             prev->source_entities[0] = entity;
> > > >               prev = entity;
> > > >       }
> > > >
> > > > @@ -1790,6 +1795,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
> > > >               goto error;
> > > >
> > > >       prev->baSourceID[0] = iterm->id;
> > > > +     prev->source_entities[0] = iterm;
> > > >
> > > >       list_add_tail(&chain->list, &dev->chains);
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > > > index cc68dd24eb42..7f42292b7fde 100644
> > > > --- a/drivers/media/usb/uvc/uvc_entity.c
> > > > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > > > @@ -36,7 +36,9 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
> > > >               if (!(entity->pads[i].flags & MEDIA_PAD_FL_SINK))
> > > >                       continue;
> > > >
> > > > -             remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
> > > > +             remote = entity->source_entities[i];
> > > > +             if (remote == NULL)
> > > > +                     remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
> > >
> > > That looks worrying. Why would source_entities[i] be NULL ?
> > >
> > > Devices with bad descriptors can lead to crashes, and it's important to
> > > harden the code. Just warning about duplicate ideas and adding a
> > > source_entities array that may or may not point to the right source (and
> > > could point to NULL) doesn't seem to go in the right direction.
> > >
> > > Other options include adding a device-specific quirk that overrides the
> > > incorrect entity IDs, or, possibly better, implementing a heuristic to
> > > fix those automatically.
> >
> >
> > Can't we simply do something like this:
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > b/drivers/media/usb/uvc/uvc_driver.c
> > index a10d4f4d9f95..b55dc440db26 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -135,6 +135,9 @@ struct uvc_entity *uvc_entity_by_id(struct
> > uvc_device *dev, int id)
> >  {
> >         struct uvc_entity *entity;
> >
> > +       if (id == UVC_INVALID_ENTITY_ID)
> > +               return NULL;
> > +
> >         list_for_each_entry(entity, &dev->entities, list) {
> >                 if (entity->id == id)
> >                         return entity;
> > @@ -802,13 +805,13 @@ static struct uvc_entity
> > *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> >         /* Per UVC 1.1+ spec 3.7.2, the ID should be non-zero. */
> >         if (id == 0) {
> >                 dev_err(&dev->udev->dev, "Found Unit with invalid ID 0.\n");
> > -               return ERR_PTR(-EINVAL);
> > +               id = UVC_INVALID_ENTITY_ID;
> >         }
> >
> >         /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> >         if (uvc_entity_by_id(dev, id)) {
> >                 dev_err(&dev->udev->dev, "Found multiple Units with ID
> > %u\n", id);
> > -               return ERR_PTR(-EINVAL);
> > +               id = UVC_INVALID_ENTITY_ID;
> >         }
> >
> >         extra_size = roundup(extra_size, sizeof(*entity->pads));
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 5e388f05f3fc..2ba8e32260ca 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -41,6 +41,8 @@
> >  #define UVC_EXT_GPIO_UNIT              0x7ffe
> >  #define UVC_EXT_GPIO_UNIT_ID           0x100
> >
> > +#define UVC_INVALID_ENTITY_ID          0xffff
> > +
> >  /* ------------------------------------------------------------------------
> >   * Driver specific constants.
> >   */
> >
>
> At first, this looks fine, but the it would still allow for multiple units
> on the list with the Invalid ID. We could reserve some range and allocate
> from it instead.

Please correct me if I am wrong, but the ID is only required to
configure the topology of the device. If multiple entities have the
same id then they cannot be part of the topology, because we will
never be sure about what entity is the correct one.

My proposal is to mark the duplicated as invalid so they cannot be
found with uvc_entity_by_id(), but they can still have controls.

I think it can work with multiple duplicated IDs. It is also pretty
clean and is not affected by the issue found by syszcaller.

In any case we probably want to act fast on this one. We had reports
from multiple parties.

Regards!

 >
> For the case in hand, it may just work because there is only one entity
> with the duplicate ID, so we only need to allocate one new ID.
>
> Regards.
> Cascardo.


>
> >
> >
> >
> >
> > >
> > > >               if (remote == NULL || remote->num_pads == 0)
> > > >                       return -EINVAL;
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index 07f9921d83f2..a4ee79e4e85b 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -239,6 +239,7 @@ struct uvc_entity {
> > > >
> > > >       u8 bNrInPins;
> > > >       u8 *baSourceID;
> > > > +     struct uvc_entity **source_entities;
> > > >
> > > >       int (*get_info)(struct uvc_device *dev, struct uvc_entity *entity,
> > > >                       u8 cs, u8 *caps);
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda

