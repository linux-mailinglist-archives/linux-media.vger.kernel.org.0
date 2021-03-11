Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15D2337930
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 17:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234444AbhCKQWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 11:22:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50406 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234176AbhCKQW3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 11:22:29 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60DB0879;
        Thu, 11 Mar 2021 17:22:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615479748;
        bh=bEKNz0DEVs402f2NWP18diiyQMl/fKPScq2R7rolfQo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oGSnvQDJfv547u1K6L5wBAGiDGkd3nTaPWP12yXBJ6sd1OHpe1NBHaUUGlGu85lKT
         wReIKQZsUpZDWLjrngYfKYPH1beVssQMrO1wmzXOs/C29lT44tPl0AvMC5BrHXSmdS
         ySc36Mb6uf2SUaXLXanSpg0WSa8ESQo3pBFmv3Vo=
Date:   Thu, 11 Mar 2021 18:21:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Subject: Re: [PATCH 08/10] media: uvcvideo: Always return a value on
 V4L2_CTRL_WHICH_DEF_VAL
Message-ID: <YEpDohOKcLmfpTHQ@pendragon.ideasonboard.com>
References: <20210311122040.1264410-1-ribalda@chromium.org>
 <20210311122040.1264410-10-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311122040.1264410-10-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 11, 2021 at 01:20:38PM +0100, Ricardo Ribalda wrote:
> Fixes v4l2-compliance:
> Control ioctls (Input 0):
>                 fail: v4l2-test-controls.cpp(813): doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 9b6454bb2f28..b500356fd06c 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1057,12 +1057,7 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  			struct v4l2_queryctrl qc = { .id = ctrl->id };
>  
>  			ret = uvc_query_v4l2_ctrl(chain, &qc);
> -			if (ret < 0) {
> -				ctrls->error_idx = i;
> -				return ret;
> -			}
> -
> -			ctrl->value = qc.default_value;
> +			ctrl->value = (ret < 0) ? 0 : qc.default_value;

That's not great, if an error occurs, it should be reported to the user,
not ignored silently. Sounds like this needs to be addressed in
v4l2-compliance, as the V4L2 specification doesn't forbid errors being
returned from V4L2_CTRL_WHICH_DEF_VAL.

>  		}
>  
>  		return 0;

-- 
Regards,

Laurent Pinchart
