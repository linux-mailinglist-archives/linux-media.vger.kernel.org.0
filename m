Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1F13F9E85
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 20:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhH0SIu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 14:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhH0SIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 14:08:50 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00DAC061757
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 11:08:00 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t15so5483166wrg.7
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=1yhNd9/9NyWZq8d6yHzeBEDq6L4k0k4KPBj27gnvAko=;
        b=XjjfO/dDKlfJBKZQ5tdQuDaz1D/j47f7T6az87iaZ8XhE6mvt5/ANK1n92RJ63i6Wg
         aF2ejJrF+s49Q9xpc8dXkusWMrcJlbnqplE67YnejOg7jsoUlVJfdtuvVueNluDiWTZ2
         nToAmYz7KryM6q1tR/ggKbGCPKcwpntxHNU2En1/sYlfmKlZHQRMuL/5SOykaCXsuRJ/
         zJkOHS4/Yd947MCJvMU9N1QGKQOGnYpj+XAgiTrkK8vHF/Ga4vwi63cdzMGSaBQrPQGM
         VG3psldpFQZ8v27DGROXSfQ9J+49cgPEPnOhH5C3O0n28O6xCZ2LSEwnYnF0djqNPFAI
         dQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=1yhNd9/9NyWZq8d6yHzeBEDq6L4k0k4KPBj27gnvAko=;
        b=oQXq5Og4Qz/X2gjri+8EVNLaxXxn7suWN770v07qHJsTBMlIzOsArfRwgv7A4x2wQM
         MTGZiQ4ryfZ2uUlHQWAAAiHt7Ty92W13ovkHGJxu/xrSGX86Pt0xm6b2KEmp95FurqF6
         pxC3UGpbiYw8dvR8QpvSHbZ5wftYghfSpHZEj2zWgtEckP2IW1k3TjS6HTYfdYOGdo6E
         7mC5HBmE5KK9wJq8Erctha+Gly8OGJu7EUYs9wLJvy81obKf/y6zzekfr9F6nkiAlQYC
         yVzuW20HjRFYq/rt+5xuDk7M/LEgIfml+HVL/fL0vYC+67GrO0tiXpkcB+1PA9SKEnIj
         KvHA==
X-Gm-Message-State: AOAM531riUl6H9ugq3+yFBaE5OvtUdIR7kaVytD8QWwbdKZlj2bvjh2j
        ZXEpmdYEbecAGdipoPPT5KXSkYGcGEI=
X-Google-Smtp-Source: ABdhPJxfbQHhW1/58pMkJC7mHQDwA9JcjT4Sq0oXAcIlz6LCyM/A2hJ31Bl/ywGeNh3w75cmovwjfQ==
X-Received: by 2002:a5d:690b:: with SMTP id t11mr11687522wru.182.1630087678664;
        Fri, 27 Aug 2021 11:07:58 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id r16sm2559268wrg.71.2021.08.27.11.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 11:07:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 27 Aug 2021 19:07:57 +0100
Message-Id: <CDUHUSW8IBR3.14C3XLWUHI9U0@arch-thunder>
Cc:     <mchehab+huawei@kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH 1/2] media: imx7.rst: Provide an example for imx6ull-evk
 capture
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Fabio Estevam" <festevam@denx.de>, <hverkuil-cisco@xs4all.nl>
References: <20210826183819.105804-1-festevam@denx.de>
In-Reply-To: <20210826183819.105804-1-festevam@denx.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oi Fabio,
On Thu Aug 26, 2021 at 7:38 PM WEST, Fabio Estevam wrote:

> imx6ull-evk has a parallel OV5640 sensor.
>
> Provide an example for imx6ull-evk capture to improve the document.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Glad it worked for you and thanks for documenting this here.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui

> ---
>  Documentation/admin-guide/media/imx7.rst | 60 ++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/Documentation/admin-guide/media/imx7.rst b/Documentation/adm=
in-guide/media/imx7.rst
> index 1e442c97da47..4785ae8ac978 100644
> --- a/Documentation/admin-guide/media/imx7.rst
> +++ b/Documentation/admin-guide/media/imx7.rst
> @@ -155,6 +155,66 @@ the resolutions supported by the sensor.
>  	                [fmt:SBGGR10_1X10/800x600@1/30 field:none colorspace:sr=
gb]
>  	                -> "imx7-mipi-csis.0":0 [ENABLED]
> =20
> +i.MX6ULL-EVK with OV5640
> +------------------------
> +
> +On this platform a parallel OV5640 sensor is connected to the CSI port.
> +The following example configures a video capture pipeline with an output
> +of 640x480 and UYVY8_2X8 format:
> +
> +.. code-block:: none
> +
> +   # Setup links
> +   media-ctl -l "'ov5640 1-003c':0 -> 'csi':0[1]"
> +   media-ctl -l "'csi':1 -> 'csi capture':0[1]"
> +
> +   # Configure pads for pipeline
> +   media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_2X8/640x480 field:none]=
"
> +
> +After this streaming can start:
> +
> +.. code-block:: none
> +
> +   gst-launch-1.0 -v v4l2src device=3D/dev/video1 ! video/x-raw,format=
=3DUYVY,width=3D640,height=3D480 ! v4l2convert ! fbdevsink
> +
> +.. code-block:: none
> +
> +	# media-ctl -p
> +	Media controller API version 5.14.0
> +
> +	Media device information
> +	------------------------
> +	driver          imx7-csi
> +	model           imx-media
> +	serial
> +	bus info
> +	hw revision     0x0
> +	driver version  5.14.0
> +
> +	Device topology
> +	- entity 1: csi (2 pads, 2 links)
> +	            type V4L2 subdev subtype Unknown flags 0
> +	            device node name /dev/v4l-subdev0
> +	        pad0: Sink
> +	                [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb xfer:=
srgb ycbcr:601 quantization:full-range]
> +	                <- "ov5640 1-003c":0 [ENABLED,IMMUTABLE]
> +	        pad1: Source
> +	                [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb xfer:=
srgb ycbcr:601 quantization:full-range]
> +	                -> "csi capture":0 [ENABLED,IMMUTABLE]
> +
> +	- entity 4: csi capture (1 pad, 1 link)
> +	            type Node subtype V4L flags 0
> +	            device node name /dev/video1
> +	        pad0: Sink
> +	                <- "csi":1 [ENABLED,IMMUTABLE]
> +
> +	- entity 10: ov5640 1-003c (1 pad, 1 link)
> +	             type V4L2 subdev subtype Sensor flags 0
> +	             device node name /dev/v4l-subdev1
> +	        pad0: Source
> +	                [fmt:UYVY8_2X8/640x480@1/30 field:none colorspace:srgb =
xfer:srgb ycbcr:601 quantization:full-range]
> +	                -> "csi":0 [ENABLED,IMMUTABLE]
> +
>  References
>  ----------
> =20
> --=20
> 2.25.1



