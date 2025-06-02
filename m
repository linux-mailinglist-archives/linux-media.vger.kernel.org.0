Return-Path: <linux-media+bounces-33924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFA4ACAF70
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704863A66AE
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4879221D92;
	Mon,  2 Jun 2025 13:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="gaPv0om2"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60657221299;
	Mon,  2 Jun 2025 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872081; cv=none; b=LU+TGRPFXGB2v7w4V4TCjmfm3En1FJParF6Oj965XoI2N3NECAeT8t89hawc7pbfYbl8OdLG5U3v/eL90tH5QeoyLuWKu2UVLx5k1QUT49WQN29QTKAE673r/lsTvXn5vVagU156DTPs3icl8yLfE5kAFmL7DjWNj2iCPLC74hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872081; c=relaxed/simple;
	bh=jh6sp8yEoBWXqMSdYh8GthfiY/y2+q/aL1bRjpORBfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gHbphuD39BeUNaYoFGRj0UpoFj0d97wmb20n6UIfOXwBgXWUQ4Y9+GueIYY5oQQkcru+KnuMJYhpr9T3N5FZFKiGS04uOVv7NY+G2SZKkccGLscmLy/W/bJUUHJW8w8KXeZPa/LBFoMjfiDvg5lnx4E+EUom5QZA23YNLHahQ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=gaPv0om2; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4b9wCC49dyzTsl;
	Mon,  2 Jun 2025 13:47:51 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4b9wCC1HJxz1f;
	Mon,  2 Jun 2025 13:47:51 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=gaPv0om2;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1748872071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Fe9cc4padmfbj+a80tjLpu23kvoa2LIP9bxKzlF6CQA=;
	b=gaPv0om2pDa2jTa5sXAQyDYABHk/vYRsnAV29AK9fWLmvnOpF5GMCinZpGIhQA0WD7lDkG
	ziHW0S7wjwmHZJYbFb7rfnkIb0KPCtr/14Fmt8Lm+i3OgV+Oq8cc5gSjNGiLFoqwO/5NgT
	a3zP2OS3WHD+LffMIZGw5Dcb6HCq1zutX+2COGyhAWxIxzur5RTxrGJkjmCbn9MOjENVCd
	lUrEw6j6miIGALFYhZbXkupORXcnu7hcjGB+RbFcBork70MM+ekuFCcvnuhfIQicUXsNjb
	PIctr8oYx69GAkJ7ADZob7fd9Z1lDP3+1DPg7IT8gDXRt4nGQ4cc6AYsBsvYzQ==
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=683dab87 a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=WN6_cwnCAAAA:8 a=cm27Pg_UAAAA:8 a=TWJJUB2xWuKRb4FTZK4A:9 a=QEXdDO2ut3YA:10 a=ndfOWLLM0rR49n6Yv1rF:22
X-CM-Envelope: MS4xfPp6KTjpIvxUUanrWCDdvw8iIdpyT+DYYZ00zcDjzuEEA20SRU28ZW4J0tbApJLKp0G1JwTdHm1b67jbd0pKoS+5j64kPuqx3Lh06sW3VeXqKga9yEmk F6Caq5uuuVt4HPOk6bJTSrPmJHIbyaYJu0lJDfa4XiGTYwsZTfL54mqyZ1nPOYLdFuWWFMY75uZLzgqOSkquJK2wV2r4yExtUY9dvgGH/S1BMXsfhQQwbWgQ ojN3v3vyQ3HxP26XxSHys1G27hchRr9NfoXjs9YVMqNqqYbe5o7dutQdhcPUr8m6QCgEbGZ6trWIeZwgWRKp47y4Curw/kzFydLeMO1q9WxDApgA7bwvQe9Q RXux/e3OYZyUI+LBRxK/qKcezvIfeg==
Message-ID: <663123d4-9ac4-4c8d-bc88-d4e197786199@jjverkuil.nl>
Date: Mon, 2 Jun 2025 15:47:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Remove stream->is_streaming field
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
 <20250602-uvc-fop-v2-3-508a293eae81@chromium.org>
 <dba66347-7b6c-49b5-8d31-166845efd1a0@jjverkuil.nl>
 <CANiDSCttXAu0bJHG7L=Y4Y0LqfRQa=Y-wC8PKr1Pv7Hwpq6Txg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <CANiDSCttXAu0bJHG7L=Y4Y0LqfRQa=Y-wC8PKr1Pv7Hwpq6Txg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 02/06/2025 15:33, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 2 Jun 2025 at 15:23, Hans Verkuil <hans@jjverkuil.nl> wrote:
>>
>> On 02/06/2025 14:59, Ricardo Ribalda wrote:
>>> The is_streaming field is used by modular PM to know if the device is
>>> currently streaming or not.
>>>
>>> With the transition to vb2 and fop helpers, we can use vb2 functions for
>>> the same functionality. The great benefit is that vb2 already takes
>>> track of the streaming state for us.
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/usb/uvc/uvc_queue.c | 11 ++++++++-
>>>  drivers/media/usb/uvc/uvc_v4l2.c  | 51 ++-------------------------------------
>>>  drivers/media/usb/uvc/uvcvideo.h  |  1 -
>>>  3 files changed, 12 insertions(+), 51 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
>>> index 72c5494dee9f46ff61072e7d293bfaddda40e615..dff93bec204428b8aebc09332e0322fa68823fa4 100644
>>> --- a/drivers/media/usb/uvc/uvc_queue.c
>>> +++ b/drivers/media/usb/uvc/uvc_queue.c
>>> @@ -165,12 +165,18 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
>>>
>>>       lockdep_assert_irqs_enabled();
>>>
>>> +     ret = uvc_pm_get(stream->dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>>       queue->buf_used = 0;
>>>
>>>       ret = uvc_video_start_streaming(stream);
>>
>> I'm not sure this is correct. See comments below.
>>
>>>       if (ret == 0)
>>>               return 0;
>>>
>>> +     uvc_pm_put(stream->dev);
>>> +
>>>       spin_lock_irq(&queue->irqlock);
>>>       uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
>>>       spin_unlock_irq(&queue->irqlock);
>>> @@ -181,11 +187,14 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
>>>  static void uvc_stop_streaming(struct vb2_queue *vq)
>>>  {
>>>       struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>>> +     struct uvc_streaming *stream = uvc_queue_to_stream(queue);
>>>
>>>       lockdep_assert_irqs_enabled();
>>>
>>> -     if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
>>> +     if (vq->type != V4L2_BUF_TYPE_META_CAPTURE) {
>>> +             uvc_pm_put(stream->dev);
>>
>> This doesn't look right, for both video and metadata uvc_pm_get is called,
>> but only for video is put called.
> 
> Please take a look at
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_queue.c#n195
> 
> start_streaming is not called for metadata nodes, only for video nodes.

So when you start streaming metadata and no video is streaming, then nothing
happens. I noticed this before, in fact. Only after you also start to stream
video will the metadata start to arrive. And it stops again as soon as you
stop streaming video.

That's not really how it is supposed to work: whoever starts streaming first
is the one that calls uvc_video_start_streaming. And only when nobody is streaming
should uvc_video_stop_streaming be called. That's how it works in other drivers
(e.g. those that stream both video and vbi, or even more different types of data).

Fixing this would change the behavior of uvc, and I'm not sure if this is
something we want. I leave that to Laurent and Hans.

If this isn't fixed, then at least add a comment explaining why you test for
!= V4L2_BUF_TYPE_META_CAPTURE before calling uvc_pm_put. It's not obvious.

Regards,

	Hans

> 
> 
> 
>>
>>>               uvc_video_stop_streaming(uvc_queue_to_stream(queue));
>>
>> And this is odd too.
>>
>>> +     }
>>
>> My assumption is that uvc_video_start_streaming and uvc_video_stop_streaming
>> are valid for both video and meta: i.e. the first time you start streaming
>> (either video or meta) you call uvc_video_start_streaming. If you were already
>> streaming for e.g. video, then start streaming metadata (or vice versa), then
>> you don't need to do anything in start_streaming.
>>
>> Same for stop_streaming: only if both video and metadata stopped streaming
>> is uvc_video_stop_streaming called.
>>
>> Please correct me if I am wrong.
>>
>> In any case, if I am right, then you have to rework this code accordingly.
>>
>> Regardless, you need to test various sequences of streaming video and metadata
>> in different orders and make sure this is handled correctly.
> 
> I have tried streaming and getting frames. After some seconds the
> device turns off as expected.
> 
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>>       spin_lock_irq(&queue->irqlock);
>>>       uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>> index 7a5ecbefa32c0a6b74c85d7f77a25b433598471e..d4bee0d4334b764c0cf02363b573b55fb44eb228 100644
>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>> @@ -617,9 +617,6 @@ static int uvc_v4l2_release(struct file *file)
>>>
>>>       uvc_ctrl_cleanup_fh(handle);
>>>
>>> -     if (handle->is_streaming)
>>> -             uvc_pm_put(stream->dev);
>>> -
>>>       /* Release the file handle. */
>>>       vb2_fop_release(file);
>>>       file->private_data = NULL;
>>> @@ -677,50 +674,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
>>>       return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
>>>  }
>>>
>>> -static int uvc_ioctl_streamon(struct file *file, void *fh,
>>> -                           enum v4l2_buf_type type)
>>> -{
>>> -     struct uvc_fh *handle = fh;
>>> -     struct uvc_streaming *stream = handle->stream;
>>> -     int ret;
>>> -
>>> -     if (handle->is_streaming)
>>> -             return 0;
>>> -
>>> -     ret = uvc_pm_get(stream->dev);
>>> -     if (ret)
>>> -             return ret;
>>> -
>>> -     ret = vb2_ioctl_streamon(file, fh, type);
>>> -     if (ret) {
>>> -             uvc_pm_put(stream->dev);
>>> -             return ret;
>>> -     }
>>> -
>>> -     handle->is_streaming = true;
>>> -
>>> -     return 0;
>>> -}
>>> -
>>> -static int uvc_ioctl_streamoff(struct file *file, void *fh,
>>> -                            enum v4l2_buf_type type)
>>> -{
>>> -     struct uvc_fh *handle = fh;
>>> -     struct uvc_streaming *stream = handle->stream;
>>> -     int ret;
>>> -
>>> -     ret = vb2_ioctl_streamoff(file, fh, type);
>>> -     if (ret)
>>> -             return ret;
>>> -
>>> -     if (handle->is_streaming) {
>>> -             handle->is_streaming = false;
>>> -             uvc_pm_put(stream->dev);
>>> -     }
>>> -
>>> -     return 0;
>>> -}
>>> -
>>>  static int uvc_ioctl_enum_input(struct file *file, void *fh,
>>>                               struct v4l2_input *input)
>>>  {
>>> @@ -1323,8 +1276,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>>>       .vidioc_expbuf = vb2_ioctl_expbuf,
>>>       .vidioc_dqbuf = vb2_ioctl_dqbuf,
>>>       .vidioc_create_bufs = vb2_ioctl_create_bufs,
>>> -     .vidioc_streamon = uvc_ioctl_streamon,
>>> -     .vidioc_streamoff = uvc_ioctl_streamoff,
>>> +     .vidioc_streamon = vb2_ioctl_streamon,
>>> +     .vidioc_streamoff = vb2_ioctl_streamoff,
>>>       .vidioc_enum_input = uvc_ioctl_enum_input,
>>>       .vidioc_g_input = uvc_ioctl_g_input,
>>>       .vidioc_s_input = uvc_ioctl_s_input,
>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>> index 3ddbf065a2cbae40ee48cb06f84ca8f0052990c4..f895f690f7cdc1af942d5f3a5f10e9dd1c956a35 100644
>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>> @@ -626,7 +626,6 @@ struct uvc_fh {
>>>       struct uvc_video_chain *chain;
>>>       struct uvc_streaming *stream;
>>>       unsigned int pending_async_ctrls;
>>> -     bool is_streaming;
>>>  };
>>>
>>>  /* ------------------------------------------------------------------------
>>>
>>
> 
> 


