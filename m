Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39CFC586859
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 13:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbiHALnh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 1 Aug 2022 07:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbiHALnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 07:43:17 -0400
X-Greylist: delayed 55295 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 01 Aug 2022 04:43:11 PDT
Received: from kozue.soulik.info (kozue.soulik.info [IPv6:2001:19f0:7000:8404:5054:ff:fe75:428f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96CA33375;
        Mon,  1 Aug 2022 04:43:11 -0700 (PDT)
Received: from [192.168.10.77] (unknown [112.65.61.203])
        by kozue.soulik.info (Postfix) with ESMTPSA id 06989100DB3;
        Mon,  1 Aug 2022 20:34:06 +0900 (JST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
From:   ayaka <ayaka@soulik.info>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] [Draft]: media: videobuf2-dma-heap: add a vendor defined memory runtine
Date:   Mon, 1 Aug 2022 19:39:51 +0800
Message-Id: <1C214079-69AA-40D7-92EC-ED1F86CD37A3@soulik.info>
References: <CAAFQd5CKfv6F6cgN95SE42HWQYynsSuYFcU_8aePgtawXyey1g@mail.gmail.com>
Cc:     Hsia-Jun Li <randy.li@synaptics.com>, linux-media@vger.kernel.org,
        m.szyprowski@samsung.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
In-Reply-To: <CAAFQd5CKfv6F6cgN95SE42HWQYynsSuYFcU_8aePgtawXyey1g@mail.gmail.com>
To:     Tomasz Figa <tfiga@chromium.org>
X-Mailer: iPad Mail (18D61)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Sent from my iPad

> On Aug 1, 2022, at 5:46 PM, Tomasz Figa <tfiga@chromium.org> wrote:
> 
> ﻿CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
>> On Mon, Aug 1, 2022 at 3:44 PM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>> 
>> 
>> 
>>> On 8/1/22 14:19, Tomasz Figa wrote:
>>> 
>> Hello Tomasz
>>> 
>>> ?Hi Randy,
>>> 
>>> On Mon, Aug 1, 2022 at 5:21 AM <ayaka@soulik.info> wrote:
>>>> 
>>>> From: Randy Li <ayaka@soulik.info>
>>>> 
>>>> This module is still at a early stage, I wrote this for showing what
>>>> APIs we need here.
>>>> 
>>>> Let me explain why we need such a module here.
>>>> If you won't allocate buffers from a V4L2 M2M device, this module
>>>> may not be very useful. I am sure the most of users won't know a
>>>> device would require them allocate buffers from a DMA-Heap then
>>>> import those buffers into a V4L2's queue.
>>>> 
>>>> Then the question goes back to why DMA-Heap. From the Android's
>>>> description, we know it is about the copyright's DRM.
>>>> When we allocate a buffer in a DMA-Heap, it may register that buffer
>>>> in the trusted execution environment so the firmware which is running
>>>> or could only be acccesed from there could use that buffer later.
>>>> 
>>>> The answer above leads to another thing which is not done in this
>>>> version, the DMA mapping. Although in some platforms, a DMA-Heap
>>>> responses a IOMMU device as well. For the genernal purpose, we would
>>>> be better assuming the device mapping should be done for each device
>>>> itself. The problem here we only know alloc_devs in those DMAbuf
>>>> methods, which are DMA-heaps in my design, the device from the queue
>>>> is not enough, a plane may requests another IOMMU device or table
>>>> for mapping.
>>>> 
>>>> Signed-off-by: Randy Li <ayaka@soulik.info>
>>>> ---
>>>>  drivers/media/common/videobuf2/Kconfig        |   6 +
>>>>  drivers/media/common/videobuf2/Makefile       |   1 +
>>>>  .../common/videobuf2/videobuf2-dma-heap.c     | 350 ++++++++++++++++++
>>>>  include/media/videobuf2-dma-heap.h            |  30 ++
>>>>  4 files changed, 387 insertions(+)
>>>>  create mode 100644 drivers/media/common/videobuf2/videobuf2-dma-heap.c
>>>>  create mode 100644 include/media/videobuf2-dma-heap.h
>>>> 
>>> 
>>> First of all, thanks for the series.
>>> 
>>> Possibly a stupid question, but why not just allocate the DMA-bufs
>>> directly from the DMA-buf heap device in the userspace and just import
>>> the buffers to the V4L2 device using V4L2_MEMORY_DMABUF?
>> Sometimes the allocation policy could be very complex, let's suppose a
>> multiple planes pixel format enabling with frame buffer compression.
>> Its luma, chroma data could be allocated from a pool which is delegated
>> for large buffers while its metadata would come from a pool which many
>> users could take some few slices from it(likes system pool).
>> 
>> Then when we have a new users knowing nothing about this platform, if we
>> just configure the alloc_devs in each queues well. The user won't need
>> to know those complex rules.
>> 
>> The real situation could be more complex, Samsung MFC's left and right
>> banks could be regarded as two pools, many devices would benefit from
>> this either from the allocation times or the security buffers policy.
>> 
>> In our design, when we need to do some security decoding(DRM video),
>> codecs2 would allocate buffers from the pool delegated for that. While
>> the non-DRM video, users could not care about this.
> 
> I'm a little bit surprised about this, because on Android all the
> graphics buffers are allocated from the system IAllocator and imported
> to the specific devices.
> 
In the non-tunnel mode, yes it is. While the tunnel mode is completely vendor defined. Neither HWC nor codec2 cares about where the buffers coming from, you could do what ever you want.

Besides there are DRM video in GNU Linux platform, I heard the webkit has made huge effort here and Playready is one could work in non-Android Linux.
> Would it make sense to instead extend the UAPI to expose enough
> information about the allocation requirements to the userspace, so it
> can allocate correctly?
Yes, it could. But as I said it would need the users to do more works.
> My reasoning here is that it's not a driver's decision to allocate
> from a DMA-buf heap (and which one) or not. It's the userspace which
> knows that, based on the specific use case that it wants to fulfill.
> 
Although I would like to let the users decide that, users just can’t do that which would violate the security rules in some platforms.
For example,  video codec and display device could only access a region of memory, any other device or trusted apps can’t access it. Users have to allocate the buffer from the pool the vendor decided.

So why not we offer a quick way that users don’t need to try and error.
> Also, FWIW, dma_heap_ioctl_allocate() is a static function not exposed
> to other kernel modules:
> https://urldefense.proofpoint.com/v2/url?u=https-3A__elixir.bootlin.com_linux_v5.19_source_drivers_dma-2Dbuf_dma-2Dheap.c-23L52&d=DwIBaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=HFC3KS_ZU9m61rWQgCO99xSAwnfR3nT8M6h9aW2JYG4-Sy_Uog4xkR8awUOw65Fe&s=TPQwWeG-DdLcgJtaA1cIuQhl3zsHLITkWFV1UNLSFWs&e=
> 
I may forget to mention that you need two extra patches from Linaro that export those API(original version is actually out of time). Besides Android kernel did have the two kAPI I need here.
Actually I need more APIs from DMA-heap to archive those things in TODO list.
> By the way, the MFC left/right port requirement was gone long ago, it
> was only one of the earliest Exynos SoCs which required that.
> 
Yes, MFCv5 or v6 right. I just want mention that the world has any possible, vendor always has its own reason.
> Best regards,
> Tomasz
> 
>>> 
>>> Best regards,
>>> Tomasz
>>> 
>>>> diff --git a/drivers/media/common/videobuf2/Kconfig b/drivers/media/common/videobuf2/Kconfig
>>>> index d2223a12c95f..02235077f07e 100644
>>>> --- a/drivers/media/common/videobuf2/Kconfig
>>>> +++ b/drivers/media/common/videobuf2/Kconfig
>>>> @@ -30,3 +30,9 @@ config VIDEOBUF2_DMA_SG
>>>>  config VIDEOBUF2_DVB
>>>>         tristate
>>>>         select VIDEOBUF2_CORE
>>>> +
>>>> +config VIDEOBUF2_DMA_HEAP
>>>> +       tristate
>>>> +       select VIDEOBUF2_CORE
>>>> +       select VIDEOBUF2_MEMOPS
>>>> +       select DMABUF_HEAPS
>>>> diff --git a/drivers/media/common/videobuf2/Makefile b/drivers/media/common/videobuf2/Makefile
>>>> index a6fe3f304685..7fe65f93117f 100644
>>>> --- a/drivers/media/common/videobuf2/Makefile
>>>> +++ b/drivers/media/common/videobuf2/Makefile
>>>> @@ -10,6 +10,7 @@ endif
>>>>  # (e. g. LC_ALL=C sort Makefile)
>>>>  obj-$(CONFIG_VIDEOBUF2_CORE) += videobuf2-common.o
>>>>  obj-$(CONFIG_VIDEOBUF2_DMA_CONTIG) += videobuf2-dma-contig.o
>>>> +obj-$(CONFIG_VIDEOBUF2_DMA_HEAP) += videobuf2-dma-heap.o
>>>>  obj-$(CONFIG_VIDEOBUF2_DMA_SG) += videobuf2-dma-sg.o
>>>>  obj-$(CONFIG_VIDEOBUF2_DVB) += videobuf2-dvb.o
>>>>  obj-$(CONFIG_VIDEOBUF2_MEMOPS) += videobuf2-memops.o
>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-heap.c b/drivers/media/common/videobuf2/videobuf2-dma-heap.c
>>>> new file mode 100644
>>>> index 000000000000..377b82ab8f5a
>>>> --- /dev/null
>>>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-heap.c
>>>> @@ -0,0 +1,350 @@
>>>> +/*
>>>> + * Copyright (C) 2022 Randy Li <ayaka@soulik.info>
>>>> + *
>>>> + * This software is licensed under the terms of the GNU General Public
>>>> + * License version 2, as published by the Free Software Foundation, and
>>>> + * may be copied, distributed, and modified under those terms.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> + * GNU General Public License for more details.
>>>> + *
>>>> + */
>>>> +
>>>> +#include <linux/dma-buf.h>
>>>> +#include <linux/dma-heap.h>
>>>> +#include <linux/refcount.h>
>>>> +#include <linux/scatterlist.h>
>>>> +#include <linux/sched.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/dma-mapping.h>
>>>> +
>>>> +#include <media/videobuf2-v4l2.h>
>>>> +#include <media/videobuf2-memops.h>
>>>> +#include <media/videobuf2-dma-heap.h>
>>>> +
>>>> +struct vb2_dmaheap_buf {
>>>> +       struct device *dev;
>>>> +       void *vaddr;
>>>> +       unsigned long size;
>>>> +       struct dma_buf *dmabuf;
>>>> +       dma_addr_t dma_addr;
>>>> +       unsigned long attrs;
>>>> +       enum dma_data_direction dma_dir;
>>>> +       struct sg_table *dma_sgt;
>>>> +
>>>> +       /* MMAP related */
>>>> +       struct vb2_vmarea_handler handler;
>>>> +       refcount_t refcount;
>>>> +
>>>> +       /* DMABUF related */
>>>> +       struct dma_buf_attachment *db_attach;
>>>> +};
>>>> +
>>>> +/*********************************************/
>>>> +/*         callbacks for all buffers         */
>>>> +/*********************************************/
>>>> +
>>>> +void *vb2_dmaheap_cookie(struct vb2_buffer *vb, void *buf_priv)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf = buf_priv;
>>>> +
>>>> +       return &buf->dma_addr;
>>>> +}
>>>> +
>>>> +static void *vb2_dmaheap_vaddr(struct vb2_buffer *vb, void *buf_priv)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf = buf_priv;
>>>> +       struct iosys_map map;
>>>> +
>>>> +       if (buf->vaddr)
>>>> +           return buf->vaddr;
>>>> +
>>>> +       if (buf->db_attach) {
>>>> +               if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
>>>> +                       buf->vaddr = map.vaddr;
>>>> +       }
>>>> +
>>>> +       return buf->vaddr;
>>>> +}
>>>> +
>>>> +static unsigned int vb2_dmaheap_num_users(void *buf_priv)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf = buf_priv;
>>>> +
>>>> +       return refcount_read(&buf->refcount);
>>>> +}
>>>> +
>>>> +static void vb2_dmaheap_prepare(void *buf_priv)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf = buf_priv;
>>>> +
>>>> +       /* TODO: DMABUF exporter will flush the cache for us */
>>>> +       if (buf->db_attach)
>>>> +               return;
>>>> +
>>>> +       dma_buf_end_cpu_access(buf->dmabuf, buf->dma_dir);
>>>> +}
>>>> +
>>>> +static void vb2_dmaheap_finish(void *buf_priv)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf = buf_priv;
>>>> +
>>>> +       /* TODO: DMABUF exporter will flush the cache for us */
>>>> +       if (buf->db_attach)
>>>> +               return;
>>>> +
>>>> +       dma_buf_begin_cpu_access(buf->dmabuf, buf->dma_dir);
>>>> +}
>>>> +
>>>> +/*********************************************/
>>>> +/*        callbacks for MMAP buffers         */
>>>> +/*********************************************/
>>>> +
>>>> +void vb2_dmaheap_put(void *buf_priv)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf = buf_priv;
>>>> +
>>>> +       if (!refcount_dec_and_test(&buf->refcount))
>>>> +               return;
>>>> +
>>>> +       dma_buf_put(buf->dmabuf);
>>>> +
>>>> +       put_device(buf->dev);
>>>> +       kfree(buf);
>>>> +}
>>>> +
>>>> +static void *vb2_dmaheap_alloc(struct vb2_buffer *vb,
>>>> +                              struct device *dev,
>>>> +                              unsigned long size)
>>>> +{
>>>> +       struct vb2_queue *q = vb->vb2_queue;
>>>> +       struct dma_heap *heap;
>>>> +       struct vb2_dmaheap_buf *buf;
>>>> +       const char *heap_name;
>>>> +       int ret;
>>>> +
>>>> +       if (WARN_ON(!dev))
>>>> +               return ERR_PTR(-EINVAL);
>>>> +
>>>> +       heap_name = dev_name(dev);
>>>> +       if (!heap_name)
>>>> +               return ERR_PTR(-EINVAL);
>>>> +
>>>> +       heap = dma_heap_find(heap_name);
>>>> +       if (!heap) {
>>>> +               dev_err(dev, "is not a DMA-heap device\n");
>>>> +               return ERR_PTR(-EINVAL);
>>>> +       }
>>>> +
>>>> +       buf = kzalloc(sizeof *buf, GFP_KERNEL);
>>>> +       if (!buf)
>>>> +               return ERR_PTR(-ENOMEM);
>>>> +
>>>> +       /* Prevent the device from being released while the buffer is used */
>>>> +       buf->dev = get_device(dev);
>>>> +       buf->attrs = vb->vb2_queue->dma_attrs;
>>>> +       buf->dma_dir = vb->vb2_queue->dma_dir;
>>>> +
>>>> +       /* TODO: heap flags */
>>>> +       ret = dma_heap_buffer_alloc(heap, size, 0, 0);
>>>> +       if (ret < 0) {
>>>> +               dev_err(dev, "is not a DMA-heap device\n");
>>>> +               put_device(buf->dev);
>>>> +               kfree(buf);
>>>> +               return ERR_PTR(ret);
>>>> +       }
>>>> +       buf->dmabuf = dma_buf_get(ret);
>>>> +
>>>> +       /* FIXME */
>>>> +       buf->dma_addr = 0;
>>>> +
>>>> +       if ((q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING) == 0)
>>>> +               buf->vaddr = buf->dmabuf;
>>>> +
>>>> +       buf->handler.refcount = &buf->refcount;
>>>> +       buf->handler.put = vb2_dmaheap_put;
>>>> +       buf->handler.arg = buf;
>>>> +
>>>> +       refcount_set(&buf->refcount, 1);
>>>> +
>>>> +       return buf;
>>>> +}
>>>> +
>>>> +static int vb2_dmaheap_mmap(void *buf_priv, struct vm_area_struct *vma)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf = buf_priv;
>>>> +       int ret;
>>>> +
>>>> +       if (!buf) {
>>>> +               printk(KERN_ERR "No buffer to map\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       vma->vm_flags &= ~VM_PFNMAP;
>>>> +
>>>> +       ret = dma_buf_mmap(buf->dmabuf, vma, 0);
>>>> +       if (ret) {
>>>> +               pr_err("Remapping memory failed, error: %d\n", ret);
>>>> +               return ret;
>>>> +       }
>>>> +       vma->vm_flags           |= VM_DONTEXPAND | VM_DONTDUMP;
>>>> +       vma->vm_private_data    = &buf->handler;
>>>> +       vma->vm_ops             = &vb2_common_vm_ops;
>>>> +
>>>> +       vma->vm_ops->open(vma);
>>>> +
>>>> +       pr_debug("%s: mapped memid 0x%08lx at 0x%08lx, size %ld\n",
>>>> +                __func__, (unsigned long)buf->dma_addr, vma->vm_start,
>>>> +                buf->size);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +/*********************************************/
>>>> +/*         DMABUF ops for exporters          */
>>>> +/*********************************************/
>>>> +
>>>> +static struct dma_buf *vb2_dmaheap_get_dmabuf(struct vb2_buffer *vb,
>>>> +                                             void *buf_priv,
>>>> +                                             unsigned long flags)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf = buf_priv;
>>>> +       struct dma_buf *dbuf;
>>>> +
>>>> +       dbuf = buf->dmabuf;
>>>> +
>>>> +       return dbuf;
>>>> +}
>>>> +
>>>> +/*********************************************/
>>>> +/*       callbacks for DMABUF buffers        */
>>>> +/*********************************************/
>>>> +
>>>> +static int vb2_dmaheap_map_dmabuf(void *mem_priv)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf = mem_priv;
>>>> +       struct sg_table *sgt;
>>>> +
>>>> +       if (WARN_ON(!buf->db_attach)) {
>>>> +               pr_err("trying to pin a non attached buffer\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       if (WARN_ON(buf->dma_sgt)) {
>>>> +               pr_err("dmabuf buffer is already pinned\n");
>>>> +               return 0;
>>>> +       }
>>>> +
>>>> +       /* get the associated scatterlist for this buffer */
>>>> +       sgt = dma_buf_map_attachment(buf->db_attach, buf->dma_dir);
>>>> +       if (IS_ERR(sgt)) {
>>>> +               pr_err("Error getting dmabuf scatterlist\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       buf->dma_addr = sg_dma_address(sgt->sgl);
>>>> +       buf->dma_sgt = sgt;
>>>> +       buf->vaddr = NULL;
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static void vb2_dmaheap_unmap_dmabuf(void *mem_priv)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf = mem_priv;
>>>> +       struct sg_table *sgt = buf->dma_sgt;
>>>> +       struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>>>> +
>>>> +       if (WARN_ON(!buf->db_attach)) {
>>>> +               pr_err("trying to unpin a not attached buffer\n");
>>>> +               return;
>>>> +       }
>>>> +
>>>> +       if (WARN_ON(!sgt)) {
>>>> +               pr_err("dmabuf buffer is already unpinned\n");
>>>> +               return;
>>>> +       }
>>>> +
>>>> +       if (buf->vaddr) {
>>>> +               dma_buf_vunmap(buf->db_attach->dmabuf, &map);
>>>> +               buf->vaddr = NULL;
>>>> +       }
>>>> +       dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
>>>> +
>>>> +       buf->dma_addr = 0;
>>>> +       buf->dma_sgt = NULL;
>>>> +}
>>>> +
>>>> +static void vb2_dmaheap_detach_dmabuf(void *mem_priv)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf = mem_priv;
>>>> +
>>>> +       /* if vb2 works correctly you should never detach mapped buffer */
>>>> +       if (WARN_ON(buf->dma_addr))
>>>> +               vb2_dmaheap_unmap_dmabuf(buf);
>>>> +
>>>> +       /* detach this attachment */
>>>> +       dma_buf_detach(buf->db_attach->dmabuf, buf->db_attach);
>>>> +       kfree(buf);
>>>> +}
>>>> +
>>>> +static void *vb2_dmaheap_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
>>>> +                                      struct dma_buf *dbuf, unsigned long size)
>>>> +{
>>>> +       struct vb2_dmaheap_buf *buf;
>>>> +       struct dma_buf_attachment *dba;
>>>> +
>>>> +       if (dbuf->size < size)
>>>> +               return ERR_PTR(-EFAULT);
>>>> +
>>>> +       if (WARN_ON(!dev))
>>>> +               return ERR_PTR(-EINVAL);
>>>> +       /*
>>>> +        * TODO: A better way to check whether the buffer is coming
>>>> +        * from this heap or this heap could accept this buffer
>>>> +        */
>>>> +       if (strcmp(dbuf->exp_name, dev_name(dev)))
>>>> +               return ERR_PTR(-EINVAL);
>>>> +
>>>> +       buf = kzalloc(sizeof(*buf), GFP_KERNEL);
>>>> +       if (!buf)
>>>> +               return ERR_PTR(-ENOMEM);
>>>> +
>>>> +       buf->dev = dev;
>>>> +       /* create attachment for the dmabuf with the user device */
>>>> +       dba = dma_buf_attach(dbuf, buf->dev);
>>>> +       if (IS_ERR(dba)) {
>>>> +               pr_err("failed to attach dmabuf\n");
>>>> +               kfree(buf);
>>>> +               return dba;
>>>> +       }
>>>> +
>>>> +       buf->dma_dir = vb->vb2_queue->dma_dir;
>>>> +       buf->size = size;
>>>> +       buf->db_attach = dba;
>>>> +
>>>> +       return buf;
>>>> +}
>>>> +
>>>> +const struct vb2_mem_ops vb2_dmaheap_memops = {
>>>> +       .alloc = vb2_dmaheap_alloc,
>>>> +       .put = vb2_dmaheap_put,
>>>> +       .get_dmabuf = vb2_dmaheap_get_dmabuf,
>>>> +       .cookie = vb2_dmaheap_cookie,
>>>> +       .vaddr = vb2_dmaheap_vaddr,
>>>> +       .prepare = vb2_dmaheap_prepare,
>>>> +       .finish = vb2_dmaheap_finish,
>>>> +       .map_dmabuf = vb2_dmaheap_map_dmabuf,
>>>> +       .unmap_dmabuf = vb2_dmaheap_unmap_dmabuf,
>>>> +       .attach_dmabuf = vb2_dmaheap_attach_dmabuf,
>>>> +       .detach_dmabuf = vb2_dmaheap_detach_dmabuf,
>>>> +       .num_users = vb2_dmaheap_num_users,
>>>> +       .mmap = vb2_dmaheap_mmap,
>>>> +};
>>>> +
>>>> +MODULE_DESCRIPTION("DMA-Heap memory handling routines for videobuf2");
>>>> +MODULE_AUTHOR("Randy Li <ayaka@soulik.info>");
>>>> +MODULE_LICENSE("GPL");
>>>> +MODULE_IMPORT_NS(DMA_BUF);
>>>> diff --git a/include/media/videobuf2-dma-heap.h b/include/media/videobuf2-dma-heap.h
>>>> new file mode 100644
>>>> index 000000000000..fa057f67d6e9
>>>> --- /dev/null
>>>> +++ b/include/media/videobuf2-dma-heap.h
>>>> @@ -0,0 +1,30 @@
>>>> +/*
>>>> + * Copyright (C) 2022 Randy Li <ayaka@soulik.info>
>>>> + *
>>>> + * This software is licensed under the terms of the GNU General Public
>>>> + * License version 2, as published by the Free Software Foundation, and
>>>> + * may be copied, distributed, and modified under those terms.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> + * GNU General Public License for more details.
>>>> + *
>>>> + */
>>>> +
>>>> +#ifndef _MEDIA_VIDEOBUF2_DMA_HEAP_H
>>>> +#define _MEDIA_VIDEOBUF2_DMA_HEAP_H
>>>> +
>>>> +#include <media/videobuf2-v4l2.h>
>>>> +#include <linux/dma-mapping.h>
>>>> +
>>>> +static inline dma_addr_t
>>>> +vb2_dmaheap_plane_dma_addr(struct vb2_buffer *vb, unsigned int plane_no)
>>>> +{
>>>> +       dma_addr_t *addr = vb2_plane_cookie(vb, plane_no);
>>>> +
>>>> +       return *addr;
>>>> +}
>>>> +
>>>> +extern const struct vb2_mem_ops vb2_dmaheap_memops;
>>>> +#endif
>>>> --
>>>> 2.17.1
>>>> 
>> 
>> --
>> Hsia-Jun(Randy) Li

