Return-Path: <linux-media+bounces-30817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6A5A98E81
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F41D1894DA7
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A3718DB17;
	Wed, 23 Apr 2025 14:53:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDC327055F
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420028; cv=none; b=GCtMv6e0tptWxGYw7oFNAlTNmVlu8uwt6smhi1GkMRjw0S6meUV3HqEq9+YE09vcDhAlFqwuhL+YSXofHPLdPPaLiPjCpUfIfHmtDwGz/NOxYPgLJGaNBmIDy/69kjfJvrTthYiVw4gycqny3Fm7XcXLjDb2Kn+0vytLT5MZGeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420028; c=relaxed/simple;
	bh=z13Lk4P7jrTyvlwMJ6XlLAf9NDPpCbsyPMFVs59lOkw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JEjiCeGoHUlN0Mr1zY1Edx9yZtKn6c9/nYK7SHjNXeFqm9ojiAQ0QI20mwID0ytm2l0B+H8ayVSbtQXVSt4sb9+50tPKiyQMMxOv++5ham6VCwWh74/NGo+ki52IkwdH+OvvPDHMXm3GWNU5/wvpjjuu6IyB+ALgmYIabJxx8Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6331BC4CEE8;
	Wed, 23 Apr 2025 14:53:47 +0000 (UTC)
Message-ID: <4b2aa849-c72b-4ace-8121-d8d490186809@xs4all.nl>
Date: Wed, 23 Apr 2025 16:53:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: omap3isp: drop wait_prepare/finish callbacks
From: Hans Verkuil <hverkuil@xs4all.nl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <218877d9-5f95-42ab-8bbf-2325cb31ed73@xs4all.nl>
 <20250128154040.GF12673@pendragon.ideasonboard.com>
 <f11dab4a-0288-42ae-b6c1-a548206a1249@xs4all.nl>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <f11dab4a-0288-42ae-b6c1-a548206a1249@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 29/01/2025 15:21, Hans Verkuil wrote:
> On 28/01/2025 16:40, Laurent Pinchart wrote:
>> Hi Hans,
>>
>> Thank you for the patch.
>>
>> On Tue, Jan 28, 2025 at 04:08:18PM +0100, Hans Verkuil wrote:
>>> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
>>> are NULL") it is no longer needed to set the wait_prepare/finish
>>> vb2_ops callbacks as long as the lock field in vb2_queue is set.
>>>
>>> Set the queue lock to &video->queue_lock, which makes it possible to drop
>>> the wait_prepare/finish callbacks.
>>>
>>> This simplifies the code and this is a step towards the goal of deleting
>>> these callbacks.
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
>>> ---
>>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 19 +------------------
>>>  1 file changed, 1 insertion(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
>>> index 5c9aa80023fd..78e30298c7ad 100644
>>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
>>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
>>> @@ -480,29 +480,11 @@ static int isp_video_start_streaming(struct vb2_queue *queue,
>>>  	return 0;
>>>  }
>>>
>>> -static void omap3isp_wait_prepare(struct vb2_queue *vq)
>>> -{
>>> -	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
>>> -	struct isp_video *video = vfh->video;
>>> -
>>> -	mutex_unlock(&video->queue_lock);
>>> -}
>>> -
>>> -static void omap3isp_wait_finish(struct vb2_queue *vq)
>>> -{
>>> -	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
>>> -	struct isp_video *video = vfh->video;
>>> -
>>> -	mutex_lock(&video->queue_lock);
>>> -}
>>> -
>>>  static const struct vb2_ops isp_video_queue_ops = {
>>>  	.queue_setup = isp_video_queue_setup,
>>>  	.buf_prepare = isp_video_buffer_prepare,
>>>  	.buf_queue = isp_video_buffer_queue,
>>>  	.start_streaming = isp_video_start_streaming,
>>> -	.wait_prepare = omap3isp_wait_prepare,
>>> -	.wait_finish = omap3isp_wait_finish,
>>>  };
>>>
>>>  /*
>>> @@ -1338,6 +1320,7 @@ static int isp_video_open(struct file *file)
>>>  	queue->buf_struct_size = sizeof(struct isp_buffer);
>>>  	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>>  	queue->dev = video->isp->dev;
>>> +	queue->lock = &video->queue_lock;
>>
>> This is goind to deadlock at least when calling VIDIOC_DQBUF in blocking
>> mode.
> 
> Yeah, you are right. I think I will need to test this on real hardware.
> 
> That will take some time.

So I finally managed to test this patch on my BeagleBoard Xm, and it
works fine.

The reason it works is that the queue pointer in struct video_device
is never set.

Normally v4l2_ioctl_get_lock() in v4l2-ioctl.c tries to return the
vdev->queue->lock, and that would indeed cause a deadlock (the core
takes that lock, then isp_video_dqbuf() takes it again). But omap3isp
never sets vdev->queue nor does it set vdev->lock. So v4l2_ioctl_get_lock()
returns a NULL pointer instead, meaning that the core won't do any
locking.

So I think this patch is good.

That said, I had to fix a lot of other issues and even with that all I
capture is only 0 values. It has a severe case of bitrot :-(

I plan to post my fixes when I have some more time.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>>>
>>>  	ret = vb2_queue_init(&handle->queue);
>>>  	if (ret < 0) {
>>
> 
> 


