Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBD94799ED
	for <lists+linux-media@lfdr.de>; Sat, 18 Dec 2021 10:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhLRJP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Dec 2021 04:15:27 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:51648 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbhLRJP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Dec 2021 04:15:26 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A5CE0B8075D
        for <linux-media@vger.kernel.org>; Sat, 18 Dec 2021 09:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10240C36AE1;
        Sat, 18 Dec 2021 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639818924;
        bh=DWNz+TXGG6cXxz6aKv9fOPTaXvuMTZU97n6sFjJFKG4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UOBXwEGQdPPpZnDIbFpiWPnxOK4IIveSHjHUIJPjxVI7jR+vSdkVoAusC5Lv+H0/B
         RGWh7Hevh0cgXW390RaxNK8aj1EY761VW1TlscUWkbCaF3u1dQVJ3MF/LisH0r+fcc
         H7Bv4pfZVj2zmpvgub4BwBbUy3WoF7Z4urB7M/t5H4eIwEacKqwQeWFMCJ/Uue+KB0
         bZy86RphsF+3U0Nu/Xc7gFfWEJUItisdMF7tmNDSTz4PJ6AO1HKM3PUSlrvAqUyeee
         xoNakSyJaa/eZlP+IMn2SwUwAUjiWfwNS5y3jJRdy16PTf/Hn2jLBoS5jsWn6LE2yN
         2eCX4UzwLHirg==
Date:   Sat, 18 Dec 2021 10:15:19 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Maximilian =?UTF-8?B?QsO2aG0=?= <maximilian.boehm@elbmurf.de>
Cc:     paskripkin@gmail.com, hverkuil-cisco@xs4all.nl, sashal@kernel.org,
        linux-media@vger.kernel.org, Brad Love <brad@nextdimension.cc>
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge
 WinTV dualHD
Message-ID: <20211218101519.756c027d@coco.lan>
In-Reply-To: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 18 Dec 2021 02:09:46 +0100
Maximilian B=C3=B6hm <maximilian.boehm@elbmurf.de> escreveu:

> Hello Paul and the other people involved,
>=20
> I=E2=80=99m a user of a Hauppauge WinTV dualHD DVB-T2 USB card and experi=
encing a bug since Linux 5.15.3 of which kernel bisecting brought me to a c=
ommit by you from Juli 29: "media: em28xx: add missing em28xx_close_extensi=
on".


So, basically this changeset: 2c98b8a3458d ("media: em28xx: add missing em2=
8xx_close_extension")

> My problem: This TV stick doesn=E2=80=99t work for me after a wake up fro=
m a system standby, so I have to use the little helper tool usbreset to res=
et its USB connection.

What such patch should be doing is to ensure that the drivers will
do the right thing when the device is removed (or unbound).

It shouldn't have been called during suspend/resume. While this bug
should be fixed, the issue with suspend/resume callbacks also seem
to require additional work.

Now, I dunno what a "usbreset" tool would be doing, but I'm assuming
that it will be doing a unbind/bind sequence.

> But if I try this after Linux 5.15.3, I get a severe kernel error in dmes=
g, system hangs and I=E2=80=99m unable to proper reboot or shutdown. I have=
 reported this on the kernel Bugzilla, including a dmesg log: https://bugzi=
lla.kernel.org/show_bug.cgi?id=3D215241

Such patch should actually be fixing a use-after-free on disconnect.

Anyway, could you please try the enclosed patch?

> I hope you have an idea about how to stop this problem from occurring and=
 I=E2=80=98m willing to help testing a fix.
> Another thinkable fix would be to directly fix this TV stick=E2=80=99s st=
andby-wake-up problem but I=E2=80=99m not savvy enough to determine if this=
 would be the better option than to fix this hanging issue.

Yeah, that would be the best. Unfortunately, right now, I don't have=20
any dual DVB-T em28xx-based board to test.

Thanks,
Mauro

[PATCH] media: em28xx: close exension first at dev_next

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em=
28xx/em28xx-cards.c
index b451ce3cb169..08f34a8aab5e 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -4148,13 +4148,12 @@ static void em28xx_usb_disconnect(struct usb_interf=
ace *intf)
=20
        flush_request_modules(dev);
=20
-       em28xx_close_extension(dev);
-
        if (dev->dev_next) {
                em28xx_close_extension(dev->dev_next);
                em28xx_release_resources(dev->dev_next);
        }
=20
+       em28xx_close_extension(dev);
        em28xx_release_resources(dev);
=20
        if (dev->dev_next) {

