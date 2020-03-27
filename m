Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBA6196059
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 22:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbgC0VUW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 17:20:22 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38604 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbgC0VUW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 17:20:22 -0400
Received: by mail-pg1-f195.google.com with SMTP id x7so5184995pgh.5
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2020 14:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=SOYiLhDiq8w8ULU07FyqyDYKEpXbM2MVkzrjFBhsGxQ=;
        b=KxATo8SwKwC98AtUDS2ME+TUxD837R0eEXwC4Qok/lPoB8/V+189jPlKdd9BQHQK4a
         1MTwWEpdn/1ewscBAntVEtAvb3AQamIienWXP5Qkpx4+WiDUb3JGb399Tm8oM3scwS5u
         wnTnhXlM3TRTw+lSvY160HVwDSdT5aBLgFk029momZyQWLr2IouDlf4lswn415H8ogEy
         J6uU+FCjmbv4MCl3r8lMub61RjRiX0MHFdsKfMnd2GMQM28ySO1qfHcqOFsGgNB+5c1E
         tl8GbTknvTzaaDXmWQXSJBGwM2QaamcrpIpey1c4Wdj8ROQHQoPxZhzzKuKfu9faMRfa
         a7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=SOYiLhDiq8w8ULU07FyqyDYKEpXbM2MVkzrjFBhsGxQ=;
        b=ZT23v7H5ymZDv/qI+buJ6hV9Epvi0i3E1WSX2VZfWSHmRC32RSUKEmb8cNdUeOojrt
         r6vWxvaYjHo+29FC5MDzLeMbDhPajl8YrsBtqSWqsqh9j2QHRZf3ydq4A6KOgrt6RAnq
         N4P+NAzs++/KYovEI/agBkeRGJZxe/VhIwweJj5Rl4tn/Ue/fi7aMevd1ZaERUX+iD7W
         HC0r0LX6oaI4cgCM1uUjVHKmz52jgXB/kaH29k1WlPCd1udTbfxc4zV1d1EKKsCNXuQL
         zNOS/NpOc6eKNxzvRVCxNWnl0n3JJ89YG/M95CrHGHJ4c7foJyS30s1vA5MzuM8qoEmk
         eJng==
X-Gm-Message-State: ANhLgQ2XSPtp1zOBMPUKaIzVETxIDsES6onEcOq1m/z8X2w+AyeRtrvN
        3MjIoY88+nMudpz35lBGAGA5tMFR4q4=
X-Google-Smtp-Source: ADFU+vvhN7QF1MFEoouIjt/td3kwiTPMPizlJW8N1rjtOYncM5TSkT5CwxlP9rM0GWTvpDU3AKjslg==
X-Received: by 2002:aa7:9511:: with SMTP id b17mr1204213pfp.243.1585344020612;
        Fri, 27 Mar 2020 14:20:20 -0700 (PDT)
Received: from [172.30.90.112] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id c201sm4855777pfc.73.2020.03.27.14.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 14:20:20 -0700 (PDT)
Subject: Re: IMX219 MIPI Sensor (meda-tree) with vaniila I.MX6Q media drivers
To:     Alex Mihaylov <minimumlaw@gmail.com>,
        Philipp Zabel <pza@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <30c5947f-a026-66a9-75f2-d2531cc73a1e@gmail.com>
 <CAOMZO5B3NXBEmQdUqKDSTYpf=Y5LLZYz7mJLqRMh8T3+O6WvqA@mail.gmail.com>
 <20200327074523.GA3412@pengutronix.de>
 <a565cb1a-0c08-cd58-5e83-683b60055e90@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <17308e3e-3dd8-7c75-f890-398ffca730b9@gmail.com>
Date:   Fri, 27 Mar 2020 14:18:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a565cb1a-0c08-cd58-5e83-683b60055e90@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On 3/27/20 1:12 AM, Alex Mihaylov wrote:
> Hi!
>
> Ok. This time I try to check hardware and not need image processing. I 
> uncomment this line in script:
>
> [...]
> - entity 47: ipu1_csi1 (3 pads, 4 links)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev5
>         pad0: Sink
>                 [fmt:SRGGB10_1X10/1920x1080@1/30 field:none 
> colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range
>                  crop.bounds:(0,0)/1920x1080
>                  crop:(0,0)/640x480
>                  compose.bounds:(0,0)/640x480
>                  compose:(0,0)/640x480]
>                 <- "imx6-mipi-csi2":2 [ENABLED]

This is virtual channel 1 output from the imx6-mipi-csi2 receiver. Make 
sure the imx219 is indeed transmitting on virtual channel 1.

> pad1: Source
>                 [fmt:SRGGB10_1X10/640x480@1/30 field:none 
> colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
>                 -> "ipu1_ic_prp":0 []
>                 -> "ipu1_vdic":0 []
>         pad2: Source
>                 [fmt:SRGGB10_1X10/640x480@1/30 field:none 
> colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
>                 -> "ipu1_csi1 capture":0 [ENABLED]
>
> - entity 51: ipu1_csi1 capture (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video3
>         pad0: Sink
>                 <- "ipu1_csi1":2 [ENABLED]

What is the format on /dev/video3 ? Please provide output from 'v4l2-ctl 
-d3 -V'

> [...]
>
> - entity 121: imx6-mipi-csi2 (5 pads, 5 links)
>               type V4L2 subdev subtype Unknown flags 0
>               device node name /dev/v4l-subdev12
>         pad0: Sink
>                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
> xfer:srgb ycbcr:601 quantization:full-range]
>                 <- "imx219 9-0010":0 [ENABLED]
>         pad1: Source
>                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
> xfer:srgb ycbcr:601 quantization:full-range]
>                 -> "ipu1_csi0_mux":0 []
>         pad2: Source
>                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
> xfer:srgb ycbcr:601 quantization:full-range]
>                 -> "ipu1_csi1":0 [ENABLED]
>         pad3: Source
>                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
> xfer:srgb ycbcr:601 quantization:full-range]
>                 -> "ipu2_csi0":0 []
>         pad4: Source
>                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
> xfer:srgb ycbcr:601 quantization:full-range]
>                 -> "ipu2_csi1_mux":0 []
>
> - entity 135: imx219 9-0010 (1 pad, 1 link)
>               type V4L2 subdev subtype Sensor flags 0
>               device node name /dev/v4l-subdev15
>         pad0: Source
>                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
> xfer:srgb ycbcr:601 quantization:full-range]
>                 -> "imx6-mipi-csi2":0 [ENABLED]
>
> [...]
> localhost ~ # gst-launch-1.0 v4l2src device=/dev/video3 ! fakesink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Setting pipeline to PLAYING ...
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: 
> Internal data stream error.
> Additional debug info:
> /var/tmp/portage/media-libs/gstreamer-1.14.5/work/gstreamer-1.14.5/libs/gst/base/gstbasesrc.c(3055): 
> gst_base_src_loop (): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> streaming stopped, reason not-negotiated (-4)
> Execution ended after 0:00:00.000606666
> Setting pipeline to PAUSED ...
> Setting pipeline to READY ...
> Setting pipeline to NULL ...
> Freeing pipeline ...
> localhost ~ # dmesg -c
>
> Another error, but some result. I think fakesink must got Bayer format 
> (as specific /dev/null for v4l2).

Can you try simply:

localhost ~ # v4l2-ctl -d3 --stream-mmap

and let me know if you receive frames.

Steve

>
>
>>>> # media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]" # 
>>>> /dev/video3
>>>> (unused, unprocessed)
>>        ^
>> The IPUv3 IC hardware does not support processing Bayer formats.
>> Those can only be written straight to RAM using this path.

