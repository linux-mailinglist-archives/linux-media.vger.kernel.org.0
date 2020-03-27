Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B151952A8
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 09:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgC0IMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 04:12:43 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44136 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgC0IMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 04:12:42 -0400
Received: by mail-lf1-f68.google.com with SMTP id j188so7093133lfj.11
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2020 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FbtFVtI3I+MfUeIoqOLXgUV6Epi6pLfQ6Z1/AvbUeLw=;
        b=Ny2qz7EYgHHO4tFqJnpaARRrMhH+ihH/qB+zBHHks6LcwokOJQWVEwQSMLVFoR0IU8
         /XvJMfldzklZrQTa4XhebF8kuGeZG4tQZJfZko1EAucUGp5+FtHqujS6zPZKABGB/5kB
         mAGSEgin4PO78aKmnPYBeWTxZ7L5qj+7/5mnE553yh/t4DIQBoLFSN22uYL5IvyvXiDu
         aDhhH1vAuBj+icjcsnx25VomuMHFM6qhSL63zNLVyC1VYtJ+n3S423sebxV84/izRFLY
         Kd2pSiwAfd1/5CQcyD/LtJQX5G1rlE5u98VX+RbtC5DDIej3c760ainYgdSG2UwnV1PD
         QF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FbtFVtI3I+MfUeIoqOLXgUV6Epi6pLfQ6Z1/AvbUeLw=;
        b=GZRdxlNII6y4UYLl35o/VYTnAKlaApFdx2FLgRD1+6b/FsaUezr3B0g75gbi484XXU
         FHTk/U/jKUnL1WKzVxKTZWdtZwyTMusFDFgYKOe7BkMo/qc8pM0ToEQmhoC1dkFhUJwo
         7CBcWygUOuz7Bi0mc/On3P6OAQzkFknxlqEl8U2yR1VgHH2DLTcOxbWT3fxAXSZ953rn
         g4WCfQUafVUN2azwrpHqYW2oxtX04/Z/AOrOJyNyAoNwnKvHYnirLSonAJr2482YaZZC
         ixIzOTE7HRQWEgcey6odIrpi8iBfkXEG2buuGSNyk0g4fRATVaVe9xiIxpYYeLp6lr6u
         DSXg==
X-Gm-Message-State: AGi0PuZl6HV4IMCLHMn1WwN9bh7FzirNqaC6jSnVOMENeyrvF9YqhDXp
        zjZBsJ9/ufEGXIO1dMcy6HmqIo9+ZNWWqw==
X-Google-Smtp-Source: APiQypLAXaxzljp1q3kiAmL+5Gzm2k8NlecqYY4rOl3PsW4RHxOtaptJlE/SNQK7fPyOFb6Fsd6kNw==
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr5080428lfg.118.1585296759551;
        Fri, 27 Mar 2020 01:12:39 -0700 (PDT)
Received: from [192.168.7.22] ([217.148.211.220])
        by smtp.gmail.com with ESMTPSA id w24sm2389006ljh.57.2020.03.27.01.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 01:12:39 -0700 (PDT)
Subject: Re: IMX219 MIPI Sensor (meda-tree) with vaniila I.MX6Q media drivers
To:     Philipp Zabel <pza@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
References: <30c5947f-a026-66a9-75f2-d2531cc73a1e@gmail.com>
 <CAOMZO5B3NXBEmQdUqKDSTYpf=Y5LLZYz7mJLqRMh8T3+O6WvqA@mail.gmail.com>
 <20200327074523.GA3412@pengutronix.de>
From:   Alex Mihaylov <minimumlaw@gmail.com>
Message-ID: <a565cb1a-0c08-cd58-5e83-683b60055e90@gmail.com>
Date:   Fri, 27 Mar 2020 11:12:38 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327074523.GA3412@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Ok. This time I try to check hardware and not need image processing. I 
uncomment this line in script:

[...]
- entity 47: ipu1_csi1 (3 pads, 4 links)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev5
         pad0: Sink
                 [fmt:SRGGB10_1X10/1920x1080@1/30 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range
                  crop.bounds:(0,0)/1920x1080
                  crop:(0,0)/640x480
                  compose.bounds:(0,0)/640x480
                  compose:(0,0)/640x480]
                 <- "imx6-mipi-csi2":2 [ENABLED]
         pad1: Source
                 [fmt:SRGGB10_1X10/640x480@1/30 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu1_ic_prp":0 []
                 -> "ipu1_vdic":0 []
         pad2: Source
                 [fmt:SRGGB10_1X10/640x480@1/30 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu1_csi1 capture":0 [ENABLED]

- entity 51: ipu1_csi1 capture (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video3
         pad0: Sink
                 <- "ipu1_csi1":2 [ENABLED]
[...]

- entity 121: imx6-mipi-csi2 (5 pads, 5 links)
               type V4L2 subdev subtype Unknown flags 0
               device node name /dev/v4l-subdev12
         pad0: Sink
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 <- "imx219 9-0010":0 [ENABLED]
         pad1: Source
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu1_csi0_mux":0 []
         pad2: Source
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu1_csi1":0 [ENABLED]
         pad3: Source
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu2_csi0":0 []
         pad4: Source
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu2_csi1_mux":0 []

- entity 135: imx219 9-0010 (1 pad, 1 link)
               type V4L2 subdev subtype Sensor flags 0
               device node name /dev/v4l-subdev15
         pad0: Source
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "imx6-mipi-csi2":0 [ENABLED]

[...]
localhost ~ # gst-launch-1.0 v4l2src device=/dev/video3 ! fakesink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Internal 
data stream error.
Additional debug info:
/var/tmp/portage/media-libs/gstreamer-1.14.5/work/gstreamer-1.14.5/libs/gst/base/gstbasesrc.c(3055): 
gst_base_src_loop (): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason not-negotiated (-4)
Execution ended after 0:00:00.000606666
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
Setting pipeline to NULL ...
Freeing pipeline ...
localhost ~ # dmesg -c

Another error, but some result. I think fakesink must got Bayer format 
(as specific /dev/null for v4l2).


>>> # media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]" # /dev/video3
>>> (unused, unprocessed)
>        ^
> The IPUv3 IC hardware does not support processing Bayer formats.
> Those can only be written straight to RAM using this path.
