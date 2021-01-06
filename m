Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21BB2EC678
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 00:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbhAFXA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 18:00:26 -0500
Received: from retiisi.eu ([95.216.213.190]:43032 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727098AbhAFXAZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Jan 2021 18:00:25 -0500
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9A55F634C87;
        Thu,  7 Jan 2021 00:59:24 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kxHm0-00016B-HK; Thu, 07 Jan 2021 00:59:24 +0200
Date:   Thu, 7 Jan 2021 00:59:24 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 68/75] media: imx: imx7_mipi_csis: Calculate Ths_settle
 from source pixel rate
Message-ID: <20210106225924.GF850@valkosipuli.retiisi.org.uk>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-69-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105152852.5733-69-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the patchset.

On Tue, Jan 05, 2021 at 05:28:45PM +0200, Laurent Pinchart wrote:
> The Ths_settle timing parameter depends solely on the pixel rate of the
> source. Calculate it at runtime instead of requiring it to be specified
> in the device tree.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 65 ++++++++++++++++++----
>  1 file changed, 53 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 3c68ee8b2a59..c83450ac37fa 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -24,6 +24,7 @@
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
>  
> +#include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-mc.h>
> @@ -233,7 +234,11 @@ struct csi_state {
>  	struct media_pad pads[CSIS_PADS_NUM];
>  	struct v4l2_subdev mipi_sd;
>  	struct v4l2_async_notifier notifier;
> -	struct v4l2_subdev *src_sd;
> +
> +	struct {
> +		struct v4l2_subdev *sd;
> +		struct v4l2_ctrl *pixel_rate;
> +	} src;
>  
>  	u8 index;
>  	struct platform_device *pdev;
> @@ -482,6 +487,31 @@ static void __mipi_csis_set_format(struct csi_state *state)
>  	mipi_csis_write(state, MIPI_CSIS_ISPRESOL_CH0, val);
>  }
>  
> +static int mipi_csis_calculate_params(struct csi_state *state)
> +{
> +	u64 pixel_rate;
> +	u32 lane_rate;
> +
> +	/* Calculate the line rate from the pixel rate. */
> +	pixel_rate = v4l2_ctrl_g_ctrl_int64(state->src.pixel_rate);

Could you instead use v4l2_get_link_freq()?

I guess we're also moving to the LINK_FREQ control to tell this.

> +	lane_rate = div_u64(pixel_rate, state->bus.num_data_lanes)
> +		  * state->csis_fmt->width;
> +	if (lane_rate < 80000000 || lane_rate > 1500000000) {
> +		dev_dbg(state->dev, "Out-of-bound lane rate %u\n", lane_rate);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * The HSSETTLE counter value is document in a table, but can also
> +	 * easily be calculated.
> +	 */
> +	state->hs_settle = (lane_rate - 5000000) / 45000000;

Much better, thank you!

-- 
Regards,

Sakari Ailus
