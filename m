Return-Path: <linux-media+bounces-33929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BB9ACB0E7
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 16:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 768BF1BA6D64
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 14:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598C922FF2E;
	Mon,  2 Jun 2025 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="df1SS2LE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0757B22F384;
	Mon,  2 Jun 2025 14:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872967; cv=none; b=NDLE0R9531wIxn/7C+0e8WDI3pzvGixyOINOUnEav6IikUGufhlgUYnVHRqJ+Xr0WLveJtoIZd5LOK8pNiuF51UZ0w1RITVVNfRBLYeu9NxeELEamlwG9urNxoTuLaoS30IFMzdtACpBsf4C9AYvVIFp362HOW9zRpC8JjGQb7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872967; c=relaxed/simple;
	bh=/cB+a7rwajGpblAy9fvnPZX+2E9i45cREbh/9pNRuQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bj08d7kIopn316I3BhTHY8+hen9sncwe/dq1+K7HZC4mNfPEOweghNCjNH53WGpFeY7Y+2CZe5oQyDXCetEvnbPx6xRoSQAx14xO+XjtosJbl8q3hXwnjxahOXxl2vk0eoaArona7HXjggo5+P3qkIuQuEyXfsWB6TXDm9VqCgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=df1SS2LE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE3CB379;
	Mon,  2 Jun 2025 16:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748872962;
	bh=/cB+a7rwajGpblAy9fvnPZX+2E9i45cREbh/9pNRuQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=df1SS2LElV0Y67BO1x+o54cbGBV3HtkRGE1EQosHheZ/2+manOTJahdWyfhX+oWyj
	 4p9FeWHX4bUKCyWYfF8L1/rsmek4kogZiH+hendALKpTHiUHLUndV7+sf7iNYBIFVt
	 kgds+3BdyWFQ5v81NWDmuTpTsxRjfRK5NilT3Mdw=
Date: Mon, 2 Jun 2025 17:02:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Remove stream->is_streaming field
Message-ID: <20250602140235.GE23515@pendragon.ideasonboard.com>
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
 <20250602-uvc-fop-v2-3-508a293eae81@chromium.org>
 <dba66347-7b6c-49b5-8d31-166845efd1a0@jjverkuil.nl>
 <CANiDSCttXAu0bJHG7L=Y4Y0LqfRQa=Y-wC8PKr1Pv7Hwpq6Txg@mail.gmail.com>
 <663123d4-9ac4-4c8d-bc88-d4e197786199@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <663123d4-9ac4-4c8d-bc88-d4e197786199@jjverkuil.nl>

On Mon, Jun 02, 2025 at 03:47:50PM +0200, Hans Verkuil wrote:
> On 02/06/2025 15:33, Ricardo Ribalda wrote:
> > On Mon, 2 Jun 2025 at 15:23, Hans Verkuil wrote:
> >> On 02/06/2025 14:59, Ricardo Ribalda wrote:
> >>> The is_streaming field is used by modular PM to know if the device is
> >>> currently streaming or not.
> >>>
> >>> With the transition to vb2 and fop helpers, we can use vb2 functions for
> >>> the same functionality. The great benefit is that vb2 already takes
> >>> track of the streaming state for us.
> >>>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  drivers/media/usb/uvc/uvc_queue.c | 11 ++++++++-
> >>>  drivers/media/usb/uvc/uvc_v4l2.c  | 51 ++-------------------------------------
> >>>  drivers/media/usb/uvc/uvcvideo.h  |  1 -
> >>>  3 files changed, 12 insertions(+), 51 deletions(-)
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> >>> index 72c5494dee9f46ff61072e7d293bfaddda40e615..dff93bec204428b8aebc09332e0322fa68823fa4 100644
> >>> --- a/drivers/media/usb/uvc/uvc_queue.c
> >>> +++ b/drivers/media/usb/uvc/uvc_queue.c
> >>> @@ -165,12 +165,18 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> >>>
> >>>       lockdep_assert_irqs_enabled();
> >>>
> >>> +     ret = uvc_pm_get(stream->dev);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>>       queue->buf_used = 0;
> >>>
> >>>       ret = uvc_video_start_streaming(stream);
> >>
> >> I'm not sure this is correct. See comments below.
> >>
> >>>       if (ret == 0)
> >>>               return 0;
> >>>
> >>> +     uvc_pm_put(stream->dev);
> >>> +
> >>>       spin_lock_irq(&queue->irqlock);
> >>>       uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
> >>>       spin_unlock_irq(&queue->irqlock);
> >>> @@ -181,11 +187,14 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> >>>  static void uvc_stop_streaming(struct vb2_queue *vq)
> >>>  {
> >>>       struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> >>> +     struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> >>>
> >>>       lockdep_assert_irqs_enabled();
> >>>
> >>> -     if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
> >>> +     if (vq->type != V4L2_BUF_TYPE_META_CAPTURE) {
> >>> +             uvc_pm_put(stream->dev);
> >>
> >> This doesn't look right, for both video and metadata uvc_pm_get is called,
> >> but only for video is put called.
> > 
> > Please take a look at
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_queue.c#n195
> > 
> > start_streaming is not called for metadata nodes, only for video nodes.
> 
> So when you start streaming metadata and no video is streaming, then nothing
> happens. I noticed this before, in fact. Only after you also start to stream
> video will the metadata start to arrive. And it stops again as soon as you
> stop streaming video.
> 
> That's not really how it is supposed to work: whoever starts streaming first
> is the one that calls uvc_video_start_streaming. And only when nobody is streaming
> should uvc_video_stop_streaming be called. That's how it works in other drivers
> (e.g. those that stream both video and vbi, or even more different types of data).
> 
> Fixing this would change the behavior of uvc, and I'm not sure if this is
> something we want. I leave that to Laurent and Hans.

I don't see a use case for capturing metadata only, so I think we can
keep the behaviour as-is.

> If this isn't fixed, then at least add a comment explaining why you test for
> != V4L2_BUF_TYPE_META_CAPTURE before calling uvc_pm_put. It's not obvious.

Agreed.

> >>>               uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> >>
> >> And this is odd too.
> >>
> >>> +     }
> >>
> >> My assumption is that uvc_video_start_streaming and uvc_video_stop_streaming
> >> are valid for both video and meta: i.e. the first time you start streaming
> >> (either video or meta) you call uvc_video_start_streaming. If you were already
> >> streaming for e.g. video, then start streaming metadata (or vice versa), then
> >> you don't need to do anything in start_streaming.
> >>
> >> Same for stop_streaming: only if both video and metadata stopped streaming
> >> is uvc_video_stop_streaming called.
> >>
> >> Please correct me if I am wrong.
> >>
> >> In any case, if I am right, then you have to rework this code accordingly.
> >>
> >> Regardless, you need to test various sequences of streaming video and metadata
> >> in different orders and make sure this is handled correctly.
> > 
> > I have tried streaming and getting frames. After some seconds the
> > device turns off as expected.
> > 
> >>>       spin_lock_irq(&queue->irqlock);
> >>>       uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> >>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> >>> index 7a5ecbefa32c0a6b74c85d7f77a25b433598471e..d4bee0d4334b764c0cf02363b573b55fb44eb228 100644
> >>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >>> @@ -617,9 +617,6 @@ static int uvc_v4l2_release(struct file *file)
> >>>
> >>>       uvc_ctrl_cleanup_fh(handle);
> >>>
> >>> -     if (handle->is_streaming)
> >>> -             uvc_pm_put(stream->dev);
> >>> -
> >>>       /* Release the file handle. */
> >>>       vb2_fop_release(file);
> >>>       file->private_data = NULL;
> >>> @@ -677,50 +674,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
> >>>       return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
> >>>  }
> >>>
> >>> -static int uvc_ioctl_streamon(struct file *file, void *fh,
> >>> -                           enum v4l2_buf_type type)
> >>> -{
> >>> -     struct uvc_fh *handle = fh;
> >>> -     struct uvc_streaming *stream = handle->stream;
> >>> -     int ret;
> >>> -
> >>> -     if (handle->is_streaming)
> >>> -             return 0;
> >>> -
> >>> -     ret = uvc_pm_get(stream->dev);
> >>> -     if (ret)
> >>> -             return ret;
> >>> -
> >>> -     ret = vb2_ioctl_streamon(file, fh, type);
> >>> -     if (ret) {
> >>> -             uvc_pm_put(stream->dev);
> >>> -             return ret;
> >>> -     }
> >>> -
> >>> -     handle->is_streaming = true;
> >>> -
> >>> -     return 0;
> >>> -}
> >>> -
> >>> -static int uvc_ioctl_streamoff(struct file *file, void *fh,
> >>> -                            enum v4l2_buf_type type)
> >>> -{
> >>> -     struct uvc_fh *handle = fh;
> >>> -     struct uvc_streaming *stream = handle->stream;
> >>> -     int ret;
> >>> -
> >>> -     ret = vb2_ioctl_streamoff(file, fh, type);
> >>> -     if (ret)
> >>> -             return ret;
> >>> -
> >>> -     if (handle->is_streaming) {
> >>> -             handle->is_streaming = false;
> >>> -             uvc_pm_put(stream->dev);
> >>> -     }
> >>> -
> >>> -     return 0;
> >>> -}
> >>> -
> >>>  static int uvc_ioctl_enum_input(struct file *file, void *fh,
> >>>                               struct v4l2_input *input)
> >>>  {
> >>> @@ -1323,8 +1276,8 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
> >>>       .vidioc_expbuf = vb2_ioctl_expbuf,
> >>>       .vidioc_dqbuf = vb2_ioctl_dqbuf,
> >>>       .vidioc_create_bufs = vb2_ioctl_create_bufs,
> >>> -     .vidioc_streamon = uvc_ioctl_streamon,
> >>> -     .vidioc_streamoff = uvc_ioctl_streamoff,
> >>> +     .vidioc_streamon = vb2_ioctl_streamon,
> >>> +     .vidioc_streamoff = vb2_ioctl_streamoff,
> >>>       .vidioc_enum_input = uvc_ioctl_enum_input,
> >>>       .vidioc_g_input = uvc_ioctl_g_input,
> >>>       .vidioc_s_input = uvc_ioctl_s_input,
> >>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >>> index 3ddbf065a2cbae40ee48cb06f84ca8f0052990c4..f895f690f7cdc1af942d5f3a5f10e9dd1c956a35 100644
> >>> --- a/drivers/media/usb/uvc/uvcvideo.h
> >>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >>> @@ -626,7 +626,6 @@ struct uvc_fh {
> >>>       struct uvc_video_chain *chain;
> >>>       struct uvc_streaming *stream;
> >>>       unsigned int pending_async_ctrls;
> >>> -     bool is_streaming;
> >>>  };
> >>>
> >>>  /* ------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

