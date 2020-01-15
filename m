Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EABD813CAF8
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 18:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbgAOR2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 12:28:42 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58336 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgAOR2l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 12:28:41 -0500
Received: from pendragon.ideasonboard.com (85-76-106-26-nat.elisa-mobile.fi [85.76.106.26])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BAC62BA;
        Wed, 15 Jan 2020 18:28:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1579109319;
        bh=GTgiNckxVZKqQw4JXS+z539Vsk6pXreiOLeWxF8/ceY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SdVmbgcjhqKpJ6Wp78xWcDXte9rFyELUrb4onsnKzjwGOxjSb7NdZ3JO8pgAC+UR4
         lkH+/JafgnTAVEJLgfP6tAsR8l/X2R9Fj93XpskQSZYhqmL/xpJsuPwW3wzRManz+R
         yKMhx+dbsUoHh8vfVPbJgYMEiLuvhOciARjT4tLw=
Date:   Wed, 15 Jan 2020 19:28:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     mchehab@kernel.org, hyun.kwon@xilinx.com, vkoul@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2] media: xilinx: Use dma_request_chan() instead
 dma_request_slave_channel()
Message-ID: <20200115172822.GB7139@pendragon.ideasonboard.com>
References: <20200110071648.15690-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200110071648.15690-1-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Peter,

(CC'ing Hans)

Thank you for the patch.

On Fri, Jan 10, 2020 at 09:16:48AM +0200, Peter Ujfalusi wrote:
> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> eating up the error code.
> 
> By using dma_request_chan() directly the driver can support deferred
> probing against DMA.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree. Hans, you asked me on IRC to review this, did you
plan to get it merged upstream yourself ? If so I'll drop it.

> ---
> Hi,
> 
> Changes since v1:
> - Fix cleanup path when DMA request failed as suggested by Laurent
> - Print error only in case when the error is not EPROBE_DEFER
> 
>  drivers/media/platform/xilinx/xilinx-dma.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index b211380a11f2..3bb54a4db6a4 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -725,10 +725,11 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
>  
>  	/* ... and the DMA channel. */
>  	snprintf(name, sizeof(name), "port%u", port);
> -	dma->dma = dma_request_slave_channel(dma->xdev->dev, name);
> -	if (dma->dma == NULL) {
> -		dev_err(dma->xdev->dev, "no VDMA channel found\n");
> -		ret = -ENODEV;
> +	dma->dma = dma_request_chan(dma->xdev->dev, name);
> +	if (IS_ERR(dma->dma)) {
> +		ret = PTR_ERR(dma->dma);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dma->xdev->dev, "no VDMA channel found\n");
>  		goto error;
>  	}
>  
> @@ -752,7 +753,7 @@ void xvip_dma_cleanup(struct xvip_dma *dma)
>  	if (video_is_registered(&dma->video))
>  		video_unregister_device(&dma->video);
>  
> -	if (dma->dma)
> +	if (!IS_ERR_OR_NULL(dma->dma))
>  		dma_release_channel(dma->dma);
>  
>  	media_entity_cleanup(&dma->video.entity);

-- 
Regards,

Laurent Pinchart
