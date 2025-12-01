Return-Path: <linux-media+bounces-47924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2999AC96436
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 09:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F7844E1058
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 08:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40B42FCC16;
	Mon,  1 Dec 2025 08:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4AyL1Bk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B82E3B0D
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 08:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764579293; cv=none; b=RC7ly+4WIRPhhStoijRWX/yac1piznW74em6278WsiUFM9vK8WVwwgIFI5e1CdyeBHht1btHCvX0s3zK/AaiNjOePcGZbQd326CiB+OiiUMnpP2pmPGkVIQidTxV2x9qdEAdtkCdTPeOqyRG3HrPnyqsLAaW7U7rMo7FWBbXbzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764579293; c=relaxed/simple;
	bh=BO5x05QTMx0LB+GhiJgKoO99qfi4CVdra5MFbtS4Twk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HTxPaInc/uyja/MH48H0MJ9epvgoI9k3JxOgYhx7MSq/t/frJ1Uzi4O8STeQZZVkhAkU+siruevh4+zg6gXJBTjw8r0uHxgYRjxUD0B6DurS+tOL6hgfmY26oPxOKpYPeUhPP68W1y5Ipi2Oe62pF+iR+koFEvt7m32Y2WDwDUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4AyL1Bk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4895FC4CEF1;
	Mon,  1 Dec 2025 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764579293;
	bh=BO5x05QTMx0LB+GhiJgKoO99qfi4CVdra5MFbtS4Twk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=i4AyL1Bk8Orhnf0Vq76Q1ePjWh/7crL0nEATWHzAsuz8/GdsI6vfYUNq6tW5k1zPq
	 WQrwCei5E6dQhGIMbkV8zp6jggf222y1KS48/2nqCyP1N6TnXrF0TfkSvp/87b3VuG
	 MQHmBbLs5oZYKDI9c8cjUW1ojJixMo6cowV4Tdb/lMW+HfiKNBbvvki6XcDUfVp5BJ
	 dqO4XTSuLwZKuDGlQxADMD2sRyeDTJCDrXGB0iMOtBSCinbDoqkXDzm6kvSFR+7x2K
	 naXNf1P8SE+Yz1/9Nuk9FGBl9aE5FRQ9L81FGrfWQGDMLJuIayk/Gc2mKViylDwLFz
	 RKAfebYJTT5bw==
Message-ID: <ffb6123b-40d3-43bb-b42e-bc3f3a58a4c2@kernel.org>
Date: Mon, 1 Dec 2025 09:54:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 08/14] media: omap3isp: implement create/prepare_bufs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <cc4ae2ac6aae997ad63bc0e694b7ca53a0a6ad32.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiQbZBFfzzWvCbV@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aPiQbZBFfzzWvCbV@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2025 10:06, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Oct 17, 2025 at 03:26:45PM +0200, Hans Verkuil wrote:
>> Add missing ioctls. This makes v4l2-compliance happier:
>>
>> 	warn: v4l2-test-buffers.cpp(813): VIDIOC_CREATE_BUFS not supported
>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> ---
>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 47 ++++++++++++++++++-
>>  1 file changed, 45 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> index 69d17e4dcd36..471defa6e7fb 100644
>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> @@ -325,6 +325,13 @@ static int isp_video_queue_setup(struct vb2_queue *queue,
>>  	struct isp_video_fh *vfh = vb2_get_drv_priv(queue);
>>  	struct isp_video *video = vfh->video;
>>  
>> +	if (*num_planes) {
>> +		if (*num_planes != 1)
>> +			return -EINVAL;
>> +		if (sizes[0] < vfh->format.fmt.pix.sizeimage)
>> +			return -EINVAL;
>> +		return 0;
>> +	}
>>  	*num_planes = 1;
>>  
>>  	sizes[0] = vfh->format.fmt.pix.sizeimage;
>> @@ -340,6 +347,7 @@ static int isp_video_buffer_prepare(struct vb2_buffer *buf)
>>  {
>>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(buf);
>>  	struct isp_video_fh *vfh = vb2_get_drv_priv(buf->vb2_queue);
>> +	unsigned int size = vfh->format.fmt.pix.sizeimage;
>>  	struct isp_buffer *buffer = to_isp_buffer(vbuf);
>>  	struct isp_video *video = vfh->video;
>>  	dma_addr_t addr;
>> @@ -360,8 +368,13 @@ static int isp_video_buffer_prepare(struct vb2_buffer *buf)
>>  		return -EINVAL;
>>  	}
>>  
>> -	vb2_set_plane_payload(&buffer->vb.vb2_buf, 0,
>> -			      vfh->format.fmt.pix.sizeimage);
>> +	if (vb2_plane_size(&buffer->vb.vb2_buf, 0) < size) {
>> +		dev_dbg(video->isp->dev,
>> +			"data will not fit into plane (%lu < %u)\n",
>> +			vb2_plane_size(&buffer->vb.vb2_buf, 0), size);
>> +		return -EINVAL;
>> +	}
>> +	vb2_set_plane_payload(&buffer->vb.vb2_buf, 0, size);
>>  	buffer->dma = addr;
>>  
>>  	return 0;
>> @@ -935,6 +948,20 @@ isp_video_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *rb)
>>  	return ret;
>>  }
>>  
>> +static int
>> +isp_video_create_bufs(struct file *file, void *fh, struct v4l2_create_buffers *p)
>> +{
>> +	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
>> +	struct isp_video *video = video_drvdata(file);
>> +	int ret;
>> +
>> +	mutex_lock(&video->queue_lock);
>> +	ret = vb2_create_bufs(&vfh->queue, p);
>> +	mutex_unlock(&video->queue_lock);
>> +
>> +	return ret;
>> +}
>> +
>>  static int
>>  isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
>>  {
>> @@ -949,6 +976,20 @@ isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
>>  	return ret;
>>  }
>>  
>> +static int
>> +isp_video_prepare_buf(struct file *file, void *fh, struct v4l2_buffer *b)
>> +{
>> +	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
>> +	struct isp_video *video = video_drvdata(file);
>> +	int ret;
>> +
>> +	mutex_lock(&video->queue_lock);
>> +	ret = vb2_prepare_buf(&vfh->queue, video->video.v4l2_dev->mdev, b);
>> +	mutex_unlock(&video->queue_lock);
>> +
>> +	return ret;
> 
> Also:
> 
> #include <linux/cleanup.h>
> 
> ...
> 
> 	guard(mutex)(&video->queue_lock);
> 
> 	return vb2_prepare_buf(&vfh->queue, video->video.v4l2_dev->mdev, b);
> 
> Same for create_bufs implementation.

Hmm, I'm hesitant to do that for two reasons:

1) Consistency with existing vb2 callbacks
2) It's harder to backport this to older kernels.

Since this is an old driver, the chances someone might want to backport this
to an old kernel is higher than usual.

If you really want this, then I prefer to make a new patch that introduces
the guards for all vb2 callbacks in this driver.

Regards,

	Hans

> 
> 
>> +}
>> +
>>  static int
>>  isp_video_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
>>  {
>> @@ -1303,7 +1344,9 @@ static const struct v4l2_ioctl_ops isp_video_ioctl_ops = {
>>  	.vidioc_g_parm			= isp_video_get_param,
>>  	.vidioc_s_parm			= isp_video_set_param,
>>  	.vidioc_reqbufs			= isp_video_reqbufs,
>> +	.vidioc_create_bufs		= isp_video_create_bufs,
>>  	.vidioc_querybuf		= isp_video_querybuf,
>> +	.vidioc_prepare_buf		= isp_video_prepare_buf,
>>  	.vidioc_qbuf			= isp_video_qbuf,
>>  	.vidioc_dqbuf			= isp_video_dqbuf,
>>  	.vidioc_streamon		= isp_video_streamon,
> 


