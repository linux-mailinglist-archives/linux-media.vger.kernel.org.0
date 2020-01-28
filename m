Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90C5A14AEB8
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 05:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgA1EjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 23:39:04 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35897 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgA1EjE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 23:39:04 -0500
Received: by mail-ed1-f67.google.com with SMTP id j17so13278949edp.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2020 20:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oAFKKUbjn4q+w4IFCE+2ZYtzrDlWGmX9O+mEmG7900M=;
        b=EhJHNf5NF9OU2ztfTNy4zoe2jKSU7opQPS1xvdHmcF7O207hYIZlYPI0Xho0eX7QsH
         iip007AxmyTGPuO38NtELWs+/4ZmTWN/EoOEKEEmb35XTyFOqLaX3keTnzR1Jc29vKZf
         hlBWgWSeyf1hmbYCDWJPidIkcBHdzeodeCHzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oAFKKUbjn4q+w4IFCE+2ZYtzrDlWGmX9O+mEmG7900M=;
        b=FLaoCsy1royQJLJB/YGbKIzpz6jnC+Sqn/LEhaCCTIvuFvzCPRcOCcMUePTn2D7IHi
         PPzsOuY6wSEjxPNXAro7WDTJsQZLFxL3/OEEEl3dqOpektCPNI+iAIKzYV1xubKDzqWJ
         1RDtszbwhDGoowjT9QCdPtYs62YdeHQXzcHTClAInPBJ1B7WNxcpHBxrJE3gxuFCmcII
         nP5WPpFAV8iWR2GPG9tc94SmeNBRJXJUn+SCt2PcneV2E6x22fmNrGrHsK75uQOF4ido
         7YO99JEt9Ytqk/tEVNQnWTX9pts41TDh3wt+CLtvgSOKMQXExJKh3dycLL1Etm80i90n
         +SfQ==
X-Gm-Message-State: APjAAAUxTDjjy5/wsRJ9Ufp+Aeon3qDxkJ6yo9rhhAAWKa3CKoC7Xiuh
        yc7Q5YoGeiXOC5eDiFB0OsFYXgWPva3KQA==
X-Google-Smtp-Source: APXvYqwGVPrCFnQ9S/kIOTMlX88yfTOa2kFBByB6MXsDEDDO8u0D0uHPQ2Rc9jGulDK7qhm6oWGsTQ==
X-Received: by 2002:a50:d59b:: with SMTP id v27mr1638164edi.169.1580186341623;
        Mon, 27 Jan 2020 20:39:01 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id r7sm383862eds.32.2020.01.27.20.39.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 20:39:00 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id c84so1013754wme.4
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2020 20:39:00 -0800 (PST)
X-Received: by 2002:a1c:9a8d:: with SMTP id c135mr2228590wme.183.1580186340098;
 Mon, 27 Jan 2020 20:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-13-senozhatsky@chromium.org> <1c5198dc-db4e-47d6-0d8b-259fbbb6372f@xs4all.nl>
In-Reply-To: <1c5198dc-db4e-47d6-0d8b-259fbbb6372f@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 28 Jan 2020 13:38:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DN0FSJ=pXG3J32AXocnbkR+AB8yKKDk0tZS4s7K04Z9Q@mail.gmail.com>
Message-ID: <CAAFQd5DN0FSJ=pXG3J32AXocnbkR+AB8yKKDk0tZS4s7K04Z9Q@mail.gmail.com>
Subject: Re: [RFC][PATCH 12/15] videobuf2: add begin/end cpu_access callbacks
 to dma-sg
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 10, 2020 at 7:13 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> > Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
> > callbacks for cache synchronisation on exported buffers.
> >
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >  .../media/common/videobuf2/videobuf2-dma-sg.c | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > index 6db60e9d5183..bfc99a0cb7b9 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > @@ -470,6 +470,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
> >       vb2_dma_sg_put(dbuf->priv);
> >  }
> >
>
> There is no corresponding vb2_sg_buffer_consistent function here.
>
> Looking more closely I see that vb2_dma_sg_alloc doesn't pass the dma_attrs
> argument to dma_map_sg_attrs, thus V4L2_FLAG_MEMORY_NON_CONSISTENT has no
> effect on dma-sg buffers.

videobuf2-dma-sg allocates the memory using the page allocator
directly, which means that there is no memory consistency guarantee.

>
> Is there a reason why dma_attrs isn't passed on to dma_map_sg_attrs()?
>

V4L2_FLAG_MEMORY_NON_CONSISTENT is a flag for dma_alloc_attrs(). It
isn't supposed to do anything for dma_map_sg_attrs(), which is only
supposed to create the device (e.g. IOMMU) mapping for already
allocated memory.

> I suspect it was just laziness in the past, and that it should be wired
> up, just as for dma-contig.
>
> Regards,
>
>         Hans
>
> > +static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> > +                                     enum dma_data_direction direction)
> > +{
> > +     struct vb2_dma_sg_buf *buf = dbuf->priv;
> > +     struct sg_table *sgt = buf->dma_sgt;
> > +
> > +     dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
> > +     return 0;
> > +}
> > +
> > +static int vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
> > +                                     enum dma_data_direction direction)
> > +{
> > +     struct vb2_dma_sg_buf *buf = dbuf->priv;
> > +     struct sg_table *sgt = buf->dma_sgt;
> > +
> > +     dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
> > +     return 0;
> > +}
> > +
> >  static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
> >  {
> >       struct vb2_dma_sg_buf *buf = dbuf->priv;
> > @@ -488,6 +508,8 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
> >       .detach = vb2_dma_sg_dmabuf_ops_detach,
> >       .map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
> >       .unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
> > +     .begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
> > +     .end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
> >       .vmap = vb2_dma_sg_dmabuf_ops_vmap,
> >       .mmap = vb2_dma_sg_dmabuf_ops_mmap,
> >       .release = vb2_dma_sg_dmabuf_ops_release,
> >
>
