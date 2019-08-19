Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD2391BC8
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 06:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfHSETT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 00:19:19 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42482 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfHSETS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 00:19:18 -0400
Received: by mail-ed1-f67.google.com with SMTP id m44so372698edd.9
        for <linux-media@vger.kernel.org>; Sun, 18 Aug 2019 21:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fbyYLzisYNN1lRqh22A2VNalz6OnIhJsVCaofVl30Uk=;
        b=oTEwwP8bcyoAr7TAwnNcsjRWloPJDG5n5a1SrS1Dpa+L2D0Z7bIuW3Jd6HdaCxwwrb
         0+1yFPtCH70cPViosaWFtE2QDWI57k+pzDwmSyAEQHUiiTvB6FJaQBmFuJePHt0pLH8s
         vUkWcmr/j5oLTVY+LULR6SVUJVsBcHVJw3b/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fbyYLzisYNN1lRqh22A2VNalz6OnIhJsVCaofVl30Uk=;
        b=txEvWB0cVvvylPwme14SPfm830aelxhU27LS1U6XGiMQvJykaUjkPtztXf4ytl8Rww
         irZXMYJm+I71rz8TfOJm1ROu+Lf4T4ObY5dADlolSqAdUn3+9qRD6idgE8djois0XXq9
         XPC5eZu8JxJ+4zNVH6a8k2yj3VbYgimo0HR77etAdK6L+APWMl8rs7taT6p92Q8h3vYk
         jT35Kbck6C+14k/iOces/ohNbLqBD1X642Pf8BTrHBsko5B0CglPGYjHB1UhY9uT281c
         5nnXUS2SdjmsCFrXsi50pFGdA/3CoCJMD0a8D7w1ukMp1sroInOliid1dm/tn8YVm1pj
         ai9A==
X-Gm-Message-State: APjAAAVW+MO/+62dmHp5mP/+t5VK6zblGodo8Na0iiUT9UsHdVa3C8eS
        ktzfM+jkc8CwVgjlUFk77ePseDGlTDcv5A==
X-Google-Smtp-Source: APXvYqxpy0zTuVGN0k9wx7bppMf0uZV4HottovyHT9JzOPOE5BX3KMiTBVebdwCE7Kd8fj3tlklhMg==
X-Received: by 2002:a17:906:ca56:: with SMTP id jx22mr19254974ejb.201.1566188357112;
        Sun, 18 Aug 2019 21:19:17 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id v13sm2552416edr.38.2019.08.18.21.19.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2019 21:19:16 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id v15so330106wml.0
        for <linux-media@vger.kernel.org>; Sun, 18 Aug 2019 21:19:16 -0700 (PDT)
X-Received: by 2002:a1c:cf88:: with SMTP id f130mr8561253wmg.10.1566188356079;
 Sun, 18 Aug 2019 21:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190725030602.GA13200@hari-Inspiron-1545> <20190725135007.33dc2cd3@collabora.com>
 <CAAFQd5AOCCoN1F=_WqQaMrttjotpNo7pc8irhkLQNy9C=WjC1A@mail.gmail.com>
In-Reply-To: <CAAFQd5AOCCoN1F=_WqQaMrttjotpNo7pc8irhkLQNy9C=WjC1A@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 19 Aug 2019 13:19:04 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D=5=2B_y1=z-+6O9R0ibijtmr4iff+xUGzNc8S1vEveQ@mail.gmail.com>
Message-ID: <CAAFQd5D=5=2B_y1=z-+6O9R0ibijtmr4iff+xUGzNc8S1vEveQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: hantro: Remove call to memset after dma_alloc_coherent
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Hariprasad Kelam <hariprasad.kelam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        ZhiChao Yu <zhichao.yu@rock-chips.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 19, 2019 at 1:17 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Hans,
>
> On Thu, Jul 25, 2019 at 8:50 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Thu, 25 Jul 2019 08:36:02 +0530
> > Hariprasad Kelam <hariprasad.kelam@gmail.com> wrote:
> >
> > > fix below issue reported by coccicheck
> > > /drivers/staging/media/hantro/hantro_vp8.c:149:16-34: WARNING:
> > > dma_alloc_coherent use in aux_buf -> cpu already zeroes out memory,  so
> > > memset is not needed
> > >
> > > Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> >
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> >
> > > ---
> > >  drivers/staging/media/hantro/hantro_vp8.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/hantro/hantro_vp8.c b/drivers/staging/media/hantro/hantro_vp8.c
> > > index 66c4533..363ddda 100644
> > > --- a/drivers/staging/media/hantro/hantro_vp8.c
> > > +++ b/drivers/staging/media/hantro/hantro_vp8.c
> > > @@ -151,8 +151,6 @@ int hantro_vp8_dec_init(struct hantro_ctx *ctx)
> > >       if (!aux_buf->cpu)
> > >               return -ENOMEM;
> > >
> > > -     memset(aux_buf->cpu, 0, aux_buf->size);
> > > -
> > >       /*
> > >        * Allocate probability table buffer,
> > >        * total 1208 bytes, 4K page is far enough.
> >
>
> Is this something you will pick to your tree?

Ah, sorry, this is already applied. Not sure why searching for it the
first time didn't show anything. I guess I need to start repeating my
searches by default. Sorry for the noise.

Best regards,
Tomasz
