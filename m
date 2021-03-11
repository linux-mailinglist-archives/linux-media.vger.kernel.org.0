Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FC433751F
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 15:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233799AbhCKOIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 09:08:55 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42555 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233881AbhCKOIp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 09:08:45 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KLzUlPKvu5C8yKLzXlejqd; Thu, 11 Mar 2021 15:08:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615471724; bh=aJmnP5v6D4V/HN2fr+ehdvn4IeX4rsz8HRPjR+VucYU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cDFlQVjZK+HKNrUCzuFCzzr0RFdPnrJMZHscbUl4nZu2wyWXJ0+qYiRE0UjwTXwz8
         03f/2ysO7f1xe5jYyHSyqpbA0JJFSDl7zqjI4ijv+vdn6MgRa2bJkC1lYpOXyTIZ4B
         ElT5ef/JVel33YA9TTzeWMHnuiVEMMVz1h2BQ2O8ABq9myzuOPfAlcqT5lhNVI6q6v
         z75pOVaUsYxWtSfbr78UWgvrvnwoyY2/pWNKVqqE2AdVeM6HMKNWP+4HrBS4O/XK14
         yxbDghrHiuM13ozMdlgNUaWvTf9iJm03Q21J6J1yElhtME+LaszQCOlyZQWZF/ZDwJ
         R/DMrZxrGm0SQ==
Subject: Re: [PATCH 03/10] media: uvcvideo: Return -EIO for control errors
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
References: <20210311122040.1264410-1-ribalda@chromium.org>
 <20210311122040.1264410-5-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d2c0d5cd-f6d9-c23b-c33b-507e7ceb082f@xs4all.nl>
Date:   Thu, 11 Mar 2021 15:08:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311122040.1264410-5-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGPLfqYFT0cyBaMCW/BYf5LjdsOI5KKTHF5gYg8+ghH8RG7vo2duwoPsyhHBJZnt/OJk79Uy6ZnzVAr18Ma8Bn613hqqhfVISjS2neMSd7F8YI0BuUup
 HyVwNh3z9EaKFXDVACEWECdzNuV80nmzBc2fSjzGtcFgm7yTwGmvRVilZwalRxmvCatYgLvE8uNGknajWqLSYSe3pwd/jtK1/lRb9TrPfLXHOiWqasqJsXcT
 TFdEZaoKF1P33rFVl/dJmgagCaHDX3MVNdc7wqX6tbx3c0GuUh48FRF6POwVSRP4iCtY2YhDqnKZaXye+8pu2wN7fSNY6smkhj+GjoypfxlWIoZ0+SMjn3Ug
 TJ0MWXqqv9d0Z99+EOKRsPWxaXHaeIx8fv5Qch7KpPVIHqNaQU7hAafDM0WbBcPoaWlqz1WX
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2021 13:20, Ricardo Ribalda wrote:
> Fixes v4l2-compliance:
> 
> Control ioctls (Input 0):
>                 fail: v4l2-test-controls.cpp(448): s_ctrl returned an error (22)
>         test VIDIOC_G/S_CTRL: FAIL
>                 fail: v4l2-test-controls.cpp(698): s_ext_ctrls returned an error (22)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

-EIO is specifically meant for FW/HW issues. So make clear in this commit
log that if an error occurs in the code at that place, then that's because
of the device doing something unexpected.

Actually, that should be in a comment before the 'return -EIO;'.

Regards,

	Hans

> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index f2f565281e63..5442e9be1c55 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -113,7 +113,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	case 6: /* Invalid control */
>  	case 7: /* Invalid Request */
>  	case 8: /* Invalid value within range */
> -		return -EINVAL;
> +		return -EIO;
>  	default: /* reserved or unknown */
>  		break;
>  	}
> 

