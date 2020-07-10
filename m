Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C68321AFEC
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 09:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgGJHQJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 03:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgGJHQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 03:16:09 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E0BC08C5CE;
        Fri, 10 Jul 2020 00:16:09 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id 12so4044880oir.4;
        Fri, 10 Jul 2020 00:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=04fvwvp36XWQGO6WnlynMTR2NxVi2WuyRxfDLjiMyIA=;
        b=B+4os/xlBuPxbO8zrez1X+udsD+5089fUms0mHlrwKomYV4CJRmN3pE+4vXK019egg
         YeUVoMVd8bOsCZQ4hEw7/pLbTEB/dO9qodmT7iPcm+KMqkk7YhrXBEktbc6FeT4IdpHP
         1ufqjBZptj6qoJ8WojKwovjRnyaeAvYcLBPZIND3uw7TDHQTZG3VixrV6Szii71tWGoL
         evoohqDUgTC9rajjt/8g4jPd7TsBD9iToencWeFh3D8jg7QpkWdj3636ClhNmcVtKfLn
         xM1olSrBFB8tn+wj6DH9wi81gTx0+wtqfvGyIrQwQ75IAe6RtLjs7WXjsR9SdYY86aYa
         cDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=04fvwvp36XWQGO6WnlynMTR2NxVi2WuyRxfDLjiMyIA=;
        b=sNj4QQ+Dcab9yq3oRSZE8wATSCnogmS9lj6AKonU2DpdrEHQcnpX65zV6uNQVW9+62
         tHtNTHZ35lILnJ6bb4XiGomi44xTvXQhRei+4ier22soadHThY7t2h1Ql54ZXQujwNyv
         O6RZkr8teNyQTUKPPI3HTLqoYWaOQs0KxKk/w1rRVuWj0H6CatYzbR49bNXoNkwXqyIx
         X04domomcGDJ4+1wK2ELHBo4OYBdAVTuKrxLsLgyCfzgakuWmlGQeKrbiiVJWI3dOds9
         Dk8LD1/WF29P0l3AoVEebOLrztH4CVdl1G4/0H66K0JxWWz+Lg/A7OTxs7VPiubiGmDb
         X17Q==
X-Gm-Message-State: AOAM532lY/NPogMKDW8LpjMVqoY23P1cXg6IMFlQvbJcn+83bnJ0R/55
        J1fM92plY6uYTlV9E6iTVPXnihmCiPmc0bUDrOq9TpTaLAo=
X-Google-Smtp-Source: ABdhPJy4ysN01c2WAbVgZG4Cbv0racHKjYXQ7wJJ4yxuYBlZhawNKDB0VNUTWu9CYc68PqYOGxpdtse4MhEzohwE0Q0=
X-Received: by 2002:aca:4fd3:: with SMTP id d202mr3269407oib.142.1594365368348;
 Fri, 10 Jul 2020 00:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200709072814.24218-1-grandmaster@al2klimov.de> <dab6510d-4b3a-7439-bff0-e927ddd2622f@ideasonboard.com>
In-Reply-To: <dab6510d-4b3a-7439-bff0-e927ddd2622f@ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 10 Jul 2020 08:15:42 +0100
Message-ID: <CA+V-a8sDzvRoi8pSdrtTQ6VpGLDmw_pqv-5rQH-tfONQuwNhvQ@mail.gmail.com>
Subject: Re: [PATCH] TI DAVINCI SERIES MEDIA DRIVER: Replace HTTP links with
 HTTPS ones
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 9, 2020 at 9:43 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> Hi Alexander,
>
> On 09/07/2020 08:28, Alexander A. Klimov wrote:
> > Rationale:
> > Reduces attack surface on kernel devs opening the links for MITM
> > as HTTPS traffic is much harder to manipulate.
> >
> > Deterministic algorithm:
> > For each file:
> >   If not .svg:
> >     For each line:
> >       If doesn't contain `\bxmlns\b`:
> >         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> >         If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
> >             If both the HTTP and HTTPS versions
> >             return 200 OK and serve the same content:
> >               Replace HTTP with HTTPS.
> >
> > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
>
> This non-https link redirects to the https link already with a 301, so
> the content is expectedly the same.
>
> I doubt many people click on these links, as I guess they're usually
> rendered as text so it depends on the editor, I expect as much as
> anything it's 'advertising' or confirmation of the copyright notice.
>
> But still, I've just clicked on them ... and I think this is a
> reasonable step.
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> > ---
> >  Continuing my work started at 93431e0607e5.
> >  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
> >  (Actually letting a shell for loop submit all this stuff for me.)
> >
> >  If there are any URLs to be removed completely or at least not HTTPSified:
> >  Just clearly say so and I'll *undo my change*.
> >  See also: https://lkml.org/lkml/2020/6/27/64
> >
> >  If there are any valid, but yet not changed URLs:
> >  See: https://lkml.org/lkml/2020/6/26/837
> >
> >  If you apply the patch, please let me know.
> >
> >
> >  drivers/media/platform/davinci/vpbe_display.c | 2 +-
> >  drivers/media/platform/davinci/vpif.c         | 2 +-
> >  drivers/media/platform/davinci/vpif.h         | 2 +-
> >  drivers/media/platform/davinci/vpif_display.c | 2 +-
> >  drivers/media/platform/davinci/vpif_display.h | 2 +-
> >  include/media/davinci/vpbe_display.h          | 2 +-
> >  6 files changed, 6 insertions(+), 6 deletions(-)
> >
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar

> > diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
> > index 7ab13eb7527d..d19bad997f30 100644
> > --- a/drivers/media/platform/davinci/vpbe_display.c
> > +++ b/drivers/media/platform/davinci/vpbe_display.c
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> > - * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
> > + * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com/
> >   */
> >  #include <linux/kernel.h>
> >  #include <linux/init.h>
> > diff --git a/drivers/media/platform/davinci/vpif.c b/drivers/media/platform/davinci/vpif.c
> > index df66461f5d4f..e9794c9fc7fe 100644
> > --- a/drivers/media/platform/davinci/vpif.c
> > +++ b/drivers/media/platform/davinci/vpif.c
> > @@ -5,7 +5,7 @@
> >   * The hardware supports SDTV, HDTV formats, raw data capture.
> >   * Currently, the driver supports NTSC and PAL standards.
> >   *
> > - * Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
> > + * Copyright (C) 2009 Texas Instruments Incorporated - https://www.ti.com/
> >   *
> >   * This program is free software; you can redistribute it and/or
> >   * modify it under the terms of the GNU General Public License as
> > diff --git a/drivers/media/platform/davinci/vpif.h b/drivers/media/platform/davinci/vpif.h
> > index 2466c7c77deb..c6d1d890478a 100644
> > --- a/drivers/media/platform/davinci/vpif.h
> > +++ b/drivers/media/platform/davinci/vpif.h
> > @@ -1,7 +1,7 @@
> >  /*
> >   * VPIF header file
> >   *
> > - * Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
> > + * Copyright (C) 2009 Texas Instruments Incorporated - https://www.ti.com/
> >   *
> >   * This program is free software; you can redistribute it and/or
> >   * modify it under the terms of the GNU General Public License as
> > diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
> > index 7d55fd45240e..46afc029138f 100644
> > --- a/drivers/media/platform/davinci/vpif_display.c
> > +++ b/drivers/media/platform/davinci/vpif_display.c
> > @@ -2,7 +2,7 @@
> >   * vpif-display - VPIF display driver
> >   * Display driver for TI DaVinci VPIF
> >   *
> > - * Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
> > + * Copyright (C) 2009 Texas Instruments Incorporated - https://www.ti.com/
> >   * Copyright (C) 2014 Lad, Prabhakar <prabhakar.csengg@gmail.com>
> >   *
> >   * This program is free software; you can redistribute it and/or
> > diff --git a/drivers/media/platform/davinci/vpif_display.h b/drivers/media/platform/davinci/vpif_display.h
> > index af2765fdcea8..f731a65eefd6 100644
> > --- a/drivers/media/platform/davinci/vpif_display.h
> > +++ b/drivers/media/platform/davinci/vpif_display.h
> > @@ -1,7 +1,7 @@
> >  /*
> >   * VPIF display header file
> >   *
> > - * Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
> > + * Copyright (C) 2009 Texas Instruments Incorporated - https://www.ti.com/
> >   *
> >   * This program is free software; you can redistribute it and/or
> >   * modify it under the terms of the GNU General Public License as
> > diff --git a/include/media/davinci/vpbe_display.h b/include/media/davinci/vpbe_display.h
> > index 56d05a855140..6d2a93740130 100644
> > --- a/include/media/davinci/vpbe_display.h
> > +++ b/include/media/davinci/vpbe_display.h
> > @@ -1,6 +1,6 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> >  /*
> > - * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
> > + * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com/
> >   */
> >  #ifndef VPBE_DISPLAY_H
> >  #define VPBE_DISPLAY_H
> >
>
