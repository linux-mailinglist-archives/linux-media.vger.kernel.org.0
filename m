Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7E1074100
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 23:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfGXVnD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 17:43:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:40496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725851AbfGXVnC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 17:43:02 -0400
Received: from earth.universe (unknown [185.62.205.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B6E121850;
        Wed, 24 Jul 2019 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564004581;
        bh=BUUcmGuX+xpevjyihz4LSn7iN7sCpo8bm9nVuenrSZk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FsG1FDw4SauLwqOx3ORiiAgcUUoX0KdrTGoZCSCAo5UvB/sGOQ9VAh6y4Zzfh/HwR
         grnLf7QzIHvN+YFYMvEuNeQOZDNmei/gv/tpOAhGqCvxpJto2v3DITii/zVge9/N2v
         rXu0Bs7kShFz8vJBittJrLahh6gKemAX8WCWSN34=
Received: by earth.universe (Postfix, from userid 1000)
        id AF2583C08DC; Wed, 24 Jul 2019 23:42:57 +0200 (CEST)
Date:   Wed, 24 Jul 2019 23:42:57 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [RFC] Removal of drivers/staging/media/bcm2048
Message-ID: <20190724214257.6gudm4tqi6hmwqqq@earth.universe>
References: <e78d190f-5185-f37a-c212-b88af2198f55@xs4all.nl>
 <20190723090952.GB30669@amd>
 <20190723094856.rlwt3rns3yt6q6uz@pali>
 <f20fc4bf-537f-0672-11fd-9ba61eb788c7@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yuzexgph5vebszhf"
Content-Disposition: inline
In-Reply-To: <f20fc4bf-537f-0672-11fd-9ba61eb788c7@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--yuzexgph5vebszhf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 23, 2019 at 12:58:54PM +0200, Hans Verkuil wrote:
> On 7/23/19 11:48 AM, Pali Roh=E1r wrote:
> > On Tuesday 23 July 2019 11:09:53 Pavel Machek wrote:
> >> On Tue 2019-07-23 10:51:52, Hans Verkuil wrote:
> >>> This staging driver is now almost 6 years old, but hasn't seen any re=
al
> >>> development for a long time.
> >>>
> >>> I think it is time to remove it, unless someone plans to do work on t=
his
> >>> in the near future.
> >>>
> >>> If anyone wants to work on this, please let us know.
> >>
> >> So... unfortunately this one depends on bluetooth driver, which is
> >> quite complex. Unfortunately, that one was removed from staging while
> >> it was being worked upon, and seen little progress since that.
> >=20
> > There is already a new bluetooth driver hci_nokia for bcm2048:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/bluetooth/hci_nokia.c
>=20
> Hmm, this went in two years ago.

AFAIK the bluetooth depency is quite light actually. While bcm2048
provides the bluetooth and the FM radio, bluetooth is handled through
serial and FM radio is handled via I2C. I do not remember if FW has
to be loaded via BT to have functional FM radio, but there should be
no other dependency. TLDR: I think it should work at the moment.

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm/boot/dts/omap3-n900.dts
>=20
> Is there any chance that this bcm2048 driver will be fixed and
> moved out of staging by the end of this year? If not, then I want
> to remove it.

FWIW I do _not_ plan to work on this, since I'm too busy with other
things (e.g. moving the wl128x radio driver to use the new hci_ll
driver).

-- Sebastian

--yuzexgph5vebszhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl040N4ACgkQ2O7X88g7
+poycQ//V+BMCfTQQgmyKqQ11nzT7ET8sgqmAXM5vqkE+jTqGhWFAWdj1uFSNOh5
/YU8zKApx4SJaqH16Lnayt3BpXeoc6XofjIw5UUdp3vEheNRhZ6NxRKOmQ7gC+wu
qylamqUx+9VTW2b6+GLTvdtXRAG6j1FeNhUSzBtqPb8EZFB79YeFyCohswum1kAe
q558tzsK7B107nxSi29u4GTOOFhj49tW296V+fNTcM9xg9Oc/ZWx/q/T/Dq0De9K
eXE9+ZY3g43MCl7br2NDWF314dUv4VIKH8ktQnLUesMbti9pKDyA/scdJ7J8hbuh
bBMRxkdbJDtnOaws6bm9Gakk2vFzRcMvRvVpGLW76h94G8ycWmEl79ybCf/RYyrE
DL/34AIGipGg3al0Rt4qBMMtl2iu5RufOlsfqxztfjqv8zUeizW88sd7JTCQnpKQ
GA1HfCYPnTOIU7skKxeRc56MgF0o3334L0G1OcuNScRqNS+hGarhMFN0VGoKhXvt
0LhI2SUfFTDEPHV+rloOd6SwmtUV2PC1biLEY1feFIYFnD4v2PYbB7PAijxeoP/I
KL1AjBx6xJxhB0k5qO8TQhtUCErxsJaOz3+R2wa1ZDbm9WjqOGnWkKzNls31ImvI
Rb1qYMY4CcVIDK+HYLPN1SWnk6g84ORhrsOFY0iaGev345lg8Ho=
=STeZ
-----END PGP SIGNATURE-----

--yuzexgph5vebszhf--
