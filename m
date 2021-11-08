Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9205E449AD6
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 18:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240700AbhKHRjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 12:39:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240611AbhKHRjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 12:39:16 -0500
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A8BC061570
        for <linux-media@vger.kernel.org>; Mon,  8 Nov 2021 09:36:31 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id k8ZFmiTjMFZvck8ZImwDam; Mon, 08 Nov 2021 18:36:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636392989; bh=0vNSPtBF57FlZoVCYEhGC2ydYSUbsvQT+EYf+YjVNUw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TKxMj/q1x06fLQEoylUkTcv3rBXIvz5GYDlC2zELeYhwjW16Yqo7SNNA8tSvDmnhf
         n3soWWeLaYV6LRVcDhRcMMrh8rFzw5dNNzX01iOmCNuzTIZuDdWsPCkcE0e36PjHhe
         ZNAozupZaA7CJMIMeCG2dNfF9pfsqM55u5T4ViOXvmwb8hKIjwEAF91XJg54daHGqR
         erTwzQCyft6B0wTO1IlcJ1XDZw9W/7+wFEH95tE8n809hDOVaHxY1uY6agrdA1kLS1
         C2R+5DUmmExEW4ueqQfjkWALqIVcI0vS2/W6tIaNjEoY+gp24m8cZVd6EveE/pO3Dv
         ZSTol8brQ30hw==
Subject: Re: [PATCH 3/4] rcar-vin: Stop stream when subdevice signal transfer
 error
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
 <20211108160220.767586-4-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1fddc966-5a23-63b4-185e-c17aa6d65b54@xs4all.nl>
Date:   Mon, 8 Nov 2021 18:36:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211108160220.767586-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfBu6pxMXszuJmhAfHT4PuAtG4kDY7zaxy6DHIUVyPMtMWeCNOL1MgaTuowrVidlrqON29En7eA+1Z3Mt0UNkK6NGd4PpOzpPda0l53+1Vl4Y60PyELiD
 i9ipVBwwSw9xb+nJBV5gLC/90gIlOXzB4W8NWY/ZjacWzO0BHbr/+0bfmWhAIc/xhxMiZd6nzKROY/OM+hQ2oshjlSW4WugNGY2CmKiW0xT6iPlXiH2S4p6+
 +/4BFfZCuovfSGPIbIMY4jMS9+mIQavorik8sOFKA7PBQX1tNCGW5YgblRWD1n0puFy/AcVSz74NqfDWvbzw/hpHPEnoaxR6MGSR983xTW2UTRtvcZkGpR7g
 jX3aZ9+G
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/11/2021 17:02, Niklas Söderlund wrote:
> When a subdevice signals a transfer error stop the VIN in addition to
> informing user-space of the event.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> * Changes since v3
> - Switch to new V4L2_EVENT_XFER_ERROR from V4L2_EVENT_EOS.
> - Call vb2_queue_error() when encountering the event.
> 
> * Changes since v2
> - Log using vin_dbg() instead of v4l2_info().
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index a5bfa76fdac6e55a..bf17fdefe90aabf5 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -992,9 +992,24 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
>  static void rvin_notify_video_device(struct rvin_dev *vin,
>  				     unsigned int notification, void *arg)
>  {
> +	const struct v4l2_event *event;
> +
>  	switch (notification) {
>  	case V4L2_DEVICE_NOTIFY_EVENT:
> -		v4l2_event_queue(&vin->vdev, arg);
> +		event = arg;
> +
> +		switch (event->type) {
> +		case V4L2_EVENT_XFER_ERROR:
> +			vin_dbg(vin,
> +				"Subdevice signaled transfer error, stopping.\n");
> +			rvin_stop_streaming(vin);
> +			vb2_queue_error(&vin->queue);

Hmm, wouldn't it be the case that every driver that calls vb2_queue_error()
would also have to send this new event? Would it be possible to modify
vb2_queue_error() to raise this event? I haven't analyzed all the drivers
that call this function to see if that makes sense.

Perhaps a separate new function vb2_queue_error_with_event() would also be
an option.

Regards,

	Hans

> +			break;
> +		default:
> +			break;
> +		}
> +
> +		v4l2_event_queue(&vin->vdev, event);
>  		break;
>  	default:
>  		break;
> 

