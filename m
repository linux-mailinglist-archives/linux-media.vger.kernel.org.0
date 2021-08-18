Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B243F0051
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 11:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232638AbhHRJXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 05:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbhHRJWO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 05:22:14 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A67C061796
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 02:20:56 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u3so3671366ejz.1
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 02:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PoOTSY4e/N6XTP41frejZoX11mBfIpeON8K+FJ/LM7o=;
        b=U1ccjTf9lEyQvKQIuBK+Dl6b1HPvgOkglfglVV5ThcfcTOe4h76ipU82oWLbSuSf+o
         tFXirEUsYFgEOKKTKschypRJ2q6ObekeXw0i1xiWSr+TbluX4g+DNOC34OqlZDlxFmag
         MZL3CprKrFCcHhkG7N9vdYE0pcXyMQQuqV+YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PoOTSY4e/N6XTP41frejZoX11mBfIpeON8K+FJ/LM7o=;
        b=Hn6KN9Ja8R9569Vd65W8+4sIIh2jMGamnx3XrGQ3TKLRpHFLJZ+JzaSr36c63kGcM0
         bFP4yTJ8JDfXfpIVlxh+OEetddTTHzMFm4hkDzGs95MNXZZVvmXItrUVXM7Iafaov3PS
         4oFSgcrb5SCbCoaFTypyeNSEDVu7svsZITQqzbq2V/qnpMEhkF66DHjNfr+KB8P6Xsft
         4pgxiIBrOEp8JlrXtcAkDAOQr/wvsj08/vt+fka0gHo6bXwhRrtCooIsLZsIldeXF4zp
         KMGNENUGThTJHJH27kXLolNz1bxigHI9XB6+4IQAvxXEIHB2a1rfl63pQVM0wrxBjhio
         NnhQ==
X-Gm-Message-State: AOAM532bkq9zlHUJzzpfKzSobyw7FPUOARM0tiV0zyjn619kEGHBwvD7
        EGYBOLJBePxmzHDGk7TBqwbs3dhCWwqRGw==
X-Google-Smtp-Source: ABdhPJz21HvvIef7QoFrlisY9jKCzl5uWHO0JCvTmgVjm5bWfWHd2tdz0q/oqPv7HCxdzK9Z+BCzXQ==
X-Received: by 2002:a17:906:17c5:: with SMTP id u5mr8887031eje.326.1629278454095;
        Wed, 18 Aug 2021 02:20:54 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id gh23sm1791574ejb.27.2021.08.18.02.20.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 02:20:53 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id x10so2380504wrt.8
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 02:20:53 -0700 (PDT)
X-Received: by 2002:a05:6000:1808:: with SMTP id m8mr9325235wrh.192.1629278452675;
 Wed, 18 Aug 2021 02:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-9-senozhatsky@chromium.org> <fd1e8bbe-4cbe-9586-7c8f-0896af043d4a@xs4all.nl>
 <YRukCziknzz/3/sV@google.com>
In-Reply-To: <YRukCziknzz/3/sV@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 18 Aug 2021 18:20:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BA4M89nQThm4gQgLp-LWzFfwnYw2HPyAs2QgUVn-ZLNQ@mail.gmail.com>
Message-ID: <CAAFQd5BA4M89nQThm4gQgLp-LWzFfwnYw2HPyAs2QgUVn-ZLNQ@mail.gmail.com>
Subject: Re: [PATCHv4 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 17, 2021 at 8:57 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Hi,
>
> On (21/08/03 12:15), Hans Verkuil wrote:
> > >  static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
> > >  {
> > >     struct vb2_dc_buf *buf = buf_priv;
> > > -   struct dma_buf_map map;
> > > -   int ret;
> > >
> > > -   if (!buf->vaddr && buf->db_attach) {
> > > -           ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
> > > -           buf->vaddr = ret ? NULL : map.vaddr;
> > > +   if (buf->vaddr)
> > > +           return buf->vaddr;
> > > +
> > > +   if (buf->db_attach) {
> > > +           struct dma_buf_map map;
> > > +
> > > +           if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
> > > +                   buf->vaddr = map.vaddr;
> > > +
> > > +           return buf->vaddr;
> > >     }
> > >
> > > +   if (!buf->coherent_mem)
> > > +           buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
> > > +                                               buf->dma_sgt);
> > >     return buf->vaddr;
> > >  }
> >
> > This function really needs a bunch of comments.
> >
> > What I want to see here specifically is under which circumstances this function
> > can return NULL.
> >
> > - dma_buf_vmap returns an error
> > - for non-coherent memory dma_vmap_noncontiguous returns an error
> > - coherent memory with DMA_ATTR_NO_KERNEL_MAPPING set.
>
> OK, I added some comments.
>
> > In the latter case, if a buffer with coherent memory and DMA_ATTR_NO_KERNEL_MAPPING
> > is exported as a dma_buf, and dma_buf_vmap is called by the importer of this dma-buf,
> > what happens then? I think that in that case dma_buf_vmap should return an error?
>
> Should we error out in vb2_dc_vaddr() in this case?

Yes, because there is no way to create a kernel mapping for buffer
allocated with dma_alloc_coherent() post-factum. Of course it's not
the case for dma_alloc_noncontiguous() for which we can create the
kernel mapping on demand.

>
> ---
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index d4089d0b5ec5..e1d8ae1548fa 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -102,6 +102,9 @@ static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
>         if (buf->db_attach) {
>                 struct dma_buf_map map;
>
> +               if (WARN_ON(buf->attrs & DMA_ATTR_NO_KERNEL_MAPPING))
> +                       return NULL;
> +

Why here? It's the case for buffers imported _into_ vb2, not exported
from vb2 and imported to other users.

>                 if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
>                         buf->vaddr = map.vaddr;
>
>
> ---
>
>
> [..]
> > > @@ -362,7 +451,7 @@ static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
> > >  {
> > >     struct vb2_dc_buf *buf = dbuf->priv;
> > >
> > > -   dma_buf_map_set_vaddr(map, buf->vaddr);
> > > +   dma_buf_map_set_vaddr(map, vb2_dc_vaddr(buf->vb, buf));
> >
> > vb2_dc_vaddr() can return NULL, shouldn't this function return an error in that case?
>
> Done, thanks.
>
> > BTW, looking at where vb2_plane_vaddr() is called in drivers I notice that most (all?)
> > drivers do not check for NULL. Somewhat scary, to be honest. That's a separate issue, though.
>
> I may have some time in the future and can add missing if-s to the
> drivers.
