Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB662EBF96
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbhAFO2X convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Jan 2021 09:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbhAFO2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:28:22 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFDFC06134C
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:27:42 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9mm-0007BL-RG; Wed, 06 Jan 2021 15:27:40 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9mm-0002UB-Hr; Wed, 06 Jan 2021 15:27:40 +0100
Message-ID: <42509b92f6aceba1692622ee8e838cb69ab90342.camel@pengutronix.de>
Subject: Re: [PATCH 11/75] media: imx: capture: Handle errors from
 v4l2_fh_open()
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Wed, 06 Jan 2021 15:27:40 +0100
In-Reply-To: <20210105152852.5733-12-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-12-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-01-05 at 17:27 +0200, Laurent Pinchart wrote:
> If the call to v4l2_fh_open() fails, return the error code instead of
> proceeding normally as if nothing happened.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx-media-capture.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 0b1dbff198a2..b599e30df338 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -643,13 +643,16 @@ static int capture_open(struct file *file)
>  		return -ERESTARTSYS;
>  
>  	ret = v4l2_fh_open(file);
> -	if (ret)
> +	if (ret) {
>  		dev_err(priv->dev, "v4l2_fh_open failed\n");
> +		goto out;
> +	}
>  
>  	ret = v4l2_pipeline_pm_get(&vfd->entity);
>  	if (ret)
>  		v4l2_fh_release(file);
>  
> +out:
>  	mutex_unlock(&priv->mutex);
>  	return ret;
>  }

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
