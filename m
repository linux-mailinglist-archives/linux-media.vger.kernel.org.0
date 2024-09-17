Return-Path: <linux-media+bounces-18339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CFC97B166
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 16:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D2561F21AA2
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5C117C9B0;
	Tue, 17 Sep 2024 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oq/eoQSs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3617C233
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582955; cv=none; b=UacJ21LMI8D7tvPfbmj5G6BHgTRpwxbqPnyqMI9F4XaHoRKa6Rz5S2Ahx5dgSiLIfPT/PqOWlhTpNrvSySSrSlCRuMPhAdkXpqrfpCSB53sUnN7WwdxsDkFx07DELAn2ugKdvGVJ9jZcZ74mxVAywvuQx25pmDojcJwVoeolwdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582955; c=relaxed/simple;
	bh=3UqR623i6UuV/s50QmloXJiV5dH80h9nX1WAafAY7KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhZT+DqE2sGG6n/WpUo2oOJdeAalrHl6ROg3nrWtHQ8kGcNKNLr8pSIgEFF/ZakUfX9sAbtOIY9HCh30IOa8OgWd7/qi2SmnWBoskfMvwLJBoCJOviVraZ6FkVla1Bi92RXX68a2enLDHbHtpP7YIV4Cohz47GOVgnFw7rDaJRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oq/eoQSs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 139D4514;
	Tue, 17 Sep 2024 16:21:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726582870;
	bh=3UqR623i6UuV/s50QmloXJiV5dH80h9nX1WAafAY7KQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oq/eoQSsdnju4KaJ+4iLlKYVSLQDEVR5RKq+fHOZ4LbRHCVXSPc8R+aOfkdR9O7cZ
	 It8ygL5Dm4FcOJVeqL+qkHJxHHBbns5cyvMaCX+FlO3U/6/yRg/OH/6PwgAekuOYu6
	 0X7q03j+qFgoTfYukXaw6tK5N8U9OAth3RCnX7cc=
Message-ID: <6a869a88-9fb0-43fd-99f9-9c465419e4cf@ideasonboard.com>
Date: Tue, 17 Sep 2024 17:22:29 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: Documentation: Deprecate s_stream video op,
 update docs
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, Alain Volmat
 <alain.volmat@foss.st.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 hverkuil@xs4all.nl
References: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2024 15:43, Sakari Ailus wrote:
> The scope of the s_stream video operation is now fully supported by
> {enable,disable}_straems. Explicitly document the s_stream() op as
> deprecated and update the related documentation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   Documentation/driver-api/media/camera-sensor.rst |  8 ++++----
>   Documentation/driver-api/media/tx-rx.rst         | 11 ++++++-----
>   include/media/v4l2-subdev.h                      |  5 +++--
>   3 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index b4920b34cebc..c290833165e6 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -81,10 +81,10 @@ restart when the system is resumed. This requires coordination between the
>   camera sensor and the rest of the camera pipeline. Bridge drivers are
>   responsible for this coordination, and instruct camera sensors to stop and
>   restart streaming by calling the appropriate subdev operations
> -(``.s_stream()``, ``.enable_streams()`` or ``.disable_streams()``). Camera
> -sensor drivers shall therefore **not** keep track of the streaming state to
> -stop streaming in the PM suspend handler and restart it in the resume handler.
> -Drivers should in general not implement the system PM handlers.
> +(``.enable_streams()`` or ``.disable_streams()``). Camera sensor drivers shall

I didn't go through the docs, but I think we need to make it clear 
somewhere that v4l2_subdev_enable_streams() and 
v4l2_subdev_disable_streams() _must_ be used to enable/disable the 
streaming in the source subdevice, and the related subdev callbacks must 
not be called directly.

Also, v4l2_subdev_enable_streams() and v4l2_subdev_disable_streams() 
kernel doc doesn't seem to clarify that if the driver using those 
functions does not support streams, it should use BIT_ULL(1) as the 
streams_mask parameter.

  Tomi

> +therefore **not** keep track of the streaming state to stop streaming in the PM
> +suspend handler and restart it in the resume handler. Drivers should in general
> +not implement the system PM handlers.
>   
>   Camera sensor drivers shall **not** implement the subdev ``.s_power()``
>   operation, as it is deprecated. While this operation is implemented in some
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index 29d66a47b56e..a339df61fca8 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -49,11 +49,12 @@ Link frequency
>   The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
>   receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
>   
> -``.s_stream()`` callback
> -^^^^^^^^^^^^^^^^^^^^^^^^
> +``.enable_streams()`` and ``.disable_streams()`` callbacks
> +^^^^^^^^^^^^^^^^^^^^^^^^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> -The struct struct v4l2_subdev_video_ops->s_stream() callback is used by the
> -receiver driver to control the transmitter driver's streaming state.
> +The struct v4l2_subdev_pad_ops->enable_streams() and struct
> +v4l2_subdev_pad_ops->disable_streams() callbacks are used by the receiver driver
> +to control the transmitter driver's streaming state.
>   
>   
>   CSI-2 transmitter drivers
> @@ -127,7 +128,7 @@ Stopping the transmitter
>   ^^^^^^^^^^^^^^^^^^^^^^^^
>   
>   A transmitter stops sending the stream of images as a result of
> -calling the ``.s_stream()`` callback. Some transmitters may stop the
> +calling the ``.disable_streams()`` callback. Some transmitters may stop the
>   stream at a frame boundary whereas others stop immediately,
>   effectively leaving the current frame unfinished. The receiver driver
>   should not make assumptions either way, but function properly in both
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 8daa0929865c..3cc6b4a5935f 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -450,8 +450,9 @@ enum v4l2_subdev_pre_streamon_flags {
>    *	already started or stopped subdev. Also see call_s_stream wrapper in
>    *	v4l2-subdev.c.
>    *
> - *	New drivers should instead implement &v4l2_subdev_pad_ops.enable_streams
> - *	and &v4l2_subdev_pad_ops.disable_streams operations, and use
> + *	This callback is DEPRECATED. New drivers should instead implement
> + *	&v4l2_subdev_pad_ops.enable_streams and
> + *	&v4l2_subdev_pad_ops.disable_streams operations, and use
>    *	v4l2_subdev_s_stream_helper for the &v4l2_subdev_video_ops.s_stream
>    *	operation to support legacy users.
>    *


