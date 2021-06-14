Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306553A6C8A
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 18:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbhFNRBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 13:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbhFNRBP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 13:01:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD52EC061574;
        Mon, 14 Jun 2021 09:59:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 681D3A59;
        Mon, 14 Jun 2021 18:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623689949;
        bh=TTzEHwOuhgSM39sroCCujZmwX9sHOPc/YKGwgSdMLOw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TXA1lrj7Ogj8VCiIJkQWIZ0+cVLqkwICv4YBmxgUJ1deC6tg7jESEKsWPIa4Ro85f
         fCFiZZWVcoYY3MmGjHFADEbCgDddU6WBZwdAp/vXKzGMrJA8R2GJGzSsx+Mt7ySzmG
         Q0DJlIp53YGMYykmlAB9pPwqgZcD/+mjb6CO486U=
Date:   Mon, 14 Jun 2021 19:58:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 3/8] media: v4l2-core: fix whitespace damage in
 video_get_user()
Message-ID: <YMeKycZz/GOcb4rc@pendragon.ideasonboard.com>
References: <20210614103409.3154127-1-arnd@kernel.org>
 <20210614103409.3154127-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614103409.3154127-4-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thank you for the patch.

On Mon, Jun 14, 2021 at 12:34:04PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The initialization was indented with an extra tab in most lines,
> remove them to get the normal coding style.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index f19e56116e53..d94389145479 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3142,18 +3142,18 @@ static int video_get_user(void __user *arg, void *parg,
>  
>  			*vb = (struct v4l2_buffer) {
>  				.index		= vb32.index,
> -					.type		= vb32.type,
> -					.bytesused	= vb32.bytesused,
> -					.flags		= vb32.flags,
> -					.field		= vb32.field,
> -					.timestamp.tv_sec	= vb32.timestamp.tv_sec,
> -					.timestamp.tv_usec	= vb32.timestamp.tv_usec,
> -					.timecode	= vb32.timecode,
> -					.sequence	= vb32.sequence,
> -					.memory		= vb32.memory,
> -					.m.userptr	= vb32.m.userptr,
> -					.length		= vb32.length,
> -					.request_fd	= vb32.request_fd,
> +				.type		= vb32.type,
> +				.bytesused	= vb32.bytesused,
> +				.flags		= vb32.flags,
> +				.field		= vb32.field,
> +				.timestamp.tv_sec	= vb32.timestamp.tv_sec,
> +				.timestamp.tv_usec	= vb32.timestamp.tv_usec,
> +				.timecode	= vb32.timecode,
> +				.sequence	= vb32.sequence,
> +				.memory		= vb32.memory,
> +				.m.userptr	= vb32.m.userptr,
> +				.length		= vb32.length,
> +				.request_fd	= vb32.request_fd,
>  			};
>  			break;
>  		}

-- 
Regards,

Laurent Pinchart
