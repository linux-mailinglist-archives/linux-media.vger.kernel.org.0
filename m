Return-Path: <linux-media+bounces-24710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AE2A0FEFE
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 04:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2195618879E6
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 03:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C32E22FE17;
	Tue, 14 Jan 2025 03:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j4i+uAxs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C62A230251
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 03:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736823712; cv=none; b=Vs3Xcw4VydhS/SEzS0qDcBWaMKCH2QpBnzeaGGQqNimm9s7ZMrpBfvSGuGRMs20VOqhnkHovPCd3FKl3xpxSWaqAywOt1WwZGIX6ANA1ydwrjsQPdK5a5ztX8I70Is93/qjVB2NqXbNTLqwtV4b0hDhxMIvPxhy1uyiDd3iHcw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736823712; c=relaxed/simple;
	bh=ysrnKdds9YbmB8NRqS9a98Jd8gd/nSIbLyTSR5FrNVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcBMalX6SjDMtXC+UEHp6PBAAe+KT77kzbo3C2yuzXjVBGRQOOfTnO1QseCAimSU8nwwafK7l+jLn5NtLAndAQkAWKzJtLOj9QhyNn8BG/k4eJ9G9F1TIGN6SkVdTcZIP+YTnNYPOWLbkUHWhKsxhEjBMfI2qs5At6ygjeAkOQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j4i+uAxs; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3061513d3a6so21212561fa.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 19:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736823708; x=1737428508; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jTiyXBpatT0pAbEf3d+Bq2sUU4k5ymfaOohxUeFGdQQ=;
        b=j4i+uAxs2jNwjPbEzHdwGZTbojCCQkiYRVZ5SeDHtPQGkgntx15INc3Q7c/q7hl6wX
         2oN+GVUqJfs0iMqVEkvqaNMEeIETGFzjBltf7eGc9finBn6PgZBZ5KA7q8WivdVTl0AR
         KwRO4P6HyvWG7bqrQ/6oH+8C9roS4aE7u3HfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736823708; x=1737428508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTiyXBpatT0pAbEf3d+Bq2sUU4k5ymfaOohxUeFGdQQ=;
        b=kNftLpBdXdxpBVU/n7yFjvWwS7YbRJU7S2PsQ9eg6on8ycorPMZ1sAU2R+lQ3XGeTQ
         y+4gopuQdRDfS1K3Z/Cd4LR/TufSjbd1JMJYxaDcCYNfajVZB0vNmDhtzqWQGR54XnV+
         r2YQkGzUsxlJUej53tATjFo+5M0472COv86D4591IdT/jKPfwx8nH4Kf0SsLqX0QbYKG
         deePa4+xDtJqIdAqjKcIajZ0hhpDB6ImAvdAEjzO+ra10xCUiRovmwStUItQeNFFWDyw
         yrpP4no63REfzdbaUjxVAfSx4iCsN55wIGr6hOjMxK7GwzEi28h4D4FOJPTogWVPnxJX
         9JtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfyOMzIGhfXJrTmvxHdduBtq3p17VqzgNZadwdnE1kfLh9ZeA29+TVL/O28oCXBY/pO8faN64uK32Lrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx/EFk2B+QhjPMM9SOCUbhjSwQBWaa+HlnI2BxplHdUWZ4fNGE
	exs7rAlpLKJ0Kg9JBBGv1c3978pKolkSKx4BLPSpyYQ85PevC8M1frvF8j2trktsK5gDNFyE59A
	=
X-Gm-Gg: ASbGncvcqfDGF0T47tpWsq8vYfCUocGpVKktbBLlYlevyU2Qf8KwvTRAPa0i0v9vPk5
	317eeDYEbIqfSwfhDZtoHWQUnVguSzUIOZb4qtr4MWUCaxKA+Vp0FfMzFwQFLkVsViGUbw//Uhd
	WW5LKuVSHddJZLsNb1D9Y+KSWOfzhkg72Z9L+Ad/W0jja9LUml1V10d40nLjTXqsEzHkGZO9jCB
	a2W5TEIuwu5UWcfCRYLTNNR/RyzxAWgtd/gWVkovgWap5mAWXBwB1w3O5S/6AOEa8rPiJT716Ce
	eXdSKshPzYlWBAP7Vhk=
X-Google-Smtp-Source: AGHT+IGZP/UC/Z+hFuBOKHHFMfRqz+DC0c8/EfHP6MdXStSPFHBmHa4u3AfA8eUjXiiOlOJct3uEKg==
X-Received: by 2002:a2e:a691:0:b0:300:de99:fcd9 with SMTP id 38308e7fff4ca-305f45b9c27mr57183251fa.29.1736823708196;
        Mon, 13 Jan 2025 19:01:48 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec1a0sm16268211fa.105.2025.01.13.19.01.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 19:01:46 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54024aa9febso4325208e87.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 19:01:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUU9M+zzxMWsXQenDXbwuhZ1DS5reEyUVsGFdBU/BmdzB0FXXxD71jcBTxd7Mlf+K4f6FcUShZrqbry/A==@vger.kernel.org
X-Received: by 2002:a05:6512:3dac:b0:53e:368c:ac4f with SMTP id
 2adb3069b0e04-542845aed93mr5852369e87.9.1736823705756; Mon, 13 Jan 2025
 19:01:45 -0800 (PST)
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
In-Reply-To: <20250113185059.GA30724@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 14 Jan 2025 11:01:32 +0800
X-Gmail-Original-Message-ID: <CANiDSCtvwUEP+66NiXQRNjxpVyh_XCztJRYwdQQMKWx9p_SOcA@mail.gmail.com>
X-Gm-Features: AbW1kvZop3UIZFdtWTTLPa2nG0cSxhY2uTmVh7FFu3QceavHZ1HmfY1G7k5d7yY
Message-ID: <CANiDSCtvwUEP+66NiXQRNjxpVyh_XCztJRYwdQQMKWx9p_SOcA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, Tomasz Sikora <sikora.tomus@gmail.com>, 
	hverkuil-cisco@xs4all.nl, kernel-dev@igalia.com, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com, 
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, 14 Jan 2025 at 02:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jan 09, 2025 at 07:47:31AM -0300, Thadeu Lima de Souza Cascardo wrote:
> > On Wed, Jan 08, 2025 at 11:14:28PM +0100, Tomasz Sikora wrote:
> > > Hello,
> > > you right
> > > I have in dmsg (line 1228):
> > > [   12.981124] usb 3-2: Failed to create links for entity 5
> > > [   12.981126] usb 3-2: Failed to register entities (-22).
> > >
> > > full output in my log.
> >
> > Thanks, Tomasz.
> >
> > Can you test the attached fix? It should still keep the warning about the
> > multiple units with the same ID, but now it would not return an error nor
> > warn when registering the entities.
> >
> > Cascardo.
>
> > From f771f5c4657ed25ae36784bf13992ddbee3161e6 Mon Sep 17 00:00:00 2001
> > From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > Date: Thu, 9 Jan 2025 07:37:41 -0300
> > Subject: [PATCH RFC] media: uvcvideo: restore support for non-compliant devices
> >
> > Some real-world devices have multiple units with the same ID. When creating
> > their media entities, it would lead to warnings and failure to create such
> > entities. However, the V4L2 devices would still be created and work.
> >
> > Restore their support, but still warn about the multiple units with the
> > same ID. Avoid the failure in navigating through the chain by storing
>
> What's "the failure" here ?
>
> > pointers to the entities instead of only their IDs.
>
> Missing SoB and Fixes tags.
>
> The commit message should explain why this is better than reverting
> 3dd075fe8ebb ("media: uvcvideo: Require entities to have a non-zero
> unique ID"). I'm wondering if a revert with a clean fix on top may not
> be easier to review.
>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 16 +++++++++++-----
> >  drivers/media/usb/uvc/uvc_entity.c |  4 +++-
> >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> >  3 files changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 1a22364f7da9..dd81067f8d30 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -791,10 +791,8 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> >       }
> >
> >       /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> > -     if (uvc_entity_by_id(dev, id)) {
> > -             dev_err(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
> > -             return ERR_PTR(-EINVAL);
> > -     }
> > +     if (uvc_entity_by_id(dev, id))
> > +             dev_warn(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
> >
> >       extra_size = roundup(extra_size, sizeof(*entity->pads));
> >       if (num_pads)
> > @@ -802,7 +800,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> >       else
> >               num_inputs = 0;
> >       size = sizeof(*entity) + extra_size + sizeof(*entity->pads) * num_pads
> > -          + num_inputs;
> > +          + num_inputs + sizeof(struct uvc_entity *) * num_inputs;
> >       entity = kzalloc(size, GFP_KERNEL);
> >       if (entity == NULL)
> >               return ERR_PTR(-ENOMEM);
> > @@ -840,6 +838,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> >
> >       entity->bNrInPins = num_inputs;
> >       entity->baSourceID = (u8 *)(&entity->pads[num_pads]);
> > +     entity->source_entities = (struct uvc_entity **)(&entity->baSourceID[num_inputs]);
> >
> >       return entity;
> >  }
> > @@ -1503,6 +1502,7 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
> >                               }
> >
> >                               forward->baSourceID[0] = source->id;
> > +                             forward->source_entities[0] = source;
> >                       }
> >
> >                       list_add_tail(&forward->chain, &chain->entities);
> > @@ -1586,6 +1586,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
> >                               return -EINVAL;
> >                       }
> >
> > +                     entity->source_entities[i] = term;
> > +
> >                       uvc_dbg_cont(PROBE, " %d", term->id);
> >
> >                       list_add_tail(&term->chain, &chain->entities);
> > @@ -1620,6 +1622,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
> >               return -EINVAL;
> >       }
> >
> > +     (*_entity)->source_entities[0] = entity;
> > +
> >       *_entity = entity;
> >       return 0;
> >  }
> > @@ -1783,6 +1787,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
> >                       goto error;
> >
> >               prev->baSourceID[0] = entity->id;
> > +             prev->source_entities[0] = entity;
> >               prev = entity;
> >       }
> >
> > @@ -1790,6 +1795,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
> >               goto error;
> >
> >       prev->baSourceID[0] = iterm->id;
> > +     prev->source_entities[0] = iterm;
> >
> >       list_add_tail(&chain->list, &dev->chains);
> >
> > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > index cc68dd24eb42..7f42292b7fde 100644
> > --- a/drivers/media/usb/uvc/uvc_entity.c
> > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > @@ -36,7 +36,9 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
> >               if (!(entity->pads[i].flags & MEDIA_PAD_FL_SINK))
> >                       continue;
> >
> > -             remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
> > +             remote = entity->source_entities[i];
> > +             if (remote == NULL)
> > +                     remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
>
> That looks worrying. Why would source_entities[i] be NULL ?
>
> Devices with bad descriptors can lead to crashes, and it's important to
> harden the code. Just warning about duplicate ideas and adding a
> source_entities array that may or may not point to the right source (and
> could point to NULL) doesn't seem to go in the right direction.
>
> Other options include adding a device-specific quirk that overrides the
> incorrect entity IDs, or, possibly better, implementing a heuristic to
> fix those automatically.


Can't we simply do something like this:

diff --git a/drivers/media/usb/uvc/uvc_driver.c
b/drivers/media/usb/uvc/uvc_driver.c
index a10d4f4d9f95..b55dc440db26 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -135,6 +135,9 @@ struct uvc_entity *uvc_entity_by_id(struct
uvc_device *dev, int id)
 {
        struct uvc_entity *entity;

+       if (id == UVC_INVALID_ENTITY_ID)
+               return NULL;
+
        list_for_each_entry(entity, &dev->entities, list) {
                if (entity->id == id)
                        return entity;
@@ -802,13 +805,13 @@ static struct uvc_entity
*uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
        /* Per UVC 1.1+ spec 3.7.2, the ID should be non-zero. */
        if (id == 0) {
                dev_err(&dev->udev->dev, "Found Unit with invalid ID 0.\n");
-               return ERR_PTR(-EINVAL);
+               id = UVC_INVALID_ENTITY_ID;
        }

        /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
        if (uvc_entity_by_id(dev, id)) {
                dev_err(&dev->udev->dev, "Found multiple Units with ID
%u\n", id);
-               return ERR_PTR(-EINVAL);
+               id = UVC_INVALID_ENTITY_ID;
        }

        extra_size = roundup(extra_size, sizeof(*entity->pads));
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5e388f05f3fc..2ba8e32260ca 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -41,6 +41,8 @@
 #define UVC_EXT_GPIO_UNIT              0x7ffe
 #define UVC_EXT_GPIO_UNIT_ID           0x100

+#define UVC_INVALID_ENTITY_ID          0xffff
+
 /* ------------------------------------------------------------------------
  * Driver specific constants.
  */





>
> >               if (remote == NULL || remote->num_pads == 0)
> >                       return -EINVAL;
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 07f9921d83f2..a4ee79e4e85b 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -239,6 +239,7 @@ struct uvc_entity {
> >
> >       u8 bNrInPins;
> >       u8 *baSourceID;
> > +     struct uvc_entity **source_entities;
> >
> >       int (*get_info)(struct uvc_device *dev, struct uvc_entity *entity,
> >                       u8 cs, u8 *caps);
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

