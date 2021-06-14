Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58DF3A6C85
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 18:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235240AbhFNQ61 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 12:58:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37550 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235198AbhFNQ61 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 12:58:27 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13E35A59;
        Mon, 14 Jun 2021 18:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623689783;
        bh=NKxVcAiJXRYydk66BQhj3l3yAqP0NvgNKvCd+q3k96o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uXVIWxT0aQU1nHRv126wh2Uh15t8UeXaZtQzPFs2uDjckx3/P6OJxK6USJXJ3yyjT
         AxrrrYgHtz8hH4d7MZi/A2N7wuEKPMlG7evGxYHNkGWylNAsPJ/3NYkRxoMmSEP8mW
         e88piP3bLn/rAQc1prTSSz1NVaMBYTqtKNNq4FLI=
Date:   Mon, 14 Jun 2021 19:56:03 +0300
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
Subject: Re: [PATCH v3 2/8] media: v4l2-core: explicitly clear ioctl input
 data
Message-ID: <YMeKI4OZrtS529BO@pendragon.ideasonboard.com>
References: <20210614103409.3154127-1-arnd@kernel.org>
 <20210614103409.3154127-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210614103409.3154127-3-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thank you for the patch.

On Mon, Jun 14, 2021 at 12:34:03PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As seen from a recent syzbot bug report, mistakes in the compat ioctl
> implementation can lead to uninitialized kernel stack data getting used
> as input for driver ioctl handlers.
> 
> The reported bug is now fixed, but it's possible that other related
> bugs are still present or get added in the future. As the drivers need
> to check user input already, the possible impact is fairly low, but it
> might still cause an information leak.
> 
> To be on the safe side, always clear the entire ioctl buffer before
> calling the conversion handler functions that are meant to initialize
> them.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 58df927aec7e..f19e56116e53 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3124,8 +3124,10 @@ static int video_get_user(void __user *arg, void *parg,
>  		if (copy_from_user(parg, (void __user *)arg, n))
>  			err = -EFAULT;
>  	} else if (in_compat_syscall()) {
> +		memset(parg, 0, n);
>  		err = v4l2_compat_get_user(arg, parg, cmd);
>  	} else {
> +		memset(parg, 0, n);

This could possibly be moved with the #if block by making it cover the
whole switch, but I don't think this code path will be hit when cmd
isn't one of the values handled below, so it shouldn't matter.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		switch (cmd) {
>  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>  		case VIDIOC_QUERYBUF_TIME32:

-- 
Regards,

Laurent Pinchart
