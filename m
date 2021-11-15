Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC64A450535
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 14:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhKONVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 08:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbhKONUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 08:20:48 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3A7C061206;
        Mon, 15 Nov 2021 05:17:03 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id t19so34783900oij.1;
        Mon, 15 Nov 2021 05:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+trvJXHydDhD/D3GwG+2cB3ZctzLQIoLnL0Ik122B8U=;
        b=ngfJ8sL/Q408WQO+cf3opwVLAghaLfYSPnc8GHIVHe1k+mJYQVeaxDnAGYZ1Tdug0r
         vjED/lPV8f5bsiJ1pBwEdD2qr7LI2SZC6PSMu6S/8Qe0tNkb0Wzh6wXQLxfxqTiht3Ts
         si0g41jWelAL1kP0lLj4/0uIa47swsTiOcPVQu9saACp+9KzmwbG1h110CgRehNgiEot
         Y8huBIA67eN19y0ajabj5acKjX0KxUuj808q3YIkDA+qHHwW8GTh0gf3vEQjKUy38H78
         C8qoMnXK+56vHMM14EhZwrjRqEdQzcztM0wBlgrTdmPTRVFGcbl3Ra46QVM++2HGXH2Z
         ERAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+trvJXHydDhD/D3GwG+2cB3ZctzLQIoLnL0Ik122B8U=;
        b=Ba+R6NBPMnkytvyZ6w9QArGTegae5U+aLwBLQpHKqEB+/ff7d1FH5yoC2zIk+zXtsl
         hdnut4V8ypRaYuAtRs8aAstsI58sWQc2jUEoHpzzy29Zkds+UqJSqzjsl93/Qh89myFv
         Mpr4LyRmGsgmlzKaXNs3PnR9NUsEcCF538rE4TooDh7WRWThx3oKBYCqxCzJ70YBcMSo
         peQFQ7Jm6qNJy73xXKgtWU91uMuc+1GGZfCF3iEEJ2RgR9BV0PfAKkzFOeRyWJN89VuR
         WxB2WrVQ0d+YGVU3P9s8/0ZG+SiVdHrNqSo3UOUCWvWmjPVz+RnHThvH6DUu4aU5N/Ho
         I9YA==
X-Gm-Message-State: AOAM5328AnVkzVioAuJDjbAsmWy8l7b4VBZwxf3ZK7JD2ynsCVq0zaGn
        JaeHY72BJvTO3FAmCXEUWMZdJ/2zCuGOxyIRl2JAmiYdUTw=
X-Google-Smtp-Source: ABdhPJzTqJiaIz1KG1gkiC2OhKAeNxuOK3sEbINEme1GUPy//ihE4tT8qYqgk4ScGeYUwdWPLvqD2/dsvYM5DFkZLlE=
X-Received: by 2002:a05:6808:118c:: with SMTP id j12mr31199817oil.65.1636982222458;
 Mon, 15 Nov 2021 05:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20211114085236.2345589-1-james.hilliard1@gmail.com> <YZIorH8D7NPB3w5B@pendragon.ideasonboard.com>
In-Reply-To: <YZIorH8D7NPB3w5B@pendragon.ideasonboard.com>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Mon, 15 Nov 2021 06:16:50 -0700
Message-ID: <CADvTj4pY+2OXPLy1_pVuiA6=BR9u8634HhP5XBWnGUTVPk5wtg@mail.gmail.com>
Subject: Re: [PATCH 1/1] media: uvcvideo: Increase UVC_CTRL_CONTROL_TIMEOUT to
 5 seconds.
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 15, 2021 at 2:30 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi James,
>
> Thank you for the patch.
>
> On Sun, Nov 14, 2021 at 01:52:36AM -0700, James Hilliard wrote:
> > Some uvc devices appear to require the maximum allowed USB timeout
> > for GET_CUR/SET_CUR requests.
>
> Could you list the devices that you know about which require this change
> ?

Seems random unbranded chinese made cameras is where I was hitting it,
but I was seeing a decent amount of others encountering similar timeout issues
when researching the issue.

>
> > So lets just bump the UVC control timeout to 5 seconds which is the
> > same as the usb ctrl get/set defaults:
> > USB_CTRL_GET_TIMEOUT 5000
> > USB_CTRL_SET_TIMEOUT 5000
>
> The USB specification (section 9.2.6.4) requires the device to send the
> first data packet within 500ms of reception of the request. A 500ms
> timeout may thus be a bit too short for compliant devices, but 5000ms
> seems to be a very large margin. I'm wondering if it would make sense to
> go for a lower value.

The 500 ms timeout appears to be applicable:
"For standard device requests that require data stage transfer to the host"

While the 5s timeout appears to be applicable to:
"For standard device requests that require a data stage transfer to the device"

From what I could tell a lot of software just uses the 5s timeout everywhere for
these GET_CUR and SET_CUR requests, I think it's probably best to just use
the 5s timeout, that way it's much less likely that we'll see timeout
bugs here as
it seems likely a lot of vendors are testing against software using
the 5s timeout.

I don't really see any harm in bumping it up to 5 seconds, maybe there
is something
I'm missing there though?

>
> > Fixes:
> > Failed to query (GET_CUR) UVC control 11 on unit 2: -110 (exp. 1).
> > Failed to query (SET_CUR) UVC control 3 on unit 2: -110 (exp. 2).
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/media/usb/uvc/uvcvideo.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index fd4f5ef47dfb..583c51ac3eec 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -189,7 +189,7 @@
> >  /* Maximum status buffer size in bytes of interrupt URB. */
> >  #define UVC_MAX_STATUS_SIZE  16
> >
> > -#define UVC_CTRL_CONTROL_TIMEOUT     500
> > +#define UVC_CTRL_CONTROL_TIMEOUT     5000
> >  #define UVC_CTRL_STREAMING_TIMEOUT   5000
> >
> >  /* Maximum allowed number of control mappings per device */
>
> --
> Regards,
>
> Laurent Pinchart
