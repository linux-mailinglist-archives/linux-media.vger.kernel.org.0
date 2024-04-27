Return-Path: <linux-media+bounces-10272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8A78B46E5
	for <lists+linux-media@lfdr.de>; Sat, 27 Apr 2024 17:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E4B81F21E59
	for <lists+linux-media@lfdr.de>; Sat, 27 Apr 2024 15:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E426511721;
	Sat, 27 Apr 2024 15:44:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9B313AF2
	for <linux-media@vger.kernel.org>; Sat, 27 Apr 2024 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714232693; cv=none; b=aQEX8Kz/y3hX+aCjlUJzlXSn39Jw9T7571r+G0qtjmgooYe19Vr/GFVJzooF3NO98YOwKhLjmYmpAjVkAPaUUt5XgsJBXrwyNl+Zm0bx/5pyAAe47clIb6eQLLg0VYE/fxKyMRwJkIqhpiBeN5vCpVEw+X+qTzSmLpqXiOb0o2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714232693; c=relaxed/simple;
	bh=QV5tf88qbi6KTId5mBGDTr7OE75KEhNieAhELgg3XaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKd0DaxfEkIePAO3FUsUdn3FglJMaLNc0wxqi47fE6prMMf+9clIHSeHGvFNDTvKWXkRk9eZ491JwawgYDwLr8xrYRhYIQ+4noRxNgVs2TceSOAmQoi0rkTGFx5Y4k18q9W1kbEyC/G3gN/axltzOZHc5vmjIqZO5t83OJaoPDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC364C113CE;
	Sat, 27 Apr 2024 15:44:49 +0000 (UTC)
Message-ID: <3d8a4af4-4a5f-49fd-8933-dad4f2066876@xs4all.nl>
Date: Sat, 27 Apr 2024 17:44:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/18] media: intel/ipu6: input system video nodes and
 buffer queues
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com, laurent.pinchart@ideasonboard.com,
 andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
 senozhatsky@chromium.org, andreaskleist@gmail.com,
 bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
 <20240426095822.946453-13-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwECACgFAlQ84W0CGwMFCRLMAwAGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAACEJEL0tYUhmFDtMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wT
 7w//frEmPBAwu3OdvAk9VDkH7X+7RcFpiuUcJxs3Xl6jpaA+SdwtZra6W1uMrs2RW8eXXiq/
 80HXJtYnal1Y8MKUBoUVhT/+5+KcMyfVQK3VFRHnNxCmC9HZV+qdyxAGwIscUd4hSlweuU6L
 6tI7Dls6NzKRSTFbbGNZCRgl8OrF01TBH+CZrcFIoDgpcJA5Pw84mxo+wd2BZjPA4TNyq1od
 +slSRbDqFug1EqQaMVtUOdgaUgdlmjV0+GfBHoyCGedDE0knv+tRb8v5gNgv7M3hJO3Nrl+O
 OJVoiW0G6OWVyq92NNCKJeDy8XCB1yHCKpBd4evO2bkJNV9xcgHtLrVqozqxZAiCRKN1elWF
 1fyG8KNquqItYedUr+wZZacqW+uzpVr9pZmUqpVCk9s92fzTzDZcGAxnyqkaO2QTgdhPJT2m
 wpG2UwIKzzi13tmwakY7OAbXm76bGWVZCO3QTHVnNV8ku9wgeMc/ZGSLUT8hMDZlwEsW7u/D
 qt+NlTKiOIQsSW7u7h3SFm7sMQo03X/taK9PJhS2BhhgnXg8mOa6U+yNaJy+eU0Lf5hEUiDC
 vDOI5x++LD3pdrJVr/6ZB0Qg3/YzZ0dk+phQ+KlP6HyeO4LG662toMbFbeLcBjcC/ceEclII
 90QNEFSZKM6NVloM+NaZRYVO3ApxWkFu+1mrVTXOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAECAA8FAlQ84W0CGwwFCRLMAwAAIQkQvS1hSGYUO0wW
 IQQFLN57whUFO2ifG8q9LWFIZhQ7TA1WD/9yxJvQrpf6LcNrr8uMlQWCg2iz2q1LGt1Itkuu
 KaavEF9nqHmoqhSfZeAIKAPn6xuYbGxXDrpN7dXCOH92fscLodZqZtK5FtbLvO572EPfxneY
 UT7JzDc/5LT9cFFugTMOhq1BG62vUm/F6V91+unyp4dRlyryAeqEuISykhvjZCVHk/woaMZv
 c1Dm4Uvkv0Ilelt3Pb9J7zhcx6sm5T7v16VceF96jG61bnJ2GFS+QZerZp3PY27XgtPxRxYj
 AmFUeF486PHx/2Yi4u1rQpIpC5inPxIgR1+ZFvQrAV36SvLFfuMhyCAxV6WBlQc85ArOiQZB
 Wm7L0repwr7zEJFEkdy8C81WRhMdPvHkAIh3RoY1SGcdB7rB3wCzfYkAuCBqaF7Zgfw8xkad
 KEiQTexRbM1sc/I8ACpla3N26SfQwrfg6V7TIoweP0RwDrcf5PVvwSWsRQp2LxFCkwnCXOra
 gYmkrmv0duG1FStpY+IIQn1TOkuXrciTVfZY1cZD0aVxwlxXBnUNZZNslldvXFtndxR0SFat
 sflovhDxKyhFwXOP0Rv8H378/+14TaykknRBIKEc0+lcr+EMOSUR5eg4aURb8Gc3Uc7fgQ6q
 UssTXzHPyj1hAyDpfu8DzAwlh4kKFTodxSsKAjI45SLjadSc94/5Gy8645Y1KgBzBPTH7Q==
In-Reply-To: <20240426095822.946453-13-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/04/2024 11:58, Sakari Ailus wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Register V4L2 video device and setup the VB2 queues to support video
> capture. Video streaming callback will trigger the input system driver to
> construct a input system stream configuration for firmware based on data
> type and stream ID and then queue buffers to firmware to do capture.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  810 +++++++++++
>  .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   78 ++
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1247 +++++++++++++++++
>  .../media/pci/intel/ipu6/ipu6-isys-video.h    |  132 ++
>  4 files changed, 2267 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> new file mode 100644
> index 000000000000..b011293ad615
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -0,0 +1,810 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2013--2024 Intel Corporation
> + */
> +#include <linux/atomic.h>
> +#include <linux/bug.h>
> +#include <linux/device.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +#include <media/media-entity.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "ipu6-bus.h"
> +#include "ipu6-fw-isys.h"
> +#include "ipu6-isys.h"
> +#include "ipu6-isys-video.h"
> +
> +static int queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
> +		       unsigned int *num_planes, unsigned int sizes[],
> +		       struct device *alloc_devs[])
> +{
> +	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
> +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +	u32 size = av->pix_fmt.sizeimage;
> +
> +	/* num_planes == 0: we're being called through VIDIOC_REQBUFS */
> +	if (!*num_planes) {
> +		sizes[0] = size;
> +	} else if (sizes[0] < size) {
> +		dev_err(dev, "%s: queue setup: size %u < %u\n",
> +			av->vdev.name, sizes[0], size);
> +		return -EINVAL;
> +	}
> +
> +	*num_planes = 1;
> +	alloc_devs[0] = aq->dev;

Don't set this. This is already done by the vb2 core. Setting this is only
necessary for very weird hardware that uses a different device per plane.

> +
> +	return 0;
> +}
> +
> +static int ipu6_isys_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
> +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +
> +	dev_dbg(dev, "buffer: %s: configured size %u, buffer size %lu\n",
> +		av->vdev.name, av->pix_fmt.sizeimage,
> +		vb2_plane_size(vb, 0));
> +
> +	if (av->pix_fmt.sizeimage > vb2_plane_size(vb, 0))
> +		return -EINVAL;
> +
> +	vb2_set_plane_payload(vb, 0, av->pix_fmt.bytesperline *
> +			      av->pix_fmt.height);
> +	vb->planes[0].data_offset = 0;
> +
> +	return 0;
> +}
> +
> +/*
> + * Queue a buffer list back to incoming or active queues. The buffers
> + * are removed from the buffer list.
> + */
> +void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
> +				 unsigned long op_flags,
> +				 enum vb2_buffer_state state)
> +{
> +	struct ipu6_isys_buffer *ib, *ib_safe;
> +	unsigned long flags;
> +	bool first = true;
> +
> +	if (!bl)
> +		return;
> +
> +	WARN_ON_ONCE(!bl->nbufs);
> +	WARN_ON_ONCE(op_flags & IPU6_ISYS_BUFFER_LIST_FL_ACTIVE &&
> +		     op_flags & IPU6_ISYS_BUFFER_LIST_FL_INCOMING);
> +
> +	list_for_each_entry_safe(ib, ib_safe, &bl->head, head) {
> +		struct ipu6_isys_video *av;
> +		struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
> +		struct ipu6_isys_queue *aq =
> +			vb2_queue_to_isys_queue(vb->vb2_queue);
> +		struct device *dev;
> +
> +		av = ipu6_isys_queue_to_video(aq);
> +		dev = &av->isys->adev->auxdev.dev;
> +		spin_lock_irqsave(&aq->lock, flags);
> +		list_del(&ib->head);
> +		if (op_flags & IPU6_ISYS_BUFFER_LIST_FL_ACTIVE)
> +			list_add(&ib->head, &aq->active);
> +		else if (op_flags & IPU6_ISYS_BUFFER_LIST_FL_INCOMING)
> +			list_add_tail(&ib->head, &aq->incoming);
> +		spin_unlock_irqrestore(&aq->lock, flags);
> +
> +		if (op_flags & IPU6_ISYS_BUFFER_LIST_FL_SET_STATE)
> +			vb2_buffer_done(vb, state);
> +
> +		if (first) {
> +			dev_dbg(dev,
> +				"queue buf list %p flags %lx, s %d, %d bufs\n",
> +				bl, op_flags, state, bl->nbufs);
> +			first = false;
> +		}
> +
> +		bl->nbufs--;
> +	}
> +
> +	WARN_ON(bl->nbufs);
> +}
> +
> +/*
> + * flush_firmware_streamon_fail() - Flush in cases where requests may
> + * have been queued to firmware and the *firmware streamon fails for a
> + * reason or another.
> + */
> +static void flush_firmware_streamon_fail(struct ipu6_isys_stream *stream)
> +{
> +	struct device *dev = &stream->isys->adev->auxdev.dev;
> +	struct ipu6_isys_queue *aq;
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&stream->mutex);
> +
> +	list_for_each_entry(aq, &stream->queues, node) {
> +		struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> +		struct ipu6_isys_buffer *ib, *ib_safe;
> +
> +		spin_lock_irqsave(&aq->lock, flags);
> +		list_for_each_entry_safe(ib, ib_safe, &aq->active, head) {
> +			struct vb2_buffer *vb =
> +				ipu6_isys_buffer_to_vb2_buffer(ib);
> +
> +			list_del(&ib->head);
> +			if (av->streaming) {
> +				dev_dbg(dev,
> +					"%s: queue buffer %u back to incoming\n",
> +					av->vdev.name, vb->index);
> +				/* Queue already streaming, return to driver. */
> +				list_add(&ib->head, &aq->incoming);
> +				continue;
> +			}
> +			/* Queue not yet streaming, return to user. */
> +			dev_dbg(dev, "%s: return %u back to videobuf2\n",
> +				av->vdev.name, vb->index);
> +			vb2_buffer_done(ipu6_isys_buffer_to_vb2_buffer(ib),
> +					VB2_BUF_STATE_QUEUED);
> +		}
> +		spin_unlock_irqrestore(&aq->lock, flags);
> +	}
> +}
> +
> +/*
> + * Attempt obtaining a buffer list from the incoming queues, a list of buffers
> + * that contains one entry from each video buffer queue. If a buffer can't be
> + * obtained from every queue, the buffers are returned back to the queue.
> + */
> +static int buffer_list_get(struct ipu6_isys_stream *stream,
> +			   struct ipu6_isys_buffer_list *bl)
> +{
> +	struct device *dev = &stream->isys->adev->auxdev.dev;
> +	struct ipu6_isys_queue *aq;
> +	unsigned long flags;
> +	unsigned long buf_flag = IPU6_ISYS_BUFFER_LIST_FL_INCOMING;
> +
> +	bl->nbufs = 0;
> +	INIT_LIST_HEAD(&bl->head);
> +
> +	list_for_each_entry(aq, &stream->queues, node) {
> +		struct ipu6_isys_buffer *ib;
> +
> +		spin_lock_irqsave(&aq->lock, flags);
> +		if (list_empty(&aq->incoming)) {
> +			spin_unlock_irqrestore(&aq->lock, flags);
> +			if (!list_empty(&bl->head))
> +				ipu6_isys_buffer_list_queue(bl, buf_flag, 0);
> +			return -ENODATA;
> +		}
> +
> +		ib = list_last_entry(&aq->incoming,
> +				     struct ipu6_isys_buffer, head);
> +
> +		dev_dbg(dev, "buffer: %s: buffer %u\n",
> +			ipu6_isys_queue_to_video(aq)->vdev.name,
> +			ipu6_isys_buffer_to_vb2_buffer(ib)->index);
> +		list_del(&ib->head);
> +		list_add(&ib->head, &bl->head);
> +		spin_unlock_irqrestore(&aq->lock, flags);
> +
> +		bl->nbufs++;
> +	}
> +
> +	dev_dbg(dev, "get buffer list %p, %u buffers\n", bl, bl->nbufs);
> +
> +	return 0;
> +}
> +
> +static void
> +ipu6_isys_buf_to_fw_frame_buf_pin(struct vb2_buffer *vb,
> +				  struct ipu6_fw_isys_frame_buff_set_abi *set)
> +{
> +	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
> +
> +	set->output_pins[aq->fw_output].addr =
> +		vb2_dma_contig_plane_dma_addr(vb, 0);
> +	set->output_pins[aq->fw_output].out_buf_id = vb->index + 1;
> +}
> +
> +/*
> + * Convert a buffer list to a isys fw ABI framebuffer set. The
> + * buffer list is not modified.
> + */
> +#define IPU6_ISYS_FRAME_NUM_THRESHOLD  (30)
> +void
> +ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
> +			      struct ipu6_isys_stream *stream,
> +			      struct ipu6_isys_buffer_list *bl)
> +{
> +	struct ipu6_isys_buffer *ib;
> +
> +	WARN_ON(!bl->nbufs);
> +
> +	set->send_irq_sof = 1;
> +	set->send_resp_sof = 1;
> +	set->send_irq_eof = 0;
> +	set->send_resp_eof = 0;
> +
> +	if (stream->streaming)
> +		set->send_irq_capture_ack = 0;
> +	else
> +		set->send_irq_capture_ack = 1;
> +	set->send_irq_capture_done = 0;
> +
> +	set->send_resp_capture_ack = 1;
> +	set->send_resp_capture_done = 1;
> +	if (atomic_read(&stream->sequence) >= IPU6_ISYS_FRAME_NUM_THRESHOLD) {
> +		set->send_resp_capture_ack = 0;
> +		set->send_resp_capture_done = 0;
> +	}
> +
> +	list_for_each_entry(ib, &bl->head, head) {
> +		struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
> +
> +		ipu6_isys_buf_to_fw_frame_buf_pin(vb, set);
> +	}
> +}
> +
> +/* Start streaming for real. The buffer list must be available. */
> +static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
> +				  struct ipu6_isys_buffer_list *bl, bool error)
> +{
> +	struct ipu6_isys_stream *stream = av->stream;
> +	struct device *dev = &stream->isys->adev->auxdev.dev;
> +	struct ipu6_isys_buffer_list __bl;
> +	int ret;
> +
> +	mutex_lock(&stream->isys->stream_mutex);
> +	ret = ipu6_isys_video_set_streaming(av, 1, bl);
> +	mutex_unlock(&stream->isys->stream_mutex);
> +	if (ret)
> +		goto out_requeue;
> +
> +	stream->streaming = 1;
> +
> +	bl = &__bl;
> +
> +	do {
> +		struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
> +		struct isys_fw_msgs *msg;
> +		u16 send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_CAPTURE;
> +
> +		ret = buffer_list_get(stream, bl);
> +		if (ret < 0)
> +			break;
> +
> +		msg = ipu6_get_fw_msg_buf(stream);
> +		if (!msg)
> +			return -ENOMEM;
> +
> +		buf = &msg->fw_msg.frame;
> +		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
> +		ipu6_fw_isys_dump_frame_buff_set(dev, buf,
> +						 stream->nr_output_pins);
> +		ipu6_isys_buffer_list_queue(bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE,
> +					    0);
> +		ret = ipu6_fw_isys_complex_cmd(stream->isys,
> +					       stream->stream_handle, buf,
> +					       msg->dma_addr, sizeof(*buf),
> +					       send_type);
> +	} while (!WARN_ON(ret));
> +
> +	return 0;
> +
> +out_requeue:
> +	if (bl && bl->nbufs)
> +		ipu6_isys_buffer_list_queue(bl,
> +					    (IPU6_ISYS_BUFFER_LIST_FL_INCOMING |
> +					     error) ?
> +					    IPU6_ISYS_BUFFER_LIST_FL_SET_STATE :
> +					    0, error ? VB2_BUF_STATE_ERROR :
> +					    VB2_BUF_STATE_QUEUED);
> +	flush_firmware_streamon_fail(stream);
> +
> +	return ret;
> +}
> +
> +static void buf_queue(struct vb2_buffer *vb)
> +{
> +	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
> +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> +	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
> +	struct ipu6_isys_video_buffer *ivb =
> +		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
> +	struct ipu6_isys_buffer *ib = &ivb->ib;
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +	struct media_pipeline *media_pipe =
> +		media_entity_pipeline(&av->vdev.entity);
> +	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
> +	struct ipu6_isys_stream *stream = av->stream;
> +	struct ipu6_isys_buffer_list bl;
> +	struct isys_fw_msgs *msg;
> +	unsigned long flags;
> +	dma_addr_t dma;
> +	unsigned int i;
> +	int ret;
> +
> +	dev_dbg(dev, "queue buffer %u for %s\n", vb->index, av->vdev.name);
> +
> +	for (i = 0; i < vb->num_planes; i++) {
> +		dma = vb2_dma_contig_plane_dma_addr(vb, i);
> +		dev_dbg(dev, "iova: plane %u iova %pad\n", i, &dma);
> +	}
> +
> +	spin_lock_irqsave(&aq->lock, flags);
> +	list_add(&ib->head, &aq->incoming);
> +	spin_unlock_irqrestore(&aq->lock, flags);
> +
> +	if (!media_pipe || !vb->vb2_queue->start_streaming_called) {
> +		dev_dbg(dev, "media pipeline is not ready for %s\n",
> +			av->vdev.name);
> +		return;
> +	}
> +
> +	mutex_lock(&stream->mutex);
> +
> +	if (stream->nr_streaming != stream->nr_queues) {
> +		dev_dbg(dev, "not streaming yet, adding to incoming\n");
> +		goto out;
> +	}
> +
> +	/*
> +	 * We just put one buffer to the incoming list of this queue
> +	 * (above). Let's see whether all queues in the pipeline would
> +	 * have a buffer.
> +	 */
> +	ret = buffer_list_get(stream, &bl);
> +	if (ret < 0) {
> +		dev_warn(dev, "No buffers available\n");
> +		goto out;
> +	}
> +
> +	msg = ipu6_get_fw_msg_buf(stream);
> +	if (!msg) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	buf = &msg->fw_msg.frame;
> +	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
> +	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
> +
> +	if (!stream->streaming) {
> +		ret = ipu6_isys_stream_start(av, &bl, true);
> +		if (ret)
> +			dev_err(dev, "stream start failed.\n");
> +		goto out;
> +	}
> +
> +	/*
> +	 * We must queue the buffers in the buffer list to the
> +	 * appropriate video buffer queues BEFORE passing them to the
> +	 * firmware since we could get a buffer event back before we
> +	 * have queued them ourselves to the active queue.
> +	 */
> +	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
> +
> +	ret = ipu6_fw_isys_complex_cmd(stream->isys, stream->stream_handle,
> +				       buf, msg->dma_addr, sizeof(*buf),
> +				       IPU6_FW_ISYS_SEND_TYPE_STREAM_CAPTURE);
> +	if (ret < 0)
> +		dev_err(dev, "send stream capture failed\n");
> +
> +out:
> +	mutex_unlock(&stream->mutex);
> +}
> +
> +static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
> +{
> +	struct v4l2_mbus_framefmt format;
> +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +	struct media_pad *remote_pad =
> +		media_pad_remote_pad_first(av->vdev.entity.pads);
> +	struct v4l2_subdev *sd;
> +	u32 r_stream;
> +	int ret;
> +
> +	if (!remote_pad)
> +		return -ENOTCONN;
> +
> +	sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, remote_pad->index);
> +
> +	ret = ipu6_isys_get_stream_pad_fmt(sd, remote_pad->index, r_stream,
> +					   &format);
> +
> +	if (ret) {
> +		dev_dbg(dev, "failed to get %s: pad %d, stream:%d format\n",
> +			sd->entity.name, remote_pad->index, r_stream);
> +		return ret;
> +	}
> +
> +	if (format.width != av->pix_fmt.width ||
> +	    format.height != av->pix_fmt.height) {
> +		dev_dbg(dev, "wrong width or height %ux%u (%ux%u expected)\n",
> +			av->pix_fmt.width, av->pix_fmt.height,
> +			format.width, format.height);
> +		return -EINVAL;
> +	}
> +
> +	if (format.code != av->pfmt->code) {
> +		dev_dbg(dev, "wrong mbus code 0x%8.8x (0x%8.8x expected)\n",
> +			av->pfmt->code, format.code);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void return_buffers(struct ipu6_isys_queue *aq,
> +			   enum vb2_buffer_state state)
> +{
> +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> +	struct ipu6_isys_buffer *ib;
> +	bool need_reset = false;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&aq->lock, flags);
> +	while (!list_empty(&aq->incoming)) {
> +		struct vb2_buffer *vb;
> +
> +		ib = list_first_entry(&aq->incoming, struct ipu6_isys_buffer,
> +				      head);
> +		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
> +		list_del(&ib->head);
> +		spin_unlock_irqrestore(&aq->lock, flags);
> +
> +		vb2_buffer_done(vb, state);
> +
> +		spin_lock_irqsave(&aq->lock, flags);
> +	}
> +
> +	/*
> +	 * Something went wrong (FW crash / HW hang / not all buffers
> +	 * returned from isys) if there are still buffers queued in active
> +	 * queue. We have to clean up places a bit.
> +	 */
> +	while (!list_empty(&aq->active)) {
> +		struct vb2_buffer *vb;
> +
> +		ib = list_first_entry(&aq->active, struct ipu6_isys_buffer,
> +				      head);
> +		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
> +
> +		list_del(&ib->head);
> +		spin_unlock_irqrestore(&aq->lock, flags);
> +
> +		vb2_buffer_done(vb, state);
> +
> +		spin_lock_irqsave(&aq->lock, flags);
> +		need_reset = true;
> +	}
> +
> +	spin_unlock_irqrestore(&aq->lock, flags);
> +
> +	if (need_reset) {
> +		mutex_lock(&av->isys->mutex);
> +		av->isys->need_reset = true;
> +		mutex_unlock(&av->isys->mutex);
> +	}
> +}
> +
> +static void ipu6_isys_stream_cleanup(struct ipu6_isys_video *av)
> +{
> +	video_device_pipeline_stop(&av->vdev);
> +	ipu6_isys_put_stream(av->stream);
> +	av->stream = NULL;
> +}
> +
> +static int start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
> +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +	struct ipu6_isys_buffer_list __bl, *bl = NULL;
> +	struct ipu6_isys_stream *stream;
> +	struct media_entity *source_entity = NULL;
> +	int nr_queues, ret;
> +
> +	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
> +		av->vdev.name, av->pix_fmt.width, av->pix_fmt.height,
> +		av->pfmt->css_pixelformat);
> +
> +	ret = ipu6_isys_setup_video(av, &source_entity, &nr_queues);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to setup video\n");
> +		goto out_return_buffers;
> +	}
> +
> +	ret = ipu6_isys_link_fmt_validate(aq);
> +	if (ret) {
> +		dev_err(dev,
> +			"%s: link format validation failed (%d)\n",
> +			av->vdev.name, ret);
> +		goto out_pipeline_stop;
> +	}
> +
> +	ret = ipu6_isys_fw_open(av->isys);
> +	if (ret)
> +		goto out_pipeline_stop;
> +
> +	stream = av->stream;
> +	mutex_lock(&stream->mutex);
> +	if (!stream->nr_streaming) {
> +		ret = ipu6_isys_video_prepare_stream(av, source_entity,
> +						     nr_queues);
> +		if (ret)
> +			goto out_fw_close;
> +	}
> +
> +	stream->nr_streaming++;
> +	dev_dbg(dev, "queue %u of %u\n", stream->nr_streaming,
> +		stream->nr_queues);
> +
> +	list_add(&aq->node, &stream->queues);
> +	ipu6_isys_set_csi2_streams_status(av, true);
> +	ipu6_isys_configure_stream_watermark(av, true);
> +	ipu6_isys_update_stream_watermark(av, true);
> +
> +	if (stream->nr_streaming != stream->nr_queues)
> +		goto out;
> +
> +	bl = &__bl;
> +	ret = buffer_list_get(stream, bl);
> +	if (ret < 0) {
> +		dev_dbg(dev,
> +			"no buffer available, postponing streamon\n");

You can ensure that start_streaming is only called when there is at least
one buffer queued by setting q->min_queued_buffers to 1 in ipu6_isys_queue_init().
That is the recommended method for dealing with such requirements.

> +		goto out;
> +	}
> +
> +	ret = ipu6_isys_stream_start(av, bl, false);
> +	if (ret)
> +		goto out_stream_start;
> +
> +out:
> +	mutex_unlock(&stream->mutex);
> +
> +	return 0;
> +
> +out_stream_start:
> +	ipu6_isys_update_stream_watermark(av, false);
> +	list_del(&aq->node);
> +	stream->nr_streaming--;
> +
> +out_fw_close:
> +	mutex_unlock(&stream->mutex);
> +	ipu6_isys_fw_close(av->isys);
> +
> +out_pipeline_stop:
> +	ipu6_isys_stream_cleanup(av);
> +
> +out_return_buffers:
> +	return_buffers(aq, VB2_BUF_STATE_QUEUED);
> +
> +	return ret;
> +}
> +
> +static void stop_streaming(struct vb2_queue *q)
> +{
> +	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
> +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> +	struct ipu6_isys_stream *stream = av->stream;
> +
> +	ipu6_isys_set_csi2_streams_status(av, false);
> +
> +	mutex_lock(&stream->mutex);
> +
> +	ipu6_isys_update_stream_watermark(av, false);
> +
> +	mutex_lock(&av->isys->stream_mutex);
> +	if (stream->nr_streaming == stream->nr_queues && stream->streaming)
> +		ipu6_isys_video_set_streaming(av, 0, NULL);
> +	mutex_unlock(&av->isys->stream_mutex);
> +
> +	stream->nr_streaming--;
> +	list_del(&aq->node);
> +	stream->streaming = 0;
> +	mutex_unlock(&stream->mutex);
> +
> +	ipu6_isys_stream_cleanup(av);
> +
> +	return_buffers(aq, VB2_BUF_STATE_ERROR);
> +
> +	ipu6_isys_fw_close(av->isys);
> +}
> +
> +static unsigned int
> +get_sof_sequence_by_timestamp(struct ipu6_isys_stream *stream,
> +			      struct ipu6_fw_isys_resp_info_abi *info)
> +{
> +	u64 time = (u64)info->timestamp[1] << 32 | info->timestamp[0];
> +	struct ipu6_isys *isys = stream->isys;
> +	struct device *dev = &isys->adev->auxdev.dev;
> +	unsigned int i;
> +
> +	/*
> +	 * The timestamp is invalid as no TSC in some FPGA platform,
> +	 * so get the sequence from pipeline directly in this case.
> +	 */
> +	if (time == 0)
> +		return atomic_read(&stream->sequence) - 1;
> +
> +	for (i = 0; i < IPU6_ISYS_MAX_PARALLEL_SOF; i++)
> +		if (time == stream->seq[i].timestamp) {
> +			dev_dbg(dev, "sof: using seq nr %u for ts %llu\n",
> +				stream->seq[i].sequence, time);
> +			return stream->seq[i].sequence;
> +		}
> +
> +	for (i = 0; i < IPU6_ISYS_MAX_PARALLEL_SOF; i++)
> +		dev_dbg(dev, "sof: sequence %u, timestamp value %llu\n",
> +			stream->seq[i].sequence, stream->seq[i].timestamp);
> +
> +	return 0;
> +}
> +
> +static u64 get_sof_ns_delta(struct ipu6_isys_video *av,
> +			    struct ipu6_fw_isys_resp_info_abi *info)
> +{
> +	struct ipu6_bus_device *adev = av->isys->adev;
> +	struct ipu6_device *isp = adev->isp;
> +	u64 delta, tsc_now;
> +
> +	ipu6_buttress_tsc_read(isp, &tsc_now);
> +	if (!tsc_now)
> +		return 0;
> +
> +	delta = tsc_now - ((u64)info->timestamp[1] << 32 | info->timestamp[0]);
> +
> +	return ipu6_buttress_tsc_ticks_to_ns(delta, isp);
> +}
> +
> +void ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib,
> +				      struct ipu6_fw_isys_resp_info_abi *info)
> +{
> +	struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
> +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +	struct ipu6_isys_stream *stream = av->stream;
> +	u64 ns;
> +	u32 sequence;
> +
> +	ns = ktime_get_ns() - get_sof_ns_delta(av, info);
> +	sequence = get_sof_sequence_by_timestamp(stream, info);
> +
> +	vbuf->vb2_buf.timestamp = ns;
> +	vbuf->sequence = sequence;
> +
> +	dev_dbg(dev, "buf: %s: buffer done, CPU-timestamp:%lld, sequence:%d\n",
> +		av->vdev.name, ktime_get_ns(), sequence);
> +	dev_dbg(dev, "index:%d, vbuf timestamp:%lld\n", vb->index,
> +		vbuf->vb2_buf.timestamp);
> +}
> +
> +void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib)
> +{
> +	struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
> +
> +	if (atomic_read(&ib->str2mmio_flag)) {
> +		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
> +		/*
> +		 * Operation on buffer is ended with error and will be reported
> +		 * to the userspace when it is de-queued
> +		 */
> +		atomic_set(&ib->str2mmio_flag, 0);
> +	} else {
> +		vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
> +	}
> +}
> +
> +void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
> +			       struct ipu6_fw_isys_resp_info_abi *info)
> +{
> +	struct ipu6_isys_queue *aq = stream->output_pins[info->pin_id].aq;
> +	struct ipu6_isys *isys = stream->isys;
> +	struct device *dev = &isys->adev->auxdev.dev;
> +	struct ipu6_isys_buffer *ib;
> +	struct vb2_buffer *vb;
> +	unsigned long flags;
> +	bool first = true;
> +	struct vb2_v4l2_buffer *buf;
> +
> +	spin_lock_irqsave(&aq->lock, flags);
> +	if (list_empty(&aq->active)) {
> +		spin_unlock_irqrestore(&aq->lock, flags);
> +		dev_err(dev, "active queue empty\n");
> +		return;
> +	}
> +
> +	list_for_each_entry_reverse(ib, &aq->active, head) {
> +		dma_addr_t addr;
> +
> +		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
> +		addr = vb2_dma_contig_plane_dma_addr(vb, 0);
> +
> +		if (info->pin.addr != addr) {
> +			if (first)
> +				dev_err(dev, "Unexpected buffer address %pad\n",
> +					&addr);
> +			first = false;
> +			continue;
> +		}
> +
> +		if (info->error_info.error ==
> +		    IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO) {
> +			/*
> +			 * Check for error message:
> +			 * 'IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO'
> +			 */
> +			atomic_set(&ib->str2mmio_flag, 1);
> +		}
> +		dev_dbg(dev, "buffer: found buffer %pad\n", &addr);
> +
> +		buf = to_vb2_v4l2_buffer(vb);
> +		buf->field = V4L2_FIELD_NONE;
> +
> +		list_del(&ib->head);
> +		spin_unlock_irqrestore(&aq->lock, flags);
> +
> +		ipu6_isys_buf_calc_sequence_time(ib, info);
> +
> +		ipu6_isys_queue_buf_done(ib);
> +
> +		return;
> +	}
> +
> +	dev_err(dev, "Failed to find a matching video buffer");
> +
> +	spin_unlock_irqrestore(&aq->lock, flags);
> +}
> +
> +static const struct vb2_ops ipu6_isys_queue_ops = {
> +	.queue_setup = queue_setup,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.buf_prepare = ipu6_isys_buf_prepare,
> +	.start_streaming = start_streaming,
> +	.stop_streaming = stop_streaming,
> +	.buf_queue = buf_queue,
> +};
> +
> +int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
> +{
> +	struct ipu6_isys *isys = ipu6_isys_queue_to_video(aq)->isys;
> +	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
> +	int ret;
> +
> +	/* no support for userptr */
> +	if (!aq->vbq.io_modes)
> +		aq->vbq.io_modes = VB2_MMAP | VB2_DMABUF;
> +
> +	aq->vbq.drv_priv = aq;
> +	aq->vbq.ops = &ipu6_isys_queue_ops;
> +	aq->vbq.lock = &av->mutex;
> +	aq->vbq.mem_ops = &vb2_dma_contig_memops;
> +	aq->vbq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	aq->vbq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +
> +	ret = vb2_queue_init(&aq->vbq);
> +	if (ret)
> +		return ret;
> +
> +	aq->dev = &isys->adev->auxdev.dev;
> +	aq->vbq.dev = &isys->adev->auxdev.dev;
> +	spin_lock_init(&aq->lock);
> +	INIT_LIST_HEAD(&aq->active);
> +	INIT_LIST_HEAD(&aq->incoming);
> +
> +	return 0;
> +}
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> new file mode 100644
> index 000000000000..95cfd4869d93
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (C) 2013--2024 Intel Corporation */
> +
> +#ifndef IPU6_ISYS_QUEUE_H
> +#define IPU6_ISYS_QUEUE_H
> +
> +#include <linux/container_of.h>
> +#include <linux/atomic.h>
> +#include <linux/device.h>
> +#include <linux/list.h>
> +#include <linux/spinlock_types.h>
> +
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "ipu6-fw-isys.h"
> +#include "ipu6-isys-video.h"
> +
> +struct ipu6_isys_stream;
> +
> +struct ipu6_isys_queue {
> +	struct vb2_queue vbq;
> +	struct list_head node;
> +	struct device *dev;
> +	/*
> +	 * @lock: serialise access to queued and pre_streamon_queued
> +	 */
> +	spinlock_t lock;
> +	struct list_head active;
> +	struct list_head incoming;
> +	unsigned int fw_output;
> +};
> +
> +struct ipu6_isys_buffer {
> +	struct list_head head;
> +	atomic_t str2mmio_flag;
> +};
> +
> +struct ipu6_isys_video_buffer {
> +	struct vb2_v4l2_buffer vb_v4l2;
> +	struct ipu6_isys_buffer ib;
> +};
> +
> +#define IPU6_ISYS_BUFFER_LIST_FL_INCOMING	BIT(0)
> +#define IPU6_ISYS_BUFFER_LIST_FL_ACTIVE	BIT(1)
> +#define IPU6_ISYS_BUFFER_LIST_FL_SET_STATE	BIT(2)
> +
> +struct ipu6_isys_buffer_list {
> +	struct list_head head;
> +	unsigned int nbufs;
> +};
> +
> +#define vb2_queue_to_isys_queue(__vb2) \
> +	container_of(__vb2, struct ipu6_isys_queue, vbq)
> +
> +#define ipu6_isys_to_isys_video_buffer(__ib) \
> +	container_of(__ib, struct ipu6_isys_video_buffer, ib)
> +
> +#define vb2_buffer_to_ipu6_isys_video_buffer(__vvb) \
> +	container_of(__vvb, struct ipu6_isys_video_buffer, vb_v4l2)
> +
> +#define ipu6_isys_buffer_to_vb2_buffer(__ib) \
> +	(&ipu6_isys_to_isys_video_buffer(__ib)->vb_v4l2.vb2_buf)
> +
> +void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
> +				 unsigned long op_flags,
> +				 enum vb2_buffer_state state);
> +void
> +ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
> +			      struct ipu6_isys_stream *stream,
> +			      struct ipu6_isys_buffer_list *bl);
> +void
> +ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib,
> +				 struct ipu6_fw_isys_resp_info_abi *info);
> +void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib);
> +void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
> +			       struct ipu6_fw_isys_resp_info_abi *info);
> +int ipu6_isys_queue_init(struct ipu6_isys_queue *aq);
> +#endif /* IPU6_ISYS_QUEUE_H */
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> new file mode 100644
> index 000000000000..c186fa8e243e
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -0,0 +1,1247 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2013--2024 Intel Corporation
> + */
> +
> +#include <linux/align.h>
> +#include <linux/bits.h>
> +#include <linux/bug.h>
> +#include <linux/completion.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/list.h>
> +#include <linux/math64.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>
> +
> +#include <media/media-entity.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "ipu6.h"
> +#include "ipu6-bus.h"
> +#include "ipu6-cpd.h"
> +#include "ipu6-fw-isys.h"
> +#include "ipu6-isys.h"
> +#include "ipu6-isys-csi2.h"
> +#include "ipu6-isys-queue.h"
> +#include "ipu6-isys-video.h"
> +#include "ipu6-platform-regs.h"
> +
> +const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
> +	{ V4L2_PIX_FMT_SBGGR12, 16, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> +	{ V4L2_PIX_FMT_SGBRG12, 16, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> +	{ V4L2_PIX_FMT_SGRBG12, 16, 12, MEDIA_BUS_FMT_SGRBG12_1X12,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> +	{ V4L2_PIX_FMT_SRGGB12, 16, 12, MEDIA_BUS_FMT_SRGGB12_1X12,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> +	{ V4L2_PIX_FMT_SBGGR10, 16, 10, MEDIA_BUS_FMT_SBGGR10_1X10,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> +	{ V4L2_PIX_FMT_SGBRG10, 16, 10, MEDIA_BUS_FMT_SGBRG10_1X10,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> +	{ V4L2_PIX_FMT_SGRBG10, 16, 10, MEDIA_BUS_FMT_SGRBG10_1X10,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> +	{ V4L2_PIX_FMT_SRGGB10, 16, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> +	{ V4L2_PIX_FMT_SBGGR8, 8, 8, MEDIA_BUS_FMT_SBGGR8_1X8,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
> +	{ V4L2_PIX_FMT_SGBRG8, 8, 8, MEDIA_BUS_FMT_SGBRG8_1X8,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
> +	{ V4L2_PIX_FMT_SGRBG8, 8, 8, MEDIA_BUS_FMT_SGRBG8_1X8,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
> +	{ V4L2_PIX_FMT_SRGGB8, 8, 8, MEDIA_BUS_FMT_SRGGB8_1X8,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
> +	{ V4L2_PIX_FMT_SBGGR12P, 12, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
> +	{ V4L2_PIX_FMT_SGBRG12P, 12, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
> +	{ V4L2_PIX_FMT_SGRBG12P, 12, 12, MEDIA_BUS_FMT_SGRBG12_1X12,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
> +	{ V4L2_PIX_FMT_SRGGB12P, 12, 12, MEDIA_BUS_FMT_SRGGB12_1X12,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
> +	{ V4L2_PIX_FMT_SBGGR10P, 10, 10, MEDIA_BUS_FMT_SBGGR10_1X10,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
> +	{ V4L2_PIX_FMT_SGBRG10P, 10, 10, MEDIA_BUS_FMT_SGBRG10_1X10,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
> +	{ V4L2_PIX_FMT_SGRBG10P, 10, 10, MEDIA_BUS_FMT_SGRBG10_1X10,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
> +	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
> +	{ V4L2_PIX_FMT_UYVY, 16, 16, MEDIA_BUS_FMT_UYVY8_1X16,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_UYVY},
> +	{ V4L2_PIX_FMT_YUYV, 16, 16, MEDIA_BUS_FMT_YUYV8_1X16,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_YUYV},
> +	{ V4L2_PIX_FMT_RGB565, 16, 16, MEDIA_BUS_FMT_RGB565_1X16,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RGB565 },
> +	{ V4L2_PIX_FMT_BGR24, 24, 24, MEDIA_BUS_FMT_RGB888_1X24,
> +	  IPU6_FW_ISYS_FRAME_FORMAT_RGBA888 },
> +};
> +
> +static int video_open(struct file *file)
> +{
> +	struct ipu6_isys_video *av = video_drvdata(file);
> +	struct ipu6_isys *isys = av->isys;
> +	struct ipu6_bus_device *adev = isys->adev;
> +
> +	mutex_lock(&isys->mutex);
> +	if (isys->need_reset) {
> +		mutex_unlock(&isys->mutex);
> +		dev_warn(&adev->auxdev.dev, "isys power cycle required\n");
> +		return -EIO;
> +	}
> +	mutex_unlock(&isys->mutex);
> +
> +	return v4l2_fh_open(file);
> +}
> +
> +static const struct ipu6_isys_pixelformat *
> +ipu6_isys_get_pixelformat(u32 pixelformat)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
> +		const struct ipu6_isys_pixelformat *pfmt = &ipu6_isys_pfmts[i];
> +
> +		if (pfmt->pixelformat == pixelformat)
> +			return pfmt;
> +	}
> +
> +	return &ipu6_isys_pfmts[0];
> +}
> +
> +static int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
> +				     struct v4l2_capability *cap)
> +{
> +	struct ipu6_isys_video *av = video_drvdata(file);
> +
> +	strscpy(cap->driver, IPU6_ISYS_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, av->isys->media_dev.model, sizeof(cap->card));
> +
> +	return 0;
> +}
> +
> +static int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
> +				     struct v4l2_fmtdesc *f)
> +{
> +	unsigned int i, found = 0;
> +
> +	if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
> +		return -EINVAL;
> +
> +	if (!f->mbus_code) {
> +		f->flags = 0;
> +		f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
> +		return 0;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
> +		if (f->mbus_code != ipu6_isys_pfmts[i].code)
> +			continue;
> +
> +		if (f->index == found) {
> +			f->flags = 0;
> +			f->pixelformat = ipu6_isys_pfmts[i].pixelformat;
> +			return 0;
> +		}
> +		found++;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int ipu6_isys_vidioc_enum_framesizes(struct file *file, void *fh,
> +					    struct v4l2_frmsizeenum *fsize)
> +{
> +	unsigned int i;
> +
> +	if (fsize->index > 0)
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
> +		if (fsize->pixel_format != ipu6_isys_pfmts[i].pixelformat)
> +			continue;
> +
> +		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +		fsize->stepwise.min_width = IPU6_ISYS_MIN_WIDTH;
> +		fsize->stepwise.max_width = IPU6_ISYS_MAX_WIDTH;
> +		fsize->stepwise.min_height = IPU6_ISYS_MIN_HEIGHT;
> +		fsize->stepwise.max_height = IPU6_ISYS_MAX_HEIGHT;
> +		fsize->stepwise.step_width = 2;
> +		fsize->stepwise.step_height = 2;
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int vidioc_g_fmt_vid_cap(struct file *file, void *fh,
> +				struct v4l2_format *fmt)
> +{
> +	struct ipu6_isys_video *av = video_drvdata(file);
> +
> +	fmt->fmt.pix = av->pix_fmt;
> +
> +	return 0;
> +}
> +
> +static const struct ipu6_isys_pixelformat *
> +ipu6_isys_video_try_fmt_vid(struct ipu6_isys_video *av,
> +			    struct v4l2_pix_format *pix_fmt)
> +{
> +	const struct ipu6_isys_pixelformat *pfmt =
> +		ipu6_isys_get_pixelformat(pix_fmt->pixelformat);
> +
> +	pix_fmt->pixelformat = pfmt->pixelformat;
> +
> +	pix_fmt->width = clamp(pix_fmt->width, IPU6_ISYS_MIN_WIDTH,
> +			    IPU6_ISYS_MAX_WIDTH);
> +	pix_fmt->height = clamp(pix_fmt->height, IPU6_ISYS_MIN_HEIGHT,
> +			     IPU6_ISYS_MAX_HEIGHT);
> +
> +	if (pfmt->bpp != pfmt->bpp_packed)
> +		pix_fmt->bytesperline =
> +			pix_fmt->width * DIV_ROUND_UP(pfmt->bpp, BITS_PER_BYTE);
> +	else
> +		pix_fmt->bytesperline =
> +			DIV_ROUND_UP(pix_fmt->width * pfmt->bpp, BITS_PER_BYTE);
> +
> +	pix_fmt->bytesperline = ALIGN(pix_fmt->bytesperline,
> +						av->isys->line_align);
> +
> +	/*
> +	 * (height + 1) * bytesperline due to a hardware issue: the DMA unit
> +	 * is a power of two, and a line should be transferred as few units
> +	 * as possible. The result is that up to line length more data than
> +	 * the image size may be transferred to memory after the image.
> +	 * Another limitation is the GDA allocation unit size. For low
> +	 * resolution it gives a bigger number. Use larger one to avoid
> +	 * memory corruption.
> +	 */
> +	pix_fmt->sizeimage =
> +		max(pix_fmt->sizeimage,
> +		    pix_fmt->bytesperline * pix_fmt->height +
> +		    max(pix_fmt->bytesperline,
> +			av->isys->pdata->ipdata->isys_dma_overshoot));
> +
> +	pix_fmt->field = V4L2_FIELD_NONE;
> +
> +	pix_fmt->colorspace = V4L2_COLORSPACE_RAW;
> +	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	pix_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	pix_fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +
> +	return pfmt;
> +}
> +
> +static int vidioc_s_fmt_vid_cap(struct file *file, void *fh,
> +				struct v4l2_format *f)
> +{
> +	struct ipu6_isys_video *av = video_drvdata(file);
> +
> +	if (av->aq.vbq.streaming)

This should call vb2_is_busy() instead of checking the streaming flag.

I'm pretty sure v4l2-compliance checks for that, but perhaps the current
FAILs prevented it from getting that far.

According to the cover letter, those FAILs in v4l2-compliance are because
of a limitation in v4l2-compliance: that should be fixed so that this
driver can pass the full v4l2-compliance test. I suspect that not doing that
causes this issue to be missed.

> +		return -EBUSY;
> +
> +	av->pfmt = ipu6_isys_video_try_fmt_vid(av, &f->fmt.pix);
> +	av->pix_fmt = f->fmt.pix;
> +
> +	return 0;
> +}
> +
> +static int vidioc_try_fmt_vid_cap(struct file *file, void *fh,
> +				  struct v4l2_format *f)
> +{
> +	struct ipu6_isys_video *av = video_drvdata(file);
> +
> +	ipu6_isys_video_try_fmt_vid(av, &f->fmt.pix);
> +
> +	return 0;
> +}
> +
> +static int link_validate(struct media_link *link)
> +{
> +	struct ipu6_isys_video *av =
> +		container_of(link->sink, struct ipu6_isys_video, pad);
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +	struct v4l2_subdev_state *s_state;
> +	struct v4l2_subdev *s_sd;
> +	struct v4l2_mbus_framefmt *s_fmt;
> +	struct media_pad *s_pad;
> +	u32 s_stream;
> +	int ret = -EPIPE;
> +
> +	if (!link->source->entity)
> +		return ret;
> +
> +	s_sd = media_entity_to_v4l2_subdev(link->source->entity);
> +	s_state = v4l2_subdev_get_unlocked_active_state(s_sd);
> +	if (!s_state)
> +		return ret;
> +
> +	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\"\n",
> +		link->source->entity->name, link->source->index,
> +		link->sink->entity->name);
> +
> +	s_pad = media_pad_remote_pad_first(&av->pad);
> +	s_stream = ipu6_isys_get_src_stream_by_src_pad(s_sd, s_pad->index);
> +
> +	v4l2_subdev_lock_state(s_state);
> +
> +	s_fmt = v4l2_subdev_state_get_format(s_state, s_pad->index, s_stream);
> +	if (!s_fmt) {
> +		dev_err(dev, "failed to get source pad format\n");
> +		goto unlock;
> +	}
> +
> +	if (s_fmt->width != av->pix_fmt.width ||
> +	    s_fmt->height != av->pix_fmt.height || s_fmt->code != av->pfmt->code) {
> +		dev_dbg(dev, "format mismatch %dx%d,%x != %dx%d,%x\n",
> +			s_fmt->width, s_fmt->height, s_fmt->code,
> +			av->pix_fmt.width, av->pix_fmt.height, av->pfmt->code);
> +		goto unlock;
> +	}
> +
> +	v4l2_subdev_unlock_state(s_state);
> +
> +	return 0;
> +unlock:
> +	v4l2_subdev_unlock_state(s_state);
> +
> +	return ret;
> +}
> +
> +static void get_stream_opened(struct ipu6_isys_video *av)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&av->isys->streams_lock, flags);
> +	av->isys->stream_opened++;
> +	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
> +}
> +
> +static void put_stream_opened(struct ipu6_isys_video *av)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&av->isys->streams_lock, flags);
> +	av->isys->stream_opened--;
> +	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
> +}
> +
> +static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
> +				struct ipu6_fw_isys_stream_cfg_data_abi *cfg)
> +{
> +	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
> +	struct ipu6_fw_isys_input_pin_info_abi *input_pin;
> +	struct ipu6_fw_isys_output_pin_info_abi *output_pin;
> +	struct ipu6_isys_stream *stream = av->stream;
> +	struct ipu6_isys_queue *aq = &av->aq;
> +	struct v4l2_mbus_framefmt fmt;
> +	struct v4l2_rect v4l2_crop;
> +	struct ipu6_isys *isys = av->isys;
> +	struct device *dev = &isys->adev->auxdev.dev;
> +	int input_pins = cfg->nof_input_pins++;
> +	int output_pins;
> +	u32 src_stream;
> +	int ret;
> +
> +	src_stream = ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
> +	ret = ipu6_isys_get_stream_pad_fmt(sd, src_pad->index, src_stream,
> +					   &fmt);
> +	if (ret < 0) {
> +		dev_err(dev, "can't get stream format (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = ipu6_isys_get_stream_pad_crop(sd, src_pad->index, src_stream,
> +					    &v4l2_crop);
> +	if (ret < 0) {
> +		dev_err(dev, "can't get stream crop (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	input_pin = &cfg->input_pins[input_pins];
> +	input_pin->input_res.width = fmt.width;
> +	input_pin->input_res.height = fmt.height;
> +	input_pin->dt = av->dt;
> +	input_pin->bits_per_pix = av->pfmt->bpp_packed;
> +	input_pin->mapped_dt = 0x40; /* invalid mipi data type */
> +	input_pin->mipi_decompression = 0;
> +	input_pin->capture_mode = IPU6_FW_ISYS_CAPTURE_MODE_REGULAR;
> +	input_pin->mipi_store_mode = av->pfmt->bpp == av->pfmt->bpp_packed ?
> +		IPU6_FW_ISYS_MIPI_STORE_MODE_DISCARD_LONG_HEADER :
> +		IPU6_FW_ISYS_MIPI_STORE_MODE_NORMAL;
> +	input_pin->crop_first_and_last_lines = v4l2_crop.top & 1;
> +
> +	output_pins = cfg->nof_output_pins++;
> +	aq->fw_output = output_pins;
> +	stream->output_pins[output_pins].pin_ready = ipu6_isys_queue_buf_ready;
> +	stream->output_pins[output_pins].aq = aq;
> +
> +	output_pin = &cfg->output_pins[output_pins];
> +	output_pin->input_pin_id = input_pins;
> +	output_pin->output_res.width = av->pix_fmt.width;
> +	output_pin->output_res.height = av->pix_fmt.height;
> +
> +	output_pin->stride = av->pix_fmt.bytesperline;
> +	if (av->pfmt->bpp != av->pfmt->bpp_packed)
> +		output_pin->pt = IPU6_FW_ISYS_PIN_TYPE_RAW_SOC;
> +	else
> +		output_pin->pt = IPU6_FW_ISYS_PIN_TYPE_MIPI;
> +	output_pin->ft = av->pfmt->css_pixelformat;
> +	output_pin->send_irq = 1;
> +	memset(output_pin->ts_offsets, 0, sizeof(output_pin->ts_offsets));
> +	output_pin->s2m_pixel_soc_pixel_remapping =
> +		S2M_PIXEL_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING;
> +	output_pin->csi_be_soc_pixel_remapping =
> +		CSI_BE_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING;
> +
> +	output_pin->snoopable = true;
> +	output_pin->error_handling_enable = false;
> +	output_pin->sensor_type = isys->sensor_type++;
> +	if (isys->sensor_type > isys->pdata->ipdata->sensor_type_end)
> +		isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
> +
> +	return 0;
> +}
> +
> +static int start_stream_firmware(struct ipu6_isys_video *av,
> +				 struct ipu6_isys_buffer_list *bl)
> +{
> +	struct ipu6_fw_isys_stream_cfg_data_abi *stream_cfg;
> +	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
> +	struct ipu6_isys_stream *stream = av->stream;
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +	struct isys_fw_msgs *msg = NULL;
> +	struct ipu6_isys_queue *aq;
> +	int ret, retout, tout;
> +	u16 send_type;
> +
> +	msg = ipu6_get_fw_msg_buf(stream);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	stream_cfg = &msg->fw_msg.stream;
> +	stream_cfg->src = stream->stream_source;
> +	stream_cfg->vc = stream->vc;
> +	stream_cfg->isl_use = 0;
> +	stream_cfg->sensor_type = IPU6_FW_ISYS_SENSOR_MODE_NORMAL;
> +
> +	list_for_each_entry(aq, &stream->queues, node) {
> +		struct ipu6_isys_video *__av = ipu6_isys_queue_to_video(aq);
> +
> +		ret = ipu6_isys_fw_pin_cfg(__av, stream_cfg);
> +		if (ret < 0) {
> +			ipu6_put_fw_msg_buf(av->isys, (u64)stream_cfg);
> +			return ret;
> +		}
> +	}
> +
> +	ipu6_fw_isys_dump_stream_cfg(dev, stream_cfg);
> +
> +	stream->nr_output_pins = stream_cfg->nof_output_pins;
> +
> +	reinit_completion(&stream->stream_open_completion);
> +
> +	ret = ipu6_fw_isys_complex_cmd(av->isys, stream->stream_handle,
> +				       stream_cfg, msg->dma_addr,
> +				       sizeof(*stream_cfg),
> +				       IPU6_FW_ISYS_SEND_TYPE_STREAM_OPEN);
> +	if (ret < 0) {
> +		dev_err(dev, "can't open stream (%d)\n", ret);
> +		ipu6_put_fw_msg_buf(av->isys, (u64)stream_cfg);
> +		return ret;
> +	}
> +
> +	get_stream_opened(av);
> +
> +	tout = wait_for_completion_timeout(&stream->stream_open_completion,
> +					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
> +
> +	ipu6_put_fw_msg_buf(av->isys, (u64)stream_cfg);
> +
> +	if (!tout) {
> +		dev_err(dev, "stream open time out\n");
> +		ret = -ETIMEDOUT;
> +		goto out_put_stream_opened;
> +	}
> +	if (stream->error) {
> +		dev_err(dev, "stream open error: %d\n", stream->error);
> +		ret = -EIO;
> +		goto out_put_stream_opened;
> +	}
> +	dev_dbg(dev, "start stream: open complete\n");
> +
> +	if (bl) {
> +		msg = ipu6_get_fw_msg_buf(stream);
> +		if (!msg) {
> +			ret = -ENOMEM;
> +			goto out_put_stream_opened;
> +		}
> +		buf = &msg->fw_msg.frame;
> +		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
> +		ipu6_isys_buffer_list_queue(bl,
> +					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
> +	}
> +
> +	reinit_completion(&stream->stream_start_completion);
> +
> +	if (bl) {
> +		send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE;
> +		ipu6_fw_isys_dump_frame_buff_set(dev, buf,
> +						 stream_cfg->nof_output_pins);
> +		ret = ipu6_fw_isys_complex_cmd(av->isys, stream->stream_handle,
> +					       buf, msg->dma_addr,
> +					       sizeof(*buf), send_type);
> +	} else {
> +		send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START;
> +		ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
> +					      send_type);
> +	}
> +
> +	if (ret < 0) {
> +		dev_err(dev, "can't start streaming (%d)\n", ret);
> +		goto out_stream_close;
> +	}
> +
> +	tout = wait_for_completion_timeout(&stream->stream_start_completion,
> +					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
> +	if (!tout) {
> +		dev_err(dev, "stream start time out\n");
> +		ret = -ETIMEDOUT;
> +		goto out_stream_close;
> +	}
> +	if (stream->error) {
> +		dev_err(dev, "stream start error: %d\n", stream->error);
> +		ret = -EIO;
> +		goto out_stream_close;
> +	}
> +	dev_dbg(dev, "start stream: complete\n");
> +
> +	return 0;
> +
> +out_stream_close:
> +	reinit_completion(&stream->stream_close_completion);
> +
> +	retout = ipu6_fw_isys_simple_cmd(av->isys,
> +					 stream->stream_handle,
> +					 IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
> +	if (retout < 0) {
> +		dev_dbg(dev, "can't close stream (%d)\n", retout);
> +		goto out_put_stream_opened;
> +	}
> +
> +	tout = wait_for_completion_timeout(&stream->stream_close_completion,
> +					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
> +	if (!tout)
> +		dev_err(dev, "stream close time out\n");
> +	else if (stream->error)
> +		dev_err(dev, "stream close error: %d\n", stream->error);
> +	else
> +		dev_dbg(dev, "stream close complete\n");
> +
> +out_put_stream_opened:
> +	put_stream_opened(av);
> +
> +	return ret;
> +}
> +
> +static void stop_streaming_firmware(struct ipu6_isys_video *av)
> +{
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +	struct ipu6_isys_stream *stream = av->stream;
> +	int ret, tout;
> +
> +	reinit_completion(&stream->stream_stop_completion);
> +
> +	ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
> +				      IPU6_FW_ISYS_SEND_TYPE_STREAM_FLUSH);
> +
> +	if (ret < 0) {
> +		dev_err(dev, "can't stop stream (%d)\n", ret);
> +		return;
> +	}
> +
> +	tout = wait_for_completion_timeout(&stream->stream_stop_completion,
> +					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
> +	if (!tout)
> +		dev_warn(dev, "stream stop time out\n");
> +	else if (stream->error)
> +		dev_warn(dev, "stream stop error: %d\n", stream->error);
> +	else
> +		dev_dbg(dev, "stop stream: complete\n");
> +}
> +
> +static void close_streaming_firmware(struct ipu6_isys_video *av)
> +{
> +	struct ipu6_isys_stream *stream = av->stream;
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +	int ret, tout;
> +
> +	reinit_completion(&stream->stream_close_completion);
> +
> +	ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
> +				      IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
> +	if (ret < 0) {
> +		dev_err(dev, "can't close stream (%d)\n", ret);
> +		return;
> +	}
> +
> +	tout = wait_for_completion_timeout(&stream->stream_close_completion,
> +					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
> +	if (!tout)
> +		dev_warn(dev, "stream close time out\n");
> +	else if (stream->error)
> +		dev_warn(dev, "stream close error: %d\n", stream->error);
> +	else
> +		dev_dbg(dev, "close stream: complete\n");
> +
> +	put_stream_opened(av);
> +}
> +
> +int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
> +				   struct media_entity *source_entity,
> +				   int nr_queues)
> +{
> +	struct ipu6_isys_stream *stream = av->stream;
> +	struct ipu6_isys_csi2 *csi2;
> +
> +	if (WARN_ON(stream->nr_streaming))
> +		return -EINVAL;
> +
> +	stream->nr_queues = nr_queues;
> +	atomic_set(&stream->sequence, 0);
> +
> +	stream->seq_index = 0;
> +	memset(stream->seq, 0, sizeof(stream->seq));
> +
> +	if (WARN_ON(!list_empty(&stream->queues)))
> +		return -EINVAL;
> +
> +	stream->stream_source = stream->asd->source;
> +	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
> +	csi2->receiver_errors = 0;
> +	stream->source_entity = source_entity;
> +
> +	dev_dbg(&av->isys->adev->auxdev.dev,
> +		"prepare stream: external entity %s\n",
> +		stream->source_entity->name);
> +
> +	return 0;
> +}
> +
> +void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
> +					  bool state)
> +{
> +	struct ipu6_isys *isys = av->isys;
> +	struct ipu6_isys_csi2 *csi2 = NULL;
> +	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
> +	struct device *dev = &isys->adev->auxdev.dev;
> +	struct v4l2_mbus_framefmt format;
> +	struct v4l2_subdev *esd;
> +	struct v4l2_control hb = { .id = V4L2_CID_HBLANK, .value = 0 };
> +	unsigned int bpp, lanes;
> +	s64 link_freq = 0;
> +	u64 pixel_rate = 0;
> +	int ret;
> +
> +	if (!state)
> +		return;
> +
> +	esd = media_entity_to_v4l2_subdev(av->stream->source_entity);
> +
> +	av->watermark.width = av->pix_fmt.width;
> +	av->watermark.height = av->pix_fmt.height;
> +	av->watermark.sram_gran_shift = isys->pdata->ipdata->sram_gran_shift;
> +	av->watermark.sram_gran_size = isys->pdata->ipdata->sram_gran_size;
> +
> +	ret = v4l2_g_ctrl(esd->ctrl_handler, &hb);
> +	if (!ret && hb.value >= 0)
> +		av->watermark.hblank = hb.value;
> +	else
> +		av->watermark.hblank = 0;
> +
> +	csi2 = ipu6_isys_subdev_to_csi2(av->stream->asd);
> +	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
> +	if (link_freq > 0) {
> +		lanes = csi2->nlanes;
> +		ret = ipu6_isys_get_stream_pad_fmt(&csi2->asd.sd, 0,
> +						   av->source_stream, &format);
> +		if (!ret) {
> +			bpp = ipu6_isys_mbus_code_to_bpp(format.code);
> +			pixel_rate = mul_u64_u32_div(link_freq, lanes * 2, bpp);
> +		}
> +	}
> +
> +	av->watermark.pixel_rate = pixel_rate;
> +
> +	if (!pixel_rate) {
> +		mutex_lock(&iwake_watermark->mutex);
> +		iwake_watermark->force_iwake_disable = true;
> +		mutex_unlock(&iwake_watermark->mutex);
> +		dev_warn(dev, "unexpected pixel_rate from %s, disable iwake.\n",
> +			 av->stream->source_entity->name);
> +	}
> +}
> +
> +static void calculate_stream_datarate(struct ipu6_isys_video *av)
> +{
> +	struct video_stream_watermark *watermark = &av->watermark;
> +	u32 bpp = av->pfmt->bpp;
> +	u32 pages_per_line, pb_bytes_per_line, pixels_per_line, bytes_per_line;
> +	u64 line_time_ns, stream_data_rate;
> +	u16 shift, size;
> +
> +	shift = watermark->sram_gran_shift;
> +	size = watermark->sram_gran_size;
> +
> +	pixels_per_line = watermark->width + watermark->hblank;
> +	line_time_ns =  div_u64(pixels_per_line * NSEC_PER_SEC,
> +				watermark->pixel_rate);
> +	bytes_per_line = watermark->width * bpp / 8;
> +	pages_per_line = DIV_ROUND_UP(bytes_per_line, size);
> +	pb_bytes_per_line = pages_per_line << shift;
> +	stream_data_rate = div64_u64(pb_bytes_per_line * 1000, line_time_ns);
> +
> +	watermark->stream_data_rate = stream_data_rate;
> +}
> +
> +void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state)
> +{
> +	struct isys_iwake_watermark *iwake_watermark =
> +		&av->isys->iwake_watermark;
> +
> +	if (!av->watermark.pixel_rate)
> +		return;
> +
> +	if (state) {
> +		calculate_stream_datarate(av);
> +		mutex_lock(&iwake_watermark->mutex);
> +		list_add(&av->watermark.stream_node,
> +			 &iwake_watermark->video_list);
> +		mutex_unlock(&iwake_watermark->mutex);
> +	} else {
> +		av->watermark.stream_data_rate = 0;
> +		mutex_lock(&iwake_watermark->mutex);
> +		list_del(&av->watermark.stream_node);
> +		mutex_unlock(&iwake_watermark->mutex);
> +	}
> +
> +	update_watermark_setting(av->isys);
> +}
> +
> +void ipu6_isys_put_stream(struct ipu6_isys_stream *stream)
> +{
> +	struct device *dev = &stream->isys->adev->auxdev.dev;
> +	unsigned int i;
> +	unsigned long flags;
> +
> +	if (!stream) {
> +		dev_err(dev, "no available stream\n");
> +		return;
> +	}
> +
> +	spin_lock_irqsave(&stream->isys->streams_lock, flags);
> +	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
> +		if (&stream->isys->streams[i] == stream) {
> +			if (stream->isys->streams_ref_count[i] > 0)
> +				stream->isys->streams_ref_count[i]--;
> +			else
> +				dev_warn(dev, "invalid stream %d\n", i);
> +
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&stream->isys->streams_lock, flags);
> +}
> +
> +static struct ipu6_isys_stream *
> +ipu6_isys_get_stream(struct ipu6_isys_video *av, struct ipu6_isys_subdev *asd)
> +{
> +	struct ipu6_isys_stream *stream = NULL;
> +	struct ipu6_isys *isys = av->isys;
> +	unsigned long flags;
> +	unsigned int i;
> +	u8 vc = av->vc;
> +
> +	if (!isys)
> +		return NULL;
> +
> +	spin_lock_irqsave(&isys->streams_lock, flags);
> +	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
> +		if (isys->streams_ref_count[i] && isys->streams[i].vc == vc &&
> +		    isys->streams[i].asd == asd) {
> +			isys->streams_ref_count[i]++;
> +			stream = &isys->streams[i];
> +			break;
> +		}
> +	}
> +
> +	if (!stream) {
> +		for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
> +			if (!isys->streams_ref_count[i]) {
> +				isys->streams_ref_count[i]++;
> +				stream = &isys->streams[i];
> +				stream->vc = vc;
> +				stream->asd = asd;
> +				break;
> +			}
> +		}
> +	}
> +	spin_unlock_irqrestore(&isys->streams_lock, flags);
> +
> +	return stream;
> +}
> +
> +struct ipu6_isys_stream *
> +ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle)
> +{
> +	unsigned long flags;
> +	struct ipu6_isys_stream *stream = NULL;
> +
> +	if (!isys)
> +		return NULL;
> +
> +	if (stream_handle >= IPU6_ISYS_MAX_STREAMS) {
> +		dev_err(&isys->adev->auxdev.dev,
> +			"stream_handle %d is invalid\n", stream_handle);
> +		return NULL;
> +	}
> +
> +	spin_lock_irqsave(&isys->streams_lock, flags);
> +	if (isys->streams_ref_count[stream_handle] > 0) {
> +		isys->streams_ref_count[stream_handle]++;
> +		stream = &isys->streams[stream_handle];
> +	}
> +	spin_unlock_irqrestore(&isys->streams_lock, flags);
> +
> +	return stream;
> +}
> +
> +struct ipu6_isys_stream *
> +ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc)
> +{
> +	struct ipu6_isys_stream *stream = NULL;
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	if (!isys)
> +		return NULL;
> +
> +	if (source < 0) {
> +		dev_err(&stream->isys->adev->auxdev.dev,
> +			"query stream with invalid port number\n");
> +		return NULL;
> +	}
> +
> +	spin_lock_irqsave(&isys->streams_lock, flags);
> +	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
> +		if (!isys->streams_ref_count[i])
> +			continue;
> +
> +		if (isys->streams[i].stream_source == source &&
> +		    isys->streams[i].vc == vc) {
> +			stream = &isys->streams[i];
> +			isys->streams_ref_count[i]++;
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&isys->streams_lock, flags);
> +
> +	return stream;
> +}
> +
> +static u64 get_stream_mask_by_pipeline(struct ipu6_isys_video *__av)
> +{
> +	struct media_pipeline *pipeline =
> +		media_entity_pipeline(&__av->vdev.entity);
> +	unsigned int i;
> +	u64 stream_mask = 0;
> +
> +	for (i = 0; i < NR_OF_CSI2_SRC_PADS; i++) {
> +		struct ipu6_isys_video *av = &__av->csi2->av[i];
> +
> +		if (pipeline == media_entity_pipeline(&av->vdev.entity))
> +			stream_mask |= BIT_ULL(av->source_stream);
> +	}
> +
> +	return stream_mask;
> +}
> +
> +int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> +				  struct ipu6_isys_buffer_list *bl)
> +{
> +	struct v4l2_subdev_krouting *routing;
> +	struct ipu6_isys_stream *stream = av->stream;
> +	struct v4l2_subdev_state *subdev_state;
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +	struct v4l2_subdev *sd;
> +	struct v4l2_subdev *ssd;
> +	struct media_pad *r_pad;
> +	struct media_pad *s_pad;
> +	u32 sink_pad, sink_stream;
> +	u64 r_stream;
> +	u64 stream_mask = 0;
> +	int ret = 0;
> +
> +	dev_dbg(dev, "set stream: %d\n", state);
> +
> +	if (WARN(!stream->source_entity, "No source entity for stream\n"))
> +		return -ENODEV;
> +
> +	ssd = media_entity_to_v4l2_subdev(stream->source_entity);
> +	sd = &stream->asd->sd;
> +	r_pad = media_pad_remote_pad_first(&av->pad);
> +	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
> +
> +	subdev_state = v4l2_subdev_lock_and_get_active_state(sd);
> +	routing = &subdev_state->routing;
> +	ret = v4l2_subdev_routing_find_opposite_end(routing, r_pad->index,
> +						    r_stream, &sink_pad,
> +						    &sink_stream);
> +	v4l2_subdev_unlock_state(subdev_state);
> +	if (ret)
> +		return ret;
> +
> +	s_pad = media_pad_remote_pad_first(&stream->asd->pad[sink_pad]);
> +
> +	stream_mask = get_stream_mask_by_pipeline(av);
> +	if (!state) {
> +		stop_streaming_firmware(av);
> +
> +		/* stop external sub-device now. */
> +		dev_dbg(dev, "disable streams 0x%llx of %s\n", stream_mask,
> +			ssd->name);
> +		ret = v4l2_subdev_disable_streams(ssd, s_pad->index,
> +						  stream_mask);
> +		if (ret) {
> +			dev_err(dev, "disable streams of %s failed with %d\n",
> +				ssd->name, ret);
> +			return ret;
> +		}
> +
> +		/* stop sub-device which connects with video */
> +		dev_dbg(dev, "stream off entity %s pad:%d\n", sd->name,
> +			r_pad->index);
> +		ret = v4l2_subdev_call(sd, video, s_stream, state);
> +		if (ret) {
> +			dev_err(dev, "stream off %s failed with %d\n", sd->name,
> +				ret);
> +			return ret;
> +		}
> +		close_streaming_firmware(av);
> +	} else {
> +		ret = start_stream_firmware(av, bl);
> +		if (ret) {
> +			dev_err(dev, "start stream of firmware failed\n");
> +			return ret;
> +		}
> +
> +		/* start sub-device which connects with video */
> +		dev_dbg(dev, "stream on %s pad %d\n", sd->name, r_pad->index);
> +		ret = v4l2_subdev_call(sd, video, s_stream, state);
> +		if (ret) {
> +			dev_err(dev, "stream on %s failed with %d\n", sd->name,
> +				ret);
> +			goto out_media_entity_stop_streaming_firmware;
> +		}
> +
> +		/* start external sub-device now. */
> +		dev_dbg(dev, "enable streams 0x%llx of %s\n", stream_mask,
> +			ssd->name);
> +		ret = v4l2_subdev_enable_streams(ssd, s_pad->index,
> +						 stream_mask);
> +		if (ret) {
> +			dev_err(dev,
> +				"enable streams 0x%llx of %s failed with %d\n",
> +				stream_mask, stream->source_entity->name, ret);
> +			goto out_media_entity_stop_streaming;
> +		}
> +	}
> +
> +	av->streaming = state;
> +
> +	return 0;
> +
> +out_media_entity_stop_streaming:
> +	v4l2_subdev_disable_streams(sd, r_pad->index, BIT(r_stream));
> +
> +out_media_entity_stop_streaming_firmware:
> +	stop_streaming_firmware(av);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ioctl_ops ipu6_v4l2_ioctl_ops = {
> +	.vidioc_querycap = ipu6_isys_vidioc_querycap,
> +	.vidioc_enum_fmt_vid_cap = ipu6_isys_vidioc_enum_fmt,
> +	.vidioc_enum_framesizes = ipu6_isys_vidioc_enum_framesizes,
> +	.vidioc_g_fmt_vid_cap = vidioc_g_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap = vidioc_s_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap = vidioc_try_fmt_vid_cap,
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +};
> +
> +static const struct media_entity_operations entity_ops = {
> +	.link_validate = link_validate,
> +};
> +
> +static const struct v4l2_file_operations isys_fops = {
> +	.owner = THIS_MODULE,
> +	.poll = vb2_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = vb2_fop_mmap,
> +	.open = video_open,
> +	.release = vb2_fop_release,
> +};
> +
> +int ipu6_isys_fw_open(struct ipu6_isys *isys)
> +{
> +	struct ipu6_bus_device *adev = isys->adev;
> +	const struct ipu6_isys_internal_pdata *ipdata = isys->pdata->ipdata;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(&adev->auxdev.dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	mutex_lock(&isys->mutex);
> +
> +	if (isys->ref_count++)
> +		goto unlock;
> +
> +	ipu6_configure_spc(adev->isp, &ipdata->hw_variant,
> +			   IPU6_CPD_PKG_DIR_ISYS_SERVER_IDX, isys->pdata->base,
> +			   adev->pkg_dir, adev->pkg_dir_dma_addr);
> +
> +	/*
> +	 * Buffers could have been left to wrong queue at last closure.
> +	 * Move them now back to empty buffer queue.
> +	 */
> +	ipu6_cleanup_fw_msg_bufs(isys);
> +
> +	if (isys->fwcom) {
> +		/*
> +		 * Something went wrong in previous shutdown. As we are now
> +		 * restarting isys we can safely delete old context.
> +		 */
> +		dev_warn(&adev->auxdev.dev, "clearing old context\n");
> +		ipu6_fw_isys_cleanup(isys);
> +	}
> +
> +	ret = ipu6_fw_isys_init(isys, ipdata->num_parallel_streams);
> +	if (ret < 0)
> +		goto out;
> +
> +unlock:
> +	mutex_unlock(&isys->mutex);
> +
> +	return 0;
> +
> +out:
> +	isys->ref_count--;
> +	mutex_unlock(&isys->mutex);
> +	pm_runtime_put(&adev->auxdev.dev);
> +
> +	return ret;
> +}
> +
> +void ipu6_isys_fw_close(struct ipu6_isys *isys)
> +{
> +	mutex_lock(&isys->mutex);
> +
> +	isys->ref_count--;
> +	if (!isys->ref_count) {
> +		ipu6_fw_isys_close(isys);
> +		if (isys->fwcom) {
> +			isys->need_reset = true;
> +			dev_warn(&isys->adev->auxdev.dev,
> +				 "failed to close fw isys\n");
> +		}
> +	}
> +
> +	mutex_unlock(&isys->mutex);
> +
> +	if (isys->need_reset)
> +		pm_runtime_put_sync(&isys->adev->auxdev.dev);
> +	else
> +		pm_runtime_put(&isys->adev->auxdev.dev);
> +}
> +
> +int ipu6_isys_setup_video(struct ipu6_isys_video *av,
> +			  struct media_entity **source_entity, int *nr_queues)
> +{
> +	struct device *dev = &av->isys->adev->auxdev.dev;
> +	struct v4l2_mbus_frame_desc_entry entry;
> +	struct v4l2_subdev_route *route = NULL;
> +	struct v4l2_subdev_route *r;
> +	struct v4l2_subdev_state *state;
> +	struct ipu6_isys_subdev *asd;
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pipeline *pipeline;
> +	struct media_pad *source_pad, *remote_pad;
> +	int ret = -EINVAL;
> +
> +	*nr_queues = 0;
> +
> +	remote_pad = media_pad_remote_pad_unique(&av->pad);
> +	if (IS_ERR(remote_pad)) {
> +		dev_dbg(dev, "failed to get remote pad\n");
> +		return PTR_ERR(remote_pad);
> +	}
> +
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +	asd = to_ipu6_isys_subdev(remote_sd);
> +	source_pad = media_pad_remote_pad_first(&remote_pad->entity->pads[0]);
> +	if (!source_pad) {
> +		dev_dbg(dev, "No external source entity\n");
> +		return -ENODEV;
> +	}
> +
> +	*source_entity = source_pad->entity;
> +
> +	/* Find the root */
> +	state = v4l2_subdev_lock_and_get_active_state(remote_sd);
> +	for_each_active_route(&state->routing, r) {
> +		(*nr_queues)++;
> +
> +		if (r->source_pad == remote_pad->index)
> +			route = r;
> +	}
> +
> +	if (!route) {
> +		v4l2_subdev_unlock_state(state);
> +		dev_dbg(dev, "Failed to find route\n");
> +		return -ENODEV;
> +	}
> +	av->source_stream = route->sink_stream;
> +	v4l2_subdev_unlock_state(state);
> +
> +	ret = ipu6_isys_csi2_get_remote_desc(av->source_stream,
> +					     to_ipu6_isys_csi2(asd),
> +					     *source_entity, &entry);
> +	if (ret == -ENOIOCTLCMD) {
> +		av->vc = 0;
> +		av->dt = ipu6_isys_mbus_code_to_mipi(av->pfmt->code);
> +	} else if (!ret) {
> +		dev_dbg(dev, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
> +			entry.stream, entry.length, entry.bus.csi2.vc,
> +			entry.bus.csi2.dt);
> +
> +		av->vc = entry.bus.csi2.vc;
> +		av->dt = entry.bus.csi2.dt;
> +	} else {
> +		dev_err(dev, "failed to get remote frame desc\n");
> +		return ret;
> +	}
> +
> +	pipeline = media_entity_pipeline(&av->vdev.entity);
> +	if (!pipeline)
> +		ret = video_device_pipeline_alloc_start(&av->vdev);
> +	else
> +		ret = video_device_pipeline_start(&av->vdev, pipeline);
> +	if (ret < 0) {
> +		dev_dbg(dev, "media pipeline start failed\n");
> +		return ret;
> +	}
> +
> +	av->stream = ipu6_isys_get_stream(av, asd);
> +	if (!av->stream) {
> +		video_device_pipeline_stop(&av->vdev);
> +		dev_err(dev, "no available stream for firmware\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Do everything that's needed to initialise things related to video
> + * buffer queue, video node, and the related media entity. The caller
> + * is expected to assign isys field and set the name of the video
> + * device.
> + */
> +int ipu6_isys_video_init(struct ipu6_isys_video *av)
> +{
> +	struct v4l2_format format = {
> +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> +		.fmt.pix = {
> +			.width = 1920,
> +			.height = 1080,
> +		},
> +	};
> +	int ret;
> +
> +	mutex_init(&av->mutex);
> +	av->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_IO_MC |
> +			       V4L2_CAP_VIDEO_CAPTURE;
> +	av->vdev.vfl_dir = VFL_DIR_RX;
> +
> +	ret = ipu6_isys_queue_init(&av->aq);
> +	if (ret)
> +		goto out_free_watermark;
> +
> +	av->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
> +	ret = media_entity_pads_init(&av->vdev.entity, 1, &av->pad);
> +	if (ret)
> +		goto out_vb2_queue_release;
> +
> +	av->vdev.entity.ops = &entity_ops;
> +	av->vdev.release = video_device_release_empty;
> +	av->vdev.fops = &isys_fops;
> +	av->vdev.v4l2_dev = &av->isys->v4l2_dev;
> +	if (!av->vdev.ioctl_ops)
> +		av->vdev.ioctl_ops = &ipu6_v4l2_ioctl_ops;
> +	av->vdev.queue = &av->aq.vbq;
> +	av->vdev.lock = &av->mutex;
> +
> +	ipu6_isys_video_try_fmt_vid(av, &format.fmt.pix);
> +	av->pix_fmt = format.fmt.pix;
> +
> +	set_bit(V4L2_FL_USES_V4L2_FH, &av->vdev.flags);
> +	video_set_drvdata(&av->vdev, av);
> +
> +	ret = video_register_device(&av->vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret)
> +		goto out_media_entity_cleanup;
> +
> +	return ret;
> +
> +out_media_entity_cleanup:
> +	vb2_video_unregister_device(&av->vdev);
> +	media_entity_cleanup(&av->vdev.entity);
> +
> +out_vb2_queue_release:
> +	vb2_queue_release(&av->aq.vbq);
> +
> +out_free_watermark:
> +	mutex_destroy(&av->mutex);
> +
> +	return ret;
> +}
> +
> +void ipu6_isys_video_cleanup(struct ipu6_isys_video *av)
> +{
> +	vb2_video_unregister_device(&av->vdev);
> +	media_entity_cleanup(&av->vdev.entity);
> +	mutex_destroy(&av->mutex);
> +}
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
> new file mode 100644
> index 000000000000..7b4e80678fec
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
> @@ -0,0 +1,132 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (C) 2013--2024 Intel Corporation */
> +
> +#ifndef IPU6_ISYS_VIDEO_H
> +#define IPU6_ISYS_VIDEO_H
> +
> +#include <linux/atomic.h>
> +#include <linux/completion.h>
> +#include <linux/container_of.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +
> +#include <media/media-entity.h>
> +#include <media/v4l2-dev.h>
> +
> +#include "ipu6-isys-queue.h"
> +
> +#define IPU6_ISYS_OUTPUT_PINS 11
> +#define IPU6_ISYS_MAX_PARALLEL_SOF 2
> +
> +struct file;
> +struct ipu6_isys;
> +struct ipu6_isys_csi2;
> +struct ipu6_isys_subdev;
> +
> +struct ipu6_isys_pixelformat {
> +	u32 pixelformat;
> +	u32 bpp;
> +	u32 bpp_packed;
> +	u32 code;
> +	u32 css_pixelformat;
> +};
> +
> +struct sequence_info {
> +	unsigned int sequence;
> +	u64 timestamp;
> +};
> +
> +struct output_pin_data {
> +	void (*pin_ready)(struct ipu6_isys_stream *stream,
> +			  struct ipu6_fw_isys_resp_info_abi *info);
> +	struct ipu6_isys_queue *aq;
> +};
> +
> +/*
> + * Align with firmware stream. Each stream represents a CSI virtual channel.
> + * May map to multiple video devices
> + */
> +struct ipu6_isys_stream {
> +	struct mutex mutex;
> +	struct media_entity *source_entity;
> +	atomic_t sequence;
> +	unsigned int seq_index;
> +	struct sequence_info seq[IPU6_ISYS_MAX_PARALLEL_SOF];
> +	int stream_source;
> +	int stream_handle;
> +	unsigned int nr_output_pins;
> +	struct ipu6_isys_subdev *asd;
> +
> +	int nr_queues;	/* Number of capture queues */
> +	int nr_streaming;
> +	int streaming;	/* Has streaming been really started? */
> +	struct list_head queues;
> +	struct completion stream_open_completion;
> +	struct completion stream_close_completion;
> +	struct completion stream_start_completion;
> +	struct completion stream_stop_completion;
> +	struct ipu6_isys *isys;
> +
> +	struct output_pin_data output_pins[IPU6_ISYS_OUTPUT_PINS];
> +	int error;
> +	u8 vc;
> +};
> +
> +struct video_stream_watermark {
> +	u32 width;
> +	u32 height;
> +	u32 hblank;
> +	u32 frame_rate;
> +	u64 pixel_rate;
> +	u64 stream_data_rate;
> +	u16 sram_gran_shift;
> +	u16 sram_gran_size;
> +	struct list_head stream_node;
> +};
> +
> +struct ipu6_isys_video {
> +	struct ipu6_isys_queue aq;
> +	/* Serialise access to other fields in the struct. */
> +	struct mutex mutex;
> +	struct media_pad pad;
> +	struct video_device vdev;
> +	struct v4l2_pix_format pix_fmt;
> +	const struct ipu6_isys_pixelformat *pfmt;
> +	struct ipu6_isys *isys;
> +	struct ipu6_isys_csi2 *csi2;
> +	struct ipu6_isys_stream *stream;
> +	unsigned int streaming;
> +	struct video_stream_watermark watermark;
> +	u32 source_stream;
> +	u8 vc;
> +	u8 dt;
> +};
> +
> +#define ipu6_isys_queue_to_video(__aq) \
> +	container_of(__aq, struct ipu6_isys_video, aq)
> +
> +extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts[];
> +extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts_packed[];
> +
> +int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
> +				   struct media_entity *source_entity,
> +				   int nr_queues);
> +int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> +				  struct ipu6_isys_buffer_list *bl);
> +int ipu6_isys_fw_open(struct ipu6_isys *isys);
> +void ipu6_isys_fw_close(struct ipu6_isys *isys);
> +int ipu6_isys_setup_video(struct ipu6_isys_video *av,
> +			  struct media_entity **source_entity, int *nr_queues);
> +int ipu6_isys_video_init(struct ipu6_isys_video *av);
> +void ipu6_isys_video_cleanup(struct ipu6_isys_video *av);
> +void ipu6_isys_put_stream(struct ipu6_isys_stream *stream);
> +struct ipu6_isys_stream *
> +ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle);
> +struct ipu6_isys_stream *
> +ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc);
> +
> +void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
> +					  bool state);
> +void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state);
> +
> +#endif /* IPU6_ISYS_VIDEO_H */


