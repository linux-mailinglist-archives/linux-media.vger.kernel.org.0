Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 197AA74BCA
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 12:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387602AbfGYKlg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 06:41:36 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39754 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387561AbfGYKlg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 06:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LCu+ouP92VouJGH4CWwVi1p5CMut9BsbZbN1CS9Pf88=; b=HawJQU3M7ADL21nSdtaMAToVX
        muakkdxhQ8wPSn/Mz6WzGu3z/TpysaZ0dQFFYRB4JeGLc3gdRNaZgx2NqSTuYybgJ4sMWDCDERd7X
        aUGGZTPmtAJ92nAYVqv6s+pRzGMvXe2lbsl75IWToMlG0VC3DKjlV10oNv3aThW6QijWwOO9m3ywv
        jpnmUtRbj1k34/mqdLmYrvemNX07Ot5y6g48RNCqwBL/cadvj1imheWKHeluwo7HGODGldsHl4Gfx
        NERVR9QPGa8CFdlzqX3v4UBczlsWk7FAfitbCDGbpWwytFzIpwDTuJQm1NkYefCHYVRelU1Lg1Wva
        nBZuUVN9w==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqbBf-0000Pl-Rm; Thu, 25 Jul 2019 10:41:28 +0000
Date:   Thu, 25 Jul 2019 07:41:23 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hverkuil@xs4all.nl, sakari.ailus@iki.fi, rmfrfs@gmail.com,
        linux-media@vger.kernel.org, slongerbeam@gmail.com,
        p.zabel@pengutronix.de
Subject: Re: [PATCH] media: imx7.rst: Fix the references to the CSI
 multiplexer
Message-ID: <20190725074123.2864b148@coco.lan>
In-Reply-To: <20190629121623.18069-1-festevam@gmail.com>
References: <20190629121623.18069-1-festevam@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 29 Jun 2019 09:16:23 -0300
Fabio Estevam <festevam@gmail.com> escreveu:

> In imx7s.dtsi the node name for the CSI multiplexer is "csi-mux", not
> "csi_mux", so fix all the references in the document.
> 
> This fixes the following error when the instructions are followed:
> 
> # media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi_mux':1[1]"
> Unable to parse link: Invalid argument (22)
> 
> While at it, provide the "media-ctl -p" output from 5.2 kernel
> version, so that users can see a more updated output.
> 
> Fixes: fa88fbdafb4a ("media: imx7.rst: add documentation for i.MX7 media driver")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  Documentation/media/v4l-drivers/imx7.rst | 127 +++++++++++------------
>  1 file changed, 63 insertions(+), 64 deletions(-)
> 
> diff --git a/Documentation/media/v4l-drivers/imx7.rst b/Documentation/media/v4l-drivers/imx7.rst
> index fe411f65c01c..ab9e17d111bf 100644
> --- a/Documentation/media/v4l-drivers/imx7.rst
> +++ b/Documentation/media/v4l-drivers/imx7.rst
> @@ -41,7 +41,7 @@ data from MIPI CSI-2 camera sensor. It has one source pad, corresponding to the
>  virtual channel 0. This module is compliant to previous version of Samsung
>  D-phy, and supports two D-PHY Rx Data lanes.
>  
> -csi_mux
> +csi-mux
>  -------
>  
>  This is the video multiplexer. It has two sink pads to select from either camera
> @@ -56,7 +56,7 @@ can interface directly with Parallel and MIPI CSI-2 buses. It has 256 x 64 FIFO
>  to store received image pixel data and embedded DMA controllers to transfer data
>  from the FIFO through AHB bus.
>  
> -This entity has one sink pad that receives from the csi_mux entity and a single
> +This entity has one sink pad that receives from the csi-mux entity and a single
>  source pad that routes video frames directly to memory buffers. This pad is
>  routed to a capture device node.
>  
> @@ -81,14 +81,14 @@ an output of 800x600, and BGGR 10 bit bayer format:
>  
>     # Setup links
>     media-ctl -l "'ov2680 1-0036':0 -> 'imx7-mipi-csis.0':0[1]"
> -   media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi_mux':1[1]"
> -   media-ctl -l "'csi_mux':2 -> 'csi':0[1]"
> +   media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi-mux':1[1]"
> +   media-ctl -l "'csi-mux':2 -> 'csi':0[1]"
>     media-ctl -l "'csi':1 -> 'csi capture':0[1]"
>  
>     # Configure pads for pipeline
>     media-ctl -V "'ov2680 1-0036':0 [fmt:SBGGR10_1X10/800x600 field:none]"
> -   media-ctl -V "'csi_mux':1 [fmt:SBGGR10_1X10/800x600 field:none]"
> -   media-ctl -V "'csi_mux':2 [fmt:SBGGR10_1X10/800x600 field:none]"
> +   media-ctl -V "'csi-mux':1 [fmt:SBGGR10_1X10/800x600 field:none]"
> +   media-ctl -V "'csi-mux':2 [fmt:SBGGR10_1X10/800x600 field:none]"
>     media-ctl -V "'imx7-mipi-csis.0':0 [fmt:SBGGR10_1X10/800x600 field:none]"
>     media-ctl -V "'csi':0 [fmt:SBGGR10_1X10/800x600 field:none]"
>  
> @@ -97,64 +97,63 @@ the resolutions supported by the sensor.
>  
>  .. code-block:: none
>  
> -    root@imx7s-warp:~# media-ctl -p
> -    Media controller API version 4.17.0
> -
> -    Media device information
> -    ------------------------
> -    driver          imx-media
> -    model           imx-media
> -    serial
> -    bus info
> -    hw revision     0x0
> -    driver version  4.17.0
> -
> -    Device topology
> -    - entity 1: csi (2 pads, 2 links)
> -		type V4L2 subdev subtype Unknown flags 0
> -		device node name /dev/v4l-subdev0
> -	    pad0: Sink
> -		    [fmt:SBGGR10_1X10/800x600 field:none]
> -		    <- "csi_mux":2 [ENABLED]
> -	    pad1: Source
> -		    [fmt:SBGGR10_1X10/800x600 field:none]
> -		    -> "csi capture":0 [ENABLED]  
> -
> -    - entity 4: csi capture (1 pad, 1 link)
> -		type Node subtype V4L flags 0
> -		device node name /dev/video0
> -	    pad0: Sink
> -		    <- "csi":1 [ENABLED]
> -
> -    - entity 10: csi_mux (3 pads, 2 links)
> -		type V4L2 subdev subtype Unknown flags 0
> -		device node name /dev/v4l-subdev1
> -	    pad0: Sink
> -		    [fmt:unknown/0x0]
> -	    pad1: Sink
> -		    [fmt:unknown/800x600 field:none]
> -		    <- "imx7-mipi-csis.0":1 [ENABLED]
> -	    pad2: Source
> -		    [fmt:unknown/800x600 field:none]
> -		    -> "csi":0 [ENABLED]  
> -
> -    - entity 14: imx7-mipi-csis.0 (2 pads, 2 links)
> -		type V4L2 subdev subtype Unknown flags 0
> -		device node name /dev/v4l-subdev2
> -	    pad0: Sink
> -		    [fmt:SBGGR10_1X10/800x600 field:none]
> -		    <- "ov2680 1-0036":0 [ENABLED]
> -	    pad1: Source
> -		    [fmt:SBGGR10_1X10/800x600 field:none]
> -		    -> "csi_mux":1 [ENABLED]  
> -
> -    - entity 17: ov2680 1-0036 (1 pad, 1 link)
> -		type V4L2 subdev subtype Sensor flags 0
> -		device node name /dev/v4l-subdev3
> -	    pad0: Source
> -		    [fmt:SBGGR10_1X10/800x600 field:none]
> -		    -> "imx7-mipi-csis.0":0 [ENABLED]  
> -
> +# media-ctl -p
> +Media controller API version 5.2.0
> +
> +Media device information
> +------------------------
> +driver          imx7-csi
> +model           imx-media
> +serial
> +bus info
> +hw revision     0x0
> +driver version  5.2.0
> +
> +Device topology
> +- entity 1: csi (2 pads, 2 links)
> +            type V4L2 subdev subtype Unknown flags 0
> +            device node name /dev/v4l-subdev0
> +        pad0: Sink
> +                [fmt:SBGGR10_1X10/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
> +                <- "csi-mux":2 [ENABLED]
> +        pad1: Source
> +                [fmt:SBGGR10_1X10/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
> +                -> "csi capture":0 [ENABLED]
> +
> +- entity 4: csi capture (1 pad, 1 link)
> +            type Node subtype V4L flags 0
> +            device node name /dev/video0
> +        pad0: Sink
> +                <- "csi":1 [ENABLED]
> +
> +- entity 10: csi-mux (3 pads, 2 links)
> +             type V4L2 subdev subtype Unknown flags 0
> +             device node name /dev/v4l-subdev1
> +        pad0: Sink
> +                [fmt:Y8_1X8/1x1 field:none]
> +        pad1: Sink
> +                [fmt:SBGGR10_1X10/800x600 field:none]
> +                <- "imx7-mipi-csis.0":1 [ENABLED]
> +        pad2: Source
> +                [fmt:SBGGR10_1X10/800x600 field:none]
> +                -> "csi":0 [ENABLED]
> +
> +- entity 14: imx7-mipi-csis.0 (2 pads, 2 links)
> +             type V4L2 subdev subtype Unknown flags 0
> +             device node name /dev/v4l-subdev2
> +        pad0: Sink
> +                [fmt:SBGGR10_1X10/800x600 field:none]
> +                <- "ov2680 1-0036":0 [ENABLED]
> +        pad1: Source
> +                [fmt:SBGGR10_1X10/800x600 field:none]
> +                -> "csi-mux":1 [ENABLED]
> +
> +- entity 17: ov2680 1-0036 (1 pad, 1 link)
> +             type V4L2 subdev subtype Sensor flags 0
> +             device node name /dev/v4l-subdev3
> +        pad0: Source
> +                [fmt:SBGGR10_1X10/800x600@1/30 field:none colorspace:srgb]
> +                -> "imx7-mipi-csis.0":0 [ENABLED]

Did you check the "make htmldocs" output after this change?

This code-block is broken, as it starts from column 1. 

Please add a tab (or at least 2 spaces) before each line, in order
to make Sphinx process this code block.

Thanks,
Mauro
