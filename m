Return-Path: <linux-media+bounces-672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1C37F2A9C
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 11:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB5AD1C215AD
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 10:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F083847784;
	Tue, 21 Nov 2023 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D03168C5
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 10:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA44CC433C7;
	Tue, 21 Nov 2023 10:36:54 +0000 (UTC)
Message-ID: <995f8f26-ed20-44d2-a76a-e354fc68d65e@xs4all.nl>
Date: Tue, 21 Nov 2023 11:36:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: uvcvideo: Implement V4L2_EVENT_FRAME_SYNC
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Esker Wong <esker@chromium.org>
References: <20231106-uvc-event-v3-1-c2d2fdaa2e2c@chromium.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20231106-uvc-event-v3-1-c2d2fdaa2e2c@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

Sorry, I missed the whole discussion for the v2 patch. I've now read it and
will reply here.

On 11/6/23 12:00, Ricardo Ribalda wrote:
> Add support for the frame_sync event, so user-space can become aware
> earlier of new frames.

I don't think this describes why you want this. Specifically, you want to use
this to measure latency inside the driver between the arrival of the first USB
packet and the time the buffer is dequeued.

And this is presumably meant for debugging/measuring, but not for normal
capturing. Right?

Based on the discussion it looks like everyone is OK with this for the BULK
case, and V4L2_EVENT_FRAME_SYNC makes sense to me there. You want to see the
sequence number in the event, and the description of the event matches what
happens.

The problem is the ISOC case where it is debatable if this adds anything.

Perhaps in the ISOC case this event shouldn't be supported? Unless you can
show that it does provide useful information in the ISOC case. I didn't see
that in the v2 discussion, but I might have missed it.

Regards,

	Hans

> 
> Suggested-by: Esker Wong <esker@chromium.org>
> Tested-by: Esker Wong <esker@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> We have measured a latency of around 30msecs between frame sync
> and dqbuf.
> ---
> Changes in v3:
> - Sent wrong patch as v2 sorry :S
> - Link to v2: https://lore.kernel.org/r/20231106-uvc-event-v2-1-7d8e36f0df16@chromium.org
> 
> Changes in v2:
> - Suggested by Laurent. Split sequence++ and event init.
> - Link to v1: https://lore.kernel.org/r/20231020-uvc-event-v1-1-3baa0e9f6952@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c  | 2 ++
>  drivers/media/usb/uvc/uvc_video.c | 7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4988f03640a..9f3fb5fd2375 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1352,6 +1352,8 @@ static int uvc_ioctl_subscribe_event(struct v4l2_fh *fh,
>  	switch (sub->type) {
>  	case V4L2_EVENT_CTRL:
>  		return v4l2_event_subscribe(fh, sub, 0, &uvc_ctrl_sub_ev_ops);
> +	case V4L2_EVENT_FRAME_SYNC:
> +		return v4l2_event_subscribe(fh, sub, 0, NULL);
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 28dde08ec6c5..6a9410133908 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1073,9 +1073,16 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  	 * that discontinuous sequence numbers always indicate lost frames.
>  	 */
>  	if (stream->last_fid != fid) {
> +		struct v4l2_event event = {
> +			.type = V4L2_EVENT_FRAME_SYNC,
> +		};
> +
>  		stream->sequence++;
>  		if (stream->sequence)
>  			uvc_video_stats_update(stream);
> +
> +		event.u.frame_sync.frame_sequence = stream->sequence;
> +		v4l2_event_queue(&stream->vdev, &event);
>  	}
>  
>  	uvc_video_clock_decode(stream, buf, data, len);
> 
> ---
> base-commit: ce55c22ec8b223a90ff3e084d842f73cfba35588
> change-id: 20231020-uvc-event-d3d1bbbdcb2f
> 
> Best regards,


