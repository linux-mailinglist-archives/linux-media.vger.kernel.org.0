Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDE03399C8
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 23:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbhCLWmr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 17:42:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235622AbhCLWml (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 17:42:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA51C061574;
        Fri, 12 Mar 2021 14:42:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D6F588F;
        Fri, 12 Mar 2021 23:42:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615588959;
        bh=Zjp2qIWdCEWMHFDejEPc80NJs6a9qpjuP0CBv/V69qI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D1XvJA/yNsv52PpxUaxuGmRDUg2vnzZTHcExyEleCZBaEqd5zU3XYiOx9/pRrRPjp
         H+ehgulCLS/5Wiky4NVRR4EA/W2pO9iK1qqKd1RSwVUf8EHH4ytgCoWoUTgq1gKB6r
         eBqrWYKi8GCFzG+Soif6zj/JB21onDQ5b6ije6Cg=
Date:   Sat, 13 Mar 2021 00:42:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v3 4/8] media: uvcvideo: set error_idx to count on EACCESS
Message-ID: <YEvuPOnu3Rjm2Bbk@pendragon.ideasonboard.com>
References: <20210312124830.1344255-1-ribalda@chromium.org>
 <20210312124830.1344255-5-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210312124830.1344255-5-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 12, 2021 at 01:48:26PM +0100, Ricardo Ribalda wrote:
> If an error is found when validating the list of controls passed with
> VIDIOC_G_EXT_CTRLS, then error_idx shall be set to ctrls->count to
> indicate
> to userspace that no actual hardware was touched.
> 
> It would have been much nicer of course if error_idx could point to the
> control index that failed the validation, but sadly that's not how the
> API was designed.
> 
> Fixes v4l2-compliance:
> Control ioctls (Input 0):
>                 fail: v4l2-test-controls.cpp(645): invalid error index write only control
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Still pending discussions in v2.

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 157310c0ca87..36eb48622d48 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1073,7 +1073,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  		ret = uvc_ctrl_get(chain, ctrl);
>  		if (ret < 0) {
>  			uvc_ctrl_rollback(handle);
> -			ctrls->error_idx = i;
> +			ctrls->error_idx = (ret == -EACCES) ?
> +						ctrls->count : i;
>  			return ret;
>  		}
>  	}

-- 
Regards,

Laurent Pinchart
