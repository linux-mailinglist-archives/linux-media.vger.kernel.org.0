Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B784505F1
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 14:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236285AbhKONvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 08:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236278AbhKONsj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 08:48:39 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2D7C06120D;
        Mon, 15 Nov 2021 05:45:18 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mcIEmFNIQfwDFmcIHmOgeQ; Mon, 15 Nov 2021 14:45:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636983915; bh=xB4InG8RQVfgvoIurRUrfhGT3GSTHqe0HiUDn43xMOw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OwudHd4VQbXNFgbYNd4a9oyLqZC/R74FiHfXz69aaqvtBEdZS4eGadGleWyeYNAmQ
         OFOy/jxS/FvZpCXjCR1l/lXEmR25OMBgV5NH6xv68GjPNbkrqESS6t0mt5uLs//ICO
         xws0CCvSiIkmpcULnUKIJgmWIDp76qlILqQtZrKDwQfyWybrqb8u7C+ExnwIv7l874
         RIVYyZifXO1qQf6+FSOzAYP+TkmL8sAhfOjDt5NCDBMhgPVRFe3lPO5yjqfURV4HOC
         o+pLM7tmm1oRUm/bsQADpZ/V+0VRWktl3oDJQdP2KwJ05/yot37CPEGeYELmCWUGwI
         B4kvfV1hXYfJA==
Subject: Re: [PATCH 2/3] media: mtk-vcodec: enc: use "stream_started" flag for
 "stop/start_streaming"
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, acourbot@chromium.org,
        andrew-ct.chen@mediatek.com, courbot@chromium.org,
        dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
        hsinyi@chromium.org, irui.wang@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        maoguang.meng@mediatek.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, minghsiu.tsai@mediatek.com, tfiga@chromium.org,
        tiffany.lin@mediatek.com
References: <20211022150410.29335-1-dafna.hirschfeld@collabora.com>
 <20211022150410.29335-3-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f48509bb-c945-1b0d-a429-f1a403a969b1@xs4all.nl>
Date:   Mon, 15 Nov 2021 14:45:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022150410.29335-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC0gnmYn5FbDgkQfQ3M7chFEy/vkXLaVgTql5wfF2p0DyQOolStdRvqCCH7npkGVrmXHKkuYvfpvWpz9XhBtWUaC/cNj6ZC+eGrC4oCZVC3wI1OowLZ2
 V3j60NMBYPxJE9XUKRYDCeBpMtKTkGdTCN92V+s/xCdZARXUVtrrzQAUsN0MSheh6sjffz6q8jvAdldBLK1zp9m4X2qwyWw7EzL3Ny99HLougpbHIgHuLnFB
 tNL57+4rinN0lOT2dTCjBFJUVNffSgLQgrr2YYSa960SMUefZdhNvKobz9h9Qb3iSqlgs7eCG5DJnfmKZhcoH9dxjpkw5ihbBtYsGycFA9b2Dg69VJ5gSLbG
 OwyjdlbLxnL3/L/dWENZXuf6wm3bbtYMc1qTDvP2VF2AmykTeVrC7I5PMctt2VSy8ueB7uNG9kvfCfiKkN3WVN3e7EVatJc6UBPa3eyhBBCjov/xXMjQYuc/
 11Dkz20X3Wt+Un9AUwtWe2+kCwnJVlWTzrUUgn7Ay0fkjOn4jgZ5grxLzT0jIQb054kfsfehBjz1y0l59GzgfGjMjgaMwUz6Drj08NUoXD3PNDagsqOhGPNq
 iAbbG/Vhzpkom7J++bfnTkM2EYJldietgcXUuNtLR7ky2Hlzc0QI3Z2TBkoZnrz2Kt0pp3RnelP2kEDsUQApAnDkaXEPrW99NOIzTCGqtj7r7J/Eqm4lMZVG
 Zt/Uboy3vyt+YamAbBamLELno1RbaKGfCeVIL7ESK6efTtpYAJAsA5twwa4+VL3z4rSSFwtI7p8vJJTvE8JSgf7GbZb0IdmOjh3wY+SEpmPpzqGtRvK/QVzc
 4IFbufVw2a48mECSCQE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 22/10/2021 17:04, Dafna Hirschfeld wrote:
> Currently the mtk-vcodec encoder init the hardware
> upon "start_streaming" cb when both queues are streaming and turns off
> the hardware upon "stop_streaming" when both queues stop
> streaming. This is wrong since the same queue might be started and
> then stopped causing the driver to turn off the hardware without
> turning it on. This cause for example unbalanced
> calls to pm_runtime_*

I don't think this is the right fix. I think the real problem is that
vb2ops_venc_start_streaming() calls vb2_start_streaming_called() to
check that the other queue is also ready to start streaming, whereas
vb2ops_venc_stop_streaming() incorrectly calls vb2_is_streaming()
instead of vb2_start_streaming_called().

So my guess is that this mismatch is what causes the problem. Regardless,
it is definitely a bug that vb2ops_venc_stop_streaming() calls vb2_is_streaming().

I'm marking this patch as 'Changes Requested', but I'll accept the other two of
this series.

Regards,

	Hans

> 
> Fixes: 4e855a6efa547 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h | 4 ++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 8 ++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 9d36e3d27369..84c5289f872b 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -259,6 +259,9 @@ struct vdec_pic_info {
>   * @decoded_frame_cnt: number of decoded frames
>   * @lock: protect variables accessed by V4L2 threads and worker thread such as
>   *	  mtk_video_dec_buf.
> + * @stream_started: this flag is turned on when both queues (cap and out) starts streaming
> + *	  and it is turned off once both queues stop streaming. It is used for a correct
> + *	  setup and set-down of the hardware when starting and stopping streaming.
>   */
>  struct mtk_vcodec_ctx {
>  	enum mtk_instance_type type;
> @@ -301,6 +304,7 @@ struct mtk_vcodec_ctx {
>  
>  	int decoded_frame_cnt;
>  	struct mutex lock;
> +	bool stream_started;
>  
>  };
>  
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 87a5114bf680..fb3cf804c96a 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -890,6 +890,9 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>  		goto err_start_stream;
>  	}
>  
> +	if (ctx->stream_started)
> +		return 0;
> +
>  	/* Do the initialization when both start_streaming have been called */
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>  		if (!vb2_start_streaming_called(&ctx->m2m_ctx->cap_q_ctx.q))
> @@ -928,6 +931,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>  		ctx->state = MTK_STATE_HEADER;
>  	}
>  
> +	ctx->stream_started = true;
>  	return 0;
>  
>  err_set_param:
> @@ -1002,6 +1006,9 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>  		}
>  	}
>  
> +	if (!ctx->stream_started)
> +		return;
> +
>  	if ((q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>  	     vb2_is_streaming(&ctx->m2m_ctx->out_q_ctx.q)) ||
>  	    (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
> @@ -1023,6 +1030,7 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>  		mtk_v4l2_err("pm_runtime_put fail %d", ret);
>  
>  	ctx->state = MTK_STATE_FREE;
> +	ctx->stream_started = false;
>  }
>  
>  static int vb2ops_venc_buf_out_validate(struct vb2_buffer *vb)
> 

