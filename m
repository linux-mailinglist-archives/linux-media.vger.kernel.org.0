Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6CEF3381A3
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 00:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhCKXlv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 18:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbhCKXlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 18:41:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073DEC061574;
        Thu, 11 Mar 2021 15:41:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 475D088F;
        Fri, 12 Mar 2021 00:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615506093;
        bh=n2Z7clfM7QNF0X/CDuN3u8jrbtuz8ZDpOETEtOynXYo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nvabEqa0AyjMY2Gwq/Xx7dgKynU8WNE27XQvZ48qyeb0HrvPOMjWD5fwtZif/dlwS
         MvkBD0VT7yaQ+JCq9+vGNCAuxvASAzlUnBMFNdm15KCUy8iH+FtiHKj4hNQX3y1e7w
         iVssd6F1zjzku0TiPQ81hNeDHDpOuigQcKmizxjw=
Date:   Fri, 12 Mar 2021 01:40:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 4/6] media: uvcvideo: set error_idx to count on EACCESS
Message-ID: <YEqqi0kyisCr7cJP@pendragon.ideasonboard.com>
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-5-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311221946.1319924-5-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 11, 2021 at 11:19:44PM +0100, Ricardo Ribalda wrote:
> According to the doc:
> The, in hindsight quite poor, solution for that is to set error_idx to
> count if the validation failed.
> 
> Fixes v4l2-compliance:
> Control ioctls (Input 0):
>                 fail: v4l2-test-controls.cpp(645): invalid error index write only control
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I'll hold off on this one until we conclude the discussion with Hans on
v1.

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
