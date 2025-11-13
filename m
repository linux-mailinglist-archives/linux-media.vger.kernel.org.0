Return-Path: <linux-media+bounces-47020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B15C5A3DA
	for <lists+linux-media@lfdr.de>; Thu, 13 Nov 2025 22:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D5E034FB42B
	for <lists+linux-media@lfdr.de>; Thu, 13 Nov 2025 21:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B6B322C63;
	Thu, 13 Nov 2025 21:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dE5u0BfX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08B12F5A05;
	Thu, 13 Nov 2025 21:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069875; cv=none; b=ndW5gL+/FUgAQXv30fEGHxUDEJ3eqiS8H0kpya0E4CbM6FPnc3Pw3i0kVXNWmyvx20cSgqaIn+Pu3j1slO1lo0FnuavTRquVEU9TvYGnxx6qDoq4VSY9Ay+vfPRvQfBADHf/dA0jwVC2R+LRkZaBn3Vs0bF8ippgzAxw8HjHP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069875; c=relaxed/simple;
	bh=ZEvMSYQn3qX32oQ0cS7GX9KlSRR2/sSwyGOpDRMxdx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyZKC1ydk1dXXBaF/0b3TU9c9Hrt7CrsEvSr9EbBnBMQexnzawmPeA3kSYYmLuaFEthZ6WXkgRBqSVloYMNaZ6Eb54MLSFfSiXfnd94WFvdwUXvbiNGcUAY4omnk5xh4OtBAmW+bf2KY3lIWuuHSMvEWpOnlp5vN5Z3baaAyGmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dE5u0BfX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-165-222.bb.dnainternet.fi [82.203.165.222])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2390B5B2;
	Thu, 13 Nov 2025 22:35:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763069744;
	bh=ZEvMSYQn3qX32oQ0cS7GX9KlSRR2/sSwyGOpDRMxdx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dE5u0BfX5p5nUpoUTk15ZrOwnkZ9g4IRhcJSkCtLsbUhSnaHYlMBdXcL3mVsB2qUz
	 DrvVhfb766HUsHy7kCE8xkTW+xHgVKhQ5KywBd2pTzm+KMDK2uRT/rz29ITRsGMQX7
	 RLBSiX2eLlKlk19bJBiM516cbZmqrh/v1EurvT1U=
Date: Thu, 13 Nov 2025 23:37:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Return queued buffers on
 start_streaming() failure
Message-ID: <20251113213733.GF9135@pendragon.ideasonboard.com>
References: <20251015133642.3dede646.michal.pecio@gmail.com>
 <CAPybu_0O10SsPp4G8SfcsbCP5k1gXQJ5Hmhw4kMFTZguEZ7iBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPybu_0O10SsPp4G8SfcsbCP5k1gXQJ5Hmhw4kMFTZguEZ7iBQ@mail.gmail.com>

On Tue, Oct 21, 2025 at 12:47:23PM +0200, Ricardo Ribalda Delgado wrote:
> Hi Michal
> 
> It seems that the device was disconnected while doing streamon. That
> caused uvc_pm_get() to fail and exit without returning the buffers.
> 
> Your patch is not going to help to fix:
> xhci_hcd 0000:09:00.0: HC died; cleaning up
> usb 13-2: USB disconnect, device number 2
> 
> But it is fixing an issue. thanks :)
> 
> On Wed, Oct 15, 2025 at 1:36 PM Michal Pecio <michal.pecio@gmail.com> wrote:
> >
> > Return buffers if streaming fails to start due to uvc_pm_get() error.
> >
> > This bug may be responsible for a warning I got running
> >
> >     while :; do yavta -c3 /dev/video0; done
> >
> > on an xHCI controller which failed under this workload.
> > I had no luck reproducing this warning again to confirm.
> >
> > xhci_hcd 0000:09:00.0: HC died; cleaning up
> > usb 13-2: USB disconnect, device number 2
> > WARNING: CPU: 2 PID: 29386 at drivers/media/common/videobuf2/videobuf2-core.c:1803 vb2_start_streaming+0xac/0x120
> >
> > Fixes: 7dd56c47784a ("media: uvcvideo: Remove stream->is_streaming field")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> > ---
> >  drivers/media/usb/uvc/uvc_queue.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > index 790184c9843d..f49c538618bc 100644
> > --- a/drivers/media/usb/uvc/uvc_queue.c
> > +++ b/drivers/media/usb/uvc/uvc_queue.c
> > @@ -177,7 +177,7 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
> >
> >         ret = uvc_pm_get(stream->dev);
> >         if (ret)
> > -               return ret;
> > +               goto return_buffers;
> >
> >         queue->buf_used = 0;
> >
> > @@ -187,6 +187,7 @@ static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
> >
> >         uvc_pm_put(stream->dev);
> >
> > +return_buffers:
> >         uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
> >
> >         return ret;

Error labels should start with err_. I'd like to take this as an
opportunity to reorganize the error path with something like

	ret = uvc_pm_get(stream->dev);
	if (ret)
		goto err_buffers;
 
	queue->buf_used = 0;

	ret = uvc_video_start_streaming(stream);
	if (ret)
		goto err_pm;

	return 0;
 
err_pm:
	uvc_pm_put(stream->dev);
err_buffers:
	uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
	return ret;


I'll send a v2 that does this.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

