Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA7DE1A274A
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 18:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbgDHQfq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 12:35:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41087 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728473AbgDHQfq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 12:35:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id b8so792220pfp.8
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 09:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8jHgRbcAjyNIcS+2FwkJKkO4ojHjiViScdjx4Ndamx8=;
        b=vXDgR31k/00PPnvtRlRZK84VQahrEXz/bP5tqcEIFPu826Rx+WTmj+BPFVoJGPjkQo
         JE0w+3c7LKioUqqEnmIZ892cfl5aTShkfU/cTMJ74ADfhckcM2JPWFtQDMASbh6cxSSe
         +PsAfyQwRX//vvNnfhXzDwilTyLNYf9tilAF4LUOh8o8yxCWHpGaS32Z1frKl/TMdr1D
         xLmWdDIghNqVwxyU8B3jkHVaKnPycQ3nA77kEhhO83CI3HRYOzOh0P5pvoc88Drxxzkr
         yOloggxNkT1Ajhup9IDAaAJ979nHoTUn8/QAdv9HXWczNEEVmKMx1rXb6PcBpPrkpfH9
         WQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8jHgRbcAjyNIcS+2FwkJKkO4ojHjiViScdjx4Ndamx8=;
        b=TwOLWcRmt4p/ayIRizxkXPcV1/ocmlYMQ3vbxkQ7OIw1bZxey0mRI+wG/GKRNOcufl
         UBm0kjFj6QCDgezHZyYdJA27iSzKfi6mqC4DjNasHmjGY1wf3e0e6LwinwvY/S5h+BRl
         Uu6GgEaMCOGgl78BTAfKcIevsgiIqrG3NaFOHiF5CKojQzvSs/GLdau8nS918BioWl5C
         9LBcEJta0d2iIrr/NWf6rNOVA5X16SSytSDIaCsmW5uNAiuT5PJ52JI6W6Pdk4z5RVog
         ExMklILNAWSbI4gyw34Kq5mI/M9Bm75uQIgt74kPbfAUTtwqTetll9ivhmcMbPaj8qLT
         4OrA==
X-Gm-Message-State: AGi0PubDMWKMirKrAx9xj+qv/SiQPudzboNdoCkxZVKLmhPAHgYR7VZt
        mSpSBgUYk3MIIdbobFx4nSt3w9qHa+M=
X-Google-Smtp-Source: APiQypJGq4dNxWF27tCaP2dQcnEFAaoLwDAyGWbj2qLbNHsoB9baejh8yPnndkyL6CuuN/abct77rg==
X-Received: by 2002:aa7:96c1:: with SMTP id h1mr8701260pfq.212.1586363744388;
        Wed, 08 Apr 2020 09:35:44 -0700 (PDT)
Received: from [172.30.89.104] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id nh14sm47232pjb.17.2020.04.08.09.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 09:35:43 -0700 (PDT)
Subject: Re: [PATCH 1/4] media: imx.rst: Fix the MIPI CSI-2 virtual channel
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     p.zabel@pengutronix.de, linux-media@vger.kernel.org
References: <20200408123215.2531-1-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <c069af02-af3c-9527-eed4-839681c73ce6@gmail.com>
Date:   Wed, 8 Apr 2020 09:35:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200408123215.2531-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio, thanks for the patch.

On 4/8/20 5:32 AM, Fabio Estevam wrote:
> The current instructions for imx6q-sabresd do not lead to functional
> capture on OV5640 MIPI CSI-2.
>
> The reason for this, as explained by Steve Longerbeam, is that OV5640 by
> default transmits on virtual channel 0, not channel 1 as is given in the
> instructions.
>
> Adapt the instructions to use virtual channel 0 so that a working
> camera setup can be achieved on imx6q-sabresd.
>
> Suggested-by: Steve Longerbeam <slongerbeam@gmail.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Hi Steve,
>
> I don't have access to a imx6q sabrelite with camera, but I think
> it needs fixing as well.
>
>   Documentation/media/v4l-drivers/imx.rst | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 1246573c1019..7c3afd32e456 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -645,25 +645,26 @@ The OV5640 module connects to MIPI connector J5 (sorry I don't have the
>   compatible module part number or URL).
>   
>   The following example configures a direct conversion pipeline to capture
> -from the OV5640, transmitting on MIPI CSI-2 virtual channel 1. $sensorfmt
> -can be any format supported by the OV5640. $sensordim is the frame
> -dimension part of $sensorfmt (minus the mbus pixel code). $outputfmt can
> -be any format supported by the ipu1_ic_prpenc entity at its output pad:
> +from the OV5640, transmitting on MIPI CSI-2 virtual channel 0:

Since this is an Image Converter pipeline, it would be nice to 
demonstrate scaling and color conversion in this example. How about 
changing the format at IC output to be ARGB8888_1X32/800x600. So change 
the explanation of the pipeline above, and:

>   
>   .. code-block:: none
>   
>      # Setup links
>      media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> -   media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> -   media-ctl -l "'ipu1_csi1':1 -> 'ipu1_ic_prp':0[1]"
> +   media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
> +   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
> +   media-ctl -l "'ipu1_csi0':1 -> 'ipu1_ic_prp':0[1]"
>      media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
>      media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"
>      # Configure pads
> -   media-ctl -V "'ov5640 1-003c':0 [fmt:$sensorfmt field:none]"
> -   media-ctl -V "'imx6-mipi-csi2':2 [fmt:$sensorfmt field:none]"
> -   media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/$sensordim field:none]"
> -   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/$sensordim field:none]"
> -   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:$outputfmt field:none]"
> +   media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
> +   media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
> +   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/640x480]"
> +   media-ctl -V "'ipu1_csi0':0 [fmt:UYVY2X8/640x480]"

don't need this line (I pulled this from a script that was testing 
crop/compose on sink pad ipu1_csi0:0, but since we're not doing that 
here, you can remove the format setup line for ipu1_csi0:0).

> +   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/640x480]"
> +   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/640x480]"
> +   media-ctl -V "'ipu1_ic_prpenc':0 [fmt:AYUV32/640x480]"

don't need this line.

> +   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:AYUV32/640x480]"

change to:

media-ctl -V "'ipu1_ic_prpenc':1 [fmt:ARGB8888_1X32/800x600]"


>   
>   Streaming can then begin on "ipu1_ic_prpenc capture" node. The v4l2-ctl
>   tool can be used to select any supported YUV or RGB pixelformat on the

"...The v4l2-ctl tool can be used to select any supported RGB pixelformat..."


Steve

