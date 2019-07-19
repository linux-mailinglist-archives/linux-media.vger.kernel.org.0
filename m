Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 669F66E87D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 18:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730712AbfGSQND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jul 2019 12:13:03 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52873 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728971AbfGSQND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jul 2019 12:13:03 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so29328929wms.2
        for <linux-media@vger.kernel.org>; Fri, 19 Jul 2019 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T59YGfwO/ksJCE9UA/szHMl12NVq9nXdkEGnxPe9TR0=;
        b=Qpqm80gEo9b4bklxG/GKcQFUs4/FbhpFoU+W87mz291AKDFIGXU2YjE+qy+q5xUf79
         VegQvEvR6Hd70iAKJUetP8jt5eSEGw2BJOQPUrMN/kbIL95JENB1oQz5lTbU4V1EUJBQ
         2fqXzuznZRPgeyueXFQhsq+J9Q0qWoTd/ib/CcFrCpaim5vgvcLf2TKesEcRKvelItXU
         32Pv9Pr1G5thTeZrU87tDnpJTshJlmLOwv/1Aqv0Ng/X9r1UwffitxewhC8HNcVf12Q1
         3aFBkr5Y4L+UZWnf6jF9LcDoUXpqsofkqkDva1g58ntJNFISCb8kp3eQBJIBrBApYZkM
         79hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T59YGfwO/ksJCE9UA/szHMl12NVq9nXdkEGnxPe9TR0=;
        b=XNzBLLR9E0lrNN18kZVxefjTPlBm5lFTycZ+DA+EDDEfI4ow14eM1pe+ituZKsDjNu
         qdRdA2cus65EJuMNkzjl/nPaYKLyMWf5DL0ggWf2ZHnF+9NhYax6P8NLXo0GBDAiZlXI
         8/vPDjqY6eGGlzT/mlaRmq5ArDeeub5H/JnpJF3aKeRWHTwEuFPOBoPV4sieqHCT2AlA
         irjUXfuW7ZxGAs23f+SAqD5fTsch2ASLxPRbECxCcvVRViYQ1laGB9iCd5D8CX9Jg9FE
         nIcmnLJS+L+aYX/uRHJhhdEJ5Il3tZ53ttkHW7rcZw2+fVwXAzwVYcANW6Br8TnE2sF0
         RIQg==
X-Gm-Message-State: APjAAAWSRWJPY4tTyvnEFbUe0jJlwJULfRZMLrNgMVloFSr2bai0Iflc
        gFLPBgH1SwD7EDUl5WRWZXExisTm
X-Google-Smtp-Source: APXvYqy0FtC+Nz/DFaMqXMoHxCRqV6Ez8J4N9r0R/ECL11gH2bVbPFlP61JfHllyrtJVz4Yf+VuwGQ==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr47175733wmc.175.1563552779596;
        Fri, 19 Jul 2019 09:12:59 -0700 (PDT)
Received: from [192.168.197.233] (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id f204sm41910872wme.18.2019.07.19.09.12.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 09:12:58 -0700 (PDT)
Subject: Re: Issues with ov5640 camera on i.MX6Q
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-media@vger.kernel.org
References: <890e6dbe-2d8e-d674-b17e-2421a38e7acd@kynetics.com>
 <CAMZdPi_MjtAbbM=73o4bjTXxo4kPn-qEjUOVd=g70grD7LLn1g@mail.gmail.com>
From:   Laura Nao <laura.nao@kynetics.com>
Message-ID: <14b1291e-c956-ad7e-d1af-42a02d88e3c4@kynetics.com>
Date:   Fri, 19 Jul 2019 18:12:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi_MjtAbbM=73o4bjTXxo4kPn-qEjUOVd=g70grD7LLn1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Loic,

Thanks for your reply.

On 7/19/19 8:56 AM, Loic Poulain wrote:
> Hi Laura,
> 
> 
> On Thu, 18 Jul 2019 at 15:03, Laura Nao <laura.nao@kynetics.com 
> <mailto:laura.nao@kynetics.com>> wrote:
> 
>     Hello Loic,
> 
>     I'm having some issues with RAW8 mode on the OV5640 camera and I'd like
>     to kindly ask for your advice, as I saw that you added support for RAW
>     mode in the mainline kernel driver.
> 
>     I'm trying to capture some raw images on a i.MX6Q based board. I
>     configured the pipeline as follows:
> 
>     media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
>     media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
>     media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
>     media-ctl -V "'ov5640 1-003c':0 [fmt:SBGGR8_1X8/2592x1944 field:none]"
>     media-ctl -V "'imx6-mipi-csi2':2 [fmt:SBGGR8_1X8/2592x1944 field:none]"
> 
>     I'm capturing the frame using v4l-utils:
> 
>     v4l2-ctl -d /dev/video5 --verbose --set-fmt
>     video=width=2592,height=1944,pixelformat=BA81 --stream-mmap
>     --stream-count=1 --stream-to=bggr_2592x1944.raw
> 
> 
> Did you also try with other resolutions?
> 
> 
>     The images I'm obtaining are completely garbled. I tried both 5.2
>     mainline and 5.1.18 kernels.
> 
> 
> Did you try enabling the sensor test pattern, would be interesting to 
> check if there is some coherency in the raw buffer.
> 

I did some tests with the color bars test pattern enabled at different 
resolutions. The 640x480 frame seems to be the closest to the test 
pattern, even though the image is still not perfectly aligned.
With increasing resolution, the image gets more garbled.

I uploaded some images with different resolutions here:

https://imgur.com/a/2o9WZMs

As reference, I'm using the bayer2rgb tool to convert the raw files to 
rgb (https://github.com/jdthomas/bayer2rgb).


> I definitely need to give a shot to last driver version. Last time I 
> tried I backported the driver to a 4.14 tree:
> https://git.linaro.org/people/loic.poulain/linux.git/log/?h=qcomlt-4.14-ov5640
> And it worked on my side (with dragonboard 410c).
> 
> 
>     I'm able to correctly capture YUV frames in all resolutions with the
>     same driver (with the pipeline configured to go through the
>     ipu1_ic_prpenc node first).
> 
>     Do you have any insight on what might be causing these issues? Is the
>     PLL configuration supposed to be changed when RAW8 format is selected?
> 
> 
> Well, you can have a lower PCLK with RAW format, but it should work anyway.
> 
> Regards,
> Loic

I also quickly tested the raw capture with a 4.14 kernel with your 
patches applied, but the resulting images looks pretty much the same 
(640x480 is the only resolution close to the expected frame).

Best,

Laura
