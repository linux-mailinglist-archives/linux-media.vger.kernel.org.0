Return-Path: <linux-media+bounces-42903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3132B8F577
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 09:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89BC4189EE6D
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A319B2F657A;
	Mon, 22 Sep 2025 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcfYhL7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC25F2EE611;
	Mon, 22 Sep 2025 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758527564; cv=none; b=e78MBdy6kp2tBE7kcGdm745f8frtCwsnVFRrTQSZ4M7ol9EnOT2l48ZVFEhYsBbatZdjgdtywWbnHTm2NBzDyvuPe8qamVpKa0vdTHc3MMjFEH/+RmmxQkWuJ4E1NgjKn9DN9ktMsItIjtbAphurCJGzNiphd22cSVPf4xs+BSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758527564; c=relaxed/simple;
	bh=JuC8bXuOaNnO1skIJhRhiboZzbdfnc74g1cr4x0O2N4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lsalMXuKL8ivHbRK0FDeHES8uP/yiNk8h/dKWj3bLR3+rAlYtoTWhhCb1ZBckONUpHl8L3BPk1n4c4XAlbeAlSR3bNC5FAf/n1cHeGsusdnyKsqiYQC72rpLCz2up3cNsr9Rb3h1FuPizYVozErkdOT6iJ1f2Ie+HKPhWYLE+lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcfYhL7Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07E2C4CEF5;
	Mon, 22 Sep 2025 07:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758527563;
	bh=JuC8bXuOaNnO1skIJhRhiboZzbdfnc74g1cr4x0O2N4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=QcfYhL7ZfwHb3JUg7yrebR7TMw+z+AasVQBRavY3Ie3qz54UjewZtnwVqRijAPbYb
	 BkYp8O7dTNew/u+qRjW7Hf7fFMZ0OVYykO6UQKPqKiTvvcSgE2FoTSKGTTu1q4w+CH
	 2B+/qtHPaj018MPwbEL0bDhV77UAhPn7MG8rl9zYalwOd0H5MVArfHrj4ddzDUaBE7
	 B7mTxX+evUX2dXFMbd+tBDD64OwNE9QDzG9cdGUTp8tL22sZRDSwxdaIMQ9ceSKpXH
	 3vYWjjawaeHsc1wcYrwCcjB977ccTXad1I5GYXuuTsWdyM9hAbaJyaE1meypNBhVMA
	 MMFrEFvG0hdSA==
Message-ID: <3eef0f98-c34a-4b67-97f4-d60cd1eab8ad@kernel.org>
Date: Mon, 22 Sep 2025 09:52:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 02/10] media: v4l2-dev: Add support for try state
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ma Ke <make24@iscas.ac.cn>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
 <20250919-vdev-state-v2-2-b2c42426965c@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250919-vdev-state-v2-2-b2c42426965c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/09/2025 11:55, Jai Luthra wrote:
> Format negotiation performed via the TRY_FMT ioctl should only affect
> the temporary context of a specific filehandle, not the active state
> stored in the video device structure. To support this distinction, we
> need separate storage for try and active states.
> 
> Introduce an enum to distinguish between these two state types and store
> the try state in struct v4l2_fh instead of the video device structure.
> The try state is allocated during file handle initialization in
> v4l2_fh_init() and released in v4l2_fh_exit().

There is a major difference between TRY in video devices and TRY in subdev
devices: TRY for video devices is not persistent, i.e. it doesn't need to
be stored anywhere since nobody will be using that information.

If the plan is to change that in later patch series, then that should be
very clearly stated. And I think I would need to know the details of those
future plans before I can OK this.

So how is this try state intended to be used in the future?

Regards,

	Hans

> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> --
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Hans Verkuil <hverkuil@kernel.org>
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Jai Luthra <jai.luthra@ideasonboard.com>
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/media/v4l2-core/v4l2-dev.c |  7 +++++--
>  drivers/media/v4l2-core/v4l2-fh.c  |  6 ++++++
>  include/media/v4l2-dev.h           | 17 ++++++++++++++++-
>  include/media/v4l2-fh.h            |  2 ++
>  4 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 997255709448510fcd17b6de798a3df99cd7ea09..26b6b2f37ca55ce981aa17a28a875dc3cf253d9b 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -164,7 +164,8 @@ void video_device_release_empty(struct video_device *vdev)
>  EXPORT_SYMBOL(video_device_release_empty);
>  
>  struct video_device_state *
> -__video_device_state_alloc(struct video_device *vdev)
> +__video_device_state_alloc(struct video_device *vdev,
> +			   enum video_device_state_whence which)
>  {
>  	struct video_device_state *state =
>  		kzalloc(sizeof(struct video_device_state), GFP_KERNEL);
> @@ -172,6 +173,7 @@ __video_device_state_alloc(struct video_device *vdev)
>  	if (!state)
>  		return ERR_PTR(-ENOMEM);
>  
> +	state->which = which;
>  	state->vdev = vdev;
>  
>  	return state;
> @@ -962,7 +964,8 @@ int __video_register_device(struct video_device *vdev,
>  
>  	/* state support */
>  	if (test_bit(V4L2_FL_USES_STATE, &vdev->flags))
> -		vdev->state = __video_device_state_alloc(vdev);
> +		vdev->state = __video_device_state_alloc(vdev,
> +							 VIDEO_DEVICE_STATE_ACTIVE);
>  
>  	/* Part 1: check device type */
>  	switch (type) {
> diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
> index df3ba9d4674bd25626cfcddc2d0cb28c233e3cc3..522acc0eb8401305c6893232d96d826669ab90d5 100644
> --- a/drivers/media/v4l2-core/v4l2-fh.c
> +++ b/drivers/media/v4l2-core/v4l2-fh.c
> @@ -38,6 +38,10 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
>  	INIT_LIST_HEAD(&fh->subscribed);
>  	fh->sequence = -1;
>  	mutex_init(&fh->subscribe_lock);
> +	/* state support */
> +	if (test_bit(V4L2_FL_USES_STATE, &fh->vdev->flags))
> +		fh->state = __video_device_state_alloc(vdev,
> +						       VIDEO_DEVICE_STATE_TRY);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fh_init);
>  
> @@ -84,6 +88,8 @@ void v4l2_fh_exit(struct v4l2_fh *fh)
>  {
>  	if (fh->vdev == NULL)
>  		return;
> +	if (test_bit(V4L2_FL_USES_STATE, &fh->vdev->flags))
> +		kfree(fh->state);
>  	v4l_disable_media_source(fh->vdev);
>  	v4l2_event_unsubscribe_all(fh);
>  	mutex_destroy(&fh->subscribe_lock);
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 57e4691ef467aa2b0782dd4b8357bd0670643293..5ca04a1674e0bf7016537e6fb461d790fc0a958f 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -220,15 +220,28 @@ struct v4l2_file_operations {
>  	int (*release) (struct file *);
>  };
>  
> +/**
> + * enum video_device_state_whence - Video device state type
> + *
> + * @VIDEO_DEVICE_STATE_TRY: from VIDIOC_TRY_xxx, for negotiation only
> + * @VIDEO_DEVICE_STATE_ACTIVE: from VIDIOC_S_xxx, applied to the device
> + */
> +enum video_device_state_whence {
> +	VIDEO_DEVICE_STATE_TRY = 0,
> +	VIDEO_DEVICE_STATE_ACTIVE = 1,
> +};
> +
>  /**
>   * struct video_device_state - Used for storing video device state information.
>   *
>   * @fmt: Format of the capture stream
>   * @vdev: Pointer to video device
> + * @which: State type (from enum video_device_state_whence)
>   */
>  struct video_device_state {
>  	struct v4l2_format fmt;
>  	struct video_device *vdev;
> +	enum video_device_state_whence which;
>  };
>  
>  /*
> @@ -568,13 +581,15 @@ static inline int video_is_registered(struct video_device *vdev)
>  /** __video_device_state_alloc - allocate video device state structure
>   *
>   * @vdev: pointer to struct video_device
> + * @which: type of video device state (from enum video_device_state_whence)
>   *
>   * .. note::
>   *
>   *	This function is meant to be used only inside the V4L2 core.
>   */
>  struct video_device_state *
> -__video_device_state_alloc(struct video_device *vdev);
> +__video_device_state_alloc(struct video_device *vdev,
> +			   enum video_device_state_whence which);
>  
>  /** __video_device_state_free - free video device state structure
>   *
> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> index aad4b3689d7ea191978f24ce24d24cd2e73636b6..55455704a98d0785d0a3418b8a43d7363b7c8aa2 100644
> --- a/include/media/v4l2-fh.h
> +++ b/include/media/v4l2-fh.h
> @@ -28,6 +28,7 @@ struct v4l2_ctrl_handler;
>   * @vdev: pointer to &struct video_device
>   * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
>   * @prio: priority of the file handler, as defined by &enum v4l2_priority
> + * @state: try state used for format negotiation on the video device
>   *
>   * @wait: event' s wait queue
>   * @subscribe_lock: serialise changes to the subscribed list; guarantee that
> @@ -44,6 +45,7 @@ struct v4l2_fh {
>  	struct video_device	*vdev;
>  	struct v4l2_ctrl_handler *ctrl_handler;
>  	enum v4l2_priority	prio;
> +	struct video_device_state *state;
>  
>  	/* Events */
>  	wait_queue_head_t	wait;
> 


