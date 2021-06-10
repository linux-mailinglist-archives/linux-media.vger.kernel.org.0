Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981B23A306D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 18:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhFJQXW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 12:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhFJQXV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 12:23:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565E3C061574;
        Thu, 10 Jun 2021 09:21:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB8388D4;
        Thu, 10 Jun 2021 18:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623342084;
        bh=m4JSH7ii8buMfDsGgtNRyeiI1Cinektdy5XhtPDxCVg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dEJh9DS8DI5VIW7/Mo/Flm1u53scqeECBPD9hE1eqDtv3O/jZGe3yBH2ZtZEeuRKm
         S44sUoJpKJM4FDGVmTai2UjmkYlexlxE4mOYOe+bxY8bPR7JWZvnyzxtTHSP4r4kv1
         zy3JFt/i9wNN58AqpOuuXesj7Do489iMKQZkPIgw=
Date:   Thu, 10 Jun 2021 19:21:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v9 03/22] media: uvcvideo: Do not check for
 V4L2_CTRL_WHICH_DEF_VAL
Message-ID: <YMI78auncmtxut4G@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-4-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-4-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:21AM +0100, Ricardo Ribalda wrote:
> The framework already checks for us if V4L2_CTRL_WHICH_DEF_VAL is
> written.
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 252136cc885c..47b0e3224205 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1089,10 +1089,6 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
>  	unsigned int i;
>  	int ret;
>  
> -	/* Default value cannot be changed */
> -	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL)
> -		return -EINVAL;
> -
>  	ret = uvc_ctrl_begin(chain);
>  	if (ret < 0)
>  		return ret;

-- 
Regards,

Laurent Pinchart
