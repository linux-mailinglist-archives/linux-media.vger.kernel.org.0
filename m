Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1AF3AFF9F
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 10:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhFVIxp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 04:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhFVIxZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 04:53:25 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2379BC061574
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 01:50:55 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i94so22642404wri.4
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 01:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FVIgMYEZIVCQLgjq7ilE6PTca9fWpk9zrimTp1ic3/M=;
        b=BUtYFcUABufy7SJmbnqQORUiMXH84xrquTD3Ft9pTGQWWpcWW27aE4x9U7R9iwZbTm
         UpkQdifXHoqxSeoCvxfaBW8aBbartBrRRvr0rufBqFa9eoYkmdHAqPlR5UbEo+nTDEtc
         mEmNGAXUYr2+hXEnK7yf0HGWQAyRv6KPmrUCsoWPhMMm62OA2/3hnN7yIMA1D4Oq1WX+
         9NoMj3oK4vXcVfmuhYIu3d9lsDxPYTxkwoXgzveMJeFo82WYXOkbmdDDStBMaezxeD+3
         5aMn23v8avmAYYW2MNWVZpe7w5uFdlews9v3vZcQzOcp+IfTG1s+e84UDMMhAmjI9x/i
         VqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FVIgMYEZIVCQLgjq7ilE6PTca9fWpk9zrimTp1ic3/M=;
        b=N7EBq3siPYQ26mIT/pAamXkegjO0luZcbZsi0R02J5cOm/WQLbCSe/YjBC7Kf1+jSq
         KLUdSG+Ob6QU0zyPV94URqhmjPHDjbs6IccwTLH6Vk5PJ0DUNnHNKdKraxv3ab22B3Lg
         plViDzr5CRif0XmKAe/Xc0d7G20Yonm0UsmVNIBwJhPqJUaQ9TadiK1CMbpFZm0F4crN
         Eaf8WJX8SpsyDajsNGTMiTTK+L4ZoSCIrF8f+BznuWZZvci+htVMJWXTCLNfbMD9Jzcx
         M0oWEZNCr1i86RPpxb21Z6b19Xb8a8JM4rTMeVrNm7CJhFXYYrYiPwvJBdHMfKlhZARJ
         DdHw==
X-Gm-Message-State: AOAM533GYN7LDND8hK0srtvOXeRfSFohI1DWV1DA4ip2X1ML+DFoYgoT
        9vNg8bL/ach8AnllsXCkuf8tcsHem5d6DPo7HSPqKw==
X-Google-Smtp-Source: ABdhPJwGJE6UH6Sp3HuoGXNLVbOCbFVon83hdX4y6T+ELTim05btRNlR/DdlO/w4lPz/sxnVQr/OBBTjrr3d63bKr30=
X-Received: by 2002:a05:6000:18ab:: with SMTP id b11mr3425227wri.42.1624351853750;
 Tue, 22 Jun 2021 01:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <b791d5874c83663505cbd4f74907ac38d00bb727.1612206534.git.mchehab+huawei@kernel.org>
 <YNDY4iesZGF+7Cr0@pendragon.ideasonboard.com> <20210622102948.47b86fbe@coco.lan>
In-Reply-To: <20210622102948.47b86fbe@coco.lan>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Jun 2021 09:50:37 +0100
Message-ID: <CAPY8ntAkb_57Nk_8UR-d_uR+juPigLKWwCAxoFzuCSKwETYpQg@mail.gmail.com>
Subject: Re: [PATCH] media: uvc: limit max bandwidth for HDMI capture
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro

On Tue, 22 Jun 2021 at 09:29, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Mon, 21 Jun 2021 21:22:26 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
>
> > Hi Mauro,
> >
> > Thank you for the patch.
>
> Thanks for reviewing it!
>
> >
> > On Mon, Feb 01, 2021 at 08:08:59PM +0100, Mauro Carvalho Chehab wrote:
> > > This device:
> > >         534d:2109 MacroSilicon
> > >
> > > Announces that it supports several frame intervals for
> > > their resolutions for MJPEG compression:
> > >
> > >         VideoStreaming Interface Descriptor:
> > >         bLength                            46
> > >         bDescriptorType                    36
> > >         bDescriptorSubtype                  7 (FRAME_MJPEG)
> > >         bFrameIndex                         1
> > >         bmCapabilities                   0x00
> > >           Still image unsupported
> > >         wWidth                           1920
> > >         wHeight                          1080
> > >         dwMinBitRate                   768000
> > >         dwMaxBitRate                196608000
> > >         dwMaxVideoFrameBufferSize     4147200
> > >         dwDefaultFrameInterval         166666
> > >         bFrameIntervalType                  5
> > >         dwFrameInterval( 0)            166666
> > >         dwFrameInterval( 1)            333333
> > >         dwFrameInterval( 2)            400000
> > >         dwFrameInterval( 3)            500000
> > >         dwFrameInterval( 4)           1000000
> > >
> > > However, the highest frame interval (166666), which means 60 fps
> > > is not supported. For such resolution, the maximum interval
> > > is, instead 333333 (30 fps).
> >
> > What happens if you try to select it ?
>
> Basically, URBs get lost: they cause apps like qv4l2 to crash
> sometimes, with:
>
>         v4l-convert: libjpeg error: Corrupt JPEG data: premature end of data segment
>
> The image keeps blinking, and part of the image is replaced by
> white noise.
>
> Clearly, it tries to send more data than the maximum available bandwidth
> on this chipset.

What platform are you running this on?
I've previously encountered a USB3 camera module where the datastream
was VERY bursty. The memcpy of the data from URB to V4L2 buffer took
long enough that sometimes the module didn't have an URB to fill at
the appropriate moment, and it dropped data. I seem to recall
increasing UVC_URBS from the default of 5 to 10 to handle the peak
data rate without loss, but it may have been higher still. This was on
a ~1.5GHz Atom processor, so not lacking in performance.

I wonder if the same is true in your case. If it's MJPEG compressed
then the peak rate may again be high. Just a thought.

  Dave

> Sent a v2 addressing the issues you pointed.
>
>
> Thanks,
> Mauro
