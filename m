Return-Path: <linux-media+bounces-19802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88B9A25B3
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 16:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF4E6284F5D
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 14:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021BB1DE8AC;
	Thu, 17 Oct 2024 14:56:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5BF1DE8A1
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729177017; cv=none; b=AF56ar9k5Lh+cp3zPYjLZDrDD+mGFIaojL7UOtsKIwz8hXf/FHmcDKhSr9R+3RtQrhHKS/HnjZQeQujDUrop9kdmtwOSygfrFn5cHRVF8h+DyvdexFMrZQ1k7cfTgtMH4dk0vXBQWIJCrscytxq5K/LAoJva2MPOdJGKltn1080=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729177017; c=relaxed/simple;
	bh=2V4q7hEcIh/Z2LgSZ6XzgkUBu/BGJ/R5XX1alre7BEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V064DcboKMU2mqf7mjhw+WtFtWvg9u6eqLEmrOpRh5ISlCSWQcYwRDyUoDgoZXsFotCxAj0WB/RKPZvdSENZMvOArWmKvTI+KUZHNrfoPoppD1SXF/UamFe0uMC2xGkjfficBMcHRHe9o27nn70gXpLxTV+848lf/hYEbRQxg+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933C2C4CEC3;
	Thu, 17 Oct 2024 14:56:56 +0000 (UTC)
Message-ID: <24488e90-1f50-4330-be0a-a54a93d15551@xs4all.nl>
Date: Thu, 17 Oct 2024 16:56:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] media: uvc: ensure video device entities have a
 unique name
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <69d2363e-49bb-4c7f-9c91-6a22b0c6e9e3@xs4all.nl>
 <CANiDSCv94bauTR2dLZu1okyX71c-8xH_7r+-624Reca=WrsZEQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CANiDSCv94bauTR2dLZu1okyX71c-8xH_7r+-624Reca=WrsZEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/10/2024 16:48, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Thu, 17 Oct 2024 at 18:25, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> The video device names (also used as entity names) are identical
>> for the video capture and metadata capture devices.
>>
>> This series ensures that the video device names are unique.
>>
>> It also fixes a bug where a metadata device would be created
>> for video output devices, but that's for video capture devices
>> only.
> You probably want to split that fix in a separate patch, but be aware
> that there might be userspace depending on the extra metadata device
> :(
> 
>>
>> This fixes a compliance failure when running
>> 'v4l2-compliance -M /dev/mediaX'.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>> RFC for now.
>>
>> Based on the code I assume one UVC device can have multiple
>> capture and/or output devices, so I added an instance index.
> 
> I believe we tried something similar and we ended up reverting it :(
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f66dcb32af19faf49cc4a9222c3152b10c6ec84a
> 
> Maybe, as you suggest, dropping the Cap prefix for the first inst is
> enough, if my memory is correct I think I also tried with that but we
> ended up abandoning the patch
> https://lore.kernel.org/linux-media/20220920-resend-meta-v5-0-3385df697370@chromium.org/
> https://lore.kernel.org/linux-media/Y6OP%2Fqz9R4BgXi4o@pendragon.ideasonboard.com/
>>
>> But I may be wrong about that.
>>
>> I also assume that there is no metadata for UVC video outputs.
>>
>> It might also be safer to drop the 'Cap0 ' prefix if inst == 0,
>> just in case someone relies on the name.

Right, the suggestion was to try to just fix the entity name, so I'll
see if I can figure out how to do this.

Regards,

	Hans

>> ---
>>  drivers/media/usb/uvc/uvc_driver.c   | 34 +++++++++++++++++++---------
>>  drivers/media/usb/uvc/uvc_metadata.c |  4 ++--
>>  drivers/media/usb/uvc/uvcvideo.h     |  3 ++-
>>  3 files changed, 27 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>> index ab9cdb50e74e..59e5769166f2 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -1956,6 +1956,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
>>
>>  int uvc_register_video_device(struct uvc_device *dev,
>>                               struct uvc_streaming *stream,
>> +                             unsigned int inst,
>>                               struct video_device *vdev,
>>                               struct uvc_video_queue *queue,
>>                               enum v4l2_buf_type type,
>> @@ -1990,17 +1991,18 @@ int uvc_register_video_device(struct uvc_device *dev,
>>         case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>>         default:
>>                 vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
>> +               snprintf(vdev->name, sizeof(vdev->name), "Cap%u %s", inst, dev->name);
>>                 break;
>>         case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>>                 vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
>> +               snprintf(vdev->name, sizeof(vdev->name), "Out%u %s", inst, dev->name);
>>                 break;
>>         case V4L2_BUF_TYPE_META_CAPTURE:
>>                 vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
>> +               snprintf(vdev->name, sizeof(vdev->name), "Meta%u %s", inst, dev->name);
>>                 break;
>>         }
>>
>> -       strscpy(vdev->name, dev->name, sizeof(vdev->name));
>> -
>>         /*
>>          * Set the driver data before calling video_register_device, otherwise
>>          * the file open() handler might race us.
>> @@ -2020,7 +2022,7 @@ int uvc_register_video_device(struct uvc_device *dev,
>>  }
>>
>>  static int uvc_register_video(struct uvc_device *dev,
>> -               struct uvc_streaming *stream)
>> +               struct uvc_streaming *stream, unsigned int inst)
>>  {
>>         int ret;
>>
>> @@ -2041,7 +2043,7 @@ static int uvc_register_video(struct uvc_device *dev,
>>         uvc_debugfs_init_stream(stream);
>>
>>         /* Register the device with V4L. */
>> -       return uvc_register_video_device(dev, stream, &stream->vdev,
>> +       return uvc_register_video_device(dev, stream, inst, &stream->vdev,
>>                                          &stream->queue, stream->type,
>>                                          &uvc_fops, &uvc_ioctl_ops);
>>  }
>> @@ -2054,9 +2056,13 @@ static int uvc_register_terms(struct uvc_device *dev,
>>  {
>>         struct uvc_streaming *stream;
>>         struct uvc_entity *term;
>> +       unsigned int inst_cap = 0;
>> +       unsigned int inst_out = 0;
>>         int ret;
>>
>>         list_for_each_entry(term, &chain->entities, chain) {
>> +               bool is_capture;
>> +
>>                 if (UVC_ENTITY_TYPE(term) != UVC_TT_STREAMING)
>>                         continue;
>>
>> @@ -2069,16 +2075,22 @@ static int uvc_register_terms(struct uvc_device *dev,
>>                 }
>>
>>                 stream->chain = chain;
>> -               ret = uvc_register_video(dev, stream);
>> +               is_capture = stream->type == V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +               ret = uvc_register_video(dev, stream,
>> +                                        is_capture ? inst_cap : inst_out);
>>                 if (ret < 0)
>>                         return ret;
>>
>> -               /*
>> -                * Register a metadata node, but ignore a possible failure,
>> -                * complete registration of video nodes anyway.
>> -                */
>> -               uvc_meta_register(stream);
>> -
>> +               if (is_capture) {
>> +                       /*
>> +                        * Register a metadata node, but ignore a possible failure,
>> +                        * complete registration of video nodes anyway.
>> +                        */
>> +                       uvc_meta_register(stream, inst_cap);
>> +                       inst_cap++;
>> +               } else {
>> +                       inst_out++;
>> +               }
>>                 term->vdev = &stream->vdev;
>>         }
>>
>> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
>> index 82de7781f5b6..685182302602 100644
>> --- a/drivers/media/usb/uvc/uvc_metadata.c
>> +++ b/drivers/media/usb/uvc/uvc_metadata.c
>> @@ -156,7 +156,7 @@ static const struct v4l2_file_operations uvc_meta_fops = {
>>         .mmap = vb2_fop_mmap,
>>  };
>>
>> -int uvc_meta_register(struct uvc_streaming *stream)
>> +int uvc_meta_register(struct uvc_streaming *stream, unsigned int inst)
>>  {
>>         struct uvc_device *dev = stream->dev;
>>         struct video_device *vdev = &stream->meta.vdev;
>> @@ -170,7 +170,7 @@ int uvc_meta_register(struct uvc_streaming *stream)
>>          */
>>         vdev->queue = &queue->queue;
>>
>> -       return uvc_register_video_device(dev, stream, vdev, queue,
>> +       return uvc_register_video_device(dev, stream, inst, vdev, queue,
>>                                          V4L2_BUF_TYPE_META_CAPTURE,
>>                                          &uvc_meta_fops, &uvc_meta_ioctl_ops);
>>  }
>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>> index 07f9921d83f2..92c72ef6ea49 100644
>> --- a/drivers/media/usb/uvc/uvcvideo.h
>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>> @@ -738,10 +738,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>>  void uvc_video_clock_update(struct uvc_streaming *stream,
>>                             struct vb2_v4l2_buffer *vbuf,
>>                             struct uvc_buffer *buf);
>> -int uvc_meta_register(struct uvc_streaming *stream);
>> +int uvc_meta_register(struct uvc_streaming *stream, unsigned int inst);
>>
>>  int uvc_register_video_device(struct uvc_device *dev,
>>                               struct uvc_streaming *stream,
>> +                             unsigned int inst,
>>                               struct video_device *vdev,
>>                               struct uvc_video_queue *queue,
>>                               enum v4l2_buf_type type,
>> --
>> 2.43.0
>>
>>
> 
> 


