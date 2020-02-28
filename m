Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8084617439F
	for <lists+linux-media@lfdr.de>; Sat, 29 Feb 2020 00:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgB1X7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 18:59:41 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46784 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgB1X7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 18:59:41 -0500
Received: by mail-pg1-f196.google.com with SMTP id y30so2289384pga.13
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2020 15:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=BWQo8eOBOcxwlZJJZPOuQT/Yj1834Yvntxo+q/ZNkeM=;
        b=vF1Y1Fk3RdsQO7NrbpZxQYJGii8INehzT4cn+Q7SfrFUQdgFJKlLt9LOOT/jd7iA/6
         TOxj4rK4ZgKdSXpTcg8PIOxJmOdTWc388vJFwIw665CvaMXCUyQ3vl32pYKoHu3Bt/XD
         D8t5mNzI76l8n2mtZ0DU6IF2ivxGtcycqlj4H6FZfDS6woILnf87m9l839zFx6tNw58q
         i6wSq16/t5f8txnIUbElVKNYPrWJQAynkL1FieRc6idIvlXj/OPJqxqbq42lw+sJk3wX
         DhivBNw/SkGqW8CzyY3e6wIm8zUrDER2Yq8SMPfm/QduOWOH7whNa1k2YHl1bvoJFUNz
         2HXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BWQo8eOBOcxwlZJJZPOuQT/Yj1834Yvntxo+q/ZNkeM=;
        b=O3AiW/V+4ENzFgU0SVrsIH/Ws1PXJRizdTvdBhVMly3Vh1lkiVbShGSz/GNqMw9NQN
         DWOIclz0Ze+iw9iAZkyxNOzKMN/O1KuMO+jynVxJXTOry7iyp4smF5BxBvNbTCp0KMMa
         DcSsqTn9oT+sQxoNARfRELLwmCGLrElL8DkwozIN76RNz3xwWzwXqFmKwPrnTUJdq9+j
         tN/4ghFG+b3IRpnMy1kb+2Ap1mS+YxdtOfWxmWnJnqrqYfP0tSKeZ7A6TCuBP7/SH5PR
         A0GEt9A2XRY3CyINSbs6ugXXTmCUIRgn5rlXDR9tAMFW9ktokmupWvnitPHA6mn6bmhE
         zZzQ==
X-Gm-Message-State: APjAAAXYVW3lD1NJyqbrZlBr8SuhB0yBCS2AV5wC9FM+djqLZHTtM14Y
        DNIMZUpBmc7lOe/2Njtc+InstkWUpNg=
X-Google-Smtp-Source: APXvYqwGWmO3aTqAyyJWA6Tvia+BQzESplH+vJiXjTMOnHdxQ5v3fP1beKyQCVGMRQ7L6p3SQOvLLg==
X-Received: by 2002:a63:408:: with SMTP id 8mr5025874pge.285.1582934379953;
        Fri, 28 Feb 2020 15:59:39 -0800 (PST)
Received: from [172.30.88.172] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id r9sm12493760pfl.136.2020.02.28.15.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 15:59:39 -0800 (PST)
Subject: Re: imx-media colorimetry
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <CAJ+vNU3DWQX5ud7yreVG3E-Ky6M_NE5nbrwjAJ0x-1xxz4A92A@mail.gmail.com>
 <b3130417-b33c-5bde-347a-4034366c0c99@gmail.com>
 <CAJ+vNU1ShENGcyG_46AUUAE6swm9GTW9Hp4=1vnXs-vb76_LBA@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <1b4504d0-8a25-d627-0c79-fbdf7b879a3a@gmail.com>
Date:   Fri, 28 Feb 2020 15:59:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU1ShENGcyG_46AUUAE6swm9GTW9Hp4=1vnXs-vb76_LBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/28/20 3:47 PM, Tim Harvey wrote:
> On Fri, Feb 28, 2020 at 3:10 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>> Hi Tim,
>>
>> On 2/28/20 10:32 AM, Tim Harvey wrote:
>>> Greetings,
>>>
>>> I'm running into a colorimetry issue when trying to h264 encode video
>>> from adv7180 on an imx6q. I'm using the following setup on a Gateworks
>>> GW5404 which last worked on a 4.20 kernel with a bunch of backports.
>>>
>>> setup script:
>>> # imx6q-gw54xx adv7180 IPU2_CSI1 MODE3:sensor->mux->csi->vdic->ic_prp->ic_prpvf
>>> # imx6q-gw54xx IPU2_CSI1 adv7180 UYVY8_2X8240i@29.9Hz  YUV
>>> MODE3:sensor->mux->csi->vdic->ic_prp->ic_prpvf
>>> # reset all links
>>> media-ctl --reset
>>> # setup links
>>> media-ctl -l "'adv7180 2-0020':0 -> 'ipu2_csi1_mux':1[1]"
>>> media-ctl -l "'ipu2_csi1_mux':2 -> 'ipu2_csi1':0[1]"
>>> media-ctl -l "'ipu2_csi1':1 -> 'ipu2_vdic':0[1]"
>>> media-ctl -l "'ipu2_vdic':2 -> 'ipu2_ic_prp':0[1]"
>>> media-ctl -l "'ipu2_ic_prp':2 -> 'ipu2_ic_prpvf':0[1]"
>>> media-ctl -l "'ipu2_ic_prpvf':1 -> 'ipu2_ic_prpvf capture':0[1]"
>>> # configure pads
>>> media-ctl --set-v4l2 "'adv7180 2-0020':0 [fmt:UYVY2X8/720x240 field:alternate]"
>>> media-ctl --set-v4l2 "'ipu2_csi1_mux':2 [fmt:UYVY2X8/720x240]"
>>> media-ctl --set-v4l2 "'ipu2_csi1':0 [fmt:UYVY8_2X8/720x240@1001/30000
>>> field:alternate colorspace:rec709 ycbcr:709]"
>>> media-ctl --set-v4l2 "'ipu2_csi1':1 [fmt:AYUV32/720x480]"
>>> media-ctl --set-v4l2 "'ipu2_vdic':2 [fmt:AYUV32/720x480 field:none]"
>>> media-ctl --set-v4l2 "'ipu2_ic_prp':2 [fmt:AYUV32/720x480 field:none]"
>>> media-ctl --set-v4l2 "'ipu2_ic_prpvf':1 [fmt:AYUV32/720x480]"
>>>
>>> device details:
>>> ~# media-ctl -e "ipu2_ic_prpvf capture"
>>> /dev/video6
>>>
>>> ~# for i in $(ls -d /sys/class/video4linux/video*); do echo $i:$(cat
>>> $i/name); done
>>> /sys/class/video4linux/video0:ipu1_csi0 capture
>>> /sys/class/video4linux/video1:ipu1_ic_prpenc capture
>>> /sys/class/video4linux/video10:coda-decoder
>>> /sys/class/video4linux/video2:ipu1_ic_prpvf capture
>>> /sys/class/video4linux/video3:ipu1_csi1 capture
>>> /sys/class/video4linux/video4:ipu2_csi0 capture
>>> /sys/class/video4linux/video5:ipu2_ic_prpenc capture
>>> /sys/class/video4linux/video6:ipu2_ic_prpvf capture
>>> /sys/class/video4linux/video7:ipu2_csi1 capture
>>> /sys/class/video4linux/video8:ipu_ic_pp csc/scaler
>>> /sys/class/video4linux/video9:coda-encoder
>>>
>>> gstreamer:
>>> ~# gst-launch-1.0 --version
>>> gst-launch-1.0 version 1.16.2
>>> GStreamer 1.16.2
>>> Unknown package origin
>>> ~# gst-inspect-1.0 | grep -e "v4l2.*convert*"
>>> video4linux2:  v4l2convert: V4L2 Video Converter
>>>
>>> # gst-launch-1.0 v4l2src device=/dev/video6 ! v4l2convert
>>> output-io-mode=dmabuf-import ! v4l2h264enc
>>> output-io-mode=dmabuf-import ! fakesink
>>> Setting pipeline to PAUSED ...
>>> Pipeline is live and does not need PREROLL ...
>>> Setting pipeline to PLAYING ...
>>> New clock: GstSystemClock
>>> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
>>> '/dev/video6' does not support 2:0:0:0 colorimetry
>>> Additional debuginfo:imx_media_try_colorimetry
>>> ../sys/v4l2/gstv4l2object.c(3845): gst_v4l2_object_set_format_full ():
>>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
>>> Device wants 2:4:5:1 colorimetry
>> This is my fault. The CSI cannot convert quantization or do any Y'CbCr
>> <-> RGB encodingfrom sink to source, only the PRPVF subdevice can do
>> that with the help of the Image Converter routines (PRPVF is correctly
>> allowing user to convert quantization and select encoding at its source
>> pad). So the CSI must propagate all colorimetry params from sink to source.
>>
>> Can you try the following:
>>
>> diff --git a/drivers/staging/media/imx/imx-media-csi.c
>> b/drivers/staging/media/imx/imx-media-csi.c
>> index b60ed4f22f6d..ac15b1e78f18 100644
>> --- a/drivers/staging/media/imx/imx-media-csi.c
>> +++ b/drivers/staging/media/imx/imx-media-csi.c
>> @@ -1459,6 +1459,8 @@ static void csi_try_fmt(struct csi_priv *priv,
>>                   /* propagate colorimetry from sink */
>>                   sdformat->format.colorspace = infmt->colorspace;
>>                   sdformat->format.xfer_func = infmt->xfer_func;
>> +               sdformat->format.quantization = infmt->quantization;
>> +               sdformat->format.ycbcr_enc = infmt->ycbcr_enc;
>>
>>                   break;
>>           case CSI_SINK_PAD:
>>
>>
>> And make sure to specify quantization and encoding at PRPVF source pad:
>>
>> media-ctl --set-v4l2 "'ipu2_ic_prpvf':1 [fmt:AYUV32/720x480 ycbcr:709]"
>>
>>
> Steve,
>
> That seems to fix it.
>
> Interestingly if I include v4l2convert gstreamer crashes:
> # gst-launch-1.0 v4l2src device=/dev/video6 ! v4l2convert !
> v4l2h264enc ! fakesink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> ERROR: from element /GstPipeline:pipeline0/v4l2convert:v4l2convert0:
> Device '/dev/video11' does not support bt601 colorimetry
> Additional debug info:
> ../sys/v4l2/gstv4l2object.c(3845): gst_v4l2_object_set_format_full ():
> /GstPipeline:pipeline0/v4l2convert:v4l2convert0:
> Device wants bt709 colorimetry
> Execution ended after 0:00:00.006826334
> Setting pipeline to PAUSED ...
> Setting pipeline to READY ...
> Caught SIGSEGV
> exec gdb failed: No such file or directory
> Spinning.  Please run 'gdb gst-launch-1.0 499' to continue debugging,
> Ctrl-C to quit, or Ctrl-\ to dump core.
>
> But if I use 'gst-launch-1.0 v4l2src device=/dev/video6 ! v4l2h264enc
> ! fakesink'  I'm good... perhaps that's a gstreamer issue.

I noticed that too, I got the same "'/dev/video11' does not support 
bt601 colorimetry" and "Device wants bt709 colorimetry" message and 
subsequent sigsegv, if I include v4l2video11convert in the pipeline. 
Which is odd, the capture device is indeed delivering bt709 to /dev/video11.

Steve

