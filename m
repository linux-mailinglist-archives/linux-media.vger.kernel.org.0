Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC1A39F192
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 19:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbfH0R3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 13:29:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41078 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfH0R3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 13:29:07 -0400
Received: by mail-ot1-f67.google.com with SMTP id o101so19421330ota.8
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2019 10:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I/LF2KDeaRpq3QoFxgegOpGbkP5BCuaU3r5Jw1T3Fig=;
        b=qis8Es7QcrggNV1Wp1HL17VLLMo1TOAPzAtyW4515yHWg8pHZujcAZyUdyHSnprePM
         oiyIxWuyXQhXbRnPndGHgx56irfdbAOMqI8ZLmgKQPERXucJyrZJH5hjpFEsNz9leNrA
         km+pVfwlikXjMaLOi+EOYXWAAI3JriIa8BLWbh3s0H6/XdUzUC2VoHHvxzYrFbBApS/P
         gd436tcgjLGFhre7Tfls9ft1urDWreFpM8TTUGfbAfRNN/EuBkmk09w2XjdK2r+1ImtI
         j00IST/EfOSaSsCcJNu6Wwi/d8Dva3Jmv3mpWln+aU52Qdzu3Usai3fnBBxppWiQd/LS
         3WQg==
X-Gm-Message-State: APjAAAUhpRek5O/hMQ3R71e76PxXmjr/oi5jSqIOhCejSX8TrOhc770L
        M859mMqlnhdyY94kF3yTanWf43OwJYVT34m8lPg=
X-Google-Smtp-Source: APXvYqxIcBvnoID9eeYQuzYSubNFHchbzq+8Nl7q/pOVQhhYlXgdCcLwQTErgKjPaAHEaKMMiWgiEo9X+8FyWLUtZKM=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr17830136otg.107.1566926946023;
 Tue, 27 Aug 2019 10:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190731134051.18392-1-geert+renesas@glider.be> <44bee359-3d5a-f810-0f83-9d499a371e6a@ideasonboard.com>
In-Reply-To: <44bee359-3d5a-f810-0f83-9d499a371e6a@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Aug 2019 19:28:54 +0200
Message-ID: <CAMuHMdVqEFz7=kZ8i0pH-skp-o5uOeh=5+LkE+=Ea3S5stPwEw@mail.gmail.com>
Subject: Re: [PATCH] media: cx231xx: Spelling s/diconencted/diconnected/
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Welcome back! ;-)

On Tue, Aug 27, 2019 at 4:57 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 31/07/2019 14:40, Geert Uytterhoeven wrote:
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/media/usb/cx231xx/cx231xx-cards.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
> > index e0d98ba8fdbfa829..47a85d8152b03afa 100644
> > --- a/drivers/media/usb/cx231xx/cx231xx-cards.c
> > +++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
> > @@ -1924,7 +1924,7 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
> >
> >  /*
> >   * cx231xx_usb_disconnect()
> > - * called when the device gets diconencted
> > + * called when the device gets diconnected
>
> Shouldn't this perhaps be 'disconnected' ?

Fortunately this has been fixed in v2, cfr. commit 6b338c720c139acd ("media:
Fix various misspellings of disconnected").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
