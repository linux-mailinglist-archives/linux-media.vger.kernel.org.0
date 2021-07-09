Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7ACE3C21B1
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 11:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbhGIJmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 05:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhGIJmS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 05:42:18 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6416CC0613E5
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 02:39:35 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id h6so11785233iok.6
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CPm+UWTNiAIbOXTnyThDLwHKCYRI8nfAa3UJkpw22i4=;
        b=YUqkR0wAiqFcellO135dfvE1OHkkkK/UZtngpoUb3duLFViGdej3lqzs8rW7zYXdYT
         XmBLzurgGguT+eVuQn2OAsWRYR3unlhnQcXwui28sTOdyJ15FzH4dp2WS1zgAKDmnHNT
         2mSGfcPf4WAcEwUjTfYwFFKUANeZUflOb5DpA/HaPSICE3kHmX1QFEGBASd+mJtymGF0
         21+C1kdfx6N5QmEefng8HIYihwp6tLrgj0WmSE0vjmw6Np0IP9FsOjL/yiwxcU2O9hbf
         0/E20dNh1Eqh2HZoUqydzpfBUwy0tIgaL3dry9m/YYb4Qpxcl4CVy8s+MNTCv5k0dVuT
         W3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CPm+UWTNiAIbOXTnyThDLwHKCYRI8nfAa3UJkpw22i4=;
        b=WmwhsULyvKRMBbFM2g2iKiWtFQkHw8V3RCIjn7hFJHtRfgKf9iSgWGOMD/YayYtXbC
         8UEYND/oG7dFXpxUGKpUCGkititIO+9wOpBvERvrjICah4HWu163XHcpqrP1DNm5gxtI
         Hk+NHJBPxpDHcT5dC800qp4w9N8LrYwfN6r9kDGR6EWZUeH8qlXIY4dmA6EkshIuTbFQ
         RoMGHfCYjcMFSHhdLWb2Ab4/2DKyPY913y3B03u1vcRlrLakcLV/S0tYe6AcOKTkP16a
         5+/S+qeNrnlDGkhStjkYAr23rJ2VYOiZT2/s4f+T5qGkipJBtMUycAchisB2DEAotsPI
         RrWQ==
X-Gm-Message-State: AOAM531AZgvFQue/jB8+zQOSh7q6Y7IabJeh3EuHsldkh0n1/zM3BvHW
        n+fkekRBjZMHNNqnvR+PKKRVdcr6U1nEAVGJVjyqdQ==
X-Google-Smtp-Source: ABdhPJz9hBCcJi5wbr9fX947LEIKbmpwMjcsEGA+ZlwVa7jEzL37XpfMwe+vnsSi16IqtEUtdVHeKOtpfM/gDHcOBxA=
X-Received: by 2002:a02:b155:: with SMTP id s21mr27123288jah.50.1625823574468;
 Fri, 09 Jul 2021 02:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210707062157.21176-1-yunfei.dong@mediatek.com> <20210707062157.21176-8-yunfei.dong@mediatek.com>
In-Reply-To: <20210707062157.21176-8-yunfei.dong@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 9 Jul 2021 17:39:23 +0800
Message-ID: <CA+Px+wUjJwksVfU6N8VZ9WMw-F-DHu67XwvDvMoiMcUBKF=P6Q@mail.gmail.com>
Subject: Re: [PATCH v1, 07/14] media: mtk-vcodec: Add msg queue feature for
 lat and core architecture
To:     Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 7, 2021 at 2:22 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> @@ -464,6 +469,11 @@ struct mtk_vcodec_enc_pdata {
>   * comp_dev: component hardware device
>   * component_node: component node
>   * comp_idx: component index
> + *
> + * core_read: Wait queue used to signalize when core get useful lat buffer
> + * core_queue: List of V4L2 lat_buf
To be neat, replace "Wait" to "wait" and "List" to "list".

> +int vdec_msg_queue_init(
> +       struct mtk_vcodec_ctx *ctx,
> +       struct vdec_msg_queue *msg_queue,
> +       core_decode_cb_t core_decode,
> +       int private_size)
> +{
> +       struct vdec_lat_buf *lat_buf;
> +       int i, err;
> +
> +       init_waitqueue_head(&msg_queue->lat_read);
> +       INIT_LIST_HEAD(&msg_queue->lat_queue);
> +       spin_lock_init(&msg_queue->lat_lock);
> +       msg_queue->num_lat = 0;
> +
> +       msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
> +               ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> +
> +       err = mtk_vcodec_mem_alloc(ctx, &msg_queue->wdma_addr);
> +       if (err) {
> +               mtk_v4l2_err("failed to allocate wdma_addr buf");
> +               return -ENOMEM;
> +       }
> +       msg_queue->wdma_rptr_addr = msg_queue->wdma_addr.dma_addr;
> +       msg_queue->wdma_wptr_addr = msg_queue->wdma_addr.dma_addr;
> +
> +       for (i = 0; i < NUM_BUFFER_COUNT; i++) {
> +               lat_buf = &msg_queue->lat_buf[i];
> +
> +               lat_buf->wdma_err_addr.size = VDEC_ERR_MAP_SZ_AVC;
> +               err = mtk_vcodec_mem_alloc(ctx, &lat_buf->wdma_err_addr);
> +               if (err) {
> +                       mtk_v4l2_err("failed to allocate wdma_err_addr buf[%d]", i);
> +                       return -ENOMEM;
> +               }
> +
> +               lat_buf->slice_bc_addr.size = VDEC_LAT_SLICE_HEADER_SZ;
> +               err = mtk_vcodec_mem_alloc(ctx, &lat_buf->slice_bc_addr);
> +               if (err) {
> +                       mtk_v4l2_err("failed to allocate wdma_addr buf[%d]", i);
> +                       return -ENOMEM;
> +               }
> +
> +               lat_buf->private_data = kzalloc(private_size, GFP_KERNEL);
> +               if (!lat_buf->private_data) {
> +                       mtk_v4l2_err("failed to allocate private_data[%d]", i);
> +                       return -ENOMEM;
> +               }
> +
> +               lat_buf->ctx = ctx;
> +               lat_buf->core_decode = core_decode;
> +               vdec_msg_queue_buf_to_lat(lat_buf);
> +       }
Doesn't it need to call mtk_vcodec_mem_free() and kfree() for any failure paths?

> +struct vdec_lat_buf *vdec_msg_queue_get_core_buf(
> +       struct mtk_vcodec_dev *dev)
> +{
> +       struct vdec_lat_buf *buf;
> +       int ret;
> +
> +       spin_lock(&dev->core_lock);
> +       if (list_empty(&dev->core_queue)) {
> +               mtk_v4l2_debug(3, "core queue is NULL, num_core = %d", dev->num_core);
> +               spin_unlock(&dev->core_lock);
> +               ret = wait_event_freezable(dev->core_read,
> +                       !list_empty(&dev->core_queue));
> +               if (ret)
> +                       return NULL;
Should be !ret?

> +void vdec_msg_queue_buf_to_core(struct mtk_vcodec_dev *dev,
> +       struct vdec_lat_buf *buf)
> +{
> +       spin_lock(&dev->core_lock);
> +       list_add_tail(&buf->core_list, &dev->core_queue);
> +       dev->num_core++;
> +       wake_up_all(&dev->core_read);
> +       mtk_v4l2_debug(3, "queu buf addr: (0x%p)", buf);
Typo.

> +bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
> +{
> +       long timeout_jiff;
> +       int ret, i;
> +
> +       for (i = 0; i < NUM_BUFFER_COUNT + 2; i++) {
> +              timeout_jiff = msecs_to_jiffies(1000);
> +              ret = wait_event_timeout(msg_queue->lat_read,
> +                    msg_queue->num_lat == NUM_BUFFER_COUNT, timeout_jiff);
> +              if (ret) {
> +                     mtk_v4l2_debug(3, "success to get lat buf: %d",
> +                            msg_queue->num_lat);
> +                     return true;
> +              }
> +       }
Why does it need the loop?  i is unused.

> +void vdec_msg_queue_deinit(
> +       struct mtk_vcodec_ctx *ctx,
> +       struct vdec_msg_queue *msg_queue)
> +{
> +       struct vdec_lat_buf *lat_buf;
> +       struct mtk_vcodec_mem *mem;
> +       int i;
> +
> +       mem = &msg_queue->wdma_addr;
> +       if (mem->va)
> +               mtk_vcodec_mem_free(ctx, mem);
> +       for (i = 0; i < NUM_BUFFER_COUNT; i++) {
> +               lat_buf = &msg_queue->lat_buf[i];
> +
> +               mem = &lat_buf->wdma_err_addr;
> +               if (mem->va)
> +                       mtk_vcodec_mem_free(ctx, mem);
> +
> +               mem = &lat_buf->slice_bc_addr;
> +               if (mem->va)
> +                       mtk_vcodec_mem_free(ctx, mem);
> +
> +               if (lat_buf->private_data)
> +                       kfree(lat_buf->private_data);
> +       }
> +
> +       msg_queue->init_done = false;
Have no idea what init_done does in the code.  It is not included in
any branch condition.

> +/**
> + * vdec_msg_queue_init - init lat buffer information.
> + * @ctx: v4l2 ctx
> + * @msg_queue: used to store the lat buffer information
> + * @core_decode: core decode callback for each codec
> + * @private_size: the private data size used to share with core
> + */
> +int vdec_msg_queue_init(
> +       struct mtk_vcodec_ctx *ctx,
> +       struct vdec_msg_queue *msg_queue,
> +       core_decode_cb_t core_decode,
> +       int private_size);
Would prefer to have *msg_queue as the first argument (also applies to
all operators of vdec_msg_queue).

> +/**
> + * vdec_msg_queue_get_core_buf - get used core buffer for lat decode.
> + * @dev: mtk vcodec device
> + */
> +struct vdec_lat_buf *vdec_msg_queue_get_core_buf(
> +       struct mtk_vcodec_dev *dev);
This is weird: vdec_msg_queue's operator but manipulating mtk_vcodec_dev?

> +
> +/**
> + * vdec_msg_queue_buf_to_core - queue buf to the core for core decode.
> + * @dev: mtk vcodec device
> + * @buf: current lat buffer
> + */
> +void vdec_msg_queue_buf_to_core(struct mtk_vcodec_dev *dev,
> +       struct vdec_lat_buf *buf);
Also weird.

> +/**
> + * vdec_msg_queue_buf_to_lat - queue buf to lat for lat decode.
> + * @buf: current lat buffer
> + */
> +void vdec_msg_queue_buf_to_lat(struct vdec_lat_buf *buf);
It should at least accept a struct vdec_msg_queue argument (or which
msg queue should the buf put into?).

> +/**
> + * vdec_msg_queue_update_ube_rptr - used to updata the ube read point.
Typo.

> +/**
> + * vdec_msg_queue_update_ube_wptr - used to updata the ube write point.
Typo.

> +/**
> + * vdec_msg_queue_deinit - deinit lat buffer information.
> + * @ctx: v4l2 ctx
> + * @msg_queue: used to store the lat buffer information
> + */
> +void vdec_msg_queue_deinit(
> +       struct mtk_vcodec_ctx *ctx,
> +       struct vdec_msg_queue *msg_queue);
Would prefer to have *msg_queue as the first argument.


The position of struct vdec_msg_queue is weird.  It looks like the msg
queue is only for struct vdec_lat_buf.  If so, would vdec_msg_queue be
better to call vdec_lat_queue or something similar?

It shouldn't touch the core queue in mtk_vcodec_dev anyway.  Is it
possible to generalize the queue-related code for both lat and core
queues?
