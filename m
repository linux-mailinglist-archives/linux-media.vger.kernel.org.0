Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8C3FAB43
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 08:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfKMHvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 02:51:52 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:58811 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725908AbfKMHvw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 02:51:52 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id UnRJif1LgXYiTUnRMiCPSg; Wed, 13 Nov 2019 08:51:48 +0100
Subject: Re: [PATCH v4] vivid: Add touch support
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org
References: <20191112135421.3766-1-bnvandana@gmail.com>
 <20191113073754.15877-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <41670600-f97f-8c52-d13b-78fb1c44a01b@xs4all.nl>
Date:   Wed, 13 Nov 2019 08:51:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113073754.15877-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFaukmFFsQKVtbiuzhZTfC5CT6BBStqLkJkySmetQMtF4cpxO4KpLSnoZQCyRsFmee70bJ/7jjupUGBXuo0yOMycy0a4/C1KWwKBELG2OYSGXaeMFF4R
 cl7nP8LJbSeln/uPr2IvCj5wHUeY0Mg3QOboHFfBKWcX1logtzXeDHF9E45llr7yb5x/gnGO2xvPKdxQcEXoq5KXX/DRALb+k+o=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vandana,

Is the last posted v4l-utils patch still valid with this v4?

I managed to get the rmi4 driver to work on my Lenovo laptop, but I get
weird data from the device. I am still investigating what is going on.

Anyway, I have some more, fairly minor, comments about this patch below.

Regards,

	Hans


On 11/13/19 8:37 AM, Vandana BN wrote:
> Support to emulate touch devices in vivid driver.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
> Incorporate changes from https://patchwork.linuxtv.org/patch/59782/,
> to avoid the mutex unlocking/relocking around the kthread_stop.
> ---
>  drivers/media/platform/vivid/Makefile         |   3 +-
>  drivers/media/platform/vivid/vivid-core.c     | 187 +++++++++-
>  drivers/media/platform/vivid/vivid-core.h     |  22 ++
>  drivers/media/platform/vivid/vivid-ctrls.c    |  11 +
>  .../platform/vivid/vivid-kthread-touch.c      | 207 +++++++++++
>  .../platform/vivid/vivid-kthread-touch.h      |  13 +
>  .../media/platform/vivid/vivid-touch-cap.c    | 325 ++++++++++++++++++
>  .../media/platform/vivid/vivid-touch-cap.h    |  43 +++
>  8 files changed, 796 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.c
>  create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.h
>  create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.c
>  create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.h
> 

<snip>

> diff --git a/drivers/media/platform/vivid/vivid-kthread-touch.c b/drivers/media/platform/vivid/vivid-kthread-touch.c
> new file mode 100644
> index 000000000000..7ef7230c9a27
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-kthread-touch.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * vivid-kthread-touch.c - touch capture thread support functions.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/font.h>

This header is unused.

> +#include <linux/mutex.h>
> +#include <linux/videodev2.h>
> +#include <linux/kthread.h>
> +#include <linux/freezer.h>
> +#include <linux/random.h>

as is this one (I think).

> +#include <asm/div64.h>
> +#include <media/videobuf2-vmalloc.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-rect.h>

I suspect some of these v4l2 headers can be dropped as well.

> +
> +#include "vivid-core.h"
> +#include "vivid-osd.h"
> +#include "vivid-ctrls.h"

Are osd and ctrls.h needed?

> +#include "vivid-kthread-touch.h"
> +#include "vivid-touch-cap.h"

In other words, weed out the unnecessary headers from this list.

> +
> +static noinline_for_stack void vivid_thread_tch_cap_tick(struct vivid_dev *dev,
> +							 int dropped_bufs)
> +{
> +	struct vivid_buffer *tch_cap_buf = NULL;
> +
> +	dprintk(dev, 1, "Touch Capture Thread Tick\n");
> +
> +	spin_lock(&dev->slock);
> +	if (!list_empty(&dev->touch_cap_active)) {
> +		tch_cap_buf = list_entry(dev->touch_cap_active.next,
> +					 struct vivid_buffer, list);
> +		list_del(&tch_cap_buf->list);
> +	}
> +
> +	spin_unlock(&dev->slock);
> +
> +	if (tch_cap_buf) {
> +		v4l2_ctrl_request_setup(tch_cap_buf->vb.vb2_buf.req_obj.req,
> +					&dev->ctrl_hdl_touch_cap);
> +
> +		vivid_fillbuff_tch(dev, tch_cap_buf);
> +		v4l2_ctrl_request_complete(tch_cap_buf->vb.vb2_buf.req_obj.req,
> +					   &dev->ctrl_hdl_touch_cap);
> +		vb2_buffer_done(&tch_cap_buf->vb.vb2_buf, dev->dqbuf_error ?
> +				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
> +		dprintk(dev, 2, "touch_cap buffer %d done\n",
> +			tch_cap_buf->vb.vb2_buf.index);
> +
> +		tch_cap_buf->vb.vb2_buf.timestamp = ktime_get_ns() + dev->time_wrap_offset;
> +	}
> +	dev->dqbuf_error = false;
> +}
> +
> +static int vivid_thread_touch_cap(void *data)
> +{
> +	struct vivid_dev *dev = data;
> +	u64 numerators_since_start;
> +	u64 buffers_since_start;
> +	u64 next_jiffies_since_start;
> +	unsigned long jiffies_since_start;
> +	unsigned long cur_jiffies;
> +	unsigned int wait_jiffies;
> +	unsigned int numerator;
> +	unsigned int denominator;
> +	int dropped_bufs;
> +
> +	dprintk(dev, 1, "Touch Capture Thread Start\n");
> +
> +	set_freezable();
> +
> +	/* Resets frame counters */
> +	dev->touch_cap_seq_offset = 0;
> +	dev->touch_cap_seq_count = 0;
> +	dev->touch_cap_seq_resync = false;
> +	dev->jiffies_touch_cap = jiffies;
> +
> +	for (;;) {
> +		try_to_freeze();
> +		if (kthread_should_stop())
> +			break;
> +
> +		if (!mutex_trylock(&dev->mutex)) {
> +			schedule_timeout_uninterruptible(1);
> +			continue;
> +		}
> +		cur_jiffies = jiffies;
> +		if (dev->touch_cap_seq_resync) {
> +			dev->jiffies_touch_cap = cur_jiffies;
> +			dev->touch_cap_seq_offset = dev->touch_cap_seq_count + 1;
> +			dev->touch_cap_seq_count = 0;
> +			dev->cap_seq_resync = false;
> +		}
> +		denominator = dev->timeperframe_tch_cap.denominator;
> +		numerator = dev->timeperframe_tch_cap.numerator;
> +
> +		/* Calculate the number of jiffies since we started streaming */
> +		jiffies_since_start = cur_jiffies - dev->jiffies_touch_cap;
> +		/* Get the number of buffers streamed since the start */
> +		buffers_since_start = (u64)jiffies_since_start * denominator +
> +				      (HZ * numerator) / 2;
> +		do_div(buffers_since_start, HZ * numerator);
> +
> +		/*
> +		 * After more than 0xf0000000 (rounded down to a multiple of
> +		 * 'jiffies-per-day' to ease jiffies_to_msecs calculation)
> +		 * jiffies have passed since we started streaming reset the
> +		 * counters and keep track of the sequence offset.
> +		 */
> +		if (jiffies_since_start > JIFFIES_RESYNC) {
> +			dev->jiffies_touch_cap = cur_jiffies;
> +			dev->cap_seq_offset = buffers_since_start;
> +			buffers_since_start = 0;
> +		}
> +		dropped_bufs = buffers_since_start + dev->touch_cap_seq_offset - dev->touch_cap_seq_count;
> +		dev->touch_cap_seq_count = buffers_since_start + dev->touch_cap_seq_offset;
> +
> +		vivid_thread_tch_cap_tick(dev, dropped_bufs);
> +
> +		/*
> +		 * Calculate the number of 'numerators' streamed
> +		 * since we started, including the current buffer.
> +		 */
> +		numerators_since_start = ++buffers_since_start * numerator;
> +
> +		/* And the number of jiffies since we started */
> +		jiffies_since_start = jiffies - dev->jiffies_touch_cap;
> +
> +		mutex_unlock(&dev->mutex);
> +
> +		/*
> +		 * Calculate when that next buffer is supposed to start
> +		 * in jiffies since we started streaming.
> +		 */
> +		next_jiffies_since_start = numerators_since_start * HZ +
> +					   denominator / 2;
> +		do_div(next_jiffies_since_start, denominator);
> +		/* If it is in the past, then just schedule asap */
> +		if (next_jiffies_since_start < jiffies_since_start)
> +			next_jiffies_since_start = jiffies_since_start;
> +
> +		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
> +		schedule_timeout_interruptible(wait_jiffies ? wait_jiffies : 1);
> +	}
> +	dprintk(dev, 1, "Touch Capture Thread End\n");
> +	return 0;
> +}
> +
> +int vivid_start_generating_touch_cap(struct vivid_dev *dev)
> +{
> +	dprintk(dev, 1, "%s\n", __func__);
> +
> +	if (dev->kthread_touch_cap) {
> +		dev->touch_cap_streaming = true;
> +		return 0;
> +	}
> +
> +	dev->kthread_touch_cap = kthread_run(vivid_thread_touch_cap, dev,
> +					     "%s-tch-cap", dev->v4l2_dev.name);
> +
> +	if (IS_ERR(dev->kthread_touch_cap)) {
> +		int err = PTR_ERR(dev->kthread_touch_cap);
> +
> +		dev->kthread_touch_cap = NULL;
> +		v4l2_err(&dev->v4l2_dev, "kernel_thread() failed\n");
> +		return err;
> +	}
> +	dev->touch_cap_streaming = true;
> +	dprintk(dev, 1, "returning from %s\n", __func__);
> +	return 0;
> +}
> +
> +void vivid_stop_generating_touch_cap(struct vivid_dev *dev)
> +{
> +	dprintk(dev, 1, "%s\n", __func__);
> +
> +	if (!dev->kthread_touch_cap)
> +		return;
> +
> +	dev->touch_cap_streaming = false;
> +
> +	while (!list_empty(&dev->touch_cap_active)) {
> +		struct vivid_buffer *buf;
> +
> +		buf = list_entry(dev->touch_cap_active.next,
> +				 struct vivid_buffer, list);
> +		list_del(&buf->list);
> +		v4l2_ctrl_request_complete(buf->vb.vb2_buf.req_obj.req,
> +					   &dev->ctrl_hdl_touch_cap);
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +		dprintk(dev, 2, "touch_cap buffer %d done\n",
> +			buf->vb.vb2_buf.index);
> +	}
> +
> +	kthread_stop(dev->kthread_touch_cap);
> +	dev->kthread_touch_cap = NULL;
> +}
> diff --git a/drivers/media/platform/vivid/vivid-kthread-touch.h b/drivers/media/platform/vivid/vivid-kthread-touch.h
> new file mode 100644
> index 000000000000..ecf79b46209e
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-kthread-touch.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * vivid-kthread-cap.h - video/vbi capture thread support functions.
> + *
> + */
> +
> +#ifndef _VIVID_KTHREAD_CAP_H_
> +#define _VIVID_KTHREAD_CAP_H_
> +
> +int vivid_start_generating_touch_cap(struct vivid_dev *dev);
> +void vivid_stop_generating_touch_cap(struct vivid_dev *dev);
> +
> +#endif
> diff --git a/drivers/media/platform/vivid/vivid-touch-cap.c b/drivers/media/platform/vivid/vivid-touch-cap.c
> new file mode 100644
> index 000000000000..b8c1a78fb1be
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-touch-cap.c
> @@ -0,0 +1,325 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * vivid-touch-cap.c - touch support functions.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-common.h>
> +#include <linux/usb/video.h>

Here too are some includes that can be dropped.

> +
> +#include "vivid-core.h"
> +#include "vivid-kthread-touch.h"
> +#include "vivid-touch-cap.h"
> +
> +static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> +				 unsigned int *nplanes, unsigned int sizes[],
> +				 struct device *alloc_devs[])
> +{
> +	unsigned int size = sizeof(struct vivid_touch_buf);
> +
> +	if (*nplanes) {
> +		if (sizes[0] < size)
> +			return -EINVAL;
> +	} else {
> +		sizes[0] = size;
> +	}
> +
> +	if (vq->num_buffers + *nbuffers < 2)
> +		*nbuffers = 2 - vq->num_buffers;
> +
> +	*nplanes = 1;
> +	return 0;
> +}
> +
> +static int touch_cap_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
> +	unsigned int size = sizeof(struct vivid_touch_buf);
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +
> +	if (dev->buf_prepare_error) {
> +		/*
> +		 * Error injection: test what happens if buf_prepare() returns
> +		 * an error.
> +		 */
> +		dev->buf_prepare_error = false;
> +		return -EINVAL;
> +	}
> +	if (vb2_plane_size(vb, 0) < size) {
> +		dprintk(dev, 1, "%s data will not fit into plane (%lu < %u)\n",
> +			__func__, vb2_plane_size(vb, 0), size);
> +		return -EINVAL;
> +	}
> +	vb2_set_plane_payload(vb, 0, size);
> +
> +	return 0;
> +}
> +
> +static void touch_cap_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vivid_buffer *buf = container_of(vbuf, struct vivid_buffer, vb);
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +
> +	spin_lock(&dev->slock);
> +	list_add_tail(&buf->list, &dev->touch_cap_active);
> +	spin_unlock(&dev->slock);
> +}
> +
> +static int touch_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	int err;
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +	dev->touch_cap_seq_count = 0;
> +	dev->tch_test_pattern = SINGLE_TAP;
> +	dev->tch_cnt = 1;
> +	if (dev->start_streaming_error) {
> +		dev->start_streaming_error = false;
> +		err = -EINVAL;
> +	} else {
> +		err = vivid_start_generating_touch_cap(dev);
> +	}
> +	if (err) {
> +		struct vivid_buffer *buf, *tmp;
> +
> +		list_for_each_entry_safe(buf, tmp,
> +					 &dev->touch_cap_active, list) {
> +			list_del(&buf->list);
> +			vb2_buffer_done(&buf->vb.vb2_buf,
> +					VB2_BUF_STATE_QUEUED);
> +		}
> +	}
> +	return err;
> +}
> +
> +/* abort streaming and wait for last buffer */
> +static void touch_cap_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +	vivid_stop_generating_touch_cap(dev);
> +}
> +
> +static void touch_cap_buf_request_complete(struct vb2_buffer *vb)
> +{
> +	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_ctrl_request_complete(vb->req_obj.req, &dev->ctrl_hdl_touch_cap);
> +}
> +
> +const struct vb2_ops vivid_touch_cap_qops = {
> +	.queue_setup		= touch_cap_queue_setup,
> +	.buf_prepare		= touch_cap_buf_prepare,
> +	.buf_queue		= touch_cap_buf_queue,
> +	.start_streaming	= touch_cap_start_streaming,
> +	.stop_streaming		= touch_cap_stop_streaming,
> +	.buf_request_complete	= touch_cap_buf_request_complete,
> +	.wait_prepare		= vb2_ops_wait_prepare,
> +	.wait_finish		= vb2_ops_wait_finish,
> +};
> +
> +int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f)
> +{
> +	struct vivid_dev *dev = video_drvdata(file);
> +
> +	if (f->index)
> +		return -EINVAL;
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +
> +	f->pixelformat = V4L2_TCH_FMT_TU16;
> +	return 0;
> +}
> +
> +int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct vivid_dev *dev = video_drvdata(file);
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +
> +	f->fmt.pix = dev->tch_format;
> +	return 0;
> +}
> +
> +int vivid_g_parm_tch(struct file *file, void *priv,
> +		     struct v4l2_streamparm *parm)
> +{
> +	struct vivid_dev *dev = video_drvdata(file);
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +
> +	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	parm->parm.capture.capability   = V4L2_CAP_TIMEPERFRAME;
> +	parm->parm.capture.timeperframe = dev->timeperframe_tch_cap;
> +	parm->parm.capture.readbuffers  = 1;
> +	return 0;
> +}
> +
> +int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp)
> +{
> +	struct vivid_dev *dev = video_drvdata(file);
> +
> +	dprintk(dev, 1, "%s\n", __func__);
> +
> +	if (inp->index)
> +		return -EINVAL;
> +
> +	inp->type = V4L2_INPUT_TYPE_TOUCH;
> +	snprintf(inp->name, sizeof(inp->name), "Vivid Touch %u",
> +		 dev->input_name_counter[inp->index]);
> +	inp->capabilities = 0;
> +	return 0;
> +}
> +
> +int vivid_g_input_tch(struct file *file, void *priv, unsigned int *i)
> +{
> +	*i = 0;
> +	return 0;
> +}
> +
> +int vivid_set_touch(struct vivid_dev *dev, unsigned int i)
> +{
> +	struct v4l2_pix_format *f = &dev->tch_format;
> +
> +	if (i)
> +		return -EINVAL;
> +
> +	f->pixelformat = V4L2_TCH_FMT_TU16;
> +	f->width =  VIVID_TCH_WIDTH;
> +	f->height = VIVID_TCH_HEIGHT;
> +	f->field = V4L2_FIELD_NONE;
> +	f->colorspace = V4L2_COLORSPACE_RAW;
> +	f->bytesperline = f->width * sizeof(u16);
> +	f->sizeimage = f->width * f->height * sizeof(u16);
> +	return 0;
> +}
> +
> +int vivid_s_input_tch(struct file *file, void *priv, unsigned int i)
> +{
> +	return vivid_set_touch(video_drvdata(file), i);
> +}
> +
> +int vivid_enum_frameintervals_tch(struct file *file, void *priv,
> +				  struct v4l2_frmivalenum *fival)
> +{
> +	struct vivid_dev *dev = video_drvdata(file);
> +
> +	if (fival->index)
> +		return -EINVAL;
> +	if (fival->width < VIVID_TCH_WIDTH ||
> +	    fival->width > VIVID_TCH_WIDTH)
> +		return -EINVAL;
> +	if (fival->height < VIVID_TCH_HEIGHT ||
> +	    fival->height > VIVID_TCH_HEIGHT)
> +		return -EINVAL;

That's the equivalent of fival->height != VIVID_TCH_HEIGHT :-)

> +
> +	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
> +	fival->discrete = dev->timeperframe_tch_cap;
> +	return 0;
> +}
> +
> +int vivid_enum_framesizes_tch(struct file *file, void *fh,
> +			      struct v4l2_frmsizeenum *fsize)
> +{
> +	if (fsize->index)
> +		return -EINVAL;
> +	if (fsize->pixel_format != V4L2_TCH_FMT_TU16)
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> +	fsize->discrete.width  = VIVID_TCH_WIDTH;
> +	fsize->discrete.height = VIVID_TCH_HEIGHT;
> +	return 0;
> +}
> +
> +void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf)
> +{
> +	int size = VIVID_TCH_WIDTH * VIVID_TCH_HEIGHT;
> +	int index = 0, x, y, xstart, ystart;
> +	struct vivid_touch_buf *tch_buf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +
> +	buf->vb.sequence = dev->touch_cap_seq_count;
> +
> +	memset(tch_buf, 0, vb2_plane_size(&buf->vb.vb2_buf, 0));
> +
> +	switch (dev->tch_test_pattern) {
> +	case SINGLE_TAP:
> +	case DOUBLE_TAP:
> +	case TRIPLE_TAP:
> +		if (dev->tch_cnt == 1)
> +			dev->tch_index = get_random_int() % size;
> +		if (dev->tch_cnt % 2)
> +			tch_buf->buf[dev->tch_index] = get_random_int() % VIVID_MAX_PRESSURE;
> +		dev->tch_cnt++;
> +		if (dev->tch_cnt > dev->tch_test_pattern * 2) {
> +			dev->tch_test_pattern++;
> +			dev->tch_cnt = 1;
> +		}
> +		break;
> +	case SWAP_LEFT_RIGHT:
> +		x = get_random_int() % VIVID_TCH_WIDTH;
> +		for (index = x; index < VIVID_TCH_WIDTH ; index++)
> +			tch_buf->buf[index] = get_random_int() % VIVID_MAX_PRESSURE;
> +		dev->tch_test_pattern++;
> +		dev->tch_index = 0;
> +		break;
> +	case ZOOM_IN:
> +	case ZOOM_OUT:
> +		x = VIVID_TCH_WIDTH / 2;
> +		y = VIVID_TCH_HEIGHT / 2;
> +		if (!dev->tch_index) {
> +			index = x + VIVID_TCH_WIDTH * y;
> +			tch_buf->buf[index] = get_random_int() % VIVID_MAX_PRESSURE;
> +			if (dev->tch_test_pattern == ZOOM_OUT)
> +				dev->tch_test_pattern++;
> +		} else {
> +			index = (x - dev->tch_index) + VIVID_TCH_WIDTH * (y - dev->tch_index);
> +			tch_buf->buf[index] = get_random_int() % VIVID_MAX_PRESSURE;
> +			index = (x + dev->tch_index) + VIVID_TCH_WIDTH * (y + dev->tch_index);
> +			tch_buf->buf[index] = get_random_int() % VIVID_MAX_PRESSURE;
> +		}
> +		if (dev->tch_test_pattern == ZOOM_IN) {
> +			dev->tch_index++;
> +			if (x + dev->tch_index >= VIVID_TCH_WIDTH ||
> +			    y + dev->tch_index >= VIVID_TCH_HEIGHT)
> +				dev->tch_test_pattern++;
> +		}
> +		if (dev->tch_test_pattern == ZOOM_OUT)
> +			dev->tch_index--;
> +		break;
> +	case PALM_PRESS:
> +		xstart = VIVID_TCH_WIDTH - VIVID_TCH_WIDTH / 4;
> +		ystart = VIVID_TCH_HEIGHT - VIVID_TCH_HEIGHT / 4;
> +		for (x = xstart; x < VIVID_TCH_WIDTH; x++) {
> +			for (y = ystart; y < VIVID_TCH_HEIGHT; y++) {
> +				index = x + VIVID_TCH_WIDTH * y;
> +				tch_buf->buf[index] = get_random_int() % VIVID_MAX_PRESSURE;
> +			}
> +		}
> +		dev->tch_test_pattern++;
> +		break;
> +	case MULTIPLE_PRESS:
> +		/*16 pressure points*/
> +		for (x = 0; x < 16; x++) {
> +			index = get_random_int() % size;
> +			tch_buf->buf[index] = get_random_int() % VIVID_MAX_PRESSURE;
> +		}
> +		dev->tch_test_pattern++;
> +		break;
> +	}
> +
> +	if (dev->tch_test_pattern == TEST_CASE_MAX) {
> +		dev->tch_test_pattern = SINGLE_TAP;
> +		dev->tch_cnt = 1;
> +	}
> +}
> diff --git a/drivers/media/platform/vivid/vivid-touch-cap.h b/drivers/media/platform/vivid/vivid-touch-cap.h
> new file mode 100644
> index 000000000000..41ac3409ab31
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-touch-cap.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * vivid-touch-cap.h - touch support functions.
> + */
> +#ifndef _VIVID_TOUCH_CAP_H_
> +#define _VIVID_TOUCH_CAP_H_
> +
> +#define VIVID_TCH_HEIGHT	24
> +#define VIVID_TCH_WIDTH		14
> +#define VIVID_MAX_PRESSURE	255
> +
> +enum vivid_tch_test {
> +	SINGLE_TAP = 1,
> +	DOUBLE_TAP,
> +	TRIPLE_TAP,
> +	SWAP_LEFT_RIGHT,

You mean: MOVE_LEFT_TO_RIGHT

> +	ZOOM_IN,
> +	ZOOM_OUT,
> +	PALM_PRESS,
> +	MULTIPLE_PRESS,
> +	TEST_CASE_MAX
> +};
> +
> +struct vivid_touch_buf {
> +	u16	buf[VIVID_TCH_WIDTH * VIVID_TCH_HEIGHT];
> +};
> +
> +extern const struct vb2_ops vivid_touch_cap_qops;
> +
> +int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
> +int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f);
> +int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp);
> +int vivid_g_input_tch(struct file *file, void *priv, unsigned int *i);
> +int vivid_s_input_tch(struct file *file, void *priv, unsigned int i);
> +void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf);
> +int vivid_set_touch(struct vivid_dev *dev, unsigned int i);
> +int vivid_g_parm_tch(struct file *file, void *priv,
> +		     struct v4l2_streamparm *parm);
> +int vivid_enum_frameintervals_tch(struct file *file, void *priv,
> +				  struct v4l2_frmivalenum *fival);
> +int vivid_enum_framesizes_tch(struct file *file, void *fh,
> +			      struct v4l2_frmsizeenum *fsize);
> +#endif
> 

Regards,

	Hans
