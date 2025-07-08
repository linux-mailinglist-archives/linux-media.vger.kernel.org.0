Return-Path: <linux-media+bounces-37109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E29AFCB9B
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2789F1C2072C
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 13:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B524D2E093B;
	Tue,  8 Jul 2025 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mPaJp4gi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C418C2DCBF7;
	Tue,  8 Jul 2025 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980273; cv=none; b=REVi9EOTBOcxgwlITCtGpZXxcrTkU/qAZxoyyECbl+urdmiUNL1G0fUqoCfEGCXY5Gk5bjLAGm+eNoIF1gkcIfoeMdwPOLAfuBnve0GgNtMKjsbo49I3qDuAUH3ZkxoaLYE8GhWeh8CnI3ehcpRMRRNNqxDqzn1F08oNnO8iOic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980273; c=relaxed/simple;
	bh=qgK1+p+2S6x9solPSjiOTcbNhibG/PD66ABLIzslZxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7KqLLGNa9gO0IMnn8IFW9coZZYKXVDuwezepMNDA+j7qTRZcYkPRKFMYrmpcfW637A/imFzr95EgTIC2ubebYOF19wRcvKCgJox3aC2SU0V0yew6gOqMt5BF7bB0CckOtd93UNRvuYGLDdBU/KTXb0uh4guyrqne+9beNXwgIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mPaJp4gi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90C7F8FA;
	Tue,  8 Jul 2025 15:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751980239;
	bh=qgK1+p+2S6x9solPSjiOTcbNhibG/PD66ABLIzslZxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPaJp4gihjeQL3f6n+rZvx750swul15ViT6dkcslLqKmwVXVYlhiwx+9hB0tAwc3j
	 XFxlkZzfLmLdPtRpMVPUmyRqbvuJ5k+zuP//UpjmuZwMX9nynUppZ/yWJyFKXt5owh
	 o2qUi0ACA9LDEH+2iMxLLr9U1FYByRN7WmEHWZb8=
Date: Tue, 8 Jul 2025 15:10:58 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 2/5] media: v4l2-dev: Add helpers to run
 media_pipeline_[started|stopped]()
Message-ID: <v3gonywym2km6u4qpsm2bkpn5n7vmvm4rdt3nfiws6mri3b7y4@gh4q5f4cmavc>
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
 <20250704-ivc-v3-2-5c45d936ef2e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250704-ivc-v3-2-5c45d936ef2e@ideasonboard.com>

Hi Dan

On Fri, Jul 04, 2025 at 12:20:19PM +0100, Daniel Scally wrote:
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
>
> We could take this further perhaps and include the equivalent routine
> in video_device_pipeline[_alloc]_start()...if none of the entities
> involved have .pipeline_started() or .pipeline_stopped() operations it
> should be harmless, but I'm a bit reluctant to force the choice to run
> those operations on users.

I know I've kind of suggested that, but after all I don't think it's a
very good idea, having this in two steps is probably better. And I
like the fact the v4l2-dev layer operates on the video device counting
and only relies on the mc layer for the callbacks notification.

>
> Changes in v2:
>
> 	- Adapted now media_pipeline_for_each_entity() takes an iter
> 	  variable
> 	- Fixed the Return: section of the kerneldoc comments
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 57 ++++++++++++++++++++++++++++++++++++++
>  include/media/v4l2-dev.h           | 36 ++++++++++++++++++++++++
>  2 files changed, 93 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index c369235113d98ae26c30a1aa386e7d60d541a66e..f3309f8349664f7296a95216a40dd9d9baae8d9e 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1200,6 +1200,63 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
>  }
>  EXPORT_SYMBOL_GPL(video_device_pipeline);
>
> +static int __video_device_pipeline_started(struct media_pipeline *pipe)

__function_name() is usually reserved for the non-locking version of
function_name().

This seems to be an helper only used internally by
video_device_pipeline_started() so I would use a different name
something like video_device_has_pipeline_started() ?


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
> +	ret = __video_device_pipeline_started(pipe);
> +	if (ret)
> +		return ret;

I would not return ret, as it might take random values betwen
n_video_devices and 1. See below on the return value documentation

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
> +	ret = __video_device_pipeline_started(pipe);
> +	if (ret)
> +		return ret;

ditto

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
> index 1b6222fab24eda96cbe459b435431c01f7259366..26b4a491024701ef47320aec6a1a680149ba4fc3 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -654,6 +654,42 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
>   */
>  struct media_pipeline *video_device_pipeline(struct video_device *vdev);
>
> +/**
> + * video_device_pipeline_started - Run the pipeline_started() entity operation
> + *				   for a fully-started media pipeline
> + * @vdev: A video device that's part of the pipeline
> + *
> + * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
> + * connected to a given video device through enabled links have been marked as

I would use the same text as the one from video_device_pipeline_start()

" connected to a given video device through enabled links, either
directly or indirectly,"

> + * streaming through the use of video_device_pipeline_start() or one of its
> + * equivalent functions. If so, media_pipeline_started() is called to inform
> + * entities in the pipeline of that fact. The intention is to provide drivers
> + * with a shortcut for checking whether their pipeline is fully ready to start
> + * processing data.

Not really a shortcut, I would use "mechanism" instead.

I would also specify that:

 * entities in the pipeline of that fact. The intention is to provide drivers
 * with a mechanism for checking whether their pipeline is fully ready to start
 * processing data and call the .pipeline_started() media entity operation
 * on all the entities in the pipeline.

> + *
> + * Return: The number of video devices in the pipeline remaining to be started,
> + * or a negative error number on failure.

0 for success as well

I would anyway return 0 for success and a specific error code for the
three failure cases:
-ENOMEM if allocating the iterator fails
-ENODEV if not all video devices have started
-EINVAL if media_pipeline_started() fails

You can document them as (copying from iommu.h)

* Return:
* * 0            - success
* * EINVAL       - call to pipeline_started() failed
* * ENOMEM       - failed to allocate pipe iterator
* * ENODEV       - pipeline not yet fully started

> + */
> +int video_device_pipeline_started(struct video_device *vdev);
> +
> +/**
> + * video_device_pipeline_stopped - Run the pipeline_stopped() entity operation
> + *				   for a fully-started media pipeline
> + * @vdev: A video device that's part of the pipeline
> + *
> + * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
> + * connected to a given video device through enabled links have been marked as
> + * streaming through the use of video_device_pipeline_start() or one of its

What is the intended semantic here ? The first video device to receive
a streamoff() will trigger media_pipeline_stopped() or should the last
one do that ?

> + * equivalent functions. If so, media_pipeline_stopped() is called for each
> + * entity in the pipeline. The intention is to provide drivers with a shortcut
> + * for checking whether this video device is the first device in the pipeline
> + * to be stopped.
> + *
> + * Return: The number of video devices in the pipeline remaining to be started, or a
> + * negative error number on failure.
> + */
> +int video_device_pipeline_stopped(struct video_device *vdev);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  #endif /* _V4L2_DEV_H */
>
> --
> 2.34.1
>
>

