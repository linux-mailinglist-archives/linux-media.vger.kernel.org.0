Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8CBB1749B9
	for <lists+linux-media@lfdr.de>; Sat, 29 Feb 2020 23:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbgB2Wcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Feb 2020 17:32:31 -0500
Received: from mail-pg1-f174.google.com ([209.85.215.174]:39093 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgB2Wcb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Feb 2020 17:32:31 -0500
Received: by mail-pg1-f174.google.com with SMTP id s2so2561562pgv.6
        for <linux-media@vger.kernel.org>; Sat, 29 Feb 2020 14:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gf3P/KzH5BaG8JS2/i6CPvsFYrcZOskqTSJl1wPPeSY=;
        b=M1H4xScyr2wXr9WtHh8+5gGd1Yg5UnGoNJ8IWBAz5CM6VoLnbjwXjc5tJvQkYEkOmB
         7f5wKmeUx7XmF+qhG0Wipe8lee44t9Gds3wdH1pGGZyu3oAySjCt5ilvvAX429+Q58o9
         Qo0FmWRt3WoR8DTmrVuGW1/DuzBI7xb+wkhLNJZNsBU3b5j1lxekQgaSECStYWik1akD
         oy/4yMSLssQq7tRu2pG7QMhaHJqHQy/miPHPZdPsNXs571PZm+sdYlB1N+qH8c7W+9Mj
         DFVJvRpen7N5elEVa55Mw4MKdc12YZb/ASfK0sVjxHAfsDy/sOuvAdXCF/gC1lcyHS0V
         gtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gf3P/KzH5BaG8JS2/i6CPvsFYrcZOskqTSJl1wPPeSY=;
        b=JRPgaRfX9KV6jhD/TKlpbmAf1acSAaTB4l/bQdc5mvBTTxWxA23yFR61sNx56O/zHC
         rOpmh0lfyTjG/khuMzBxBW9Z++ZankMpGi9H5NZXzlsuGb/p5NGCL37V8hySHTrnU0w9
         7Edv+++VCIKe1cgEUwCfEguhA3GiIeT/ahY/borckPuCTxM9Mc5BnLVJU8MBPINaR5Rh
         tUeu6j9Tz/q93L8NNBhgqogMW1NAxklbmS8JLeLUvRtJ3yHF70WW+F1Pd0jzhO1WgLQ0
         O2hsHpj5sgE+Nx24f04OCK8IyFslSm6RznkKLLzRb9RIgm6RyB9I7EhkMThmASduFl5u
         ecyw==
X-Gm-Message-State: APjAAAUL1C9dozPXDK9POIYCnMwY4ETXTmQRpRQiO72UuPtWaPiP3MLv
        oaOgVqcd/+l9zg9anKUCx0M=
X-Google-Smtp-Source: APXvYqyMhEDPvgAfiuwxFhnhgQ8zhFwTOGt/oMS3BnJ0CepaUtR6sHKMhYx2mLH1OfKpv4zsEIiEHg==
X-Received: by 2002:a63:b515:: with SMTP id y21mr11706726pge.148.1583015549296;
        Sat, 29 Feb 2020 14:32:29 -0800 (PST)
Received: from [192.168.1.59] (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.gmail.com with ESMTPSA id s123sm11965428pfs.21.2020.02.29.14.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Feb 2020 14:32:28 -0800 (PST)
Subject: Re: imx-media colorimetry
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <CAJ+vNU3DWQX5ud7yreVG3E-Ky6M_NE5nbrwjAJ0x-1xxz4A92A@mail.gmail.com>
 <b3130417-b33c-5bde-347a-4034366c0c99@gmail.com>
 <CAJ+vNU1ShENGcyG_46AUUAE6swm9GTW9Hp4=1vnXs-vb76_LBA@mail.gmail.com>
 <1b4504d0-8a25-d627-0c79-fbdf7b879a3a@gmail.com>
 <07cc276f11305df44e360e75dd40e873bc1e85a0.camel@ndufresne.ca>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <e8603a31-e32d-d746-7e88-1e79c2dcb526@gmail.com>
Date:   Sat, 29 Feb 2020 14:32:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <07cc276f11305df44e360e75dd40e873bc1e85a0.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On 2/29/20 12:56 PM, Nicolas Dufresne wrote:
> Le vendredi 28 février 2020 à 15:59 -0800, Steve Longerbeam a écrit :
>> On 2/28/20 3:47 PM, Tim Harvey wrote:
>>> On Fri, Feb 28, 2020 at 3:10 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>>>> Hi Tim,
>>>>
>>>> On 2/28/20 10:32 AM, Tim Harvey wrote:
>>>>> Greetings,
>>>>>
>>>>> I'm running into a colorimetry issue when trying to h264 encode video
>>>>> from adv7180 on an imx6q. I'm using the following setup on a Gateworks
>>>>> GW5404 which last worked on a 4.20 kernel with a bunch of backports.
>>>>>
>>>>> setup script:
>>>>> # imx6q-gw54xx adv7180 IPU2_CSI1 MODE3:sensor->mux->csi->vdic->ic_prp->ic_prpvf
>>>>> # imx6q-gw54xx IPU2_CSI1 adv7180 UYVY8_2X8240i@29.9Hz  YUV
>>>>> MODE3:sensor->mux->csi->vdic->ic_prp->ic_prpvf
>>>>> # reset all links
>>>>> media-ctl --reset
>>>>> # setup links
>>>>> media-ctl -l "'adv7180 2-0020':0 -> 'ipu2_csi1_mux':1[1]"
>>>>> media-ctl -l "'ipu2_csi1_mux':2 -> 'ipu2_csi1':0[1]"
>>>>> media-ctl -l "'ipu2_csi1':1 -> 'ipu2_vdic':0[1]"
>>>>> media-ctl -l "'ipu2_vdic':2 -> 'ipu2_ic_prp':0[1]"
>>>>> media-ctl -l "'ipu2_ic_prp':2 -> 'ipu2_ic_prpvf':0[1]"
>>>>> media-ctl -l "'ipu2_ic_prpvf':1 -> 'ipu2_ic_prpvf capture':0[1]"
>>>>> # configure pads
>>>>> media-ctl --set-v4l2 "'adv7180 2-0020':0 [fmt:UYVY2X8/720x240 field:alternate]"
>>>>> media-ctl --set-v4l2 "'ipu2_csi1_mux':2 [fmt:UYVY2X8/720x240]"
>>>>> media-ctl --set-v4l2 "'ipu2_csi1':0 [fmt:UYVY8_2X8/720x240@1001/30000
>>>>> field:alternate colorspace:rec709 ycbcr:709]"
>>>>> media-ctl --set-v4l2 "'ipu2_csi1':1 [fmt:AYUV32/720x480]"
>>>>> media-ctl --set-v4l2 "'ipu2_vdic':2 [fmt:AYUV32/720x480 field:none]"
>>>>> media-ctl --set-v4l2 "'ipu2_ic_prp':2 [fmt:AYUV32/720x480 field:none]"
>>>>> media-ctl --set-v4l2 "'ipu2_ic_prpvf':1 [fmt:AYUV32/720x480]"
>>>>>
>>>>> device details:
>>>>> ~# media-ctl -e "ipu2_ic_prpvf capture"
>>>>> /dev/video6
>>>>>
>>>>> ~# for i in $(ls -d /sys/class/video4linux/video*); do echo $i:$(cat
>>>>> $i/name); done
>>>>> /sys/class/video4linux/video0:ipu1_csi0 capture
>>>>> /sys/class/video4linux/video1:ipu1_ic_prpenc capture
>>>>> /sys/class/video4linux/video10:coda-decoder
>>>>> /sys/class/video4linux/video2:ipu1_ic_prpvf capture
>>>>> /sys/class/video4linux/video3:ipu1_csi1 capture
>>>>> /sys/class/video4linux/video4:ipu2_csi0 capture
>>>>> /sys/class/video4linux/video5:ipu2_ic_prpenc capture
>>>>> /sys/class/video4linux/video6:ipu2_ic_prpvf capture
>>>>> /sys/class/video4linux/video7:ipu2_csi1 capture
>>>>> /sys/class/video4linux/video8:ipu_ic_pp csc/scaler
>>>>> /sys/class/video4linux/video9:coda-encoder
>>>>>
>>>>> gstreamer:
>>>>> ~# gst-launch-1.0 --version
>>>>> gst-launch-1.0 version 1.16.2
>>>>> GStreamer 1.16.2
>>>>> Unknown package origin
>>>>> ~# gst-inspect-1.0 | grep -e "v4l2.*convert*"
>>>>> video4linux2:  v4l2convert: V4L2 Video Converter
>>>>>
>>>>> # gst-launch-1.0 v4l2src device=/dev/video6 ! v4l2convert
>>>>> output-io-mode=dmabuf-import ! v4l2h264enc
>>>>> output-io-mode=dmabuf-import ! fakesink
>>>>> Setting pipeline to PAUSED ...
>>>>> Pipeline is live and does not need PREROLL ...
>>>>> Setting pipeline to PLAYING ...
>>>>> New clock: GstSystemClock
>>>>> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
>>>>> '/dev/video6' does not support 2:0:0:0 colorimetry
>>>>> Additional debuginfo:imx_media_try_colorimetry
>>>>> ../sys/v4l2/gstv4l2object.c(3845): gst_v4l2_object_set_format_full ():
>>>>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
>>>>> Device wants 2:4:5:1 colorimetry
>>>> This is my fault. The CSI cannot convert quantization or do any Y'CbCr
>>>> <-> RGB encodingfrom sink to source, only the PRPVF subdevice can do
>>>> that with the help of the Image Converter routines (PRPVF is correctly
>>>> allowing user to convert quantization and select encoding at its source
>>>> pad). So the CSI must propagate all colorimetry params from sink to source.
>>>>
>>>> Can you try the following:
>>>>
>>>> diff --git a/drivers/staging/media/imx/imx-media-csi.c
>>>> b/drivers/staging/media/imx/imx-media-csi.c
>>>> index b60ed4f22f6d..ac15b1e78f18 100644
>>>> --- a/drivers/staging/media/imx/imx-media-csi.c
>>>> +++ b/drivers/staging/media/imx/imx-media-csi.c
>>>> @@ -1459,6 +1459,8 @@ static void csi_try_fmt(struct csi_priv *priv,
>>>>                    /* propagate colorimetry from sink */
>>>>                    sdformat->format.colorspace = infmt->colorspace;
>>>>                    sdformat->format.xfer_func = infmt->xfer_func;
>>>> +               sdformat->format.quantization = infmt->quantization;
>>>> +               sdformat->format.ycbcr_enc = infmt->ycbcr_enc;
>>>>
>>>>                    break;
>>>>            case CSI_SINK_PAD:
>>>>
>>>>
>>>> And make sure to specify quantization and encoding at PRPVF source pad:
>>>>
>>>> media-ctl --set-v4l2 "'ipu2_ic_prpvf':1 [fmt:AYUV32/720x480 ycbcr:709]"
>>>>
>>>>
>>> Steve,
>>>
>>> That seems to fix it.
>>>
>>> Interestingly if I include v4l2convert gstreamer crashes:
>>> # gst-launch-1.0 v4l2src device=/dev/video6 ! v4l2convert !
>>> v4l2h264enc ! fakesink
>>> Setting pipeline to PAUSED ...
>>> Pipeline is live and does not need PREROLL ...
>>> Setting pipeline to PLAYING ...
>>> New clock: GstSystemClock
>>> ERROR: from element /GstPipeline:pipeline0/v4l2convert:v4l2convert0:
>>> Device '/dev/video11' does not support bt601 colorimetry
>>> Additional debug info:
>>> ../sys/v4l2/gstv4l2object.c(3845): gst_v4l2_object_set_format_full ():
>>> /GstPipeline:pipeline0/v4l2convert:v4l2convert0:
>>> Device wants bt709 colorimetry
>>> Execution ended after 0:00:00.006826334
>>> Setting pipeline to PAUSED ...
>>> Setting pipeline to READY ...
>>> Caught SIGSEGV
>>> exec gdb failed: No such file or directory
>>> Spinning.  Please run 'gdb gst-launch-1.0 499' to continue debugging,
>>> Ctrl-C to quit, or Ctrl-\ to dump core.
>>>
>>> But if I use 'gst-launch-1.0 v4l2src device=/dev/video6 ! v4l2h264enc
>>> ! fakesink'  I'm good... perhaps that's a gstreamer issue.
>> I noticed that too, I got the same "'/dev/video11' does not support
>> bt601 colorimetry" and "Device wants bt709 colorimetry" message and
>> subsequent sigsegv, if I include v4l2video11convert in the pipeline.
>> Which is odd, the capture device is indeed delivering bt709 to /dev/video11.
> If you could file an an issue [0] it would be fantastic. I have very
> limited HW access, but I have a SabreLite with some MIPI camera from
> Boundary Device. Make sure full instructions to reproduce (crasher and
> negotiation issue), I'll see what I can do to help. Make sure to
> provide a kernel tree in the form of a branch, or clear patchset to be
> apply on specific release.
>
> Nicolas
>
> [0] https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/issues

I am able to reproduce the same issue on a SabreSD, I don't currently 
have access to a SabreLite but it is a similar pipeline using the ov5640 
MIPI camera. I will post the repro instructions at [0].

Steve

