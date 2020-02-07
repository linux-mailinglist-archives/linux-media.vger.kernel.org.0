Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A66F1558D0
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 14:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgBGNzA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 08:55:00 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53576 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgBGNzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Feb 2020 08:55:00 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id C12092956E7
Subject: Re: [PATCH 3/4] media: staging: rkisp1: add serialization to the isp
 subdev ops
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
References: <20200207085951.5226-1-dafna.hirschfeld@collabora.com>
 <20200207085951.5226-4-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <88bba785-7dea-b8c9-b4a6-202e96e5a1a0@collabora.com>
Date:   Fri, 7 Feb 2020 10:54:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200207085951.5226-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/7/20 6:59 AM, Dafna Hirschfeld wrote:
> For subdevices drivers, the drivers themself are responsible
> for serializing their operations.
> This patch adds serialization to the isp subdevice.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Sakari, if you could take a look at this too it would be great.

Thanks,
Helen


> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h |  2 ++
>  drivers/staging/media/rkisp1/rkisp1-isp.c    | 29 ++++++++++++++------
>  2 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 4e773d611d1b..7c668ac4bdd5 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -96,6 +96,7 @@ struct rkisp1_sensor_async {
>   * @sink_crop: crop for sink pad
>   * @src_fmt: output format
>   * @src_crop: output size
> + * @ops_lock: ops serialization
>   *
>   * @is_dphy_errctrl_disabled : if dphy errctrl is disabled (avoid endless interrupt)
>   * @frame_sequence: used to synchronize frame_id between video devices.
> @@ -107,6 +108,7 @@ struct rkisp1_isp {
>  	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
>  	const struct rkisp1_isp_mbus_info *sink_fmt;
>  	const struct rkisp1_isp_mbus_info *src_fmt;
> +	struct mutex ops_lock;
>  	bool is_dphy_errctrl_disabled;
>  	atomic_t frame_sequence;
>  };
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index c98e3c16f520..aa7a842f97f8 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -791,7 +791,9 @@ static int rkisp1_isp_get_fmt(struct v4l2_subdev *sd,
>  {
>  	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
>  
> +	mutex_lock(&isp->ops_lock);
>  	fmt->format = *rkisp1_isp_get_pad_fmt(isp, cfg, fmt->pad, fmt->which);
> +	mutex_unlock(&isp->ops_lock);
>  	return 0;
>  }
>  
> @@ -801,6 +803,7 @@ static int rkisp1_isp_set_fmt(struct v4l2_subdev *sd,
>  {
>  	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
>  
> +	mutex_lock(&isp->ops_lock);
>  	if (fmt->pad == RKISP1_ISP_PAD_SINK_VIDEO)
>  		rkisp1_isp_set_sink_fmt(isp, cfg, &fmt->format, fmt->which);
>  	else if (fmt->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
> @@ -809,6 +812,7 @@ static int rkisp1_isp_set_fmt(struct v4l2_subdev *sd,
>  		fmt->format = *rkisp1_isp_get_pad_fmt(isp, cfg, fmt->pad,
>  						      fmt->which);
>  
> +	mutex_unlock(&isp->ops_lock);
>  	return 0;
>  }
>  
> @@ -817,11 +821,13 @@ static int rkisp1_isp_get_selection(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_selection *sel)
>  {
>  	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
> +	int ret = 0;
>  
>  	if (sel->pad != RKISP1_ISP_PAD_SOURCE_VIDEO &&
>  	    sel->pad != RKISP1_ISP_PAD_SINK_VIDEO)
>  		return -EINVAL;
>  
> +	mutex_lock(&isp->ops_lock);
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
>  		if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO) {
> @@ -844,10 +850,10 @@ static int rkisp1_isp_get_selection(struct v4l2_subdev *sd,
>  						  sel->which);
>  		break;
>  	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
>  	}
> -
> -	return 0;
> +	mutex_unlock(&isp->ops_lock);
> +	return ret;
>  }
>  
>  static int rkisp1_isp_set_selection(struct v4l2_subdev *sd,
> @@ -857,21 +863,23 @@ static int rkisp1_isp_set_selection(struct v4l2_subdev *sd,
>  	struct rkisp1_device *rkisp1 =
>  		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
>  	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
> +	int ret = 0;
>  
>  	if (sel->target != V4L2_SEL_TGT_CROP)
>  		return -EINVAL;
>  
>  	dev_dbg(rkisp1->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
>  		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
> -
> +	mutex_lock(&isp->ops_lock);
>  	if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO)
>  		rkisp1_isp_set_sink_crop(isp, cfg, &sel->r, sel->which);
>  	else if (sel->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
>  		rkisp1_isp_set_src_crop(isp, cfg, &sel->r, sel->which);
>  	else
> -		return -EINVAL;
> +		ret = -EINVAL;
>  
> -	return 0;
> +	mutex_unlock(&isp->ops_lock);
> +	return ret;
>  }
>  
>  static int rkisp1_subdev_link_validate(struct media_link *link)
> @@ -948,6 +956,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct rkisp1_device *rkisp1 =
>  		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
> +	struct rkisp1_isp *isp = &rkisp1->isp;
>  	struct v4l2_subdev *sensor_sd;
>  	int ret = 0;
>  
> @@ -967,16 +976,19 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
>  		return -EINVAL;
>  
>  	atomic_set(&rkisp1->isp.frame_sequence, -1);
> +	mutex_lock(&isp->ops_lock);
>  	ret = rkisp1_config_cif(rkisp1);
>  	if (ret)
> -		return ret;
> +		goto mutex_unlock;
>  
>  	ret = rkisp1_mipi_csi2_start(&rkisp1->isp, rkisp1->active_sensor);
>  	if (ret)
> -		return ret;
> +		goto mutex_unlock;
>  
>  	rkisp1_isp_start(rkisp1);
>  
> +mutex_unlock:
> +	mutex_unlock(&isp->ops_lock);
>  	return ret;
>  }
>  
> @@ -1036,6 +1048,7 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
>  	isp->sink_fmt = rkisp1_isp_mbus_info_get(RKISP1_DEF_SINK_PAD_FMT);
>  	isp->src_fmt = rkisp1_isp_mbus_info_get(RKISP1_DEF_SRC_PAD_FMT);
>  
> +	mutex_init(&isp->ops_lock);
>  	ret = media_entity_pads_init(&sd->entity, RKISP1_ISP_PAD_MAX, pads);
>  	if (ret)
>  		return ret;
> 
