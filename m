Return-Path: <linux-media+bounces-36293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D73AEDEDA
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C2397A5164
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D4828643C;
	Mon, 30 Jun 2025 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qiZU2hig"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AD425A32C;
	Mon, 30 Jun 2025 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289717; cv=none; b=hqe8rKtN++rjw9siN42lm0RJgJOO6/7+fwgj/+MLlp2VH2bSsjGRhX5HW2o0B6mQyxxULwhiPKvzA+2pcGe2p1ExLx2b0e+OYpW0srbB4ZY6j3LTcQAUTsPpvUqSJQfV6kBubM5kHzDYIzb0f5Jm+9bc5zFePAx2R+Ep1lxZAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289717; c=relaxed/simple;
	bh=3yMBCPTuS/l6omIAvTwcC7MGrMhRvoP2UInGJJ5GhjE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=t4b2OHOF0k4D3VaebCMJeqDizePQLIGCIvvbF3AE0CZhEy+M3Czelml4v4u1tTzqOEFJVtTO08/WMvGNEZTyhEBfl+40XGinBf75pVzxC1F+HnGbyl5yV/OIg0atQj5beTafDUNDt0r18R2g3ypnYawiN7AA4rQJaXoNzxJlnWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qiZU2hig; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79F2C4CEE3;
	Mon, 30 Jun 2025 13:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751289717;
	bh=3yMBCPTuS/l6omIAvTwcC7MGrMhRvoP2UInGJJ5GhjE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=qiZU2higmNr3YU1RA0OeGd/CaGK0pSV13XxOzV/+L16A/R6jyulCv3DuXESJ65/8D
	 h6mGVnAowlkLxUliyA5EmyMe8R3kHRMxtP9veO6YC94oZDFBCvdUUWJRguKWgwa79D
	 R3jDAOUbP5GDtu4px+ZUZAK+DUocxDySYn6vYqWd+P1unejJA3U/1hO3+fmLQ96MUG
	 fIGkpgSxhz+vdRYTbqVZEAP+N95WfxnjPuPJtHghVEkVGBY42dR1ztZk4waZl7KRAT
	 xCDuFXvoj0vZIgro0w5dmnI8N1J7mJyXYTrHI/wd8aEVZH1Vc0CiFK/xzFtjotuuax
	 zMPUG5gRt1+uw==
Message-ID: <6f6c7a57-7d51-4902-8ece-c661427f2290@kernel.org>
Date: Mon, 30 Jun 2025 15:21:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert
 PM logic
From: Hans de Goede <hansg@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans@jjverkuil.nl>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
 <20250602-uvc-grannular-invert-v2-7-c871934ad880@chromium.org>
 <ba461646-c639-4e66-9f6d-c34f59d39f82@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <ba461646-c639-4e66-9f6d-c34f59d39f82@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16-Jun-25 4:14 PM, Hans de Goede wrote:
> Hi,
> 
> On 2-Jun-25 15:06, Ricardo Ribalda wrote:
>> Instead of listing the IOCTLs that do not need to turn on the camera,
>> list the IOCTLs that need to turn it on. This makes the code more
>> maintainable.
>>
>> This patch changes the behaviour for unsupported IOCTLs. Those IOCTLs
>> will not turn on the camera.
>>
>> Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/usb/uvc/uvc_v4l2.c | 61 ++++++++++++++++++++++++----------------
>>  1 file changed, 36 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>> index 020def11b60e00ca2875dd96f23ef9591fed11d9..13388879091c46ff74582226146521b5b5eb3d10 100644
>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>> @@ -1219,43 +1219,54 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>>  }
>>  #endif
>>  
>> -static long uvc_v4l2_unlocked_ioctl(struct file *file,
>> -				    unsigned int cmd, unsigned long arg)
>> +static long uvc_v4l2_pm_ioctl(struct file *file,
>> +			      unsigned int cmd, unsigned long arg)
>>  {
>>  	struct uvc_fh *handle = file->private_data;
>>  	int ret;
>>  
>> -	/* The following IOCTLs do not need to turn on the camera. */
> 
> s/do need/need/

Actually this review-remark belongs to when this comment is re-added
below ...

>> -	switch (cmd) {
>> -	case UVCIOC_CTRL_MAP:
>> -	case VIDIOC_CREATE_BUFS:
>> -	case VIDIOC_DQBUF:
>> -	case VIDIOC_ENUM_FMT:
>> -	case VIDIOC_ENUM_FRAMEINTERVALS:
>> -	case VIDIOC_ENUM_FRAMESIZES:
>> -	case VIDIOC_ENUMINPUT:
>> -	case VIDIOC_EXPBUF:
>> -	case VIDIOC_G_FMT:
>> -	case VIDIOC_G_PARM:
>> -	case VIDIOC_G_SELECTION:
>> -	case VIDIOC_QBUF:
>> -	case VIDIOC_QUERYCAP:
>> -	case VIDIOC_REQBUFS:
>> -	case VIDIOC_SUBSCRIBE_EVENT:
>> -	case VIDIOC_UNSUBSCRIBE_EVENT:
>> -		return video_ioctl2(file, cmd, arg);
>> -	}
>> -
>>  	ret = uvc_pm_get(handle->stream->dev);
>>  	if (ret)
>>  		return ret;
>> -
>>  	ret = video_ioctl2(file, cmd, arg);
>> -
>>  	uvc_pm_put(handle->stream->dev);
>> +
>>  	return ret;
>>  }
>>  
>> +static long uvc_v4l2_unlocked_ioctl(struct file *file,
>> +				    unsigned int cmd, unsigned long arg)
>> +{
>> +	/*
>> +	 * For now, we do not support granular power saving for compat
>> +	 * syscalls.
>> +	 */
>> +	if (in_compat_syscall())
>> +		return uvc_v4l2_pm_ioctl(file, cmd, arg);
>> +
>> +	/* The following IOCTLs do need to turn on the camera. */

So the 's/do need/need/' should be done here. I can fix this
up while merging. All that is necessary to merge this is an
ack from Hans V for merging the EXPORT in the core through
the UVC git tree.

Regards,

Hans



>> +	switch (cmd) {
>> +	case UVCIOC_CTRL_QUERY:
>> +	case VIDIOC_G_CTRL:
>> +	case VIDIOC_G_EXT_CTRLS:
>> +	case VIDIOC_G_INPUT:
>> +	case VIDIOC_QUERYCTRL:
>> +	case VIDIOC_QUERYMENU:
>> +	case VIDIOC_QUERY_EXT_CTRL:
>> +	case VIDIOC_S_CTRL:
>> +	case VIDIOC_S_EXT_CTRLS:
>> +	case VIDIOC_S_FMT:
>> +	case VIDIOC_S_INPUT:
>> +	case VIDIOC_S_PARM:
>> +	case VIDIOC_TRY_EXT_CTRLS:
>> +	case VIDIOC_TRY_FMT:
>> +		return uvc_v4l2_pm_ioctl(file, cmd, arg);
>> +	}
>> +
>> +	/* The other IOCTLs can run with the camera off. */
>> +	return video_ioctl2(file, cmd, arg);
>> +}
>> +
>>  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>>  	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
>>  	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
>>
> 


