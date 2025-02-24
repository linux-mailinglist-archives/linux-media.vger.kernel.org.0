Return-Path: <linux-media+bounces-26767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F3A416EE
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A61B171016
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 08:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A35241671;
	Mon, 24 Feb 2025 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ttzm29QV"
X-Original-To: linux-media@vger.kernel.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220A517548;
	Mon, 24 Feb 2025 08:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740384660; cv=none; b=J6oRmoON5eMOdvSYmG4KKD2Q5odrfFs9Bi4OI9jO86p61eNT/fnuQ9pXo9g52hFi4JFZsuyLsarWkmvuBxMqZ9BRXSgurHqVf5Ts/6ihk7FbEDTCt5G6NMZkEatbwm6+b77xcKk9rKWx/V9KuXtp6MvuHClYBawHNDxLa1ms1Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740384660; c=relaxed/simple;
	bh=7kUXP1Ju/JmsDQNjU8+Zr14Xc2I2BXR/JTfJV9cfVrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMQBjKEzZY9K2Y3BiT2qublrB7tkcfAxx4K4wXnb2RFmjbdQwShcIGX3gmoVyptdy8dOrF9JwTle16/gRKqIETAybs09eR7sGW4rmGCCe/ty0Vm2+AAWrsBbgoThM7ogCpzTmhovHaTU3k3J/ropLjeiIWJgiD2rilgKjDO9saM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ttzm29QV; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 24 Feb 2025 13:40:01 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740384655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=faKgzJwVoyrlHudraf/LToNW6X6aLoeWuNwk1IR8b78=;
	b=Ttzm29QVzxaIFJiGywNt69jQH3E7waI2w0CeXVVY2FnI5QJoHGR7SR5giC+/OLfxdHmMYo
	7SlwFMoWFsiUHUbIm9uBqy/dP8XBDZMP7ilqPaUwOOZ8owojCnzuuiICU95b6IFH+8GukI
	IlI7kQNGxPbdqqbwRspmB50DTlu9s+E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devarsht@ti.com, vaishnav.a@ti.com, 
	r-donadkar@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH v3 0/2] Enable support for error detection in CSI2RX
Message-ID: <3vci66duq6uowpavyo7ovjqrdgde2zswmbs6xwo6xv4lxcpy7m@myrohugxcgxb>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250221120337.3920874-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qnr2ibn2hmcurdlp"
Content-Disposition: inline
In-Reply-To: <20250221120337.3920874-1-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT


--qnr2ibn2hmcurdlp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] Enable support for error detection in CSI2RX
MIME-Version: 1.0

On Fri, Feb 21, 2025 at 05:33:35PM +0530, Yemike Abhilash Chandra wrote:
> This patch series enables the csi2rx_err_irq interrupt to record any erro=
rs
> that occur during streaming. It also adds support for the VIDIOC_LOG_STAT=
US
> ioctl, which outputs the current device status to the kernel log.
>=20
> The IRQ handler records any errors encountered during streaming.
> Additionally, VIDIOC_LOG_STATUS can be invoked from user space to retrieve
> the latest status.
>=20
> Changelog:
> Changes in v3:
> - Address Krzysztof's review comment to drop minItems from the bindings.
> - Collect Acked-by from Krzysztof.
> - Address Jai's review comment to enable FIFO overflow bits in the mask=
=20
>   only for the source pads that have an active remote.
> - Drop TI-specific interrupt and have support for only two interrupts=20
>   that are common across all vendors.
> - Address Changhuang's review to use pdev directly to get the interrupt.
> - Set the interrupt mask register only if the interrupt is defined in the=
 DT.
>=20
> V1: https://lore.kernel.org/all/20250217130013.2802293-1-y-abhilashchandr=
a@ti.com/
>=20
> Logs with interrupt in DT: https://gist.github.com/Yemike-Abhilash-Chandr=
a/5bd2dfb4219686ddf389e94d563a2ab1
> Logs without interrupt in DT: https://gist.github.com/Yemike-Abhilash-Cha=
ndra/31d8c840b5a4f677fde88373defed2cb=20
>=20

Tested-by: Jai Luthra <jai.luthra@linux.dev> [on SK-AM62A]

>=20
> Yemike Abhilash Chandra (2):
>   dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for
>     cdns-csi2rx
>   media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add
>     support for VIDIOC_LOG_STATUS
>=20
>  .../bindings/media/cdns,csi2rx.yaml           |   8 ++
>  drivers/media/platform/cadence/cdns-csi2rx.c  | 125 ++++++++++++++++++
>  2 files changed, 133 insertions(+)
>=20
> --=20
> 2.34.1
>=20

--qnr2ibn2hmcurdlp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAme8KVkACgkQQ96R+SSa
cUUQ1RAAnmm1Y8GkB7fM9JgUvr1P8npWlgxNiPGB+9lZ8HKbBvJ4JAbgstQ4iga+
W5CktOvW7Ic4zoj9u0b4/8TUjpdVRgEq3FopFHx7DaexuH4rUPUrWwjYRfmKAoCn
OiJaYBwSKgEYbuh1IinaYovoOjouaHjwloguKIWLDASlMxyR4xqQGx+qEQXeVggn
BU9s4vHz/YddLVmLpqoOs2BH152vDL7O2XbFCrYh0Z0wYQo8FzNT0pFiiSC6k2k4
Nq0mhphwXRAQJuu659ES3N+B3udxtlGv3V9AJlL7hOW0pg82UVEOXEb6aS2RVrmR
thXW9D08oVx8rqAb3mLGKd4YmolOLJr2Z4RicbXRB9mXnJUd2rpz/UbsnmQ7y+g7
fxDlM8knjMH8tYzD2uDkP0jn/Bz7TVSa4paWccJ0oeNe7G9FLyOnNruwWmbCxF7+
zLvmv29JedeiGy2aA4oYoHiCmYDOlX+HmmaLqda+vsoDW/39bYAKxK3F0Y6VrFxj
X+994d6BcCdW5ujqTQAkntLTCWAkaVrruD4hZ9h4p5KZPVvFHo0y0/54OeB8RoEs
8rThUlMgOpx7ghzI822a+ghq+1AXTeqpoJsJ6WX7wf61lps5EuQ/G8VZnrtSN5sj
pzs6IVByyxS0ofr6R7U0rYhlwACopTz0Mj4xfGMoR9U5CZ+CxgI=
=LM7i
-----END PGP SIGNATURE-----

--qnr2ibn2hmcurdlp--

