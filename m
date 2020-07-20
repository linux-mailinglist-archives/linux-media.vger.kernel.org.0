Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64186226EFE
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 21:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgGTT0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 15:26:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59438 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729092AbgGTT0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 15:26:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id A100F28DE7B
Subject: Re: [PATCH v2 6/9] media: staging: rkisp1: unify (un)register
 functions to have the same parameters
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200718145918.17752-1-dafna.hirschfeld@collabora.com>
 <20200718145918.17752-7-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <a470661a-3ec7-67af-e191-7b2f21fa9eb8@collabora.com>
Date:   Mon, 20 Jul 2020 16:26:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200718145918.17752-7-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/18/20 11:59 AM, Dafna Hirschfeld wrote:
> The different register/unregister functions receive
> different parameters. This patch unify them so they all receive just
> 'struct *rkisp1_device' as parameter.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h | 15 +++++----------
>  drivers/staging/media/rkisp1/rkisp1-dev.c    | 15 +++++++--------
>  drivers/staging/media/rkisp1/rkisp1-isp.c    |  5 ++---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 10 +++++-----
>  drivers/staging/media/rkisp1/rkisp1-stats.c  | 10 +++++-----
>  5 files changed, 24 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 893caa9df891..fe1a775de768 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -304,8 +304,7 @@ void rkisp1_sd_adjust_crop_rect(struct v4l2_rect *crop,
>  void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
>  			   const struct v4l2_mbus_framefmt *bounds);
>  
> -int rkisp1_isp_register(struct rkisp1_device *rkisp1,
> -			struct v4l2_device *v4l2_dev);
> +int rkisp1_isp_register(struct rkisp1_device *rkisp1);
>  void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
>  
>  const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
> @@ -322,19 +321,15 @@ void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1);
>  int rkisp1_resizer_devs_register(struct rkisp1_device *rkisp1);
>  void rkisp1_resizer_devs_unregister(struct rkisp1_device *rkisp1);
>  
> -int rkisp1_stats_register(struct rkisp1_stats *stats,
> -			  struct v4l2_device *v4l2_dev,
> -			  struct rkisp1_device *rkisp1);
> -void rkisp1_stats_unregister(struct rkisp1_stats *stats);
> +int rkisp1_stats_register(struct rkisp1_device *rkisp1);
> +void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
>  
>  void rkisp1_params_configure(struct rkisp1_params *params,
>  			     enum rkisp1_fmt_raw_pat_type bayer_pat,
>  			     enum v4l2_quantization quantization);
>  void rkisp1_params_disable(struct rkisp1_params *params);
> -int rkisp1_params_register(struct rkisp1_params *params,
> -			   struct v4l2_device *v4l2_dev,
> -			   struct rkisp1_device *rkisp1);
> -void rkisp1_params_unregister(struct rkisp1_params *params);
> +int rkisp1_params_register(struct rkisp1_device *rkisp1);
> +void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
>  
>  void rkisp1_params_isr_handler(struct rkisp1_device *rkisp1, u32 isp_mis);
>  
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index a0eb8f08708b..d85ac10e5494 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -345,7 +345,7 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
>  {
>  	int ret;
>  
> -	ret = rkisp1_isp_register(rkisp1, &rkisp1->v4l2_dev);
> +	ret = rkisp1_isp_register(rkisp1);
>  	if (ret)
>  		return ret;
>  
> @@ -357,12 +357,11 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
>  	if (ret)
>  		goto err_unreg_resizer_devs;
>  
> -	ret = rkisp1_stats_register(&rkisp1->stats, &rkisp1->v4l2_dev, rkisp1);
> +	ret = rkisp1_stats_register(rkisp1);
>  	if (ret)
>  		goto err_unreg_capture_devs;
>  
> -	ret = rkisp1_params_register(&rkisp1->params,
> -				     &rkisp1->v4l2_dev, rkisp1);
> +	ret = rkisp1_params_register(rkisp1);
>  	if (ret)
>  		goto err_unreg_stats;
>  
> @@ -375,9 +374,9 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
>  
>  	return 0;
>  err_unreg_params:
> -	rkisp1_params_unregister(&rkisp1->params);
> +	rkisp1_params_unregister(rkisp1);
>  err_unreg_stats:
> -	rkisp1_stats_unregister(&rkisp1->stats);
> +	rkisp1_stats_unregister(rkisp1);
>  err_unreg_capture_devs:
>  	rkisp1_capture_devs_unregister(rkisp1);
>  err_unreg_resizer_devs:
> @@ -551,8 +550,8 @@ static int rkisp1_remove(struct platform_device *pdev)
>  	v4l2_async_notifier_unregister(&rkisp1->notifier);
>  	v4l2_async_notifier_cleanup(&rkisp1->notifier);
>  
> -	rkisp1_params_unregister(&rkisp1->params);
> -	rkisp1_stats_unregister(&rkisp1->stats);
> +	rkisp1_params_unregister(rkisp1);
> +	rkisp1_stats_unregister(rkisp1);
>  	rkisp1_capture_devs_unregister(rkisp1);
>  	rkisp1_resizer_devs_unregister(rkisp1);
>  	rkisp1_isp_unregister(rkisp1);
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index b2131aea5488..d7e533bb6f1d 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -986,8 +986,7 @@ static const struct v4l2_subdev_ops rkisp1_isp_ops = {
>  	.pad = &rkisp1_isp_pad_ops,
>  };
>  
> -int rkisp1_isp_register(struct rkisp1_device *rkisp1,
> -			struct v4l2_device *v4l2_dev)
> +int rkisp1_isp_register(struct rkisp1_device *rkisp1)
>  {
>  	struct rkisp1_isp *isp = &rkisp1->isp;
>  	struct media_pad *pads = isp->pads;
> @@ -1016,7 +1015,7 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
>  	if (ret)
>  		return ret;
>  
> -	ret = v4l2_device_register_subdev(v4l2_dev, sd);
> +	ret = v4l2_device_register_subdev(&rkisp1->v4l2_dev, sd);
>  	if (ret) {
>  		dev_err(rkisp1->dev, "Failed to register isp subdev\n");
>  		goto err_cleanup_media_entity;
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 2ab25062cde6..c3c0ab5a5713 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1570,10 +1570,9 @@ static void rkisp1_init_params(struct rkisp1_params *params)
>  		sizeof(struct rkisp1_params_cfg);
>  }
>  
> -int rkisp1_params_register(struct rkisp1_params *params,
> -			   struct v4l2_device *v4l2_dev,
> -			   struct rkisp1_device *rkisp1)
> +int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  {
> +	struct rkisp1_params *params = &rkisp1->params;
>  	struct rkisp1_vdev_node *node = &params->vnode;
>  	struct video_device *vdev = &node->vdev;
>  	int ret;
> @@ -1593,7 +1592,7 @@ int rkisp1_params_register(struct rkisp1_params *params,
>  	 * to protect all fops and v4l2 ioctls.
>  	 */
>  	vdev->lock = &node->vlock;
> -	vdev->v4l2_dev = v4l2_dev;
> +	vdev->v4l2_dev = &rkisp1->v4l2_dev;
>  	vdev->queue = &node->buf_queue;
>  	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
>  	vdev->vfl_dir = VFL_DIR_TX;
> @@ -1619,8 +1618,9 @@ int rkisp1_params_register(struct rkisp1_params *params,
>  	return ret;
>  }
>  
> -void rkisp1_params_unregister(struct rkisp1_params *params)
> +void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
>  {
> +	struct rkisp1_params *params = &rkisp1->params;
>  	struct rkisp1_vdev_node *node = &params->vnode;
>  	struct video_device *vdev = &node->vdev;
>  
> diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
> index a67c233b8641..f5dbd134ee24 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-stats.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
> @@ -375,10 +375,9 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
>  		sizeof(struct rkisp1_stat_buffer);
>  }
>  
> -int rkisp1_stats_register(struct rkisp1_stats *stats,
> -			  struct v4l2_device *v4l2_dev,
> -			  struct rkisp1_device *rkisp1)
> +int rkisp1_stats_register(struct rkisp1_device *rkisp1)
>  {
> +	struct rkisp1_stats *stats = &rkisp1->stats;
>  	struct rkisp1_vdev_node *node = &stats->vnode;
>  	struct video_device *vdev = &node->vdev;
>  	int ret;
> @@ -395,7 +394,7 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
>  	vdev->fops = &rkisp1_stats_fops;
>  	vdev->release = video_device_release_empty;
>  	vdev->lock = &node->vlock;
> -	vdev->v4l2_dev = v4l2_dev;
> +	vdev->v4l2_dev = &rkisp1->v4l2_dev;
>  	vdev->queue = &node->buf_queue;
>  	vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
>  	vdev->vfl_dir =  VFL_DIR_RX;
> @@ -425,8 +424,9 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
>  	return ret;
>  }
>  
> -void rkisp1_stats_unregister(struct rkisp1_stats *stats)
> +void rkisp1_stats_unregister(struct rkisp1_device *rkisp1)
>  {
> +	struct rkisp1_stats *stats = &rkisp1->stats;
>  	struct rkisp1_vdev_node *node = &stats->vnode;
>  	struct video_device *vdev = &node->vdev;
>  
> 
