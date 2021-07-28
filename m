Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1913D8742
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 07:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233670AbhG1Fpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 01:45:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47692 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232891AbhG1Fpi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 01:45:38 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FDDDEE;
        Wed, 28 Jul 2021 07:45:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627451135;
        bh=SHdFeGCCQ/sDHraMXKm6bZmYzkPYi/TuFkJK9P990Hg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SIjc52b3eYG/7mWKEkGrNiErMGhWMQbQ7feSpqTH5TL1AV5imPpXWcMLVVCdW3mHu
         1KvxV3Zf6gfi2UcPztL5kxEmciawrjJK8UgJv317FEeMh2BVUHAaqJj5nfEeizqQbB
         WZSWwvT2/Jel3pGGbRlnEZtcs5169ureSLPSHx94=
Date:   Wed, 28 Jul 2021 08:45:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     mchehab@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2] media: uvcvideo: Remove unused including
 <linux/version.h>
Message-ID: <YQDu+afJRtcTK/c0@pendragon.ideasonboard.com>
References: <20210727092854.1006-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210727092854.1006-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cai,

Thank you for the patch.

On Tue, Jul 27, 2021 at 05:28:53PM +0800, Cai Huoqing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> V1->V2: Split the patch in two.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Taken in my tree for v5.15. Thank you.

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9a791d8ef200..b1b055784f8d 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -16,7 +16,6 @@
>  #include <linux/videodev2.h>
>  #include <linux/vmalloc.h>
>  #include <linux/wait.h>
> -#include <linux/version.h>
>  #include <asm/unaligned.h>
>  
>  #include <media/v4l2-common.h>

-- 
Regards,

Laurent Pinchart
