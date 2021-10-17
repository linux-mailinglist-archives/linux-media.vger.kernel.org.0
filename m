Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0005430C67
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 23:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344686AbhJQVuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 17:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235532AbhJQVuy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 17:50:54 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B8EC06161C
        for <linux-media@vger.kernel.org>; Sun, 17 Oct 2021 14:48:44 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y30so45159799edi.0
        for <linux-media@vger.kernel.org>; Sun, 17 Oct 2021 14:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5MLods2cZm4Sv88ukRDNKhzjgS5s2jLF9qGyIzb8ilM=;
        b=OddTH53KLCQejZHv/Lcq9Y3FLXN7SdcPx8W97r2GmWKnPM5mghNtDze9C9SFJQtN4j
         chpJdljukFBSqaTxTIiAOyIW6PW86EXuuQlLDbqGPpPYUhx/iM/MutBXo8Lrj+65kHSp
         ubeNZahOq9a33X59vqI9F2EnLbl2YqUB/vrLX5e1l/cbpNYMSZeBx8r6ZZE7qDC+dhmS
         Ov+ZhHMNPeVvZcL4IrJXt9N33hc7PKyHWYCYemeR9/6pI/n7oZ0UF1Ym72hUVZmEfiWJ
         9BkBJ8wlih1Q+HwfJ5FDmOmE0QZkhSiKMgMbNPt6CJucw9M5HkFyG9fZL50iczRpbnkx
         c3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5MLods2cZm4Sv88ukRDNKhzjgS5s2jLF9qGyIzb8ilM=;
        b=JAiSo7E3LSUSy0/JQn80QB96VZ1R9kKQRTHW2H1TtdjmFo47RKZ8/7URUH2iB+bdyd
         2196dwYY8v0LEUQRLxaktHz/YF40aStpazqx5xwYZlssYxLz6rcmzGP6oIHklFMlGb5X
         rL90O0RoT+dqcd7Zf1zdK0qhO1byfF64VvNRdnOjJLeQkWLWBliaLHqGVid+wDn5vGTc
         11QXhbXvF4redTFYKZMuTNwL49Iy8L2zUDkfsdSyPLPSTvirllROlU6ywhTb7xm2a5Cu
         MghSNOKBB5ldrxfJs7wBFXP6dp5UV9FmbLMouEzFJmXEqABdEkX+zh9jfBqlVemlfPLi
         Vt+g==
X-Gm-Message-State: AOAM532nwZWSRNyEMaEEtC+qkzUpXvOj+TYEk2uW+GlA2gQ6AzK9ogXn
        q9wGr2C16wKToHh+npnJMF0=
X-Google-Smtp-Source: ABdhPJytDJpcHBZhCUQuTdaozT4E4epmkQwdMHxfkXcytpXQFPCOU4MxgmoOaMxfTLKK3SirjS+NtA==
X-Received: by 2002:a17:906:f2d0:: with SMTP id gz16mr24929857ejb.102.1634507323165;
        Sun, 17 Oct 2021 14:48:43 -0700 (PDT)
Received: from toninux ([91.86.65.165])
        by smtp.gmail.com with ESMTPSA id g23sm8641800edt.1.2021.10.17.14.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 14:48:42 -0700 (PDT)
Date:   Sun, 17 Oct 2021 23:47:24 +0200
From:   Debucquoy Anthony <d.tonitch@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [Update] Grabster AV 350 no audio (now works with tvtime)
Message-ID: <YWyZ7HT5BZQLXvCu@toninux>
References: <YVXA2vZtsdzJD5Vs@toninux>
 <20211001091909.16f24ed9@coco.lan>
 <YWsNWs0JutJNHAeC@toninux>
 <20211017015431.3ccee22b@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017015431.3ccee22b@sal.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 17, 2021 at 01:54:31AM +0100, Mauro Carvalho Chehab wrote:
> Em Sat, 16 Oct 2021 19:35:22 +0200
> Debucquoy Anthony <d.tonitch@gmail.com> escreveu:
> 
> Don't top post. It makes really hard for people to follow the discussions.
> 
> This time, I'll re-order the discussion for it to make sense.
> 
> > On Fri, Oct 01, 2021 at 09:19:09AM +0200, Mauro Carvalho Chehab wrote:
> > > Hi Anthony,
> > > 
> > > Em Thu, 30 Sep 2021 15:51:22 +0200
> > > Debucquoy Anthony <d.tonitch@gmail.com> escreveu:
> > >   
> > > > Hello,
> > > > 
> > > > I have currently have a (Grabster AV 350)
> > > > [https://www.terratec.de/details.php?artnr=10599&lang=en]
> > > > (and 300 that work even less but I will do another thread for it I think) 
> > > > 
> > > > I can easily get video output out of it with /dev/video0 but the problem
> > > > is that I can't get audio by any way  
> > > 
> > > ...
> > >   
> > > > [ 7275.368159 ] em28xx 1-8:1.0: Identified as Terratec AV350 (card=68)
> > > > [ 7275.368163 ] em28xx 1-8:1.0: analog set to isoc mode.
> > > > [ 7275.368192 ] em28xx 1-8:1.0: Registering V4L2 extension
> > > > [ 7275.497387 ] tvp5150 9-005c: tvp5150 (4.0) chip found @ 0xb8 (1-8:1.0)
> > > > [ 7275.497396 ] tvp5150 9-005c: tvp5150am1 detected.
> > > > [ 7278.429769 ] em28xx 1-8:1.0: Config register raw data: 0x50
> > > > [ 7278.470775 ] em28xx 1-8:1.0: AC97 vendor ID = 0x83847666
> > > > [ 7278.490776 ] em28xx 1-8:1.0: AC97 features = 0x6a90
> > > > [ 7278.490782 ] em28xx 1-8:1.0: Sigmatel audio processor detected (stac
> > > > 9766)  
> > > 
> > > The em28xx devices use an external chip for audio, using AC97.
> > > 
> > > As AC97 is an industry standard, it is possible for board vendors
> > > to replace it with different chips. They do that with time, selecting
> > > a different chip when they need/want.
> > > 
> > > The boards entry at the em28xx has configurations for the device that
> > > was used at the time the code was introduced, but this may not be
> > > the case anymore for a newer device.
> > > 
> > > Anyway, the AC97 chips have several different entries. From its
> > > datasheet:
> > > 
> > > 	https://www.digchip.com/datasheets/parts/datasheet/649/STAC9766-pdf.php
> > > 
> > > It sees that it has the following input lines:
> > > 
> > > 	pc beep
> > > 	phone
> > > 	aux
> > > 	video
> > > 	cd
> > > 	mic
> > > 	line in
> > > 
> > > They also have a "Master" volume that the driver sets to be in 100%
> > > (but some apps and pulseaudio might reduce it to 0%, causing the device
> > > to be muted).
> > > 
> > > Anyway, the AC97 Kernel support will expose all lines reported by the
> > > hardware via an ALSA mixer. 
> > > 
> > > The AV 350 entry assumes that the "line in" mixer entry is the one 
> > > containing the audio. So, it will place the volume for such line
> > > in 100%.
> > > 
> > > However, maybe, on your device, some other input was used instead.
> > > 
> > > If this is the case, all you need to do is to open a mixer, unmute
> > > the right line and manually increase the volume.
> > > 
> > > -
> > > 
> > > There's a separate issue that might explain why some people
> > > are using a different card: some boards require a command to
> > > enable some pins (called GPIO). Those are used, among other
> > > things, to enable/disable some external chips. In the case of
> > > the original AV 350 that was used to add support for it,
> > > it used some of those GPIOs to enable the AC97 inputs.
> > > If your AV 350 requires a different setting, that will require
> > > to patch the Kernel, but it is more likely that the problem on
> > > your device is just due to a different AC97 volume.
> 
> > Hey, I'm really sorry about Up this thread but I found some things that
> > can help but I'm not experimented enough to understand how to make it
> > work properly!
> > 
> > By looking on the net with the info you gave me in the previous message,
> > some people have request to try to use tvtime or xawtv !
> > 
> > So did I! and with tvtime, it was the first time I eared some song out
> > of my device!
> 
> Ok. It means that there's nothing wrong with the Kernel driver.
> 
> What xawtv and tvtime does is that it starts a thread that does
> something similar to:
> 
> 	$ arecord -D hw:1 -r 48000 -c 2 -f S16_LE | aplay -D hw:0
> 
> E. g. the thread reads audio from the capture card (in the above
> example, hw:1) and sends its output to another device (hw:0, on
> the above example).
> 
> > this is great news but I can't use it to record as I want!
> 
> You need to pass the right alsa device to the video recorder application.
> 
> E. g., using a command line command, it would be something like:
> 
> 	$ mencoder -tv driver=v4l2:device=/dev/video0:norm=pal-b:width=720:height=576:input=0:alsa:adevice=hw.1":amode=1:forceaudio:fps=25 tv:// -o my_output.mpg -oac mp3lame -lameopts cbr:br=224 -ovc lavc -lavcopts dia=-2:vcodec=mpeg4:vbitrate=1500 -noodml
> 
> I didn't test, but maybe some app like obs-studio would equally work,
> provided that you set the audio input device to the one exported by
> the em28xx driver, and that you set the right byte speed (if I'm not mistaken,
> most em28xx devices use 48k, but this depends on the AC97 chipset).
> 
> > By the way, the sound came out of one of my headset that I don't use but
> > is still plug in my pc by usb! this is not the default on pulse neither
> > on alsa (at least to my knowledge)!
> 
> I guess there are parameters on both xawtv/tvtime to setup the audio
> output device, but they offer limited support to control it.
> 
> > Then I tried with xawtv and this is the opposite, it doesn't even bother
> > to launch (rip) ^^
> > 
> > So maybe anyone know what tvtime does differently that make my device
> > work ? 
> > 
> > Again, sorry for the up ? :'(
> > Hopefully you can undestand!
> > 
> > Thanks a lot for your help so far!

Thanks a lot for your precious information!
the problem is still there but I don't think (as u said) that this is a
linux-media issue! I will explain everything to a mail for the alsa
mailing list and try to get help there!

Again, your help is really precious and I really respect your work for
the linux community!

Have a great day!

Debucquoy Anthony

Ps: sorry for the top-post (I assume is the fact that I wrote before the
previous message) I will be more watchful in the future
