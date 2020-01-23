Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1308F146C75
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 16:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgAWPRb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 10:17:31 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:54641 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726232AbgAWPRa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 10:17:30 -0500
Received: from [IPv6:2001:983:e9a7:1:1bd:458:b834:7f13]
 ([IPv6:2001:983:e9a7:1:1bd:458:b834:7f13])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ueEZiND8TpLtbueEaiRCnW; Thu, 23 Jan 2020 16:17:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579792648; bh=wHS5NDpC11TS7BHWFt8akwFdhos6ZauPg9PTWrp2C44=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iVESYGIg+SnHXF8JYfk9GVLUGjwOdcMSR6WGAf/vMJ4twSk06DKm1Nldf+x3MPhHx
         K3n2rE4RXjascdzN72INQws2hzIisWcLheeVPV4NoZXjNeO9wdA7HSdw2IZPFX7dnz
         d/VghSohQzQhKscHTVfuYBaSxaYLIYzidjdW1ROt+DWaMlG93vSPwI8Px9XT3RB51U
         V991S+0Ik8U7cmT9O/zPnAkb6B8jIHMYDBjQJ1f6Im4CoVYi9J2GhZe7cDS1qjbO9I
         ro+ajuL8iyT173od9x0FeLAZPMbmYiCtWP7b4Z5VkijL6+pkXq8gVU3JtjvXsaeRf1
         x90rf+6eJkLiA==
Subject: Re: [PATCH] media: Split v4l2_pipeline_pm_use into
 v4l2_pipeline_pm_{get, put}
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Todor Tomov <todor.too@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>
References: <20191125214745.15826-1-ezequiel@collabora.com>
 <8791114d471e2c57ce52b8fed29d179d546a4103.camel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d979d210-e042-7dfa-eb31-cfd7c65713e8@xs4all.nl>
Date:   Thu, 23 Jan 2020 16:17:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8791114d471e2c57ce52b8fed29d179d546a4103.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM/uJm9ugWt4wGSQF8Cw/qCPjxKisf8qRmyui/TQyJ9f8A00QMnJObh+xwv+FLMsprKxdl/7F1vwEowSFeoaB06ZBsBmi5pySf0dEIllS7pv9mQ+Gu5T
 th+xnbxWnLkMgiSDl7vKNSmSztktzTzIgShU5KibMHqxy0JsZOOjvtmoUhebq9wXs9fbE7vMyefE42dVkDwmKbuhfVDyzOTJuMYCiW0e/Cw1VgynDzVwTQJt
 f4B8ws6sgzDuF6IuMSgLfnLqvFqVo7/QHWfnZ8xwNRtZ6zlxDaXdQ6gZ2U9MQP5/xJAmjLyDXnGmSn0K/RB08nUhkeTukYMba7mPpeJdzj+KVJYdrhbPu9YR
 VNZdnAkPCFljsUhrUFrX3OSZCeRA/VcX4Cb6hIXrQ+eQgJTHVQjrv6R/MIyHPwbd7F7nIqapyp5VoWUQDlnm6rGcMkttpSF9symPxP+t0XvqKZXu7Oq0DWfk
 vRdE9n0/69a9kpd9Pok4CzEnNXAbz7asT2+nFw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/20/20 7:00 PM, Ezequiel Garcia wrote:
> Hi Hans,
> 
> On Tue, 2019-11-26 at 06:47 +0900, Ezequiel Garcia wrote:
>> Currently, v4l2_pipeline_pm_use() prototype is:
>>
>>   int v4l2_pipeline_pm_use(struct media_entity *entity, int use)
>>
>> Where the 'use' argument shall only be set to '1' for enable/power-on,
>> or to '0' for disable/power-off. The integer return is specified
>> as only meaningful when 'use' is set to '1'.
>>
>> Let's enforce this semantic by splitting the function in two:
>> v4l2_pipeline_pm_get and v4l2_pipeline_pm_put. This is done
>> for several reasons.
>>
>> It makes the API easier to use (or harder to misuse).
>> It removes the constraint on the values the 'use' argument
>> shall take. Also, it removes the need to constraint
>> the return value, by making v4l2_pipeline_pm_put void return.
>>
>> And last, it's more consistent with other kernel APIs, such
>> as the runtime pm APIs, which makes the code more symmetric.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> Any feedback on this? No hurries, just pinging in case
> it fell thru the cracks.

Yeah, it fell through the cracks. However, I see that I need a v2
anyway since the new rkisp1 driver also needs to be updated.

Regards,

	Hans

> 
> Thanks,
> Ezequiel
> 
>> ---
>>  Documentation/media/kapi/csi2.rst             |  2 +-
>>  drivers/media/platform/omap3isp/ispvideo.c    |  4 +-
>>  .../media/platform/qcom/camss/camss-video.c   |  4 +-
>>  drivers/media/platform/rcar-vin/rcar-v4l2.c   |  6 +--
>>  .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  6 +--
>>  .../platform/sunxi/sun6i-csi/sun6i_video.c    |  4 +-
>>  drivers/media/v4l2-core/v4l2-mc.c             | 18 +++++++--
>>  drivers/staging/media/imx/imx-media-capture.c |  4 +-
>>  drivers/staging/media/omap4iss/iss_video.c    |  4 +-
>>  include/media/v4l2-mc.h                       | 40 ++++++++++++-------
>>  10 files changed, 57 insertions(+), 35 deletions(-)
>>
>> diff --git a/Documentation/media/kapi/csi2.rst b/Documentation/media/kapi/csi2.rst
>> index 030a5c41ec75..e111ff7bfd3d 100644
>> --- a/Documentation/media/kapi/csi2.rst
>> +++ b/Documentation/media/kapi/csi2.rst
>> @@ -74,7 +74,7 @@ Before the receiver driver may enable the CSI-2 transmitter by using
>>  the :c:type:`v4l2_subdev_video_ops`->s_stream(), it must have powered
>>  the transmitter up by using the
>>  :c:type:`v4l2_subdev_core_ops`->s_power() callback. This may take
>> -place either indirectly by using :c:func:`v4l2_pipeline_pm_use` or
>> +place either indirectly by using :c:func:`v4l2_pipeline_pm_get` or
>>  directly.
>>  
>>  Formats
>> diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
>> index ee183c35ff3b..16efd18f1e88 100644
>> --- a/drivers/media/platform/omap3isp/ispvideo.c
>> +++ b/drivers/media/platform/omap3isp/ispvideo.c
>> @@ -1311,7 +1311,7 @@ static int isp_video_open(struct file *file)
>>  		goto done;
>>  	}
>>  
>> -	ret = v4l2_pipeline_pm_use(&video->video.entity, 1);
>> +	ret = v4l2_pipeline_pm_get(&video->video.entity);
>>  	if (ret < 0) {
>>  		omap3isp_put(video->isp);
>>  		goto done;
>> @@ -1363,7 +1363,7 @@ static int isp_video_release(struct file *file)
>>  	vb2_queue_release(&handle->queue);
>>  	mutex_unlock(&video->queue_lock);
>>  
>> -	v4l2_pipeline_pm_use(&video->video.entity, 0);
>> +	v4l2_pipeline_pm_put(&video->video.entity);
>>  
>>  	/* Release the file handle. */
>>  	v4l2_fh_del(vfh);
>> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
>> index 1d50dfbbb762..a019dbab5e04 100644
>> --- a/drivers/media/platform/qcom/camss/camss-video.c
>> +++ b/drivers/media/platform/qcom/camss/camss-video.c
>> @@ -745,7 +745,7 @@ static int video_open(struct file *file)
>>  
>>  	file->private_data = vfh;
>>  
>> -	ret = v4l2_pipeline_pm_use(&vdev->entity, 1);
>> +	ret = v4l2_pipeline_pm_get(&vdev->entity);
>>  	if (ret < 0) {
>>  		dev_err(video->camss->dev, "Failed to power up pipeline: %d\n",
>>  			ret);
>> @@ -771,7 +771,7 @@ static int video_release(struct file *file)
>>  
>>  	vb2_fop_release(file);
>>  
>> -	v4l2_pipeline_pm_use(&vdev->entity, 0);
>> +	v4l2_pipeline_pm_put(&vdev->entity);
>>  
>>  	file->private_data = NULL;
>>  
>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> index 9e2e63ffcc47..2a5be6334f72 100644
>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>> @@ -826,7 +826,7 @@ static int rvin_open(struct file *file)
>>  		goto err_unlock;
>>  
>>  	if (vin->info->use_mc)
>> -		ret = v4l2_pipeline_pm_use(&vin->vdev.entity, 1);
>> +		ret = v4l2_pipeline_pm_get(&vin->vdev.entity);
>>  	else if (v4l2_fh_is_singular_file(file))
>>  		ret = rvin_power_parallel(vin, true);
>>  
>> @@ -842,7 +842,7 @@ static int rvin_open(struct file *file)
>>  	return 0;
>>  err_power:
>>  	if (vin->info->use_mc)
>> -		v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
>> +		v4l2_pipeline_pm_put(&vin->vdev.entity);
>>  	else if (v4l2_fh_is_singular_file(file))
>>  		rvin_power_parallel(vin, false);
>>  err_open:
>> @@ -870,7 +870,7 @@ static int rvin_release(struct file *file)
>>  	ret = _vb2_fop_release(file, NULL);
>>  
>>  	if (vin->info->use_mc) {
>> -		v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
>> +		v4l2_pipeline_pm_put(&vin->vdev.entity);
>>  	} else {
>>  		if (fh_singular)
>>  			rvin_power_parallel(vin, false);
>> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
>> index 83a3a0257c7b..8dfc2877d4c6 100644
>> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
>> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
>> @@ -214,7 +214,7 @@ static int sun4i_csi_open(struct file *file)
>>  	if (ret < 0)
>>  		goto err_pm_put;
>>  
>> -	ret = v4l2_pipeline_pm_use(&csi->vdev.entity, 1);
>> +	ret = v4l2_pipeline_pm_get(&csi->vdev.entity);
>>  	if (ret)
>>  		goto err_pm_put;
>>  
>> @@ -227,7 +227,7 @@ static int sun4i_csi_open(struct file *file)
>>  	return 0;
>>  
>>  err_pipeline_pm_put:
>> -	v4l2_pipeline_pm_use(&csi->vdev.entity, 0);
>> +	v4l2_pipeline_pm_put(&csi->vdev.entity);
>>  
>>  err_pm_put:
>>  	pm_runtime_put(csi->dev);
>> @@ -243,7 +243,7 @@ static int sun4i_csi_release(struct file *file)
>>  	mutex_lock(&csi->lock);
>>  
>>  	v4l2_fh_release(file);
>> -	v4l2_pipeline_pm_use(&csi->vdev.entity, 0);
>> +	v4l2_pipeline_pm_put(&csi->vdev.entity);
>>  	pm_runtime_put(csi->dev);
>>  
>>  	mutex_unlock(&csi->lock);
>> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
>> index f0dfe68486d1..3d619ad08c9f 100644
>> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
>> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
>> @@ -474,7 +474,7 @@ static int sun6i_video_open(struct file *file)
>>  	if (ret < 0)
>>  		goto unlock;
>>  
>> -	ret = v4l2_pipeline_pm_use(&video->vdev.entity, 1);
>> +	ret = v4l2_pipeline_pm_get(&video->vdev.entity);
>>  	if (ret < 0)
>>  		goto fh_release;
>>  
>> @@ -507,7 +507,7 @@ static int sun6i_video_close(struct file *file)
>>  
>>  	_vb2_fop_release(file, NULL);
>>  
>> -	v4l2_pipeline_pm_use(&video->vdev.entity, 0);
>> +	v4l2_pipeline_pm_put(&video->vdev.entity);
>>  
>>  	if (last_fh)
>>  		sun6i_csi_set_power(video->csi, false);
>> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
>> index 014a2a97cadd..0fffdd3ce6a4 100644
>> --- a/drivers/media/v4l2-core/v4l2-mc.c
>> +++ b/drivers/media/v4l2-core/v4l2-mc.c
>> @@ -321,7 +321,7 @@ EXPORT_SYMBOL_GPL(v4l_vb2q_enable_media_source);
>>   * use_count field stores the total number of users of all video device nodes
>>   * in the pipeline.
>>   *
>> - * The v4l2_pipeline_pm_use() function must be called in the open() and
>> + * The v4l2_pipeline_pm_{get, put}() functions must be called in the open() and
>>   * close() handlers of video device nodes. It increments or decrements the use
>>   * count of all subdev entities in the pipeline.
>>   *
>> @@ -423,7 +423,7 @@ static int pipeline_pm_power(struct media_entity *entity, int change,
>>  	return ret;
>>  }
>>  
>> -int v4l2_pipeline_pm_use(struct media_entity *entity, int use)
>> +static int v4l2_pipeline_pm_use(struct media_entity *entity, unsigned int use)
>>  {
>>  	struct media_device *mdev = entity->graph_obj.mdev;
>>  	int change = use ? 1 : -1;
>> @@ -444,7 +444,19 @@ int v4l2_pipeline_pm_use(struct media_entity *entity, int use)
>>  
>>  	return ret;
>>  }
>> -EXPORT_SYMBOL_GPL(v4l2_pipeline_pm_use);
>> +
>> +int v4l2_pipeline_pm_get(struct media_entity *entity)
>> +{
>> +	return v4l2_pipeline_pm_use(entity, 1);
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_pipeline_pm_get);
>> +
>> +void v4l2_pipeline_pm_put(struct media_entity *entity)
>> +{
>> +	/* Powering off entities shouldn't fail. */
>> +	WARN_ON(v4l2_pipeline_pm_use(entity, 0));
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_pipeline_pm_put);
>>  
>>  int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
>>  			      unsigned int notification)
>> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
>> index 7712e7be8625..8aac4a3df7ca 100644
>> --- a/drivers/staging/media/imx/imx-media-capture.c
>> +++ b/drivers/staging/media/imx/imx-media-capture.c
>> @@ -643,7 +643,7 @@ static int capture_open(struct file *file)
>>  	if (ret)
>>  		v4l2_err(priv->src_sd, "v4l2_fh_open failed\n");
>>  
>> -	ret = v4l2_pipeline_pm_use(&vfd->entity, 1);
>> +	ret = v4l2_pipeline_pm_get(&vfd->entity);
>>  	if (ret)
>>  		v4l2_fh_release(file);
>>  
>> @@ -664,7 +664,7 @@ static int capture_release(struct file *file)
>>  		vq->owner = NULL;
>>  	}
>>  
>> -	v4l2_pipeline_pm_use(&vfd->entity, 0);
>> +	v4l2_pipeline_pm_put(&vfd->entity);
>>  
>>  	v4l2_fh_release(file);
>>  	mutex_unlock(&priv->mutex);
>> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
>> index 673aa3a5f2bd..9578b8d22f25 100644
>> --- a/drivers/staging/media/omap4iss/iss_video.c
>> +++ b/drivers/staging/media/omap4iss/iss_video.c
>> @@ -1111,7 +1111,7 @@ static int iss_video_open(struct file *file)
>>  		goto done;
>>  	}
>>  
>> -	ret = v4l2_pipeline_pm_use(&video->video.entity, 1);
>> +	ret = v4l2_pipeline_pm_get(&video->video.entity);
>>  	if (ret < 0) {
>>  		omap4iss_put(video->iss);
>>  		goto done;
>> @@ -1160,7 +1160,7 @@ static int iss_video_release(struct file *file)
>>  	/* Disable streaming and free the buffers queue resources. */
>>  	iss_video_streamoff(file, vfh, video->type);
>>  
>> -	v4l2_pipeline_pm_use(&video->video.entity, 0);
>> +	v4l2_pipeline_pm_put(&video->video.entity);
>>  
>>  	/* Release the videobuf2 queue */
>>  	vb2_queue_release(&handle->queue);
>> diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
>> index 384960249f01..5e73eb8e28f6 100644
>> --- a/include/media/v4l2-mc.h
>> +++ b/include/media/v4l2-mc.h
>> @@ -86,23 +86,30 @@ int v4l_vb2q_enable_media_source(struct vb2_queue *q);
>>  
>>  
>>  /**
>> - * v4l2_pipeline_pm_use - Update the use count of an entity
>> - * @entity: The entity
>> - * @use: Use (1) or stop using (0) the entity
>> + * v4l2_pipeline_pm_get - Increase the use count of a pipeline
>> + * @entity: The root entity of a pipeline
>>   *
>> - * Update the use count of all entities in the pipeline and power entities on or
>> - * off accordingly.
>> + * Update the use count of all entities in the pipeline and power entities on.
>>   *
>> - * This function is intended to be called in video node open (use ==
>> - * 1) and release (use == 0). It uses struct media_entity.use_count to
>> - * track the power status. The use of this function should be paired
>> - * with v4l2_pipeline_link_notify().
>> + * This function is intended to be called in video node open. It uses
>> + * struct media_entity.use_count to track the power status. The use
>> + * of this function should be paired with v4l2_pipeline_link_notify().
>>   *
>> - * Return 0 on success or a negative error code on failure. Powering entities
>> - * off is assumed to never fail. No failure can occur when the use parameter is
>> - * set to 0.
>> + * Return 0 on success or a negative error code on failure.
>>   */
>> -int v4l2_pipeline_pm_use(struct media_entity *entity, int use);
>> +int v4l2_pipeline_pm_get(struct media_entity *entity);
>> +
>> +/**
>> + * v4l2_pipeline_pm_put - Decrease the use count of a pipeline
>> + * @entity: The root entity of a pipeline
>> + *
>> + * Update the use count of all entities in the pipeline and power entities off.
>> + *
>> + * This function is intended to be called in video node release. It uses
>> + * struct media_entity.use_count to track the power status. The use
>> + * of this function should be paired with v4l2_pipeline_link_notify().
>> + */
>> +void v4l2_pipeline_pm_put(struct media_entity *entity);
>>  
>>  
>>  /**
>> @@ -114,7 +121,7 @@ int v4l2_pipeline_pm_use(struct media_entity *entity, int use);
>>   * React to link management on powered pipelines by updating the use count of
>>   * all entities in the source and sink sides of the link. Entities are powered
>>   * on or off accordingly. The use of this function should be paired
>> - * with v4l2_pipeline_pm_use().
>> + * with v4l2_pipeline_pm_{get,put}().
>>   *
>>   * Return 0 on success or a negative error code on failure. Powering entities
>>   * off is assumed to never fail. This function will not fail for disconnection
>> @@ -144,11 +151,14 @@ static inline int v4l_vb2q_enable_media_source(struct vb2_queue *q)
>>  	return 0;
>>  }
>>  
>> -static inline int v4l2_pipeline_pm_use(struct media_entity *entity, int use)
>> +static inline int v4l2_pipeline_pm_get(struct media_entity *entity)
>>  {
>>  	return 0;
>>  }
>>  
>> +static inline void v4l2_pipeline_pm_put(struct media_entity *entity)
>> +{}
>> +
>>  static inline int v4l2_pipeline_link_notify(struct media_link *link, u32 flags,
>>  					    unsigned int notification)
>>  {
>> -- 
>> 2.22.0
>>
>>
> 
> 

