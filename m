Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C39D63A319C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 18:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhFJRBV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 13:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbhFJRBV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 13:01:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2C8C061574;
        Thu, 10 Jun 2021 09:59:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBBA08D4;
        Thu, 10 Jun 2021 18:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623344363;
        bh=uxHdtsuiFbjrRGGCBY2h28nLqku+QzWTNADXiEoU9Jo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XRM/+SVcJSxFubuiqrwvG9Mpg4ZLBkLc8iFeDwwOpG8Py3whi92fKz3cdog3sW6CU
         kjWjMYwwHWzKfYAUXnQ9ug72jxQM4Cpu8aXz2z1bnrZbLhvrxk+S+OyFzAkQ2jBgbv
         7g7aeWlWhrcyu9naTFtwAai+a40pXl+6UOW7Pck0=
Date:   Thu, 10 Jun 2021 19:59:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v9 18/22] media: uvcvideo: Downgrade control error
 messages
Message-ID: <YMJE2btjwzzY1lfK@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-19-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-19-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:36AM +0100, Ricardo Ribalda wrote:
> Convert the error into a debug message, so they are still valid for
> debugging but do not fill dmesg.

This isn't supposed to happen, doesn't it deserve an error message ?

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index ea2903dc3252..b63c073ec30e 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -76,7 +76,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	if (likely(ret == size))
>  		return 0;
>  
> -	dev_err(&dev->udev->dev,
> +	dev_dbg(&dev->udev->dev,
>  		"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
>  		uvc_query_name(query), cs, unit, ret, size);
>  

-- 
Regards,

Laurent Pinchart
