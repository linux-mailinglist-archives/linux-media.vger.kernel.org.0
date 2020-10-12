Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175CB28BFD3
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 20:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387655AbgJLSgZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 14:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgJLSgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 14:36:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379E5C0613D0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 11:36:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3FD0A42;
        Mon, 12 Oct 2020 20:36:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602527784;
        bh=D93+otkTYV0IlZcQSLlgB+vhv47saVqxtdZnP0naeEI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B0ndyMNN3lMccD/yDqjVOBEaLvL2Lrr6AK8NNiwpd9BodJZEwV3Ul01bpSLEtbZ9v
         62/JfI34QGLaXGCs5F+D7RcSC6CXbDUrX0jW6o6g+VV7usDfPgRM+0x1JZkL+IcTQt
         AeqNn3YtTibh8+eImkNoerTqCULO+CFimx203gf0=
Date:   Mon, 12 Oct 2020 21:35:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tsuchiya Yuto <kitakar@gmail.com>,
        bingbu.cao@intel.com, Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v3 6/8] ipu3-cio2: Remove explicit type from frame size
 checks
Message-ID: <20201012183538.GC740@pendragon.ideasonboard.com>
References: <20201012180414.11579-1-sakari.ailus@linux.intel.com>
 <20201012180414.11579-7-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201012180414.11579-7-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Oct 12, 2020 at 09:04:12PM +0300, Sakari Ailus wrote:
> Now that the values are unsigned, we can remove explicit cast to u32.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

With Andy's comment addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 87d040e176f7..e42177f8c426 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1282,9 +1282,8 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
>  		}
>  	}
>  
> -	fmt->format.width = min_t(u32, fmt->format.width, CIO2_IMAGE_MAX_WIDTH);
> -	fmt->format.height = min_t(u32, fmt->format.height,
> -				   CIO2_IMAGE_MAX_LENGTH);
> +	fmt->format.width = min(fmt->format.width, CIO2_IMAGE_MAX_WIDTH);
> +	fmt->format.height = min(fmt->format.height, CIO2_IMAGE_MAX_LENGTH);
>  	fmt->format.field = V4L2_FIELD_NONE;
>  
>  	mutex_lock(&q->subdev_lock);

-- 
Regards,

Laurent Pinchart
