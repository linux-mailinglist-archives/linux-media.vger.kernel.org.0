Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6A94303F9
	for <lists+linux-media@lfdr.de>; Sat, 16 Oct 2021 19:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244474AbhJPRiw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Oct 2021 13:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244473AbhJPRit (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Oct 2021 13:38:49 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A02C061765
        for <linux-media@vger.kernel.org>; Sat, 16 Oct 2021 10:36:41 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id y12so53249928eda.4
        for <linux-media@vger.kernel.org>; Sat, 16 Oct 2021 10:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aE6/wHAI6tJxSgyBnXV9l5BEpKWTa/oA4a905Qq3Cuk=;
        b=OGhcBHjwfl4KPnl7q/jkWdLCLCq2swIniCnBU7Y/o1Rs7J/8R6oLNFqOHXZA59WgBa
         4YKNgYoRV7qxWHVsXTN0/7xQI5znifQxTXZW1ki0fgLPowJjZnISnpZQ3OWMRlGD6tsi
         BS0TCnMkJPlZLQcD4sMdn1zzja2U5i3ARWU+Wvc6DrkPXV30O4sj1c+KT//xCNFXXbuX
         z00m8URTkCdvHwITb2cooyu4pDP190PYR1Nv2mOJvkpI8sUM6OnyzBt3vQUkZNsvGysw
         1GeDPPJpYECBbvypj0B6Alynin9t1J1SLuJy7mGiZlr5V/6eqa4kx9Fs3EUDPH7FpFf+
         0jSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aE6/wHAI6tJxSgyBnXV9l5BEpKWTa/oA4a905Qq3Cuk=;
        b=MHA6Fbp0ypL1yiO1sAwZLg7sfFV1ae/aZ8p/2XjhgpKexmx+azZyGyjbA8MF/8mKwm
         QMBoIikMEru3tGypwrJjR4BkJ1D+vGgqImM3gxCapUfWnjlguE1C/0FUbk0gERZntyEa
         OOAUWaaEq34AezKX7pJYcaxvKD9qUIjJpfNI5AmJEyxScCoolF7Ivs+Qx7PfHMR+M1aT
         5nt1LcRcgTWPB0H0yfazdVcWKs5IWWsOd9ADYTTFJUgbj5a1+jYWHUZcOrBC0fMzoxzY
         1rCQiHiZODHqWfhtPqRHe/yw6TvcveUc2S5FmW413Mdi7WC0UdLQrNfHQESJ+xATCrTS
         mXLA==
X-Gm-Message-State: AOAM532lcX+LjK5rYIxuzWghh6/a3c43jLcEL5eruIprGW8mj37rpb/6
        rbyfrqUUMzYLDVFk/6qEdgA=
X-Google-Smtp-Source: ABdhPJzyegGPCV4GcVIQTcqSGh5AdDCjBdkZNBcUSdYREtdKE+oWZ0Onyde+BADI+2wlor4sbhGZ4g==
X-Received: by 2002:a17:906:d0d8:: with SMTP id bq24mr16596555ejb.402.1634405799529;
        Sat, 16 Oct 2021 10:36:39 -0700 (PDT)
Received: from toninux ([91.86.65.165])
        by smtp.gmail.com with ESMTPSA id t18sm7584863edd.18.2021.10.16.10.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 10:36:39 -0700 (PDT)
Date:   Sat, 16 Oct 2021 19:35:22 +0200
From:   Debucquoy Anthony <d.tonitch@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [Update] Grabster AV 350 no audio (now works with tvtime)
Message-ID: <YWsNWs0JutJNHAeC@toninux>
References: <YVXA2vZtsdzJD5Vs@toninux>
 <20211001091909.16f24ed9@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001091909.16f24ed9@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey, I'm really sorry about Up this thread but I found some things that
can help but I'm not experimented enough to understand how to make it
work properly!

By looking on the net with the info you gave me in the previous message,
some people have request to try to use tvtime or xawtv !

So did I! and with tvtime, it was the first time I eared some song out
of my device! this is great news but I can't use it to record as I want!
By the way, the sound came out of one of my headset that I don't use but
is still plug in my pc by usb! this is not the default on pulse neither
on alsa (at least to my knowledge)!

Then I tried with xawtv and this is the opposite, it doesn't even bother
to launch (rip) ^^

So maybe anyone know what tvtime does differently that make my device
work ? 

Again, sorry for the up ? :'(
Hopefully you can undestand!

Thanks a lot for your help so far!

On Fri, Oct 01, 2021 at 09:19:09AM +0200, Mauro Carvalho Chehab wrote:
> Hi Anthony,
> 
> Em Thu, 30 Sep 2021 15:51:22 +0200
> Debucquoy Anthony <d.tonitch@gmail.com> escreveu:
> 
> > Hello,
> > 
> > I have currently have a (Grabster AV 350)
> > [https://www.terratec.de/details.php?artnr=10599&lang=en]
> > (and 300 that work even less but I will do another thread for it I think) 
> > 
> > I can easily get video output out of it with /dev/video0 but the problem
> > is that I can't get audio by any way
> 
> ...
> 
> > [ 7275.368159 ] em28xx 1-8:1.0: Identified as Terratec AV350 (card=68)
> > [ 7275.368163 ] em28xx 1-8:1.0: analog set to isoc mode.
> > [ 7275.368192 ] em28xx 1-8:1.0: Registering V4L2 extension
> > [ 7275.497387 ] tvp5150 9-005c: tvp5150 (4.0) chip found @ 0xb8 (1-8:1.0)
> > [ 7275.497396 ] tvp5150 9-005c: tvp5150am1 detected.
> > [ 7278.429769 ] em28xx 1-8:1.0: Config register raw data: 0x50
> > [ 7278.470775 ] em28xx 1-8:1.0: AC97 vendor ID = 0x83847666
> > [ 7278.490776 ] em28xx 1-8:1.0: AC97 features = 0x6a90
> > [ 7278.490782 ] em28xx 1-8:1.0: Sigmatel audio processor detected (stac
> > 9766)
> 
> The em28xx devices use an external chip for audio, using AC97.
> 
> As AC97 is an industry standard, it is possible for board vendors
> to replace it with different chips. They do that with time, selecting
> a different chip when they need/want.
> 
> The boards entry at the em28xx has configurations for the device that
> was used at the time the code was introduced, but this may not be
> the case anymore for a newer device.
> 
> Anyway, the AC97 chips have several different entries. From its
> datasheet:
> 
> 	https://www.digchip.com/datasheets/parts/datasheet/649/STAC9766-pdf.php
> 
> It sees that it has the following input lines:
> 
> 	pc beep
> 	phone
> 	aux
> 	video
> 	cd
> 	mic
> 	line in
> 
> They also have a "Master" volume that the driver sets to be in 100%
> (but some apps and pulseaudio might reduce it to 0%, causing the device
> to be muted).
> 
> Anyway, the AC97 Kernel support will expose all lines reported by the
> hardware via an ALSA mixer. 
> 
> The AV 350 entry assumes that the "line in" mixer entry is the one 
> containing the audio. So, it will place the volume for such line
> in 100%.
> 
> However, maybe, on your device, some other input was used instead.
> 
> If this is the case, all you need to do is to open a mixer, unmute
> the right line and manually increase the volume.
> 
> -
> 
> There's a separate issue that might explain why some people
> are using a different card: some boards require a command to
> enable some pins (called GPIO). Those are used, among other
> things, to enable/disable some external chips. In the case of
> the original AV 350 that was used to add support for it,
> it used some of those GPIOs to enable the AC97 inputs.
> If your AV 350 requires a different setting, that will require
> to patch the Kernel, but it is more likely that the problem on
> your device is just due to a different AC97 volume.
> 
> Thanks,
> Mauro
