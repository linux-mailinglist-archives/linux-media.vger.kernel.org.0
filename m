Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5834C3380E7
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 23:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhCKWvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 17:51:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbhCKWvQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 17:51:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EFFC061574;
        Thu, 11 Mar 2021 14:51:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21E6F3E4;
        Thu, 11 Mar 2021 23:51:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615503072;
        bh=8/AoyCRGIXsckqb4EVyOMhwTF3OuvhDtRN0psnr8LIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eKvNLXLZZh+5sD0hqDneEkIfmuMmj0IcySdcN8be7C+a9IV6+1FLO10Wg5SuYyXsw
         Wi98PjL1p9ml4e1CpL2q5um3PA69mIlASDsXjGwqpzdZAezDxlSPnNZ+PmK8jh8aqy
         /DhnsP4trfl6XpwKXWU8H/RKdpZVVWcBNvGEY/5g=
Date:   Fri, 12 Mar 2021 00:50:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 3/6] media: uvcvideo: Return -EIO for control errors
Message-ID: <YEqevkojuvniSTFS@pendragon.ideasonboard.com>
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-4-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311221946.1319924-4-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 11, 2021 at 11:19:43PM +0100, Ricardo Ribalda wrote:
> The device is doing something unspected with the control. Either because
> the protocol is not properly implemented or there has been a HW error.
> 
> Fixes v4l2-compliance:
> 
> Control ioctls (Input 0):
>                 fail: v4l2-test-controls.cpp(448): s_ctrl returned an error (22)
>         test VIDIOC_G/S_CTRL: FAIL
>                 fail: v4l2-test-controls.cpp(698): s_ext_ctrls returned an error (22)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

The change looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Which of the error codes below do you get with your camera, and for
which control ?

> ---
>  drivers/media/usb/uvc/uvc_video.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index f2f565281e63..25fd8aa23529 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -112,6 +112,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	case 5: /* Invalid unit */
>  	case 6: /* Invalid control */
>  	case 7: /* Invalid Request */
> +		/*
> +		 * The firmware has not properly implemented
> +		 * the control or there has been a HW error.
> +		 */
> +		return -EIO;
>  	case 8: /* Invalid value within range */
>  		return -EINVAL;
>  	default: /* reserved or unknown */

-- 
Regards,

Laurent Pinchart
