Return-Path: <linux-media+bounces-36300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F066AAEDFBB
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05D603A3463
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EF828B7E9;
	Mon, 30 Jun 2025 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="pmqQ+Wq3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C+M5HKtM"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF7125B2
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291833; cv=none; b=WpFjLGWlUPCyx/QHrIjyBvR+L96dZSqKRvr2/Ywnywjn0z4Z7YVC734jZP13g7G5n7lUyEmeiK9L0Z/aFm0YryHgeSpzEoNRH3oh1EUFszzeCIZDG8HhDsB6Xh6H/5dKuX40SaqfP2nKX6VhwsibbmqFqINGv6p5gI2zpYuZHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291833; c=relaxed/simple;
	bh=wUM/2sUFun7K8cGamDcRNmQbJDJGAfRzp//NqORjxfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjeCOWdGkwMsBCbXvSdS/p0odJ8mflMygTflaSFIRe8NVHgp7dcoPJmHwHDlfM8Ez0Qba7wH04r14PZTrMpfXy4sF/GlTENOmI594bGPJwFGmYyY65rxOrZNPVMilrHD3BDMGdga2m3S58zWVH/O4J4iqhu4GPgaBwKrlkdIhsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=pmqQ+Wq3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C+M5HKtM; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 0C56DEC025A;
	Mon, 30 Jun 2025 09:57:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 30 Jun 2025 09:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751291830;
	 x=1751378230; bh=RO/CTot1G85d7HVN5Fxu7zJk3NPNAVQtaJ+laR5vwV4=; b=
	pmqQ+Wq3vQ65AzqM2BMw9/bRvyryg4hUrJQr+zVSxVp+cTa8jv8S4qixcPgmkrhW
	rxiuD566YqRv02CQBdbBtmGsK+KxO0CZYKLVsS4ZiCQaZi6x4mjBNSUZDRhLsbot
	hbaeKfDXpLjB50tIjaVXh+enGM79/4e6S8YCL4DS5f2g/OhYKfGIvYAYZYZeYqFU
	1pzXdlNuYA+66XjRAMF0rivaAV50JIQNOAH1VVe4mfgVUPT3jSCNSpgA2fGAJqu/
	+mA3k2b2B/Rfcbywj0VG9do1WUcJ5zPe2iYHizGpzjq1J7XZVj0IiY8Of+XJk6Mi
	hdK6KR57+rbVK4SxBDiVOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751291830; x=1751378230; bh=RO/CTot1G85d7HVN5Fxu7zJk3NPNAVQtaJ+
	laR5vwV4=; b=C+M5HKtMFXZvfYZotPqxfOOpG72s3Iy7cApEdSfBTqwN9LxWFgc
	4ceZzLfBwYforXnX2he1esJJp1CC4TkruvU9uSShKIItFiQkdMz5L0CXruaq4WK9
	hsytSq51o/3yxuSLh9HfT4cJfnuOuDhdeflysuqDj74kkylzZ3O+s9p71T1fpyXx
	6bKu6HMFKWVehL2cNfSH0zjX6DX74Mx8TG65ShWngggn+mCRcGUD1lIIVgXvZD4X
	XAkeEgYi32xW8zxehr5XI/eaxkrC4AVhkszlO2wpFJfoZp6zFCaR5SLvTVnO9txq
	B2tqRpeeAYu9sESG9x25r6ywmgsRnE1oqeQ==
X-ME-Sender: <xms:tZdiaNH5CMnNQDZ4rvUvOiP1VI_2LaolftaReG3EdlAcX6OJWTtqBA>
    <xme:tZdiaCVA5nuiUYCsFLQhgdWvFb_qEvHgf27n0k9-jSL-SrSsiPHGxy1uiANGwRLkj
    rIUR0U3yWaqpw>
X-ME-Received: <xmr:tZdiaPLlJs498mL4h1ItmWPK0sKzzQhh9BAjm3nRQPkLbw4vS4VQRWrZ-TXr3RXKYZXVNl9JV4ftTgwaSA7ul73rCYzP9fjTq8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekkecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:tZdiaDHAItVwDheOO1NsRCW-nhFtEq9Kavp1xAbU-e_HzTqRX8T1Eg>
    <xmx:tZdiaDWf599MyWzH9-Fd9Y6pPCNd6zMBxm0E6bhYVrpR38quwY_yPQ>
    <xmx:tZdiaOMDa6qGR2spSccipvP6GCiN0hPyNCtBvbeJQRB3TimiQ-YL_Q>
    <xmx:tZdiaC0r8JaM9kFfVk3QNmIN_U_jrHF2TJ5nXOgtkInpX0cMnTS2hg>
    <xmx:tpdiaCw3WTgwFH7f04XryDOT1ahjtg_VAQbLj9xdOGz9i1xFPnIdoLc7>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jun 2025 09:57:07 -0400 (EDT)
Date: Mon, 30 Jun 2025 15:57:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Shreeya Patel <shreeya.patel@collabora.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com
Subject: Re: "signal is not locked" with HDMI RX driver on RK3588
Message-ID: <aGKXr0Z96zGU74q6@mail-itl>
References: <aGKFhDmBwYp5KV3k@mail-itl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l4+SkBL/ikK1rf4v"
Content-Disposition: inline
In-Reply-To: <aGKFhDmBwYp5KV3k@mail-itl>


--l4+SkBL/ikK1rf4v
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 Jun 2025 15:57:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Shreeya Patel <shreeya.patel@collabora.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com
Subject: Re: "signal is not locked" with HDMI RX driver on RK3588

On Mon, Jun 30, 2025 at 02:39:32PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hi,
>=20
> First of all, thanks for all the work regarding upstreaming the driver!
>=20
> I try to use it on two boards:
> - Orange Pi 5B
> - Rock 5B+
>=20
> In both cases, when I use the upstream driver in 6.16-rc, I hit similar
> issue:
> 1. `v4l2-ctl -d /dev/video2 --set-edid type=3Dhdmi-4k-300mhz` - this works
> 2. EDID is properly presented to the device on the other side of the
> HDMI cable, I can select to use that "display"
> 3. But then, the hdmirx complains:
>=20
>     v4l2-ctl -d /dev/video2 --query-dv-timings
>     VIDIOC_QUERY_DV_TIMINGS: failed: No locks available
>=20
> And kernel shows:
> [ 4033.823023] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_wr=
ite wait cr write done failed
> [ 4033.847027] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_wr=
ite wait cr write done failed
> [ 4033.870976] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_wr=
ite wait cr write done failed
> [ 4033.894998] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_wr=
ite wait cr write done failed
> ...
> [ 4061.975400] fdee0000.hdmi_receiver: hdmirx_query_dv_timings: signal is=
 not locked
>=20
> In this state actually capturing video stream doesn't work either.
>=20
> I tried also rockchip-release branch from
> https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux (at
> 33755850faeb0e53e634390d147cc261a60d2898) with the same result.
>=20
> If I try the same with the 6.12.13-current-rockchip64 kernel from Armbian,
> it works fine. I tried to compare the drivers, but there are quite a few
> differences so it's hard to spot any obvious issue (it could be also an
> issue somewhere else...).
>=20
> Any ideas? I can try to add some debugging info or test patches, if you
> point me what would be helpful.

If I take u-boot from
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/u-boot/
(rockchip branch at 60501605e3f48b155af83193dfd9ad73362b8e25) and stop
loading device-tree from a separate file, I get a different error:

    VIDIOC_QUERY_DV_TIMINGS: failed: Numerical result out of range

(and no extra messages from kernel)
My goal is to capture in 4k at 30fps (or even lower), but I get this
error also with lower resolutions like 1920x1200@60fps. Unfortunately I
don't know which value specifically is out of range...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--l4+SkBL/ikK1rf4v
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhil68ACgkQ24/THMrX
1yy+lwf/QSb9Q+yBWrlMM5wWlcpjxBedy01AtIzoqFia/hdw4bh0tpNKussBaxCx
04nz4Bjg8brNp3PiFeN+/GRY6qtq8bNLwsEHeeAoPn/NrP91HCpNd+v/x+fxPpY0
U2xYIws2T6N3HEGSx1btN+c1GNyzhL6nkXBkcuhEnjPIj+oxYF8qUtnOBd8JsTde
sM0/4H1ydb1NiMmJ8iQzkGyIAU1FlDP/1YJGIeQiEM8xJhiQFVJtFWBz069w39i8
bVtWsTbUa767aosSULdoisZrP8pxzNfeYFZeCVw+TDdhf9O9hwuR+w4Xi/ZrcIye
Acn+iNxtwYEg7BhuMMtJ0yi+eZx6gQ==
=7JNj
-----END PGP SIGNATURE-----

--l4+SkBL/ikK1rf4v--

