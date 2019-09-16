Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8797DB3E5B
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 18:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732072AbfIPQCp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 12:02:45 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38527 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731937AbfIPQCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 12:02:45 -0400
Received: by mail-ot1-f65.google.com with SMTP id h17so317981otn.5;
        Mon, 16 Sep 2019 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DIzjw3IeSHDKWiLDD7SWp2puD5QNKXByzpUoQtfmTHw=;
        b=Vtu8Ti+GX+9VdQ0WPwqKq128F1saRKZySXg/B8sTljkBZY/KpXSKWwyt6ptzGDAVbp
         OV0OHQFcCYd6nrsvEXEod4SjtmSU1MD0VhBO91aoxcUU1VK8UM/O7JCrxk5XKAR+yrPo
         BkjNlVcuI9rtVd73uNr+9ANnRKaHmXEstyT1kBdOgHbZZN0Jc1KA2PubOE2Pk4kBsHa7
         7nz046EWVACQ//s1lxgRXE80rcc06tJlwe7obIiNKdUfkm1PpZGCVc00c1GmgKTAUij/
         +Z+iQoXcWB5eqX+Yr+C47ijCGIql/J6NyKLnXGxH7hqOVywH501rNi/CGw5O083AXA/S
         viVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DIzjw3IeSHDKWiLDD7SWp2puD5QNKXByzpUoQtfmTHw=;
        b=IbLMpv8wQ4yWDVs67QUPy8KJwMOrb7H8/90HiLyKX3RRmv2T7Tagd4mzcWUPLRyBDN
         ZlGRzn7U8tB2H4gsOcIgbn8aD1cYHr//O4lHw0h3y8qp3U3SF9Pnmc312IfQWUQeGZDK
         CAM3MAcVlGy3DyzXVbQztdVOxD9490TPQ4iSfa+5TEfsX/GGdvgN147+ovG48lwKr27i
         kZ+CzxLzTrrddzBcikRRaHPzbTYr6e7isHBBGTD1MYao+5fkbbK5j0BLqkG4TF7pDxo1
         e27klmxsJ/3aN/3cO/de5yZVFEhaFkYWjfEANmHl+dbSqaM3nYtPprU9oaDbbqLVz9CT
         TCVQ==
X-Gm-Message-State: APjAAAWizt2qnpJoWirG+q6BRrtKrfWmsirAueKdgn+ctwijYUSBjdmY
        Ldxr7RJeJch4ecVJud938+4BxX17Aen6DJAKzOw=
X-Google-Smtp-Source: APXvYqw98ZOwyQeKoPkv4sLNxSOofT0MnSA9ib1WASg6JugOWr55F8MuBsIiFBaCgToeKVJSN48USeBX0xcnSR2kkBU=
X-Received: by 2002:a9d:61d3:: with SMTP id h19mr168362otk.325.1568649762768;
 Mon, 16 Sep 2019 09:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190909162743.30114-1-bparrot@ti.com> <20190909162743.30114-6-bparrot@ti.com>
 <CA+V-a8ub2rjkp0WyUDV8EKnvqR=jCbCdxGzeeNas2APyiJdsYg@mail.gmail.com> <20190916145356.wddnnl3kk2awmbf4@ti.com>
In-Reply-To: <20190916145356.wddnnl3kk2awmbf4@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 16 Sep 2019 17:02:16 +0100
Message-ID: <CA+V-a8t0ukJ9zkz1yLaReQzMBpcN4o1182ao4OQSyCgEu3M_VQ@mail.gmail.com>
Subject: Re: [Patch 05/13] media: am437x-vpfe: Streamlined vb2 buffer cleanup
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 16, 2019 at 3:51 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Lad, Prabhakar <prabhakar.csengg@gmail.com> wrote on Mon [2019-Sep-16 09:00:03 +0100]:
> > Hi Benoit,
> >
> > Thank you for the patch.
> >
> > On Mon, Sep 9, 2019 at 5:26 PM Benoit Parrot <bparrot@ti.com> wrote:
> > >
> > > Returning queued vb2 buffers back to user space is a common
> > > task best handled by a helper function.
> > >
> > > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > > ---
> > >  drivers/media/platform/am437x/am437x-vpfe.c | 54 ++++++++++-----------
> > >  1 file changed, 26 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> > > index 3a8ad9bdf283..52f7fc6e11dd 100644
> > > --- a/drivers/media/platform/am437x/am437x-vpfe.c
> > > +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> > > @@ -1949,6 +1949,29 @@ static void vpfe_buffer_queue(struct vb2_buffer *vb)
> > >         spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
> > >  }
> > >
> > > +static void vpfe_return_all_buffers(struct vpfe_device *vpfe,
> > > +                                   enum vb2_buffer_state state)
> > > +{
> > > +       struct vpfe_cap_buffer *buf, *node;
> > > +       unsigned long flags;
> > > +
> > > +       spin_lock_irqsave(&vpfe->dma_queue_lock, flags);
> > > +       list_for_each_entry_safe(buf, node, &vpfe->dma_queue, list) {
> > > +               vb2_buffer_done(&buf->vb.vb2_buf, state);
> > > +               list_del(&buf->list);
> > > +       }
> > > +
> > > +       if (vpfe->cur_frm)
> > > +               vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf, state);
> > > +
> > > +       if (vpfe->next_frm && vpfe->next_frm != vpfe->cur_frm)
> > > +               vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf, state);
> > > +
> > > +       vpfe->cur_frm = NULL;
> > > +       vpfe->next_frm = NULL;
> > > +       spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
> > > +}
> > > +
> > >  /*
> > >   * vpfe_start_streaming : Starts the DMA engine for streaming
> > >   * @vb: ptr to vb2_buffer
> > > @@ -1957,7 +1980,6 @@ static void vpfe_buffer_queue(struct vb2_buffer *vb)
> > >  static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
> > >  {
> > >         struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
> > > -       struct vpfe_cap_buffer *buf, *tmp;
> > >         struct vpfe_subdev_info *sdinfo;
> > >         unsigned long flags;
> > >         unsigned long addr;
> > > @@ -2003,11 +2025,8 @@ static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
> > >         return 0;
> > >
> > >  err:
> > > -       list_for_each_entry_safe(buf, tmp, &vpfe->dma_queue, list) {
> > > -               list_del(&buf->list);
> > > -               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
> > > -       }
> > > -
> > > +       vpfe_return_all_buffers(vpfe, VB2_BUF_STATE_QUEUED);
> > > +       vpfe_pcr_enable(&vpfe->ccdc, 0);
> >
> > please create a seperate patch for the above change.
>
> You mean a separate patch just for the vpfe_pcr_enable() call?
>
yes, as the call to vpfe_pcr_enable() is to disable the CCDC and it
doesn't match the patch
description.

Cheers,
--Prabhakar Lad
