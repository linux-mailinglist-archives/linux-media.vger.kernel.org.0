Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0B2A1854
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 13:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfH2LXg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 07:23:36 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:57851 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726416AbfH2LXg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 07:23:36 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3IWXiRDXJDqPe3IWbiNius; Thu, 29 Aug 2019 13:23:33 +0200
Subject: Re: [PATCH 7/8] media: cedrus: Add support for holding capture buffer
To:     Jernej Skrabec <jernej.skrabec@siol.net>, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
 <20190822194500.2071-8-jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f105990c-e059-6bdd-433f-074388e3a2dc@xs4all.nl>
Date:   Thu, 29 Aug 2019 13:23:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822194500.2071-8-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEvKT+YAX69YOdWPyoQUh8SffH6qqUV6kZn+ESAP2YPgGYwvqviMJ64VZXwp1TtZ/ePLbU0022q51PrAyBsGo/nnPeQJp9Tng6TOHDFy/MyvejmD4sc3
 5odX7zb2VaFTSpoZdO3Ca/9I/6Hkl3qEkiZDTMRueAwwOcCbETnTqaOHl8zKt9F7zDxEPPO10o0PfJQ+Vfz/abxmnzC03UDuguQGOgacPIoGim6tMUIIwMxB
 A1oDxXQdNbhQzmt6U3A1ahSYmhRpYjCAv+BUr6CAbaTA6K3dx8E2pJeMPTLxflEq0FvzPgSHeTl9i86g1EZZfW5DPLqFi8lhcLvfUge4rU9all+OPl2G4wz7
 +gRj9Jf0ycYsk5j6PaebzSCFvXkZtHesfWUOF/r0ybt4qDPprDpguXjXurxOE0aW0SPuKOUM79iio94IWFRqadpH/YimyRR1KWGv7+34MB/Jnx5jSYcV8k20
 yEqRlVvXWdupr//PmhDXcE0DevUoBQI0W6/JFYWhnX5LKVbhSa/8axDc7+5u7gHmPY3W2LTfbm4dbUFuoHJOsXGULzaiDIsJ+F9OP7WiSq5+YmC9An+/jQII
 Xz7MUUZx2LWCmPVsNXNr1Y9WqICnjYPxC5zSpiLKFnCKj9yzFQcjl828QX4XzWWV42zmQLQXjMnvpovCtNWG9RDdeiwj0CSQDNNetVuN8GgOdjdt+izXFCEE
 oVnAVOLpvvW+PccO4sMh9NDhwTKmMVOI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/22/19 9:44 PM, Jernej Skrabec wrote:
> When frame contains multiple slices and driver works in slice mode, it's
> more efficient to hold capture buffer in queue until all slices of a
> same frame are decoded.
> 
> Add support for that to Cedrus driver by exposing and implementing
> V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_dec.c   | 9 +++++++++
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c    | 8 +++++---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 1 +
>  3 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index d7b54accfe83..68462b99750e 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -31,6 +31,14 @@ void cedrus_device_run(void *priv)
>  
>  	run.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  	run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	if (v4l2_m2m_release_capture_buf(run.src, run.dst)) {
> +		v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +		v4l2_m2m_buf_done(run.dst, VB2_BUF_STATE_DONE);
> +		run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	}
> +	run.dst->is_held = run.src->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> +
>  	run.first_slice =
>  		run.src->vb2_buf.timestamp != run.dst->vb2_buf.timestamp;
>  
> @@ -46,6 +54,7 @@ void cedrus_device_run(void *priv)
>  			V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
>  		run.mpeg2.quantization = cedrus_find_control_data(ctx,
>  			V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
> +		run.dst->is_held = false;
>  		break;
>  
>  	case V4L2_PIX_FMT_H264_SLICE:
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> index a942cd9bed57..99fedec80224 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -122,7 +122,7 @@ static irqreturn_t cedrus_irq(int irq, void *data)
>  	dev->dec_ops[ctx->current_codec]->irq_clear(ctx);
>  
>  	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>  
>  	if (!src_buf || !dst_buf) {
>  		v4l2_err(&dev->v4l2_dev,
> @@ -136,8 +136,10 @@ static irqreturn_t cedrus_irq(int irq, void *data)
>  		state = VB2_BUF_STATE_DONE;
>  
>  	v4l2_m2m_buf_done(src_buf, state);
> -	v4l2_m2m_buf_done(dst_buf, state);
> -
> +	if (!dst_buf->is_held) {
> +		v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +		v4l2_m2m_buf_done(dst_buf, state);
> +	}
>  	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
>  
>  	return IRQ_HANDLED;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index eeee3efd247b..5153b2bba21e 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -515,6 +515,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
>  	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>  	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>  	src_vq->drv_priv = ctx;
> +	src_vq->subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;

This isn't quite right: this flag should only be set for formats that support
slicing. So cedrus_s_fmt_vid_out() should set this for H264, but clear it for
MPEG2.

Looking at the cedrus code it seems that it does not set an initial default output
format after opening the video device. This seems wrong to me. If it did set a
default output format, then src_vq->subsystem_flags should set this flag corresponding
to the default output format.

>  	src_vq->buf_struct_size = sizeof(struct cedrus_buffer);
>  	src_vq->min_buffers_needed = 1;
>  	src_vq->ops = &cedrus_qops;
> 

Regards,

	Hans
