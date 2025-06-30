Return-Path: <linux-media+bounces-36331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BAEAEE61B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 19:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94731179D1D
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 17:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0ED1290BA2;
	Mon, 30 Jun 2025 17:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="I5FdRRvv"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556C323ABB1
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305919; cv=pass; b=Z83GmnhAwUUq6J/1g8pYJVLvgKZgztyxOR6UHJgierC611FxClEhFf3CQmYIAeQjxYtCGDqIFP/mMwlv0msfukkMUgKLeRU+phCOhEbTydGUO4f/njtcBThbltqLuWyoRG3LjdU1J2jPGE+SbqLe5Fdl0iWQm70rRYgOIz2xL9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305919; c=relaxed/simple;
	bh=BcMd0WsYtOzHWgem1p61VuZFdisCfkdy5LAIvzNcZ8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+VUTkCHHYzbXOIfbKFFxOChVXhV276ncNwFZtwLrlr0rM9Lyrn3hLbOASEu8WymNjRaN5VR+54WLg5lvwfawwyXVLMWK05CaMJnVvFpTm/EqJesTLYKwb/YMV5vdRq3uShR/wi1+bEZnnHkx6HmxQmTxW7WpdAiHDEtMsumEEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=I5FdRRvv; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1751305905; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VJ9MmyiOgyamV4pjAqCdRoC9MlKXl9F6/tsK6jWFjdgWJ+zCMFo6JkTK8odOKrfTi+mZaQx9C3lSQYY1LlaYfvxJM4G0Tvxdh6pPkovCy/o8mii27bSY2aQMtfpdpCh2s9+yNOhYsksuYhOG1rl1J75yqpM9ZfoHuiYxLkGl1gI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751305905; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BDYbAacxyWQ707HfIlInVC+o+4iUe5YfN8e242xLQfk=; 
	b=a3soNhWHSm6fQWWypY/HRS9C4ldN9+tX+F+JrmgNtdpnAW420T2JwZjuIL2DtnUsBOEUM79uVmpwuiqSJEK3rGATsUvr8yHZX4qwJXODQvlnduZhDzrQxHh6NFRs6sbcxu2IRMoGuRWdJmjXChqKSWHtswe3MDPVA5CLnmySYoQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751305905;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=BDYbAacxyWQ707HfIlInVC+o+4iUe5YfN8e242xLQfk=;
	b=I5FdRRvvrNt8B2hFcVb+gXhhTcu1eY92WtzutlfPCqBUgbdjTyXRxJEzQN3Sp8pC
	T/s86GOVQyLXPekCixQZgEG1kAVaKInWGQq6v17k5mxam322p6PUM7lbpdUE9GnAjs9
	p+4xU4CUwFAS+QC7foNChyOOpfUCBLf1PU8J6Sz0=
Received: by mx.zohomail.com with SMTPS id 175130590302977.33523669450506;
	Mon, 30 Jun 2025 10:51:43 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 36F2D1807A4; Mon, 30 Jun 2025 19:51:40 +0200 (CEST)
Date: Mon, 30 Jun 2025 19:51:39 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Shreeya Patel <shreeya.patel@collabora.com>, linux-media@vger.kernel.org, kernel@collabora.com
Subject: Re: "signal is not locked" with HDMI RX driver on RK3588
Message-ID: <qazkvgdtozck65s2lstvxfwplhlvf3ynm5z6c6gdpgaytja7v4@f5gsnd7urzp6>
References: <aGKFhDmBwYp5KV3k@mail-itl>
 <aGKXr0Z96zGU74q6@mail-itl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="momx5acl2vgpgupg"
Content-Disposition: inline
In-Reply-To: <aGKXr0Z96zGU74q6@mail-itl>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/251.291.35
X-ZohoMailClient: External


--momx5acl2vgpgupg
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: "signal is not locked" with HDMI RX driver on RK3588
MIME-Version: 1.0

Hi,

On Mon, Jun 30, 2025 at 03:57:03PM +0200, Marek Marczykowski-G=F3recki wrot=
e:
> On Mon, Jun 30, 2025 at 02:39:32PM +0200, Marek Marczykowski-G=F3recki wr=
ote:
> > Hi,
> >=20
> > First of all, thanks for all the work regarding upstreaming the driver!
> >=20
> > I try to use it on two boards:
> > - Orange Pi 5B
> > - Rock 5B+
> >=20
> > In both cases, when I use the upstream driver in 6.16-rc, I hit similar
> > issue:
> > 1. `v4l2-ctl -d /dev/video2 --set-edid type=3Dhdmi-4k-300mhz` - this wo=
rks
> > 2. EDID is properly presented to the device on the other side of the
> > HDMI cable, I can select to use that "display"
> > 3. But then, the hdmirx complains:
> >=20
> >     v4l2-ctl -d /dev/video2 --query-dv-timings
> >     VIDIOC_QUERY_DV_TIMINGS: failed: No locks available
> >=20
> > And kernel shows:
> > [ 4033.823023] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_=
write wait cr write done failed
> > [ 4033.847027] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_=
write wait cr write done failed
> > [ 4033.870976] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_=
write wait cr write done failed
> > [ 4033.894998] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_=
write wait cr write done failed
> > ...
> > [ 4061.975400] fdee0000.hdmi_receiver: hdmirx_query_dv_timings: signal =
is not locked
> >=20
> > In this state actually capturing video stream doesn't work either.
> >=20
> > I tried also rockchip-release branch from
> > https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux (at
> > 33755850faeb0e53e634390d147cc261a60d2898) with the same result.
> >=20
> > If I try the same with the 6.12.13-current-rockchip64 kernel from Armbi=
an,
> > it works fine. I tried to compare the drivers, but there are quite a few
> > differences so it's hard to spot any obvious issue (it could be also an
> > issue somewhere else...).
> >=20
> > Any ideas? I can try to add some debugging info or test patches, if you
> > point me what would be helpful.
>=20
> If I take u-boot from
> https://gitlab.collabora.com/hardware-enablement/rockchip-3588/u-boot/
> (rockchip branch at 60501605e3f48b155af83193dfd9ad73362b8e25) and stop
> loading device-tree from a separate file, I get a different error:
>=20
>     VIDIOC_QUERY_DV_TIMINGS: failed: Numerical result out of range
>=20
> (and no extra messages from kernel)
> My goal is to capture in 4k at 30fps (or even lower), but I get this
> error also with lower resolutions like 1920x1200@60fps. Unfortunately I
> don't know which value specifically is out of range...

You are probably just using the wrong TF-A firmware. Rockchip's
binary-only firmware contains a workaround/quirk, which handles the
main HDMI-RX interrupt and then provides a virtual one on one of the
reserved interrupt lines. The kernel has to use the virtual one,
otherwise the driver is not functional.

The upstream (open source) TF-A does not contain this workaround and
the kernel must use the original HDMI-RX interrupt line, as the
reserved interrupt line is not doing anything at all.

The RK3588 device tree, which is provided as part of the mainline
Linux kernel describes the interrupt lines from the hardware and
thus needs to be used with the upstream TF-A.

Greetings,

-- Sebastian

--momx5acl2vgpgupg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmhizqcACgkQ2O7X88g7
+pr3MA//aHtskbkNlCI3Um9rJzetiZrmEtSohTFRPBKl9DtqpuC2Bl/hUAyhKJTi
viZPnW6P6gEYnxKSqFU4SjMbAs6YUZdnbhHu9/QswrgNny7qx89IXjRtv4wrUhqR
oE2ubQXoLqZ7BrDH4btPPSHi2N26hwFjRAvLM3/mC6T0UQYOt8B1XR3PKpM65Acv
CtgWlt0q63Kl3grmSC+Y7WtJ2x+xHLI1binHdLrKKJxYEO8xvqrS6e+AOjI5tXPU
0UBRmef75gxN5eZyyh39Gxv5Ihdfvlpss3Rz7dmq+EcGgTj9WemkVaypRgv4f3zv
S1Mx3lsn91ybXaPeMJXEaUCgb6LWaZE9XynhQzmS4n2FQFySsppHBT/sZpvPQeWx
KOSGNb8F+DFVy5QKn9XNCksL7RBBCo/nUD087d9bgF0jfvN4qmMoXxvZhA+Gh+Mo
mH4YhtliqxlbQ6TMB8qpe2WBCIVnmzIwu0M90BUmJ7e4GJ7yrGJkP+YWBcuvrEQ5
KntipvERe7xTndSkngZ0SUuu1a2Nn8lgbXkzmDnqoOXmBIk2x3Xk08hLhq/JWrRH
j6t12NkfcXj23DDhuIuhS4oJlkUcq5fUG7AYqgHJh0XD9THGcRBrpcu1Hycu1qRq
wfhqFwqbEI7sk3ViWWIfs+tcPHpKwguqncufWB4+hcAvCm7IiH4=
=JXuc
-----END PGP SIGNATURE-----

--momx5acl2vgpgupg--

