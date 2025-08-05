Return-Path: <linux-media+bounces-38902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E50F4B1B07A
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 10:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87692189C83F
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 08:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49E32580CF;
	Tue,  5 Aug 2025 08:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ck8t3Gqh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3660721ADCB;
	Tue,  5 Aug 2025 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754383942; cv=none; b=OG+755XduC2nfiXCXg3zTKyRJQvXk0Wfh0hsyGPaVUVL/PykAa9r/RiP+ffLzbD9QFOJ6dkt6x6gICu0UfhaFJeUdflbXc5bhxtXJ/d1OS02fRfUx4w+zZwsZMhXgwix2uuwiFARqvJmVd7B7UA8CPKL24BBvSyqzs6DHTMPCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754383942; c=relaxed/simple;
	bh=jBxhLUdFTaqZZdIWF8N1Cc/AQ1a84Xk9kCF/RInLbes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIQmM/iu1h0LsLyUdWeIaBH1sYTZnc5JRmBKmICyMP9JixAcFe2VjjAoYO8sybsezWZ6X5W0WReXRfi0nxUSaKolLt8N+M4FBmdA8hnYXds6fMk/NL2fByOUSJCbOQpAxstC7vfZdZjwyxFkGSwzHl7vma5naIner7FE+zZiTz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ck8t3Gqh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41FD6176B;
	Tue,  5 Aug 2025 10:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754383889;
	bh=jBxhLUdFTaqZZdIWF8N1Cc/AQ1a84Xk9kCF/RInLbes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ck8t3Gqh5H3GnDK2qlFIdqsQNxFcjlqWuKrC4I9CxDJmqH/JPh2IvOiZFkO6Pk5sc
	 6mj4Enubalxy8D1j7WaVCtYGxh5qJM721A9AfC77YtA478XjqzHxgzhVUAow/EUCFN
	 WuXvVJXTj4VXFSu2I2eNWDrL3hMuyima2HHSp1ug=
Date: Tue, 5 Aug 2025 10:52:13 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, 
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v11 02/19] media: v4l2-dev: Add helpers to run
 media_pipeline_[started|stopped]()
Message-ID: <ppgp4bctmfgyd6ghizfxyiwp53isx5cbqvwx7rvormsexdb45k@7j7vdbpzx564>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-2-bc20e460e42a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714-c55-v11-2-bc20e460e42a@ideasonboard.com>

Hi Dan

On Mon, Jul 14, 2025 at 04:06:28PM +0100, Daniel Scally wrote:
> Add helpers to run the new media_pipeline_started() and
> media_pipeline_stopped() functions. The helpers iterate over the
> entities in the pipeline and count the number of video devices and
> compare that to the pipeline's start_count() before acting. This
> allows us to only run the media pipeline callbacks in the event that
> the pipeline has had video_pipeline_start() called for each video
> device.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>
> ---
> Changes in v3:
> 	- Revised the documentation a bit, detailing the specific error
> 	  codes and rewording the descriptions
> 	- Renamed __video_device_pipeline_started()
> 	- List the possible return values explicitly
>
> Changes in v2:
>
> 	- Adapted now media_pipeline_for_each_entity() takes an iter
> 	  variable
> 	- Fixed the Return: section of the kerneldoc comments
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 57 ++++++++++++++++++++++++++++++++++++++
>  include/media/v4l2-dev.h           | 52 ++++++++++++++++++++++++++++++++++
>  2 files changed, 109 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index c369235113d98ae26c30a1aa386e7d60d541a66e..a25038f3c9cc9213b840e2b96d1ef49d17d22fb8 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1200,6 +1200,63 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
>  }
>  EXPORT_SYMBOL_GPL(video_device_pipeline);
>
> +static int video_device_pipeline_unstarted_vdevs(struct media_pipeline *pipe)
> +{
> +	struct media_pipeline_entity_iter iter;
> +	unsigned int n_video_devices = 0;
> +	struct media_entity *entity;
> +	int ret;
> +
> +	ret = media_pipeline_entity_iter_init(pipe, &iter);
> +	if (ret)
> +		return ret;
> +
> +	media_pipeline_for_each_entity(pipe, &iter, entity) {
> +		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
> +			n_video_devices++;
> +	}
> +
> +	media_pipeline_entity_iter_cleanup(&iter);
> +
> +	return n_video_devices - pipe->start_count;
> +}
> +
> +int video_device_pipeline_started(struct video_device *vdev)
> +{
> +	struct media_pipeline *pipe;
> +	int ret;
> +
> +	pipe = video_device_pipeline(vdev);
> +	if (!pipe)
> +		return -ENODEV;
> +
> +	ret = video_device_pipeline_unstarted_vdevs(pipe);
> +	if (ret)
> +		return ret;
> +
> +	return media_pipeline_started(pipe);
> +}
> +EXPORT_SYMBOL_GPL(video_device_pipeline_started);
> +
> +int video_device_pipeline_stopped(struct video_device *vdev)
> +{
> +	struct media_pipeline *pipe;
> +	int ret;
> +
> +	pipe = video_device_pipeline(vdev);
> +	if (!pipe)
> +		return -ENODEV;
> +
> +	ret = video_device_pipeline_unstarted_vdevs(pipe);
> +	if (ret)
> +		return ret;
> +
> +	media_pipeline_stopped(pipe);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(video_device_pipeline_stopped);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  /*
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 1b6222fab24eda96cbe459b435431c01f7259366..45a87a5a76e8782c79da9d4890b063b8f0cbb3d8 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -654,6 +654,58 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
>   */
>  struct media_pipeline *video_device_pipeline(struct video_device *vdev);
>
> +/**
> + * video_device_pipeline_started - Run the pipeline_started() entity operation
> + *				   for a fully-started media pipeline
> + * @vdev: A video device that's part of the pipeline
> + *
> + * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
> + * connected to a given video device through enabled links, either directly or
> + * indirectly, have been marked as streaming through the use of
> + * video_device_pipeline_start() or one of its equivalent functions. If so,
> + * media_pipeline_started() is called to inform entities in the pipeline of that
> + * fact. The intention is to provide drivers with a mechanism for checking
> + * whether their pipeline is fully ready to start processing data and call the
> + * .pipeline_started() media entity operation on all the entities in the
> + * pipeline if so.
> + *
> + * Return: The number of video devices in the pipeline remaining to be started,
> + * or a negative error number on failure:
> + *
> + * * 0			- Success
> + * * n > 0		- n video devices in the pipeline remain unstarted
> + * * -ENODEV		- The video device has no pipeline
> + * * -ENOMEM		- failed to allocate pipeline iterator
> + * * n < 0		- Error passed through from a media entity's
> + *			  .pipeline_started() operation
> + */
> +int video_device_pipeline_started(struct video_device *vdev);
> +
> +/**
> + * video_device_pipeline_stopped - Run the pipeline_stopped() entity operation
> + *				   for a fully-started media pipeline
> + * @vdev: A video device that's part of the pipeline
> + *
> + * This function checks whether the MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
> + * connected to a given video device through enabled links, either directly or
> + * indirectly, have been marked as not streaming through the use of
> + * video_device_pipeline_stop() or one of its equivalent functions. If none of
> + * the video devices in the pipeline have been stopped, then the function
> + * media_pipeline_stopped() is called. The intention is to provide drivers with
> + * a mechanism for checking whether this video device is the first device in the
> + * pipeline to be stopped and call the .pipeline_stopped() media entity
> + * operation on all the entities in the pipeline if so.
> + *
> + * Return: The number of video devices in the pipeline remaining to be started,
> + * or a negative error number on failure:
> + *
> + * * 0			- Success
> + * * n > 0		- n video devices in the pipeline already stopped
> + * * -ENODEV		- The video device has no pipeline
> + * * -ENOMEM		- failed to allocate pipeline iterator
> + */
> +int video_device_pipeline_stopped(struct video_device *vdev);

I still have troubles here,

media_pipeline_stopped() is documented as

* media_pipeline_stopped - Inform entities in a pipeline that it has stopped

and the entity operation pipeline_stopped() is documented as

* @pipeline_stopped:  Optional: Notify this entity that the pipeline it is a
*                     part of has been stopped.

However video_device_pipeline_stopped() calls media_pipeline_stopped()
(and consequentially the entities' .pipeline_stopped() op) on the first call
to streamoff on any video devices in the pipeline.

At this point what confuses me is:

- If we're on the first call to streamoff, has the pipeline actually
  "stopped" ?
- if the fist call to streamoff triggers a pipeline halt, what happens
  to the non-yet-stopped video devices ? Will they stop sending
  buffers back ?
- I understand a post-pipeline-start hook is desirable, but I fail to
  clearly find a use case for this one, that to me looks like a
  pre-pipeline-stop hook.

> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  #endif /* _V4L2_DEV_H */
>
> --
> 2.34.1
>
>

