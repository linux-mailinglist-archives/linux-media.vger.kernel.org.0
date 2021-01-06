Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A50C2EBF92
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbhAFO0z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Jan 2021 09:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbhAFO0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:26:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63595C061358
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:26:14 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9lN-0006yk-2X; Wed, 06 Jan 2021 15:26:13 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9lM-0002Rw-HI; Wed, 06 Jan 2021 15:26:12 +0100
Message-ID: <625e46bff3c7e8634cca894c2463e2e5c984fa45.camel@pengutronix.de>
Subject: Re: [PATCH 09/75] media: imx: capture: Use device name to construct
 bus_info
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Wed, 06 Jan 2021 15:26:12 +0100
In-Reply-To: <20210105152852.5733-10-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-10-laurent.pinchart@ideasonboard.com>
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
> The v4l2_capability bus_info field is meant to locate the device in the
> system. Using a subdev name isn't a good fit, the device name is a much
> better option. Use it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx-media-capture.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 21f01ec56bd5..8efe3d753967 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -74,7 +74,7 @@ static int vidioc_querycap(struct file *file, void *fh,
>  	strscpy(cap->driver, IMX_CAPTURE_NAME, sizeof(cap->driver));
>  	strscpy(cap->card, IMX_CAPTURE_NAME, sizeof(cap->card));
>  	snprintf(cap->bus_info, sizeof(cap->bus_info),
> -		 "platform:%s", priv->src_sd->name);
> +		 "platform:%s", dev_name(priv->dev));
>  
>  	return 0;
>  }

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
