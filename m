Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBE41742AD
	for <lists+linux-media@lfdr.de>; Sat, 29 Feb 2020 00:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgB1XKj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 18:10:39 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:34554 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgB1XKj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 18:10:39 -0500
Received: by mail-pj1-f68.google.com with SMTP id f2so4689898pjq.1
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2020 15:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=aiPXhOOQr/6ShJnAchtLNwpFkkQB2lj+wnovxQDTkA4=;
        b=dksdO2TE6O1ZTgB1sO43eA1u3+xgpuxehW+LIvYvBqgD1fOcHyJQPzprEy79gBWaIf
         +QUxYS1XueVSyjQk3DMGrIN1vOL83Vr14UagUG9lMPKBE++a/apELU3l69dlvwT1XhDw
         BZD4oLzjzyGEaebYw7cDE633Z/slaa/qP6famEa1mTnDoROSYgNwxpI2+HXrioadb4Cz
         xTtRmfJ9zBR6B5lLVWluP2P4e/fIiQduPyMSCxnplLWFkm550ZWhLjqu9N9Z8Y6R3nUO
         Psbmj7FjLZxQxRs5Ehtdq4OhNNJI2OqK4bRD8oK9I34ofU8BOlu5mgdlc7DPw2pM38Dq
         OHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aiPXhOOQr/6ShJnAchtLNwpFkkQB2lj+wnovxQDTkA4=;
        b=YcLL1q5h9SwMkoi17cfxwESAkq/SEm3qR5PJnh+yRlt0+mTJnU+UGs9R61QM58Iffg
         w0xRlbBR62dGQTP8chYgAjvplNGIJrw61Y1/lJ8rIBmlDC18bBji2bYhTOIaPdM3H183
         1Plaf9kc7d7No8sv7YQVwdsCAmE/10ScxcqsW9Zy6F0WRdt3W/gmzCr4EiftAPI4K9Bk
         BfCkxAtuq9RcmRll07Em0xB/gm15HRSFU7HLGvzlz1Dwe+Yui7aze23LOoEmoj2+JaHW
         PX1Xkkkc294RoYQx800JASY+AzG6vky0i8ZNyTE3OZIqY+BBn36sEGrpkapzakQmj4v7
         QweA==
X-Gm-Message-State: ANhLgQ1aaBVZ30OaIgzsQkbE0zbRUe5VkZNvcFBME9X8ScF/JLOynvz/
        AFYPimvho8U017eTFbuxG1p5RHuTSHc=
X-Google-Smtp-Source: ADFU+vu48mVr591meM9R4BCeM95pA3EbbPvGGRvz0rTUCK7Tl50CQA9HZPRZkvVQCkQas47yYiGluQ==
X-Received: by 2002:a17:90a:3784:: with SMTP id v4mr2950122pjb.31.1582931437428;
        Fri, 28 Feb 2020 15:10:37 -0800 (PST)
Received: from [172.30.88.172] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id t20sm126109pfl.114.2020.02.28.15.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 15:10:36 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: imx-media colorimetry
To:     Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <CAJ+vNU3DWQX5ud7yreVG3E-Ky6M_NE5nbrwjAJ0x-1xxz4A92A@mail.gmail.com>
Message-ID: <b3130417-b33c-5bde-347a-4034366c0c99@gmail.com>
Date:   Fri, 28 Feb 2020 15:10:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU3DWQX5ud7yreVG3E-Ky6M_NE5nbrwjAJ0x-1xxz4A92A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On 2/28/20 10:32 AM, Tim Harvey wrote:
> Greetings,
>
> I'm running into a colorimetry issue when trying to h264 encode video
> from adv7180 on an imx6q. I'm using the following setup on a Gateworks
> GW5404 which last worked on a 4.20 kernel with a bunch of backports.
>
> setup script:
> # imx6q-gw54xx adv7180 IPU2_CSI1 MODE3:sensor->mux->csi->vdic->ic_prp->ic_prpvf
> # imx6q-gw54xx IPU2_CSI1 adv7180 UYVY8_2X8240i@29.9Hz  YUV
> MODE3:sensor->mux->csi->vdic->ic_prp->ic_prpvf
> # reset all links
> media-ctl --reset
> # setup links
> media-ctl -l "'adv7180 2-0020':0 -> 'ipu2_csi1_mux':1[1]"
> media-ctl -l "'ipu2_csi1_mux':2 -> 'ipu2_csi1':0[1]"
> media-ctl -l "'ipu2_csi1':1 -> 'ipu2_vdic':0[1]"
> media-ctl -l "'ipu2_vdic':2 -> 'ipu2_ic_prp':0[1]"
> media-ctl -l "'ipu2_ic_prp':2 -> 'ipu2_ic_prpvf':0[1]"
> media-ctl -l "'ipu2_ic_prpvf':1 -> 'ipu2_ic_prpvf capture':0[1]"
> # configure pads
> media-ctl --set-v4l2 "'adv7180 2-0020':0 [fmt:UYVY2X8/720x240 field:alternate]"
> media-ctl --set-v4l2 "'ipu2_csi1_mux':2 [fmt:UYVY2X8/720x240]"
> media-ctl --set-v4l2 "'ipu2_csi1':0 [fmt:UYVY8_2X8/720x240@1001/30000
> field:alternate colorspace:rec709 ycbcr:709]"
> media-ctl --set-v4l2 "'ipu2_csi1':1 [fmt:AYUV32/720x480]"
> media-ctl --set-v4l2 "'ipu2_vdic':2 [fmt:AYUV32/720x480 field:none]"
> media-ctl --set-v4l2 "'ipu2_ic_prp':2 [fmt:AYUV32/720x480 field:none]"
> media-ctl --set-v4l2 "'ipu2_ic_prpvf':1 [fmt:AYUV32/720x480]"
>
> device details:
> ~# media-ctl -e "ipu2_ic_prpvf capture"
> /dev/video6
>
> ~# for i in $(ls -d /sys/class/video4linux/video*); do echo $i:$(cat
> $i/name); done
> /sys/class/video4linux/video0:ipu1_csi0 capture
> /sys/class/video4linux/video1:ipu1_ic_prpenc capture
> /sys/class/video4linux/video10:coda-decoder
> /sys/class/video4linux/video2:ipu1_ic_prpvf capture
> /sys/class/video4linux/video3:ipu1_csi1 capture
> /sys/class/video4linux/video4:ipu2_csi0 capture
> /sys/class/video4linux/video5:ipu2_ic_prpenc capture
> /sys/class/video4linux/video6:ipu2_ic_prpvf capture
> /sys/class/video4linux/video7:ipu2_csi1 capture
> /sys/class/video4linux/video8:ipu_ic_pp csc/scaler
> /sys/class/video4linux/video9:coda-encoder
>
> gstreamer:
> ~# gst-launch-1.0 --version
> gst-launch-1.0 version 1.16.2
> GStreamer 1.16.2
> Unknown package origin
> ~# gst-inspect-1.0 | grep -e "v4l2.*convert*"
> video4linux2:  v4l2convert: V4L2 Video Converter
>
> # gst-launch-1.0 v4l2src device=/dev/video6 ! v4l2convert
> output-io-mode=dmabuf-import ! v4l2h264enc
> output-io-mode=dmabuf-import ! fakesink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
> '/dev/video6' does not support 2:0:0:0 colorimetry
> Additional debuginfo:imx_media_try_colorimetry
> ../sys/v4l2/gstv4l2object.c(3845): gst_v4l2_object_set_format_full ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Device wants 2:4:5:1 colorimetry

This is my fault. The CSI cannot convert quantization or do any Y'CbCr 
<-> RGB encodingfrom sink to source, only the PRPVF subdevice can do 
that with the help of the Image Converter routines (PRPVF is correctly 
allowing user to convert quantization and select encoding at its source 
pad). So the CSI must propagate all colorimetry params from sink to source.

Can you try the following:

diff --git a/drivers/staging/media/imx/imx-media-csi.c 
b/drivers/staging/media/imx/imx-media-csi.c
index b60ed4f22f6d..ac15b1e78f18 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1459,6 +1459,8 @@ static void csi_try_fmt(struct csi_priv *priv,
                 /* propagate colorimetry from sink */
                 sdformat->format.colorspace = infmt->colorspace;
                 sdformat->format.xfer_func = infmt->xfer_func;
+               sdformat->format.quantization = infmt->quantization;
+               sdformat->format.ycbcr_enc = infmt->ycbcr_enc;

                 break;
         case CSI_SINK_PAD:


And make sure to specify quantization and encoding at PRPVF source pad:

media-ctl --set-v4l2 "'ipu2_ic_prpvf':1 [fmt:AYUV32/720x480 ycbcr:709]"


Steve

> Execution ended after 0:00:00.009831000
> Setting pipeline to PAUSED ...
> Setting pipeline to READY ...
> Setting pipeline to NULL ...
> Freeing pipeline ...
>
> Any ideas?
>
> Best Regards,
>
> Tim

