Return-Path: <linux-media+bounces-13204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA876907834
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 18:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9BD286BF6
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 16:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535831474D8;
	Thu, 13 Jun 2024 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuMeOK4A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4D712D757;
	Thu, 13 Jun 2024 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718295780; cv=none; b=DauOiuuBnmoqluIhNDW60fddMRCjYIXUIls2FwDnhIhe1zojxOnYnjxVwREBGki5aMbS2vEV2g+9dbM8eJDBH1x4tUtZtdUMoYBkNh0L5dnY9cZtxkOW9S4pqwYDNkZ0ksOQWlLE+61PT5AKhkjWr/Us4Zo49q7+rv5EXrKrzLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718295780; c=relaxed/simple;
	bh=CaSs0G8SCymztITpnEmaJu4oDolKWOuq3R35mdA3tSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eo7IqwjOxilw0JY2WrmVLqbnLRFm98apsNRUfK8ap28N2F4inbZyzP9BT56lrewU/Lysfo77XczQA5+7nhsqWqQrmSrTGDSTVhUWY8AoqcpqhpuMPnzh8BS7Z6vACHLCDBhz/s+R9323NNxGBC6Sp3Di250Qx020WkDBgbTn6tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SuMeOK4A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1E7C2BBFC;
	Thu, 13 Jun 2024 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718295780;
	bh=CaSs0G8SCymztITpnEmaJu4oDolKWOuq3R35mdA3tSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuMeOK4Ae2gyFrmprMHhPo1xo6LSMBDurIm+Bhl2d4jtSU0w4XjJe/f4p+SOy8Y5/
	 IIRYkGMY6ESQcVyoQ2E7FJ5w+fmkG0kPDE2eyNMpwhXsDrcMybCPeg76JbDxT9Z75F
	 ewMR/WlxiyRkV4LLMj1gYtlNeBTED2qoM1IsmYUoXXnl4cL5ZzdKwycxcu3fbOs0cv
	 0LjSFS1jZvZkoDWJRL2H7lkoL9qQCJxxEWTjBbFqzKcTb/ZYEN/ny9BYuGp77iM5th
	 TxiqeYf0got2GZkr7dqpwZgEodLEgTKZuYDEjaMOKaCxfT+nyasLGGVuN7+JKxRPwf
	 aUl0qkSeb1QPg==
Date: Thu, 13 Jun 2024 17:22:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v6 1/6] media: dt-bindings: rk3568-vepu: Add RK3588
 VEPU121
Message-ID: <20240613-cresting-septum-60086a69f5d0@spud>
References: <20240613135034.31684-1-sebastian.reichel@collabora.com>
 <20240613135034.31684-2-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kE+syxWACWgZIXw3"
Content-Disposition: inline
In-Reply-To: <20240613135034.31684-2-sebastian.reichel@collabora.com>


--kE+syxWACWgZIXw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 03:48:42PM +0200, Sebastian Reichel wrote:
> From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
>=20
> This encoder-only device is present four times on this SoC, and should
> support everything the rk3568 vepu supports (so JPEG, H.264 and VP8
> encoding). No fallback compatible has been added, since the operating
> systems might already support RK3568 VEPU and want to avoid registering
> four of them separately considering they can be used as a cluster.
>=20
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--kE+syxWACWgZIXw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmsc3gAKCRB4tDGHoIJi
0mj7AQCv4rlubtb0cKZKwFzNNoGAdnbist3T9iqEa3NB16WrfAD+Jqf79c6F+HbV
7Vsb/Cx0dtWN57PjSuAwDRU5t+awIww=
=BcWx
-----END PGP SIGNATURE-----

--kE+syxWACWgZIXw3--

