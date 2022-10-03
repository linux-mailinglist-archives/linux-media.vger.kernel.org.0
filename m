Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC695F33EA
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 18:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiJCQyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 12:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiJCQyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 12:54:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FDB31204
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 09:53:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB1D0519;
        Mon,  3 Oct 2022 18:53:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664816014;
        bh=w8zeLat2DoAcooxFOPhy+YXtw+YVaybCn9RV4wF8q2Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mxbb3bvy8j6qKq8wlgz3rWgHl59khGM/tTYOW9wGIShSN4/pHKBhHzTqzwzrtfBEo
         jX8UrxIUlWmF0I7g20PsJ1SSUtROHIXf7w4JSp/iP5VNJk8Q+EeXlb+d3uZ4nXtrrK
         EOUm8XxRpeeSpdqkebdCxKml1xP2+2g0Mtl+PQY4=
Date:   Mon, 3 Oct 2022 19:53:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v15 01/19] media: v4l2-subdev: Sort includes
Message-ID: <YzsTimB4bvBx+nAF@pendragon.ideasonboard.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221003121852.616745-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Oct 03, 2022 at 03:18:34PM +0300, Tomi Valkeinen wrote:
> Sort the includes alphabetically.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 5c27bac772ea..ca5b764d796d 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -8,20 +8,20 @@
>   *	    Sakari Ailus <sakari.ailus@iki.fi>
>   */
>  
> +#include <linux/export.h>
>  #include <linux/ioctl.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> -#include <linux/videodev2.h>
> -#include <linux/export.h>
>  #include <linux/version.h>
> +#include <linux/videodev2.h>
>  
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> -#include <media/v4l2-ioctl.h>
> -#include <media/v4l2-fh.h>
>  #include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-ioctl.h>
>  
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)

-- 
Regards,

Laurent Pinchart
