Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D8E24F04A
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 00:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgHWWeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Aug 2020 18:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbgHWWeC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Aug 2020 18:34:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD87C061573
        for <linux-media@vger.kernel.org>; Sun, 23 Aug 2020 15:34:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E24D0279;
        Mon, 24 Aug 2020 00:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598222038;
        bh=4deCmcEyxLvyfvj2p05UFCDB9diVY7F23wTOV/xhy/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GI/UjTeCiFUS5Z1zAB89rAIOAdOKJ4D0iMKZ2fwdss23W5duIP7etaYIYTztCC1Si
         ux0t3wQ/xJAHIFWULe4VQ/i1pUP8ohp8QZ31DQyLRIqLKOlL4b4pPOraQ34g9GuYAm
         s1L6VYN4QKbbMwYthmnx3V+hVHtn+UaNwA+676w0=
Date:   Mon, 24 Aug 2020 01:33:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add bandwidth_cap module param
Message-ID: <20200823223339.GI6002@pendragon.ideasonboard.com>
References: <20200821220038.16420-1-amurray@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200821220038.16420-1-amurray@thegoodpenguin.co.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrew,

Thank you for the patch.

On Fri, Aug 21, 2020 at 11:00:38PM +0100, Andrew Murray wrote:
> Many UVC devices report larger values for dwMaxPayloadTransferSize than
> appear to be required. This results in less bandwidth available for
> other devices.
> 
> This problem is commonly observed when attempting to stream from multiple
> UVC cameras with the host controller returning -ENOSPC and sometimes a
> warning (XHCI controllers: "Not enough bandwidth for new device state.").
> 
> For uncompressed video, the UVC_QUIRK_FIX_BANDWIDTH works around this issue
> by overriding the device provided dwMaxPayloadTransferSize with a
> calculation of the actual bandwidth requirements from the requested frame
> size and rate. However for compressed video formats it's not practical to
> estimate the bandwidth required as the kernel doesn't have enough
> information.
> 
> Let's provide a pragmatic solution by allowing the user to impose an upper
> threshold to the amount of bandwidth each UVC device can reserve. If the
> parameter isn't used then no threshold is imposed.

Hmmmm... This is a bit annoying as it will apply equally to all formats
and all cameras. It may solve a real issue, but it's quite a bit of a
hack. I'm also concerned that users will be confused regarding how to
use this parameter properly, as there's no documentation that explains
its usage, and how to pick a proper value. Is there any way we could do
better ?

> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 3 +++
>  drivers/media/usb/uvc/uvc_video.c  | 8 ++++++++
>  drivers/media/usb/uvc/uvcvideo.h   | 1 +
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 431d86e1c94b..d5ecac7fc264 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -33,6 +33,7 @@ unsigned int uvc_no_drop_param;
>  static unsigned int uvc_quirks_param = -1;
>  unsigned int uvc_trace_param;
>  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> +unsigned int uvc_bandwidth_cap_param;
>  
>  /* ------------------------------------------------------------------------
>   * Video formats
> @@ -2389,6 +2390,8 @@ module_param_named(trace, uvc_trace_param, uint, S_IRUGO|S_IWUSR);
>  MODULE_PARM_DESC(trace, "Trace level bitmask");
>  module_param_named(timeout, uvc_timeout_param, uint, S_IRUGO|S_IWUSR);
>  MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
> +module_param_named(bandwidth_cap, uvc_bandwidth_cap_param, uint, S_IRUGO|S_IWUSR);
> +MODULE_PARM_DESC(bandwidth_cap, "Maximum bandwidth per device");
>  
>  /* ------------------------------------------------------------------------
>   * Driver initialization and cleanup
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a65d5353a441..74a0dc0614cf 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -196,6 +196,14 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>  
>  		ctrl->dwMaxPayloadTransferSize = bandwidth;
>  	}
> +
> +	if (uvc_bandwidth_cap_param &&
> +	    ctrl->dwMaxPayloadTransferSize > uvc_bandwidth_cap_param) {
> +		uvc_trace(UVC_TRACE_VIDEO,
> +			"Bandwidth capped from %u to %u B/frame.\n",
> +			ctrl->dwMaxPayloadTransferSize, uvc_bandwidth_cap_param);
> +		ctrl->dwMaxPayloadTransferSize = uvc_bandwidth_cap_param;
> +	}
>  }
>  
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 6ab972c643e3..c7d9220c9a7a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -718,6 +718,7 @@ extern unsigned int uvc_no_drop_param;
>  extern unsigned int uvc_trace_param;
>  extern unsigned int uvc_timeout_param;
>  extern unsigned int uvc_hw_timestamps_param;
> +extern unsigned int uvc_bandwidth_cap_param;
>  
>  #define uvc_trace(flag, msg...) \
>  	do { \

-- 
Regards,

Laurent Pinchart
