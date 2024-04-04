Return-Path: <linux-media+bounces-8622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A562C898322
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5585D1F2948E
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 08:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2C36CDAB;
	Thu,  4 Apr 2024 08:27:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F2D6BFCC
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712219272; cv=none; b=j+qDQTmQL6AKqEkrrwV8owZ6SlueIwasl7nQFx02sze4mFF0x/yWQ3/3kpbBOVL7/23/MdjDWPFLjxNYk1x9/nlLvMFZFhkYiLRYfkHNdn4aqwQbOIXo92Qp3zk4Ylfojb0QXK+4dwUDZvvtQV25f9WAhRsytjGGLLaH91hskZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712219272; c=relaxed/simple;
	bh=Kx0b7tI5EKDCrtWxEHZLi+yUhLwGquRCGit1P/Hrhvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWtK06a3qVoJV+n+z7CpIVIHE5Ryt2rQZ0hsq5gmymCNobeQTKn2gntobPJUrKfcpb6Wm8ARCKx784eRd5L2IHexxvJqyq/vsvPmzxBTjllY57CgS77v0E62g42Vq7bu+kwD0nNKSL+zzSx13xDVwQeDkNZEa1Vba8dbhbNBcl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EC0C433C7;
	Thu,  4 Apr 2024 08:27:50 +0000 (UTC)
Message-ID: <ba1d234f-ec2b-4406-9c18-3e59445301de@xs4all.nl>
Date: Thu, 4 Apr 2024 10:27:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2-subdev: Remove stream support for the crop
 API
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20240403224233.18224-1-laurent.pinchart@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240403224233.18224-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 04/04/2024 00:42, Laurent Pinchart wrote:
> When support for streams was added to the V4L2 subdev API, the
> v4l2_subdev_crop structure was extended with a stream field, but the
> field was not handled in the core code that translates the
> VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. This could be
> fixed, but the crop API is deprecated and shouldn't be used by new
> userspace code. It's therefore best to avoid extending it with new
> features. Drop the stream field from the v4l2_subdev_crop structure, and
> update the documentation and kernel code accordingly.
> 
> Fixes: 2f91e10ee6fd ("media: subdev: add stream based configuration")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> This supersedes the "[PATCH] media: v4l2-subdev: Fix stream handling for
> crop API" patch ([1]). I'll submit matching patches for v4l2-compliance.
> 
> [1] https://patchwork.linuxtv.org/project/linux-media/patch/20240401233725.2401-1-laurent.pinchart@ideasonboard.com/
> ---
>  .../userspace-api/media/v4l/vidioc-subdev-g-crop.rst        | 5 +----
>  drivers/media/v4l2-core/v4l2-subdev.c                       | 6 ------
>  include/uapi/linux/v4l2-subdev.h                            | 4 +---
>  3 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> index 92d933631fda..7eeb7b553abf 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> @@ -96,10 +96,7 @@ modified format should be as close as possible to the original request.
>        - ``rect``
>        - Crop rectangle boundaries, in pixels.
>      * - __u32
> -      - ``stream``
> -      - Stream identifier.
> -    * - __u32
> -      - ``reserved``\ [7]
> +      - ``reserved``\ [8]
>        - Reserved for future extensions. Applications and drivers must set
>  	the array to zero.
>  
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4c6198c48dd6..02c2a2b472df 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -725,9 +725,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		struct v4l2_subdev_crop *crop = arg;
>  		struct v4l2_subdev_selection sel;
>  
> -		if (!client_supports_streams)
> -			crop->stream = 0;
> -
>  		memset(crop->reserved, 0, sizeof(crop->reserved));
>  		memset(&sel, 0, sizeof(sel));
>  		sel.which = crop->which;
> @@ -749,9 +746,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		if (crop->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>  			return -EPERM;
>  
> -		if (!client_supports_streams)
> -			crop->stream = 0;
> -
>  		memset(crop->reserved, 0, sizeof(crop->reserved));
>  		memset(&sel, 0, sizeof(sel));
>  		sel.which = crop->which;
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 7048c51581c6..f7eea12d8a2c 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -48,15 +48,13 @@ struct v4l2_subdev_format {
>   * @which: format type (from enum v4l2_subdev_format_whence)
>   * @pad: pad number, as reported by the media API
>   * @rect: pad crop rectangle boundaries
> - * @stream: stream number, defined in subdev routing
>   * @reserved: drivers and applications must zero this array
>   */
>  struct v4l2_subdev_crop {
>  	__u32 which;
>  	__u32 pad;
>  	struct v4l2_rect rect;
> -	__u32 stream;
> -	__u32 reserved[7];
> +	__u32 reserved[8];
>  };

Sorry, but you can't remove this field. This field has been in the uAPI since
v6.3, and applications might be using it, even if only to set it to 0. Removing
this field will break compilation of such applications.

Just fix the stream support instead, rather than removing it, as you did in
your original patch:

https://lore.kernel.org/linux-media/20240401233725.2401-1-laurent.pinchart@ideasonboard.com/

Regards,

	Hans

>  
>  #define V4L2_SUBDEV_MBUS_CODE_CSC_COLORSPACE	0x00000001
> 
> base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f


