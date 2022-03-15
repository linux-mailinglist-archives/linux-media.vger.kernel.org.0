Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA6C34D9A5A
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 12:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241024AbiCOL2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 07:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiCOL2a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 07:28:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1AFD4F9D7
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 04:27:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6B851AD5;
        Tue, 15 Mar 2022 12:27:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647343636;
        bh=HJNcA5JmGkYK0p7sqxeA7l1VIwPKct9FeI9/Xsdyx5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I0vyyqSXrJ07Fr45/QIXg62dRPtGvWfsq6AzNVn8cdmWbfhCtW4CRMSmd4rdhh7jv
         rQePJrPTA/yQQoJNST3XNo+ExZrJj9WNlWaxl38v1+PatZ1VNQrcfSLFmnSyqciv1J
         A/HyeXaQNruvneT5E/o4t8/UInz+QrTlDq1dU+7k=
Date:   Tue, 15 Mar 2022 13:26:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 3/5] media: imx: imx-mipi-csis: Remove lock from s_stream
Message-ID: <YjB4AyahH4mTqcbE@pendragon.ideasonboard.com>
References: <20220314103941.46021-1-jacopo@jmondi.org>
 <20220314103941.46021-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220314103941.46021-4-jacopo@jmondi.org>
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

On Mon, Mar 14, 2022 at 11:39:39AM +0100, Jacopo Mondi wrote:
> The s_stream() operation implementation was locked to avoid races with
> the mipi_csis_log_status() which access the platform registers and needs
> the interface to be powered up.
> 
> As powering is now handled by runtime_pm which is refcounted, it is
> not necessary to manually lock s_stream() anymore.

The lock is also used to protect against races between .s_stream() and
.set_fmt() both accessing the active format. I don't think we can drop
it.

> As the error path is now simplified, we can inline it.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 23 ++++++----------------
>  1 file changed, 6 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index b76bb129a416..4a6152c13d52 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -912,16 +912,12 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	int ret;
>  
>  	if (!enable) {
> -		mutex_lock(&csis->lock);
> -
>  		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
>  
>  		mipi_csis_stop_stream(csis);
>  		if (csis->debug.enable)
>  			mipi_csis_log_counters(csis, true);
>  
> -		mutex_unlock(&csis->lock);
> -
>  		pm_runtime_put(csis->dev);
>  
>  		return 0;
> @@ -937,25 +933,18 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (ret < 0)
>  		return ret;
>  
> -	mutex_lock(&csis->lock);
> -
>  	mipi_csis_start_stream(csis);
>  	ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
> -	if (ret < 0)
> -		goto out;
> +	if (ret < 0) {
> +		mipi_csis_stop_stream(csis);
> +		pm_runtime_put(csis->dev);
>  
> -	mipi_csis_log_counters(csis, true);
> +		return ret;
> +	}
>  
> -	mutex_unlock(&csis->lock);
> +	mipi_csis_log_counters(csis, true);
>  
>  	return 0;
> -
> -out:
> -	mipi_csis_stop_stream(csis);
> -	mutex_unlock(&csis->lock);
> -	pm_runtime_put(csis->dev);
> -
> -	return ret;
>  }
>  
>  static struct v4l2_mbus_framefmt *

-- 
Regards,

Laurent Pinchart
