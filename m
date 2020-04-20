Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1281B1776
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 22:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgDTUrz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 16:47:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:57992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbgDTUry (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 16:47:54 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEB4020575;
        Mon, 20 Apr 2020 20:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587415673;
        bh=8IMj1IshRvbcHVM8CrcDJb8Ih3zbJGPNfIzodz3flxI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=2tvcKx38NVPqtmAGa3qE2e/L2Vm2jr+SYTw+uX9j/yrS/yDL02cJj7SwG9yUjl8uT
         qxtZim/SYs4e+PPHbRQLVyOHJiLzmZYwMj+ExJRfYj4zjnZEK4Skopz+8DBJtysjwe
         UWzIjkhchT+6zAaIXg/MI2AVCVWDghKKLPKwzXBI=
Date:   Mon, 20 Apr 2020 22:47:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200420224750.28c0181d@coco.lan>
In-Reply-To: <eb83f789-9595-55f0-d922-bab00ae85cff@gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <20200418172549.7cca07a7@coco.lan>
        <20200418172654.74a1eeea@coco.lan>
        <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
        <20200420013109.65babb54@coco.lan>
        <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
        <eb83f789-9595-55f0-d922-bab00ae85cff@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 20 Apr 2020 20:27:25 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> Me again ... sorry to ask such a basic question, but I can't get your=20
> modified source code. I get the following error:
>=20
>  > git clone https://git.linuxtv.org/mchehab/experimental.git/ =20
> Cloning into 'experimental'...
> warning: adding alternate object store:=20
> https://git.linuxtv.org/git/linux.git/
> warning: adding alternate object store:=20
> https://git.linuxtv.org/git/media_tree.git/
> warning: adding alternate object store:=20
> https://git.linuxtv.org/git/linux.git/
> error: Unable to find fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f under=20
> https://git.linuxtv.org/mchehab/experimental.git
> Cannot obtain needed object fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f
> while processing commit 6d80bfc14608f4bb5514b79721d30b486f50c987.
> error: fetch failed.
>=20
> Do I use the wrong command?

Better to use git:// url:

	git clone git://git.linuxtv.org/mchehab/experimental.git/ =20


>=20
> kind regards,
>=20
> Patrik
>=20
> On 20.04.20 19:48, Patrik Gfeller wrote:
> >
> > On 20.04.20 01:31, Mauro Carvalho Chehab wrote: =20
> >> Em Sat, 18 Apr 2020 17:37:22 +0200
> >> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >> =20
> >>> On 18.04.20 17:26, Mauro Carvalho Chehab wrote: =20
> >>>> Em Sat, 18 Apr 2020 17:25:49 +0200
> >>>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu: =20
> >>>>> Em Sat, 18 Apr 2020 16:39:25 +0200
> >>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu: =20
> >>>>>> Hello Mauro et al,
> >>>>>>
> >>>>>> I've recently switched to Linux, and I'm very impressed. Almost
> >>>>>> everything thing works out of the box. Only the webcam on my=20
> >>>>>> device does
> >>>>>> not. I did some digging and if I'm right an atomisp driver would be
> >>>>>> required. Is this correct? Below the output of lspci:
> >>>>>>
> >>>>>> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium=20
> >>>>>> Processor
> >>>>>> x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36)=20
> >>>>>> 00:02.0
> >>>>>> VGA compatible controller: Intel Corporation Atom/Celeron/Pentium
> >>>>>> Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller=20
> >>>>>> (rev 36)
> >>>>>> 00:03.0 Multimedia controller: Intel Corporation=20
> >>>>>> Atom/Celeron/Pentium
> >>>>>> Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36) 00:0a.0
> >>>>>> Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
> >>>>>> 00:0b.0 Signal processing controller: Intel Corporation
> >>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power
> >>>>>> Management Controller (rev 36) 00:14.0 USB controller: Intel=20
> >>>>>> Corporation
> >>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI
> >>>>>> Controller (rev 36) 00:1a.0 Encryption controller: Intel Corporati=
on
> >>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted
> >>>>>> Execution Engine (rev 36) 00:1c.0 PCI bridge: Intel Corporation
> >>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI=20
> >>>>>> Express
> >>>>>> Port #1 (rev 36) 00:1f.0 ISA bridge: Intel Corporation
> >>>>>> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU=20
> >>>>>> (rev 36)
> >>>>>> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac=20
> >>>>>> Wireless
> >>>>>> Network Adapter (rev 31) =20
> >> What hardware do you have? =20
> > I have aASUS Transformer Book T101HA-GR029T (HW probe @
> >
> > https://linux-hardware.org/?probe=3Dccc26d4cd3).
> > =20
> >> I did a look at the atomisp driver. There are some APIs that changed=20
> >> upstream,
> >> but making the driver to build again is not hard:
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0https://git.linuxtv.org/mchehab/experimental.g=
it/log/?h=3Datomisp
> >>
> >> If this would work or just hang, I don't know :-) =20
> >
> > Cool!
> >
> > Meanwhile I downloaded to kernel source and checked out the latest=20
> > commit that still has the driver in staging. I'm currently in the=20
> > process of building the old kernel in order to test if the driver=20
> > works at all (1st time I'm doing this - thus takes some time,=20
> > especially on my Atom :-). But I will then switch over to your changed=
=20
> > version to give it a try.
> > =20
> >>
> >> This driver is still a big mess, and it requires some defines on its=20
> >> source
> >> code, in order to use it with some different Atom models.
> >> =20
> >>>>>> According to the history it looks like the driver was removed=20
> >>>>>> from the
> >>>>>> kernel in 2018 and replaced with a dummy driver (to make sure=20
> >>>>>> power save
> >>>>>> works).
> >>>>>>
> >>>>>> Is there a chance that the atomisp driver will return to the kerne=
l?
> >>>>>> There are quite a few older tablets and 2in1 devices that would=20
> >>>>>> benefit.
> >>>>>> Unfortunately I do not understand the removed code (my coding=20
> >>>>>> skills are
> >>>>>> very basic) and can thus not help to change what ever is=20
> >>>>>> necessary to
> >>>>>> make it fit for the kernel :-( (does not sound like a beginner=20
> >>>>>> project).
> >>>>>> However - I would be glad to help out to help testing an ISP drive=
r. =20
> >>>>> There are simply too many things there to be fixed, and nobody=20
> >>>>> without
> >>>>> time for it. Also, the last reports we had is that the driver was n=
ot
> >>>>> working.
> >>>>>
> >>>>> Unfortunately, I don't have myself any atomisp hardware, otherwise I
> >>>>> could try fixing it on my spare time. =20
> >>>> In time: not really sure if it would be a worth project, as newer=20
> >>>> Intel
> >>>> hardware are coming with a different IP block (IPU3). =20
> >>> I don't know how widespread the IPU that I have is, I assume that some
> >>> other tablets & 2in1 devices that are a few years old use it as well.=
 =20
> >> The IPU is used on some Dell 2in1 devices(I guess they use an i5core
> >> with a chipset made for mobile market). Not sure if they're using IPU3
> >> also on Atom.
> >> =20
> >>> For me it would be definitely nice to have this driver. However, I can
> >>> ask around in some of the forums=C2=A0 if there is a wider interest.=
=20
> >>> Might be
> >>> a niche tough, but the support for the Atom device I use have been
> >>> greatly improved in the recent years. So there is at least some work
> >>> going on for that platform (I do not know, but I think it is called
> >>> cherry trail?). As there are many older reports of problems with audi=
o,
> >>> touchscreen, stability (freezes) ... and none of them are present=20
> >>> anymore.
> >>>
> >>> As mentioned, if the development is hindered by missing hardware I=20
> >>> would
> >>> be glad to help. Anyhow - many thanks for your replies, much=20
> >>> appreciated!
> >>> =20
> >>>> Thanks,
> >>>> Mauro =20
> >>
> >>
> >> Thanks,
> >> Mauro =20
> >
> > thanks & kind regards,
> >
> > Patrik
> > =20



Thanks,
Mauro
