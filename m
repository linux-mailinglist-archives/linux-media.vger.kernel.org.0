Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7BE522355
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 13:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbfERLEP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 May 2019 07:04:15 -0400
Received: from casper.infradead.org ([85.118.1.10]:35052 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfERLEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 May 2019 07:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qgVN0qHOMLQ44VZb+S1Zazq6Emt23vFTWM0dPOq5/v8=; b=EA7y08YRrwqzJ8AfukvvxLewG0
        vQiEEQms/nWHZxGyBQNGqZc5DERQMANGRzadZ5rW3HmeJtdDMh3Pp6uyqafoEu78r8NEV7uWcZdg5
        jOU9iDRaK5hi6sfR30kP7QqNxOm9kGWfKNZLSHmhkNvEA6lAKP55e7hHNdd+V4vvBhRNe5Bv4UG27
        1nqeD+Oq+E8CEw/K53aFW3Yl7ttDHY0WcL30dZigDt/Qh9yK4J3k+TTrRy1+J/UW87i2kdhLIyhKV
        bDGoDcCRj655F+RFEt7xJ15dc4BmFrJLsV71qFC9FJuyw6zxkeSsIqSS+8kYS+aOiuojyvscVoUxy
        ajMrs3dg==;
Received: from 179.186.105.249.dynamic.adsl.gvt.net.br ([179.186.105.249] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hRx8O-0002Dc-Sx; Sat, 18 May 2019 11:04:13 +0000
Date:   Sat, 18 May 2019 08:04:08 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Tomasz Borowczyk <tomboro88@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: cx231xx with 3 grabbers
Message-ID: <20190518080408.40b3822f@coco.lan>
In-Reply-To: <CAM+RvBRhG_Am=eGKog8a-rDAULrkNjKpbH+C+bqOk=wx5gXLJQ@mail.gmail.com>
References: <CAM+RvBRfLUPS7uaQG3Drj_oSX1ACj7cCT_fMM9o9NSwr=6JT3Q@mail.gmail.com>
        <20190514090528.78965584@coco.lan>
        <CAM+RvBRhG_Am=eGKog8a-rDAULrkNjKpbH+C+bqOk=wx5gXLJQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomasz,

Please don't top-post. Makes very confusing to for people to follow
the discussions on mailing lists.


Em Sat, 18 May 2019 12:12:11 +0200
Tomasz Borowczyk <tomboro88@gmail.com> escreveu:

> wt., 14 maj 2019, 14:05 u=C5=BCytkownik Mauro Carvalho Chehab <
> mchehab+samsung@kernel.org> napisa=C5=82: =20
>=20
> > Em Tue, 14 May 2019 00:18:31 +0200
> > Tomasz Borowczyk <tomboro88@gmail.com> escreveu:
> > =20
> > > Hello linux-media.
> > >
> > > I use cx231xx driver with my August Vgb100 USB video grabber. It works
> > > great. It automatically detects my device and I can watch the video
> > > from analog camera on my Raspberry Pi, and I am very happy about how
> > > it works.
> > >
> > > But there is a catch. I want to connect 3 such cameras to my Raspberry
> > > Pi. When there are connected 2 of them, I can watch video from both of
> > > them without problems. When there are connected 3 adapters, I can
> > > watch the video from all three cameras, but the picture from one of
> > > them is flickering and blurring between blue screen and the correct
> > > data. And no matter in what order I connect them to the Raspberry, the
> > > problem exists always on the same adapter.
> > > The same problem exists when I connect the cameras to my laptop
> > > running Raspbian desktop.
> > > This could suggest that the one adapter is a little defective, but it
> > > works okay when there are connected only two adapters, or when it is
> > > the only connected. Also when I disconnect it and connect again to USB
> > > port, I can see correct image. But when I start to play picture from
> > > another camera, and then go back to the "defective" one, it flickers
> > > again. How can I find the reason of the problem? =20
> >
> > The problem is related to the maximum bandwidth that an USB 2.0
> > provides. Most audio and video devices like cameras use an type of
> > USB package, called ISOC, with allows reserving bandwidth for them.
> > It actually reserves a number of USB slots. The maximum is 980 slots
> > per second, if I'm not mistaken.
> >
> > The actual number of allocated slots depends on the resolution,
> > format, package size, number of frames per second, etc.
> >
> > I don't have the numbers for cx231xx, but, with em28xx, a 640x480,
> > 16 bits per pixel, 30 frames per second video uses about 60% of
> > the available USB 2.0 bandwidth. So, even two cameras at full
> > res can be too much.
> >
> > I guess you can consider your self lucky to be able of having
> > two cameras working :-)
> >
> > If you need more than that, you'll need to use a machine with
> > multiple USB buses and connect each camera on a different
> > bus.
> >
> > Thanks,
> > Mauro
> > =20
> Hello Mauro.
> Thank you for your quick reply. On Raspberry model B (1 core 700MHz) I can
> only watch 2 cameras with the resolution of 320x240 pixels. When I try to
> watch a single camera with full resolution, Raspberry hangs.

On Raspbian's Kernel, the USB driver uses an special high=20
priority interrupt that takes precedence of everything else. I did some
tests in the past with that: the USB controller on RPi has only half of
the buffers than the same USB controller have on other similar hardware.
With that, the number of pending transfers is reduced. So, one came with=20
a hack to make the USB interrupts to take precedence of everything else,
as otherwise it won't sustain USB 2.0 speeds.

Upstream didn't accept such change, and keeps using normal interrupts,
with is a lot safer, but it limits the USB maximum sustained transfer
rate.

> That's why I
> tried to run Raspbian on my laptop - just to check, if a stronger machine
> (Raspberry pi 3 for example) would be able to play it. On laptop I can
> watch a single camera at full resolution. I didn't try if I can watch more
> of them at once at full reslution, but you are right, at full resolution a
> single camera would consume almost all usb 2.0 bandwidth, and I didn't
> think about it beforehand. Just happy with result, I installed zoneminder
> on the laptop machine.=20

Most laptops use a single USB bus shared on all their ports. This is
easy to verify: the lsusb command shows on what bus a device is connected.
If you can place the 3 cameras on different buses, it may work there
(or if you have an USB 3.0 hub and connect the hub to an USB 3.0 port,
and the cameras on it, it might work as well).

> Zoneminder allowed me to watch all three cameras,
> but only at 320x240 px. And on one of them the picture was defective, as I
> wrote on my earlier e-mail.

It is probably reducing the frame rate as well.

> Then I started more tests and it turned out,
> that when I have connected 3 grabbers, I can't see the correct picture
> always from this single grabber, even if I watch only this one at
> 320x240px. 320x240px needs less than one fourth bandwidth of the full
> resolution picture bandwidth, so I think, it should work if I play a sing=
le
> camera at once. But it looks like I'm wrong.

Not quite true. Remember: the real issue is the number of USB frames
that are allocated per second, and not the frame size. The USB spec
defines the maximum number of frames per second and says that ISOC can
only allocate 80% of it. If I'm not mistaken, that gives 960 frames per
second.

It doesn't matter if each frame has 4K bytes or 4 bytes.

On most devices, reducing the resolution also reduces the size of the
frames. It may or may not reduce the number of frames.

It also depends on USB alternate settings. On cx231xx, part of the
logic is at cx231xx_set_video_alternate(). Depending on the width
size, it switches from alternate settings  1, 2 or 3, with affects
the maximum data size the chipset will accept.

>=20
> Nevertheless, it looks like that if I want to grab video from all of them
> at full resolution, I would need a single Raspberry Pi 3 per camera, but I
> must test it.

Yeah, either that or maybe some hat that would provide extra USB buses.

I suspect, however, that the USB hats you'll find will have just a single
USB bus with multiple USB 2.0 ports sharing the same bus. So you probably
can connect only a single camera there.

Without taking into account the limited speed and features of the CPU
found on RPi3, probably the only solution for using 3 cameras on a single
RPi3 would be:

	- 1 RPi Camera module using the special camera connector;
	- 1 USB camera to a RPi USB port;
	- 1 USB hat;
	- 1 USB camera connected to the USB hat.

I suspect, however, that its CPU won't have enough power to deal with the
amount of data transfers generated by such configuration and may hang
the RPi and probably corrupt the disk image.

Thanks,
Mauro
