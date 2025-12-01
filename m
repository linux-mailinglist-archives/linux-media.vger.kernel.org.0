Return-Path: <linux-media+bounces-47952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C2C975C3
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 13:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1A5E3A5342
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 12:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF8F31A067;
	Mon,  1 Dec 2025 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zc2W3oRx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E831986E
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592962; cv=none; b=lzPKOKakgTCpmJUCedvbt8/V9yGEBye+qjmyp8z4GDt044zD/66442gpph5pxVNkRm/NXNDX6aeW/tKM0nUqYUNAB5FVuqxOprubTllaVasXE0P2B7FlQNH1L1v6UAK41VMH6SFjal8Dmr0N45Jub75b+wluZF3dnWyKqDYfqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592962; c=relaxed/simple;
	bh=SEJY5qN9cwCLJwuu8RR5LG+yiJtqz7nFiVbR9BnUkUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpgLK3OS/WZBmhdq3BOmMBqsma6epB5xc2ikukb50l+kwEgxv996WTKmFmO4s+wjPgfrq7Vbse+IIcv2Xm5UEvi0UTIZIrc5kK4FCneqewfC6/Z1cgcat51TcZywt+DIOC2y0q38vlYpMjOIr/9A2mxSpaXsXj+t6TkbFMnkmpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zc2W3oRx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764592960; x=1796128960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SEJY5qN9cwCLJwuu8RR5LG+yiJtqz7nFiVbR9BnUkUA=;
  b=Zc2W3oRxSxD0H3QD0u2eARGlMtWW3YAMktYqgEnE9auvyfeuJqxMUY5L
   cPwbThRKpUKOMLN5C0IfbgtPKxiWB+aFufGFpBse4IbNIpf1B46XqmNd1
   bVbvRusujeQKINr1XrP0pxN2jGoZ49ZWTADL3mco3je0c7MXij8Of1qpD
   0URcHnEkba41AKemVCAH6OQTwtwKDnHL/II3xVVef6vCmyTiw5ZorIo2d
   vikM0F8/7eFfKRjWsCdx3EnQxXRjQ6DCMLJzkuze5MTa2c9sNpX008Gn8
   YBguziZYWIOfA5giD7uBofcW2gdQ+SGlhwkc+In6uks8KkE08dlkAzAD8
   g==;
X-CSE-ConnectionGUID: NEBK2kFqQT+AVZ3klw+jiA==
X-CSE-MsgGUID: tHz2D7KsSqqRyUY15rp3Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77217880"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="77217880"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 04:42:39 -0800
X-CSE-ConnectionGUID: 9mha3YQdS4yZ83HnUAA1LA==
X-CSE-MsgGUID: Q3ubhojYRyWOfxnpD0EtSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="198531780"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.162])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 04:42:39 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1970011FA74;
	Mon, 01 Dec 2025 14:42:40 +0200 (EET)
Date: Mon, 1 Dec 2025 14:42:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 08/14] media: omap3isp: implement create/prepare_bufs
Message-ID: <aS2NQB79ANAZOsh5@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <cc4ae2ac6aae997ad63bc0e694b7ca53a0a6ad32.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiQbZBFfzzWvCbV@kekkonen.localdomain>
 <ffb6123b-40d3-43bb-b42e-bc3f3a58a4c2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffb6123b-40d3-43bb-b42e-bc3f3a58a4c2@kernel.org>

Hi Hans,

On Mon, Dec 01, 2025 at 09:54:50AM +0100, Hans Verkuil wrote:
> On 22/10/2025 10:06, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Fri, Oct 17, 2025 at 03:26:45PM +0200, Hans Verkuil wrote:
> >> Add missing ioctls. This makes v4l2-compliance happier:
> >>
> >> 	warn: v4l2-test-buffers.cpp(813): VIDIOC_CREATE_BUFS not supported
> >> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> >> ---
> >>  drivers/media/platform/ti/omap3isp/ispvideo.c | 47 ++++++++++++++++++-
> >>  1 file changed, 45 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> index 69d17e4dcd36..471defa6e7fb 100644
> >> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> @@ -325,6 +325,13 @@ static int isp_video_queue_setup(struct vb2_queue *queue,
> >>  	struct isp_video_fh *vfh = vb2_get_drv_priv(queue);
> >>  	struct isp_video *video = vfh->video;
> >>  
> >> +	if (*num_planes) {
> >> +		if (*num_planes != 1)
> >> +			return -EINVAL;
> >> +		if (sizes[0] < vfh->format.fmt.pix.sizeimage)
> >> +			return -EINVAL;
> >> +		return 0;
> >> +	}
> >>  	*num_planes = 1;
> >>  
> >>  	sizes[0] = vfh->format.fmt.pix.sizeimage;
> >> @@ -340,6 +347,7 @@ static int isp_video_buffer_prepare(struct vb2_buffer *buf)
> >>  {
> >>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(buf);
> >>  	struct isp_video_fh *vfh = vb2_get_drv_priv(buf->vb2_queue);
> >> +	unsigned int size = vfh->format.fmt.pix.sizeimage;
> >>  	struct isp_buffer *buffer = to_isp_buffer(vbuf);
> >>  	struct isp_video *video = vfh->video;
> >>  	dma_addr_t addr;
> >> @@ -360,8 +368,13 @@ static int isp_video_buffer_prepare(struct vb2_buffer *buf)
> >>  		return -EINVAL;
> >>  	}
> >>  
> >> -	vb2_set_plane_payload(&buffer->vb.vb2_buf, 0,
> >> -			      vfh->format.fmt.pix.sizeimage);
> >> +	if (vb2_plane_size(&buffer->vb.vb2_buf, 0) < size) {
> >> +		dev_dbg(video->isp->dev,
> >> +			"data will not fit into plane (%lu < %u)\n",
> >> +			vb2_plane_size(&buffer->vb.vb2_buf, 0), size);
> >> +		return -EINVAL;
> >> +	}
> >> +	vb2_set_plane_payload(&buffer->vb.vb2_buf, 0, size);
> >>  	buffer->dma = addr;
> >>  
> >>  	return 0;
> >> @@ -935,6 +948,20 @@ isp_video_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *rb)
> >>  	return ret;
> >>  }
> >>  
> >> +static int
> >> +isp_video_create_bufs(struct file *file, void *fh, struct v4l2_create_buffers *p)
> >> +{
> >> +	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
> >> +	struct isp_video *video = video_drvdata(file);
> >> +	int ret;
> >> +
> >> +	mutex_lock(&video->queue_lock);
> >> +	ret = vb2_create_bufs(&vfh->queue, p);
> >> +	mutex_unlock(&video->queue_lock);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >>  static int
> >>  isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
> >>  {
> >> @@ -949,6 +976,20 @@ isp_video_querybuf(struct file *file, void *fh, struct v4l2_buffer *b)
> >>  	return ret;
> >>  }
> >>  
> >> +static int
> >> +isp_video_prepare_buf(struct file *file, void *fh, struct v4l2_buffer *b)
> >> +{
> >> +	struct isp_video_fh *vfh = file_to_isp_video_fh(file);
> >> +	struct isp_video *video = video_drvdata(file);
> >> +	int ret;
> >> +
> >> +	mutex_lock(&video->queue_lock);
> >> +	ret = vb2_prepare_buf(&vfh->queue, video->video.v4l2_dev->mdev, b);
> >> +	mutex_unlock(&video->queue_lock);
> >> +
> >> +	return ret;
> > 
> > Also:
> > 
> > #include <linux/cleanup.h>
> > 
> > ...
> > 
> > 	guard(mutex)(&video->queue_lock);
> > 
> > 	return vb2_prepare_buf(&vfh->queue, video->video.v4l2_dev->mdev, b);
> > 
> > Same for create_bufs implementation.
> 
> Hmm, I'm hesitant to do that for two reasons:
> 
> 1) Consistency with existing vb2 callbacks
> 2) It's harder to backport this to older kernels.
> 
> Since this is an old driver, the chances someone might want to backport this
> to an old kernel is higher than usual.
> 
> If you really want this, then I prefer to make a new patch that introduces
> the guards for all vb2 callbacks in this driver.

Up to you.

-- 
Regards,

Sakari Ailus

