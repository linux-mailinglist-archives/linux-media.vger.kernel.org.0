Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9713E484917
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 21:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbiADUIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 15:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiADUIJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 15:08:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8590C061761
        for <linux-media@vger.kernel.org>; Tue,  4 Jan 2022 12:08:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 543E8501;
        Tue,  4 Jan 2022 21:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641326885;
        bh=VoEVS/uQdYKnR4xJAvvMepq5kMNz6o3K+ARMFJYz/aQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I/KNefa1VC67Rs7fAS5XKvoxvxvP4Tu0lnMjP84iqzwY0RVP5EycXDLD6/rK5JRh8
         bdahA50hOdyq/bugkzc8v8unOps/+pLT+kko5LN9QaDhQmpp2zS5XneLHnlj3r2w6a
         dw4ATp8vhRoXAM8gnwgFwDVwscITuoNi5abMj5BQ=
Date:   Tue, 4 Jan 2022 22:08:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vedant Paranjape <vedantparanjape160201@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v1] v4l2-utils: Fix incorrect use of fd in
 streaming_set_cap2out
Message-ID: <YdSpIbsX3S9ArD9R@pendragon.ideasonboard.com>
References: <20220104130708.166638-1-vedantparanjape160201@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220104130708.166638-1-vedantparanjape160201@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vedant,

Thank you for the patch.

On Tue, Jan 04, 2022 at 06:37:08PM +0530, Vedant Paranjape wrote:
> Running the "Stream video from a capture video device (/dev/video1) to an
> output video device (/dev/video2)" example from the manpage with vivid
> as the output device failed with a error message.
> 
> vedant@pc ~$ v4l2-ctl --list-devices
> vivid (platform:vivid-000):
>         /dev/video2
>         /dev/video3
>         /dev/radio0
>         /dev/radio1
>         /dev/vbi0
>         /dev/vbi1
>         /dev/swradio0
>         /dev/media1
> 
> HD WebCam: HD WebCam (usb-0000:00:14.0-7):
>         /dev/video0
>         /dev/video1
>         /dev/media0
> 
> vedant@pc ~$ v4l2-ctl -d0 --stream-mmap --out-device /dev/video3 --stream-out-dmabuf
>                VIDIOC_G_FMT returned -1 (Invalid argument)
> <VIDIOC_QBUF: failed: Invalid argument
> handle out -1
> handle out2in -1
> 
> While using the --out-device mode g_fmt must be operated on out_fd as
> well. determine_field was called on fps_timestamp object for output, but was
> not passed out_fd.
> 
> This patch fixes the VIDIOC_G_FMT returned -1 (Invalid argument) error.
> 
> Signed-off-by: Vedant Paranjape <vedantparanjape160201@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 752ea140..7f6482d6 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -2666,7 +2666,7 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
>  	unsigned cnt = 0;
>  	cv4l_fmt fmt[2];
>  
> -	fd.g_fmt(fmt[OUT], out.g_type());
> +	out_fd.g_fmt(fmt[OUT], out.g_type());
>  	fd.g_fmt(fmt[CAP], in.g_type());
>  	if (!(capabilities & (V4L2_CAP_VIDEO_CAPTURE |
>  			      V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> @@ -2757,7 +2757,7 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
>  	}
>  
>  	fps_ts[CAP].determine_field(fd.g_fd(), in.g_type());
> -	fps_ts[OUT].determine_field(fd.g_fd(), out.g_type());
> +	fps_ts[OUT].determine_field(out_fd.g_fd(), out.g_type());
>  
>  	if (fd.streamon() || out_fd.streamon())
>  		goto done;

-- 
Regards,

Laurent Pinchart
