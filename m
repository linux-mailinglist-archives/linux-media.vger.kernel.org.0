Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B853D14D96E
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 12:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgA3LCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 06:02:24 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46976 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgA3LCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 06:02:24 -0500
Received: by mail-ed1-f66.google.com with SMTP id m8so3296337edi.13
        for <linux-media@vger.kernel.org>; Thu, 30 Jan 2020 03:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XPAei91bdBKv+rtfq6jeMzyMQEwb+GsA+UNab2GQXWE=;
        b=J6cp/hlWE07Posv7U7HV3Jnsf5Nuvj7k3gxZEy8CJbRquFWEUep1tVJEjz4ziWGovG
         gXXL6hW46/4Z5wKIsLzCtRFq1INamP0SwaO+jO/1qb4iHbnfeELLg4Pfq7astmZilU6E
         KVlSgpTyzH+8ssoYaBryEiWKDQlvJcyvAOw2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XPAei91bdBKv+rtfq6jeMzyMQEwb+GsA+UNab2GQXWE=;
        b=CoZsGCMTq2kGbtapif2RCQdno7a12JnOAjbUEyWnjiSktV91RT9BtOSyRiuzQZ51Dm
         NekS0PKw2jwPTcCn2wk6Ry+RZ/GsyMijUUWulqKzuYGARVRymaHRB5PaKt6lrYHIH/L/
         sfJajcBPJNdPWcNhbM52gjr0VxEQRTWOJSPX4+CxD2/tbW+stv+6Xs7/QSe/YDkXvcQT
         kV1MGzLouNaQzT14Jsx4x6jvHQ7DN6FpT42yCc+ebQh33syShhhvA2wrTUIPtv4BPNJK
         2D7clO/E2iqZRGv4jn46YJCZSr0ATgAtm8ZfhKMgIxy8CCjmbfMPPBBnyYIWMlA/r5AQ
         M+Ow==
X-Gm-Message-State: APjAAAXK1zQ0U4l977WHeNPZOl/DNT3ZjK05ak2dblnTJ3ZxmNPrNxQG
        /4vlj2Bq/nNcktLd5siJ+fkHCNITVjhZrg==
X-Google-Smtp-Source: APXvYqw4xMw0NRDcnAFFA4+NhSn/FSd7ksGYzt/I0fqUqp94i8h9oUw8KdUTQQDH6jIy1AxC5SuoTw==
X-Received: by 2002:a17:906:d7b4:: with SMTP id pk20mr3452894ejb.71.1580382140937;
        Thu, 30 Jan 2020 03:02:20 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id bs4sm432480edb.16.2020.01.30.03.02.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2020 03:02:18 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id g1so3273149wmh.4
        for <linux-media@vger.kernel.org>; Thu, 30 Jan 2020 03:02:17 -0800 (PST)
X-Received: by 2002:a1c:9a8d:: with SMTP id c135mr4706199wme.183.1580382136375;
 Thu, 30 Jan 2020 03:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-13-senozhatsky@chromium.org> <1c5198dc-db4e-47d6-0d8b-259fbbb6372f@xs4all.nl>
 <CAAFQd5DN0FSJ=pXG3J32AXocnbkR+AB8yKKDk0tZS4s7K04Z9Q@mail.gmail.com> <560ba621-5396-1ea9-625e-a9f83622e052@xs4all.nl>
In-Reply-To: <560ba621-5396-1ea9-625e-a9f83622e052@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 30 Jan 2020 20:02:04 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D27xaKhxg8UuPH6XXdzgBBsCeDL8wYw37r6AK+6sWcbg@mail.gmail.com>
Message-ID: <CAAFQd5D27xaKhxg8UuPH6XXdzgBBsCeDL8wYw37r6AK+6sWcbg@mail.gmail.com>
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

On Tue, Jan 28, 2020 at 5:36 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 1/28/20 5:38 AM, Tomasz Figa wrote:
> > On Fri, Jan 10, 2020 at 7:13 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> >>> Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
> >>> callbacks for cache synchronisation on exported buffers.
> >>>
> >>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> >>> ---
> >>>  .../media/common/videobuf2/videobuf2-dma-sg.c | 22 +++++++++++++++++++
> >>>  1 file changed, 22 insertions(+)
> >>>
> >>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >>> index 6db60e9d5183..bfc99a0cb7b9 100644
> >>> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> >>> @@ -470,6 +470,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
> >>>       vb2_dma_sg_put(dbuf->priv);
> >>>  }
> >>>
> >>
> >> There is no corresponding vb2_sg_buffer_consistent function here.
> >>
> >> Looking more closely I see that vb2_dma_sg_alloc doesn't pass the dma_attrs
> >> argument to dma_map_sg_attrs, thus V4L2_FLAG_MEMORY_NON_CONSISTENT has no
> >> effect on dma-sg buffers.
> >
> > videobuf2-dma-sg allocates the memory using the page allocator
> > directly, which means that there is no memory consistency guarantee.
> >
> >>
> >> Is there a reason why dma_attrs isn't passed on to dma_map_sg_attrs()?
> >>
> >
> > V4L2_FLAG_MEMORY_NON_CONSISTENT is a flag for dma_alloc_attrs(). It
> > isn't supposed to do anything for dma_map_sg_attrs(), which is only
> > supposed to create the device (e.g. IOMMU) mapping for already
> > allocated memory.
>
> Ah, right.
>
> But could vb2_dma_sg_alloc_compacted() be modified so that is uses
> dma_alloc_attrs() instead of alloc_pages()? Sorry, that might be a stupid
> question, I'm not an expert in this area. All I know is that I hate inconsistent
> APIs where something works for one thing, but not another.
>

dma_alloc_attrs() would allocate contiguous memory, which kind of goes
against the vb2_dma_sg allocator idea. Technically we could call it N
times with size = 1 page to achieve what we want, but is this really
what we want?

Given that vb2_dma_sg has always been returning non-consistent memory,
do we have any good reason to add consistent memory to it? If so,
perhaps we could still do that in an incremental patch, to avoid
complicating this already complex series? :)

Best regards,
Tomasz

> Regards,
>
>         Hans
>
> >
> >> I suspect it was just laziness in the past, and that it should be wired
> >> up, just as for dma-contig.
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>> +static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> >>> +                                     enum dma_data_direction direction)
> >>> +{
> >>> +     struct vb2_dma_sg_buf *buf = dbuf->priv;
> >>> +     struct sg_table *sgt = buf->dma_sgt;
> >>> +
> >>> +     dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
> >>> +                                     enum dma_data_direction direction)
> >>> +{
> >>> +     struct vb2_dma_sg_buf *buf = dbuf->priv;
> >>> +     struct sg_table *sgt = buf->dma_sgt;
> >>> +
> >>> +     dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
> >>> +     return 0;
> >>> +}
> >>> +
> >>>  static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
> >>>  {
> >>>       struct vb2_dma_sg_buf *buf = dbuf->priv;
> >>> @@ -488,6 +508,8 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
> >>>       .detach = vb2_dma_sg_dmabuf_ops_detach,
> >>>       .map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
> >>>       .unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
> >>> +     .begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
> >>> +     .end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
> >>>       .vmap = vb2_dma_sg_dmabuf_ops_vmap,
> >>>       .mmap = vb2_dma_sg_dmabuf_ops_mmap,
> >>>       .release = vb2_dma_sg_dmabuf_ops_release,
> >>>
> >>
>
