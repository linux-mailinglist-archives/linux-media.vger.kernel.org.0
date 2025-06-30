Return-Path: <linux-media+bounces-36290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC55AEDE9B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A3061615C9
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAEE28A1D0;
	Mon, 30 Jun 2025 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L05Dk8Jn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6384723A987;
	Mon, 30 Jun 2025 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289033; cv=none; b=DOfxVvC7Fwrbisb39wflfNSOAGH0I20LSSy7zwl3vHU3Uu/MVCcCDA2ZbzcOzd/eIi2M3j6Bol+YmDviBIimswaW9YkYkW9QTAWW8YOoZZr6ODX9D7XrUJ2rD6K8O6pky27a3o5k4Vq/fHAu6oStxWXLd8UEbPcCptFXakF8FXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289033; c=relaxed/simple;
	bh=mZZD5+PO07CcheATfAnTTx+8kWiU0ytL1U4UNq+W0h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/UFehKY39NLzoczI+im3sSJH4NdfuI90ZykWFReYVHQYORnC86PPzE5F/X4JodFsdGlHcEJdoAk4bMye4cvwRXZj5Q4XMEh0sBf8FOPX3UgoR105oLQa2MRdaZmIXjMhRRP60yS1dDSyXuW+ZU+l/X2goG7R39O1htlnUAcy+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L05Dk8Jn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A7B9911EB;
	Mon, 30 Jun 2025 15:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751289007;
	bh=mZZD5+PO07CcheATfAnTTx+8kWiU0ytL1U4UNq+W0h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L05Dk8Jn2QisbsgNo8u6bk0OMEJqFCQ4ksW7293E5Lhf0y5ks5GN2dfxFirTz8meT
	 JHxZxr4SJjEC26DpPbue+TxNaUyHzWBZt1itcMm97kSj4DNShFWoyLv1gDCJr5lo0W
	 0y8JH2dlOj6O//eicFZ5Y2hhz2jKGgfRYhftIpcU=
Date: Mon, 30 Jun 2025 16:10:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: uvcvideo: Split uvc_stop_streaming()
Message-ID: <20250630131004.GF20333@pendragon.ideasonboard.com>
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-3-250286570ee7@chromium.org>
 <04e10cfa-f1b1-4327-b0ca-c66f8450d42f@xs4all.nl>
 <c97af8e7-5c11-45f4-838c-d934b0a379c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c97af8e7-5c11-45f4-838c-d934b0a379c1@kernel.org>

On Mon, Jun 30, 2025 at 02:59:05PM +0200, Hans de Goede wrote:
> On 17-Jun-25 11:27 AM, Hans Verkuil wrote:
> > On 16/06/2025 17:24, Ricardo Ribalda wrote:
> >> uvc_stop_streaming() is used for meta and video nodes. Split the function
> >> in two to avoid confusion.
> >>
> >> Use this opportunity to rename uvc_start_streaming() to
> >> uvc_start_streaming_video(), as it is only called by the video nodes.
> >>
> >> Reviewed-by: Hans de Goede <hansg@kernel.org>
> >> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> ---
> >>  drivers/media/usb/uvc/uvc_queue.c | 22 +++++++++++++++-------
> >>  1 file changed, 15 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> >> index 8f9737ac729546683ca48f5e71ce3dfacbae2926..3f357c2d48cfd258c26f0342007d1d12f1e01007 100644
> >> --- a/drivers/media/usb/uvc/uvc_queue.c
> >> +++ b/drivers/media/usb/uvc/uvc_queue.c
> >> @@ -167,7 +167,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
> >>  		uvc_video_clock_update(stream, vbuf, buf);
> >>  }
> >>  
> >> -static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> >> +static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
> >>  {
> >>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> >>  	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> >> @@ -186,14 +186,22 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> >>  	return ret;
> >>  }
> >>  
> >> -static void uvc_stop_streaming(struct vb2_queue *vq)
> >> +static void uvc_stop_streaming_video(struct vb2_queue *vq)
> >>  {
> >>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> >>  
> >>  	lockdep_assert_irqs_enabled();
> >>  
> >> -	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
> >> -		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> >> +	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> >> +
> >> +	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> >> +}
> >> +
> >> +static void uvc_stop_streaming_meta(struct vb2_queue *vq)
> >> +{
> >> +	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> >> +
> >> +	lockdep_assert_irqs_enabled();
> >>  
> >>  	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> >>  }
> >> @@ -203,15 +211,15 @@ static const struct vb2_ops uvc_queue_qops = {
> >>  	.buf_prepare = uvc_buffer_prepare,
> >>  	.buf_queue = uvc_buffer_queue,
> >>  	.buf_finish = uvc_buffer_finish,
> >> -	.start_streaming = uvc_start_streaming,
> >> -	.stop_streaming = uvc_stop_streaming,
> >> +	.start_streaming = uvc_start_streaming_video,
> >> +	.stop_streaming = uvc_stop_streaming_video,
> >>  };
> >>  
> >>  static const struct vb2_ops uvc_meta_queue_qops = {
> >>  	.queue_setup = uvc_queue_setup,
> >>  	.buf_prepare = uvc_buffer_prepare,
> >>  	.buf_queue = uvc_buffer_queue,
> >> -	.stop_streaming = uvc_stop_streaming,
> >> +	.stop_streaming = uvc_stop_streaming_meta,
> >>  };
> > 
> > I think there should be a comment stating that the metadata stream
> > expects that video is streaming, it does not start streaming by itself.
> > 
> > Something like:
> > 
> > 	/*
> > 	 * .start_streaming is not provided here. Metadata relies on
> > 	 * video streaming being active. If video isn't streaming, then
> > 	 * no metadata will arrive either.
> > 	 */
> > 
> > It's unexpected that there is no start_streaming for metadata, so a
> > comment wouldn't hurt.
> 
> I've added this comment while merging this series and I've now pushed
> the entire series to uvc.git/for-next .
> 
> BTW it seems that both uvc.git/next and uvc.git/for-next are in
> use now?  With uvc.git/next seemingly following media-commiters/next ?

As far as I understand, some jobs in the media CI use the next branch,
for instance the bisect job that tries to compile every commit uses the
next branch as a base. We therefore need to keep the next branch
up-to-date, mirroring upstream.

> I thought we had agreed to only use uvc.git/for-next ?

-- 
Regards,

Laurent Pinchart

