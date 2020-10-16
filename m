Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3774290724
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 16:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408699AbgJPO21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 10:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407408AbgJPO20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 10:28:26 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B559C061755;
        Fri, 16 Oct 2020 07:28:26 -0700 (PDT)
Received: from [IPv6:2003:c7:cf43:5b00:30b6:b06:27e6:9e70] (p200300c7cf435b0030b60b0627e69e70.dip0.t-ipconnect.de [IPv6:2003:c7:cf43:5b00:30b6:b06:27e6:9e70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2D63B1F461D4;
        Fri, 16 Oct 2020 15:28:24 +0100 (BST)
Subject: Re: [PATCH] media: staging: rkisp1: cap: refactor enable/disable
 stream to allow multistreaming
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, linux-kernel@vger.kernel.org
References: <20201015195746.264722-1-helen.koike@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8b31c5a3-9b01-9536-384a-b06d9a0a2e1a@collabora.com>
Date:   Fri, 16 Oct 2020 16:28:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015195746.264722-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am 15.10.20 um 21:57 schrieb Helen Koike:
> Allow streaming from self picture path and main picture path at the same
> time.
> 
> Take care for s_stream() callbacks to not be called twice.
> When starting a stream, s_stream(true) shouldn't be called for the isp
> and the sensor if the other stream is already enabled (since it was
> already called).
> When stopping a stream, s_stream(false) shouldn't be called for isp and
> the sensor if the other stream is still enabled.
> 
> Remove the callback function scheme for navigating through the topology,
> simplifying the code, improving readability, while calling
> media_pipeline_{start,stop}() in the right order.
> 
> Remove multistreaming item from the TODO list.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> Hello,
> 
> Since we didn't reach an agreement on the helpers in the core[1], I'm
> sending this patch to fix this limitation only for rkisp1.
> 
> [1] https://patchwork.linuxtv.org/project/linux-media/cover/20200415013044.1778572-1-helen.koike@collabora.com/
> 
> If we decide to add the helpers in the future, we can clean up drivers
> even more, but I don't want to block this feature.
> 
> Overview of the patch:
> ======================
> 
> * Rename rkisp1_stream_{start,stop}() to
>    rkisp1_cap_stream_{enable,disable}() to clarify the difference between
>    other stream enable/disable functions
> 
> * Implement rkisp1_pipeline_stream_{enable,disable}() to replace
>    rkisp1_pipeline_{enable,disable}_cb() and rkisp1_pipeline_sink_walk(),
>    which were removed.
> 
> * Call rkisp1_cap_stream_{enable,disable}() from
>    rkisp1_pipeline_stream_{enable,disable}() for better
>    unwind handling and function name semantics.
> 
> * Call media_pipeline_{start,stop}() in the right order.
> 
> * Remove item from TODO list (I also reviewed the use of the
>    is_streaming var in the code and lgtm).
> 
> This patch was tested on rockpi4 board with:
> ============================================
> 
> "media-ctl" "-d" "platform:rkisp1" "-r"
> "media-ctl" "-d" "platform:rkisp1" "-l" "'imx219 4-0010':0 -> 'rkisp1_isp':0 [1]"
> "media-ctl" "-d" "platform:rkisp1" "-l" "'rkisp1_isp':2 -> 'rkisp1_resizer_selfpath':0 [1]"
> "media-ctl" "-d" "platform:rkisp1" "-l" "'rkisp1_isp':2 -> 'rkisp1_resizer_mainpath':0 [1]"
> 
> "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"imx219 4-0010":0 [fmt:SRGGB10_1X10/1640x1232]'
> 
> "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_isp":0 [fmt:SRGGB10_1X10/1640x1232 crop: (0,0)/1600x1200]'
> "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_isp":2 [fmt:YUYV8_2X8/1600x1200 crop: (0,0)/1500x1100]'
> 
> "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_selfpath":0 [fmt:YUYV8_2X8/1500x1100 crop: (300,400)/1400x1000]'
> "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_selfpath":1 [fmt:YUYV8_2X8/900x800]'
> 
> "v4l2-ctl" "-z" "platform:rkisp1" "-d" "rkisp1_selfpath" "-v" "width=900,height=800,"
> "v4l2-ctl" "-z" "platform:rkisp1" "-d" "rkisp1_selfpath" "-v" "pixelformat=422P"
> 
> "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_mainpath":0 [fmt:YUYV8_2X8/1500x1100 crop: (300,400)/1400x1000]'
> "media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_mainpath":1 [fmt:YUYV8_2X8/900x800]'
> 
> "v4l2-ctl" "-z" "platform:rkisp1" "-d" "rkisp1_mainpath" "-v" "width=900,height=800,"
> "v4l2-ctl" "-z" "platform:rkisp1" "-d" "rkisp1_mainpath" "-v" "pixelformat=422P"
> 
> sleep 1
> 
> time v4l2-ctl "-z" "platform:rkisp1" "-d" "rkisp1_mainpath" "--stream-mmap" "--stream-count" "100" &
> time v4l2-ctl "-z" "platform:rkisp1" "-d" "rkisp1_selfpath" "--stream-mmap" "--stream-count" "100" &
> 
> wait
> echo "Completed"
> 
> Thanks
> Helen
> ---
>   drivers/staging/media/rkisp1/TODO             |   3 -
>   drivers/staging/media/rkisp1/rkisp1-capture.c | 227 +++++++++---------
>   2 files changed, 113 insertions(+), 117 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> index e7c8398fc2cef..a2dd0ad951c25 100644
> --- a/drivers/staging/media/rkisp1/TODO
> +++ b/drivers/staging/media/rkisp1/TODO
> @@ -1,9 +1,6 @@
>   * Fix pad format size for statistics and parameters entities.
>   * Fix checkpatch errors.
>   * Add uapi docs. Remember to add documentation of how quantization is handled.
> -* streaming paths (mainpath and selfpath) check if the other path is streaming
> -in several places of the code, review this, specially that it doesn't seem it
> -supports streaming from both paths at the same time.
>   
>   NOTES:
>   * All v4l2-compliance test must pass.
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index b6f497ce3e95c..254936873c6c1 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -830,71 +830,43 @@ static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
>   }
>   
>   /*
> - * rkisp1_pipeline_sink_walk - Walk through the pipeline and call cb
> - * @from: entity at which to start pipeline walk
> - * @until: entity at which to stop pipeline walk
> - *
> - * Walk the entities chain starting at the pipeline video node and stop
> - * all subdevices in the chain.
> - *
> - * If the until argument isn't NULL, stop the pipeline walk when reaching the
> - * until entity. This is used to disable a partially started pipeline due to a
> - * subdev start error.
> + * Most of registers inside rockchip ISP1 have shadow register since
> + * they must be not be changed during processing a frame.
> + * Usually, each sub-module updates its shadow register after
> + * processing the last pixel of a frame.
>    */
> -static int rkisp1_pipeline_sink_walk(struct media_entity *from,
> -				     struct media_entity *until,
> -				     int (*cb)(struct media_entity *from,
> -					       struct media_entity *curr))
> +static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
>   {
> -	struct media_entity *entity = from;
> -	struct media_pad *pad;
> -	unsigned int i;
> -	int ret;
> -
> -	while (1) {
> -		pad = NULL;
> -		/* Find remote source pad */
> -		for (i = 0; i < entity->num_pads; i++) {
> -			struct media_pad *spad = &entity->pads[i];
> -
> -			if (!(spad->flags & MEDIA_PAD_FL_SINK))
> -				continue;
> -			pad = media_entity_remote_pad(spad);
> -			if (pad && is_media_entity_v4l2_subdev(pad->entity))
> -				break;
> -		}
> -		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> -			break;
> +	struct rkisp1_device *rkisp1 = cap->rkisp1;
> +	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
>   
> -		entity = pad->entity;
> -		if (entity == until)
> -			break;
> +	cap->ops->set_data_path(cap);
> +	cap->ops->config(cap);
>   
> -		ret = cb(from, entity);
> -		if (ret)
> -			return ret;
> +	/* Setup a buffer for the next frame */
> +	spin_lock_irq(&cap->buf.lock);
> +	rkisp1_set_next_buf(cap);
> +	cap->ops->enable(cap);
> +	/* It's safe to config ACTIVE and SHADOW regs for the
> +	 * first stream. While when the second is starting, do NOT
> +	 * force update because it also update the first one.
> +	 *
> +	 * The latter case would drop one more buf(that is 2) since
> +	 * there's not buf in shadow when the second FE received. This's
> +	 * also required because the second FE maybe corrupt especially
> +	 * when run at 120fps.
> +	 */
> +	if (!other->is_streaming) {
> +		/* force cfg update */
> +		rkisp1_write(rkisp1,
> +			     RKISP1_CIF_MI_INIT_SOFT_UPD, RKISP1_CIF_MI_INIT);
> +		rkisp1_set_next_buf(cap);
>   	}
> -
> -	return 0;
> -}
> -
> -static int rkisp1_pipeline_disable_cb(struct media_entity *from,
> -				      struct media_entity *curr)
> -{
> -	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
> -
> -	return v4l2_subdev_call(sd, video, s_stream, false);
> -}
> -
> -static int rkisp1_pipeline_enable_cb(struct media_entity *from,
> -				     struct media_entity *curr)
> -{
> -	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
> -
> -	return v4l2_subdev_call(sd, video, s_stream, true);
> +	spin_unlock_irq(&cap->buf.lock);
> +	cap->is_streaming = true;
>   }
>   
> -static void rkisp1_stream_stop(struct rkisp1_capture *cap)
> +static void rkisp1_cap_stream_disable(struct rkisp1_capture *cap)
>   {
>   	int ret;
>   
> @@ -911,6 +883,81 @@ static void rkisp1_stream_stop(struct rkisp1_capture *cap)
>   	}
>   }
>   
> +/*
> + * rkisp1_pipeline_stream_disable - disable nodes in the pipeline
> + *
> + * Call s_stream(false) in the reverse order from
> + * rkisp1_pipeline_stream_enable() and disable the DMA engine.
> + * Should be called before media_pipeline_stop()
> + */
> +static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
> +	__must_hold(&cap->rkisp1->stream_lock)
> +{
> +	struct rkisp1_device *rkisp1 = cap->rkisp1;
> +
> +	rkisp1_cap_stream_disable(cap);
> +
> +	/*
> +	 * If the other capture is streaming, isp and sensor nodes shouldn't
> +	 * be disabled, skip them.
> +	 */
> +	if (rkisp1->pipe.streaming_count < 2) {
> +		v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
> +				 false);
> +		v4l2_subdev_call(&rkisp1->isp.sd, video, s_stream, false);
> +	}
> +
> +	v4l2_subdev_call(&rkisp1->resizer_devs[cap->id].sd, video, s_stream,
> +			 false);

I wonder if the order of the disable matters. If it should be from the sensor up to the
capture then we should call 'rkisp1_cap_stream_disable' at the end of this
function.

> +}
> +
> +/*
> + * rkisp1_pipeline_stream_enable - enable nodes in the pipeline
> + *
> + * Enable the DMA Engine and call s_stream(true) through the pipeline.
> + * Should be called after media_pipeline_start()
> + */
> +static int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap)
> +	__must_hold(&cap->rkisp1->stream_lock)
> +{
> +	struct rkisp1_device *rkisp1 = cap->rkisp1;
> +	int ret;
> +
> +	rkisp1_cap_stream_enable(cap);
> +
> +	ret = v4l2_subdev_call(&rkisp1->resizer_devs[cap->id].sd, video,
> +			       s_stream, true);
> +	if (ret)
> +		return ret;

In case of error here, shouldn't we call 'rkisp1_cap_stream_disable'?

> +
> +	/*
> +	 * If the other capture is streaming, isp and sensor nodes are already
> +	 * enabled, skip them.
> +	 */
> +	if (rkisp1->pipe.streaming_count > 1)
> +		return 0;
> +
> +	ret = v4l2_subdev_call(&rkisp1->isp.sd, video, s_stream, true);
> +	if (ret)
> +		goto err_disable_rsz;
> +
> +	ret = v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
> +			       true);
> +	if (ret)
> +		goto err_disable_isp;
> +
> +	return 0;
> +
> +err_disable_isp:
> +	v4l2_subdev_call(&rkisp1->isp.sd, video, s_stream, false);
> +err_disable_rsz:
> +	v4l2_subdev_call(&rkisp1->resizer_devs[cap->id].sd, video, s_stream,
> +			 false);
> +	rkisp1_cap_stream_disable(cap);
> +
> +	return ret;
> +}
> +
>   static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
>   {
>   	struct rkisp1_capture *cap = queue->drv_priv;
> @@ -920,13 +967,8 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
>   
>   	mutex_lock(&cap->rkisp1->stream_lock);
>   
> -	rkisp1_stream_stop(cap);
> +	rkisp1_pipeline_stream_disable(cap);
>   	media_pipeline_stop(&node->vdev.entity);
> -	ret = rkisp1_pipeline_sink_walk(&node->vdev.entity, NULL,
> -					rkisp1_pipeline_disable_cb);
> -	if (ret)
> -		dev_err(rkisp1->dev,
> -			"pipeline stream-off failed error:%d\n", ret);
>   
>   	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_ERROR);
>   
> @@ -940,43 +982,6 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
>   	mutex_unlock(&cap->rkisp1->stream_lock);
>   }
>   
> -/*
> - * Most of registers inside rockchip ISP1 have shadow register since
> - * they must be not be changed during processing a frame.
> - * Usually, each sub-module updates its shadow register after
> - * processing the last pixel of a frame.
> - */
> -static void rkisp1_stream_start(struct rkisp1_capture *cap)
> -{
> -	struct rkisp1_device *rkisp1 = cap->rkisp1;
> -	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
> -
> -	cap->ops->set_data_path(cap);
> -	cap->ops->config(cap);
> -
> -	/* Setup a buffer for the next frame */
> -	spin_lock_irq(&cap->buf.lock);
> -	rkisp1_set_next_buf(cap);
> -	cap->ops->enable(cap);
> -	/* It's safe to config ACTIVE and SHADOW regs for the
> -	 * first stream. While when the second is starting, do NOT
> -	 * force update because it also update the first one.
> -	 *
> -	 * The latter case would drop one more buf(that is 2) since
> -	 * there's not buf in shadow when the second FE received. This's
> -	 * also required because the second FE maybe corrupt especially
> -	 * when run at 120fps.
> -	 */
> -	if (!other->is_streaming) {
> -		/* force cfg update */
> -		rkisp1_write(rkisp1,
> -			     RKISP1_CIF_MI_INIT_SOFT_UPD, RKISP1_CIF_MI_INIT);
> -		rkisp1_set_next_buf(cap);
> -	}
> -	spin_unlock_irq(&cap->buf.lock);
> -	cap->is_streaming = true;
> -}
> -
>   static int
>   rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>   {
> @@ -1001,28 +1006,22 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>   		goto err_pipe_pm_put;
>   	}
>  

The previous code with the 'rkisp1_pipeline_sink_walk' only followed enabled links.
We should probably first check if the link between the resizer and the isp is enabled
and also between the isp to the sensor. and return -EPIPE if not.
Actually I think that the code that set the 'active_sensor' (callingrkisp1_get_remote_sensor)
should move to here since this also check if the link to the sensor is enabled.

Thanks,
Dafna

> -	rkisp1_stream_start(cap);
> -
> -	/* start sub-devices */
> -	ret = rkisp1_pipeline_sink_walk(entity, NULL,
> -					rkisp1_pipeline_enable_cb);
> -	if (ret)
> -		goto err_stop_stream;
> -
>   	ret = media_pipeline_start(entity, &cap->rkisp1->pipe);
>   	if (ret) {
>   		dev_err(cap->rkisp1->dev, "start pipeline failed %d\n", ret);
> -		goto err_pipe_disable;
> +		goto err_v4l2_pm_put;
>   	}
> +	ret = rkisp1_pipeline_stream_enable(cap);
> +	if (ret)
> +		goto err_media_pipeline_stop;
>   
>   	mutex_unlock(&cap->rkisp1->stream_lock);
>   
>   	return 0;
>   
> -err_pipe_disable:
> -	rkisp1_pipeline_sink_walk(entity, NULL, rkisp1_pipeline_disable_cb);
> -err_stop_stream:
> -	rkisp1_stream_stop(cap);
> +err_media_pipeline_stop:
> +	media_pipeline_stop(entity);
> +err_v4l2_pm_put:
>   	v4l2_pipeline_pm_put(entity);
>   err_pipe_pm_put:
>   	pm_runtime_put(cap->rkisp1->dev);
> 
