Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4811A3834
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 18:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgDIQpI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 12:45:08 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35798 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgDIQpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 12:45:08 -0400
Received: by mail-wm1-f66.google.com with SMTP id r26so455634wmh.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2020 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7FuZSi+qQVAknL9J9OtXO+lmOQPlq5nooewcdWgy8rw=;
        b=MP2WdYc/HwtEok89Aqj3Ioq1QxzUuhCVVSAh1LFm9tXTGOfL2OjiJ91dzf5+T7Wokx
         fwJI4mJH0ksGd+vmf7mUmeGLqTOmBedfA7nnaKlWTLIsFUI7eMGNMRHeRU5lo1oCs7u2
         pDfsgTwI/Yvkv1/RhjdcbUZnLiXNkUDwAg+6S8kq+6paAEL3cF7UIKo5EJtlVf74e0hc
         5lHLZnnfQYtN0uB8OxbBZxJ+ehN1+uSUuEidWRp7gLTVOFbsSL6A0C4Wg1USvKVHD4Xn
         vi4C/IIWZ51mZMacsC7FQDE84kPcf5jzWf/kVyC3pgyGkAXRH3UoMR8bZYH0T/94gMi3
         EEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7FuZSi+qQVAknL9J9OtXO+lmOQPlq5nooewcdWgy8rw=;
        b=htVNyrc17ArAB8b3Y3TMKa9KKSAHiRtNbjGPIVhswDCI648188d6XwogZk/vtR3Lxo
         VOPbMR+JefOuy1yq3dUZ2/bahjLpmjdANTbRV8RygZe4uvCbtzzyqbxqAO5Xw10f6QvQ
         psrJtQUvP3Gfb0XmsO4kPtFBLNxxlR11BKExpyqxxFDhnggLH6uOepxCDxT/Ot0aDco3
         1reOu6RwmKAZzBDijVXg/ZyS1qMJzZTwRFwvit+ZfUZGEpPrJHahgxr/OBD7B3gX3bO/
         DFTMSupdk0IYSa85G2I/kdJuKZEOX21NYl7dPi2YbRB//VM2yPztWN57aSnNTpvlWKmD
         cO3w==
X-Gm-Message-State: AGi0Pub6fDmAaQ8YTZR+ORojOQv0mg3mrVgWBDcPmt1zV/ZuEVa+UtMN
        5FJlFwMIoBmdWf/gJ7ulDQ1ESsz0XuU=
X-Google-Smtp-Source: APiQypIa+xReKiD+rMFSTMp6ync6HeZAGKqLPziG8zn0480inXh+H1I8uqkmLiE3ybsmrCjJNKOuRQ==
X-Received: by 2002:a1c:bd08:: with SMTP id n8mr724077wmf.23.1586450704379;
        Thu, 09 Apr 2020 09:45:04 -0700 (PDT)
Received: from [172.30.90.226] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id k14sm1749794wrp.53.2020.04.09.09.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 09:45:03 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] media: imx.rst: Fix the MIPI CSI-2 virtual channel
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     p.zabel@pengutronix.de, linux-media@vger.kernel.org
References: <20200409162945.3559-1-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <de701447-1fa9-0eb2-c71c-b80aab3a95c4@gmail.com>
Date:   Thu, 9 Apr 2020 09:45:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200409162945.3559-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/9/20 9:29 AM, Fabio Estevam wrote:
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
> Also, since we are using an IC direct conversion pipeline, improve
> the example by demonstrating colorspace and scaling.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Steve Longerbeam<slongerbeam@gmail.com>

> ---
> Changes since v1:
> - Demonstrate colorspace and scaling. (Steve)
>
>   Documentation/media/v4l-drivers/imx.rst | 31 ++++++++++++-------------
>   1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 1246573c1019..b8df91f83f14 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -645,30 +645,29 @@ The OV5640 module connects to MIPI connector J5 (sorry I don't have the
>   compatible module part number or URL).
>   
>   The following example configures a direct conversion pipeline to capture
> -from the OV5640, transmitting on MIPI CSI-2 virtual channel 1. $sensorfmt
> -can be any format supported by the OV5640. $sensordim is the frame
> -dimension part of $sensorfmt (minus the mbus pixel code). $outputfmt can
> -be any format supported by the ipu1_ic_prpenc entity at its output pad:
> +from the OV5640, transmitting on MIPI CSI-2 virtual channel 0. It also
> +shows colorspace conversion and scaling at IC output.
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
> -
> -Streaming can then begin on "ipu1_ic_prpenc capture" node. The v4l2-ctl
> -tool can be used to select any supported YUV or RGB pixelformat on the
> -capture device node.
> -
> +   media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
> +   media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
> +   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/640x480]"
> +   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/640x480]"
> +   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/640x480]"
> +   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:ARGB8888_1X32/800x600]"
> +   # Set a format at the capture interface
> +   v4l2-ctl -d /dev/video1 --set-fmt-video=pixelformat=RGB3
> +
> +Streaming can then begin on "ipu1_ic_prpenc capture" node.
>   
>   Known Issues
>   ------------

