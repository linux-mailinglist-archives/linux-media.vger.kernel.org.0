Return-Path: <linux-media+bounces-45238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC37BFC18F
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 15:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EEFBC5036E3
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 13:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D606343D87;
	Wed, 22 Oct 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l2VdhjZ+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04D226ED36
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138556; cv=none; b=d10ZX8cgc7Bl5Q1afoJQ9CmCHsy2pu7yAwQHZeo/FwBDb4cAenJJfuJSPc9teV4tRYNk4S3cGzTlW8cI7BHU3QJqiVTnQ9yMCUKrvTFcVYiHQ+RjgrAuD90v4OLLx+rfI3nXCFQIlwthLH8obp9MWJ71eGTmTh3RJLXjrb1qeso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138556; c=relaxed/simple;
	bh=RBXxDCERFUy+wUBxB01HnpU+uq73YtGp47zZ13gfmvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9+NH8vXu+eNKKGCoKaBnSwJDYRlolpIhBe9A8Y8/lKEEPa36nJaXCsep6Lgh4jgyqUnaFuOor/B8adfo3AoyMyocOJHkBCnLL2DnJbvPf+6StyFg3fbNUM/3HVSdaGZ+UR+OpNaebJL57rHCqhXkg5YwkbchceGtBVo4KeQhPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l2VdhjZ+; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-378cfbf83f2so5334691fa.1
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 06:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761138552; x=1761743352; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AXGvv+Y1jV7JovByIaEcMd+FcuJA2nc0qLNBaH9UXNY=;
        b=l2VdhjZ+9aF7ts2n7myzpI7ftWK3y4ODSDQB/mubECW9sywzaroeCo1fcj2ZYhPgX1
         46ua0zvldT0aHm+/Mz6mw5+830qeAJmbCjjuWXEbsjv0r/HMLrEelxtfItfWbK/Ujw+A
         FeN19MQPOS92nP+nZSHwBpkHFSgLQWUUY0WEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138552; x=1761743352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXGvv+Y1jV7JovByIaEcMd+FcuJA2nc0qLNBaH9UXNY=;
        b=d4FWBUUnbZOICvHc5pgsTq1PNNAoV5zF0xWGiTMpTpkmnlAoGyGVkPthr7wZP8B6wP
         Y3zZKKtdLUnbZhMSWnp1eLGa+E98E7qO5juhwHx1OiMUxhm4sPJRpfjS/X+coffAPnn9
         Pe5BRWtWXqks72+OVYGW/n4O7ulReSx7e2WWPQa7MjX2OrmINC83r0Q8AxgMK4r+lIID
         05EApv/eObxMCepgHBG3ib+7LVINzFol+rWHJt8+lUJ0rZ/3RRkKKAsXKisE4rlPFtWv
         sBEF/9qxYl1S27c1wLmmwAbv0cw0Dvd6jEor70WyEVlQsrSy8U/BTRZZ5OqulgM3tnN0
         e7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOvoVIScpcglY5Bu7eSF6rFITNPpK2RdJk0hGY7iYmJBgC0YU9ELCmiCvogiqMOWCZeteBtBFKVyYJIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrkLK+//AHiUgHNrArkQJJD95Wbya74iAkHevQjjCCDo09LU+L
	ZPeOabqgelQyqWXXK3PzU4tgAN0LuFawtYq/lDw8818uvFVNsR04dUdUnQCPhvciI3uiOzjAvU7
	PFqpayQ==
X-Gm-Gg: ASbGnctsKimn8F+tik3z7SxhdZUfU8+d0O5aQAzCHQ7eTh3OU4rh4o7wdDDYJ1dnz22
	n5QahrbT5nL0cb3rLwsHMlZYtoFsTI35+q1xI2YRuLcSI+t5K32bTlW5uExqZ7myzLb0PYyei+d
	a+BxI5P9VdgvoLmGM/y4Uld+UBV2Hime0pjzCVc7ZT1z388i643EMhxLYnMEDB5COnPzlbYMCDP
	Bq1mFdmfW0u1SJnUVGCgPXTAO5SQZQ2hjYhBYCOofJlRefgdfPkNs08pPrrxuyqisMfuIebiPDe
	mFc+HMMp2C1Pl8YJ+1h5ZJ8kQIDRfF1u/OYVZZLc/V8ARBjDSfYaNCcPQMZlWTarkcDVf0sXkcX
	iCbSEE7YYEBc1XaPzRlDUjehkIPMN9qXtsqH1gFEixaS4H7YPgEo8XoqPUj10pWJmj4VHoeW843
	59RqNbXC7HaMUY/54rAxn2s4i6MQtVzTryJaAumSUNWFNsTMVB
X-Google-Smtp-Source: AGHT+IEAOUcnnp9bNh18TBABORfgAJsm0ObmpWJHmzRMe42D2rT7z01S5CvxVgetBpiOpGwEtmrCGw==
X-Received: by 2002:a05:651c:901:b0:36b:bfd3:13e3 with SMTP id 38308e7fff4ca-37797a08f5cmr56154661fa.29.1761138552404;
        Wed, 22 Oct 2025 06:09:12 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91b70fbsm38447751fa.10.2025.10.22.06.09.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 06:09:11 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-58b025fce96so5834919e87.1
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 06:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgSUdY+RnMKrgxq3jL3Q6YhcEKQLqyYPZPw8rFL7DajIhPTVJvvD3B0G1MjW+fl3ec0MqcJcZbpWD4mw==@vger.kernel.org
X-Received: by 2002:a05:6512:b11:b0:572:f47:d10e with SMTP id
 2adb3069b0e04-591d84eb2e6mr7236014e87.3.1761138551207; Wed, 22 Oct 2025
 06:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-uvc-grandstream-laurent-v1-1-0925738a3484@chromium.org>
 <20251022120849.GD727@pendragon.ideasonboard.com> <CANiDSCvtqe8MKpb=O-=Mv28dK+g=REi7kpdr-eyAD-mLLpzQJw@mail.gmail.com>
 <20251022124937.GE727@pendragon.ideasonboard.com>
In-Reply-To: <20251022124937.GE727@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Oct 2025 15:08:58 +0200
X-Gmail-Original-Message-ID: <CANiDSCscZgwUM0VCpdMvNKq0U2a6kOPbJmd4G8iY3EpsPQvZNw@mail.gmail.com>
X-Gm-Features: AS18NWClkgpLnT5WZ_y5AoAe9CpdDHLhPPjp8XnQAQ6S3MH9wfvYuNoNQIyQn6o
Message-ID: <CANiDSCscZgwUM0VCpdMvNKq0U2a6kOPbJmd4G8iY3EpsPQvZNw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Create a specific id namespace for
 output entities
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Wed, 22 Oct 2025 at 14:49, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Oct 22, 2025 at 02:29:15PM +0200, Ricardo Ribalda wrote:
> > On Wed, 22 Oct 2025 at 14:09, Laurent Pinchart wrote:
> > > On Wed, Oct 22, 2025 at 11:55:16AM +0000, Ricardo Ribalda wrote:
> > > > Nothing can be connected from an output entity. Which means that no
> > >
> > > s/output entity/output terminal. Same below.
> > >
> > > Did you mean s/from an/to an/ ?
> > >
> > > > other entity can reference an output entity as baSourceId.
> > > >
> > >
> > > Some output terminals have controls, so we need to preserve their ID.
> > > That's why my proposal only set the UVC_TERM_OUTPUT bit for the
> > > *streaming* output terminals, not for all output terminals.
> > >
> > > > Use this fact to move all the output entities to a different namespace
> > > > id.
> > > >
> > > > The output entities are usually named after the dev_name() of the usb
> > > > device, so there should not be any uAPI change from this change.
> > > >
> > > > Although with this change we can handle some id collisions
> > > > automagically, change the logic of uvc_alloc_new_entity() to keep
> > > > showing a warning when a camera has invalid descriptors. Hopefully this
> > > > message will help vendors fix their invalid descriptors.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > > Hi, this patch fixes support for some devices with invalid USB
> > > > descriptor.
> > > >
> > > > It is orthogonal to:
> > > > https://lore.kernel.org/linux-media/20251021184213.GC19043@pendragon.ideasonboard.com/T/#t
> > > >
> > > > Some devices will be fixed by the other patch, other devices will be
> > > > fixed by this. In my opinion is worth to land both patches.
> > > >
> > > > Tested with GRANDSTREAM GUV3100 in a 6.6 kernel.
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++----
> > > >  1 file changed, 19 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..40f8ae0df89e104992f5d55af3d3539dea3d146e 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -165,10 +165,14 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
> > > >       return NULL;
> > > >  }
> > > >
> > > > +#define ENTITY_HARDWARE_ID(id) ((id) & ~UVC_TERM_OUTPUT)
> > >
> > > This needs a UVC_ prefix, and should probably go to uvcvideo.h. You can
> > > also & 0xff, as the UVC descriptors store IDs in 8-bit fields.
> > >
> > > > +
> > > >  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
> > > >  {
> > > >       struct uvc_streaming *stream;
> > > >
> > > > +     id = ENTITY_HARDWARE_ID(id);
> > > > +
>
> Another comment, I would have done this in the (single) caller, to keep
> operating on real ids in this function. Or we could pass a struct
> uvc_entity instead of an int id and rename the function to
> uvc_stream_for_terminal(), which could better encapsulate the purpose.

Like the second option better.

>
> > > >       list_for_each_entry(stream, &dev->streams, list) {
> > > >               if (stream->header.bTerminalLink == id)
> > > >                       return stream;
> > > > @@ -810,10 +814,12 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > > >       }
> > > >
> > > >       /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> > > > -     if (uvc_entity_by_id(dev, id)) {
> > > > -             dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
> > > > +     if (uvc_entity_by_id(dev, ENTITY_HARDWARE_ID(id)))
> > > > +             dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n",
> > > > +                     ENTITY_HARDWARE_ID(id));
> > >
> > > It's not an error anymore if there's no collision of the full 16-bit ID,
> > > right ? Should it be demoted to a dev_warn() ?
> >
> > if it is OK with you I'd rather keep the dev_err(). If an ISP
> > manufacturer tests their camera in Linux I want them to really notice
> > that there is an error.
>
> Yes I'm OK with that. It shouldn't happen. We want a dev_err_and_blame()
> that prints a message to the kernel log and posts messages on social
> networks to blame the hardware manufacturer.
>
> > Besides that, I have implemented all your proposed changes.
> >
> > I cannot test it until tomorrow in real hardware. But the changes are
> > trivial, let me know if I shall send the v2 right now or wait til it
> > is tested.
>
> Up to you, I don't mind either way.
>
> If we merge "[PATCH v2] media: uvcvideo: Use heuristic to find stream
> entity" first, do you plan to revert it to get this patch merged ?

I think they solve two different issues:

- Output terminal id collides with another entity id.
- Incorrect bTerminalLink


 We can have the two patches in.  If there is any conflict because we
land one and then the other I can send a v3 fixing the conflict. Or a
maintainer can do that, they should be trivial conflicts.

Regards



>
> > > > +
> > > > +     if (uvc_entity_by_id(dev, id))
> > > >               id = UVC_INVALID_ENTITY_ID;
> > > > -     }
> > > >
> > > >       extra_size = roundup(extra_size, sizeof(*entity->pads));
> > > >       if (num_pads)
> > > > @@ -969,6 +975,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > > >       struct usb_host_interface *alts = dev->intf->cur_altsetting;
> > > >       unsigned int i, n, p, len;
> > > >       const char *type_name;
> > > > +     unsigned int id;
> > > >       u16 type;
> > > >
> > > >       switch (buffer[2]) {
> > > > @@ -1107,8 +1114,16 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > > >                       return 0;
> > > >               }
> > > >
> > > > +             /*
> > > > +              * Nothing can be connected from an output terminal. To avoid
> > > > +              * entity-id's collisions in devices with invalid USB
> > > > +              * descriptors, move the output terminal id to its own
> > > > +              * namespace.
> > > > +              */
> > > > +             id = buffer[3] | UVC_TERM_OUTPUT;
> > > > +
> > > >               term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> > > > -                                         buffer[3], 1, 0);
> > > > +                                         id, 1, 0);
> > > >               if (IS_ERR(term))
> > > >                       return PTR_ERR(term);
> > > >
> > > >
> > > > ---
> > > > base-commit: ea299a2164262ff787c9d33f46049acccd120672
> > > > change-id: 20251022-uvc-grandstream-laurent-3f9abb8a0d5b
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

