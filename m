Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38F941EF85
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 16:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354470AbhJAOgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 10:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbhJAOgM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 10:36:12 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6863C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 07:34:27 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id l7so11864224edq.3
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 07:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XTC/CWGTNqyEKjaQY3E+rfTl/vJ0ilB5wCkalSfVThw=;
        b=EgydEBGYnT8s0EginlgritqNAE3mIxscUf0hFxgB0rF9G5BQs2p9WCcIz7hofq6KO4
         E/A1zemEypQXvRL7v6wBv9VRwcXVV6iHB45+stE4HfpgAfhoLsZCMkIxyljqoPUZuSdQ
         DYx3JNKDLuU59b3LnYYhW9rkjDgHNm27oT5/18q9s6jUVFW2TYCeuqCGkTsN1GUlX9tF
         y7TrGFywjvaTTD4/n2coQSLonS7Iakvxqsou/MiI9jni+oEqc7ZrukeGPSxc3y5/niyh
         RxJlJBM39wDfiY7p4NFVI9azscO1Re9mu2Ab9c8tNbmXk1XW1z42kR05FwCmVuBhIRCW
         HttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XTC/CWGTNqyEKjaQY3E+rfTl/vJ0ilB5wCkalSfVThw=;
        b=w4hy+K3pKAR2/Q9UYUar99fgNhP5gEs96vlU161sGX3YMHyCO4Z1XpGu1l3DlXr0d+
         JSXLyJhUiDm2JzFegn4PxRAdX+Ubm/fANv9d/tZCjxQmlgvJ0blfS8l1s/qTLobVRqhH
         8+Cs+dmI5M5ttfryXUk75DHOc8uxDszQWzo9sIt1sVejqaEZnT5U0Ok6SKEu4aR5b0aw
         HXyoLVoFtl6FbEis3XI++s9caNVbRDDnUt+3OEEDTKhwOzJ7T/7L/2XpmTM5Y3fRQMPz
         Ka9LJ90QRMMSx1rBN4OCKoJTtJBE6Y+uvEF5xcpl9R4M4wieM3s2RSeEH3ydIUwHP0/f
         TJ6w==
X-Gm-Message-State: AOAM531NokJYs3SyunfYNfkVbzoNP9hvDjh5R+i4fRZBhx0TPAIl2KPH
        RWzXNrUYUDhyxEMCUv127ZrlJIu5kb5Zig==
X-Google-Smtp-Source: ABdhPJy7HB9e8yboXNE25KnZWKEw/mEdHDHB9n7zNQg2PFssh3Q7vrHSwLrvH+vBXke64XlOmW64+g==
X-Received: by 2002:a50:bec9:: with SMTP id e9mr15035835edk.33.1633098866287;
        Fri, 01 Oct 2021 07:34:26 -0700 (PDT)
Received: from toninux ([91.86.65.165])
        by smtp.gmail.com with ESMTPSA id jt24sm3130975ejb.59.2021.10.01.07.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 07:34:25 -0700 (PDT)
Date:   Fri, 1 Oct 2021 16:33:23 +0200
From:   Debucquoy Anthony <d.tonitch@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: Grabster AV 350 no audio
Message-ID: <YVccM8oPlHWj6hMS@toninux>
References: <YVXA2vZtsdzJD5Vs@toninux>
 <20211001091909.16f24ed9@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001091909.16f24ed9@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks a lot for you quick and really clear response,

I understand a lot more now, but the problem doesn't seems to solve,

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
 
I tried, but to be honest, since I'm using linux, (about 6 years ago)
I have noticed my lack of understanding in 2 things under this OS...

One is the networking and dhcp stuff, and the other is the sound ^^
So I tried to do what you asked as precisely as I could be maybe I do
something wrong :'(

so went to alsamixer and tried to put everything at its maximum and
unmuted everything. I even did this with thing unrelated to be sure!

and I did this under pulsemixer too, but still nothing!

I tried to look a bit on the net to see if something was missing. but I
don't really know what to look for in the mean time!

I saw a lot of peole asking to output command like `aplay -L` and
`amixer`, so here I give them to you if you can notice somethign (I put
them on paste.rs because I think it's way to messy for a mail but if you
want me to paste them in mail next time, there is no problem ^^)

- aplay -L : https://paste.rs/MYb
- amixer : https://paste.rs/PaY

> There's a separate issue that might explain why some people
> are using a different card: some boards require a command to
> enable some pins (called GPIO). Those are used, among other
> things, to enable/disable some external chips. In the case of
> the original AV 350 that was used to add support for it,
> it used some of those GPIOs to enable the AC97 inputs.
> If your AV 350 requires a different setting, that will require
> to patch the Kernel, but it is more likely that the problem on
> your device is just due to a different AC97 volume.

This is really helpful, again Thank you very much for you help !

PS: this device is still in use by my dad from time to time which is
under windows and it actually work really well under Windows (now that I
think about it, I only tried it with MAGIX software)

Anthony.
