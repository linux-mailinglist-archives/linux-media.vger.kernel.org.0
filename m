Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4662128E7DE
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 22:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730409AbgJNU2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 16:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729022AbgJNU2G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 16:28:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F23C061755
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 13:28:06 -0700 (PDT)
Received: from [IPv6:2804:14c:483:7f66::1004] (unknown [IPv6:2804:14c:483:7f66::1004])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8745A1F4582F;
        Wed, 14 Oct 2020 21:27:51 +0100 (BST)
Subject: Re: [PATCH 3/6] media: staging: rkisp1: initialize buffer lists only
 on probe
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201002184222.7094-1-dafna.hirschfeld@collabora.com>
 <20201002184222.7094-4-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <77970c1e-c723-6115-6d61-e19cc8afe42d@collabora.com>
Date:   Wed, 14 Oct 2020 17:27:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201002184222.7094-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/2/20 3:42 PM, Dafna Hirschfeld wrote:
> The buffer lists of stats and params entities
> are initialized in queue_setup callback with
> 'INIT_LIST_HEAD'. It is enough to initialize
> the lists only upon registration.
> For the stats entity the list is already
> initialize upon registration.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 4 +---
>  drivers/staging/media/rkisp1/rkisp1-stats.c  | 4 ----
>  2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index cb9f3332a9a0..aa758f8c2264 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1420,8 +1420,6 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
>  					 unsigned int sizes[],
>  					 struct device *alloc_devs[])
>  {
> -	struct rkisp1_params *params = vq->drv_priv;
> -
>  	*num_buffers = clamp_t(u32, *num_buffers,
>  			       RKISP1_ISP_PARAMS_REQ_BUFS_MIN,
>  			       RKISP1_ISP_PARAMS_REQ_BUFS_MAX);
> @@ -1430,7 +1428,6 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
>  
>  	sizes[0] = sizeof(struct rkisp1_params_cfg);
>  
> -	INIT_LIST_HEAD(&params->params);
>  	return 0;
>  }
>  
> @@ -1545,6 +1542,7 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  
>  	params->rkisp1 = rkisp1;
>  	mutex_init(&node->vlock);
> +	INIT_LIST_HEAD(&params->params);
>  	spin_lock_init(&params->config_lock);
>  
>  	strscpy(vdev->name, RKISP1_PARAMS_DEV_NAME, sizeof(vdev->name));
> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> index 51c64f75fe29..c58ae52b8a98 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> @@ -94,8 +94,6 @@ static int rkisp1_stats_vb2_queue_setup(struct vb2_queue *vq,
>  					unsigned int sizes[],
>  					struct device *alloc_devs[])
>  {
> -	struct rkisp1_stats *stats = vq->drv_priv;
> -
>  	*num_planes = 1;
>  
>  	*num_buffers = clamp_t(u32, *num_buffers, RKISP1_ISP_STATS_REQ_BUFS_MIN,
> @@ -103,8 +101,6 @@ static int rkisp1_stats_vb2_queue_setup(struct vb2_queue *vq,
>  
>  	sizes[0] = sizeof(struct rkisp1_stat_buffer);
>  
> -	INIT_LIST_HEAD(&stats->stat);
> -
>  	return 0;
>  }
>  
> 
