Return-Path: <linux-media+bounces-45208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E81BFAC81
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 10:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 428D53B8A30
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 08:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CC53019BF;
	Wed, 22 Oct 2025 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLLjnFp/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B983019A4
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120372; cv=none; b=pf0c0OxfAp0OnZf4X1no6UmM7dL1IZ95M2woHnkBi1aAz/1F+IuIFFqaN9bW7mqdwwiOpEutBn2d6dAgy8LarXdKnBedy5X5OYSVkp8nQ14t7M8rWpVayEnXvfWlidP+bq6zngZ6x0/ihbLvdAnS8gQ2De/Nv9/jRvlBtbWIRTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120372; c=relaxed/simple;
	bh=KB7Bzb65F/0+azp1ia/Pg1ulbH+F1/XNjS839EWI/1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZoBXibm3XxbKn/Zn5rOfKOs0gqLUM+/5Fj/o16FmR7tK6zzgobGhXjrg7lcwpndHLcOjUqBTDzuqjQG47vs/CeZLxPkncOXKlWwheNzwN3YEE1flP+KiEmmg2/QxrUjVbjXvkaTyGW6V/RLFJyPZ0rQR3UgsFNgj5Jrn4/H/kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLLjnFp/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761120370; x=1792656370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KB7Bzb65F/0+azp1ia/Pg1ulbH+F1/XNjS839EWI/1g=;
  b=mLLjnFp/r6nqYSqwX+Kkk8tdbaPBStUqawaDcCKhNaehHXObFc8qWU8m
   Slfmtm2MGwWD044Hymo0EdwQBEVBdQ39SPznFID0BQGwvBKhgdG+WkDHc
   PFQYXJvwOo+WrG/rxJ89AHN0C4Gi2IKtSydL9vaFrC/R7Qz/RbYf11stY
   ePhEWVPf2pMxD2EfBhWJnPiZLXV/l+VLEtxYLYop90UKVDl8xr3zO7vnF
   UpDfinA+Dk9sFel+BverfI1pToX9AQ8rrxcJ49/XA75vfRsPn3c1LUIba
   47pbgWFSFwTPgOXuROP0lMxKCJDFrS1YmCsYSOKlqtovkrBkMb39V+eOv
   A==;
X-CSE-ConnectionGUID: t08WuwKFQPWN/2ot6mXT/w==
X-CSE-MsgGUID: e977Nn2iRu6CdyShCis7rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80883511"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="80883511"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:06:09 -0700
X-CSE-ConnectionGUID: UpYLDUXQSlWjtTU4BMHlCw==
X-CSE-MsgGUID: pCyAjr0cSci+YNRYwoJ1sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183746481"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:06:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0FD0D11F87B;
	Wed, 22 Oct 2025 11:06:06 +0300 (EEST)
Date: Wed, 22 Oct 2025 11:06:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 08/14] media: omap3isp: implement create/prepare_bufs
Message-ID: <aPiQbZBFfzzWvCbV@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <cc4ae2ac6aae997ad63bc0e694b7ca53a0a6ad32.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc4ae2ac6aae997ad63bc0e694b7ca53a0a6ad32.1760707611.git.hverkuil+cisco@kernel.org>

Hi Hans,

On Fri, Oct 17, 2025 at 03:26:45PM +0200, Hans Verkuil wrote:
> Add missing ioctls. This makes v4l2-compliance happier:
> 
> 	warn: v4l2-test-buffers.cpp(813): VIDIOC_CREATE_BUFS not supported
> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/platform/ti/omap3isp/ispvideo.c | 47 ++++++++++++++++++-
>  1 file changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index 69d17e4dcd36..471defa6e7fb 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -325,6 +325,13 @@ static int isp_video_queue_setup(struct vb2_queue *queue,
>  	struct isp_video_fh *vfh = vb2_get_drv_priv(queue);
>  	struct isp_video *video = vfh->video;
>  
> +	if (*num_planes) {
> +		if (*num_planes != 1)
> +			return -EINVAL;
> +		if (sizes[0] < vfh->format.fmt.pix.sizeimage)
> +			return -EINVAL;
> +		return 0;
> +	}
>  	*num_planes = 1;
>  
>  	sizes[0] = vfh->format.fmt.pix.sizeimage;
> @@ -340,6 +347,7 @@ static int isp_video_buffer_prepare(struct vb2_buffer *buf)
>  {
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(buf);
>  	struct isp_video_fh *vfh = vb2_get_drv_priv(buf->vb2_queue);
> +	unsigned int size = vfh->format.fmt.pix.sizeimage;
>  	struct isp_buffer *buffer = to_isp_buffer(vbuf);
>  	struct isp_video *video = vfh->video;
>  	dma_addr_t addr;
> @@ -360,8 +368,13 @@ static int isp_video_buffer_prepare(struct vb2_buffer *buf)
>  		return -EINVAL;
>  	}
>  
> -	vb2_set_plane_payload(&buffer->vb.vb2_buf, 0,
> -			      vfh->format.fmt.pix.sizeimage);
> +	if (vb2_plane_size(&buffer->vb.vb2_buf, 0) < size) {
> +		dev_dbg(video->isp->dev,
> +			"data will not fit into plane (%lu < %u)\n",
> +			vb2_plane_size(&buffer->vb.vb2_buf, 0), size);
> +		return -EINVAL;
> +	}
> +	vb2_set_plane_payload(&buffer->vb.vb2_buf, 0, size);
>  	buffer->dma = addr;
>  
>  	return 0;
> @@ -935,6 +948,20 @@ isp_video_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *rb)
>  	return ret;
>  }
>  
> +static int
> +isp_video_create_bufs(struct file *file, void *fh, struct v4l2_create_buffers *p)
> +{
> +	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
> +	struct isp_video *video = video_drvdata(file);
> +	int ret;
> +
> +	mutex_lock(&video->queue_lock);
> +	ret = vb2_create_bufs(&vfh->queue, p);
> +	mutex_unlock(&video->queue_lock);
> +
> +	return ret;
> +}
> +
>  static int
>  isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
>  {
> @@ -949,6 +976,20 @@ isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
>  	return ret;
>  }
>  
> +static int
> +isp_video_prepare_buf(struct file *file, void *fh, struct v4l2_buffer *b)
> +{
> +	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
> +	struct isp_video *video = video_drvdata(file);
> +	int ret;
> +
> +	mutex_lock(&video->queue_lock);
> +	ret = vb2_prepare_buf(&vfh->queue, video->video.v4l2_dev->mdev, b);
> +	mutex_unlock(&video->queue_lock);
> +
> +	return ret;

Also:

#include <linux/cleanup.h>

...

	guard(mutex)(&video->queue_lock);

	return vb2_prepare_buf(&vfh->queue, video->video.v4l2_dev->mdev, b);

Same for create_bufs implementation.


> +}
> +
>  static int
>  isp_video_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
>  {
> @@ -1303,7 +1344,9 @@ static const struct v4l2_ioctl_ops isp_video_ioctl_ops = {
>  	.vidioc_g_parm			= isp_video_get_param,
>  	.vidioc_s_parm			= isp_video_set_param,
>  	.vidioc_reqbufs			= isp_video_reqbufs,
> +	.vidioc_create_bufs		= isp_video_create_bufs,
>  	.vidioc_querybuf		= isp_video_querybuf,
> +	.vidioc_prepare_buf		= isp_video_prepare_buf,
>  	.vidioc_qbuf			= isp_video_qbuf,
>  	.vidioc_dqbuf			= isp_video_dqbuf,
>  	.vidioc_streamon		= isp_video_streamon,

-- 
Kind regards,

Sakari Ailus

