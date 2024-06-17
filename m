Return-Path: <linux-media+bounces-13426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4AB90ACFC
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 13:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE050B22460
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 11:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF92F194AD5;
	Mon, 17 Jun 2024 11:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hnqAzZCi"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B442A193065;
	Mon, 17 Jun 2024 11:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718623856; cv=none; b=fx2V47F35SusV/K3nPo7jaBSs4o8VpD6uLoPqwb4nChp5A7t9EI4Kfc2wDjno+Wde8ufNvuHh2D3BDW0ThbZ3XXcJR065s1L8efrSzn9YbdrAesx2aK33UXiFeZBv09ETBf1d01vdeiEM32rP+24sX950ipLogCzWlwcoumXxbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718623856; c=relaxed/simple;
	bh=HzBwIhrvBDEM5gpG4WaMTS01iW2I1HhXUnZuP86SIlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLJuHiuBzoV0MzV715qrXHJHWh58Uri9P22ELbVmKdHcR6n1tlrjCnpxmiI0SmqGDUEgDX9RyqDteFhQppyHUR2EyZme9k9SHTMRbire53DT4U0wI9keeJnvoiv/x8zqfGpC+YhzajE7gHJgfKHDh2e9VzfTQmJv4Do5UJA+BVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hnqAzZCi; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718623852;
	bh=HzBwIhrvBDEM5gpG4WaMTS01iW2I1HhXUnZuP86SIlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hnqAzZCiyk1aGB6H02eNX0ndmijhYXmeo8UhmiPnvoqkJ/Z8oNxbyDYrr7gqz+U/8
	 FQaragdjVfcnexMovURVKJPysXA0KgPY4ysd/8kLXIdGkj/RIyTDh2Uu6ig6XEKQp0
	 YkjZx9CViut6Mp5jAbyw7+1j7dhozmCO9qJOlbb5h0fM7c1HZSZzbE2UnsEQw6aG7n
	 4BvNkU8cvT+9ACjNXIZPTgeUMHl9FlIFm5ngHbkec9vBYroVE4eIYBhFFHJYwxjsew
	 rGZEQ+auVWYN3Mdx9M5HoN523vzdbtKAuTMX3nMG03mH6OxTrenBH/fWtAVoqJKKyN
	 7QB1p2bjBYN6w==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D73A137804C8;
	Mon, 17 Jun 2024 11:30:52 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 72F681060734; Mon, 17 Jun 2024 13:30:52 +0200 (CEST)
Date: Mon, 17 Jun 2024 13:30:52 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, 
	ezequiel@vanguardiasur.com.ar, frattaroli.nicolas@gmail.com, heiko@sntech.de, 
	kernel@collabora.com, krzk+dt@kernel.org, linkmauve@linkmauve.fr, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, robh@kernel.org
Subject: Re: [PATCH v6 4/6] media: hantro: Add RK3588 VEPU121
Message-ID: <o6iccgurpi7sraq7plxaccz37i44te4jaqicnp2nqbke2qtskh@4kboulg3zywx>
References: <20240613135034.31684-5-sebastian.reichel@collabora.com>
 <20240617025022.25122-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4reipacbikci5md7"
Content-Disposition: inline
In-Reply-To: <20240617025022.25122-1-liujianfeng1994@gmail.com>


--4reipacbikci5md7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 17, 2024 at 10:50:22AM GMT, Jianfeng Liu wrote:
> Hi Sebastian,
>=20
> Thu, 13 Jun 2024 15:48:45 +0200, Sebastian Reichel wrote:
> >+	{ .compatible =3D "rockchip,rk3588-vepu121", .data =3D &rk3568_vpu_var=
iant, },
>=20
> rk3568_vpu_variant is decoder's data, typo?

See first sentence of the commit message.

-- Sebastian.

--4reipacbikci5md7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZwHmgACgkQ2O7X88g7
+poayg/4kaCjw30iGYWhUbN3lrFew1L0jfg9s4DrgwLa4Mni+dk0QDVauaYcZPGg
BAEDHvhkwbFY8yBkzuQLu3UWBdXDwlj9BpOtVT25kHorgUe9ZKmUuiAeFkjWjYC6
66dNjUPhVtMcbrVvdw4iRTfX2ADxjYfF92yPMQ9uOqkMWThV7lshwWTRgOCbSsm7
zs8VH+RLwdYIAGm6GFVJsZsDG0sHnalPd3q/Jw6wwZvnaLP6d5rGsC3I56vOOH38
9vS/EuJxrKIL6cbWTrNkY8V4JHH0e83zoLcR+XdwVaJ2Yilqi7EK50JI4UyfIJ2L
/poeWNwHc57BigUlOjpCzNC8D9748NDMz+CqPnDXJlxGU3MK6ugq6e41nurC++DL
9uLk+mlGxoH0A+SuakrzYms+xD0NsybpA42/R5n/pYHq1+PwTezb9j3U6/b+blj/
GL5C7/dwV1MugPOfuWpzCaBWkfHZOZDU603CamBAAk/RmOgcvgvIlTOh9/JJBxVr
2zfmfnrcd38hGeOPIqdT3P451zmqKVBMaDdgJYvWxMt9pwu4M9/wRYIvJ8vAppad
LrBMtILqCCfj5zW4Lqmv72Fwn9DA+dJs8ca9OYZVt+G4b65RBbxQ/0gNKp2qWLXa
HAnDmSyVBsrP3tJq4BDCn236mYV8m0crsPmSOpmWXZv5NLjAPA==
=KuxJ
-----END PGP SIGNATURE-----

--4reipacbikci5md7--

