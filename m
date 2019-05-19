Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 759BA22850
	for <lists+linux-media@lfdr.de>; Sun, 19 May 2019 20:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbfESSYD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 May 2019 14:24:03 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:44281 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfESSYD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 May 2019 14:24:03 -0400
Received: by mail-lj1-f169.google.com with SMTP id e13so10362269ljl.11
        for <linux-media@vger.kernel.org>; Sun, 19 May 2019 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fXjVevl6BP66mFQKoiB3+26NGeA1iCJUXHTsVSV02p4=;
        b=C7Irj0ILXi8E16663mgBBXjMpYpabNSLuwM88Zc/D9J5iswYLLWB9kzMwAdkHJjD+1
         LnZeKP6rzX/WS6g2mX2ftktsbxxBHXtemQ95IzIijTeTxRohhrKmO50aUxBP9Cawl6n0
         hOqeo0SuxrrSvMBRXVm1ffnuXEUW2KkzfewC0k1kiOuMMDCLT53qX/TO2acOn7DYdJtv
         PRRQiHJk5CVxERX55sVX8ivJsjQYw7wnz/5X5vW6wIolzZ5yXzPwk3Szg+syyeFUX44+
         qPhTyK0Tofrv8EaQLh5lvK1eh3i96BLPj3/7TUDWdGGsK/95OEWJEmxS2WVMD+s7UhW4
         Qbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fXjVevl6BP66mFQKoiB3+26NGeA1iCJUXHTsVSV02p4=;
        b=lvg2jymcnj1bDPdPVjgoSSaUP0BRTJxca9n2TN4ZX2u5Odvn5/COtys+AoxefadUc0
         UqcufcXKsHOPBG8cqa49mqo0+aPRYJu1kRvcDfZqEtU76g+t+CJqeNXfNFiNLHihS3nl
         aNYYE9howvwdtVRxK8iL3VzslI822hxKAX0ulKKR6KMNHqxLfS20zwIQGS5hEVmQ1Ars
         opQwTLonercRluKiN602dMwifw4Iv0mLFbKT2RpgICOwVfesdfVGRRtO0VaWvRdOGCxw
         /Eg/XWTl0PgfzeVqs7AZnBnLytFKe+pLRoyPW4XcqKbD3U6rA6gfBPgmv/hG/OAJXpLf
         Kd3Q==
X-Gm-Message-State: APjAAAXnm6Sfi0Fp6OM5mS4RZH6DjAFduODLBWgtUK8/whRNvfBsfbml
        iLDdEb0kkiIodArc/V/YOe/yW+KC+nRBUn1lNUMsqds35Ww=
X-Google-Smtp-Source: APXvYqyV4vV10URHWppWiMJTzxUVb/1+6TPomIkmWxiU3Ua9C6L3Kdr/ebLFjdM6XIUKTlP/73RGgj9ITx4UZ215XHQ=
X-Received: by 2002:a2e:8516:: with SMTP id j22mr3930380lji.119.1558259013312;
 Sun, 19 May 2019 02:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAM+RvBRfLUPS7uaQG3Drj_oSX1ACj7cCT_fMM9o9NSwr=6JT3Q@mail.gmail.com>
 <20190514090528.78965584@coco.lan> <CAM+RvBRhG_Am=eGKog8a-rDAULrkNjKpbH+C+bqOk=wx5gXLJQ@mail.gmail.com>
 <20190518080408.40b3822f@coco.lan>
In-Reply-To: <20190518080408.40b3822f@coco.lan>
From:   Tomasz Borowczyk <tomboro88@gmail.com>
Date:   Sun, 19 May 2019 11:43:58 +0200
Message-ID: <CAM+RvBR5LxB=Kauc=4=y_gaP6jfQbWETaJJp_X=ZEav5jzAZvw@mail.gmail.com>
Subject: Re: cx231xx with 3 grabbers
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

sob., 18 maj 2019 o 13:04 Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> napisa=C5=82(a):
>
> Tomasz,
>
> Please don't top-post. Makes very confusing to for people to follow
> the discussions on mailing lists.

I'm sorry.

> Most laptops use a single USB bus shared on all their ports. This is
> easy to verify: the lsusb command shows on what bus a device is connected=
.
> If you can place the 3 cameras on different buses, it may work there
> (or if you have an USB 3.0 hub and connect the hub to an USB 3.0 port,
> and the cameras on it, it might work as well).

Hmm. I have both USB 3.0 and USB 2.0 on my laptop, and I connected the
3 grabbers to USB 3.0 HUB,
but the HUB was then connected to USB2.0 port :(. My mistake.
So I need to check what will happen when I connect the HUB to USB3.0 port.
But I will be at home in a week. If it works, then maybe it will be
possible to use 3 grabbers with a single Orange Pi 3 (it has USB3.0),
or  NVIDIA Jetson Nano (the same price as 3x Raspberry Pi 3).

>Without taking into account the limited speed and features of the CPU
>found on RPi3, probably the only solution for using 3 cameras on a single
>RPi3 would be:
>
>        - 1 RPi Camera module using the special camera connector;
>        - 1 USB camera to a RPi USB port;
>        - 1 USB hat;
>        - 1 USB camera connected to the USB hat.

I want to use 3 grabbers, because I have already installed 3 analog
cameras at home, which are connected to a small CRT Display.
I want to have remote access to them, and it looks like a fun project for a=
 SBC.

Thanks,
Tomasz
