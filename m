Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9355742D733
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhJNKiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhJNKiB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:38:01 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5E5C061570;
        Thu, 14 Oct 2021 03:35:55 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 2E53B1F44A16
Subject: Re: [PATCH v7, 08/15] media: mtk-vcodec: Add msg queue feature for
 lat and core architecture
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-9-yunfei.dong@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <4e06a32c-872f-6dcd-fd83-2a597d0c3785@collabora.com>
Date:   Thu, 14 Oct 2021 12:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011070247.792-9-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> For lat and core architecture, lat thread will send message to core
> thread when lat decode done. Core hardware will use the message
> from lat to decode, then free message to lat thread when decode done.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   drivers/media/platform/mtk-vcodec/Makefile    |   1 +
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   5 +
>   .../platform/mtk-vcodec/vdec_msg_queue.c      | 258 ++++++++++++++++++
>   .../platform/mtk-vcodec/vdec_msg_queue.h      | 151 ++++++++++
>   4 files changed, 415 insertions(+)
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> 
> diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> index edeb3b66e9e9..5000e59da576 100644
> --- a/drivers/media/platform/mtk-vcodec/Makefile
> +++ b/drivers/media/platform/mtk-vcodec/Makefile
> @@ -11,6 +11,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
>   		mtk_vcodec_dec_drv.o \
>   		vdec_drv_if.o \
>   		vdec_vpu_if.o \
> +		vdec_msg_queue.o \
>   		mtk_vcodec_dec.o \
>   		mtk_vcodec_dec_stateful.o \
>   		mtk_vcodec_dec_stateless.o \
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index f8e8b5ba408b..ab401b2db30e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -15,7 +15,9 @@
>   #include <media/v4l2-ioctl.h>
>   #include <media/v4l2-mem2mem.h>
>   #include <media/videobuf2-core.h>
> +
>   #include "mtk_vcodec_util.h"
> +#include "vdec_msg_queue.h"
>   
>   #define MTK_VCODEC_DRV_NAME	"mtk_vcodec_drv"
>   #define MTK_VCODEC_DEC_NAME	"mtk-vcodec-dec"
> @@ -282,6 +284,8 @@ struct vdec_pic_info {
>    * @decoded_frame_cnt: number of decoded frames
>    * @lock: protect variables accessed by V4L2 threads and worker thread such as
>    *	  mtk_video_dec_buf.
> + *
> + * @msg_queue: msg queue used to store lat buffer information.
>    */
>   struct mtk_vcodec_ctx {
>   	enum mtk_instance_type type;
> @@ -325,6 +329,7 @@ struct mtk_vcodec_ctx {
>   	int decoded_frame_cnt;
>   	struct mutex lock;
>   
> +	struct vdec_msg_queue msg_queue;
>   };
>   
>   enum mtk_chip {
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> new file mode 100644
> index 000000000000..d66ed98c79a9
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> @@ -0,0 +1,258 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#include <linux/freezer.h>
> +#include <linux/interrupt.h>
> +#include <linux/kthread.h>
> +
> +#include "mtk_vcodec_dec_pm.h"
> +#include "mtk_vcodec_drv.h"
> +#include "vdec_msg_queue.h"
> +
> +#define VDEC_LAT_SLICE_HEADER_SZ    (640 * 1024)

This can be 640 * SZ_1K, or 5 * SZ_128K....
...if applicable, please multiply as value * alignment, such that, for example,
if the data needs to be 1K aligned, you should prefer writing it as 640 * SZ_1K.

> +#define VDEC_ERR_MAP_SZ_AVC         ((8192 / 16) * (4352 / 16) / 8)

...and you could do the same here... except, I see some sizes here being divided
and multiplied and I take that as a hint.
In that case, when you convert it to use sizes definitions, it would be very nice
if you keep that hint / better describe it in a comment.

> +
> +/* lat write decoded hardware information to trans buffer,
> + * and core will read the trans buffer to decode again. The
> + * trans buffer size of FHD and 4K bitstreams are different.
> + */
> +static int vde_msg_queue_get_trans_size(int width, int height)
> +{
> +	if (width > 1920 || height > 1088)
> +		return (30 * 1024 * 1024);

So here we're referring to buffer sizes. 1024 * 1024 is SZ_1M, as defined in
linux/sizes.h.

Means that this can be simply

		return 30 * SZ_1M;

> +	else
> +		return 6 * 1024 * 1024;

		return 6 * SZ_1M;

> +}
> +
> +void vdec_msg_queue_init_ctx(struct vdec_msg_queue_ctx *ctx,
> +	int hardware_index)
> +{
> +	init_waitqueue_head(&ctx->ready_to_use);
> +	INIT_LIST_HEAD(&ctx->ready_queue);
> +	spin_lock_init(&ctx->ready_lock);
> +	ctx->ready_num = 0;
> +	ctx->hardware_index = hardware_index;
> +}
> +
> +int vdec_msg_queue_init(
> +	struct vdec_msg_queue *msg_queue,
> +	struct mtk_vcodec_ctx *ctx,
> +	core_decode_cb_t core_decode,
> +	int private_size)
> +{
> +	struct vdec_lat_buf *lat_buf;
> +	int i, err;
> +
> +	/* already init msg queue */
> +	if (msg_queue->wdma_addr.size)
> +		return 0;
> +
> +	vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
> +	msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
> +		ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> +
> +	err = mtk_vcodec_mem_alloc(ctx, &msg_queue->wdma_addr);
> +	if (err) {
> +		mtk_v4l2_err("failed to allocate wdma_addr buf");
> +		return -ENOMEM;
> +	}
> +	msg_queue->wdma_rptr_addr = msg_queue->wdma_addr.dma_addr;
> +	msg_queue->wdma_wptr_addr = msg_queue->wdma_addr.dma_addr;
> +
> +	for (i = 0; i < NUM_BUFFER_COUNT; i++) {
> +		lat_buf = &msg_queue->lat_buf[i];
> +
> +		lat_buf->wdma_err_addr.size = VDEC_ERR_MAP_SZ_AVC;
> +		err = mtk_vcodec_mem_alloc(ctx, &lat_buf->wdma_err_addr);
> +		if (err) {
> +			mtk_v4l2_err("failed to allocate wdma_err_addr buf[%d]", i);
> +			goto mem_alloc_err;
> +		}
> +
> +		lat_buf->slice_bc_addr.size = VDEC_LAT_SLICE_HEADER_SZ;
> +		err = mtk_vcodec_mem_alloc(ctx, &lat_buf->slice_bc_addr);
> +		if (err) {
> +			mtk_v4l2_err("failed to allocate wdma_addr buf[%d]", i);
> +			goto mem_alloc_err;
> +		}
> +
> +		lat_buf->private_data = kzalloc(private_size, GFP_KERNEL);
> +		if (!lat_buf->private_data) {
> +			mtk_v4l2_err("failed to allocate private_data[%d]", i);
> +			goto mem_alloc_err;
> +		}
> +
> +		lat_buf->ctx = ctx;
> +		lat_buf->core_decode = core_decode;
> +		vdec_msg_queue_qbuf(&msg_queue->lat_ctx, lat_buf);
> +	}
> +	return 0;
> +
> +mem_alloc_err:
> +	vdec_msg_queue_deinit(msg_queue, ctx);
> +	return -ENOMEM;
> +}
> +
> +static struct list_head *vdec_get_buf_list(int hardware_index,
> +	struct vdec_lat_buf *buf)
> +{
> +	switch (hardware_index) {
> +	case MTK_VDEC_CORE:
> +		return &buf->core_list;
> +	case MTK_VDEC_LAT0:
> +		return &buf->lat_list;
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +void vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *ctx,
> +	struct vdec_lat_buf *buf)
> +{
> +	struct list_head *head;
> +
> +	head = vdec_get_buf_list(ctx->hardware_index, buf);
> +	if (!head) {
> +		mtk_v4l2_err("fail to qbuf: %d",ctx->hardware_index);
> +		return;
> +	}
> +
> +	spin_lock(&ctx->ready_lock);
> +	list_add_tail(head, &ctx->ready_queue);
> +	ctx->ready_num++;
> +
> +	wake_up_all(&ctx->ready_to_use);
> +
> +	mtk_v4l2_debug(3, "enqueue buf type: %d addr: 0x%p num: %d",
> +		ctx->hardware_index, buf, ctx->ready_num);
> +	spin_unlock(&ctx->ready_lock);
> +}
> +
> +static bool vdec_msg_queue_wait_event(struct vdec_msg_queue_ctx *ctx)
> +{
> +	long timeout_jiff;
> +	int ret;
> +
> +	if (ctx->hardware_index == MTK_VDEC_CORE) {
> +		ret = wait_event_freezable(ctx->ready_to_use,
> +			!list_empty(&ctx->ready_queue));
> +		if (ret)
> +			return false;
> +	} else {
> +		timeout_jiff = msecs_to_jiffies(1500);
> +		ret = wait_event_timeout(ctx->ready_to_use,
> +			!list_empty(&ctx->ready_queue), timeout_jiff);

Suggestion (feel free to not follow this one): since you're using that
msecs_to_jiffies(1500) return value only for this wait_event_timeout call,
you may as well remove the timeout_jiff variable and simply do

		ret = wait_event_timeout(ctx->ready_to_use,

					 !list_empty(&ctx->ready_queue),
					 msecs_to_jiffies(1500));

> +		if (!ret)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +struct vdec_lat_buf *vdec_msg_queue_dqbuf(struct vdec_msg_queue_ctx *ctx)
> +{
> +	struct vdec_lat_buf *buf;
> +	struct list_head *head;
> +	int ret;
> +
> +	spin_lock(&ctx->ready_lock);
> +	if (list_empty(&ctx->ready_queue)) {
> +		mtk_v4l2_debug(3, "queue is NULL, type:%d num: %d",
> +			ctx->hardware_index, ctx->ready_num);
> +		spin_unlock(&ctx->ready_lock);
> +		ret = vdec_msg_queue_wait_event(ctx);
> +		if (!ret)
> +			return NULL;
> +		spin_lock(&ctx->ready_lock);
> +	}
> +
> +	if (ctx->hardware_index == MTK_VDEC_CORE)
> +		buf = list_first_entry(&ctx->ready_queue,
> +			struct vdec_lat_buf, core_list);
> +	else
> +		buf = list_first_entry(&ctx->ready_queue,
> +			struct vdec_lat_buf, lat_list);
> +
> +	head = vdec_get_buf_list(ctx->hardware_index, buf);
> +	if (!head) {
> +		mtk_v4l2_err("fail to dqbuf: %d",ctx->hardware_index);
> +		return NULL;
> +	}
> +	list_del(head);
> +
> +	ctx->ready_num--;
> +	mtk_v4l2_debug(3, "dqueue buf type:%d addr: 0x%p num: %d",
> +		ctx->hardware_index, buf, ctx->ready_num);
> +	spin_unlock(&ctx->ready_lock);
> +
> +	return buf;
> +}
> +
> +void vdec_msg_queue_update_ube_rptr(struct vdec_msg_queue *msg_queue,
> +	uint64_t ube_rptr)
> +{
> +	spin_lock(&msg_queue->lat_ctx.ready_lock);
> +	msg_queue->wdma_rptr_addr = ube_rptr;
> +	mtk_v4l2_debug(3, "update ube rprt (0x%llx)", ube_rptr);
> +	spin_unlock(&msg_queue->lat_ctx.ready_lock);
> +}
> +
> +void vdec_msg_queue_update_ube_wptr(struct vdec_msg_queue *msg_queue,
> +	uint64_t ube_wptr)
> +{
> +	spin_lock(&msg_queue->lat_ctx.ready_lock);
> +	msg_queue->wdma_wptr_addr = ube_wptr;
> +	mtk_v4l2_debug(3, "update ube wprt: (0x%llx 0x%llx) offset: 0x%llx",
> +		msg_queue->wdma_rptr_addr, msg_queue->wdma_wptr_addr, ube_wptr);
> +	spin_unlock(&msg_queue->lat_ctx.ready_lock);
> +}
> +
> +bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
> +{
> +	long timeout_jiff;
> +	int ret;
> +
> +	timeout_jiff = msecs_to_jiffies(1000 * (NUM_BUFFER_COUNT + 2));
> +
> +	ret = wait_event_timeout(msg_queue->lat_ctx.ready_to_use,
> +		msg_queue->lat_ctx.ready_num == NUM_BUFFER_COUNT,
> +		timeout_jiff);
> +	if (ret) {
> +		mtk_v4l2_debug(3, "success to get lat buf: %d",
> +			msg_queue->lat_ctx.ready_num);
> +		return true;
> +	}
> +	mtk_v4l2_err("failed with lat buf isn't full: %d",
> +		msg_queue->lat_ctx.ready_num);
> +	return false;
> +}
> +
> +void vdec_msg_queue_deinit(
> +	struct vdec_msg_queue *msg_queue,
> +	struct mtk_vcodec_ctx *ctx)
> +{
> +	struct vdec_lat_buf *lat_buf;
> +	struct mtk_vcodec_mem *mem;
> +	int i;
> +
> +	mem = &msg_queue->wdma_addr;
> +	if (mem->va)
> +		mtk_vcodec_mem_free(ctx, mem);
> +	for (i = 0; i < NUM_BUFFER_COUNT; i++) {
> +		lat_buf = &msg_queue->lat_buf[i];
> +
> +		mem = &lat_buf->wdma_err_addr;
> +		if (mem->va)
> +			mtk_vcodec_mem_free(ctx, mem);
> +
> +		mem = &lat_buf->slice_bc_addr;
> +		if (mem->va)
> +			mtk_vcodec_mem_free(ctx, mem);
> +
> +		if (lat_buf->private_data)
> +			kfree(lat_buf->private_data);
> +	}
> +}
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> new file mode 100644
> index 000000000000..1905ce713592
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#ifndef _VDEC_MSG_QUEUE_H_
> +#define _VDEC_MSG_QUEUE_H_
> +
> +#include <linux/sched.h>
> +#include <linux/semaphore.h>
> +#include <linux/slab.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "mtk_vcodec_util.h"
> +
> +#define NUM_BUFFER_COUNT 3
> +
> +struct vdec_lat_buf;
> +struct mtk_vcodec_ctx;
> +struct mtk_vcodec_dev;
> +typedef int (*core_decode_cb_t)(struct vdec_lat_buf *lat_buf);
> +
> +/**
> + * struct vdec_msg_queue_ctx - represents a queue for buffers ready to be
> + *	                           processed

I would prefer if you don't break this line, 84 columns is fine to have.

> + * @ready_used: ready used queue used to signalize when get a job queue
> + * @ready_queue: list of ready lat buffer queues
> + * @ready_lock: spin lock to protect the lat buffer usage
> + * @ready_num: number of buffers ready to be processed
> + * @hardware_index: hardware id that this queue is used for
> + */
> +struct vdec_msg_queue_ctx {
> +	wait_queue_head_t ready_to_use;
> +	struct list_head ready_queue;
> +	spinlock_t ready_lock;
> +	int ready_num;
> +	int hardware_index;
> +};
> +
> +/**
> + * struct vdec_lat_buf - lat buffer message used to store lat
> + *                       info for core decode
> + * @wdma_err_addr: wdma error address used for lat hardware
> + * @slice_bc_addr: slice bc address used for lat hardware
> + * @ts_info: need to set timestamp from output to capture
> + *
> + * @private_data: shared information used to lat and core hardware
> + * @ctx: mtk vcodec context information
> + * @core_decode: different codec use different decode callback function
> + * @lat_list: add lat buffer to lat head list
> + * @core_list: add lat buffer to core head list
> + */
> +struct vdec_lat_buf {
> +	struct mtk_vcodec_mem wdma_err_addr;
> +	struct mtk_vcodec_mem slice_bc_addr;
> +	struct vb2_v4l2_buffer ts_info;
> +
> +	void *private_data;
> +	struct mtk_vcodec_ctx *ctx;
> +	core_decode_cb_t core_decode;
> +	struct list_head lat_list;
> +	struct list_head core_list;
> +};
> +
> +/**
> + * struct vdec_msg_queue - used to store lat buffer message
> + * @lat_buf: lat buffer used to store lat buffer information
> + * @wdma_addr: wdma address used for ube
> + * @wdma_rptr_addr: ube read point
> + * @wdma_wptr_addr: ube write point
> + * @lat_ctx: used to store lat buffer list
> + */
> +struct vdec_msg_queue {
> +	struct vdec_lat_buf lat_buf[NUM_BUFFER_COUNT];
> +
> +	struct mtk_vcodec_mem wdma_addr;
> +	uint64_t wdma_rptr_addr;
> +	uint64_t wdma_wptr_addr;
> +
> +	struct vdec_msg_queue_ctx lat_ctx;
> +};
> +
> +/**
> + * vdec_msg_queue_init - init lat buffer information.
> + * @msg_queue: used to store the lat buffer information
> + * @ctx: v4l2 ctx
> + * @core_decode: core decode callback for each codec
> + * @private_size: the private data size used to share with core
> + */
> +int vdec_msg_queue_init(
> +	struct vdec_msg_queue *msg_queue,
> +	struct mtk_vcodec_ctx *ctx,
> +	core_decode_cb_t core_decode,
> +	int private_size);
> +
> +/**
> + * vdec_msg_queue_init_ctx - used to init msg queue context information.
> + * @ctx: message queue context
> + * @hardware_index: hardware index
> + */
> +void vdec_msg_queue_init_ctx(struct vdec_msg_queue_ctx *ctx,
> +	int hardware_index);
> +
> +/**
> + * vdec_msg_queue_qbuf - enqueue lat buffer to queue list.
> + * @ctx: message queue context
> + * @buf: current lat buffer
> + */
> +void vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *ctx,
> +	struct vdec_lat_buf *buf);
> +
> +/**
> + * vdec_msg_queue_dqbuf - dequeue lat buffer from queue list.
> + * @ctx: message queue context
> + */
> +struct vdec_lat_buf *vdec_msg_queue_dqbuf(struct vdec_msg_queue_ctx *ctx);
> +
> +/**
> + * vdec_msg_queue_update_ube_rptr - used to updata the ube read point.
> + * @msg_queue: used to store the lat buffer information
> + * @ube_rptr: current ube read point
> + */
> +void vdec_msg_queue_update_ube_rptr(struct vdec_msg_queue *msg_queue,
> +	uint64_t ube_rptr);
> +
> +/**
> + * vdec_msg_queue_update_ube_wptr - used to updata the ube write point.
> + * @msg_queue: used to store the lat buffer information
> + * @ube_wptr: current ube write point
> + */
> +void vdec_msg_queue_update_ube_wptr(struct vdec_msg_queue *msg_queue,
> +	uint64_t ube_wptr);
> +
> +/**
> + * vdec_msg_queue_wait_lat_buf_full - used to check whether all lat buffer
> + *                                    in lat list.
> + * @msg_queue: used to store the lat buffer information
> + */
> +bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue);
> +
> +/**
> + * vdec_msg_queue_deinit - deinit lat buffer information.
> + * @msg_queue: used to store the lat buffer information
> + * @ctx: v4l2 ctx
> + */
> +void vdec_msg_queue_deinit(
> +	struct vdec_msg_queue *msg_queue,
> +	struct mtk_vcodec_ctx *ctx);
> +

void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
			   struct mtk_vcodec_ctx *ctx);
> +#endif
> 
Regards,
- Angelo
