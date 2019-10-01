Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F84AC3EEA
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 19:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729908AbfJARqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 13:46:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44066 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbfJARqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 13:46:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 7E4E428ED70
Subject: Re: [PATCH] media: vimc: embed the pads of entities in the entities'
 structs
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
References: <20191001170734.26813-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <58709614-22b5-762d-cc41-df0593070372@collabora.com>
Date:   Tue, 1 Oct 2019 14:46:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191001170734.26813-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for your patch, just some comments below.

On 10/1/19 2:07 PM, Dafna Hirschfeld wrote:
> since the pads array is of known small size, there is no reason to
> allocate it separately. Instead, it is embedded in the entity struct.
> This also conforms to the media controller doc:
> 'Most drivers will embed the pads array in a driver-specific structure,
> avoiding dynamic allocation.'

Just as a background information, It was allocated separately because the
initial idea was to be able to create multiple pads according to some
configuration. But this changed and your way is better.

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> This patch is rebased on top of the patchset
> 'media: vimc: bug fixes related to memory management' sent
> by me which is in turn rebased on top of v5 of the patchset
> 'media: vimc: Collapse component structure into a single
> monolithic driver' sent by 'Shuah Khan'
> 
>  drivers/media/platform/vimc/vimc-capture.c | 15 +++-------
>  drivers/media/platform/vimc/vimc-common.c  | 13 ++-------
>  drivers/media/platform/vimc/vimc-common.h  | 33 ++++------------------
>  drivers/media/platform/vimc/vimc-debayer.c |  9 ++++--
>  drivers/media/platform/vimc/vimc-scaler.c  |  8 ++++--
>  drivers/media/platform/vimc/vimc-sensor.c  |  6 ++--
>  6 files changed, 26 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 5f353c20e605..c3488b5b738f 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -30,6 +30,7 @@ struct vimc_cap_device {
>  	struct mutex lock;
>  	u32 sequence;
>  	struct vimc_stream stream;
> +	struct media_pad pad[0];

You are declaring an array of size zero, I believe you meant struct media_pad pad[1], no?
In any case, why declare an array? You could just use struct media_pad pad.

>  };
>  
>  static const struct v4l2_pix_format fmt_default = {
> @@ -331,7 +332,6 @@ static void vimc_cap_release(struct video_device *vdev)
>  		container_of(vdev, struct vimc_cap_device, vdev);
>  
>  	media_entity_cleanup(vcap->ved.ent);
> -	vimc_pads_cleanup(vcap->ved.pads);
>  	kfree(vcap);
>  }
>  
> @@ -398,21 +398,14 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  	if (!vcap)
>  		return NULL;
>  
> -	/* Allocate the pads */
> -	vcap->ved.pads =
> -		vimc_pads_init(1, (const unsigned long[1]) {MEDIA_PAD_FL_SINK});
> -	if (IS_ERR(vcap->ved.pads)) {
> -		ret = PTR_ERR(vcap->ved.pads);
> -		goto err_free_vcap;
> -	}
> -
>  	/* Initialize the media entity */
>  	vcap->vdev.entity.name = vcfg_name;
>  	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
> +	vcap->pad[0].flags = MEDIA_PAD_FL_SINK;
>  	ret = media_entity_pads_init(&vcap->vdev.entity,
> -				     1, vcap->ved.pads);
> +				     1, vcap->pad);
>  	if (ret)
> -		goto err_clean_pads;
> +		goto err_free_vcap;
>  
>  	/* Initialize the lock */
>  	mutex_init(&vcap->lock);
> @@ -481,8 +474,6 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  	vb2_queue_release(q);
>  err_clean_m_ent:
>  	media_entity_cleanup(&vcap->vdev.entity);
> -err_clean_pads:
> -	vimc_pads_cleanup(vcap->ved.pads);
>  err_free_vcap:
>  	kfree(vcap);
>  
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index 999bc353fb10..8eb8c7df36f5 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -369,17 +369,12 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>  			 const char *const name,
>  			 u32 function,
>  			 u16 num_pads,
> -			 const unsigned long *pads_flag,
> +			 struct media_pad *pads,
>  			 const struct v4l2_subdev_internal_ops *sd_int_ops,
>  			 const struct v4l2_subdev_ops *sd_ops)
>  {
>  	int ret;
>  
> -	/* Allocate the pads. Should be released from the sd_int_op release */
> -	ved->pads = vimc_pads_init(num_pads, pads_flag);
> -	if (IS_ERR(ved->pads))
> -		return PTR_ERR(ved->pads);
> -
>  	/* Fill the vimc_ent_device struct */
>  	ved->ent = &sd->entity;
>  
> @@ -398,9 +393,9 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>  		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
>  
>  	/* Initialize the media entity */
> -	ret = media_entity_pads_init(&sd->entity, num_pads, ved->pads);
> +	ret = media_entity_pads_init(&sd->entity, num_pads, pads);
>  	if (ret)
> -		goto err_clean_pads;
> +		return ret;
>  
>  	/* Register the subdev with the v4l2 and the media framework */
>  	ret = v4l2_device_register_subdev(v4l2_dev, sd);
> @@ -415,8 +410,6 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>  
>  err_clean_m_ent:
>  	media_entity_cleanup(&sd->entity);
> -err_clean_pads:
> -	vimc_pads_cleanup(ved->pads);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(vimc_ent_sd_register);
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 698db7c07645..4c76272acc25 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -90,10 +90,10 @@ struct vimc_pix_map {
>  };
>  
>  /**
> - * struct vimc_ent_device - core struct that represents a node in the topology
> + * struct vimc_ent_device - core struct that represents an entity in the
> + * topology
>   *
>   * @ent:		the pointer to struct media_entity for the node
> - * @pads:		the list of pads of the node
>   * @process_frame:	callback send a frame to that node
>   * @vdev_get_format:	callback that returns the current format a pad, used
>   *			only when is_media_entity_v4l2_video_device(ent) returns
> @@ -109,7 +109,6 @@ struct vimc_pix_map {
>   */
>  struct vimc_ent_device {
>  	struct media_entity *ent;
> -	struct media_pad *pads;
>  	void * (*process_frame)(struct vimc_ent_device *ved,
>  				const void *frame);
>  	void (*vdev_get_format)(struct vimc_ent_device *ved,
> @@ -169,29 +168,6 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>  				     const char *vcfg_name);
>  void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
>  
> -/**
> - * vimc_pads_init - initialize pads
> - *
> - * @num_pads:	number of pads to initialize
> - * @pads_flags:	flags to use in each pad
> - *
> - * Helper functions to allocate/initialize pads
> - */
> -struct media_pad *vimc_pads_init(u16 num_pads,
> -				 const unsigned long *pads_flag);
> -
> -/**
> - * vimc_pads_cleanup - free pads
> - *
> - * @pads: pointer to the pads
> - *
> - * Helper function to free the pads initialized with vimc_pads_init
> - */
> -static inline void vimc_pads_cleanup(struct media_pad *pads)
> -{
> -	kfree(pads);
> -}
> -
>  /**
>   * vimc_pipeline_s_stream - start stream through the pipeline
>   *
> @@ -234,7 +210,8 @@ const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
>   *		unique.
>   * @function:	media entity function defined by MEDIA_ENT_F_* macros
>   * @num_pads:	number of pads to initialize
> - * @pads_flag:	flags to use in each pad
> + * @pads:	the array of pads of the entity, the caller should set the
> +		flags of the pads
>   * @sd_int_ops:	pointer to &struct v4l2_subdev_internal_ops
>   * @sd_ops:	pointer to &struct v4l2_subdev_ops.
>   *
> @@ -247,7 +224,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>  			 const char *const name,
>  			 u32 function,
>  			 u16 num_pads,
> -			 const unsigned long *pads_flag,
> +			 struct media_pad *pads,
>  			 const struct v4l2_subdev_internal_ops *sd_int_ops,
>  			 const struct v4l2_subdev_ops *sd_ops);
>  
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index e1bad6713cde..570d9c4a3679 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -44,6 +44,7 @@ struct vimc_deb_device {
>  	u8 *src_frame;
>  	const struct vimc_deb_pix_map *sink_pix_map;
>  	unsigned int sink_bpp;
> +	struct media_pad pads[2];
>  };
>  
>  static const struct v4l2_mbus_framefmt sink_fmt_default = {
> @@ -478,7 +479,6 @@ static void vimc_deb_release(struct v4l2_subdev *sd)
>  				container_of(sd, struct vimc_deb_device, sd);
>  
>  	media_entity_cleanup(vdeb->ved.ent);
> -	vimc_pads_cleanup(vdeb->ved.pads);
>  	kfree(vdeb);
>  }
>  
> @@ -506,12 +506,15 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  	if (!vdeb)
>  		return NULL;
>  
> +
>  	/* Initialize ved and sd */
> +	vdeb->pads[0].flags = MEDIA_PAD_FL_SINK;
> +	vdeb->pads[1].flags = MEDIA_PAD_FL_SOURCE;
> +
>  	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
>  				   vcfg_name,
>  				   MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV, 2,
> -				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
> -				   MEDIA_PAD_FL_SOURCE},
> +				   vdeb->pads,
>  				   &vimc_deb_int_ops, &vimc_deb_ops);
>  	if (ret) {
>  		kfree(vdeb);
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index 1982bc089af5..363037ed5e22 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -30,6 +30,7 @@ struct vimc_sca_device {
>  	u8 *src_frame;
>  	unsigned int src_line_size;
>  	unsigned int bpp;
> +	struct media_pad pads[2];
>  };
>  
>  static const struct v4l2_mbus_framefmt sink_fmt_default = {
> @@ -337,7 +338,6 @@ static void vimc_sca_release(struct v4l2_subdev *sd)
>  				container_of(sd, struct vimc_sca_device, sd);
>  
>  	media_entity_cleanup(vsca->ved.ent);
> -	vimc_pads_cleanup(vsca->ved.pads);
>  	kfree(vsca);
>  }
>  
> @@ -366,11 +366,13 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>  		return NULL;
>  
>  	/* Initialize ved and sd */
> +	vsca->pads[0].flags = MEDIA_PAD_FL_SINK;
> +	vsca->pads[1].flags = MEDIA_PAD_FL_SOURCE;
> +
>  	ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
>  				   vcfg_name,
>  				   MEDIA_ENT_F_PROC_VIDEO_SCALER, 2,
> -				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
> -				   MEDIA_PAD_FL_SOURCE},
> +				   vsca->pads,
>  				   &vimc_sca_int_ops, &vimc_sca_ops);
>  	if (ret) {
>  		kfree(vsca);
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 63fe024ccea5..746b97279e04 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -24,6 +24,7 @@ struct vimc_sen_device {
>  	/* The active format */
>  	struct v4l2_mbus_framefmt mbus_format;
>  	struct v4l2_ctrl_handler hdl;
> +	struct media_pad pad[1];

Same thing here, it could be just struct media_pad pad, and you can use &pad when required.

Thanks
Helen

>  };
>  
>  static const struct v4l2_mbus_framefmt fmt_default = {
> @@ -292,7 +293,6 @@ static void vimc_sen_release(struct v4l2_subdev *sd)
>  	v4l2_ctrl_handler_free(&vsen->hdl);
>  	tpg_free(&vsen->tpg);
>  	media_entity_cleanup(vsen->ved.ent);
> -	vimc_pads_cleanup(vsen->ved.pads);
>  	kfree(vsen);
>  }
>  
> @@ -367,10 +367,10 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>  		goto err_free_hdl;
>  
>  	/* Initialize ved and sd */
> +	vsen->pad[0].flags = MEDIA_PAD_FL_SOURCE;
>  	ret = vimc_ent_sd_register(&vsen->ved, &vsen->sd, v4l2_dev,
>  				   vcfg_name,
> -				   MEDIA_ENT_F_CAM_SENSOR, 1,
> -				   (const unsigned long[1]) {MEDIA_PAD_FL_SOURCE},
> +				   MEDIA_ENT_F_CAM_SENSOR, 1, vsen->pad,
>  				   &vimc_sen_int_ops, &vimc_sen_ops);
>  	if (ret)
>  		goto err_free_tpg;
> 
