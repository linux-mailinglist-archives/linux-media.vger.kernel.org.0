Return-Path: <linux-media+bounces-50662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D39D1D9E3
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E640305BC06
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2B6389464;
	Wed, 14 Jan 2026 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lFL4gl/M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5130E38759E
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383355; cv=none; b=puzkLEzFYSCdwzI25XulbDpjXKc5QhF6svg493J19HxNQ6gHar4bjjbY7UMWwjVrT6DnLgkg72nl5yj/hhquYFn59Zbx51zXVQymBiTnmtZozipcs2IAvha05uvcw+rUm1jmMf89CtROeGD2jZYozKk14HmVKygs3ITuMrLn2JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383355; c=relaxed/simple;
	bh=oKxV+qFfS5FKXfTYiYm5FYHxvb0DygVGOo+vPqI0fgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYSBeFtvQ22OuzsAFVOKV3xAuTOYhghl9reJDum6HLjp1EY8xAqAvjzUw/aYb3uut0E1I6Ls5YE2GExla+R1TpiOgRQrJ9E5DBXaQjQQBe3UXNwTAeaS4xJG/ZlyKkKs5IblhUY07Fx28Mplke7dEJQDMLoNPW1t8K5iM3SVJpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lFL4gl/M; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=oKxV
	+qFfS5FKXfTYiYm5FYHxvb0DygVGOo+vPqI0fgM=; b=lFL4gl/McjXD1sWRa1jH
	HeIc/7dIfVFpz70s9IOcucJa5FbpReYs2SQaxEkM9E6zSqbckRi4AjS6AlNJNSjL
	3W+ha7jDa/jtBdPAb+enVK2Spd0hMtQYSHE/PZei4jeXUCkemZmGx3+XMpiLVJfI
	iJmI7UQHTjymD2nlZ7w4Bz9XEr2u3SO4oHhdGgKRptO7Xlshj1bJXha44kkipgWB
	EPdEnxUNV+f3facc4PkJrKuadV2mBLkM2hoY0eInAypFprC1ZvMFFypjEYO2LKa9
	TgMKlh4p+ODDPlHZx0MsHbJfypoxxVdGvsAgupneA3Y1GTHJGF8RjfhkMg+9Bb5T
	rg==
Received: (qmail 2063917 invoked from network); 14 Jan 2026 10:35:50 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 10:35:50 +0100
X-UD-Smtp-Session: l3s3148p1@Dudt1VVI9oMujnsM
Date: Wed, 14 Jan 2026 10:35:50 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: saa7134: rename i2c_dbg() to saa7134_i2c_dbg()
Message-ID: <aWdjds28O6Ph76_I@ninjato>
References: <20260114080913.11960-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lSZ1+T9APsegSC8C"
Content-Disposition: inline
In-Reply-To: <20260114080913.11960-1-bartosz.golaszewski@oss.qualcomm.com>


--lSZ1+T9APsegSC8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 09:09:13AM +0100, Bartosz Golaszewski wrote:
> Ahead of introducing I2C-adapter-specific printk() helpers, preemptively
> avoid a conflict with the upcoming i2c_dbg() and rename the local macro
> in the saa7134 driver to saa7134_i2c_dbg().
>=20
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Great, thanks for the update!


--lSZ1+T9APsegSC8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlnY3YACgkQFA3kzBSg
KbbEEhAAsQIGxMRyGPYU7z6RxQPsDC1F6bCHXqt5n+fIpN+4trQvFRoPK5niFYEa
BE1MnyMAo+Gbch7y76n8pGlLD1mgp/Fnz2mQ7K/avIHHT0B5M5EMWjQOVhCs8a0J
8nEEUiMjfczRtLUvzFW3m/oNRvsyYs7t7UkaphXd56WzMS8IrkVe1iTAMcbJeU4o
mrq+mtMv7YT+v1KxoEpop2uGBtAEBsY0CgUZsJZ0paTH8QOxlZ2zTjVGd3SEKulC
aqxk1KE+TQWB0IMXeCez/uhvgZTOmsMY6LrCDqFYrOakmP114izT7Zd89KlEAzbf
LLa5Rga0AThMXtAXDHqZO/J+p0NOLfgN/bCU2viiOY1RRencpXpDNgUT0/5kIvbh
8rO2AP8EmZLdcKfl/FBOryQHnBgcNEUO7YdRW6yYRwWL1sZarj1A8wCbgPGpRd8P
bD+yHmLUzBEYSpTWqNyVvQXp8vxaZhp3t+g+6Rj/8tbP9HdSaTEIdoTG/xUQtLot
n0H1weJIFNKXPAX6xMZ6085OpwXBwg7VSVrJtX1jDNUPf7TtXchGym4sGQVwQM9D
OXYLD+eJFpogHLo3eiVk1f5UYUF4Ism6fS7ZA9K2G34NvarldL2jFUir8iNCgWNu
7hs4ypVVrK7QMh1+j8wgMp2KPB9LkDo4Y24ItTlC08dMM2fX1zE=
=pfTZ
-----END PGP SIGNATURE-----

--lSZ1+T9APsegSC8C--

