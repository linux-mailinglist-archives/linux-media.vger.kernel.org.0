Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3DF01A1872
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 01:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgDGXBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 19:01:07 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:39574 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgDGXBH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 19:01:07 -0400
Received: by mail-pg1-f169.google.com with SMTP id g32so2434555pgb.6
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 16:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MByiiGSKTHPIsQfZ52UkypoDZXqWE4PuwvoDCQIyUQ4=;
        b=TDwEXN188CWQI6lSgjOd8RN2NYKLeldHaGna0IvOzSiwaAzk0+ZFwbkvlJgkDU70UQ
         cOx04F0Cu2lIo4umE++wJ7SQsLjsWusAiVxNVFP1TF4HMK8RU+EZftqrzmMwaRiczKQ6
         YtP4OPpLiElnGsilI7+y9Wy392C0YEVs3lr3zqFgWBhrOhv2pPxaKWZF2t9Kix6c8SZR
         Tz9jiev+NyS8IkGYNE7rQolfZeP+CUtIkWcMe4n3S9N9wzdSMNPyIVWel9kbEyQ1+QOQ
         CxO7+Bqlkac035I73vjq4sUvWBmrWgO/CmMkPKAVkfgV6XGgyww0vLJ9HaJeB1B8fH5H
         7fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MByiiGSKTHPIsQfZ52UkypoDZXqWE4PuwvoDCQIyUQ4=;
        b=B4de5DqqaVOLKPhDHq32swtI2gaWMAYUa2d44gRs7AbSdSI2ecGQY4kBPqsOPZnl+K
         Pk7zXqEbcDULgTq5dCeuu7PBTVt4I8C5tlK7h0RcbNqNF1mjLQiRyeQq5wok54xNp8At
         KgomVMIOJMtt8NghAX+wfLCrUqezkK3m+ePTXa6SxR2oqVFvXFAerfNFWV22JHyfUaLS
         ELgG/kWMN6149TjtT9h86dn59R1o47mfXbyD12yMQxVKy7t/0R2k5V8jEIHW/74jNp2f
         JF4dHRQgCvIRgtnFHwArdCdce9WotL7Dt6gG88j+02nWZcEy2tlHNHPNQs7Nb5fYL/hS
         4uLg==
X-Gm-Message-State: AGi0PuYxPlcGeRIl7gZCK7lSLt5jwjTN4h25kXA8OEFDSCke1/zOUhG5
        hv31u8OeMxGJPhNzloQO8dQ8y2JOP1k=
X-Google-Smtp-Source: APiQypLu2WyxfYsf7Ha8KyWz1JC8FQ22821C+ByOd6L9ksNKVWHT/GmtGhB32PM/c5aTwDu/DaMjXQ==
X-Received: by 2002:a63:c212:: with SMTP id b18mr4044705pgd.92.1586300465536;
        Tue, 07 Apr 2020 16:01:05 -0700 (PDT)
Received: from [172.30.89.99] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id d23sm14949305pfq.210.2020.04.07.16.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 16:01:04 -0700 (PDT)
Subject: Re: [RFC] media: imx.rst: Fix the links/pads configuration for
 imx6qsabresd
To:     Fabio Estevam <festevam@gmail.com>
Cc:     p.zabel@pengutronix.de, linux-media@vger.kernel.org
References: <20200407180534.2871-1-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <4f50f3ae-de37-0f0d-c54a-5e74b4e2a4d8@gmail.com>
Date:   Tue, 7 Apr 2020 16:01:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200407180534.2871-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

I do believe the problem you're having is that the OV5640 by default 
transmits on virtual channel 0, not channel 1 as is given in the 
instructions in imx.rst.

But I do agree the instructions are now misleading because of the OV5640 
defaults, and probably should be changed for the virtual channel 0 pipeline.

Can you try the virtual channel 0 pipeline:

     media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
     media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
     media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
     media-ctl -l "'ipu1_csi0':1 -> 'ipu1_ic_prp':0[1]"
     media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
     media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"

     media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
     media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
     media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/640x480]"
     media-ctl -V "'ipu1_csi0':0 [fmt:UYVY2X8/640x480]"
     media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/640x480]"
     media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/640x480]"
     media-ctl -V "'ipu1_ic_prpenc':0 [fmt:AYUV32/640x480]"
     media-ctl -V "'ipu1_ic_prpenc':1 [fmt:AYUV32/640x480]"

     vdev=`media-ctl -e "ipu1_ic_prpenc capture"`

     v4l2-ctl -d $vdev --set-fmt-video=width=640,height=480


You can also try changing the ov5640 module parameter virtual_channel to 
channel 1:

     echo "options ov5640 virtual_channel=1" > /etc/modprobe.d/ov5640.conf

then reboot and try the instructions again.


On 4/7/20 11:05 AM, Fabio Estevam wrote:
> The current instructions do not lead to functional capture on
> a i.MX6Q sabresd board.
>
> Fix the instructions so that users can get the OV5640 camera to
> work by default.
>
> Tested by two methods:
>
> 1. Using v4l2-ctl:
>
> # v4l2-ctl --stream-mmap -d /dev/video0
>
> 2. Using a Gstreamer pipeline that captures from the camera and direct
> the image to the display:
>
> # gst-launch-1.0 v4l2src ! kmssink
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Hi Steve,
>
> Were the instructions written based on a i.MX6DL sabresd?

No the instructions are for the i.MX6Q. I have a patch pending that 
clarifies that.

Steve


>
> I don't have access to a i.MX6DL sabresd board to confirm if they
> are still working, but I noticed that these instructions do not work on
> a i.MX6Q sabresd board, so that's why I modified it and now the capture
> works fine here.
>
> Please advise.
>
> Thanks
>
>   Documentation/media/v4l-drivers/imx.rst | 24 ++++++++++--------------
>   1 file changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 1246573c1019..0588060ead27 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -645,27 +645,23 @@ The OV5640 module connects to MIPI connector J5 (sorry I don't have the
>   compatible module part number or URL).
>   
>   The following example configures a direct conversion pipeline to capture
> -from the OV5640, transmitting on MIPI CSI-2 virtual channel 1. $sensorfmt
> -can be any format supported by the OV5640. $sensordim is the frame
> -dimension part of $sensorfmt (minus the mbus pixel code). $outputfmt can
> -be any format supported by the ipu1_ic_prpenc entity at its output pad:
> +from the OV5640, transmitting on MIPI CSI-2 virtual channel 1:
>   
>   .. code-block:: none
>   
>      # Setup links
>      media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> -   media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> -   media-ctl -l "'ipu1_csi1':1 -> 'ipu1_ic_prp':0[1]"
> -   media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
> -   media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"
> +   media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':[1]"
> +   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':[1]"
> +   media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
> +
>      # Configure pads
> -   media-ctl -V "'ov5640 1-003c':0 [fmt:$sensorfmt field:none]"
> -   media-ctl -V "'imx6-mipi-csi2':2 [fmt:$sensorfmt field:none]"
> -   media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/$sensordim field:none]"
> -   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/$sensordim field:none]"
> -   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:$outputfmt field:none]"
> +   media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480 field:none]"
> +   media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY2X8/640x480 field:none]"
> +   media-ctl -V "'ipu1_csi0_mux':0[fmt:UYVY2X8/640x480]"
> +   media-ctl -V "'ipu1_csi0':0[fmt:UYVY2X8/640x480]"
>   
> -Streaming can then begin on "ipu1_ic_prpenc capture" node. The v4l2-ctl
> +Streaming can then begin on "ipu1_csi0 capture" node. The v4l2-ctl
>   tool can be used to select any supported YUV or RGB pixelformat on the
>   capture device node.
>   

