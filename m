Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C542A135EC1
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 17:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731414AbgAIQyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 11:54:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727738AbgAIQyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 11:54:01 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5D3F52F;
        Thu,  9 Jan 2020 17:53:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578588839;
        bh=sOC8mik59yBJH+Ojdmaq5uVi1sLgq4RG29ymvZmJjzc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rNYxP1oi3fClt3LDl93WQ3Ybt5/HuHty+5P/KtrXWipsEjipStzncldV5Lnv8yY7V
         dXPT/rRRo9HGE6n9p2GqEXsV5fT/gbPwMVy5dP+Bw4GdDvHlxmB0vyBrbqMnTvhEL/
         jTXO9KrEe06aGTp0a0YjBqU3DcGp3uwUcVo35U6Q=
Date:   Thu, 9 Jan 2020 18:53:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     mchehab@kernel.org, hyun.kwon@xilinx.com, vkoul@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: xilinx: Use dma_request_chan() instead
 dma_request_slave_channel()
Message-ID: <20200109165348.GG31792@pendragon.ideasonboard.com>
References: <20191217104235.23771-1-peter.ujfalusi@ti.com>
 <20200109164847.GF31792@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200109164847.GF31792@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello again,

On Thu, Jan 09, 2020 at 06:48:47PM +0200, Laurent Pinchart wrote:
> On Tue, Dec 17, 2019 at 12:42:35PM +0200, Peter Ujfalusi wrote:
> > dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> > eating up the error code.
> > 
> > By using dma_request_chan() directly the driver can support deferred
> > probing against DMA.
> > 
> > Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Vinod, could you please pick this up ?

I spoke too fast.

> > ---
> >  drivers/media/platform/xilinx/xilinx-dma.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> > index b211380a11f2..9ce515ff9c0a 100644
> > --- a/drivers/media/platform/xilinx/xilinx-dma.c
> > +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> > @@ -725,10 +725,10 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
> >  
> >  	/* ... and the DMA channel. */
> >  	snprintf(name, sizeof(name), "port%u", port);
> > -	dma->dma = dma_request_slave_channel(dma->xdev->dev, name);
> > -	if (dma->dma == NULL) {
> > +	dma->dma = dma_request_chan(dma->xdev->dev, name);
> > +	if (IS_ERR(dma->dma)) {
> >  		dev_err(dma->xdev->dev, "no VDMA channel found\n");
> > -		ret = -ENODEV;
> > +		ret = PTR_ERR(dma->dma);
> >  		goto error;

At the error label, we have

error:
	xvip_dma_cleanup(dma);
	return ret;

and xvip_dma_cleanup() contains

	if (dma->dma)
		dma_release_channel(dma->dma);

You need to turn this into

	if (!IS_ERR_OR_NULL(dma->dma))

or add a

		dma->dma = NULL;

in the error case in xvip_dma_init().

> >  	}
> >  

-- 
Regards,

Laurent Pinchart
