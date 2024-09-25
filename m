Return-Path: <linux-media+bounces-18568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE06C9866E6
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 21:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E05FB23013
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 19:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B235F1422DD;
	Wed, 25 Sep 2024 19:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IgJA9hvV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9582E1EEE9;
	Wed, 25 Sep 2024 19:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727292578; cv=none; b=D8aDBeT8WWT/9qfQ5pzi/QS42re4Mj5WwJfI1bTrnsIgUt57nxAsP9FAHCInqzVwiQ+HHia0my01U9VAT3uAxc8n2gC92478VtiM6J3tlNNDxO9Q7furGDjdsPu3M1CKkb/1e3V/RO7a2w4CPzkPFHV5xOKtB3aZ52jIAjtz+so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727292578; c=relaxed/simple;
	bh=zd9CIfWqD2a5Xm03ZG5N5wiQjOljUnCdd/64SUOKojU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwdIgs+C6RXlcQGSw58vUTnK6Czu6Bmd+wMh5AeOTc9bdAaRadWKiW8j5dPeLM2yajhG7xi811h1fz8kH8/dBXQBBKU/TBe8gKgMCsRc4aHLQpCEz+8FxldbLMUEUT7gNTT2YSLXkMFDuPyN4I8F5m1UhV1uJwtO1QFYYU/LAns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IgJA9hvV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D73717E2;
	Wed, 25 Sep 2024 21:28:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727292487;
	bh=zd9CIfWqD2a5Xm03ZG5N5wiQjOljUnCdd/64SUOKojU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IgJA9hvV92Bi30xQYz0EcSAjPqhBhyAjUzWoOjPiA2KQ4RONXgxigHoGh0UUPgCqr
	 /y9q3hyf0NE55xSj0vimUOwhLXej1dt/yyvZSLJLw/ZZy3h9qzX3FTo2Wy6lU/Z26a
	 WM72cq0mnWa4bxENtR53SQdgVAMIXNRg99P/keQY=
Date: Wed, 25 Sep 2024 22:29:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v6 1/4] media: uvcvideo: Stop stream during unregister
Message-ID: <20240925192932.GF30399@pendragon.ideasonboard.com>
References: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
 <20240614-guenter-mini-v6-1-7b7fdc3b21b3@chromium.org>
 <f4c49ccf-9dc9-475a-8fc9-4ef4c85a729a@xs4all.nl>
 <318aa048-ffdf-4379-929b-54358b018c94@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <318aa048-ffdf-4379-929b-54358b018c94@xs4all.nl>

Hi Hans,

On Wed, Sep 25, 2024 at 11:50:41AM +0200, Hans Verkuil wrote:
> On 25/09/2024 10:32, Hans Verkuil wrote:
> > Hi Laurent,
> > 
> > We discussed this patch last week, and you thought that there was still
> > a race condition if the uvc device was unplugged while an application was
> > in the VIDIOC_DQBUF call waiting for a buffer to arrive (so the vb2 wait_prepare
> > op is called, which unlocks the serialization mutex).
> > 
> > I'll go through the code below, explaining why that isn't an issue.
> 
> Update: I added an extra check for this scenario to the test-media script to make
> sure we catch any potential regressions in how this is handled in the core.

I'm recovering from Vienna and I'll review your explanation towards the
end of the week.

Ricardo, patches 2/4 to 4/4 are not controversial. 2/4 needs a new
version to address small issues. As far as I understand, they don't
depend on 1/4. Would you submit a new version of them that I can merge
right away ?

> > On 14/06/2024 14:41, Ricardo Ribalda wrote:
> >> uvc_unregister_video() can be called asynchronously from
> >> uvc_disconnect(). If the device is still streaming when that happens, a
> >> plethora of race conditions can occur.
> >>
> >> Make sure that the device has stopped streaming before exiting this
> >> function.
> >>
> >> If the user still holds handles to the driver's file descriptors, any
> >> ioctl will return -ENODEV from the v4l2 core.
> >>
> >> This change makes uvc more consistent with the rest of the v4l2 drivers
> >> using the vb2_fop_* and vb2_ioctl_* helpers.
> >>
> >> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> ---
> >>  drivers/media/usb/uvc/uvc_driver.c | 32 +++++++++++++++++++++++++++++++-
> >>  1 file changed, 31 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >> index bbd90123a4e7..55132688e363 100644
> >> --- a/drivers/media/usb/uvc/uvc_driver.c
> >> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >> @@ -1908,11 +1908,41 @@ static void uvc_unregister_video(struct uvc_device *dev)
> >>  	struct uvc_streaming *stream;
> >>  
> >>  	list_for_each_entry(stream, &dev->streams, list) {
> >> +		/* Nothing to do here, continue. */
> >>  		if (!video_is_registered(&stream->vdev))
> >>  			continue;
> >>  
> >> +		/*
> >> +		 * For stream->vdev we follow the same logic as:
> >> +		 * vb2_video_unregister_device().
> >> +		 */
> >> +
> >> +		/* 1. Take a reference to vdev */
> >> +		get_device(&stream->vdev.dev);
> > 
> > This ensures that the device refcount won't go to 0 if video_unregister_device
> > is called (which calls put_device).
> > 
> > But note that if an application called VIDIOC_DQBUF and is waiting for a buffer,
> > then that open filehandle also called get_device(). So while that application is
> > waiting, the device refcount will never go to 0.
> > 
> >> +
> >> +		/* 2. Ensure that no new ioctls can be called. */
> >>  		video_unregister_device(&stream->vdev);
> >> -		video_unregister_device(&stream->meta.vdev);
> >> +
> >> +		/* 3. Wait for old ioctls to finish. */
> >> +		mutex_lock(&stream->mutex);
> > 
> > If VIDIOC_DQBUF is waiting for a buffer to arrive, then indeed we can take this
> > lock here. So in that case this won't wait for that specific ioctl to finish.
> > 
> >> +
> >> +		/* 4. Stop streaming. */
> >> +		uvc_queue_release(&stream->queue);
> > 
> > This will __vb2_queue_cancel() which will stop streaming and wake up the wait for
> > buffers in VIDIOC_DQBUF. It will try to lock this mutex again, and sleeps while
> > waiting for the mutex to become available.
> > 
> >> +
> >> +		mutex_unlock(&stream->mutex);
> > 
> > At this point it can take the mutex again. But since q->streaming is now false,
> > (due to the __vb2_queue_cancel call) this will return an error which is returned
> > to userspace.
> > 
> >> +
> >> +		put_device(&stream->vdev.dev);
> > 
> > This releases the reference we took earlier. If the application has already closed
> > the filehandle, then this will release all memory. If the application still has the
> > fh open, then only when it closes that fh will the memory be released.
> > 
> > Conclusion: there is no race condition here, this is handled correctly by the core.
> > 
> >> +
> >> +		/*
> >> +		 * For stream->meta.vdev we can directly call:
> >> +		 * vb2_video_unregister_device().
> >> +		 */
> >> +		vb2_video_unregister_device(&stream->meta.vdev);
> > 
> > Perhaps a patch adding more comments to the vb2_video_unregister_device()
> > function might help document this sequence better.
> > 
> > Regards,
> > 
> > 	Hans
> > 
> >> +
> >> +		/*
> >> +		 * Now both vdevs are not streaming and all the ioctls will
> >> +		 * return -ENODEV.
> >> +		 */
> >>  
> >>  		uvc_debugfs_cleanup_stream(stream);
> >>  	}
> >>

-- 
Regards,

Laurent Pinchart

