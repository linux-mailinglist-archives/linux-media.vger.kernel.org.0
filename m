Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E52C64D9A40
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 12:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242131AbiCOLVO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 07:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240084AbiCOLVN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 07:21:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00FE4F9D3
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 04:20:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 092181AD5;
        Tue, 15 Mar 2022 12:19:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647343200;
        bh=KQAxMxxQGvW8zpvNnvh09Dhrb3kjZwoKWimBPMiQUlc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gKRjiV2a0ksX+WMfq3NUIxFdR8scK6GDPYnTh6r+Coq0WmqW6lMnOR8o0BBW/2rmG
         6fZ8eIJeZeVUqXR6+r1EzW3LLNqdSDRLGtYmcD3OOGOZZ/OiNxNOaiDAlNFBHlrhp/
         zf68pL5JRHugnJoyXZhvv/QRFaGFMSqK47AAVHsE=
Date:   Tue, 15 Mar 2022 13:19:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 1/5] media: imx: imx-mipi-csis: Simplify
 mipi_csis_s_stream()
Message-ID: <YjB2Twp17epS4lpj@pendragon.ideasonboard.com>
References: <20220314103941.46021-1-jacopo@jmondi.org>
 <20220314103941.46021-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220314103941.46021-2-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 14, 2022 at 11:39:37AM +0100, Jacopo Mondi wrote:
> Simplify the mipi_csis_s_stream() function.
> 
> This actually fixes a bug, as if calling the subdev's s_stream(1) fails,
> mipi_csis_stop_stream() was not called.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 58 ++++++++++++----------
>  1 file changed, 33 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index c4d1a6fe5007..60e7f0452582 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -910,43 +910,51 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
>  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> -	int ret = 0;
> +	int ret;
>  
> -	if (enable) {
> -		ret = mipi_csis_calculate_params(csis);
> -		if (ret < 0)
> -			return ret;
> +	if (!enable) {
> +		mutex_lock(&csis->lock);
>  
> -		mipi_csis_clear_counters(csis);
> +		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
>  
> -		ret = pm_runtime_resume_and_get(csis->dev);
> -		if (ret < 0)
> -			return ret;
> +		mipi_csis_stop_stream(csis);
> +		if (csis->debug.enable)
> +			mipi_csis_log_counters(csis, true);
> +
> +		mutex_unlock(&csis->lock);
> +
> +		pm_runtime_put(csis->dev);
> +
> +		return 0;
>  	}
>  
> -	mutex_lock(&csis->lock);
> +	ret = mipi_csis_calculate_params(csis);
> +	if (ret < 0)
> +		return ret;
>  
> -	if (enable) {
> -		mipi_csis_start_stream(csis);
> -		ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
> -		if (ret < 0)
> -			goto unlock;
> +	mipi_csis_clear_counters(csis);
>  
> -		mipi_csis_log_counters(csis, true);
> -	} else {
> -		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
> +	ret = pm_runtime_resume_and_get(csis->dev);
> +	if (ret < 0)
> +		return ret;
>  
> -		mipi_csis_stop_stream(csis);
> +	mutex_lock(&csis->lock);
>  
> -		if (csis->debug.enable)
> -			mipi_csis_log_counters(csis, true);
> -	}
> +	mipi_csis_start_stream(csis);
> +	ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	mipi_csis_log_counters(csis, true);
>  
> -unlock:
>  	mutex_unlock(&csis->lock);
>  
> -	if (!enable || ret < 0)
> -		pm_runtime_put(csis->dev);
> +	return 0;
> +
> +out:

I'd name the label error instead of out, as "out" and "done" usually
refer to either normal code paths or combined success+error paths. With
that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll prepare a consolidated series with other pending patches and send a
pull request. If this is the only change, and if you're fine with I'll,
I can update this locally.

> +	mipi_csis_stop_stream(csis);
> +	mutex_unlock(&csis->lock);
> +	pm_runtime_put(csis->dev);
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
