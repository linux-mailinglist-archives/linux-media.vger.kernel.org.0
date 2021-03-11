Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0DD533784F
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbhCKPna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:43:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49950 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234249AbhCKPnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:43:09 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EF16879;
        Thu, 11 Mar 2021 16:43:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615477387;
        bh=kDgUF6csvEONaCdptoAQngnbRJKMBt3av/ekhegJP9w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qsKk0okcr5BMYGt+KFssOw4qniE9UVsL6QaEQ2KWP5xSzqeVgsAz0lN3Jx+fiDHAc
         tAVOFQSOjdq4TRFWaPeaEyo/xwNsmpi4BvV9S0pP2wTj0YcIcU4IQX8R+VGHJrLCUI
         aUtTXWHX8Wy8llpvCu8xXvEGOxWuxPLhPkJRm2yc=
Date:   Thu, 11 Mar 2021 17:42:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Subject: Re: [PATCH 02/10] media: uvcvideo: Set capability in s_param
Message-ID: <YEo6ac4alj/A+QWB@pendragon.ideasonboard.com>
References: <20210311122040.1264410-1-ribalda@chromium.org>
 <20210311122040.1264410-4-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311122040.1264410-4-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 11, 2021 at 01:20:32PM +0100, Ricardo Ribalda wrote:
> Fixes v4l2-compliance:
> 
> Format ioctls (Input 0):
>                 warn: v4l2-test-formats.cpp(1339): S_PARM is supported but doesn't report V4L2_CAP_TIMEPERFRAME
>                 fail: v4l2-test-formats.cpp(1241): node->has_frmintervals && !cap->capability
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 5e3ec4a376e4..625c216c46b5 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -472,10 +472,13 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
>  	uvc_simplify_fraction(&timeperframe.numerator,
>  		&timeperframe.denominator, 8, 333);
>  
> -	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
>  		parm->parm.capture.timeperframe = timeperframe;
> -	else
> +		parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
> +	} else {
>  		parm->parm.output.timeperframe = timeperframe;
> +		parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
> +	}
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
