Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20D54114E1B
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 10:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfLFJUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 04:20:11 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38772 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfLFJUL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Dec 2019 04:20:11 -0500
Received: from [IPv6:2800:810:439:4b9::1004] (unknown [IPv6:2800:810:439:4b9::1004])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ezequiel)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D24EB2925C4;
        Fri,  6 Dec 2019 09:20:06 +0000 (GMT)
Message-ID: <a9448f56a067ed82aa3ce29492a02eb03dff32d0.camel@collabora.com>
Subject: Re: [PATCH] media: davinci/vpfe_capture.c: Avoid BUG_ON for
 register failure
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Aditya Pakki <pakki001@umn.edu>
Cc:     kjlu@umn.edu, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 06 Dec 2019 06:20:00 -0300
In-Reply-To: <20191206010029.14265-1-pakki001@umn.edu>
References: <20191206010029.14265-1-pakki001@umn.edu>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Aditya,

Thanks for the patch.

On Thu, 2019-12-05 at 19:00 -0600, Aditya Pakki wrote:
> In vpfe_register_ccdc_device(), failure to allocate dev->hw_ops
> invokes calls to BUG_ON(). This patch returns the error to callers
> instead of crashing.
> 

I'm curious, are you actually getting this type of crash?

> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/media/platform/davinci/vpfe_capture.c | 21 ++++++-------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
> index 916ed743d716..6d394a006977 100644
> --- a/drivers/media/platform/davinci/vpfe_capture.c
> +++ b/drivers/media/platform/davinci/vpfe_capture.c
> @@ -168,21 +168,11 @@ int vpfe_register_ccdc_device(const struct ccdc_hw_device *dev)
>  	int ret = 0;
>  	printk(KERN_NOTICE "vpfe_register_ccdc_device: %s\n", dev->name);
>  
> -	BUG_ON(!dev->hw_ops.open);
> -	BUG_ON(!dev->hw_ops.enable);
> -	BUG_ON(!dev->hw_ops.set_hw_if_params);
> -	BUG_ON(!dev->hw_ops.configure);
> -	BUG_ON(!dev->hw_ops.set_buftype);
> -	BUG_ON(!dev->hw_ops.get_buftype);
> -	BUG_ON(!dev->hw_ops.enum_pix);
> -	BUG_ON(!dev->hw_ops.set_frame_format);
> -	BUG_ON(!dev->hw_ops.get_frame_format);
> -	BUG_ON(!dev->hw_ops.get_pixel_format);
> -	BUG_ON(!dev->hw_ops.set_pixel_format);
> -	BUG_ON(!dev->hw_ops.set_image_window);
> -	BUG_ON(!dev->hw_ops.get_image_window);
> -	BUG_ON(!dev->hw_ops.get_line_length);
> -	BUG_ON(!dev->hw_ops.getfid);
> +	if (!dev->hw_ops) {
> +		printk(KERN_ERR "could not allocate hw_ops\n");

I'd drop this error message, as hw_ops is not really allocated here.

> +		ret = -EINVAL;
> +		goto rvalue;

Instead of a goto to a return, just return -EINVAL here.

> +	}
>  
>  	mutex_lock(&ccdc_lock);
>  	if (!ccdc_cfg) {
> @@ -211,6 +201,7 @@ int vpfe_register_ccdc_device(const struct ccdc_hw_device *dev)
>  	ccdc_dev = dev;
>  unlock:
>  	mutex_unlock(&ccdc_lock);
> +rvalue:
>  	return ret;
>  }
>  EXPORT_SYMBOL(vpfe_register_ccdc_device);

With those changes, the patch looks good.

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

