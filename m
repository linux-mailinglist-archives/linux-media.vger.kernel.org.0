Return-Path: <linux-media+bounces-47931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D5FC96A60
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 11:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7DFE034382E
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 10:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C923043C7;
	Mon,  1 Dec 2025 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsiaKfU9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4148D3043A4
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584908; cv=none; b=ZAtrcUD6AmKRVJDxy4IWCCnk1vPxkFUUKkHM7SZVwK3TWtB+cu7ytLCQ0xFRon7SHmngspX1kPuuU0XGZjX9IDOWtTGYwWEJ/AfYRmnYcwcYahx1ZjnoI64YuzCASOkO1mLaXdUUV8lkqt9rTRTOTnN6Jln9VBwR5IS69lWgcek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584908; c=relaxed/simple;
	bh=q0K/UZugDta9PkBOQNFNg+M9B3mcQtp9kEwD7PruyiI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NAN+2TwuBs6nttOxv9XZS2J+G5rVfWOpQYTsBbiau9c61U800GcunIk5Jnc6ZLbfW7ODpwrvbskYwtfUy11MToNc8+9Tj5R1kkw7zR5l3lcsOZbjZuVZ+HAUFw3G9WpWbcXe0j+CXioRQIA7E/zP6BTSRtWBMjjfFIrZj0pJ3VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsiaKfU9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A094C4AF09;
	Mon,  1 Dec 2025 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764584907;
	bh=q0K/UZugDta9PkBOQNFNg+M9B3mcQtp9kEwD7PruyiI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=VsiaKfU93d2LmuiOtwOF5GtpCoGZ0EOki9VsrF+BFyxQ56E93ifvkFg2iZIHapwpD
	 FoAeV+IXrPrvAhYH7C7Gh43lF/ymjbn4SNcsm7OzC7I6haq9KnQQlbGKdDwx8DaLNg
	 mi5if0Svi9R6tS4K+QHVIDzfw2XZ2B6nCR18hNEQofXqiFBu+wKFdXnOObk0D5kCBA
	 L4T/PgyE0+ygLekPjG6vGaPzZHj3yYZqeoG8yq6PzNqqGrnwxpOA8L9ku41LnmpIHH
	 LFwVEVFMSIdhOP2rTVDbKrF8e4NPHCKsYkSEr4aJJAYlqHGMalDxP8fYRzANB16G7X
	 alKcBROqJePZQ==
Message-ID: <b3c22527-7d92-44b0-b7cd-2f1fe2c42a36@kernel.org>
Date: Mon, 1 Dec 2025 11:28:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 09/14] media: omap3isp: better VIDIOC_G/S_PARM handling
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <659149538833acf06f40a5660d03809f9f1c7ef6.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiRLPbzWoW4GFXt@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aPiRLPbzWoW4GFXt@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2025 10:09, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Oct 17, 2025 at 03:26:46PM +0200, Hans Verkuil wrote:
>> Fix various v4l2-compliance errors relating to timeperframe.
>>
>> VIDIOC_G/S_PARM is only supported for Video Output, so disable
>> these ioctls for Capture devices.
>>
>> Ensure numerator and denominator are never 0.
>>
>> Set missing V4L2_CAP_TIMEPERFRAME capability for VIDIOC_S_PARM.
>>
>> v4l2-compliance:
>>
>> 	fail: v4l2-test-formats.cpp(1388): out->timeperframe.numerator == 0 || out->timeperframe.denominator == 0
>> test VIDIOC_G/S_PARM: FAIL
>>
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> ---
>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> index 471defa6e7fb..5603586271f5 100644
>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> @@ -928,7 +928,10 @@ isp_video_set_param(struct file *file, void *fh, struct v4l2_streamparm *a)
>>  
>>  	if (a->parm.output.timeperframe.denominator == 0)
>>  		a->parm.output.timeperframe.denominator = 1;
>> +	if (a->parm.output.timeperframe.numerator == 0)
>> +		a->parm.output.timeperframe.numerator = 1;
> 
> I believe S_PARM support has probably been added for v4l2-compliance in the
> past. Should there be either a dummy implementation for more or less all
> Media device centric drivers or could this be simply omitted?

v4l2-compliance has seen quite a few changes w.r.t. the G/S_PARM tests,
and I think it is fine to just drop support for these ioctls.

I'll test this a bit more, and if I don't find any issues, then I'll
just remove support for these ioctls in omap3isp.

Regards,

	Hans

> 
>>  
>> +	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
>>  	vfh->timeperframe = a->parm.output.timeperframe;
>>  
>>  	return 0;
>> @@ -1413,6 +1416,7 @@ static int isp_video_open(struct file *file)
>>  	handle->format.fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
>>  	isp_video_pix_to_mbus(&handle->format.fmt.pix, &fmt);
>>  	isp_video_mbus_to_pix(video, &fmt, &handle->format.fmt.pix);
>> +	handle->timeperframe.numerator = 1;
>>  	handle->timeperframe.denominator = 1;
>>  
>>  	handle->video = video;
>> @@ -1532,12 +1536,15 @@ int omap3isp_video_init(struct isp_video *video, const char *name)
>>  	video->video.vfl_type = VFL_TYPE_VIDEO;
>>  	video->video.release = video_device_release_empty;
>>  	video->video.ioctl_ops = &isp_video_ioctl_ops;
>> -	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
>>  		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE
>>  					 | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
>> -	else
>> +		v4l2_disable_ioctl(&video->video, VIDIOC_S_PARM);
>> +		v4l2_disable_ioctl(&video->video, VIDIOC_G_PARM);
>> +	} else {
>>  		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT
>>  					 | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
>> +	}
>>  
>>  	video->pipe.stream_state = ISP_PIPELINE_STREAM_STOPPED;
>>  
> 


