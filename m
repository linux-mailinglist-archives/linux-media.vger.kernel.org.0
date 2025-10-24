Return-Path: <linux-media+bounces-45487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A232C05FBC
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 603D019A22E4
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4211531354B;
	Fri, 24 Oct 2025 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m/mileyD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D5E275864
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761303863; cv=none; b=ob/n4k7/0lkwWP1IzdOR6lxCNMhoA6LjtwfeQTKbnENMSSnMRTtTxrrfvmZ7c5kJcOMG2Q4H7y36M9+FJx52XLvEgusI0PUl+8VfHvH4Hzb93fazaDfKGsXzpJ8RtzLNkhb85wGF6dGtfZLUmMf8xzt37PZW7w2QguI3fpkoN5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761303863; c=relaxed/simple;
	bh=N/LkMxqWZfGFt+lUavSzVXDPUUptuIBdJnMWyN6jpFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V38bua5lQrI0l+cv+ARpvKf9W8SdhPTWMhE5C4Gnx9inmlvQ6JRrTuIFggNMAokz1zvjwIezkuxyHDlqY2gv8rCyKSNmfVO2PMSKDmgo4gPk3KxqyNoSofUTlQ+DztdFCawe9M417HQXDu5G4GWgkCLmA9GvreroWSTauQWBewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m/mileyD; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-592f7733dd6so2072022e87.3
        for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 04:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761303859; x=1761908659; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OixUxqKkm/aXWEHIX9oHHPbNt7HSU7JRNNBfqWDsTp0=;
        b=m/mileyDvYn0zs+PxfZy8a20U6lspLUtRGq7uVoxcYhjz7U3D3LfIbEaCjBvkl9CUW
         rrvcQSGuWljgxsxT/TsjMrtNsN2M3pcXph5+ZKGLd72ZTiuJIZWuj8RXPZzE7YMU7wx6
         7YMOZyWOH65CEuzFgXBRaY4W+k9JRhIi4gMAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761303859; x=1761908659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OixUxqKkm/aXWEHIX9oHHPbNt7HSU7JRNNBfqWDsTp0=;
        b=iatfiKd6vXEWtwbdolH/sHyrKoWKUPg93+LByvQstXYmRgwBPwNHCOm+ckUXW9mCHQ
         OwyIhB1KkkxJJextNsJcwCy1vBFN7vepXOJRooduHOmE9FTBvidECLUHjHtIElGCLhXP
         xZd2vOyuC4P6v0dbxiAOoZH87Eq8KVqn09eBwLthG6oGhw8hZrX7pZR4781sZU5+n9Jg
         oNzb78csr1e/J8CvnAOBhdKdiWA65mr968ep7eZAvI4v109xi4UEzQJlRrkBGcYGVn7r
         +UxDbPNM6rmZFCwxhB0uGIGJt7H5IeInJypvX4GhoIhKf/Q5UBWT3bGHCnQeyDhtPBrW
         OVsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrjO3FSBBphMu3NkrRslNjIxzF4Byterf8Wg3Dtzr8jlD2oOYHZasLgc8Q7iUzN4sYyKRTdm5g8ooanA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN6Db/cVAZlYItBNOu+2tAyjASKPQ49JYcIHTyQS/8uh7tvZ+9
	7L9wzsawpfCf/pO9duYmTFCz1L+byyJc3E4Cvv5XzkpGxMqHwahhr00TZfpg1G9KnGvbqx9EuIB
	k8So=
X-Gm-Gg: ASbGnct3kAtvB5H6EjbOS0F94CyL0rl9iRdfO+Dr9DNfD+07uLkHbSp472KrfzDKiuB
	TuLKPFejizE5JIp6vkKSctpns504aK7FTsNkZxDn1M0zheOG/0Emo1znXaoBCLXKUW8w0kjYPYk
	eOcLZ6lD8FDo/7rvzsaRoWc9osIfW98SB2Ut/nOpaPuuxedkZRzSOguU5eGDT4DTAKRf2B4PgsO
	LcwKMi4DExL196ceVZZLxOkkTnShzEoe+hWcQyEEImpGRKGqdEPz8NaPOquFcnGSlLIzbEvVQOg
	z4plRcUTYY3d5cnoJLAk95LGwz5zbuRr5aViLcHdhRyodksXlcDtEclRCpJBm5/MsihOX/UH0yM
	4xRD4pnRWrL0qHGWY4YQuCZEKIhJhF/+qNu+dZ69f5wImCMQaoREn6YkDHuKfaQj9KnoKJcfg7e
	pYn6Q865fS0nVTHykGDOMaqm4YQ9xpe4FkyUAGLtQmJAXMtpjV
X-Google-Smtp-Source: AGHT+IH0LnaumjYbk7TYtjNKtNCvX+SXuyQ03o3tiqLbu8O/uB8dvpJ1ybB+op1UEmLpAdOaQxgvFQ==
X-Received: by 2002:a05:6512:e89:b0:57b:7c74:67e6 with SMTP id 2adb3069b0e04-591d84cfda4mr9466641e87.2.1761303859306;
        Fri, 24 Oct 2025 04:04:19 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4aded89sm1542271e87.13.2025.10.24.04.04.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 04:04:19 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-592fb5d644bso943016e87.1
        for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 04:04:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXNnuzRTklS92sV5K9Cd27LXGwitP35Rr4i6Fe1cTDbUisSDsrCmX7GoPHZ55MQ4Wt/CkFd2fWt2boVQ==@vger.kernel.org
X-Received: by 2002:a05:6512:110b:b0:592:f9ca:feef with SMTP id
 2adb3069b0e04-592f9cb0158mr1487100e87.46.1761303858039; Fri, 24 Oct 2025
 04:04:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-uvc-grandstream-laurent-v2-1-8c5c20d6c571@chromium.org> <20251024105023.GA13023@pendragon.ideasonboard.com>
In-Reply-To: <20251024105023.GA13023@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 24 Oct 2025 13:04:05 +0200
X-Gmail-Original-Message-ID: <CANiDSCsB2mEf2JGUTNgkrgYo8LYgSNyD126-Hq_Ek__O3KtxTQ@mail.gmail.com>
X-Gm-Features: AS18NWBZsk5ZdDyQRJov65alLMEf__U466EPG4MMa-dtknKLy7ex5GjHrVI4AjI
Message-ID: <CANiDSCsB2mEf2JGUTNgkrgYo8LYgSNyD126-Hq_Ek__O3KtxTQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Create a specific id namespace for
 output entities
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 24 Oct 2025 at 12:50, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Oct 22, 2025 at 01:12:09PM +0000, Ricardo Ribalda wrote:
> > Nothing can be connected to an output terminal. Which means that no
> > other entity can reference an output terminal as baSourceId.
> >
> > Use this fact to move all the output streaming entities, which have no
> > controls, to a different namespace.
> >
> > The output entities are usually named after the dev_name() of the usb
> > device, so there should not be any uAPI change from this change.
> >
> > Although with this change we can handle some id collisions
> > automagically, change the logic of uvc_alloc_new_entity() to keep
> > showing a warning when a camera has invalid descriptors. Hopefully this
> > message will help vendors fix their invalid descriptors.
>
> This is one of the commits that I expect we'll go back to in the future
> when trying to remember why we namespace the streeaming terminal IDs.
> Let's make the rationale very clear, and also mention the name of the
> devices we know to be affected.
>
> ----
> Some devices, such as the Grandstream GUV3100 and the LSK Meeting Eye
> for Business & Home, exhibit entity ID collisions between units and
> streaming output terminals.
>
> The UVC specification requires unit and terminal IDs to be unique, and
> uses the ID to reference entities:
>
> - In control requests, to identify the target entity
> - In the UVC units and terminals descriptors' bSourceID field, to
>   identify source entities
> - In the UVC input header descriptor's bTerminalLink, to identify the
>   terminal associated with a streaming interface
>
> Entity ID collisions break accessing controls and make the graph
> description in the UVC descriptors ambiguous. However, collisions where
> one of the entities is a streaming output terminal and the other entity
> is not a streaming terminal are less severe. Streaming output terminals
> have no controls, and, as they are the final entity in pipelines, they
> are never referenced in descriptors as source entities. They are
> referenced by ID only from innput header descriptors, which by
> definition only reference streaming terminals.
>
> For these reasons, we can work around the collision by giving streaming
> output terminals their own ID namespace. Do so by setting bit
> UVC_TERM_OUTPUT (15) in the uvc_entity.id field, which is normally never
> set as the ID is a 8-bit value.
>
> This ID change doesn't affect the entity name in the media controller
> graph as the name isn't constructed from the ID, so there should not be
> any impact on the uAPI.
>
> Although this change handles some ID collisions automagically, keep
> printing an error in uvc_alloc_new_entity() when a camera has invalid
> descriptors. Hopefully this message will help vendors fix their invalid
> descriptors.
> ----
>
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Hi, this patch fixes support for some devices with invalid USB
> > descriptor.
> >
> > It is orthogonal to:
> > https://lore.kernel.org/linux-media/20251021184213.GC19043@pendragon.ideasonboard.com/T/#t
> >
> > Some devices will be fixed by the other patch, other devices will be
> > fixed by this. In my opinion is worth to land both patches.
>
> I would prefer merging this fix only (or rather, if we merge the other
> one as a quick fix, reverting it once we merge this one). The rationale
> is that enabling non-compliant behaviour should be limited to issues we
> know about, otherwise it could encourage making more non-compliant
> devices.
>
> The UVC specification states
>
>   Each Unit and Terminal within the video function is assigned a unique
>   identification number, the Unit ID (UID) or Terminal ID (TID),
>   contained in the bUnitID or bTerminalID field of the descriptor. The
>   value 0x00 is reserved for undefined ID, effectively restricting the
>   total number of addressable entities in the video function (both Units
>   and Terminals) to 255.
>
> To me it's clear that the unit and terminal IDs share the same
> namespace, but I suppose some vendors can overlook that. When combined
> with the fact that the streaming output terminals do not have controls,
> and therefore do not need to be addressable and lookup up by ID for
> anything else than matching with a streaming interface, this makes me
> think that ID collision between a streaming output terminal and another
> unit will likely be the most common case.
>
> > Tested with GRANDSTREAM GUV3100 in a 6.6 kernel.
> > ---
> > Changes in v2:
> > - Change Macro name
> > - Apply quirk only to TT_STEAMING
> > - Add missing suggested by
> > - uvc_stream_for_terminal
> > - Note, v2 has not been tested yet in real hardware, only v1.
> > - Link to v1: https://lore.kernel.org/r/20251022-uvc-grandstream-laurent-v1-1-0925738a3484@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 31 ++++++++++++++++++++++++-------
> >  drivers/media/usb/uvc/uvcvideo.h   |  3 ++-
> >  2 files changed, 26 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..c0a2c05b0f13a8c3b14018c47dfb0be2614340ce 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -165,8 +165,10 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
> >       return NULL;
> >  }
> >
> > -static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
> > +static struct uvc_streaming *uvc_stream_for_terminal(struct uvc_device *dev,
> > +                                                  struct uvc_entity *term)
> >  {
> > +     u16 id = UVC_HARDWARE_ENTITY_ID(term->id);
> >       struct uvc_streaming *stream;
> >
> >       list_for_each_entry(stream, &dev->streams, list) {
> > @@ -810,10 +812,12 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> >       }
> >
> >       /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> > -     if (uvc_entity_by_id(dev, id)) {
> > -             dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
> > +     if (uvc_entity_by_id(dev, UVC_HARDWARE_ENTITY_ID(id)))
> > +             dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n",
> > +                     UVC_HARDWARE_ENTITY_ID(id));
> > +
> > +     if (uvc_entity_by_id(dev, id))
> >               id = UVC_INVALID_ENTITY_ID;
> > -     }
> >
> >       extra_size = roundup(extra_size, sizeof(*entity->pads));
> >       if (num_pads)
> > @@ -969,6 +973,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >       struct usb_host_interface *alts = dev->intf->cur_altsetting;
> >       unsigned int i, n, p, len;
> >       const char *type_name;
> > +     unsigned int id;
> >       u16 type;
> >
> >       switch (buffer[2]) {
> > @@ -1107,8 +1112,20 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >                       return 0;
> >               }
> >
> > +             id = buffer[3];
> > +
> > +             /*
> > +              * Nothing can be connected to an output terminal. To avoid
> > +              * entity-id's collisions in devices with invalid USB
> > +              * descriptors, move the output terminal id to its own
> > +              * namespace. Do this only for UVC_TT_STREAMING entities, to
> > +              * avoid changing the id of terminals with controls.
> > +              */
>
> How about expanding this too, similarly to the commit message to avoid
> digging all the information from the git history ? I've found that
> explaining hacks in more details helped me before when I had to rework
> the code years later.

I always like your comments :)

>
>                 /*
>                  * Some devices, such as the Grandstream GUV3100 and the LSK
>                  * Meeting Eye for Business & Home, exhibit entity ID collisions
I would not even Mention the LSK, they are abusing a vid:pid,.... up to you.
>                  * between units and streaming output terminals. Move streaming
>                  * output terminals to their own ID namespace by setting bit
>                  * UVC_TT_STREAMING (15), above the ID's 8-bit value. The bit is
UVC_TERM_OUTPUT
>                  * ignored in uvc_stream_for_terminal() when looking up the
>                  * streaming interface for the terminal.
>                  *
>                  * This hack is safe to enable unconditionally, asthe ID is not
as the
>                  * used for any other purpose (streaming output terminals have
>                  * no controls and are never referenced as sources in UVC
>                  * descriptors). Other types output terminals can have controls,
>                  * so limit usage of this separate namespace to streaming output
>                  * terminals.
>                  */
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +             if (type & UVC_TT_STREAMING)
> > +                     id |= UVC_TERM_OUTPUT;
> > +
> >               term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> > -                                         buffer[3], 1, 0);
> > +                                         id, 1, 0);
> >               if (IS_ERR(term))
> >                       return PTR_ERR(term);
> >
> > @@ -2105,8 +2122,8 @@ static int uvc_register_terms(struct uvc_device *dev,
> >               if (UVC_ENTITY_TYPE(term) != UVC_TT_STREAMING)
> >                       continue;
> >
> > -             stream = uvc_stream_by_id(dev, term->id);
> > -             if (stream == NULL) {
> > +             stream = uvc_stream_for_terminal(dev, term);
> > +             if (!stream) {
> >                       dev_info(&dev->intf->dev,
> >                                "No streaming interface found for terminal %u.",
> >                                term->id);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index ed7bad31f75ca474c1037d666d5310c78dd764df..3f2e832025e712585edc324afa6cad760d4edafc 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -41,7 +41,8 @@
> >  #define UVC_EXT_GPIO_UNIT            0x7ffe
> >  #define UVC_EXT_GPIO_UNIT_ID         0x100
> >
> > -#define UVC_INVALID_ENTITY_ID          0xffff
> > +#define UVC_HARDWARE_ENTITY_ID(id)   ((id) & 0xff)
> > +#define UVC_INVALID_ENTITY_ID                0xffff
> >
> >  /* ------------------------------------------------------------------------
> >   * Driver specific constants.
> >
> > ---
> > base-commit: ea299a2164262ff787c9d33f46049acccd120672
> > change-id: 20251022-uvc-grandstream-laurent-3f9abb8a0d5b
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

