Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7C71AFEE4
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 01:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgDSXbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 19:31:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:44914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbgDSXbO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 19:31:14 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E54020771;
        Sun, 19 Apr 2020 23:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587339073;
        bh=oUUjBt5OxadWSVyz47Ut3r65qKajIPhMGdyvjycH9Qw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VSUHtLxi1Ee2r7soI8AvpQ704LRkpzmJ4phS2rSbD5lKaQBaqPDSeC+gAw1+VBmCU
         Eq+r3+mv6SERE+SD1LEpjQKmp0Ft77CxXXPhHeLH9D7QA+9wGmNqvjBd3Uh9gdoEo+
         O+LNh5EcTzSbMFivrhkTTfBDaOBJrVnata+mmdbI=
Date:   Mon, 20 Apr 2020 01:31:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200420013109.65babb54@coco.lan>
In-Reply-To: <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <20200418172549.7cca07a7@coco.lan>
        <20200418172654.74a1eeea@coco.lan>
        <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 18 Apr 2020 17:37:22 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On 18.04.20 17:26, Mauro Carvalho Chehab wrote:
> > Em Sat, 18 Apr 2020 17:25:49 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> > =20
> >> Em Sat, 18 Apr 2020 16:39:25 +0200
> >> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >> =20
> >>> Hello Mauro et al,
> >>>
> >>> I've recently switched to Linux, and I'm very impressed. Almost
> >>> everything thing works out of the box. Only the webcam on my device d=
oes
> >>> not. I did some digging and if I'm right an atomisp driver would be
> >>> required. Is this correct? Below the output of lspci:
> >>>
> >>> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor
> >>> x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36) 00:02.0
> >>> VGA compatible controller: Intel Corporation Atom/Celeron/Pentium
> >>> Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36)
> >>> 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium
> >>> Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36) 00:0a.0
> >>> Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
> >>> 00:0b.0 Signal processing controller: Intel Corporation
> >>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power
> >>> Management Controller (rev 36) 00:14.0 USB controller: Intel Corporat=
ion
> >>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI
> >>> Controller (rev 36) 00:1a.0 Encryption controller: Intel Corporation
> >>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted
> >>> Execution Engine (rev 36) 00:1c.0 PCI bridge: Intel Corporation
> >>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express
> >>> Port #1 (rev 36) 00:1f.0 ISA bridge: Intel Corporation
> >>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 3=
6)
> >>> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless
> >>> Network Adapter (rev 31)

What hardware do you have?

I did a look at the atomisp driver. There are some APIs that changed upstre=
am,
but making the driver to build again is not hard:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Datomisp

If this would work or just hang, I don't know :-)

This driver is still a big mess, and it requires some defines on its source
code, in order to use it with some different Atom models.

> >>>
> >>> According to the history it looks like the driver was removed from the
> >>> kernel in 2018 and replaced with a dummy driver (to make sure power s=
ave
> >>> works).
> >>>
> >>> Is there a chance that the atomisp driver will return to the kernel?
> >>> There are quite a few older tablets and 2in1 devices that would benef=
it.
> >>> Unfortunately I do not understand the removed code (my coding skills =
are
> >>> very basic) and can thus not help to change what ever is necessary to
> >>> make it fit for the kernel :-( (does not sound like a beginner projec=
t).
> >>> However - I would be glad to help out to help testing an ISP driver. =
=20
> >> There are simply too many things there to be fixed, and nobody without
> >> time for it. Also, the last reports we had is that the driver was not
> >> working.
> >>
> >> Unfortunately, I don't have myself any atomisp hardware, otherwise I
> >> could try fixing it on my spare time. =20
> > In time: not really sure if it would be a worth project, as newer Intel
> > hardware are coming with a different IP block (IPU3). =20
>=20
> I don't know how widespread the IPU that I have is, I assume that some=20
> other tablets & 2in1 devices that are a few years old use it as well.=20

The IPU is used on some Dell 2in1 devices(I guess they use an i5core=20
with a chipset made for mobile market). Not sure if they're using IPU3
also on Atom.

> For me it would be definitely nice to have this driver. However, I can=20
> ask around in some of the forums=C2=A0 if there is a wider interest. Migh=
t be=20
> a niche tough, but the support for the Atom device I use have been=20
> greatly improved in the recent years. So there is at least some work=20
> going on for that platform (I do not know, but I think it is called=20
> cherry trail?). As there are many older reports of problems with audio,=20
> touchscreen, stability (freezes) ... and none of them are present anymore.
>=20
> As mentioned, if the development is hindered by missing hardware I would=
=20
> be glad to help. Anyhow - many thanks for your replies, much appreciated!
>=20
> >
> > Thanks,
> > Mauro =20



Thanks,
Mauro
