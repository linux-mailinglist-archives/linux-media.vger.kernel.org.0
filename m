Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD6C2A91B5
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 09:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgKFIpl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 03:45:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgKFIpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 03:45:41 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD5AC0613D2
        for <linux-media@vger.kernel.org>; Fri,  6 Nov 2020 00:45:40 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id y22so583558oti.10
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2020 00:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0/92cdpzO11FzbQCzueBuQSjWB1HRcbFekCHNB7QwcU=;
        b=WM5OUzi6OJSrwtnoagEHDtH1MNZJfaqznzdeqhLLjSaXFRo/7HhDcyly0g9sLf5x61
         GFx2DK4dEfOCn1Su22egEM1OXHB4EPOCknH3F/yPBRxAki/tGyYa/pzYCVw77BKa2mOm
         Q823G/ZK6sxtg40iJbIT0uFqvook8AX3pXp1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0/92cdpzO11FzbQCzueBuQSjWB1HRcbFekCHNB7QwcU=;
        b=mz/anj90ZTQoHKsLeLsFoEHIk1jsyVSwUxaWTbLT4X36jik097GPpoj3KIK52lgZmH
         kT0letovwCwSLBj4UHe4RvOfU3IETzR3aCmnYL1k7lxfd9y25/eEpd8Ge7LBWXWNCmpy
         sNWdhhmfabgBRpjx7z7hTdYpzpmXYP3mb7mnKSZ48yMMr4Lqq7BKgkC9V77ILtVFFjmn
         nEqhHCpagqWVkchkyswNelfXDheNTtjyjl8WnxMuJFY1x+/Nb9FjfdOZFG2IMSKDy9PP
         CZs/qA5WmVmKfZsU0W8s6S3rV+JlU8dRwbuIQ14ISaJoQsxLxWJs4bx75XGx+rk219st
         BN9Q==
X-Gm-Message-State: AOAM531sQe/TGIHW3Eo6wXTuXxAwyNIIiVeAP5jnVwd5ZzdP3FQBufJr
        NRzdn9llKGf6A0TSqu0ktgrrJNQyaXnOdw==
X-Google-Smtp-Source: ABdhPJwW/46Ht8kl5a+wJmPpfnpwkRwua1bqcZkAGjRXBHMoZyvTGjv3skQTZacBDjkQl67mKH5Nxg==
X-Received: by 2002:a9d:62c1:: with SMTP id z1mr455148otk.108.1604652339935;
        Fri, 06 Nov 2020 00:45:39 -0800 (PST)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id w8sm169250otm.64.2020.11.06.00.45.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2020 00:45:39 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id t16so596280oie.11
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2020 00:45:38 -0800 (PST)
X-Received: by 2002:a05:6808:602:: with SMTP id y2mr516793oih.11.1604652338400;
 Fri, 06 Nov 2020 00:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20201104180734.286789-1-ribalda@chromium.org> <20201104180734.286789-3-ribalda@chromium.org>
 <20201106060602.GA6926@pendragon.ideasonboard.com>
In-Reply-To: <20201106060602.GA6926@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 6 Nov 2020 09:45:27 +0100
X-Gmail-Original-Message-ID: <CANiDSCuZ_euz1tb35ETffN_NxLxW_N-7hBCpk-HhuRuRJBFxkA@mail.gmail.com>
Message-ID: <CANiDSCuZ_euz1tb35ETffN_NxLxW_N-7hBCpk-HhuRuRJBFxkA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] media: uvcvideo: Move guid to entity
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Thanks for the review

On Fri, Nov 6, 2020 at 7:06 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Nov 04, 2020 at 07:07:29PM +0100, Ricardo Ribalda wrote:
> > Instead of having multiple copies of the entity guid on the code, move
> > it to the entity structure.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 30 ++++--------------------------
> >  drivers/media/usb/uvc/uvc_driver.c | 21 +++++++++++++++++++--
> >  drivers/media/usb/uvc/uvcvideo.h   |  2 +-
> >  3 files changed, 24 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index f479d8971dfb..0e480b75e724 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -826,31 +826,10 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
> >   * Terminal and unit management
> >   */
> >
> > -static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> > -static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
> > -static const u8 uvc_media_transport_input_guid[16] =
> > -     UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> > -
> >  static int uvc_entity_match_guid(const struct uvc_entity *entity,
> > -     const u8 guid[16])
> > +                              const u8 guid[16])
> >  {
> > -     switch (UVC_ENTITY_TYPE(entity)) {
> > -     case UVC_ITT_CAMERA:
> > -             return memcmp(uvc_camera_guid, guid, 16) == 0;
> > -
> > -     case UVC_ITT_MEDIA_TRANSPORT_INPUT:
> > -             return memcmp(uvc_media_transport_input_guid, guid, 16) == 0;
> > -
> > -     case UVC_VC_PROCESSING_UNIT:
> > -             return memcmp(uvc_processing_guid, guid, 16) == 0;
> > -
> > -     case UVC_VC_EXTENSION_UNIT:
> > -             return memcmp(entity->extension.guidExtensionCode,
> > -                           guid, 16) == 0;
> > -
> > -     default:
> > -             return 0;
> > -     }
> > +     return memcmp(entity->guid, guid, sizeof(entity->guid)) == 0;
> >  }
> >
> >  /* ------------------------------------------------------------------------
> > @@ -1776,8 +1755,7 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
> >       if (data == NULL)
> >               return -ENOMEM;
> >
> > -     memcpy(info->entity, ctrl->entity->extension.guidExtensionCode,
> > -            sizeof(info->entity));
> > +     memcpy(info->entity, ctrl->entity->guid, sizeof(info->entity));
> >       info->index = ctrl->index;
> >       info->selector = ctrl->index + 1;
> >
> > @@ -1883,7 +1861,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >
> >       if (!found) {
> >               uvc_trace(UVC_TRACE_CONTROL, "Control %pUl/%u not found.\n",
> > -                     entity->extension.guidExtensionCode, xqry->selector);
> > +                     entity->guid, xqry->selector);
> >               return -ENOENT;
> >       }
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 9fc0b600eab1..77fea26faa9a 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1019,6 +1019,11 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> >       return ret;
> >  }
> >
> > +static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
> > +static const u8 uvc_media_transport_input_guid[16] =
> > +     UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> > +static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> > +
> >  static struct uvc_entity *uvc_alloc_entity(u16 type, u8 id,
> >               unsigned int num_pads, unsigned int extra_size)
> >  {
> > @@ -1038,6 +1043,18 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u8 id,
> >       entity->id = id;
> >       entity->type = type;
> >
> > +     switch (type) {
> > +     case UVC_ITT_CAMERA:
> > +             memcpy(entity->guid, uvc_camera_guid, 16);
> > +             break;
> > +     case UVC_ITT_MEDIA_TRANSPORT_INPUT:
> > +             memcpy(entity->guid, uvc_media_transport_input_guid, 16);
> > +             break;
> > +     case UVC_VC_PROCESSING_UNIT:
> > +             memcpy(entity->guid, uvc_processing_guid, 16);
> > +             break;
> > +     }
>
> Given that the GUID is set in uvc_parse_vendor_control() and
> uvc_parse_standard_control() for extension units, I'm wondering if it
> would make sense to move it there for the other entity types too. Up to
> you. Otherwise, I'd add the following comment above the switch:
>
>         /*
>          * Set the GUID for standard entity types. For extension units, the GUID
>          * is initialized by the caller.
>          */

I added the comment. So far I am working on

https://github.com/ribalda/linux/tree/uvctest-v3

Please let me know when you are ready with v2, to send v3 to the mailing list.

Thanks!

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +
> >       entity->num_links = 0;
> >       entity->num_pads = num_pads;
> >       entity->pads = ((void *)(entity + 1)) + extra_size;
> > @@ -1109,7 +1126,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
> >               if (unit == NULL)
> >                       return -ENOMEM;
> >
> > -             memcpy(unit->extension.guidExtensionCode, &buffer[4], 16);
> > +             memcpy(unit->guid, &buffer[4], 16);
> >               unit->extension.bNumControls = buffer[20];
> >               memcpy(unit->baSourceID, &buffer[22], p);
> >               unit->extension.bControlSize = buffer[22+p];
> > @@ -1368,7 +1385,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >               if (unit == NULL)
> >                       return -ENOMEM;
> >
> > -             memcpy(unit->extension.guidExtensionCode, &buffer[4], 16);
> > +             memcpy(unit->guid, &buffer[4], 16);
> >               unit->extension.bNumControls = buffer[20];
> >               memcpy(unit->baSourceID, &buffer[22], p);
> >               unit->extension.bControlSize = buffer[22+p];
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index a3dfacf069c4..df7bf2d104a3 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -304,6 +304,7 @@ struct uvc_entity {
> >       u8 id;
> >       u16 type;
> >       char name[64];
> > +     u8 guid[16];
> >
> >       /* Media controller-related fields. */
> >       struct video_device *vdev;
> > @@ -342,7 +343,6 @@ struct uvc_entity {
> >               } selector;
> >
> >               struct {
> > -                     u8  guidExtensionCode[16];
> >                       u8  bNumControls;
> >                       u8  bControlSize;
> >                       u8  *bmControls;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
