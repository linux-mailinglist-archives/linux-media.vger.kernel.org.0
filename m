Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BDC34B6C8
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 12:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbhC0LUC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 07:20:02 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:35721 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230415AbhC0LUB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 07:20:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Q6yylxGFbMxedQ6z1lW190; Sat, 27 Mar 2021 12:20:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616844000; bh=JbY5sZ0LZblSSzkqPKQiV0RRtlUDdglv9RH4JF6K+cY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YSA1z52L+8Dn8gicoSbR8K6CUVbJ8h/AvEklDGio8YhDroHyO2NaXCDsTzCZh/k6k
         QV2sAS02YSBm9inL6G2CHfsCpxMl29sXaSNhwlnn7bF3wj/nOcYvLNmSjEQ9DNQjYV
         MLhqK6KWBR+VgPO4FKowbllzMbPcovwSxqdMk/WneqLonFYu/umeeKeQXQjjEbNjTS
         WjUciRol4Y7wdvkNzRlYKP6jHYsMLntypRW9uFX4yoAshb2lHESmhpcnUQ4ibmIOmS
         /7M7o4psIchUd6UeDIyHK4rrEcP5whdD5AyMJxhvJSFQSF+iLx3VCw85WTXcv+56LN
         2kssc5uD9vaMw==
Subject: Re: [PATCH v9 18/22] media: uvcvideo: Downgrade control error
 messages
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-19-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <07de01a4-76d8-66db-8534-0ae5f62b2034@xs4all.nl>
Date:   Sat, 27 Mar 2021 12:19:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326095840.364424-19-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOiBO5T0dk9PfRpFB3gIC9QbQtAd6Angrprz3RC/Zv9b7YNq5mYMpbPBB+fmUjZVXdhnuKM+HlSK5+vESQORdqHQdlZ1cw9QqcAPhxqPIF1Lpme+k2sB
 g0DOoUYIJGdRphGW9OXEXvdly4UHaxcjUchL7lOfJsBilkg1IwQ2+S9JSQ/ssomMUxIbXETi+sJv6C3nQAT1LblYe/L9led9+2AKg1iWirAACiA3lHAL7rd9
 JyVQYaoGbid33XZ+1BR0JyXSCGag2WPOvRsmKhagUbzi5msPskSBbn3q7ixaDQI17LmqrO3blmS4OYeki8wi11O7NEX59qfqQ6t3sfgJFBTbLs/mfQjrziAV
 0ARd3dm5UmeTjp3fk9qZs8vdKctqFxHiIbVdsEKcZJnpdIIzzAAIPgd96JmbHflzDQAHYqh/
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/03/2021 10:58, Ricardo Ribalda wrote:
> Convert the error into a debug message, so they are still valid for
> debugging but do not fill dmesg.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

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
> 

