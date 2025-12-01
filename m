Return-Path: <linux-media+bounces-47923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A44C963E5
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 09:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E03244E1022
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 08:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772BB2F9984;
	Mon,  1 Dec 2025 08:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzNxZZwj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF5B2DCBF4
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764578924; cv=none; b=bP06M89WRaUXjFO7+uyHL/B5f8vMItZrqAhi4k7+JuRKx0YCEGUJbh51QU3RDxoK13o/Eu6ovrIAfnW8EygbC0MdiMyexwBuH/PHFiosMecGWvdJiuvO2K3xgiaC/Kk3SWsLbyNwEwBPwarAsL5GWBsU7cb+ZqVHgtxhtx6sZeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764578924; c=relaxed/simple;
	bh=FREY06SM97fPSKmgsAQQXK/OkyTiQNCpktgDwUwbuS4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QDDN064EMtAB83k+LsThi3J6Jcywvdn2SMcRYAAwpB/UiqhnhYSYNT+uLHZxYWfTF31l8YYcxkrVmIqRayBGNtrvd+R44Ix03d7Fvz/P8/DkVLyTr+HM6koQhWdNYWFrowsry8Gh91KdE5cbZeRh/OPSCphnbd01IMR7vEWvlbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzNxZZwj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB22C4CEF1;
	Mon,  1 Dec 2025 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764578924;
	bh=FREY06SM97fPSKmgsAQQXK/OkyTiQNCpktgDwUwbuS4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=MzNxZZwjhK++p6R790089rz7nF63UFUlk8YXMxCvBteuJIC66m8PIZYCvk7Yizn4f
	 vV9FKXfLnk8XNMJOV4Ur7/O6J6RW9dVhVYwIcaFiK78NUSHa+FwhUOGobfSGw3lJcT
	 jBYGWKvga1jFk5vazO+NqqEun4PDp9Wvnl0AgrilNH6cmHoeP0sm6JXFJzO0Z/ZARH
	 ERu4nSE3Ine1V38b/jMeNZEh6ABan5AR09UhPwNN6DNfg1Gm0m18eDbBoHk7TJRyJA
	 s+2Lyb9cK2BezO11skA/40NW4OFsS2+I8T4yTibMJh3wrecc1/51pntD/bdM+nPeMa
	 lrXKGhettqHsQ==
Message-ID: <7beb5330-10a7-485b-ba55-dca70f990073@kernel.org>
Date: Mon, 1 Dec 2025 09:48:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 07/14] media: omap3isp: rework isp_video_try/set_format
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <679d80346bef43fab642342ab9de407c132b62ed.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiQAwEa4_fN-LIt@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aPiQAwEa4_fN-LIt@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2025 10:04, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Oct 17, 2025 at 03:26:44PM +0200, Hans Verkuil wrote:
>> isp_video_set_format now calls isp_video_try_format first, ensuring
>> consistent behavior and removing duplicate code in both functions.
>>
>> This fixes an v4l2-compliance error:
>>
>> 	fail: v4l2-test-formats.cpp(519): !pix.sizeimage
>> test VIDIOC_S_FMT: FAIL
>>
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> ---
>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 60 +++++++++----------
>>  1 file changed, 30 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> index d3fe28506fb0..69d17e4dcd36 100644
>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> @@ -701,11 +701,15 @@ isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
>>  }
>>  
>>  static int
>> -isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
>> +isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
>>  {
>> -	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
>>  	struct isp_video *video = video_drvdata(file);
>> -	struct v4l2_mbus_framefmt fmt;
>> +	struct v4l2_subdev_format fmt = {
>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> +	};
>> +	struct v4l2_subdev *subdev;
>> +	u32 pad;
>> +	int ret;
>>  
>>  	if (format->type != video->type)
>>  		return -EINVAL;
>> @@ -745,32 +749,11 @@ isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
>>  		break;
>>  	}
>>  
>> -	/* Fill the bytesperline and sizeimage fields by converting to media bus
>> -	 * format and back to pixel format.
>> -	 */
>> -	isp_video_pix_to_mbus(&format->fmt.pix, &fmt);
>> -	isp_video_mbus_to_pix(video, &fmt, &format->fmt.pix);
>> -
>> -	mutex_lock(&video->mutex);
>> -	vfh->format = *format;
>> -	mutex_unlock(&video->mutex);
>> -
>> -	return 0;
>> -}
>> -
>> -static int
>> -isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
>> -{
>> -	struct isp_video *video = video_drvdata(file);
>> -	struct v4l2_subdev_format fmt = {
>> -		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> -	};
>> -	struct v4l2_subdev *subdev;
>> -	u32 pad;
>> -	int ret;
>> -
>> -	if (format->type != video->type)
>> -		return -EINVAL;
>> +	if (video->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
>> +		isp_video_pix_to_mbus(&format->fmt.pix, &fmt.format);
>> +		isp_video_mbus_to_pix(video, &fmt.format, &format->fmt.pix);
>> +		return 0;
>> +	}
>>  
>>  	subdev = isp_video_remote_subdev(video, &pad);
>>  	if (subdev == NULL)
>> @@ -781,12 +764,29 @@ isp_video_try_format(struct file *file, void *fh, struct v4l2_format *format)
>>  	fmt.pad = pad;
>>  	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>>  	if (ret)
>> -		return ret == -ENOIOCTLCMD ? -ENOTTY : ret;
>> +		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
> 
> I believe -ENOTTY was right. Yet this should not happen (albeit I haven't
> checked) as all omap3isp sub-device drivers with connected video devices
> presumably implement get_fmt.

If this returns -ENOTTY, then that indicates that the TRY_FMT ioctl is not supported.
But that's not the case, it is, but something else is wrong.

Given the fact that this function also returns -EINVAL if subdev == NULL,
I don't think returning -ENOTTY is the right thing to do.

An alternative to -EINVAL might be to return -ENODEV if subdev == NULL or the
get_fmt op is not present.

> 
>>  
>>  	isp_video_mbus_to_pix(video, &fmt.format, &format->fmt.pix);
>>  	return 0;
>>  }
>>  
>> +static int
>> +isp_video_set_format(struct file *file, void *fh, struct v4l2_format *format)
>> +{
>> +	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
>> +	struct isp_video *video = video_drvdata(file);
>> +	int ret = isp_video_try_format(file, fh, format);
> 
> I'd do this assignment separately: initialising variables in declaration
> that requires error handling isn't very nice.

OK.

Regards,

	Hans

> 
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	mutex_lock(&video->mutex);
>> +	vfh->format = *format;
>> +	mutex_unlock(&video->mutex);
>> +
>> +	return 0;
>> +}
>> +
>>  static int
>>  isp_video_get_selection(struct file *file, void *fh, struct v4l2_selection *sel)
>>  {
> 


