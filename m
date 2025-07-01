Return-Path: <linux-media+bounces-36485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6188AAF06EA
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 01:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45676189F1E3
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 23:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9800C284B5D;
	Tue,  1 Jul 2025 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="erI1xFfV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jC8UaT9V"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E1E241CB7
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 23:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751412052; cv=none; b=bqySpyS8vGzmFeJ6R4K/Wm0r0f61mpn+oCUqa+gueXJQlgg4x/Zz8TwPJduuFHnccuD+ZF5CYbW0/sjq3h4/f8i6chCL00ZDZZ/RMEd9GRlgXlb/CNSjW5gn8yDsaRli4IuXdBUPEct/4ZbYL+eVZZrQ8G8F2WvREVo9kquIfDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751412052; c=relaxed/simple;
	bh=iqwY9Cr+3YLBz5+RWA7ZHq7TBUGfQXjiOC3MbRIqx54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFsTmsKq8n/qKc9IHuBLxMUFrssn0OOSqJOxkzh0rvihBCp4xZR9mRRspdGGgbBfOLgxuyISRuqLXrxfo2CBUwd+u4qLXyAj3SMgbRhCCkMZr/+/SplOLokoapsXR3nYtXxceqnFyUe5ZrAIBpsnydbS2B62qWQBa4XZgZqxXeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=erI1xFfV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jC8UaT9V; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4E65114002EE;
	Tue,  1 Jul 2025 19:20:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 01 Jul 2025 19:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751412049;
	 x=1751498449; bh=hrhkKSB49C4hbDTxp3WKdo9s71rIjfQmzIvpXXKQJ+k=; b=
	erI1xFfVEf8nU35OQcKeJDrfqsgSrYLuE+k0NUW/2AvHoRgvwCwzVhq0CW4HKpCn
	MMGdNWcPF0afUexlycS9KpdyJ+nQUn//OqqW8AiTA7aBJvSGewuGfKh4QDhva3Xy
	vOK+9ZwcUhIwCUBPcDOrxfuQ54luNl4qdAW5n3LXreSG7F+Om+1jMeNNHOyHf+BG
	lKxvngqii5q6EoNHqeLgwFSQd7tpGPbAYu+aQk7oFZsPWNsCPciE4YJJvuUA1WOi
	r2f24HlW9go15L8i4sP8uAeEGzWBuqSzNWoRX+Mim0haHnnk5ZrMnR6kIgHGndkh
	2oXNxBdDXkq9w+Ir1xZydw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751412049; x=1751498449; bh=hrhkKSB49C4hbDTxp3WKdo9s71rIjfQmzIv
	pXXKQJ+k=; b=jC8UaT9VDyYoush0lj9aQOfB19knoxN19YmS0sPkhm4vmZ62Y5w
	/6HIYR5KMFOvBnziG7D1SeNMlZFFOGKJVLWN5g7ECT/HFXW8QxcGRgIMuO78j/0V
	2aqvaQaMrvfhDyJdP0j9YBhM0Ac2TS9f6omUwmahBV167ugS/LQCkwq9dNFbIGqt
	/ulvoRSazf8FKbXDuHZoo2Tdlv9jkdYlk3KHdAjqe+swabmfgG6Y7cWY8LC63oOv
	ztfKSN+dSiEgGwUgbxwkZvQmxzxJLSVglh9URT9tDYUNf9Y5Pz4ZMEj+v89NENpW
	M870S4A5+J8kLkJCUiKZz/z27xY2N6saa5Q==
X-ME-Sender: <xms:UG1kaAVc3ZV2TLc7epsg38J-fTcQbCweYL0hKxcJxkc3cxm7UPhUMg>
    <xme:UG1kaEnIfiLQtS9dzeJ59VS8Pzac4zpG8_yg1iWKkGGOXLex46bcBj4cat_t4bguR
    F9FJdC-oxOk6A>
X-ME-Received: <xmr:UG1kaEY1mYD5Fe7aURIV0CLXa4jB19wKVzR3BqjhhCZcRV4ZbiW6tw7Ia4Tp6VZBKZhIxnTArjbEADNBfJbuqbd75okkYBj-8Uk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedtveeltddt
    jeffleehffehgfeghfeuvedvueevkeeutdelfeeuvdelieehgefftdenucffohhmrghinh
    eptgholhhlrggsohhrrgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehsvggsrghsthhirghnrdhrvghitghhvghlsegtohhllhgrsghorhgrrdgtoh
    hmpdhrtghpthhtohepughmihhtrhihrdhoshhiphgvnhhkohestgholhhlrggsohhrrgdr
    tghomhdprhgtphhtthhopehshhhrvggvhigrrdhprghtvghlsegtohhllhgrsghorhgrrd
    gtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkvghrnhgvlhestgholhhlrggsohhrrgdrtghomh
X-ME-Proxy: <xmx:UW1kaPX-g3zhrf8_hWD5bD6xmyFuiGIk895Wb4Ib7zRfDEeXnKqlCw>
    <xmx:UW1kaKlwY1eJ8sKt9xOxJirAhP4lauQACse724l_90OrlhspJ5E3NQ>
    <xmx:UW1kaEdqQXe2tZf44GAfpVyoRZNSmdZq8qnMIttQtGJU-RwaUvI6Qw>
    <xmx:UW1kaMGbZ4pAfr6b6QQeoiW7io99flvoWOkKn_mi4L3_HGXRYilNTg>
    <xmx:UW1kaNBBumNte9pqXLFkKcE8_liABsk5T2ThwKs6xGJZujRl5HR-W2JG>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jul 2025 19:20:47 -0400 (EDT)
Date: Wed, 2 Jul 2025 01:20:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Shreeya Patel <shreeya.patel@collabora.com>,
	linux-media@vger.kernel.org, kernel@collabora.com
Subject: Re: "signal is not locked" with HDMI RX driver on RK3588
Message-ID: <aGRtTghd0MDOv01x@mail-itl>
References: <aGKFhDmBwYp5KV3k@mail-itl>
 <aGKXr0Z96zGU74q6@mail-itl>
 <qazkvgdtozck65s2lstvxfwplhlvf3ynm5z6c6gdpgaytja7v4@f5gsnd7urzp6>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FTh4xEuQT9kCRZxi"
Content-Disposition: inline
In-Reply-To: <qazkvgdtozck65s2lstvxfwplhlvf3ynm5z6c6gdpgaytja7v4@f5gsnd7urzp6>


--FTh4xEuQT9kCRZxi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 2 Jul 2025 01:20:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Shreeya Patel <shreeya.patel@collabora.com>,
	linux-media@vger.kernel.org, kernel@collabora.com
Subject: Re: "signal is not locked" with HDMI RX driver on RK3588

On Mon, Jun 30, 2025 at 07:51:39PM +0200, Sebastian Reichel wrote:
> Hi,
>=20
> On Mon, Jun 30, 2025 at 03:57:03PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, Jun 30, 2025 at 02:39:32PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > Hi,
> > >=20
> > > First of all, thanks for all the work regarding upstreaming the drive=
r!
> > >=20
> > > I try to use it on two boards:
> > > - Orange Pi 5B
> > > - Rock 5B+
> > >=20
> > > In both cases, when I use the upstream driver in 6.16-rc, I hit simil=
ar
> > > issue:
> > > 1. `v4l2-ctl -d /dev/video2 --set-edid type=3Dhdmi-4k-300mhz` - this =
works
> > > 2. EDID is properly presented to the device on the other side of the
> > > HDMI cable, I can select to use that "display"
> > > 3. But then, the hdmirx complains:
> > >=20
> > >     v4l2-ctl -d /dev/video2 --query-dv-timings
> > >     VIDIOC_QUERY_DV_TIMINGS: failed: No locks available
> > >=20
> > > And kernel shows:
> > > [ 4033.823023] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_registe=
r_write wait cr write done failed
> > > [ 4033.847027] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_registe=
r_write wait cr write done failed
> > > [ 4033.870976] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_registe=
r_write wait cr write done failed
> > > [ 4033.894998] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_registe=
r_write wait cr write done failed
> > > ...
> > > [ 4061.975400] fdee0000.hdmi_receiver: hdmirx_query_dv_timings: signa=
l is not locked
> > >=20
> > > In this state actually capturing video stream doesn't work either.
> > >=20
> > > I tried also rockchip-release branch from
> > > https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux =
(at
> > > 33755850faeb0e53e634390d147cc261a60d2898) with the same result.
> > >=20
> > > If I try the same with the 6.12.13-current-rockchip64 kernel from Arm=
bian,
> > > it works fine. I tried to compare the drivers, but there are quite a =
few
> > > differences so it's hard to spot any obvious issue (it could be also =
an
> > > issue somewhere else...).
> > >=20
> > > Any ideas? I can try to add some debugging info or test patches, if y=
ou
> > > point me what would be helpful.
> >=20
> > If I take u-boot from
> > https://gitlab.collabora.com/hardware-enablement/rockchip-3588/u-boot/
> > (rockchip branch at 60501605e3f48b155af83193dfd9ad73362b8e25) and stop
> > loading device-tree from a separate file, I get a different error:
> >=20
> >     VIDIOC_QUERY_DV_TIMINGS: failed: Numerical result out of range
> >=20
> > (and no extra messages from kernel)
> > My goal is to capture in 4k at 30fps (or even lower), but I get this
> > error also with lower resolutions like 1920x1200@60fps. Unfortunately I
> > don't know which value specifically is out of range...
>=20
> You are probably just using the wrong TF-A firmware. Rockchip's
> binary-only firmware contains a workaround/quirk, which handles the
> main HDMI-RX interrupt and then provides a virtual one on one of the
> reserved interrupt lines. The kernel has to use the virtual one,
> otherwise the driver is not functional.
>=20
> The upstream (open source) TF-A does not contain this workaround and
> the kernel must use the original HDMI-RX interrupt line, as the
> reserved interrupt line is not doing anything at all.
>=20
> The RK3588 device tree, which is provided as part of the mainline
> Linux kernel describes the interrupt lines from the hardware and
> thus needs to be used with the upstream TF-A.

That was it, thanks! Not it just works!

Is it possible for the driver to detect this situation and either
adjust, or at least print some more helpful message? I would have never
guessed to look there based on the existing symptoms...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FTh4xEuQT9kCRZxi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhkbU4ACgkQ24/THMrX
1yyewQf9HbgUYMj+xeHcXbwC/JwRH3EfEOzaizt0Gi8+S1ehQpglgtBBags5H3br
O6yAyztppd45Im4iG9k2U6u8g7l2Sn6T9n6h6dbXGjtfGl7s1ievcojorxGPAZZy
vNGHwqTSYr1P8BayV/CZ1g8SdPopJtVCVaMpF+8fQrAVExFwj+/bUsvyGqJMA+rn
4BZxGQTN3phftmFr+WqmMkAIE0OZ76zw5ecjBshHowoI5ML5vp1FZb7BPb1AMLuG
Py6n54F0xc1MELkBI57huZVN/xGAbVdoep0I6RD2wkPWwjIBw3Tn3O5JCmfXZiV8
EjEgDJ/QQGXhZ9TeAqcS6YQs0ldbLw==
=Wnx4
-----END PGP SIGNATURE-----

--FTh4xEuQT9kCRZxi--

