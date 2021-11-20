Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610E9457E33
	for <lists+linux-media@lfdr.de>; Sat, 20 Nov 2021 13:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237042AbhKTMiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Nov 2021 07:38:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37018 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236386AbhKTMiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Nov 2021 07:38:00 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07FE7B91;
        Sat, 20 Nov 2021 13:34:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637411696;
        bh=3ZlAVlP+a47A8ZbSX5jeskWqh17cPcCCfqse18yS8iM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gtVgt+uW+57nkJVsMWNQjMlGPvi/WFx/ENXifxhVf5zu9hXjGPsXTXinR8VY1S6q6
         8naPflVQsEBD6Nh4ZIM0GW6cyV0RXnChzYXhchZmM4ncO/2A2LRDpcslklKAz6midw
         K238FPP7o6EWlBCdyRxlHl5DBAROlFNqm5zlMXAg=
Date:   Sat, 20 Nov 2021 14:34:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: Re: [PATCH] media: rkisp1: remove support for V4L2_PIX_FMT_GREY
Message-ID: <YZjrWdrZzyEE8G7g@pendragon.ideasonboard.com>
References: <20211120110257.22775-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211120110257.22775-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Sat, Nov 20, 2021 at 01:02:57PM +0200, Dafna Hirschfeld wrote:
> When trying to stream on both mainpatch and selfpatch
> with grey format, I get an iommu page fault.
> The fault is on the address at the end of the buffer,
> so it seems that the device is somehow wrongly
> configured and thinks there is another plane.

Could we try to fix that instead ? There are IR sensors for which the
GREY format is useful.

> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c     | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 768987d5f2dd..7f78f361dd5e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -116,13 +116,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
> -	/* yuv400 */
> -	{
> -		.fourcc = V4L2_PIX_FMT_GREY,
> -		.uv_swap = 0,
> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> -	},
>  	/* yuv420 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
> @@ -244,14 +237,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
> -	/* yuv400 */
> -	{
> -		.fourcc = V4L2_PIX_FMT_GREY,
> -		.uv_swap = 0,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> -	},
>  	/* rgb */
>  	{
>  		.fourcc = V4L2_PIX_FMT_XBGR32,

-- 
Regards,

Laurent Pinchart
