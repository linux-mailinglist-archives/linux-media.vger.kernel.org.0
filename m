Return-Path: <linux-media+bounces-29484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E94A7DA56
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 11:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE0B3ADED0
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE38234966;
	Mon,  7 Apr 2025 09:54:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8559D230BCD;
	Mon,  7 Apr 2025 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019649; cv=none; b=n9SZP3URSJwPol0BP/ezfAHpQiUh9umb798rsXJmItFMetf0GJviJy/UjcgqeD4KnJ8kXl1Yaii9L32CnHv8tNYB2xpBTSI20itYM2Map5UO/HTu3l+yPWulNMyTfCr8/MPN/qHG/peQIO/peHY6eGbq2qOdZTXYEv3eI4E1mUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019649; c=relaxed/simple;
	bh=XFvfvv7QetTQVtT65VitPXl9f9r55NGlzqiql5VK65o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8xbr1nwSSsXLRhD0VM3wS1q8Ag+rXtDbTOpqLQ4bn4wwG/lBZcJ4E0GylSt1a5qbNf02rqYiNLK4hVR2RlzOSKo1EfcUPUO/6ObFqD9bI9aNk7NsPgg/fBxsFJps8Qno36PmM06k26ULfwagcAFkJlBsNGcmFhf0/ZZPOI46sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A5DC4CEDD;
	Mon,  7 Apr 2025 09:54:05 +0000 (UTC)
Message-ID: <3e5f003a-f689-4f5a-ac75-6bf95379637b@xs4all.nl>
Date: Mon, 7 Apr 2025 11:54:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: v4l: dev-decoder: Add source change
 V4L2_EVENT_SRC_CH_COLORSPACE
To: Ming Qian <ming.qian@oss.nxp.com>, mchehab@kernel.org
Cc: nicolas@ndufresne.ca, shawnguo@kernel.org, robh+dt@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/01/2025 07:19, Ming Qian wrote:
> Add a new source change V4L2_EVENT_SRC_CH_COLORSPACE that
> indicates colorspace change in the stream.
> The change V4L2_EVENT_SRC_CH_RESOLUTION will always affect
> the allocation, but V4L2_EVENT_SRC_CH_COLORSPACE won't.
> 
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  Documentation/userspace-api/media/v4l/vidioc-dqevent.rst | 9 +++++++++
>  .../userspace-api/media/videodev2.h.rst.exceptions       | 1 +
>  include/uapi/linux/videodev2.h                           | 1 +
>  3 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> index 8db103760930..91e6b86c976d 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> @@ -369,6 +369,15 @@ call.
>  	loss of signal and so restarting streaming I/O is required in order for
>  	the hardware to synchronize to the video signal.
>  
> +    * - ``V4L2_EVENT_SRC_CH_COLORSPACE``
> +      - 0x0002
> +      - This event gets triggered when a colorsapce change is detected at

colorsapce -> colorspace

> +	an input. This can come from a video decoder. Applications will query

It can also come from a video receiver. E.g. an HDMI source changes colorspace
signaling, but not the resolution.

> +	the new colorspace information (if any, the signal may also have been
> +	lost)

Missing . at the end. Also, if the signal is lost, then that is a CH_RESOLUTION
change, not CH_COLORSPACE.

> +
> +	For stateful decoders follow the guidelines in :ref:`decoder`.

I think this should emphasize that if CH_COLORSPACE is set, but not CH_RESOLUTION,
then only the colorspace changed and there is no need to reallocate buffers.

I also wonder if the description of CH_RESOLUTION should be enhanced to explain
that this might also imply a colorspace change. I'm not sure what existing codec
drivers do if there is a colorspace change but no resolution change.

I'm a bit concerned about backwards compatibility issues: if a userspace application
doesn't understand this new flag and just honors CH_RESOLUTION, then it would
never react to just a colorspace change.

Nicolas, does gstreamer look at these flags?

Regards,

	Hans

> +
>  Return Value
>  ============
>  
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 35d3456cc812..ac47c6d9448b 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -526,6 +526,7 @@ replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>  replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
>  
>  replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
> +replace define V4L2_EVENT_SRC_CH_COLORSPACE src-changes-flags
>  
>  replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c8cb2796130f..242242c8e57b 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2559,6 +2559,7 @@ struct v4l2_event_frame_sync {
>  };
>  
>  #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
> +#define V4L2_EVENT_SRC_CH_COLORSPACE		(1 << 1)
>  
>  struct v4l2_event_src_change {
>  	__u32 changes;


