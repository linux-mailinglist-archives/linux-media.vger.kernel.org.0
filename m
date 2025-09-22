Return-Path: <linux-media+bounces-42904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50070B8F601
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 09:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BADE3B2814
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFF42F747A;
	Mon, 22 Sep 2025 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="toiQr1PJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3441B2D9484;
	Mon, 22 Sep 2025 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758527911; cv=none; b=HWmmflkGsnZ6sFQQ1L1FFqpFnfSYjCxIXDR7J1U4NuGR5w/M3BRuTNJVD7+ha9dhYRZoVOIjfMQN6atUdhD1PxQnY+yT572vZ615fdjYhlf7Kbj7Y49VlTTBWcKPkeczS+QR1Okd+IkcUGqOHYLmzY2SBE5BYS5G5uIg1qKEM7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758527911; c=relaxed/simple;
	bh=6GiJ8qr9/73EGKAiQTj8snw5Iy0Cd+mqswC0eZzL4zc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pubkVfaE8R5Rd985cSzAeW16IoQN2SxRetwOzULKPn7mnmtSoPPnS1daDqf8qeKxikTBZNuDUIjoopW8/pjieWUmWfegPiqiJW1mic6nV4kXn5AcRxmy00VNfPuoui/J4q5JE4ZC/bAY6tCsZtlElxC/XlWeeiR/+M25v/3FQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=toiQr1PJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11639C4CEF5;
	Mon, 22 Sep 2025 07:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758527910;
	bh=6GiJ8qr9/73EGKAiQTj8snw5Iy0Cd+mqswC0eZzL4zc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=toiQr1PJDrk31rWrEZBW22hDCIdAtkwXQom3kOK2+5oLLfFPuoKF2rv+1+6yFvs4z
	 i352oUz1JrD5YB0cf1+IgtQMNpsz+wd1knS8FJrAXB2GdErXuJK/FYWBRMnQc27U8V
	 yURcrBkdEHh5p1DYo1Ji3KpLq4Ao1PkGXuutJ/4nN66m15hK18s7FudMpTwHIXLdjZ
	 Y69sdIq5bhcMX6i+LxJvgefqC0vA+H10upAek1iQvwjjfF4+kJ7dLJDCbtombph36t
	 dkMA4xPH0HNio1s7kBigtEFgCz2GbHclQ0aRGWOrAtyNtxKs9MQ27ZzgFomMpz1I6U
	 huxEFuUfocuww==
Message-ID: <16f45860-923b-4b5d-995e-0729d0479752@kernel.org>
Date: Mon, 22 Sep 2025 09:58:26 +0200
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
 <3eef0f98-c34a-4b67-97f4-d60cd1eab8ad@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <3eef0f98-c34a-4b67-97f4-d60cd1eab8ad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/09/2025 09:52, Hans Verkuil wrote:
> On 19/09/2025 11:55, Jai Luthra wrote:
>> Format negotiation performed via the TRY_FMT ioctl should only affect
>> the temporary context of a specific filehandle, not the active state
>> stored in the video device structure. To support this distinction, we
>> need separate storage for try and active states.
>>
>> Introduce an enum to distinguish between these two state types and store
>> the try state in struct v4l2_fh instead of the video device structure.
>> The try state is allocated during file handle initialization in
>> v4l2_fh_init() and released in v4l2_fh_exit().
> 
> There is a major difference between TRY in video devices and TRY in subdev
> devices: TRY for video devices is not persistent, i.e. it doesn't need to
> be stored anywhere since nobody will be using that information.
> 
> If the plan is to change that in later patch series, then that should be
> very clearly stated. And I think I would need to know the details of those
> future plans before I can OK this.
> 
> So how is this try state intended to be used in the future?

Follow-up: if there are no plans to change/enhance the VIDIOC_TRY_FMT semantics,
then I don't really see the point of this since there is no need to store this
information.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>> --
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: Hans Verkuil <hverkuil@kernel.org>
>> Cc: Ricardo Ribalda <ribalda@chromium.org>
>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Cc: Jai Luthra <jai.luthra@ideasonboard.com>
>> Cc: Ma Ke <make24@iscas.ac.cn>
>> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> Cc: linux-media@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>  drivers/media/v4l2-core/v4l2-dev.c |  7 +++++--
>>  drivers/media/v4l2-core/v4l2-fh.c  |  6 ++++++
>>  include/media/v4l2-dev.h           | 17 ++++++++++++++++-
>>  include/media/v4l2-fh.h            |  2 ++
>>  4 files changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index 997255709448510fcd17b6de798a3df99cd7ea09..26b6b2f37ca55ce981aa17a28a875dc3cf253d9b 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -164,7 +164,8 @@ void video_device_release_empty(struct video_device *vdev)
>>  EXPORT_SYMBOL(video_device_release_empty);
>>  
>>  struct video_device_state *
>> -__video_device_state_alloc(struct video_device *vdev)
>> +__video_device_state_alloc(struct video_device *vdev,
>> +			   enum video_device_state_whence which)
>>  {
>>  	struct video_device_state *state =
>>  		kzalloc(sizeof(struct video_device_state), GFP_KERNEL);
>> @@ -172,6 +173,7 @@ __video_device_state_alloc(struct video_device *vdev)
>>  	if (!state)
>>  		return ERR_PTR(-ENOMEM);
>>  
>> +	state->which = which;
>>  	state->vdev = vdev;
>>  
>>  	return state;
>> @@ -962,7 +964,8 @@ int __video_register_device(struct video_device *vdev,
>>  
>>  	/* state support */
>>  	if (test_bit(V4L2_FL_USES_STATE, &vdev->flags))
>> -		vdev->state = __video_device_state_alloc(vdev);
>> +		vdev->state = __video_device_state_alloc(vdev,
>> +							 VIDEO_DEVICE_STATE_ACTIVE);
>>  
>>  	/* Part 1: check device type */
>>  	switch (type) {
>> diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
>> index df3ba9d4674bd25626cfcddc2d0cb28c233e3cc3..522acc0eb8401305c6893232d96d826669ab90d5 100644
>> --- a/drivers/media/v4l2-core/v4l2-fh.c
>> +++ b/drivers/media/v4l2-core/v4l2-fh.c
>> @@ -38,6 +38,10 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
>>  	INIT_LIST_HEAD(&fh->subscribed);
>>  	fh->sequence = -1;
>>  	mutex_init(&fh->subscribe_lock);
>> +	/* state support */
>> +	if (test_bit(V4L2_FL_USES_STATE, &fh->vdev->flags))
>> +		fh->state = __video_device_state_alloc(vdev,
>> +						       VIDEO_DEVICE_STATE_TRY);
>>  }
>>  EXPORT_SYMBOL_GPL(v4l2_fh_init);
>>  
>> @@ -84,6 +88,8 @@ void v4l2_fh_exit(struct v4l2_fh *fh)
>>  {
>>  	if (fh->vdev == NULL)
>>  		return;
>> +	if (test_bit(V4L2_FL_USES_STATE, &fh->vdev->flags))
>> +		kfree(fh->state);
>>  	v4l_disable_media_source(fh->vdev);
>>  	v4l2_event_unsubscribe_all(fh);
>>  	mutex_destroy(&fh->subscribe_lock);
>> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
>> index 57e4691ef467aa2b0782dd4b8357bd0670643293..5ca04a1674e0bf7016537e6fb461d790fc0a958f 100644
>> --- a/include/media/v4l2-dev.h
>> +++ b/include/media/v4l2-dev.h
>> @@ -220,15 +220,28 @@ struct v4l2_file_operations {
>>  	int (*release) (struct file *);
>>  };
>>  
>> +/**
>> + * enum video_device_state_whence - Video device state type
>> + *
>> + * @VIDEO_DEVICE_STATE_TRY: from VIDIOC_TRY_xxx, for negotiation only
>> + * @VIDEO_DEVICE_STATE_ACTIVE: from VIDIOC_S_xxx, applied to the device
>> + */
>> +enum video_device_state_whence {
>> +	VIDEO_DEVICE_STATE_TRY = 0,
>> +	VIDEO_DEVICE_STATE_ACTIVE = 1,
>> +};
>> +
>>  /**
>>   * struct video_device_state - Used for storing video device state information.
>>   *
>>   * @fmt: Format of the capture stream
>>   * @vdev: Pointer to video device
>> + * @which: State type (from enum video_device_state_whence)
>>   */
>>  struct video_device_state {
>>  	struct v4l2_format fmt;
>>  	struct video_device *vdev;
>> +	enum video_device_state_whence which;
>>  };
>>  
>>  /*
>> @@ -568,13 +581,15 @@ static inline int video_is_registered(struct video_device *vdev)
>>  /** __video_device_state_alloc - allocate video device state structure
>>   *
>>   * @vdev: pointer to struct video_device
>> + * @which: type of video device state (from enum video_device_state_whence)
>>   *
>>   * .. note::
>>   *
>>   *	This function is meant to be used only inside the V4L2 core.
>>   */
>>  struct video_device_state *
>> -__video_device_state_alloc(struct video_device *vdev);
>> +__video_device_state_alloc(struct video_device *vdev,
>> +			   enum video_device_state_whence which);
>>  
>>  /** __video_device_state_free - free video device state structure
>>   *
>> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
>> index aad4b3689d7ea191978f24ce24d24cd2e73636b6..55455704a98d0785d0a3418b8a43d7363b7c8aa2 100644
>> --- a/include/media/v4l2-fh.h
>> +++ b/include/media/v4l2-fh.h
>> @@ -28,6 +28,7 @@ struct v4l2_ctrl_handler;
>>   * @vdev: pointer to &struct video_device
>>   * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
>>   * @prio: priority of the file handler, as defined by &enum v4l2_priority
>> + * @state: try state used for format negotiation on the video device
>>   *
>>   * @wait: event' s wait queue
>>   * @subscribe_lock: serialise changes to the subscribed list; guarantee that
>> @@ -44,6 +45,7 @@ struct v4l2_fh {
>>  	struct video_device	*vdev;
>>  	struct v4l2_ctrl_handler *ctrl_handler;
>>  	enum v4l2_priority	prio;
>> +	struct video_device_state *state;
>>  
>>  	/* Events */
>>  	wait_queue_head_t	wait;
>>
> 
> 


