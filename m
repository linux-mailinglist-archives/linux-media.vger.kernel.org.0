Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 138785B7F4
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 11:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbfGAJXx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 05:23:53 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39684 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbfGAJXw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 05:23:52 -0400
Received: by mail-wm1-f65.google.com with SMTP id z23so15060432wma.4
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 02:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=/al2hARGevxvuHWgnh2cKc+wEY7z5V6t7TmLV5f+DQI=;
        b=puy1DTUHJg3edRD+2G5S8XQQXyL4UvpSTqRj1SRx+YPfT+lcyAFRxpZDH0hc9QWBaB
         hYqWdoc3YHu9SofvK6xgFdaqg9LsHTLKH56IVYCjqBUexNFJ1MSYlHebdR1JFtVj7lDH
         xWiH4wC/gKRjw4PetsVn5MNTf5ToaSuSs+J6wUHp0RS+63gzDDbjxo3XJqUII9KKhfBe
         87Zi8hbsbwz6trvI3MVs/q8v53J6IPIxql3WLn0/+vRp3CvJrdc6rLmXXDp6nIIyqisj
         JjjYvOX9f4gr7Fuijwfy6EtOTA9PGXA2d6Jmu0T2IWDp043CKO28K/ubfIJuBUMuXgWM
         ne1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=/al2hARGevxvuHWgnh2cKc+wEY7z5V6t7TmLV5f+DQI=;
        b=AwvpD+btRfoe0fYnyo1LjGLLQz1sjQrNKI73K2CYqTnNDvqKQ3cMbotCN+hbPn9QhO
         t/yB6npsSqVZ01UAgNlNfualHfxct7nr6SMgiQtx9adTSOJvmO/Pueoxr3pCSxrXp7Lu
         UgdGJpMrfUVoRDCEXmNfQ2D7RL4I79ITSEGk3l+InZ5ZkSKAG+/I6E0BjwU1HurVtX05
         g4cSpkFA6qbnVN6w8dOGYTgj89t/OUV0IGLDgb6gRz9G80wIIwOdHNdNAqlc6iqzeaWV
         tw2ESgoeHrqIun8IBQGHXO/76gJOENX/oYfu2OSFwQwXcF0Qpg2OSDDtdL50PVzrjo19
         jeWg==
X-Gm-Message-State: APjAAAUV8l/AWGp1JCr0akXTJYpivPqtf+Pw9uFzaabQyrskZ9QFcmzl
        q561oeGTc8u9swuOpaaQie0=
X-Google-Smtp-Source: APXvYqxA0P3J6IOLN7yRqdV1Hoxfwm2ailiY/NG7uW/7Uf88auZedonbBFEozVIvXJX1qsxpodhKIg==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr16085792wmb.39.1561973029523;
        Mon, 01 Jul 2019 02:23:49 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id o20sm26296074wrh.8.2019.07.01.02.23.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 02:23:48 -0700 (PDT)
References: <20190629121623.18069-1-festevam@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hverkuil@xs4all.nl, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, mchehab@kernel.org
Subject: Re: [PATCH] media: imx7.rst: Fix the references to the CSI multiplexer
In-reply-to: <20190629121623.18069-1-festevam@gmail.com>
Date:   Mon, 01 Jul 2019 10:23:46 +0100
Message-ID: <m3pnmuglb1.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oi Fabio,
On Sat 29 Jun 2019 at 13:16, Fabio Estevam wrote:
> In imx7s.dtsi the node name for the CSI multiplexer is "csi-mux", not
> "csi_mux", so fix all the references in the document.
>
> This fixes the following error when the instructions are followed:
>
> # media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi_mux':1[1]"
> Unable to parse link: Invalid argument (22)

Yeah, it was a last minute rename that did not reflect in the
documentation.

>
> While at it, provide the "media-ctl -p" output from 5.2 kernel
> version, so that users can see a more updated output.

Also thanks for this.

>
> Fixes: fa88fbdafb4a ("media: imx7.rst: add documentation for i.MX7 media driver")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

---
Cheers,
	Rui

>
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
>
>  References
>  ----------

