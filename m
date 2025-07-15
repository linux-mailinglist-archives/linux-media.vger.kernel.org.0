Return-Path: <linux-media+bounces-37754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3324B05504
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B48E7B93B3
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7EF2741BC;
	Tue, 15 Jul 2025 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="t9UsxVY6"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82ED23AE9B
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752568509; cv=none; b=CnET+KSAuKM277Hgghnfb8wNwfCi0CLCMl/1EAZPRNJ3ZbA/5mip3D/9dun3A7vd9lz3JGKJkHLL+2jOUNbbHg1Bf0DSRiMqzaArbZVZM45r9BualxWqsHdN60fLGFurIaiAKIhuofcOEEe0wRCcb0U0TVCTWFv8Wn7PHMEnrgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752568509; c=relaxed/simple;
	bh=XkoIQdYynJerQZMgPKT0cl53oqkg5SYxoX6539H9RBE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=j+CqE/QA76Gd6kia6xMU9EnahKThczO5OP5on1PmZC1HIexBvXkCFA0vqhoO78lpT5vQbhixm9liTDQABn16PImibgGM0UJem8hk/+YMzTGN6TP0QPOBCQU+dHP5h8sM0CgoFsDprKTQ4ao5Y9LAfGl4S8TafdvSqYpHDfdQNHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=t9UsxVY6; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1752568494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dn9j9avwFidQxU2bCX0UIziQTEnB16DYh3Wd/7lUs1Q=;
	b=t9UsxVY6mXLFPCJpyr5YZ/a+GWum9nHB2cHNy+irWcyW8uPXld7KsWybnukiHlRBofOCVf
	w4AgPUuSUsTRsUrcZlP26RteB+xEZgFHE8yX12cnAb8g8mesnWWu7vKMXI8/T86OBOX+/E
	l8M5SdeVR+5IsGx07C6IzsYhKS9Sc6dTXFPAXQGJ1gz9/M47KnhGNBzm8HdFIIOuMbvl8V
	3dBDkvtZFiQDPpxh62HhrYFttoHOq/vhKSz63/okaXVh7vLtyByb8fNyhQjuJ0dba9Fb2k
	XAolqQq/V429pazWA1JEX78DbAR9B89oaUwjNQf1cWnwjF6hkzrvzg9PaqwlVw==
Content-Type: multipart/signed;
 boundary=31e8725035cdaae867651e5f629dfe5e1cdfa919bc8e4b5fe9769c11329a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 15 Jul 2025 10:34:43 +0200
Message-Id: <DBCHOEMXSOZW.JRB0UTWSPG4J@cknow.org>
Cc: "Heiko Stuebner" <heiko@sntech.de>, "Kever Yang"
 <kever.yang@rock-chips.com>, "Hans Verkuil" <hverkuil@xs4all.nl>,
 <kernel@collabora.com>, "Dragan Simic" <dsimic@manjaro.org>, "Rob Herring"
 <robh@kernel.org>, "Yunke Cao" <yunkec@google.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, <linux-rockchip@lists.infradead.org>,
 "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Frank Wang" <frank.wang@rock-chips.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Jianfeng Liu"
 <liujianfeng1994@gmail.com>, "Alexey Charkov" <alchark@gmail.com>, "Ricardo
 Ribalda" <ribalda@chromium.org>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Hans de Goede"
 <hansg@kernel.org>
Subject: Re: [PATCH 8/8] media: rkvdec: Unstage the driver
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
 <20250623160722.55938-9-detlev.casanova@collabora.com>
In-Reply-To: <20250623160722.55938-9-detlev.casanova@collabora.com>
X-Migadu-Flow: FLOW_OUT

--31e8725035cdaae867651e5f629dfe5e1cdfa919bc8e4b5fe9769c11329a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Jun 23, 2025 at 6:07 PM CEST, Detlev Casanova wrote:
> The TODO list for unstaging being empty, the driver can now be moved to t=
he
> main media folder.
>
> Also add myself as maintainer.

I've tested this patch on a Rock64 (rk3328) and RockPro64 (rk3399) and
did not notice any regressions. And I no longer see this warning:

  rockchip_vdec: module is from the staging directory, the quality
  is unknown, you have been warned.

Tested-by: Diederik de Haas <didi.debian@cknow.org> # Rock64 + RockPro64

Cheers,
  Diederik

> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  MAINTAINERS                                               | 8 ++++++++
>  drivers/media/platform/rockchip/Kconfig                   | 1 +
>  drivers/media/platform/rockchip/Makefile                  | 1 +
>  .../media =3D> media/platform/rockchip}/rkvdec/Kconfig      | 0
>  .../media =3D> media/platform/rockchip}/rkvdec/Makefile     | 0
>  .../platform/rockchip}/rkvdec/rkvdec-h264.c               | 0
>  .../platform/rockchip}/rkvdec/rkvdec-regs.h               | 0
>  .../media =3D> media/platform/rockchip}/rkvdec/rkvdec-vp9.c | 0
>  .../media =3D> media/platform/rockchip}/rkvdec/rkvdec.c     | 0
>  .../media =3D> media/platform/rockchip}/rkvdec/rkvdec.h     | 0
>  drivers/staging/media/Kconfig                             | 2 --
>  drivers/staging/media/Makefile                            | 1 -
>  12 files changed, 10 insertions(+), 3 deletions(-)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/Kconf=
ig (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/Makef=
ile (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvde=
c-h264.c (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvde=
c-regs.h (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvde=
c-vp9.c (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvde=
c.c (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvde=
c.h (100%)


--31e8725035cdaae867651e5f629dfe5e1cdfa919bc8e4b5fe9769c11329a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaHYSqAAKCRDXblvOeH7b
bqCZAPsEcQhHp1n/MQnvFCLsexjxPRpuv36uOmPgYq3iZ8tgYQEA8+gXctndsbuB
3iimQ6yPbpe40td5BCY2Y6XWce3fWg4=
=lFcf
-----END PGP SIGNATURE-----

--31e8725035cdaae867651e5f629dfe5e1cdfa919bc8e4b5fe9769c11329a--

