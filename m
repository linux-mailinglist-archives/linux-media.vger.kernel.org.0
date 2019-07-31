Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0977CC2D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 20:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730407AbfGaSn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 14:43:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55089 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727579AbfGaSn1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 14:43:27 -0400
Received: by mail-wm1-f67.google.com with SMTP id p74so61858724wme.4
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2019 11:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4J+fDPEtfJXfbqo+FZNjqReJJ9x9pUTAVoAuUORO/Qg=;
        b=ZVDo0Jzohos/AkIFL6J285pc9muPLwIvjJGYp70FpqqE3vvXXy34DsLCjIIXDbQ3eD
         0d9dMWbyzzWlyoKNFRdb9rKKRb8LoQUdlzzeo+827tyRrMDLLO4BARNB1eA1u/Rjid5S
         h2Y5CRvUuFWgAzgFIgpx9mqLIq56ERUv/AvMYqDiKVFhzdSOWQD44mgyl8fn0hhGesyD
         Y12D9CbQI8iZ7Rl+GaZKJ0loJcmn7od8osRZUbAPY8wPRCBpP0iOzN7TPchfVI1Jb36S
         iOqgzrZjpU2UwKoQsGXpZs3ZGtDLcRzIa7qGabedNJvtu3+DSa2XihKKPZ0W9ToAAk6i
         b/pA==
X-Gm-Message-State: APjAAAW3kUoD7hN4bgdDp0SskbKbrAcZ4SUMjfgECX7kYdCJP1bzZRY8
        UgJdRw7mInwnwiz+hWwExDS1VZ3WbFDmB+Guego=
X-Google-Smtp-Source: APXvYqzTmIbrk7F+GPgjO75Y1/WFjaapEkIJXqr5fQy7SlfQI1ZZtQlcZh/1PSARvtjUU0ToQN8JiWHTnOFVQrZIH4Y=
X-Received: by 2002:a05:600c:20ca:: with SMTP id y10mr78923025wmm.72.1564598605479;
 Wed, 31 Jul 2019 11:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190731134121.18473-1-geert+renesas@glider.be> <95aa9f00-a01e-09ab-3cc3-5f1246052093@iki.fi>
In-Reply-To: <95aa9f00-a01e-09ab-3cc3-5f1246052093@iki.fi>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 Jul 2019 20:43:13 +0200
Message-ID: <CAMuHMdWZW-=8sD2KYEGY0f++++ocMjwDVut1r2z3pJk9OL2wmw@mail.gmail.com>
Subject: Re: [PATCH] media: tm6000: Spelling s/diconencted/diconnected/
To:     Antti Palosaari <crope@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Antti,

On Wed, Jul 31, 2019 at 8:36 PM Antti Palosaari <crope@iki.fi> wrote:
> On 7/31/19 4:41 PM, Geert Uytterhoeven wrote:
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >   drivers/media/usb/tm6000/tm6000-cards.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/media/usb/tm6000/tm6000-cards.c
> > index 23df50aa0a4af6da..9a0ffe678524987c 100644
> > --- a/drivers/media/usb/tm6000/tm6000-cards.c
> > +++ b/drivers/media/usb/tm6000/tm6000-cards.c
> > @@ -1328,7 +1328,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
> >
> >   /*
> >    * tm6000_usb_disconnect()
> > - * called when the device gets diconencted
> > + * called when the device gets diconnected
>
> disconnected ?

Thanks, will fix!

> For the both patches.

How embarassing...
/me hides in a brown paper bag...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
