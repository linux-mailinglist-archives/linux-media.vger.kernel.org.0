Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 749F32231A
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 12:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728637AbfERKUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 May 2019 06:20:11 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:42128 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfERKUL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 May 2019 06:20:11 -0400
Received: by mail-lj1-f172.google.com with SMTP id 188so8367456ljf.9
        for <linux-media@vger.kernel.org>; Sat, 18 May 2019 03:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HMveP3Iktzw6CVf+01XwFfPinS2lGS8gj0qAToSpi4A=;
        b=q/n62sTy3QksyTKWwcLjcCYD5hsFXbUuk6HmLSXkH1c0r+VsBwE2ubb7NQjYb5qn2H
         +LHwU7/n15hvh7Nhq76VPSaSWHG9x+Vzg7lucXTBcURbxW3858kxpQsmaQTX1BmsdJ+r
         4zlz7GxhdxXZQqivdGegDiD/UJGYwTkJIBby2+bHuAV4FuIHYoY30IJC0hPjdFuhry60
         gUQdT1E+IRX1np6Z3Xa4SuWCRkDSqlfwFhDaEwo9x9QD+EMLuIwGx96z6BXIp/S9SUPF
         AAFvhn1wAsM+UNRqjQVpcYmeBfaECehjIQetHzhGRuxsq2PYC1YBD6QU+CuKR6w/7sh3
         Fk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HMveP3Iktzw6CVf+01XwFfPinS2lGS8gj0qAToSpi4A=;
        b=kr2vB9OEEZhKtUlob+8vIuMg7h43Rb42fLiuxOFx7xUGnFmtDWRrhgsJEqkhfK5xFR
         2TxAGVIk+KCY880q6hYowECmcvP5FcKfha6E9LT9DgYzQKqqBG4O9NF5sTTL71/Ey9WO
         KS3GJO7pv3yzJLrpY51yeNTrCDgkXZHM895lvueqJ6oWyLKxxKnkg0OWtgDaCPRnLKQg
         plCcb5pEPb9vcvB1nsPfgl9AD+nIOtMhVPESe16RdGzvsr5RxCW7n2NiHn/Ns9OzJBTw
         tBNOBjLPm5m2mPLx1/7fs11TzCNTmUjZgiTbAM+gTRK9PBv6r1i7tAHY972uhQje1TcZ
         Y/Hw==
X-Gm-Message-State: APjAAAXmwPI6A8JmIcapub97sxKQBAEQ8OuYqqTfYpXHNOhoCB68ELfy
        qqbcarEPPl+FF9qZFbb6nAZqEwCplGsfIfFzcPVo+gmLvCI=
X-Google-Smtp-Source: APXvYqwIWumLqh/KsPyRsqyCuVYcUYm+V0DceWg10avqw935bwIOq3u32Bl0iIB+DBk4yxnqr4UsqdFSMTvZoJ+qnV0=
X-Received: by 2002:a2e:8988:: with SMTP id c8mr24394367lji.99.1558174809247;
 Sat, 18 May 2019 03:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAM+RvBRfLUPS7uaQG3Drj_oSX1ACj7cCT_fMM9o9NSwr=6JT3Q@mail.gmail.com>
 <20190514090528.78965584@coco.lan>
In-Reply-To: <20190514090528.78965584@coco.lan>
From:   Tomasz Borowczyk <tomboro88@gmail.com>
Date:   Sat, 18 May 2019 12:20:32 +0200
Message-ID: <CAM+RvBSE=pNvSOxNjzK8pPiTC7VFVFN5oavGqsn13kvEa8dc8w@mail.gmail.com>
Subject: Re: cx231xx with 3 grabbers
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro.
Thank you for your quick reply. On Raspberry model B (1 core 700MHz) I
can only watch 2 cameras with the resolution of 320x240 pixels. When I
try to watch a single camera with full resolution, Raspberry hangs.
That's why I tried to run Raspbian on my laptop - just to check, if a
stronger machine (Raspberry pi 3 for example) would be able to play
it. On laptop I can watch a single camera at full resolution. I didn't
try if I can watch more of them at once at full reslution, but you are
right, at full resolution a single camera would consume almost all usb
2.0 bandwidth, and I didn't think about it beforehand. Just happy with
result, I installed zoneminder on the laptop machine. Zoneminder
allowed me to watch all three cameras, but only at 320x240 px. And on
one of them the picture was defective, as I wrote on my earlier
e-mail. Then I started more tests and it turned out, that when I have
connected 3 grabbers, I can't see the correct picture always from this
single grabber, even if I watch only this one at 320x240px. 320x240px
needs less than one fourth bandwidth of the full resolution picture
bandwidth, so I think, it should work if I play a single camera at
once. But it looks like I'm wrong.

Nevertheless, it looks like that if I want to grab video from all of
them at full resolution, I would need a single Raspberry Pi 3 per
camera, but I must test it.

Thanks,
Tomasz

wt., 14 maj 2019 o 14:05 Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> napisa=C5=82(a):
>
> The problem is related to the maximum bandwidth that an USB 2.0
> provides. Most audio and video devices like cameras use an type of
> USB package, called ISOC, with allows reserving bandwidth for them.
> It actually reserves a number of USB slots. The maximum is 980 slots
> per second, if I'm not mistaken.
>
> The actual number of allocated slots depends on the resolution,
> format, package size, number of frames per second, etc.
>
> I don't have the numbers for cx231xx, but, with em28xx, a 640x480,
> 16 bits per pixel, 30 frames per second video uses about 60% of
> the available USB 2.0 bandwidth. So, even two cameras at full
> res can be too much.
>
> I guess you can consider your self lucky to be able of having
> two cameras working :-)
>
> If you need more than that, you'll need to use a machine with
> multiple USB buses and connect each camera on a different
> bus.
>
> Thanks,
> Mauro
