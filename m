Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04BE11D7D44
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 17:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgERPs0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 11:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgERPsZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 11:48:25 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFDBC061A0C
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 08:48:24 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s8so12447390wrt.9
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Bx0WkkQJn+ReSqv/LZv/DXi5GH9rflDGbg96SspkM8=;
        b=TCAlXMfSY8YKnzO/sTLnLF8agP9AeeVx0b115Gu5dddOlVFpkINba5s3cPnUs8AOIN
         9vKAjxim6+cAv4BiKvyCem6RMQ2p8rNQWeJginSVB4tpoNheNvlMMwF5lH3lxtKqIDgU
         OE0oQOP3gV+K/1jnqQXT1Wr+zalwWjeIyZ5yJZvLgvk+8UqugIVB9lG1lJ8H2G/URhK2
         JGzsnzaGsAONBxNlsvaOuDC0X1w9MGGShbDTg4mRqR5nWiS/u/SJUTCuqOTIITaZDiEZ
         Utm5d77Q8anBWKYLo0P5aLiWmgP7EjUlN3UV+ib/b5cC2g/tYSLIkt9t1nkyBb8wo5ca
         sEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Bx0WkkQJn+ReSqv/LZv/DXi5GH9rflDGbg96SspkM8=;
        b=jwXeZEhoUhjj9MqlY8xBBaJmL6z0ZRyE4DyRZEhEshCacIrGWiwefcvYqazIFRCoup
         CJbEHEhiRhGwfpa7N0D0Ojznr1SsO+O6uXkavYg6gdoIND+y4mx0mrJ4cHmnn286jPWm
         kUguF18qRIfHKB5cFVHqcOXF+LDFQxwY0cDQcq+KvV5KD+ny9Xa2OKIQGCbk93WQ2f1l
         oWynGc4PpYiAok+pnwqIuR6hHoWJxyTjWHcjclI4qxGj8quXhSxi8QUVvXW9fXk2o4vD
         I42OIgpz67jgHgBZDcFB0mhfmMI3cBDLAkCCVgDNKcxdzpThT4eaf650nzlIudVoQlls
         EaSg==
X-Gm-Message-State: AOAM531Q/wBT3xYp7tOFigRXpOVugYnB7/j7vAAn2xE3JtGPABmIdsFv
        d/SJLkE+ql7Sf1z7Tf3MNlG+6t6tIGv0lf6/VKge1g==
X-Google-Smtp-Source: ABdhPJweuAt6whE88UA4sQU0XQT+wlMF2nxDjCjhE0Xllf4B725tJQyalC0r9PlMYnOc4XKb/M0dtczXi5oXqBrn+Rc=
X-Received: by 2002:adf:ffc2:: with SMTP id x2mr20037045wrs.273.1589816902754;
 Mon, 18 May 2020 08:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-7-laurent.pinchart@ideasonboard.com> <9b42ad8c4c39ac3873e7c3ea2951bea1caef8bd1.camel@suse.de>
In-Reply-To: <9b42ad8c4c39ac3873e7c3ea2951bea1caef8bd1.camel@suse.de>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 18 May 2020 16:48:07 +0100
Message-ID: <CAPY8ntCZsFtko4LMUsfSEUV9LwtJ9bdjXK4ZVJ3KFd18vzRp5A@mail.gmail.com>
Subject: Re: [PATCH v2 06/34] staging: vc04_services: Add new vc-sm-cma driver
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas

On Mon, 11 May 2020 at 19:43, Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Dave,
> some questions/comments.
>
> On Mon, 2020-05-04 at 12:25 +0300, Laurent Pinchart wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> >
> > Add Broadcom VideoCore Shared Memory support.
> >
> > This new driver allows contiguous memory blocks to be imported
> > into the VideoCore VPU memory map, and manages the lifetime of
> > those objects, only releasing the source dmabuf once the VPU has
> > confirmed it has finished with it.
> >
> > Driver upported from the RaspberryPi BSP at revision:
> > 890691d1c996 ("staging: vc04_services: Fix vcsm overflow bug when counting
> > transactions")
> > forward ported to recent mainline kernel version.
> >
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
>
> [...]
>
> > +
> > +/* Import a dma_buf to be shared with VC. */
> > +int
> > +vc_sm_cma_import_dmabuf_internal(struct vc_sm_privdata_t *private,
> > +                              struct dma_buf *dma_buf,
> > +                              int fd,
> > +                              struct dma_buf **imported_buf)
> > +{
> > +     DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > +     struct vc_sm_buffer *buffer = NULL;
> > +     struct vc_sm_import import = { };
> > +     struct vc_sm_import_result result = { };
> > +     struct dma_buf_attachment *attach = NULL;
> > +     struct sg_table *sgt = NULL;
> > +     dma_addr_t dma_addr;
> > +     int ret = 0;
> > +     int status;
> > +
> > +     /* Setup our allocation parameters */
> > +     pr_debug("%s: importing dma_buf %p/fd %d\n", __func__, dma_buf, fd);
> > +
> > +     if (fd < 0)
> > +             get_dma_buf(dma_buf);
> > +     else
> > +             dma_buf = dma_buf_get(fd);
> > +
> > +     if (!dma_buf)
> > +             return -EINVAL;
> > +
> > +     attach = dma_buf_attach(dma_buf, &sm_state->pdev->dev);
> > +     if (IS_ERR(attach)) {
> > +             ret = PTR_ERR(attach);
> > +             goto error;
> > +     }
> > +
> > +     sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> > +     if (IS_ERR(sgt)) {
> > +             ret = PTR_ERR(sgt);
> > +             goto error;
> > +     }
> > +
> > +     /* Verify that the address block is contiguous */
> > +     if (sgt->nents != 1) {
> > +             ret = -ENOMEM;
> > +             goto error;
> > +     }
> > +
> > +     /* Allocate local buffer to track this allocation. */
> > +     buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
> > +     if (!buffer) {
> > +             ret = -ENOMEM;
> > +             goto error;
> > +     }
> > +
> > +     import.type = VC_SM_ALLOC_NON_CACHED;
> > +     dma_addr = sg_dma_address(sgt->sgl);
> > +     import.addr = (u32)dma_addr;
> > +     if ((import.addr & 0xC0000000) != 0xC0000000) {
> > +             pr_err("%s: Expecting an uncached alias for dma_addr %pad\n",
> > +                    __func__, &dma_addr);
> > +             import.addr |= 0xC0000000;
> > +     }
>
> Just so we don't forget about it, this shouldn't be needed once dma-ranges are
> fixed.

Indeed not, but we've had enough issues with dma-ranges going missing
that screaming and shouting about it is a good thing.

> > +     import.size = sg_dma_len(sgt->sgl);
> > +     import.allocator = current->tgid;
> > +     import.kernel_id = get_kernel_id(buffer);
> > +
> > +     memcpy(import.name, VC_SM_RESOURCE_NAME_DEFAULT,
> > +            sizeof(VC_SM_RESOURCE_NAME_DEFAULT));
> > +
> > +     pr_debug("[%s]: attempt to import \"%s\" data - type %u, addr %pad, size
> > %u.\n",
> > +              __func__, import.name, import.type, &dma_addr, import.size);
> > +
> > +     /* Allocate the videocore buffer. */
> > +     status = vc_sm_cma_vchi_import(sm_state->sm_handle, &import, &result,
> > +                                    &sm_state->int_trans_id);
> > +     if (status == -EINTR) {
> > +             pr_debug("[%s]: requesting import memory action restart
> > (trans_id: %u)\n",
> > +                      __func__, sm_state->int_trans_id);
> > +             ret = -ERESTARTSYS;
> > +             private->restart_sys = -EINTR;
> > +             private->int_action = VC_SM_MSG_TYPE_IMPORT;
> > +             goto error;
> > +     } else if (status || !result.res_handle) {
> > +             pr_debug("[%s]: failed to import memory on videocore (status:
> > %u, trans_id: %u)\n",
> > +                      __func__, status, sm_state->int_trans_id);
> > +             ret = -ENOMEM;
> > +             goto error;
> > +     }
> > +
> > +     mutex_init(&buffer->lock);
> > +     INIT_LIST_HEAD(&buffer->attachments);
> > +     memcpy(buffer->name, import.name,
> > +            min(sizeof(buffer->name), sizeof(import.name) - 1));
> > +
> > +     /* Keep track of the buffer we created. */
> > +     buffer->private = private;
> > +     buffer->vc_handle = result.res_handle;
> > +     buffer->size = import.size;
> > +     buffer->vpu_state = VPU_MAPPED;
> > +
> > +     buffer->imported = 1;
> > +     buffer->import.dma_buf = dma_buf;
> > +
> > +     buffer->import.attach = attach;
> > +     buffer->import.sgt = sgt;
> > +     buffer->dma_addr = dma_addr;
> > +     buffer->in_use = 1;
> > +     buffer->kernel_id = import.kernel_id;
> > +
> > +     /*
> > +      * We're done - we need to export a new dmabuf chaining through most
> > +      * functions, but enabling us to release our own internal references
> > +      * here.
> > +      */
> > +     exp_info.ops = &dma_buf_import_ops;
> > +     exp_info.size = import.size;
> > +     exp_info.flags = O_RDWR;
> > +     exp_info.priv = buffer;
> > +
> > +     buffer->dma_buf = dma_buf_export(&exp_info);
>
> Could you comment on the need for this second dma_buf? I've only reviewed code
> related to mmal-vchiq imports, but it seems to me that it would be saner to do
> the unmapping and unattaching explicitly as opposed to having this second
> buffer refcount hit 0. Although, I can imagine this being needed for the
> userspace interface.

Indeed, as it is needed for the userspace interface it seemed to make
more sense to have common handling rather than two code paths doing
nearly the same thing but in different ways.
Downstream we need a userspace import at least to allow MMAL to set up
zero copy, so unless it raises any real objections then it would be
useful to keep it.

> When you talk about moving to dmabuf heaps, I've pictured a specific dmabuf
> heap for vc4 that takes care of all the importing and unimporting (aside from
> cma allocations). Am I right? If so, I'm pretty confident we can do away with
> this.

(Note I'm talking about the VideoCore4 VPU and other blocks, and not
the vc4 DRM/KMS and V3D drivers)

No, I'm looking at using the existing cma_heap driver to do the
allocations, and then this driver will import them and handle the
lifetime on behalf of the VPU. There's no need for VPU allocations to
be split off into yet another heap.
One of the things we are trying to get away from is having the gpu_mem
reserved lump that Linux can't get access to at all, so allocating
from the CMA heap and importing to the VPU avoids that.


I'll give some history here, which also hopefully covers your query
over switching mmal-vchiq to zero copy.

Almost all the VC4 blocks need contiguous memory, so fragmentation was
an issue. To resolve that we (back in Broadcom days) had the
"relocatable heap" - allocations that needed to be locked before
access and unlocked after. Unlocked blocks could be copied and moved
around to free up larger contiguous blocks. These allocations use a
handle instead of a pointer, and have internal refcounting etc.
Basically providing some of the features of an MMU when you don't have
one.

The original VCSM driver allowed userspace to make a relocatable heap
allocation, lock it, and the kernel to map the relevant pages into the
ARM memory space. Now you have a shared buffer, and VCHIQ no longer
has to copy the data back and forth. (Cache flushing was also
handled).
So MMAL in zero copy mode passes the VPU relocatable heap handle
across in the VCHIQ message, not a pointer to the actual data. VCSM
did the allocation on behalf of the MMAL client, and provides the
mapping and VPU handle to the buffer. This still leaves the allocation
being made from gpu_mem though.

The rewrite (vc-sm-cma) was to make use of an import feature into the
relocatable heap, termed internally as mem wrapping. Take a CMA
allocation made by something, pass the DMA address and size across to
the VPU, and it can insert it as a relocatable heap object that can be
used in exactly the same way gpu_mem allocations. gpu_mem can now be
shrunk in size :-) It was using a dma-buf as a convenient object to
manage the allocation, and handle importing buffers allocated by other
subsystems
Note that we still have refcounting internally to the relocatable
heap, so at the point the client says it has finished with it, the VPU
may not have done. When the last relocatable heap reference is
released, the kernel gets a callback (VC_SM_MSG_TYPE_RELEASED), and it
is only at that point that it is safe to drop the reference to the
imported dmabuf.

V4L2 can do the relevant import and wrapping to a relocatable heap
handle as part of the buffer passing. MMAL needs to do it manually
from userspace as VCHIQ is the only in-kernel service that it uses,
hence we need an import ioctl and free mechanism (if the handle is a
dmabuf, then that's close).


From a platform level it would be nice to have the userspace ioctl for
importing a dmabuf in mainline, however it isn't necessary for the
V4L2 use cases that we're trying to upstream here. The driver without
userspace API would look pretty much like the one in [1]. I'll try and
update that to include the basic import userspace API to give a
comparison.
I don't mind which way this goes as to whether the userspace ioctl
remains as downstream patches, but losing the dmabuf as the handle
within vc-sm-cma will make that patch huge, and they're almost
guaranteed to diverge.
Ignore the caching ioctls - they're irrelevant.

I hope that makes the situation a little clearer.

  Dave

[1] https://github.com/6by9/linux/tree/staging_next_upstreaming_apr20/drivers/staging/vc04_services/vc-sm-cma
