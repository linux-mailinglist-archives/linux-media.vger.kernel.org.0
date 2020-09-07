Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF9425FAFE
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 15:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729420AbgIGNIi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 09:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729368AbgIGNHs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 09:07:48 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5A2C061573
        for <linux-media@vger.kernel.org>; Mon,  7 Sep 2020 06:07:46 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id n22so12774050edt.4
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2020 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X3D8B6jlxOAJ39N1wax3GpsrHGllV39rK7js9TE4MFg=;
        b=mRYOTwC7XC0gfQztuDaJ9ANAyxqG7VR4GUmVJhrZQCQS6hdUVO+ykq8CEoNCa7W/IC
         Q0JmhCZO2B8WE5E5d1PnZZoPz+G6Z1sX3ohr3v17Yefx4sZwuSOvaGKGhNhoP0Vm325Z
         5du4UNR7x6b1cwxUfgRYVxk3ZnjWBjI14dCkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X3D8B6jlxOAJ39N1wax3GpsrHGllV39rK7js9TE4MFg=;
        b=BYoMmCmD/mWPsqJ9T4jMw7sTkk1AEN06mzKqPSXr/R22mcalcIMiLFOGNvdDyYCLGO
         5V1O4V4Eagburp7ak1AxZlrOx6y66ISmnbKPU0LWnqXtPsQo/zjmcH+7e2gKsYlSnZlx
         4Ddq2OBy+PAfKUhmsPbrsT9nY/c4tpkQH7GPf2uL5GRGXvWkBr3atd4fzr/HBuZi+VCf
         8dsSNUopzUeZo/pnd67iPeQVyZSFAu94YoFk2MOXrbrfUv7z5C8smfNZoxetF72GHMCc
         tzgTh66KM4IK2+y+6RCBNH7mkuNoj3zwE6AnIdxBYJQRzphdZ6wFmd3uoQ7dyopm5kFy
         LgXg==
X-Gm-Message-State: AOAM530iGyTksFQVAW+BNTP1P4111FyYl1NdA87ZKeFiHFcEo+Iuv9Lz
        XLc+V5+wjib2nZyMJESb5/lN8V8mfuA4YQ==
X-Google-Smtp-Source: ABdhPJyIexfdvNSm/GUtkYbE7gXmUF356TXo3uavfSJz9vUjP63plAsfG1072d5rG0Nvjy0VEqaWBw==
X-Received: by 2002:a50:fd19:: with SMTP id i25mr21943501eds.142.1599484064660;
        Mon, 07 Sep 2020 06:07:44 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id r8sm14935051edy.87.2020.09.07.06.07.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 06:07:44 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id t10so15799667wrv.1
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2020 06:07:43 -0700 (PDT)
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr20692073wrh.192.1599484062899;
 Mon, 07 Sep 2020 06:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200904133512eucas1p204efa4e252ceb5fb50715239705f9965@eucas1p2.samsung.com>
 <20200904131711.12950-1-m.szyprowski@samsung.com> <20200904131711.12950-31-m.szyprowski@samsung.com>
In-Reply-To: <20200904131711.12950-31-m.szyprowski@samsung.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 7 Sep 2020 15:07:31 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AZDzG6i00gcAZKM9ZV1tATWufL=+xXUAmgrbTPt8W6Gw@mail.gmail.com>
Message-ID: <CAAFQd5AZDzG6i00gcAZKM9ZV1tATWufL=+xXUAmgrbTPt8W6Gw@mail.gmail.com>
Subject: Re: [PATCH v10 30/30] videobuf2: use sgtable-based scatterlist wrappers
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linaro-mm-sig@lists.linaro.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On Fri, Sep 4, 2020 at 3:35 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Use recently introduced common wrappers operating directly on the struct
> sg_table objects and scatterlist page iterators to make the code a bit
> more compact, robust, easier to follow and copy/paste safe.
>
> No functional change, because the code already properly did all the
> scatterlist related calls.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  .../common/videobuf2/videobuf2-dma-contig.c   | 34 ++++++++-----------
>  .../media/common/videobuf2/videobuf2-dma-sg.c | 32 +++++++----------
>  .../common/videobuf2/videobuf2-vmalloc.c      | 12 +++----
>  3 files changed, 31 insertions(+), 47 deletions(-)
>

Thanks for the patch! Please see my comments inline.

> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index ec3446cc45b8..1b242d844dde 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -58,10 +58,10 @@ static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
>         unsigned int i;
>         unsigned long size = 0;
>
> -       for_each_sg(sgt->sgl, s, sgt->nents, i) {
> +       for_each_sgtable_dma_sg(sgt, s, i) {
>                 if (sg_dma_address(s) != expected)
>                         break;
> -               expected = sg_dma_address(s) + sg_dma_len(s);
> +               expected += sg_dma_len(s);
>                 size += sg_dma_len(s);
>         }
>         return size;
> @@ -103,8 +103,7 @@ static void vb2_dc_prepare(void *buf_priv)
>         if (!sgt)
>                 return;
>
> -       dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
> -                              buf->dma_dir);
> +       dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>  }
>
>  static void vb2_dc_finish(void *buf_priv)
> @@ -115,7 +114,7 @@ static void vb2_dc_finish(void *buf_priv)
>         if (!sgt)
>                 return;
>
> -       dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
> +       dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>  }
>
>  /*********************************************/
> @@ -275,8 +274,8 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
>                  * memory locations do not require any explicit cache
>                  * maintenance prior or after being used by the device.
>                  */
> -               dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -                                  attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +               dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
> +                                 DMA_ATTR_SKIP_CPU_SYNC);
>         sg_free_table(sgt);
>         kfree(attach);
>         db_attach->priv = NULL;
> @@ -301,8 +300,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>
>         /* release any previous cache */
>         if (attach->dma_dir != DMA_NONE) {
> -               dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -                                  attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +               dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
> +                                 DMA_ATTR_SKIP_CPU_SYNC);
>                 attach->dma_dir = DMA_NONE;
>         }
>
> @@ -310,9 +309,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>          * mapping to the client with new direction, no cache sync
>          * required see comment in vb2_dc_dmabuf_ops_detach()
>          */
> -       sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -                                     dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -       if (!sgt->nents) {
> +       if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
> +                           DMA_ATTR_SKIP_CPU_SYNC)) {
>                 pr_err("failed to map scatterlist\n");
>                 mutex_unlock(lock);
>                 return ERR_PTR(-EIO);

As opposed to dma_map_sg_attrs(), dma_map_sgtable() now returns an
error code on its own. Is it expected to ignore it and return -EIO?

> @@ -455,8 +453,8 @@ static void vb2_dc_put_userptr(void *buf_priv)
>                  * No need to sync to CPU, it's already synced to the CPU
>                  * since the finish() memop will have been called before this.
>                  */
> -               dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -                                  buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +               dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
> +                                 DMA_ATTR_SKIP_CPU_SYNC);
>                 pages = frame_vector_pages(buf->vec);
>                 /* sgt should exist only if vector contains pages... */
>                 BUG_ON(IS_ERR(pages));
> @@ -553,9 +551,8 @@ static void *vb2_dc_get_userptr(struct device *dev, unsigned long vaddr,
>          * No need to sync to the device, this will happen later when the
>          * prepare() memop is called.
>          */
> -       sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -                                     buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -       if (sgt->nents <= 0) {
> +       if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +                           DMA_ATTR_SKIP_CPU_SYNC)) {
>                 pr_err("failed to map scatterlist\n");
>                 ret = -EIO;

Ditto.

>                 goto fail_sgt_init;
> @@ -577,8 +574,7 @@ static void *vb2_dc_get_userptr(struct device *dev, unsigned long vaddr,
>         return buf;
>
>  fail_map_sg:
> -       dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -                          buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +       dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>
>  fail_sgt_init:
>         sg_free_table(sgt);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 0a40e00f0d7e..0dd3b19025e0 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -148,9 +148,8 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
>          * No need to sync to the device, this will happen later when the
>          * prepare() memop is called.
>          */
> -       sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -                                     buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -       if (!sgt->nents)
> +       if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +                           DMA_ATTR_SKIP_CPU_SYNC))
>                 goto fail_map;
>

Ditto.

>         buf->handler.refcount = &buf->refcount;
> @@ -186,8 +185,8 @@ static void vb2_dma_sg_put(void *buf_priv)
>         if (refcount_dec_and_test(&buf->refcount)) {
>                 dprintk(1, "%s: Freeing buffer of %d pages\n", __func__,
>                         buf->num_pages);
> -               dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -                                  buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +               dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
> +                                 DMA_ATTR_SKIP_CPU_SYNC);
>                 if (buf->vaddr)
>                         vm_unmap_ram(buf->vaddr, buf->num_pages);
>                 sg_free_table(buf->dma_sgt);
> @@ -204,8 +203,7 @@ static void vb2_dma_sg_prepare(void *buf_priv)
>         struct vb2_dma_sg_buf *buf = buf_priv;
>         struct sg_table *sgt = buf->dma_sgt;
>
> -       dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
> -                              buf->dma_dir);
> +       dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>  }
>
>  static void vb2_dma_sg_finish(void *buf_priv)
> @@ -213,7 +211,7 @@ static void vb2_dma_sg_finish(void *buf_priv)
>         struct vb2_dma_sg_buf *buf = buf_priv;
>         struct sg_table *sgt = buf->dma_sgt;
>
> -       dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
> +       dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>  }
>
>  static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
> @@ -256,9 +254,8 @@ static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
>          * No need to sync to the device, this will happen later when the
>          * prepare() memop is called.
>          */
> -       sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -                                     buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -       if (!sgt->nents)
> +       if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +                           DMA_ATTR_SKIP_CPU_SYNC))
>                 goto userptr_fail_map;
>

Ditto.

>         return buf;
> @@ -284,8 +281,7 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
>
>         dprintk(1, "%s: Releasing userspace buffer of %d pages\n",
>                __func__, buf->num_pages);
> -       dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir,
> -                          DMA_ATTR_SKIP_CPU_SYNC);
> +       dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>         if (buf->vaddr)
>                 vm_unmap_ram(buf->vaddr, buf->num_pages);
>         sg_free_table(buf->dma_sgt);
> @@ -408,8 +404,7 @@ static void vb2_dma_sg_dmabuf_ops_detach(struct dma_buf *dbuf,
>
>         /* release the scatterlist cache */
>         if (attach->dma_dir != DMA_NONE)
> -               dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -                       attach->dma_dir);
> +               dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>         sg_free_table(sgt);
>         kfree(attach);
>         db_attach->priv = NULL;
> @@ -434,15 +429,12 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
>
>         /* release any previous cache */
>         if (attach->dma_dir != DMA_NONE) {
> -               dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -                       attach->dma_dir);
> +               dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>                 attach->dma_dir = DMA_NONE;
>         }
>
>         /* mapping to the client with new direction */
> -       sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -                               dma_dir);
> -       if (!sgt->nents) {
> +       if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>                 pr_err("failed to map scatterlist\n");
>                 mutex_unlock(lock);
>                 return ERR_PTR(-EIO);

Ditto.

> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index c66fda4a65e4..bf5ac63a5742 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -229,7 +229,7 @@ static int vb2_vmalloc_dmabuf_ops_attach(struct dma_buf *dbuf,
>                 kfree(attach);
>                 return ret;
>         }
> -       for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> +       for_each_sgtable_sg(sgt, sg, i) {
>                 struct page *page = vmalloc_to_page(vaddr);
>
>                 if (!page) {
> @@ -259,8 +259,7 @@ static void vb2_vmalloc_dmabuf_ops_detach(struct dma_buf *dbuf,
>
>         /* release the scatterlist cache */
>         if (attach->dma_dir != DMA_NONE)
> -               dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -                       attach->dma_dir);
> +               dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>         sg_free_table(sgt);
>         kfree(attach);
>         db_attach->priv = NULL;
> @@ -285,15 +284,12 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
>
>         /* release any previous cache */
>         if (attach->dma_dir != DMA_NONE) {
> -               dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -                       attach->dma_dir);
> +               dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>                 attach->dma_dir = DMA_NONE;
>         }
>
>         /* mapping to the client with new direction */
> -       sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -                               dma_dir);
> -       if (!sgt->nents) {
> +       if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>                 pr_err("failed to map scatterlist\n");
>                 mutex_unlock(lock);
>                 return ERR_PTR(-EIO);

Ditto.

Best regards,
Tomasz
