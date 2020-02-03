Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F671503D1
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 11:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbgBCKE7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 05:04:59 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38896 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgBCKE6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 05:04:58 -0500
Received: by mail-ed1-f68.google.com with SMTP id p23so15340474edr.5
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 02:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8SHaJ44CIqYv7UPqeEgaIYIZnbMshOxt9MjhG/l3K1U=;
        b=OCwDdpZltO0a/e3YtS+sBfapkLCZqbTqq+scqhmWAT10AD7xcqudPMaLEH2HUvo/sz
         DLirtJNrt+hkiQpzdppEvbkZIIFkd5PSMoouUjq+bWeOYK+ggUbdFxP7KAIUUQwWk08o
         M6oIIXsDKOhjisTXO/CV6DIRgFclmbKa8NXwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8SHaJ44CIqYv7UPqeEgaIYIZnbMshOxt9MjhG/l3K1U=;
        b=CCCTPfSleF02YXBPLlgVGTYKe5kNhDAxrYs4CzRDXmR56qI6/rviVNHMd4jEC+Vtd8
         ZZF5gBWul1iVNlgSI7J/ynnxFnTk0d99KHUSJ9nCVz0+2n4SgMFoh/T0j8O54rKHGwGZ
         jONJlNG8ZiBMz65YF04Kz5upvOWGkqeA5x+tjQDoMSwUWZ79ive4SHqzsEQqx2H7qKzh
         nMw8liC0afeji+uQJa7VC97e+pVNVq1/Mhfw4SM+NP16qODykZH+xdZCD/Ofz0Fa5l4B
         m5bYkNhU9dMdscIFSXEr0AOH3two2DT7R8MC3WolIRQ7/syy8DEwjBktvUP8I6WnTCb/
         Z0Sw==
X-Gm-Message-State: APjAAAVCI8u6pI0o25NcpWg0USNPXtgYoK3xR1Q2MAPggJb4Kqpiu7a8
        cMmFwB1gAVP1ttgbg9dJAMYzp0SI1nd7Qw==
X-Google-Smtp-Source: APXvYqwAUEjWAhUmfOF70DbLPXUPo9Vm+/sPPlsqv8k+8e2DTtbQbnZl8x+Sz3dJlxu2KNZIFHnf7g==
X-Received: by 2002:a50:fb08:: with SMTP id d8mr11149568edq.79.1580724294412;
        Mon, 03 Feb 2020 02:04:54 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id u9sm994773ejj.49.2020.02.03.02.04.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 02:04:54 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id k11so17118999wrd.9
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 02:04:53 -0800 (PST)
X-Received: by 2002:adf:f103:: with SMTP id r3mr14462383wro.295.1580724292510;
 Mon, 03 Feb 2020 02:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-13-senozhatsky@chromium.org> <1c5198dc-db4e-47d6-0d8b-259fbbb6372f@xs4all.nl>
 <CAAFQd5DN0FSJ=pXG3J32AXocnbkR+AB8yKKDk0tZS4s7K04Z9Q@mail.gmail.com>
 <560ba621-5396-1ea9-625e-a9f83622e052@xs4all.nl> <CAAFQd5D27xaKhxg8UuPH6XXdzgBBsCeDL8wYw37r6AK+6sWcbg@mail.gmail.com>
 <c23618a9-4bf8-1d9a-6e52-d616c79ff289@xs4all.nl>
In-Reply-To: <c23618a9-4bf8-1d9a-6e52-d616c79ff289@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 3 Feb 2020 19:04:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BGA-mnirgwQJP_UHkNzpVvf19xeRu-n7GLQci8nYGB2A@mail.gmail.com>
Message-ID: <CAAFQd5BGA-mnirgwQJP_UHkNzpVvf19xeRu-n7GLQci8nYGB2A@mail.gmail.com>
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

On Thu, Jan 30, 2020 at 9:18 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 1/30/20 12:02 PM, Tomasz Figa wrote:
> > On Tue, Jan 28, 2020 at 5:36 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 1/28/20 5:38 AM, Tomasz Figa wrote:
> >>> On Fri, Jan 10, 2020 at 7:13 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>>>
> >>>> On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> >>>>> Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
> >>>>> callbacks for cache synchronisation on exported buffers.
> >>>>>
> >>>>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> >>>>> ---
> >>>>>  .../media/common/videobuf2/videobuf2-dma-sg.c | 22 +++++++++++++++++++
> >>>>>  1 file changed, 22 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >>>>> index 6db60e9d5183..bfc99a0cb7b9 100644
> >>>>> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >>>>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >>>>> @@ -470,6 +470,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
> >>>>>       vb2_dma_sg_put(dbuf->priv);
> >>>>>  }
> >>>>>
> >>>>
> >>>> There is no corresponding vb2_sg_buffer_consistent function here.
> >>>>
> >>>> Looking more closely I see that vb2_dma_sg_alloc doesn't pass the dma_attrs
> >>>> argument to dma_map_sg_attrs, thus V4L2_FLAG_MEMORY_NON_CONSISTENT has no
> >>>> effect on dma-sg buffers.
> >>>
> >>> videobuf2-dma-sg allocates the memory using the page allocator
> >>> directly, which means that there is no memory consistency guarantee.
> >>>
> >>>>
> >>>> Is there a reason why dma_attrs isn't passed on to dma_map_sg_attrs()?
> >>>>
> >>>
> >>> V4L2_FLAG_MEMORY_NON_CONSISTENT is a flag for dma_alloc_attrs(). It
> >>> isn't supposed to do anything for dma_map_sg_attrs(), which is only
> >>> supposed to create the device (e.g. IOMMU) mapping for already
> >>> allocated memory.
> >>
> >> Ah, right.
> >>
> >> But could vb2_dma_sg_alloc_compacted() be modified so that is uses
> >> dma_alloc_attrs() instead of alloc_pages()? Sorry, that might be a stupid
> >> question, I'm not an expert in this area. All I know is that I hate inconsistent
> >> APIs where something works for one thing, but not another.
> >>
> >
> > dma_alloc_attrs() would allocate contiguous memory, which kind of goes
> > against the vb2_dma_sg allocator idea. Technically we could call it N
> > times with size = 1 page to achieve what we want, but is this really
> > what we want?
> >
> > Given that vb2_dma_sg has always been returning non-consistent memory,
> > do we have any good reason to add consistent memory to it? If so,
> > perhaps we could still do that in an incremental patch, to avoid
> > complicating this already complex series? :)
>
> I very much agree with that. But this should be very clearly documented.
> Should V4L2_CAP_MEMORY_NON_CONSISTENT always be set in this case?
>

Yes, IMHO that would make sense. My understanding is that currently
the consistency of allocated memory is unspecified, so it can be
either. With V4L2_FLAG_MEMORY_NON_CONSISTENT, the userspace can
explicitly ask for inconsistent memory.

Moreover, I'd vote for setting V4L2_CAP_MEMORY_NON_CONSISTENT when
V4L2_FLAG_MEMORY_NON_CONSISTENT is guaranteed to return inconsistent
memory to avoid "optional" features or "hints" without guaranteed
behavior.

> Regards,
>
>         Hans
>
> >
> > Best regards,
> > Tomasz
> >
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>>> I suspect it was just laziness in the past, and that it should be wired
> >>>> up, just as for dma-contig.
> >>>>
> >>>> Regards,
> >>>>
> >>>>         Hans
> >>>>
> >>>>> +static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> >>>>> +                                     enum dma_data_direction direction)
> >>>>> +{
> >>>>> +     struct vb2_dma_sg_buf *buf = dbuf->priv;
> >>>>> +     struct sg_table *sgt = buf->dma_sgt;
> >>>>> +
> >>>>> +     dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
> >>>>> +                                     enum dma_data_direction direction)
> >>>>> +{
> >>>>> +     struct vb2_dma_sg_buf *buf = dbuf->priv;
> >>>>> +     struct sg_table *sgt = buf->dma_sgt;
> >>>>> +
> >>>>> +     dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
> >>>>> +     return 0;
> >>>>> +}
> >>>>> +
> >>>>>  static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
> >>>>>  {
> >>>>>       struct vb2_dma_sg_buf *buf = dbuf->priv;
> >>>>> @@ -488,6 +508,8 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
> >>>>>       .detach = vb2_dma_sg_dmabuf_ops_detach,
> >>>>>       .map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
> >>>>>       .unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
> >>>>> +     .begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
> >>>>> +     .end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
> >>>>>       .vmap = vb2_dma_sg_dmabuf_ops_vmap,
> >>>>>       .mmap = vb2_dma_sg_dmabuf_ops_mmap,
> >>>>>       .release = vb2_dma_sg_dmabuf_ops_release,
> >>>>>
> >>>>
> >>
>
