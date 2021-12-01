Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4140E4646C5
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 06:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346766AbhLAFpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 00:45:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbhLAFpB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 00:45:01 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9073C061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 21:41:41 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id bk14so46245308oib.7
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 21:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VTkHXHwQss72eq2p66RK7gbpy+Gt6JLirf67qrNQIrI=;
        b=nkcG1H+ecrKYz4LPmq52tQt9AAoGsYbK/2FzkILtHEW8I03hugHfSepnQdxbOCFj1P
         3MyS+Lkzk4dNOsblL4eo3bo0VhEdHPvrZnurE649jBbRp4PU2I3/q3vWyT7epYkQDi+X
         JqiLozvDsfY0CTkoEPhnaJvMBHn3cTPj+HIEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VTkHXHwQss72eq2p66RK7gbpy+Gt6JLirf67qrNQIrI=;
        b=EgqZHPMPsvuQaOHkZKJqoEtAtQTB3Dd9mWoR8U+PHReByTdrv98imJzByo0W8uJB16
         2s3nmzyUH9wLKRaYEEfVxvLXEQgzuDIP/fl46iOfymrhRxnzQhKWaSO3jZgUOg/8xXd3
         GpqUdYaxeHY9VeUemDZxWhgkjUDXA6rAkqMpbSQDlGzPa7JN/k4Fuzpg0hN1fN9WzC31
         Do350cdkkCjusZyuF/eBsJtiPMwMxntXamJpCSXwb1Tl8m84PXfduwsq/9qQEKaE1HOI
         gw40CAemF38EnLT892q7b/W08mxJ1TUc+/cGAZQEiQyWMaUOW6QzRT0bNrTbFFirqUws
         QbYg==
X-Gm-Message-State: AOAM532v+XmHd5Dn+o4OQD8eEiYiIV/1wRN23v2lQyaRoCP6hTZlIGN8
        K3xmK2IXSHRugXY5dj0qNrMUcghAEmbGRjEYTSg=
X-Google-Smtp-Source: ABdhPJxRjg24d5XVtoRxAyII2OtlT0vfF+cmMvSUyPnYqifIOwhaJVz4e4i6RMJ8+kRQixplzLTL8g==
X-Received: by 2002:aca:6243:: with SMTP id w64mr4034393oib.167.1638337300953;
        Tue, 30 Nov 2021 21:41:40 -0800 (PST)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id z12sm3200492oor.45.2021.11.30.21.41.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 21:41:40 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id bk14so46245213oib.7
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 21:41:40 -0800 (PST)
X-Received: by 2002:aca:af50:: with SMTP id y77mr4054161oie.134.1638337299983;
 Tue, 30 Nov 2021 21:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20211130155026.1082594-1-ribalda@chromium.org> <YabfwZQvlQfadAhl@pendragon.ideasonboard.com>
In-Reply-To: <YabfwZQvlQfadAhl@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 1 Dec 2021 06:41:29 +0100
X-Gmail-Original-Message-ID: <CANiDSCvuZAxJWxGkpxtz=ULon5us-u3s+TAys2ULC-Xugha9zw@mail.gmail.com>
Message-ID: <CANiDSCvuZAxJWxGkpxtz=ULon5us-u3s+TAys2ULC-Xugha9zw@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: uvcvideo: Avoid invalid memory access
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Thanks for the prompt reply :)

On Wed, 1 Dec 2021 at 03:37, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Tue, Nov 30, 2021 at 03:50:25PM +0000, Ricardo Ribalda wrote:
> > If mappings points to an invalid memory, we will be invalid accessing
> > it.
> > Solve it by initializing the value of the variable mapping and by
> > changing the order in the conditional statement (to avoid accessing
> > mapping->id if not needed).
> >
> > Fix:
> > kasan: GPF could be caused by NULL-ptr deref or user memory access
> > general protection fault: 0000 [#1] PREEMPT SMP KASAN NOPTI
> >
> > Fixes: 6350d6a4ed487 ("media: uvcvideo: Set error_idx during ctrl_commit errors")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 30bfe9069a1fb..f7b7add3cfa59 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -852,8 +852,8 @@ static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
> >                               return;
> >                       }
> >
> > -                     if ((*mapping == NULL || (*mapping)->id > map->id) &&
> > -                         (map->id > v4l2_id) && next) {
> > +                     if (next && (map->id > v4l2_id) &&
> > +                         (*mapping == NULL || (*mapping)->id > map->id)) {
> >                               *control = ctrl;
> >                               *mapping = map;
> >                       }
> > @@ -1638,7 +1638,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
> >                                 struct v4l2_ext_controls *ctrls,
> >                                 struct uvc_control *uvc_control)
> >  {
> > -     struct uvc_control_mapping *mapping;
> > +     struct uvc_control_mapping *mapping = NULL;
>
> It seems to me that either change will fix the bug, we don't need both,
> is that right ? If so I'd drop the change to __uvc_find_control(), as it
> seems quite fragile to allow mapping to be uninitialized.

Just wanted to be extra paranoid. I have just sent a v2 of the patch.

Thanks!

>
> >       struct uvc_control *ctrl_found;
> >       unsigned int i;
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
