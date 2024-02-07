Return-Path: <linux-media+bounces-4806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 516A584C951
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 12:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70E02B2374A
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 11:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B82718EA1;
	Wed,  7 Feb 2024 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T5L1qWfb"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF3D1B7F7;
	Wed,  7 Feb 2024 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707304506; cv=none; b=o88AUaJdw9ID2X5CgK+jcLQeJXTXDeUmUSrZ3cRFd03F5IFinuPhQiSJf0dWuY+mQ43+pEPMwMLIqnRDwhUe24nnTvOzzK1RQk1t6NXtYVgSBlyu0/JVHR5Uf8K+/fLgEbRo/WJJB4WQ6jyROW83I6D00waZ5VSivCj0kf7FIM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707304506; c=relaxed/simple;
	bh=dqFNplGDYGhi0vuOVY8SahUo4rLkXBsaOf5qz5o2pNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9We8gkm67w86mkvm1/gUE1Uw9CoBn+3aO8WwqLhXu607kWMYgGQocy+TIxjFBwAHyF7wIr959tzP41TI9zVa/mO1mgqrhXhXJSWg3f0m5czapK1USlQM/fzC/aqhsDYxFZhPc25behpHFElojR0aF+wDIznerhWPfksb07EfF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T5L1qWfb; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707304503;
	bh=dqFNplGDYGhi0vuOVY8SahUo4rLkXBsaOf5qz5o2pNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T5L1qWfbnoNThDtC+nLW33z+FTcixzR/LCkv/hS41Fu5J4SZW1j9UYuUfPCbM6CxT
	 3pDtVSW/IP20GS0c4XVtmsk8x1CnMNeHyjqzzKvoJUy8suukaRj/HbF1U1NFIqwk3u
	 KeDa8qMr4MloVa/ydVEpl5E5TUOybAE+qKU2yG30pSFo2CEdQ0kn/V8yQ2N8Wo+cdb
	 QlmnZbdJkyq/AsdHvQqFMIJYsV9ZCYLQ7dVifbEXFhrJIP9QVY4Xyc47dcWzLGWYN3
	 dDRR81skduOIO0ZqCoIPB6SqVVKscobFq4CxVrfKvFggxl8tuB7TDaaZyT1opZkKqI
	 21EWCKgNKo+Kg==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A94A13782069;
	Wed,  7 Feb 2024 11:15:02 +0000 (UTC)
Message-ID: <e7420a20-b17d-493e-9b3c-bbb9314d7025@collabora.com>
Date: Wed, 7 Feb 2024 12:15:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/9] Add DELETE_BUF ioctl
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20240206080219.11951-1-benjamin.gaignard@collabora.com>
 <dcafb602-228f-439f-99d2-010d26a23ad1@xs4all.nl>
 <67823e2e-9d60-4c08-bdd1-c974aaf96a93@xs4all.nl>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <67823e2e-9d60-4c08-bdd1-c974aaf96a93@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 07/02/2024 à 10:12, Hans Verkuil a écrit :
> Hi Benjamin,
>
> On 06/02/2024 09:58, Hans Verkuil wrote:
>> On 06/02/2024 09:02, Benjamin Gaignard wrote:
>>> Unlike when resolution change on keyframes, dynamic resolution change
>>> on inter frames doesn't allow to do a stream off/on sequence because
>>> it is need to keep all previous references alive to decode inter frames.
>>> This constraint have two main problems:
>>> - more memory consumption.
>>> - more buffers in use.
>>> To solve these issue this series introduce DELETE_BUFS ioctl and remove
>>> the 32 buffers limit per queue.
>> This v19 looks good. There are three outstanding issues that I need to take a
>> look at:
>>
>> 1) Can we still signal support for DELETE_BUFS in the V4L2_BUF_CAP_ caps?
>>     It would be nice to have, but I'm not sure if and how that can be done.
> So, I came up with the following patch to add back the V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS
> capability. If the DELETE_BUFS ioctl is valid, then it sets this capability
> before calling vidioc_reqbufs or vidioc_create_bufs. So right now it will set
> this for any queue. If we ever want to disable this for a specific queue, then
> either the driver has to override these two ops and clear the flag, or a new
> vb2_queue flag (e.g. disable_delete_bufs) is added and vb2_set_flags_and_caps()
> will clear that capability based on that flag.
>
> In any case, for now just set it for both queues by default.
>
> If you agree that this is a good way to proceed, then can you incorporate this
> into a v20? You can add the documentation for this cap from the v17 version.

Do you want it to be a separate patch or included in the patch introducing DELETE_BUFS ioctl ?

>
> Regards,
>
> 	Hans
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 8e437104f9c1..64f2d662d068 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -685,7 +685,7 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
>   		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
>   	}
>
> -	*caps = V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
> +	*caps |= V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
>   	if (q->io_modes & VB2_MMAP)
>   		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP;
>   	if (q->io_modes & VB2_USERPTR)
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a172d33edd19..45bc705e171e 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2100,6 +2100,7 @@ static int v4l_overlay(const struct v4l2_ioctl_ops *ops,
>   static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>   				struct file *file, void *fh, void *arg)
>   {
> +	struct video_device *vfd = video_devdata(file);
>   	struct v4l2_requestbuffers *p = arg;
>   	int ret = check_fmt(file, p->type);
>
> @@ -2108,6 +2109,9 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>
>   	memset_after(p, 0, flags);
>
> +	if (is_valid_ioctl(vfd, VIDIOC_DELETE_BUFS))
> +		p->capabilities = V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS;
> +
>   	return ops->vidioc_reqbufs(file, fh, p);
>   }
>
> @@ -2141,6 +2145,7 @@ static int v4l_dqbuf(const struct v4l2_ioctl_ops *ops,
>   static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>   				struct file *file, void *fh, void *arg)
>   {
> +	struct video_device *vfd = video_devdata(file);
>   	struct v4l2_create_buffers *create = arg;
>   	int ret = check_fmt(file, create->format.type);
>
> @@ -2151,6 +2156,9 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>
>   	v4l_sanitize_format(&create->format);
>
> +	if (is_valid_ioctl(vfd, VIDIOC_DELETE_BUFS))
> +		create->capabilities = V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS;
> +
>   	ret = ops->vidioc_create_bufs(file, fh, create);
>
>   	if (create->format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 03443833aaaa..da307f46f903 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1036,6 +1036,7 @@ struct v4l2_requestbuffers {
>   #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
>   #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
>   #define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
> +#define V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS		(1 << 8)
>
>   /**
>    * struct v4l2_plane - plane info for multi-planar buffers
>
>
>

