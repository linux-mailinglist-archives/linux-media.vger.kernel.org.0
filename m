Return-Path: <linux-media+bounces-26445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AEFA3D6F2
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 11:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 151A6165A13
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 10:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1B61F1312;
	Thu, 20 Feb 2025 10:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N73N9BV4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B541CAA9C
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740048060; cv=none; b=f1uXe79heGce6fq5pjcq9fV9RCzrD8Clr/Gw4F9zOXlnNHavM/nM8ddvLaWOS/NQ4FfbCvgfll5uiP0fdXmo48y14KqxaC/7KJgIWsUHx1jz30MfysyIpiL6FX7+7QusG9TcAdk4gnRXq0CU9r39k4p9t7Ny/WsMDPdn7LizUEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740048060; c=relaxed/simple;
	bh=Ys/z+6f/cxPoJlaEcs2I04YvG7rvcbyXVsiRPJHFG40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQx+CCUXILXy0+NizeOMEB0LLrTJR2lGu2qKGxEuMOj9NAO/MG29KEky9lukCc7pg2HfZ3pun1NV23gkDaZDhqccFyQSConsrWsT5NlQsmU2I2n6IUuuU23Zxl9Rz+AIyx48sIy1xsZJ/J034j32oar+zMnzuu7cRUiDsS0sBi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N73N9BV4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740048059; x=1771584059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ys/z+6f/cxPoJlaEcs2I04YvG7rvcbyXVsiRPJHFG40=;
  b=N73N9BV4NpOL3n2UJKiFnsn5O5VLSR6+s2NNseho0TrVCdbfYh2nS+eA
   xyDPg8qpSSmNkfoqRF5MGwb0piRNDU5/l3BOY70OfPkAMbpf5nLxnYWG+
   sNcViJKSbIhLbUxXLd5/HaFV2siEjnJEySMiULT6bMAIj6SA5qtw+tlOq
   MfjYto7YQz0eiKGl1wpVvvAjligxVicwwPQ58BD/3EDdtTwaqJmPjzz4n
   YtMDkJefnTyvBK+fcRSBvUKnkYfsIx83IoN29o1VbaHLtXZscPYseMf59
   CXmkaEs0pSIGbLaW7ELS7+jZm3wyhZ0kep0Wg6VA5YbNDEXe9B/QtmTWF
   w==;
X-CSE-ConnectionGUID: LgD5toVsS8O8CdHHBPviDg==
X-CSE-MsgGUID: 3S47yfMuQLmFDGTEV7uxfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="28416740"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="28416740"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 02:40:58 -0800
X-CSE-ConnectionGUID: QadFVxz9SXqoTYiMx6g5gA==
X-CSE-MsgGUID: +z39ITyDS1O+8bdimXYq+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120227188"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 02:40:57 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3C24511F945;
	Thu, 20 Feb 2025 12:40:54 +0200 (EET)
Date: Thu, 20 Feb 2025 10:40:54 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: omap3isp: drop wait_prepare/finish callbacks
Message-ID: <Z7cGtplfDTHXB_NZ@kekkonen.localdomain>
References: <218877d9-5f95-42ab-8bbf-2325cb31ed73@xs4all.nl>
 <20250128154040.GF12673@pendragon.ideasonboard.com>
 <f11dab4a-0288-42ae-b6c1-a548206a1249@xs4all.nl>
 <7e2bf95e-5cbd-4792-a8b6-d38a1532f3dd@xs4all.nl>
 <Z7bgqrfTovdssWTc@kekkonen.localdomain>
 <61241a2a-1b87-4711-af2c-26a97a1ef6a7@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61241a2a-1b87-4711-af2c-26a97a1ef6a7@xs4all.nl>

Hi Hans,

On Thu, Feb 20, 2025 at 09:10:39AM +0100, Hans Verkuil wrote:
> On 20/02/2025 08:58, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Thu, Feb 20, 2025 at 08:48:32AM +0100, Hans Verkuil wrote:
> >> On 29/01/2025 15:21, Hans Verkuil wrote:
> >>> On 28/01/2025 16:40, Laurent Pinchart wrote:
> >>>> Hi Hans,
> >>>>
> >>>> Thank you for the patch.
> >>>>
> >>>> On Tue, Jan 28, 2025 at 04:08:18PM +0100, Hans Verkuil wrote:
> >>>>> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> >>>>> are NULL") it is no longer needed to set the wait_prepare/finish
> >>>>> vb2_ops callbacks as long as the lock field in vb2_queue is set.
> >>>>>
> >>>>> Set the queue lock to &video->queue_lock, which makes it possible to drop
> >>>>> the wait_prepare/finish callbacks.
> >>>>>
> >>>>> This simplifies the code and this is a step towards the goal of deleting
> >>>>> these callbacks.
> >>>>>
> >>>>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> >>>>> ---
> >>>>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 19 +------------------
> >>>>>  1 file changed, 1 insertion(+), 18 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>>>> index 5c9aa80023fd..78e30298c7ad 100644
> >>>>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>>>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>>>> @@ -480,29 +480,11 @@ static int isp_video_start_streaming(struct vb2_queue *queue,
> >>>>>  	return 0;
> >>>>>  }
> >>>>>
> >>>>> -static void omap3isp_wait_prepare(struct vb2_queue *vq)
> >>>>> -{
> >>>>> -	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
> >>>>> -	struct isp_video *video = vfh->video;
> >>>>> -
> >>>>> -	mutex_unlock(&video->queue_lock);
> >>>>> -}
> >>>>> -
> >>>>> -static void omap3isp_wait_finish(struct vb2_queue *vq)
> >>>>> -{
> >>>>> -	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
> >>>>> -	struct isp_video *video = vfh->video;
> >>>>> -
> >>>>> -	mutex_lock(&video->queue_lock);
> >>>>> -}
> >>>>> -
> >>>>>  static const struct vb2_ops isp_video_queue_ops = {
> >>>>>  	.queue_setup = isp_video_queue_setup,
> >>>>>  	.buf_prepare = isp_video_buffer_prepare,
> >>>>>  	.buf_queue = isp_video_buffer_queue,
> >>>>>  	.start_streaming = isp_video_start_streaming,
> >>>>> -	.wait_prepare = omap3isp_wait_prepare,
> >>>>> -	.wait_finish = omap3isp_wait_finish,
> >>>>>  };
> >>>>>
> >>>>>  /*
> >>>>> @@ -1338,6 +1320,7 @@ static int isp_video_open(struct file *file)
> >>>>>  	queue->buf_struct_size = sizeof(struct isp_buffer);
> >>>>>  	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >>>>>  	queue->dev = video->isp->dev;
> >>>>> +	queue->lock = &video->queue_lock;
> >>>>
> >>>> This is goind to deadlock at least when calling VIDIOC_DQBUF in blocking
> >>>> mode.
> >>>
> >>> Yeah, you are right. I think I will need to test this on real hardware.
> >>
> >> I still haven't found my Beagle Board. I found the box for the Beagle Board,
> >> but not the board itself :-(
> >>
> >> When I'm back in the Netherlands I'll dig around some more to see if it is
> >> there, but if I can't find it, are you or someone else from Ideas on Board
> >> willing to test patches from me?
> >>
> >> This driver is the last remaining user of these wait_prepare/finish helpers,
> >> so I'd really like to get this fixed.
> > 
> > If you have a patch, I can test it, presuming omap3isp will work on N900.
> > :-) I haven't tested it for a while.
> > 
> > omap3isp is a bit special as the video buffer queues are specific to file
> > handles but I'm not sure it matters here.
> > 
> 
> That shouldn't matter. Thank you for the offer, I'll keep you in reserve if
> I really can't find my Beagle Board.
> 
> I've got the freakin' box, so the board must be somewhere, right?

Absolutely! :-)

Btw. if you happen to have free time, reworking the Media device lifetime
management set to your liking could be an option to solve that problem. :-)

With the Rust support knocking, we should really get the lifetime
management issues resolved. Still that set is just the beginning of it,
much more work will be needed.

-- 
Regards,

Sakari Ailus

