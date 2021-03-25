Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0497348E68
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 11:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhCYKy1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 06:54:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49828 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhCYKyL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 06:54:11 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 079AD560;
        Thu, 25 Mar 2021 11:54:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616669650;
        bh=HPNt5V3uTpiZcLoVRtw+cQBhNxQZ/Fy2Isg+f3SCBgo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BcOu/cY5rGuljJtiHmT+6SqJWoOnbYVo39TEYwKksLXmk97hNB50PYB6zmdcWnntl
         AmJI7IWa/KV/XdQX6NuSvza349J8gxXjmR636EVhQGyOYK7mVeK9awRkTJ6aPDr1/N
         CUiTmhWRFPIiRDxmUg0UgYERnMcwxCXJEFFJwQxY=
Date:   Thu, 25 Mar 2021 12:53:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        jc@kynesim.co.uk, dave.stevenson@raspberrypi.org,
        tfiga@chromium.org
Subject: Re: [PATCH 1/2] media: videobuf2: use dmabuf size for length
Message-ID: <YFxrpw5I2Lrbq+AO@pendragon.ideasonboard.com>
References: <20210325001712.197837-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210325001712.197837-1-helen.koike@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Wed, Mar 24, 2021 at 09:17:11PM -0300, Helen Koike wrote:
> Always use dmabuf size when considering the length of the buffer.
> Discard userspace provided length.
> Fix length check error in _verify_length(), which was handling single and
> multiplanar diferently, and also not catching the case where userspace
> provides a bigger length and bytesused then the underlying buffer.
> 
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> 
> Hello,
> 
> As discussed on
> https://patchwork.linuxtv.org/project/linux-media/patch/gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com/
> 
> This patch also helps the conversion layer of the Ext API patchset,
> where we are not exposing the length field.
> 
> It was discussed that userspace might use a smaller length field to
> limit the usage of the underlying buffer, but I'm not sure if this is
> really usefull and just complicates things.
> 
> If this is usefull, then we should also expose a length field in the Ext
> API, and document this feature properly.
> 
> What do you think?

I think a limit could be useful, as a single dmabuf object could hold
multiple planes, which should be addressed by an offset from the
beginning of the buffer. Giving a length to the kernel could help
catching errors. As the existing API doesn't support offsets, a length
limit is likely not very useful at the moment, but should I believe be
included at least in the new API.

For the existing implementation, I'd say that we should be pragmatic. If
using the provided length as a maximum boundary makes the implementation
more complex for very little gain, let's not do it. But on the other
hand, considering existing userspace, would there be added value in
implementing such a mechanism ?

> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 21 ++++++++++++++++---
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++----
>  include/uapi/linux/videodev2.h                |  7 +++++--
>  3 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 02281d13505f..2cbde14af051 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1205,6 +1205,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  
>  	for (plane = 0; plane < vb->num_planes; ++plane) {
>  		struct dma_buf *dbuf = dma_buf_get(planes[plane].m.fd);
> +		unsigned int bytesused;
>  
>  		if (IS_ERR_OR_NULL(dbuf)) {
>  			dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
> @@ -1213,9 +1214,23 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  			goto err;
>  		}
>  
> -		/* use DMABUF size if length is not provided */
> -		if (planes[plane].length == 0)
> -			planes[plane].length = dbuf->size;
> +		planes[plane].length = dbuf->size;
> +		bytesused = planes[plane].bytesused ?
> +			    planes[plane].bytesused : dbuf->size;
> +
> +		if (planes[plane].bytesused > planes[plane].length) {
> +			dprintk(q, 1, "bytesused is bigger then dmabuf length for plane %d\n",
> +				plane);
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		if (planes[plane].data_offset >= bytesused) {
> +			dprintk(q, 1, "data_offset >= bytesused for plane %d\n",
> +				plane);
> +			ret = -EINVAL;
> +			goto err;
> +		}
>  
>  		if (planes[plane].length < vb->planes[plane].min_length) {
>  			dprintk(q, 1, "invalid dmabuf length %u for plane %d, minimum length %u\n",
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 7e96f67c60ba..ffc7ed46f74a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -98,14 +98,14 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
>  	unsigned int bytesused;
>  	unsigned int plane;
>  
> -	if (V4L2_TYPE_IS_CAPTURE(b->type))
> +	/* length check for dmabuf is performed in _prepare_dmabuf() */
> +	if (V4L2_TYPE_IS_CAPTURE(b->type) || b->memory == VB2_MEMORY_DMABUF)
>  		return 0;
>  
>  	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
>  		for (plane = 0; plane < vb->num_planes; ++plane) {
> -			length = (b->memory == VB2_MEMORY_USERPTR ||
> -				  b->memory == VB2_MEMORY_DMABUF)
> -			       ? b->m.planes[plane].length
> +			length = b->memory == VB2_MEMORY_USERPTR
> +				? b->m.planes[plane].length
>  				: vb->planes[plane].length;
>  			bytesused = b->m.planes[plane].bytesused
>  				  ? b->m.planes[plane].bytesused : length;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 8d15f6ccc4b4..79b3b2893513 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -968,7 +968,9 @@ struct v4l2_requestbuffers {
>  /**
>   * struct v4l2_plane - plane info for multi-planar buffers
>   * @bytesused:		number of bytes occupied by data in the plane (payload)
> - * @length:		size of this plane (NOT the payload) in bytes
> + * @length:		size of this plane (NOT the payload) in bytes. Filled
> + *			by userspace for USERPTR and by the driver for DMABUF
> + *			and MMAP.
>   * @mem_offset:		when memory in the associated struct v4l2_buffer is
>   *			V4L2_MEMORY_MMAP, equals the offset from the start of
>   *			the device memory for this plane (or is a "cookie" that
> @@ -1025,7 +1027,8 @@ struct v4l2_plane {
>   * @m:		union of @offset, @userptr, @planes and @fd
>   * @length:	size in bytes of the buffer (NOT its payload) for single-plane
>   *		buffers (when type != *_MPLANE); number of elements in the
> - *		planes array for multi-plane buffers
> + *		planes array for multi-plane buffers. Filled by userspace for
> + *		USERPTR and by the driver for DMABUF and MMAP.
>   * @reserved2:	drivers and applications must zero this field
>   * @request_fd: fd of the request that this buffer should use
>   * @reserved:	for backwards compatibility with applications that do not know

-- 
Regards,

Laurent Pinchart
