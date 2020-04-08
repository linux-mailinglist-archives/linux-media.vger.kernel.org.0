Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C45D61A299B
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 21:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgDHTtA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 15:49:00 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39829 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgDHTtA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 15:49:00 -0400
Received: by mail-pf1-f193.google.com with SMTP id k15so2910048pfh.6
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 12:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=oqMMS4QXVH3pQKwD9CKyH8n+HIhZq8dY40MisS4gRZo=;
        b=F59PhFg5Eq4MPNQ36sLmhrUGNOPHb5548O5VRFwR8wTayP5KjGPehdyzhBySJFuqj2
         zYcqiCp3btGR/nyDlDjszoYth+RrkySPlq60Y/L68gdX54e61bjIisnFLDMDwwe3oUUc
         HSpTFmffgdnPSCLxZCn9qWh5nwLUTR+9P4wdeu6jZCAlmAGv9eV0HGFJDT6FJ2jKWsQx
         GLZqa+KADtYfej7oXkpHjrW5vYuAEpn3+iux3SITv7A64KAwoPuG5Dl+CUSAIoipLgy5
         9HNKWiNcOtrAMUg7Ulen0KYkpzJKaYPLtcQvKYqgt4xDccHe6K7irDMvAu2X48UKF+Hq
         UcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oqMMS4QXVH3pQKwD9CKyH8n+HIhZq8dY40MisS4gRZo=;
        b=khBFvXzZUMPzYV6nLoMdUS+Gp90Zcr/mIl8AVvcfvlNeZFpGaUMHB6gDUlaOZJKrU7
         jRRsE+2V2zopMMhVWZyRopPWMg1JRlsd1pUycJHAqHKtNUejUzJt0g0mKC3T4p6OU3Ug
         NO9ll45cU8PyV0egWfYDJf2/96016/6htgBL96fB5i+OobzWC4ZSUySEDkpPS0+hqr5x
         1FJyWJF956iGiEqqn/enuS2Mfw5765/qx5G696pOlCTs94hxCbVvSc+i8A+aPCnLWKHN
         K525NfndhgZmxb8GiP8pvvhrFQGnRZS6WTS7aOdVKzo4TXQldxmUWgz5HXKuu2wxGKDR
         fnbw==
X-Gm-Message-State: AGi0PuYpMd7p4nbc4tF4tG2JtQSZgPYbiyIJWg8hvuah5XX4exdgT7X6
        ki5WGM+0zZpKGOxJ/KJunpdMi5B1DR4=
X-Google-Smtp-Source: APiQypLtFE9lwtuERTy3iJ0avyL7j8hEUVQiZz1J5cuYnJFcdE2jirfh9+nYCj3rwyjHi+be6YAQlw==
X-Received: by 2002:a63:d40a:: with SMTP id a10mr8140545pgh.53.1586375338897;
        Wed, 08 Apr 2020 12:48:58 -0700 (PDT)
Received: from [192.168.1.104] (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id i16sm17321659pfq.165.2020.04.08.12.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 12:48:58 -0700 (PDT)
Subject: Re: [PATCH 1/4] media: imx.rst: Fix the MIPI CSI-2 virtual channel
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
References: <20200408123215.2531-1-festevam@gmail.com>
 <c069af02-af3c-9527-eed4-839681c73ce6@gmail.com>
 <CAOMZO5BN6igxVGRnOnftv=PGZWi=2Qb2Th0fhBon93Fk-zWj+w@mail.gmail.com>
 <a23d2559-5498-75bb-0bce-3bc11bb6b5ae@gmail.com>
 <CAOMZO5BoD4K9Z7GCZHtrWDkYre3aFNd6YdDkUfKB1xVwdjaNzg@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <68b1f7d3-c285-3470-5cd7-0182d10c3c5f@gmail.com>
Date:   Wed, 8 Apr 2020 12:48:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAOMZO5BoD4K9Z7GCZHtrWDkYre3aFNd6YdDkUfKB1xVwdjaNzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/8/20 12:28 PM, Fabio Estevam wrote:
> Hi Steve,
>
> On Wed, Apr 8, 2020 at 4:16 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
>> You have to set a format at the capture interface as the last step
>> before streaming can start:
>>
>> # v4l2-ctl -d /dev/video1 --set-fmt-video=pixelformat=RGB3
> Thanks. After running this line the stream can start via --stream-mmap:
>
> # v4l2-ctl --stream-mmap -d /dev/video1
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.03 fps
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.03 fps
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.03 fps
>
> but it fails with Gstreamer:
>
> # gst-launch-1.0 -v v4l2src device=/dev/video1 ! kmssink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> /GstPipeline:pipeline0/GstKMSSink:kmssink0: display-width = 1024
> /GstPipeline:pipeline0/GstKMSSink:kmssink0: display-height = 768
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Internal data stream error.
> Additional debug info:
> ../libs/gst/base/gstbasesrc.c(3072): gst_base_src_loop ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> streaming stopped, reason not-negotiated (-4)
> ERROR: pipeline doesn't want to preroll.
> Setting pipeline to PAUSED ...
> Setting pipeline to READY ...
> Setting pipeline to NULL ...
> Freeing pipeline ...
>
> Should I change the Gstreamer pipeline?

It works for me, I'm running gstreamer version:

arm:~/scripts % gst-launch-1.0 --version
gst-launch-1.0 version 1.14.5
GStreamer 1.14.5
https://launchpad.net/distros/ubuntu/+source/gstreamer1.0

Also, I'm streaming to an HDMI monitor at 1920x1080 (passing 
connector-id=54 to kmssink).

I can't tell from your gst output whether you are having an issue with 
pixelformats or frame dimensions, but anyway here is my gst pipeline:

gst-launch-1.0 v4l2src device=/dev/video1 ! kmssink connector-id=54 
name=imx-drm sync=0 can-scale=false

It might also be the can-scale property, you might need to provide 
can-scale=false to tell kmssink that imx-drm cannot scale 800x600 to 
something else.

While streaming, I checked what pixelformat the pipeline finally settled on:

arm:~/scripts % v4l2-ctl -d1 -V
Format Video Capture:
     Width/Height      : 800/600
     Pixel Format      : 'XR24'
     Field             : None
     Bytes per Line    : 3200
     Size Image        : 1920000
     Colorspace        : sRGB
     Transfer Function : sRGB
     YCbCr/HSV Encoding: ITU-R 601
     Quantization      : Full Range
     Flags             :

Steve


