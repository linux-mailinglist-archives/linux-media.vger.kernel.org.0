Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD41415528
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 03:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238798AbhIWBlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 21:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238177AbhIWBlD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 21:41:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6632EC061574;
        Wed, 22 Sep 2021 18:39:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC1A645E;
        Thu, 23 Sep 2021 03:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632361169;
        bh=j/20tgKuqA5iRVTB505xTu0+Zvhb1fI2O36a/g1D6dk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pcuEEaJOVkqMl32dTGmgQsh1qcNZ+4zlA3z1Sq1qVUH3EedIBwy+eqMX2mUNYAern
         3L7RXzRzgjLJ6q3MG0xZcT+vN8Dq1Yt4lqw6xnFoBKYy0/gV9i08vOc9nrhVPmgWYt
         s4U35eu9DMd59AOlmwHNLAJnSLBl2DJEM5MltYy0=
Date:   Thu, 23 Sep 2021 04:39:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/5] media: rcar-vin: Support multiplexed CSI-2 receiver
Message-ID: <YUvaz/dOKfQ4wP6v@pendragon.ideasonboard.com>
References: <20210918150507.987294-1-jacopo+renesas@jmondi.org>
 <20210918150507.987294-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210918150507.987294-6-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sat, Sep 18, 2021 at 05:05:07PM +0200, Jacopo Mondi wrote:
> The R-Car CSI-2 receiver supports multiplexed streams.
> 
> The VIN driver inspects the CSI-2 subdevice format with the intent of
> validating formats at stream start time.
> 
> Each VIN instance is connected to a CSI-2 receiver which exposes a
> single stream and since it has acquired support for multiplexed streams
> maintains the format information in its v4l2_subdev_state per-stream.
> 
> Instrument the VIN driver to fetch the CSI-2 receiver format from the
> streams configuration by setting the stream identifier to 0 and pass to
> the subdevice its own state where to retrieve format information from.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 83b2f923cf98..a6f3701f3f3f 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1119,7 +1119,8 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  	};
>  
>  	fmt.pad = pad->index;
> -	if (v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt))
> +	fmt.stream = 0;
> +	if (v4l2_subdev_call(sd, pad, get_fmt, sd->state, &fmt))

Should we have a helper function for this ?

int v4l2_subdev_get_pad_fmt(struct v4l2_subdev *sd,
			    struct v4l2_subdev_format *format);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		return -EPIPE;
>  
>  	switch (fmt.format.code) {

-- 
Regards,

Laurent Pinchart
