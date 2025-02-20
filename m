Return-Path: <linux-media+bounces-26451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4786A3D92C
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 12:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBA61188E068
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 11:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20E71F4635;
	Thu, 20 Feb 2025 11:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O6RlKVB9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B641F460F
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 11:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740052209; cv=none; b=hzb0neagRmb6lwarxEEPn3DuOWW7rTob6PIzl3uojb2zluu664GPh7CIRHd6CVEWDrriCqJm5cSk3w5uOpjbUwRgl2hpP6EUZKK7c4i2BuF4yvaFXz/0nMCp33M8HYkYVA7yrJQPd4GhtKhQwKVNQtjBn3kyMT3LYt6v1RS7dnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740052209; c=relaxed/simple;
	bh=caq109IXkOTJxJybUDy1R0bcAcL3v0tUnF5afWSGb4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+ULlp2WLA0yBUjCGgXiTyTahNinq7mhASrx0gJsihpWJX024lEpAA/hccUD7tVl08lMDWupV7MagcDyqENyYeCfPmoYklcR446u9o4Ea62IxKjC1G6AFQjrjfU6k/XBtwYqVYGqv/cnSdLsxXvX5dpGqMohBDVfsx5CFwZv7+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O6RlKVB9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 281A474C;
	Thu, 20 Feb 2025 12:48:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740052122;
	bh=caq109IXkOTJxJybUDy1R0bcAcL3v0tUnF5afWSGb4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6RlKVB94Np7gAj2GZPW3Cm4iqfFprU7fS4/39h4hQWuhUFBAhifr2rcabvBcwXDm
	 rTyBGlr/X26IUkHQq+twB0a/1HATPEQZRZyHq3OSGY5ihv3eDVmMsCyEdBqx5QIA32
	 RrvgkZV4iQSNlnrfaVjxdZ2lH0HdJxyOCSjs8iRk=
Date: Thu, 20 Feb 2025 13:49:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: omap3isp: drop wait_prepare/finish callbacks
Message-ID: <20250220114950.GB22240@pendragon.ideasonboard.com>
References: <218877d9-5f95-42ab-8bbf-2325cb31ed73@xs4all.nl>
 <20250128154040.GF12673@pendragon.ideasonboard.com>
 <f11dab4a-0288-42ae-b6c1-a548206a1249@xs4all.nl>
 <7e2bf95e-5cbd-4792-a8b6-d38a1532f3dd@xs4all.nl>
 <Z7bgqrfTovdssWTc@kekkonen.localdomain>
 <61241a2a-1b87-4711-af2c-26a97a1ef6a7@xs4all.nl>
 <Z7cGtplfDTHXB_NZ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7cGtplfDTHXB_NZ@kekkonen.localdomain>

On Thu, Feb 20, 2025 at 10:40:54AM +0000, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Feb 20, 2025 at 09:10:39AM +0100, Hans Verkuil wrote:
> > On 20/02/2025 08:58, Sakari Ailus wrote:
> > > Hi Hans,
> > > 
> > > On Thu, Feb 20, 2025 at 08:48:32AM +0100, Hans Verkuil wrote:
> > >> On 29/01/2025 15:21, Hans Verkuil wrote:
> > >>> On 28/01/2025 16:40, Laurent Pinchart wrote:
> > >>>> Hi Hans,
> > >>>>
> > >>>> Thank you for the patch.
> > >>>>
> > >>>> On Tue, Jan 28, 2025 at 04:08:18PM +0100, Hans Verkuil wrote:
> > >>>>> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> > >>>>> are NULL") it is no longer needed to set the wait_prepare/finish
> > >>>>> vb2_ops callbacks as long as the lock field in vb2_queue is set.
> > >>>>>
> > >>>>> Set the queue lock to &video->queue_lock, which makes it possible to drop
> > >>>>> the wait_prepare/finish callbacks.
> > >>>>>
> > >>>>> This simplifies the code and this is a step towards the goal of deleting
> > >>>>> these callbacks.
> > >>>>>
> > >>>>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> > >>>>> ---
> > >>>>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 19 +------------------
> > >>>>>  1 file changed, 1 insertion(+), 18 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> > >>>>> index 5c9aa80023fd..78e30298c7ad 100644
> > >>>>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> > >>>>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> > >>>>> @@ -480,29 +480,11 @@ static int isp_video_start_streaming(struct vb2_queue *queue,
> > >>>>>  	return 0;
> > >>>>>  }
> > >>>>>
> > >>>>> -static void omap3isp_wait_prepare(struct vb2_queue *vq)
> > >>>>> -{
> > >>>>> -	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
> > >>>>> -	struct isp_video *video = vfh->video;
> > >>>>> -
> > >>>>> -	mutex_unlock(&video->queue_lock);
> > >>>>> -}
> > >>>>> -
> > >>>>> -static void omap3isp_wait_finish(struct vb2_queue *vq)
> > >>>>> -{
> > >>>>> -	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
> > >>>>> -	struct isp_video *video = vfh->video;
> > >>>>> -
> > >>>>> -	mutex_lock(&video->queue_lock);
> > >>>>> -}
> > >>>>> -
> > >>>>>  static const struct vb2_ops isp_video_queue_ops = {
> > >>>>>  	.queue_setup = isp_video_queue_setup,
> > >>>>>  	.buf_prepare = isp_video_buffer_prepare,
> > >>>>>  	.buf_queue = isp_video_buffer_queue,
> > >>>>>  	.start_streaming = isp_video_start_streaming,
> > >>>>> -	.wait_prepare = omap3isp_wait_prepare,
> > >>>>> -	.wait_finish = omap3isp_wait_finish,
> > >>>>>  };
> > >>>>>
> > >>>>>  /*
> > >>>>> @@ -1338,6 +1320,7 @@ static int isp_video_open(struct file *file)
> > >>>>>  	queue->buf_struct_size = sizeof(struct isp_buffer);
> > >>>>>  	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > >>>>>  	queue->dev = video->isp->dev;
> > >>>>> +	queue->lock = &video->queue_lock;
> > >>>>
> > >>>> This is goind to deadlock at least when calling VIDIOC_DQBUF in blocking
> > >>>> mode.
> > >>>
> > >>> Yeah, you are right. I think I will need to test this on real hardware.
> > >>
> > >> I still haven't found my Beagle Board. I found the box for the Beagle Board,
> > >> but not the board itself :-(
> > >>
> > >> When I'm back in the Netherlands I'll dig around some more to see if it is
> > >> there, but if I can't find it, are you or someone else from Ideas on Board
> > >> willing to test patches from me?
> > >>
> > >> This driver is the last remaining user of these wait_prepare/finish helpers,
> > >> so I'd really like to get this fixed.
> > > 
> > > If you have a patch, I can test it, presuming omap3isp will work on N900.
> > > :-) I haven't tested it for a while.
> > > 
> > > omap3isp is a bit special as the video buffer queues are specific to file
> > > handles but I'm not sure it matters here.
> > > 
> > 
> > That shouldn't matter. Thank you for the offer, I'll keep you in reserve if
> > I really can't find my Beagle Board.
> > 
> > I've got the freakin' box, so the board must be somewhere, right?
> 
> Absolutely! :-)
> 
> Btw. if you happen to have free time, reworking the Media device lifetime
> management set to your liking could be an option to solve that problem. :-)
> 
> With the Rust support knocking, we should really get the lifetime
> management issues resolved. Still that set is just the beginning of it,
> much more work will be needed.

I asked in
https://lore.kernel.org/ksummit/20250219150553.GD15114@pendragon.ideasonboard.com/
if any R4L (rust for Linux) developers could help with the C side, and
offered to learn enough rust to review rust adaptation patches for V4L2
in return. That would be one concrete way to build trust and show that
rust in the kernel would help reducing maintainer overload.

-- 
Regards,

Laurent Pinchart

