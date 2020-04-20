Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1B51AFF9B
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 03:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgDTBtD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 21:49:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58298 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgDTBtD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 21:49:03 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FCD4528;
        Mon, 20 Apr 2020 03:49:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587347341;
        bh=dtjKm2ZFmzoPJEKsDkMeDQqBi2bm65JtHk0HqlM2noY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rclx0DPtcojs+lzedrEs9oGIIn1ExOGfN61gGK1TKaSliP5+bFz8A2U/Vu4inFR6E
         GeqosV1Mtk16U0OWX7k5r0JeOyxsV3nVFI+Zm0WnCwABz11i5pxIaLq4sIN84AXr1f
         UfN7byYMApYCMIYzBHIyD7Z18OxatXF3LoAcMzOQ=
Date:   Mon, 20 Apr 2020 04:48:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/6] media: v4l2-subdev: Deprecate g_mbus_config video
 op
Message-ID: <20200420014846.GB15673@pendragon.ideasonboard.com>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
 <20200415105004.2497356-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200415105004.2497356-3-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Apr 15, 2020 at 12:49:59PM +0200, Jacopo Mondi wrote:
> Deprecate 'g_mbus_config' video operation in favor of the newly
> introduced 'get_mbus_config' pad operation.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Not necessarily a blocker for this series, but it would be nice to
convert the handful of users of this API (you can leave soc-camera
untouched as it's on its way out of the kernel).

> ---
>  include/media/v4l2-subdev.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d1a5e9d1ea63..9bf14c41626d 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -466,7 +466,9 @@ struct v4l2_mbus_pad_config {
>   *
>   * @query_dv_timings: callback for VIDIOC_QUERY_DV_TIMINGS() ioctl handler code.
>   *
> - * @g_mbus_config: get supported mediabus configurations
> + * @g_mbus_config: get supported mediabus configurations. This operation is
> + *		   deprecated in favour of the get_mbus_config() pad operation
> + *		   and should not be used by new software.
>   *
>   * @s_mbus_config: set a certain mediabus configuration. This operation is added
>   *	for compatibility with soc-camera drivers and should not be used by new

-- 
Regards,

Laurent Pinchart
