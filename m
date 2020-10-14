Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8699F28E7DF
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 22:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387427AbgJNU2H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 16:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729022AbgJNU2H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 16:28:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C393BC061755
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 13:28:06 -0700 (PDT)
Received: from [IPv6:2804:14c:483:7f66::1004] (unknown [IPv6:2804:14c:483:7f66::1004])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 018AD1F45830;
        Wed, 14 Oct 2020 21:27:52 +0100 (BST)
Subject: Re: [PATCH 4/6] media: staging: rkisp1: remove the 'is_streaming'
 field from stats and params
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201002184222.7094-1-dafna.hirschfeld@collabora.com>
 <20201002184222.7094-5-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <bcf1127a-a508-3b4e-0060-277eddef7400@collabora.com>
Date:   Wed, 14 Oct 2020 17:27:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201002184222.7094-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 10/2/20 3:42 PM, Dafna Hirschfeld wrote:
> The params and stats entities have a field 'is_streaming'.
> This field is not needed since the entities can have available
> buffers only if they stream and therefore it is enough to
> check if there are buffers available.
> As a result, their start_stream callbacks can be removed since
> they only set the 'is_streaming' field.

I would just clarify this a bit, since it is possible to have
is_streaming = true, but without any buffers queued, but
if we have any buffers queued, then we are sure is_streaming = true,
and this is what functions, executed after the testins this bool, check.

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h | 12 ++++-------
>  drivers/staging/media/rkisp1/rkisp1-params.c | 21 +-------------------
>  drivers/staging/media/rkisp1/rkisp1-stats.c  | 17 ----------------
>  3 files changed, 5 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 45abacdbb664..692333c66f9d 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -240,19 +240,17 @@ struct rkisp1_capture {
>   *
>   * @vnode:	  video node
>   * @rkisp1:	  pointer to the rkisp1 device
> - * @lock:	  locks the buffer list 'stat' and 'is_streaming'
> + * @lock:	  locks the buffer list 'stat'
>   * @stat:	  queue of rkisp1_buffer
>   * @vdev_fmt:	  v4l2_format of the metadata format
> - * @is_streaming: device is streaming
>   */
>  struct rkisp1_stats {
>  	struct rkisp1_vdev_node vnode;
>  	struct rkisp1_device *rkisp1;
>  
> -	spinlock_t lock; /* locks the buffers list 'stats' and 'is_streaming' */
> +	spinlock_t lock; /* locks the buffers list 'stats' */
>  	struct list_head stat;
>  	struct v4l2_format vdev_fmt;
> -	bool is_streaming;
>  };
>  
>  /*
> @@ -260,10 +258,9 @@ struct rkisp1_stats {
>   *
>   * @vnode:		video node
>   * @rkisp1:		pointer to the rkisp1 device
> - * @config_lock:	locks the buffer list 'params' and 'is_streaming'
> + * @config_lock:	locks the buffer list 'params'
>   * @params:		queue of rkisp1_buffer
>   * @vdev_fmt:		v4l2_format of the metadata format
> - * @is_streaming:	device is streaming
>   * @quantization:	the quantization configured on the isp's src pad
>   * @raw_type:		the bayer pattern on the isp video sink pad
>   */
> @@ -271,10 +268,9 @@ struct rkisp1_params {
>  	struct rkisp1_vdev_node vnode;
>  	struct rkisp1_device *rkisp1;
>  
> -	spinlock_t config_lock; /* locks the buffers list 'params' and 'is_streaming' */
> +	spinlock_t config_lock; /* locks the buffers list 'params' */
>  	struct list_head params;
>  	struct v4l2_format vdev_fmt;
> -	bool is_streaming;
>  
>  	enum v4l2_quantization quantization;
>  	enum rkisp1_fmt_raw_pat_type raw_type;
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index aa758f8c2264..3afbc24ca05e 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1224,10 +1224,6 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>  	struct rkisp1_params *params = &rkisp1->params;
>  
>  	spin_lock(&params->config_lock);
> -	if (!params->is_streaming) {
> -		spin_unlock(&params->config_lock);
> -		return;
> -	}
>  	rkisp1_params_apply_params_cfg(params, frame_sequence);
>  
>  	spin_unlock(&params->config_lock);
> @@ -1303,8 +1299,7 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
>  	spin_lock_irq(&params->config_lock);
>  
>  	/* apply the first buffer if there is one already */
> -	if (params->is_streaming)
> -		rkisp1_params_apply_params_cfg(params, 0);
> +	rkisp1_params_apply_params_cfg(params, 0);
>  
>  	spin_unlock_irq(&params->config_lock);
>  }
> @@ -1467,7 +1462,6 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>  	 * without holding the lock
>  	 */
>  	spin_lock_irq(&params->config_lock);
> -	params->is_streaming = false;
>  	list_splice_init(&params->params, &tmp_list);
>  	spin_unlock_irq(&params->config_lock);
>  
> @@ -1475,25 +1469,12 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>  		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>  }
>  
> -static int
> -rkisp1_params_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
> -{
> -	struct rkisp1_params *params = queue->drv_priv;
> -
> -	spin_lock_irq(&params->config_lock);
> -	params->is_streaming = true;
> -	spin_unlock_irq(&params->config_lock);
> -
> -	return 0;
> -}
> -
>  static struct vb2_ops rkisp1_params_vb2_ops = {
>  	.queue_setup = rkisp1_params_vb2_queue_setup,
>  	.wait_prepare = vb2_ops_wait_prepare,
>  	.wait_finish = vb2_ops_wait_finish,
>  	.buf_queue = rkisp1_params_vb2_buf_queue,
>  	.buf_prepare = rkisp1_params_vb2_buf_prepare,
> -	.start_streaming = rkisp1_params_vb2_start_streaming,
>  	.stop_streaming = rkisp1_params_vb2_stop_streaming,
>  
>  };
> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> index c58ae52b8a98..3ddab8fa8f2d 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> @@ -136,7 +136,6 @@ static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
>  	unsigned int i;
>  
>  	spin_lock_irq(&stats->lock);
> -	stats->is_streaming = false;
>  	for (i = 0; i < RKISP1_ISP_STATS_REQ_BUFS_MAX; i++) {
>  		if (list_empty(&stats->stat))
>  			break;
> @@ -148,18 +147,6 @@ static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
>  	spin_unlock_irq(&stats->lock);
>  }
>  
> -static int
> -rkisp1_stats_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
> -{
> -	struct rkisp1_stats *stats = queue->drv_priv;
> -
> -	spin_lock_irq(&stats->lock);
> -	stats->is_streaming = true;
> -	spin_unlock_irq(&stats->lock);
> -
> -	return 0;
> -}
> -
>  static const struct vb2_ops rkisp1_stats_vb2_ops = {
>  	.queue_setup = rkisp1_stats_vb2_queue_setup,
>  	.buf_queue = rkisp1_stats_vb2_buf_queue,
> @@ -167,7 +154,6 @@ static const struct vb2_ops rkisp1_stats_vb2_ops = {
>  	.wait_prepare = vb2_ops_wait_prepare,
>  	.wait_finish = vb2_ops_wait_finish,
>  	.stop_streaming = rkisp1_stats_vb2_stop_streaming,
> -	.start_streaming = rkisp1_stats_vb2_start_streaming,
>  };
>  
>  static int
> @@ -355,12 +341,9 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
>  	if (isp_mis_tmp & RKISP1_STATS_MEAS_MASK)
>  		rkisp1->debug.stats_error++;
>  
> -	if (!stats->is_streaming)
> -		goto unlock;
>  	if (isp_ris & RKISP1_STATS_MEAS_MASK)
>  		rkisp1_stats_send_measurement(stats, isp_ris);
>  
> -unlock:
>  	spin_unlock(&stats->lock);
>  }
>  
> 
