Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3AD3B14AE
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 09:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhFWHff (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 03:35:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:33514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230037AbhFWHfe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 03:35:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6074C6101D;
        Wed, 23 Jun 2021 07:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624433597;
        bh=cSE4gvzltu40U/D3KFAbFM/4HN3+SscDhof3gpvHaJQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LsLrtEc96Fn6TLLI416f3+gEA4o78vBtze3/liP0+ob0AoBER5bXgOz7B9Mfi7pMo
         pqRWDnbrSpcMtikE/3Hk7QGlcFZ5krUX6OGFSbYnQsYIe7VsaGpZ+BynW9+aiUNyZX
         YoVDw0IbgnPf7yVnto3kwhbbV6Qm8+19GpMPVn1uSEzXrf5zZUz1DIe0r03DSp+xA3
         5ErCmKBIdzhsDdmPw9GVg5fM8UaxhXBnVGzLWO28B/vJm2VAKaYQK/3mhHmRr/OHZG
         Buj+Sm2tinYfUkDjQbiI2LyZcqY6KnbbY5kIMa17IJqo0cv4y67HsHl3ZvTBYdg5Em
         nNiCihKKamJ+Q==
Date:   Wed, 23 Jun 2021 09:33:12 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     YP WU <yp.wu@mediatek.com>
Cc:     <leo.hsiao@mediatek.com>, <Lecopzer.Chen@mediatek.com>,
        <gustavoars@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <Jason-BF.Huang@mediatek.com>, <francis.lee@mediatek.com>
Subject: Re: How to use "DTV_FE_CAPABILITY" command for Frontend.h of Linux
 DVB
Message-ID: <20210623093312.6f9883a5@coco.lan>
In-Reply-To: <20210623061551.10453-1-yp.wu@mediatek.com>
References: <20210623061551.10453-1-yp.wu@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Em Wed, 23 Jun 2021 14:15:51 +0800
YP WU <yp.wu@mediatek.com> escreveu:

> Hello, dvb frontend maintainer:
> 	I work at mediatek company. Currently I develop TV with Linux DVB system=
.   =20
> 	I would like to implement the following LNB use cases: user space would =
like to know if frontend device node have LNB or not.


I need to understand more about the use case.

The main scenario of userspace needing to know about LNB is on Satellite=20
systems. For those, knowing that the standard is DVB-S/S2, ISDB-S, ... is
enough to know that a LNB should be controlled.

However, userspace needs more than the Kernel can provide, as the LNB is
an external component, located at the satellite dish.

Such kind of LNB may implement DiSEqC in order to allow certain control
from the device powering them, but there are several LNB types that
don't provide any control.

Even when those that implement DiSEqC 1.x, there's no way to query the=20
LNB properties.

Only after DiSEqC 2.x, there's a way for the LNB to send data back to
the digital TV receiver.

Also, some satellite systems are configured as multipoint. On those,
the LNBf power/control can be done by a centralized equipment. Depending
on the type of arrangement, the LNB control can be set to OFF, as all
channels are received on different intermediate frequencies.

Due to such huge differences, and the lack of a way for the Kernel
to retrieve the satellite configuration, what happens is the
other way around: it should be up to userspace to tell the Kernel=20
about it, asking it to turn on/off the LNB power, set the DC voltage
and send/receive DiSEqC commands.

-

That's said, a few devices may have a low noise amplifier that
could be turned on in order to boost the signal gain. The
DTV_LNA is meant to control it.

Currently, the only way to know if LNA is there is to try to
set it, and check for the return code.


> I want to use "DTV_FE_CAPABILITY" to represent above LNB capability, but =
I am afraid that my usage is not suitable to the original definition.   =20
> So I would like to consult the following quesitons:=20
> 1. The use case for DTV_FE_CAPABILITY in DVB property command.
> 2. Does it have any restriction for using this command?
> 3. What=E2=80=99s your suggestion for using this command?
>=20
> File path: include/uapi/linux/dvb/Frontend.h
> #define DTV_FE_CAPABILITY	16
>=20

We need to better implement DVB capabilities at the subsystem.

The DTV_FE_CAPABILITY property is meant to duplicate the DVBv3
FE_GET_INFO capabilites (fe_caps), but there are very few bits
left there. They aren't enough to provide all possible capabilities
of a DVB system.

I mean, for instance a DVB-S2 device may support only a subset
of DVB-S2 modulation types. They may eventually not support PLP,
and so on. The number of possible combinations is a way larger
than a 32-bits caps could possible support.

We had some upstream discussions about how to improve it in the
past, but nothing got merged.

IMO, if you're willing to work on a better way to report the
device's capabilities, we should probably implement a new DTV
property.

Thanks,
Mauro
