Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA56991BC3
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 06:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfHSERT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 00:17:19 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38828 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfHSERT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 00:17:19 -0400
Received: by mail-ed1-f67.google.com with SMTP id r12so376283edo.5
        for <linux-media@vger.kernel.org>; Sun, 18 Aug 2019 21:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IbCA3+sRi1vwFgWGzHijf0NDsTwyWj0F82bl8GeQoNU=;
        b=USNDYhJe3CqyU1LZcyU12zH7sxmglhu2BEaKMXiAvIZQrefa5w3O3Q8q2Fsn4+C2IH
         ghZBxj5+7IGK50lx1569Ey/8qPFUTixmpa2ANwy5fzScNl9aIhN8UPzwaaEcf7McCB3D
         Les7iJtnWTo9FeitxqnGT/OM+twm5a++OaRag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IbCA3+sRi1vwFgWGzHijf0NDsTwyWj0F82bl8GeQoNU=;
        b=h5d5RO2Ggr/44t9p8QRhQnDR5huzcAXNDalK9RheBGKaaBz+BLe9kWglV7ngtVgnz1
         iovwDdCsudkTmAuygv4au82JRWpdSu1jq221kQdR6TXIEvsVTl7JYcZHJcslJpGggh7M
         GdePzmTm7APqJCqKnRImcIT31mYIj+vjQuH4Iil2F1//T7zuIBivHhEg/z0uDnhO3R2J
         hdm8h2/KfewbxUBwezbGah/HIAIlEF90KeMcu4idn9WcB5qePFnsZvXfMsp5o9+gDAoL
         MWcIE///6aUW3GMdsTtWBmWlIfcCnJsPo9M+34B0ngpZiaIc/ckdfz2e1gkwt/Kagnwu
         hd9g==
X-Gm-Message-State: APjAAAUbkzdaXqcyEexf0bWwFZ4PEX1Jc6mFShxjcvvhUBQX65Dj2bFc
        GZIgH8dzGd6MQHmljvhHTUnXQYNzyws5KQ==
X-Google-Smtp-Source: APXvYqwXXPuN3mbXZvduwLtyrlgY+JGO/DxqtiuJBSvFBgBB5AFpmJhTYRbPnCkzZUvaiqbGvzinkA==
X-Received: by 2002:a17:906:3fc7:: with SMTP id k7mr15224204ejj.208.1566188237212;
        Sun, 18 Aug 2019 21:17:17 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id g20sm1687946edp.92.2019.08.18.21.17.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2019 21:17:16 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id v19so330224wmj.5
        for <linux-media@vger.kernel.org>; Sun, 18 Aug 2019 21:17:16 -0700 (PDT)
X-Received: by 2002:a1c:cf88:: with SMTP id f130mr8553542wmg.10.1566188235646;
 Sun, 18 Aug 2019 21:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190725030602.GA13200@hari-Inspiron-1545> <20190725135007.33dc2cd3@collabora.com>
In-Reply-To: <20190725135007.33dc2cd3@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 19 Aug 2019 13:17:04 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AOCCoN1F=_WqQaMrttjotpNo7pc8irhkLQNy9C=WjC1A@mail.gmail.com>
Message-ID: <CAAFQd5AOCCoN1F=_WqQaMrttjotpNo7pc8irhkLQNy9C=WjC1A@mail.gmail.com>
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

Hi Hans,

On Thu, Jul 25, 2019 at 8:50 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 25 Jul 2019 08:36:02 +0530
> Hariprasad Kelam <hariprasad.kelam@gmail.com> wrote:
>
> > fix below issue reported by coccicheck
> > /drivers/staging/media/hantro/hantro_vp8.c:149:16-34: WARNING:
> > dma_alloc_coherent use in aux_buf -> cpu already zeroes out memory,  so
> > memset is not needed
> >
> > Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>
> > ---
> >  drivers/staging/media/hantro/hantro_vp8.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/hantro/hantro_vp8.c b/drivers/staging/media/hantro/hantro_vp8.c
> > index 66c4533..363ddda 100644
> > --- a/drivers/staging/media/hantro/hantro_vp8.c
> > +++ b/drivers/staging/media/hantro/hantro_vp8.c
> > @@ -151,8 +151,6 @@ int hantro_vp8_dec_init(struct hantro_ctx *ctx)
> >       if (!aux_buf->cpu)
> >               return -ENOMEM;
> >
> > -     memset(aux_buf->cpu, 0, aux_buf->size);
> > -
> >       /*
> >        * Allocate probability table buffer,
> >        * total 1208 bytes, 4K page is far enough.
>

Is this something you will pick to your tree?

Best regards,
Tomasz
