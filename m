Return-Path: <linux-media+bounces-13306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F36509099BA
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 21:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4FF51F22391
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 19:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804D560DEA;
	Sat, 15 Jun 2024 19:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KfWBE8JV"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A6D4965F;
	Sat, 15 Jun 2024 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718480711; cv=none; b=pifN1vJzjhLXtgh9lJV38bdiU1MxaBA4rdBVi4zOHsU80AZq2NO2EqEPSZiXcFUJ2FjWew/BsyxAwxm2K6//RmzwenwfIBjAN5tNklGyYXcNYl1+pqIKh0Ggo67Aw7RWwgupfXa90xr9TR2RTkwUNCIlPZAjQMVHyDGFxgPzmJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718480711; c=relaxed/simple;
	bh=6ge6kBsic43LaRUhVK+Qy4wNotbyA3ATob2zdjA5ig8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oP7wY4hBEyFCINgLYtEefuMojLDZgZnz2DMlMDN9Y8n34kEl6dehlGMEunETvUR0xrjjE2TJYYHROK/7GjvTQDjGg5whEkIDu7dqxCNnMCWmcCmhZolI38JrWVbpfk92ztZ0j0f8YGwTUcUK1sO09pnFM3XpUi0nqsc4+Ntvo+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KfWBE8JV; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718480703;
	bh=6ge6kBsic43LaRUhVK+Qy4wNotbyA3ATob2zdjA5ig8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KfWBE8JVWsokMFf3Z1wBEBl5fcvstJv2kwTH5NXXs/VQPIhETDPP5CO9EAZEdlhxc
	 01GUoQLqmGxViP8okrGnqbw4QK5kU5wJSCqh5sF4u1v0K7voXT9LaglTV7SyoO4E5q
	 6Afkz23M03w5zo3r6/rxkJvBTx67/fWLEPhK5fkLUrjwWT8UZOvdnvEfWU9RwONxkg
	 QEg2QhZhOq/AawrBvYkVgoXKcBbzm3CRN/AhvuXvl+q6fYwvjTkaRKi+QhRiLf5hNy
	 hIghj3RJ3JrdZzrje+ygyHv7gycxjTrDE2ZMiGp3dTpSHGmiWquZiw0r4QSnBsSNUv
	 pQ8Fmt8BV5Mjg==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 46F4837806BA;
	Sat, 15 Jun 2024 19:45:00 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Sat, 15 Jun 2024 15:44:32 -0400
Message-ID: <5969581.LvFx2qVVIh@arisu>
Organization: Collabora
In-Reply-To: <3333233.eAoTOS8U2s@bagend>
References:
 <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
 <3333233.eAoTOS8U2s@bagend>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3724567.ElGaqSPkdT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3724567.ElGaqSPkdT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Sat, 15 Jun 2024 15:44:32 -0400
Message-ID: <5969581.LvFx2qVVIh@arisu>
Organization: Collabora
In-Reply-To: <3333233.eAoTOS8U2s@bagend>
MIME-Version: 1.0

On Saturday, June 15, 2024 4:51:38 A.M. EDT Diederik de Haas wrote:
> On Saturday, 15 June 2024 03:56:27 CEST Detlev Casanova wrote:
> > This driver supports the second generation of the Rockchip Video
> > decoder, also known as vdpu34x.
> > It is currently only used on the RK3588(s) SoC.
> > ...
> > The core supports H264, HEVC, VP9 and AVS2 decoding but this driver
> > currently only supports H264.
> > ...
> > The decision to make a different driver is mainly because rkvdec2 has
> > more features and can work with multiple cores.
> 
> https://wiki.pine64.org/wiki/Quartz64_Development#Upstreaming_Status uses
> both the rkvdec2 and vdpu346 words and I *assumed* that meant that the
> Quartz64 Model A and B would use rkvdec2. The Q64-A and -B are rk3566
> devices though.
> 
> So is this just an (unfortunate) use of the same words or is that wiki page
> just wrong ... or better yet: does rkvdec2 support RK356x too?

Yes, the vdpu34x decoder on rk356x socs should be supported by this driver but 
I don't have boards to test that unfortunately.

This might also be used on future rockchip releases like the rk3576. But they 
all have their own adaptations. If you can test it on rk3568 based hardware, 
I'll happily add a compatible for it.

> Cheers,
>   Diederik


--nextPart3724567.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZt7yAACgkQ5EFKUk4x
7baMaQf/U5qjYueP/x3wLHQ5Cn6NXoSud1b5T+//Ia5e+4Y1qtap8KKbIRPb2UOf
xqKdIdkqQNXHRtXUmqW17n/cdJZY4EiX7FCsbJzhhKz1E68T4xYBKDOOlaq65GsT
tGOBacH4GqjYM21sSiWxcJN8lqzub3QH5gr3oKgXwoPr0W3yRM118BduS2NEX6W8
HAweihViOTdo8jZONG/YuQzQP6xo6Ld6uOb76/f3r0Z2c1zV8ZKAAPzu/xH+qZPu
Y4Ky6v/8r3u8wPSXv/qqwCyniD/QXTKc9HuIm+/W/W0Y2k5E/VkNo25wC0xt9o+7
4F7bLWZNM/XGFOGE00jLG0x7hZH8Jg==
=Vv2R
-----END PGP SIGNATURE-----

--nextPart3724567.ElGaqSPkdT--




