Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4407824791C
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 23:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728751AbgHQVs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 17:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbgHQVs5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 17:48:57 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE57C061389
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 14:48:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 1B31D29861F
Subject: Re: [PATCH v2 13/14] media: staging: rkisp1: call
 media_pipeline_start/stop from stats and params
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
 <20200815103734.31153-14-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <6609ec76-6c12-bd8b-517e-bc6ae96690b2@collabora.com>
Date:   Mon, 17 Aug 2020 18:48:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815103734.31153-14-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 8/15/20 7:37 AM, Dafna Hirschfeld wrote:
> The stats and params video nodes register a media entity
> and therefore they need to call media_pipeline_start/stop.

I'm not sure this is really required, iirc, these functions
basically locks the topology, which would cause EBUSY errors
when trying to modify the topology.
I can be wrong, but I don't think params
and stats requires locking the topology configuration.

Regards,
Helen

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 9 +++++++++
>  drivers/staging/media/rkisp1/rkisp1-stats.c  | 9 +++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index cc242ad5106e..7d5c21fa630e 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1488,14 +1488,23 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>  
>  	list_for_each_entry(buf, &tmp_list, queue)
>  		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +
> +	media_pipeline_stop(&params->vnode.vdev.entity);
>  }
>  
>  static int
>  rkisp1_params_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>  {
>  	struct rkisp1_params *params = queue->drv_priv;
> +	struct media_entity *entity = &params->vnode.vdev.entity;
>  	unsigned long flags;
> +	int ret;
>  
> +	ret = media_pipeline_start(entity, &params->rkisp1->pipe);
> +	if (ret) {
> +		dev_err(params->rkisp1->dev, "params: start pipeline failed %d\n", ret);
> +		return ret;
> +	}
>  	spin_lock_irqsave(&params->config_lock, flags);
>  	params->is_streaming = true;
>  	spin_unlock_irqrestore(&params->config_lock, flags);
> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> index c86beba709db..b314fb6a4562 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> @@ -150,12 +150,21 @@ static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
>  		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>  	}
>  	spin_unlock_irq(&stats->lock);
> +	media_pipeline_stop(&stats->vnode.vdev.entity);
>  }
>  
>  static int
>  rkisp1_stats_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>  {
>  	struct rkisp1_stats *stats = queue->drv_priv;
> +	struct media_entity *entity = &stats->vnode.vdev.entity;
> +	int ret;
> +
> +	ret = media_pipeline_start(entity, &stats->rkisp1->pipe);
> +	if (ret) {
> +		dev_err(stats->rkisp1->dev, "stats: start pipeline failed %d\n", ret);
> +		return ret;
> +	}
>  
>  	spin_lock_irq(&stats->lock);
>  	stats->is_streaming = true;
> 
