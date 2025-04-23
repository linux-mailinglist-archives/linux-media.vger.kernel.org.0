Return-Path: <linux-media+bounces-30820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CBFA991D4
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 17:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F33FB4A0C5D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2932973A5;
	Wed, 23 Apr 2025 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQun3ep5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8892973A7
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421606; cv=none; b=Cl0+RkMfN4MUvYosdqBfx36KfhB1Dw2euikOXIz9m9lgLMl04QhZdDVAB9w1s/buTfdda06vDo0/byiDsH2gTMXFTjKNozot+vhhe5my7EsqAVEE5g1I9tbpZCcoNapOaLjfkk8MwYaK2Ek6SJ49tXys5s/nlaOPWXc3sOlt/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421606; c=relaxed/simple;
	bh=meSVW1eguwAlHbAPlspqVRVqKgtdGCEBpEMzAfWmR48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nt1CGrQg1XW1LPNai9xBiSNgiWV99rkWnaUj5z99KUKFj80BaZu3Qkp6p6QrNo/MWNpEA9zoM0j+k1LZeM36nntJAgm0I65f2L0RS/UxfyJyRPnYw3dzTQszmVeIYCCwmk77CjMj8y7wD981uHSKmMFLc/wzPrYK46auAho8HRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQun3ep5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745421605; x=1776957605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=meSVW1eguwAlHbAPlspqVRVqKgtdGCEBpEMzAfWmR48=;
  b=MQun3ep5wS1Y5QGU4ECWlE2TOCcook5Pbb7oj6wXLebSe5KnU3QTgI3Q
   ZszglDMw8pgEYlu7G+/r8STj3ZTTUlwrib++5FtLcjwU9U5WSl75bAfSm
   PvkAVRxQP8ywtrPIKjfU3sKeeAMrC6J3j2w2DnlJDqFiWIT1c/QElF1Yv
   rw4o55H0c0KMJVh8n9FYZGWEJJ4Nxvx7M7KuADgCE41858Z5Ms7UXljrw
   0i57mc1iFSYrRdayWGKZXYbA7QtfLZtsBNwsQ2SCNly4peGWRpaNn+KyT
   w1CnSEw8Walf0dsSKxzEAMsRXVzGeEHrZ1+PVLInG3sXTcr2TaQIV5AWp
   A==;
X-CSE-ConnectionGUID: Nut1l/LdQRmzt9ytSIMBEA==
X-CSE-MsgGUID: +hctCIEiQ5STcbtwB/8tHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46143146"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46143146"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 08:20:04 -0700
X-CSE-ConnectionGUID: f0bJTGCHSXGTxe0ehdrFEg==
X-CSE-MsgGUID: RilT2QNKQGWcAUVF8//KKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132649056"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 08:20:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C202511F9FE;
	Wed, 23 Apr 2025 18:20:00 +0300 (EEST)
Date: Wed, 23 Apr 2025 15:20:00 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: omap3isp: drop wait_prepare/finish callbacks
Message-ID: <aAkFIKUwIgWzHDzy@kekkonen.localdomain>
References: <218877d9-5f95-42ab-8bbf-2325cb31ed73@xs4all.nl>
 <20250128154040.GF12673@pendragon.ideasonboard.com>
 <f11dab4a-0288-42ae-b6c1-a548206a1249@xs4all.nl>
 <4b2aa849-c72b-4ace-8121-d8d490186809@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b2aa849-c72b-4ace-8121-d8d490186809@xs4all.nl>

On Wed, Apr 23, 2025 at 04:53:45PM +0200, Hans Verkuil wrote:
> Hi Laurent,
> 
> On 29/01/2025 15:21, Hans Verkuil wrote:
> > On 28/01/2025 16:40, Laurent Pinchart wrote:
> >> Hi Hans,
> >>
> >> Thank you for the patch.
> >>
> >> On Tue, Jan 28, 2025 at 04:08:18PM +0100, Hans Verkuil wrote:
> >>> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> >>> are NULL") it is no longer needed to set the wait_prepare/finish
> >>> vb2_ops callbacks as long as the lock field in vb2_queue is set.
> >>>
> >>> Set the queue lock to &video->queue_lock, which makes it possible to drop
> >>> the wait_prepare/finish callbacks.
> >>>
> >>> This simplifies the code and this is a step towards the goal of deleting
> >>> these callbacks.
> >>>
> >>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> >>> ---
> >>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 19 +------------------
> >>>  1 file changed, 1 insertion(+), 18 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>> index 5c9aa80023fd..78e30298c7ad 100644
> >>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>> @@ -480,29 +480,11 @@ static int isp_video_start_streaming(struct vb2_queue *queue,
> >>>  	return 0;
> >>>  }
> >>>
> >>> -static void omap3isp_wait_prepare(struct vb2_queue *vq)
> >>> -{
> >>> -	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
> >>> -	struct isp_video *video = vfh->video;
> >>> -
> >>> -	mutex_unlock(&video->queue_lock);
> >>> -}
> >>> -
> >>> -static void omap3isp_wait_finish(struct vb2_queue *vq)
> >>> -{
> >>> -	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
> >>> -	struct isp_video *video = vfh->video;
> >>> -
> >>> -	mutex_lock(&video->queue_lock);
> >>> -}
> >>> -
> >>>  static const struct vb2_ops isp_video_queue_ops = {
> >>>  	.queue_setup = isp_video_queue_setup,
> >>>  	.buf_prepare = isp_video_buffer_prepare,
> >>>  	.buf_queue = isp_video_buffer_queue,
> >>>  	.start_streaming = isp_video_start_streaming,
> >>> -	.wait_prepare = omap3isp_wait_prepare,
> >>> -	.wait_finish = omap3isp_wait_finish,
> >>>  };
> >>>
> >>>  /*
> >>> @@ -1338,6 +1320,7 @@ static int isp_video_open(struct file *file)
> >>>  	queue->buf_struct_size = sizeof(struct isp_buffer);
> >>>  	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >>>  	queue->dev = video->isp->dev;
> >>> +	queue->lock = &video->queue_lock;
> >>
> >> This is goind to deadlock at least when calling VIDIOC_DQBUF in blocking
> >> mode.
> > 
> > Yeah, you are right. I think I will need to test this on real hardware.
> > 
> > That will take some time.
> 
> So I finally managed to test this patch on my BeagleBoard Xm, and it
> works fine.
> 
> The reason it works is that the queue pointer in struct video_device
> is never set.
> 
> Normally v4l2_ioctl_get_lock() in v4l2-ioctl.c tries to return the
> vdev->queue->lock, and that would indeed cause a deadlock (the core
> takes that lock, then isp_video_dqbuf() takes it again). But omap3isp
> never sets vdev->queue nor does it set vdev->lock. So v4l2_ioctl_get_lock()
> returns a NULL pointer instead, meaning that the core won't do any
> locking.
> 
> So I think this patch is good.

Feel free to add:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> That said, I had to fix a lot of other issues and even with that all I
> capture is only 0 values. It has a severe case of bitrot :-(
> 
> I plan to post my fixes when I have some more time.

Which sensor did you have?

I can also test with the N9, I'm not sure it'll be different though. This
still used to work before the IOMMU changes.

-- 
Regards,

Sakari Ailus

