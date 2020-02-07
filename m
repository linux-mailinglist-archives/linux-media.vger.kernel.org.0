Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0381558D3
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 14:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgBGN4O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 08:56:14 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53590 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgBGN4O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Feb 2020 08:56:14 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 56DD9290D82
Subject: Re: [PATCH 4/4] media: staging: rkisp1: add serialization to the
 resizer subdev ops
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
References: <20200207085951.5226-1-dafna.hirschfeld@collabora.com>
 <20200207085951.5226-5-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <0bc0b4d9-9b68-4535-2a97-eaa99dc2d597@collabora.com>
Date:   Fri, 7 Feb 2020 10:56:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200207085951.5226-5-dafna.hirschfeld@collabora.com>
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
> This patch adds serialization to the resizer subdevice.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>


Acked-by: Helen Koike <helen.koike@collabora.com>

Sakari, if you could take a look at this too it would be great.

Dafna, could you also send a patch removing the item in the TODO list
regarding ioctls serialization?

Thanks,
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h  |  1 +
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 16 ++++++++++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 7c668ac4bdd5..18507f5b6f3c 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -226,6 +226,7 @@ struct rkisp1_resizer {
>  	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
>  	const struct rkisp1_rsz_config *config;
>  	enum rkisp1_fmt_pix_type fmt_type;
> +	struct mutex ops_lock;
>  };
>  
>  struct rkisp1_debug {
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index 9de6744f0900..87799fbf0363 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -562,7 +562,9 @@ static int rkisp1_rsz_get_fmt(struct v4l2_subdev *sd,
>  	struct rkisp1_resizer *rsz =
>  		container_of(sd, struct rkisp1_resizer, sd);
>  
> +	mutex_lock(&rsz->ops_lock);
>  	fmt->format = *rkisp1_rsz_get_pad_fmt(rsz, cfg, fmt->pad, fmt->which);
> +	mutex_unlock(&rsz->ops_lock);
>  	return 0;
>  }
>  
> @@ -573,11 +575,13 @@ static int rkisp1_rsz_set_fmt(struct v4l2_subdev *sd,
>  	struct rkisp1_resizer *rsz =
>  		container_of(sd, struct rkisp1_resizer, sd);
>  
> +	mutex_lock(&rsz->ops_lock);
>  	if (fmt->pad == RKISP1_RSZ_PAD_SINK)
>  		rkisp1_rsz_set_sink_fmt(rsz, cfg, &fmt->format, fmt->which);
>  	else
>  		rkisp1_rsz_set_src_fmt(rsz, cfg, &fmt->format, fmt->which);
>  
> +	mutex_unlock(&rsz->ops_lock);
>  	return 0;
>  }
>  
> @@ -588,10 +592,12 @@ static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
>  	struct rkisp1_resizer *rsz =
>  		container_of(sd, struct rkisp1_resizer, sd);
>  	struct v4l2_mbus_framefmt *mf_sink;
> +	int ret = 0;
>  
>  	if (sel->pad == RKISP1_RSZ_PAD_SRC)
>  		return -EINVAL;
>  
> +	mutex_lock(&rsz->ops_lock);
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
>  		mf_sink = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK,
> @@ -606,10 +612,11 @@ static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
>  						  sel->which);
>  		break;
>  	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
>  	}
>  
> -	return 0;
> +	mutex_unlock(&rsz->ops_lock);
> +	return ret;
>  }
>  
>  static int rkisp1_rsz_set_selection(struct v4l2_subdev *sd,
> @@ -625,7 +632,9 @@ static int rkisp1_rsz_set_selection(struct v4l2_subdev *sd,
>  	dev_dbg(sd->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
>  		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
>  
> +	mutex_lock(&rsz->ops_lock);
>  	rkisp1_rsz_set_sink_crop(rsz, cfg, &sel->r, sel->which);
> +	mutex_unlock(&rsz->ops_lock);
>  
>  	return 0;
>  }
> @@ -665,9 +674,11 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (other->is_streaming)
>  		when = RKISP1_SHADOW_REGS_ASYNC;
>  
> +	mutex_lock(&rsz->ops_lock);
>  	rkisp1_rsz_config(rsz, when);
>  	rkisp1_dcrop_config(rsz);
>  
> +	mutex_unlock(&rsz->ops_lock);
>  	return 0;
>  }
>  
> @@ -713,6 +724,7 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
>  
>  	rsz->fmt_type = RKISP1_DEF_FMT_TYPE;
>  
> +	mutex_init(&rsz->ops_lock);
>  	ret = media_entity_pads_init(&sd->entity, 2, pads);
>  	if (ret)
>  		return ret;
> 
