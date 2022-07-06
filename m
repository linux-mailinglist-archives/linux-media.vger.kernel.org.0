Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6EA1568A1F
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 15:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbiGFNwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 09:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbiGFNv5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 09:51:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4F221802
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 06:51:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B97F230A;
        Wed,  6 Jul 2022 15:51:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657115510;
        bh=mlfcmFU+MuTvm5q/KwZSz1WQnwJYX033iXs8vC4wExA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CmOEHmjNhjNGF2hzcMRPaovs1lXB+/rWyOAnZjTfTlfZQYfJ79ZDkDtURTe8uLQLH
         n/EVnp65bKkCPI06Axeieb1XjzJTilnedP42uP/u+RLMy7QP/ucC833//p3XK2ar8e
         ItXtsG6WPx+pxDqJ8DSLBDWp7D/vLbm87O/hYibI=
Date:   Wed, 6 Jul 2022 16:51:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsWTXnTpeM+mCImc@pendragon.ideasonboard.com>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <12352558.O9o76ZdvQC@steina-w>
 <YsRVAV8a48CwpaSY@p310.k.g>
 <2450654.irdbgypaU6@steina-w>
 <YsWJBEPhp9WhiYe1@p310.k.g>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsWJBEPhp9WhiYe1@p310.k.g>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

On Wed, Jul 06, 2022 at 04:07:16PM +0300, Petko Manolov wrote:
> On 22-07-06 08:18:20, Alexander Stein wrote:
> > 
> > Thanks! Indeed at a first glance it looks straight forward. I was trying to 
> > get an imx327 running on a imx8mm, called TQMa8MxML. See [1] for some details. 
> > The cover letter describes the config setup. The media-ctl commands might help 
> > your setup. Note the settle times are an ugly bitch and are crucial to be set 
> > on my board, but I'm not sure why they have to be that way. Patch 1-8 are 
> > obsolete by now with the updates to drivers/media/platform/nxp/ 
> > imx-mipi-csis.c. Patch 9 might help you configure the DT.
> 
> Right, media-ctl is it.  In fact the pipelines have been properly set up so i 
> only had to change the format.  The attached media graph is below
> 
> Now, there are two problems i'm stumbling upon.  One is related to the capture 
> device not actually supporting imx492 format(s), which are:
> 
> 	MEDIA_BUS_FMT_SGBRG10_1X10
> 	MEDIA_BUS_FMT_SGBRG12_1X12
> 
> which i guess is why i am being greeted with (when using v4l2-ctl):
> 
> 	imx7-csi 32e20000.csi: capture format not valid
> 
> When i manually force it to something that is actually supported, 
> MEDIA_BUS_FMT_SGBRG16_1X16, i get:
> 
> 	imx7-csi 32e20000.csi: pipeline start failed with -67
> 
> Since this isn't one of the usual error numbers i guess it comes from within the 
> driver code.  I might be getting this error because the source is 12 bit while 
> the sink is 16 and i am breaking something, dunno.
> 
> Shall i go ahead and add MEDIA_BUS_FMT_SGBRG12_1X12 to the capture driver or i 
> am missing something here?

I had a quick look at the imx7-media-csi driver, and I think it supports
1-bit bayer correctly. You need to use the MEDIA_BUS_FMT_SGBRG10_1X10
or MEDIA_BUS_FMT_SGBRG12_1X12 media bus formats through the pipeline,
and the V4L2_PIX_FMT_SGBRG16 pixel format on the video captude node. If
that doesn't work, have a look at capture_validate_fmt() in
drivers/staging/media/imx/imx-media-capture.c to see which check fails.

> The other problem is when v4l2 tries to allocate buffer for even a single frame.  
> This is 8192x5556 10/12bit bayer sensor and, maybe not surprisingly i get 
> "buffer allocation failed".  Is it possible that i'm the first to step on this 
> issue on imx8m-mini or in general?

You may want to increase the size of the CMA in the kernel configuration
(or on the kernel command line).

> Media controller API version 5.19.0
> 
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial          
> bus info        platform:32e20000.csi
> hw revision     0x0
> driver version  5.19.0
> 
> Device topology
> - entity 1: csi (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
> 	pad0: Sink
> 		[fmt:SGBRG12_1X12/4096x2048 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
> 		<- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
> 	pad1: Source
> 		[fmt:SGBRG12_1X12/4096x2048 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
> 		-> "csi capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
> 	pad0: Sink
> 		<- "csi":1 [ENABLED,IMMUTABLE]
> 
> - entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev1
> 	pad0: Sink
> 		[fmt:SGBRG12_1X12/4096x2048 field:none]
> 		<- "imx492 1-0010":0 []
> 	pad1: Source
> 		[fmt:SGBRG12_1X12/4096x2048 field:none]
> 		-> "csi":0 [ENABLED,IMMUTABLE]
> 
> - entity 15: imx492 1-0010 (1 pad, 1 link)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev2
> 	pad0: Source
> 		[fmt:SGBRG12_1X12/4096x2048 field:none colorspace:raw xfer:none]
> 		-> "csis-32e30000.mipi-csi":0 []
> 


-- 
Regards,

Laurent Pinchart
