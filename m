Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E04C337913
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 17:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234431AbhCKQSw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 11:18:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50336 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234497AbhCKQSl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 11:18:41 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8F16879;
        Thu, 11 Mar 2021 17:18:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615479520;
        bh=CasTFxEPgNGSi54CtnJRvSEhXh9CeTK0/iNgfRRrbt8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FyCoio/I1dmdihvEEqSRUbTm3dl+4r0g7HrgR3sg2bOKZP6wly0c5EYgX5QryRJ9d
         GJv6OJFhKp47fD+UfS4Kd1YkUd5i2vj680NMh12onu8xUXQTV1TJov5+MXjZG0Clpr
         EEJKezcUrs+0EVJV4MLJv585spVFhLY/p5pcWmz4=
Date:   Thu, 11 Mar 2021 18:18:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Subject: Re: [PATCH 07/10] media: uvcvideo: set error_idx to count on EACCESS
Message-ID: <YEpCvQYGj/4bAncp@pendragon.ideasonboard.com>
References: <20210311122040.1264410-1-ribalda@chromium.org>
 <20210311122040.1264410-9-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311122040.1264410-9-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 11, 2021 at 01:20:37PM +0100, Ricardo Ribalda wrote:
> According to the doc:

The previous paragraph states:

This check is done to avoid leaving the hardware in an inconsistent
state due to easy-to-avoid problems. But it leads to another problem:
the application needs to know whether an error came from the validation
step (meaning that the hardware was not touched) or from an error during
the actual reading from/writing to hardware.

> The, in hindsight quite poor, solution for that is to set error_idx to
> count if the validation failed.
> 
> Fixes v4l2-compliance:
> Control ioctls (Input 0):
>                 fail: v4l2-test-controls.cpp(645): invalid error index write only control
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 625c216c46b5..9b6454bb2f28 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1076,7 +1076,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  		ret = uvc_ctrl_get(chain, ctrl);
>  		if (ret < 0) {
>  			uvc_ctrl_rollback(handle);
> -			ctrls->error_idx = i;
> +			ctrls->error_idx = (ret == -EACCES) ?
> +						ctrls->count : i;

No need for parentheses.

I'm not sure this is correct though. -EACCES is returned by
__uvc_ctrl_get() when the control is found and is a write-only control.
The uvc_ctrl_get() calls for the previous controls will have potentially
touched the device to read the current control value if it wasn't cached
already, to this contradicts the rationale from the specification.

I understand the need for this when setting controls, but when reading
them, it's more puzzling, as the interactions with the hardware to read
the controls are not supposed to affect the hardware state in a way that
applications should care about. It may be an issue in the V4L2
specification.

>  			return ret;
>  		}
>  	}

-- 
Regards,

Laurent Pinchart
