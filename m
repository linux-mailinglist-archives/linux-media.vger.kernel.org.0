Return-Path: <linux-media+bounces-2413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7BF812FE7
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 13:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C5451C218A8
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 12:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BAD41777;
	Thu, 14 Dec 2023 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GfoOR2Nt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D0CBD;
	Thu, 14 Dec 2023 04:19:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1C5F4A9;
	Thu, 14 Dec 2023 13:18:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702556335;
	bh=YiTF6JHTIBaYstNwMrE+QdjSiz7s49VYWh8YMsvV9Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GfoOR2NtgGHS+ihYhAAIWAG/jedCD6LOU4Gt7x45cgWD06wzRgmednBtbUQaIXXSa
	 K3KSkv5lHg0ru+ptfrVtmXhWrv7cJjKB9FruXklyXPh+HMKMkLih5GQXo05qSZYYqD
	 qdBRddludmHkUg/lWPIL3hx9vAwu8GUjPkxaEn6k=
Date: Thu, 14 Dec 2023 14:19:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Marvin Lin <milkfafa@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ming Qian <ming.qian@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 8/9] staging: media: starfive: Add frame sync event
 for video capture device
Message-ID: <20231214121948.GC21146@pendragon.ideasonboard.com>
References: <20231214065027.28564-1-changhuang.liang@starfivetech.com>
 <20231214065027.28564-9-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231214065027.28564-9-changhuang.liang@starfivetech.com>

Hi Changhuang,

Thank you for the patch.

On Wed, Dec 13, 2023 at 10:50:26PM -0800, Changhuang Liang wrote:
> Add frame sync event for video capture device.

Here too the commit message needs to explain why.

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../staging/media/starfive/camss/stf-capture.c    |  9 +++++++++
>  drivers/staging/media/starfive/camss/stf-video.c  | 15 +++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers/staging/media/starfive/camss/stf-capture.c
> index 6a137a273c8a..d0be769da11b 100644
> --- a/drivers/staging/media/starfive/camss/stf-capture.c
> +++ b/drivers/staging/media/starfive/camss/stf-capture.c
> @@ -7,6 +7,7 @@
>   * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
>   */
>  
> +#include <media/v4l2-event.h>
>  #include "stf-camss.h"
>  
>  static const char * const stf_cap_names[] = {
> @@ -430,10 +431,15 @@ static void stf_buf_flush(struct stf_v_buf *output, enum vb2_buffer_state state)
>  
>  static void stf_buf_done(struct stf_v_buf *output)
>  {
> +	struct stf_capture *cap = container_of(output, struct stf_capture,
> +					       buffers);

This looks like it belongs to a previous patch, because ...

>  	struct stfcamss_buffer *ready_buf;
>  	struct stfcamss *stfcamss = cap->video.stfcamss;

... cap is already used there.

Please compile each commit, not just the end result. Compilation must
not break at any point in the middle of the series, or it would make git
bisection impossible.

>  	u64 ts = ktime_get_ns();
>  	unsigned long flags;
> +	struct v4l2_event event = {
> +		.type = V4L2_EVENT_FRAME_SYNC,
> +	};
>  
>  	if (output->state == STF_OUTPUT_OFF ||
>  	    output->state == STF_OUTPUT_RESERVED)
> @@ -445,6 +451,9 @@ static void stf_buf_done(struct stf_v_buf *output)
>  		if (cap->type == STF_CAPTURE_SCD)
>  			stf_isp_fill_yhist(stfcamss, ready_buf->vaddr_sc);
>  
> +		event.u.frame_sync.frame_sequence = output->sequence;
> +		v4l2_event_queue(&cap->video.vdev, &event);

This doesn't like to be the right place to generate the
V4L2_EVENT_FRAME_SYNC event. V4L2_EVENT_FRAME_SYNC is defined as

      - Triggered immediately when the reception of a frame has begun.
        This event has a struct
        :c:type:`v4l2_event_frame_sync`
        associated with it.

It would be best to generate V4L2_EVENT_FRAME_SYNC in response to a
CSI-2 RX interrupt that signals the beginning of the frame, if the
hardware provides that. If not, an ISP interrupt that signals the
beginning of the frame would work too.

> +
>  		ready_buf->vb.vb2_buf.timestamp = ts;
>  		ready_buf->vb.sequence = output->sequence++;
>  
> diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
> index 54d855ba0b57..32381e9ad049 100644
> --- a/drivers/staging/media/starfive/camss/stf-video.c
> +++ b/drivers/staging/media/starfive/camss/stf-video.c
> @@ -507,6 +507,17 @@ static int video_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  	return __video_try_fmt(video, f);
>  }
>  
> +static int video_subscribe_event(struct v4l2_fh *fh,
> +				 const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_FRAME_SYNC:
> +		return v4l2_event_subscribe(fh, sub, 0, NULL);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static const struct v4l2_ioctl_ops stf_vid_ioctl_ops = {
>  	.vidioc_querycap                = video_querycap,
>  	.vidioc_enum_fmt_vid_cap        = video_enum_fmt,
> @@ -523,6 +534,8 @@ static const struct v4l2_ioctl_ops stf_vid_ioctl_ops = {
>  	.vidioc_prepare_buf             = vb2_ioctl_prepare_buf,
>  	.vidioc_streamon                = vb2_ioctl_streamon,
>  	.vidioc_streamoff               = vb2_ioctl_streamoff,
> +	.vidioc_subscribe_event         = video_subscribe_event,
> +	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,

Don't implement the event on the video device, implement it on the CSI-2
RX or ISP subdev, depending on whether you get it from the CSI-2 RX or
the ISP.

>  };
>  
>  static int video_scd_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
> @@ -554,6 +567,8 @@ static const struct v4l2_ioctl_ops stf_vid_scd_ioctl_ops = {
>  	.vidioc_prepare_buf             = vb2_ioctl_prepare_buf,
>  	.vidioc_streamon                = vb2_ioctl_streamon,
>  	.vidioc_streamoff               = vb2_ioctl_streamoff,
> +	.vidioc_subscribe_event         = video_subscribe_event,
> +	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
>  };
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

