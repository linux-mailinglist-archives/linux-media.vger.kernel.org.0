Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 009C53837D
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 06:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbfFGEdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 00:33:05 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40218 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfFGEdE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 00:33:04 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so515042wmj.5
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 21:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lvNzY6of/RfuyYimWmZLoLNpH/F70K7zsNah8Ikxwtk=;
        b=FUDZfTD8S5R9eTS03JqhgKqywQRPtbdLz+0Xn4dGSiXvtSEYL2Sh3KPe6p+h7v/sxJ
         omcZ8gAkf710RJdPZ1P6/wyvhjMaVNYV8aRui3L70Dn1C77uWxVIcIvz+S07lzHL0/vJ
         VV84B8kqxH3T2PmzfULP/9fvj22HnZc0ravFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lvNzY6of/RfuyYimWmZLoLNpH/F70K7zsNah8Ikxwtk=;
        b=FzaL8rick1DgMQ4uJjuG7TdMeq0K1Dgx8rzZ9tORFWu2se64/lZKUzEggIb98anVDN
         v7DitWeeTS1acJMW6quj7+Bxb7CcenL1bWN/bhFGFTd/kgdfKJKTb9z/JrmvUPkFBdIK
         ci2QzkeB2JwW3n15Wia82j02JNeF3R7UxHWn/U+w2KFFQdmSTKcFzcymoKWGCuo9Ai6o
         ChojiN+3HPQbXi7kxd6fYXtQtVbp/R+LGRNmtUx5dHJPICiGStoUmD33MPAKntby/7Tr
         apdHS+Gbqyqoc2s1Os+AiEvl6sKENXfBY5QCcOwjyRY37P1lmga6HKen9SmUW8tVmqip
         GQAA==
X-Gm-Message-State: APjAAAVKnw1W5YP1yEZH2qh4Aq0hRnBiaOYT6jHwlceSLzxo6IzQjKU4
        FHhMogRRWDV7UCIpeCqQ1dOuw1U0c/zD8OWDJLG/SA==
X-Google-Smtp-Source: APXvYqyKmaAMp9Tsh1xi1P3KSmKM/MqGfSBDO4YmqJRAGwaUH8JbJg3fgNqxTbhXuhnWKaUEjl/hKDINuCltTJu9IWE=
X-Received: by 2002:a1c:ab42:: with SMTP id u63mr2126038wme.130.1559881982528;
 Thu, 06 Jun 2019 21:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190228071943.13072-1-l.stach@pengutronix.de> <e0f69333-76e2-f336-a557-b591bb786605@xs4all.nl>
In-Reply-To: <e0f69333-76e2-f336-a557-b591bb786605@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 7 Jun 2019 13:32:51 +0900
Message-ID: <CAHD77H=RB9eXdsbvTr_B2ekZR6F-OCJG1wg1umHgY5Ta9KJrYw@mail.gmail.com>
Subject: Re: [PATCH] media: vb2-dc: skip CPU sync in map/unmap dma_buf
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Lucas Stach <l.stach@pengutronix.de>
Cc:     Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sasha Hauer <kernel@pengutronix.de>,
        patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Lucas,

On Fri, May 3, 2019 at 9:38 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Lucas,
>
> As you mentioned there hasn't been any further review comments, so
> it is fair not to postpone this.
>

Sorry for being late to the party. I didn't notice this patch before.
(Perhaps it could be worth adding me as a reviewer to the MAINTAINERS
entries for these parts of the media subsystem?)

> However, I have one new review comment myself that I would like to
> see addressed in a v2 before I merge this for 5.3:
>
> On 2/28/19 8:19 AM, Lucas Stach wrote:
> > This is rougly equivalent to ca0e68e21aae (drm/prime: skip CPU sync
> > in map/unmap dma_buf). The contig memory allocated is already device
> > coherent memory, so there is no point in doing a CPU sync when
> > mapping it to another device. Also most importers currently cache
> > the mapping so the CPU sync would only happen on the first import.
> > With that in mind we are better off with not pretending to do a
> > cache synchronization at all.
> >
> > This gets rid of a lot of CPU overhead in uses where those dma-bufs
> > are regularily imported and detached again, like Weston is currently
> > doing in the DRM compositor.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > index aff0ab7bf83d..d38f097c14ae 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > @@ -273,8 +273,8 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
> >
> >       /* release the scatterlist cache */
> >       if (attach->dma_dir != DMA_NONE)
> > -             dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> > -                     attach->dma_dir);
> > +             dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> > +                     attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>
> Please add comments here...
>
> >       sg_free_table(sgt);
> >       kfree(attach);
> >       db_attach->priv = NULL;
> > @@ -305,8 +305,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
> >       }
> >
> >       /* mapping to the client with new direction */
> > -     sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> > -                             dma_dir);
> > +     sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> > +                             dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>
> ... and here to explain why you can skip the cpu sync. The comment in ops_detach
> can refer to the comment in ops_map, so there is no need to give the full
> explanation in two places.
>
> It is not obvious that you can skip the CPU sync, so an explanation is helpful.

The change makes sense indeed, thanks. With Hans' suggestion addressed:

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

In the bigger perspective, the DMA-buf and DMA API "map" semantics are
kind of confusing themselves, because they imply "sync" by default. I
wonder what it would take to just completely split "sync" from "map"
in both APIs. It's even worse with DMA-buf, because you cannot ask
dma_buf_map_attachment() not to skip the sync for you, nor you cannot
sync again without unmapping and mapping again...

Best regards,
Tomasz
