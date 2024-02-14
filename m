Return-Path: <linux-media+bounces-5114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2597185440E
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 09:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE7071F2287E
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 08:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B950933E1;
	Wed, 14 Feb 2024 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHlbOiAL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114D715B7;
	Wed, 14 Feb 2024 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707899476; cv=none; b=HwjKPxtSU8hg2lY4on2+g1Zb0eCY01PauBQo4aD+ZRuw/1p/kNclqyxV78BEicAj69EaJk0aqA8WrJbX+3z5SwiZmpKni+p5FRyTl8cMblsoCYzApOL48UH8utPS5SStEemQXP34IM52i+pADAHnlu6elOzLINydSjQUn4FIOxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707899476; c=relaxed/simple;
	bh=wB208u1QyFi5XhjfFH9FyJc9FZr2pgFxlWmJVMvuTfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhfMnFQpa3JOXj5GFFeQ+lCMehVoL+CjWCTGFokO30ys/LjwchTt03P1c4TQT+W32UIDH7Ddhrsl6TvJ7JKWIYOywVYH3kTipwgL9gG67Pi4QMDMNyyfAN86dRQiiKblQvBEz93z5G6G9/EuF/xKzh7TNvgnZBHh5QUqCB5JZxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHlbOiAL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23AEC433F1;
	Wed, 14 Feb 2024 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707899475;
	bh=wB208u1QyFi5XhjfFH9FyJc9FZr2pgFxlWmJVMvuTfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jHlbOiALTZ/tnbujXKdKEYpVVBEPAmEke1RL8CAv4Iyr3qC4BZN69kVXHnR2862SZ
	 QT9E8dIMFYdkhvp+gX/ILvNNV1UKYXFRf0vWsVIot4iBBfzy/o5wCXprsAg8Igvps/
	 aTNQHu+toKWtiXK4GvldJPw6On9MFB98KOKgL1/1upcCpsmnSFJsgvHDkVQIxQrqXS
	 sJ8rZm67d6KS+2UCLQBeVVBvPw7nkjUe3SE8Q2ORue7cXlOfyJ6m+/odnlFNAtWa9z
	 +aJek2OilAhwTBmwUhWNVjAOjbcwiDAYUGRofH+dV4eyskrevdJrGDDUYa8HJYC2HL
	 JnBUu/vu98U9g==
Date: Wed, 14 Feb 2024 09:31:11 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Biju Das <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from
 ov5645_global_init_setting
Message-ID: <Zcx6Ty2tu_ZGdURj@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Biju Das <biju.das.au@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
References: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
 <20240213140240.159057-2-biju.das.jz@bp.renesas.com>
 <ZcvsyRfVwC0aJ5fb@shikoro>
 <CADT+UeDNFBTvRMHd4_J85Yz0RYED4ioG9wjUe4C0X4x6LzVD9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SYDZGh+1LL6zN+xS"
Content-Disposition: inline
In-Reply-To: <CADT+UeDNFBTvRMHd4_J85Yz0RYED4ioG9wjUe4C0X4x6LzVD9w@mail.gmail.com>


--SYDZGh+1LL6zN+xS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Biju,

> I think it is different here. That 1 msec is delay associated with
> applying hardware power see [1]

Okay, ack.

> I will restore it.

Thanks!

I had meanwhile another thought. What if we kind of merge the two
patches, so the outcome is basically this:

In ov5645_set_register_array:

	If (settings->reg == 0x3008 && settings->val == 0x82)
		usleep_range(1000, 2000)

?

Then, we don't need to split the array and we are also future proof if
we ever need to set the reset bit again somewhere else.

Bonus points for replacing 0x82 with a define :)

What do you think?

Happy hacking,

   Wolfram


--SYDZGh+1LL6zN+xS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXMekwACgkQFA3kzBSg
KbbZ7hAAoySM9OelIY6w/zn2ylp+iQ9u6BEmiKoBO0x6OVJawYsESn54ixsnl3Yx
FIXPfULbjStr/utKXCj4P0i7FRvVI/RluSDeyocxevQbf5nxRk8dSHjj0nZOzdoJ
6ttxY+qj1BAZzirs2fDBNH99rkx/ykDmQlqD6Fjnc/XMJ91jJMenFB/dlEdnO9bb
mGzdWgUFFnETBMVERlIxyPkuu38hHeR+7VInlTsQzN8NCWhfk2gzYz93Rpz7WPqM
TSYuj52WYkzQx4Q/GTKCTjG3J24uSsX+Y7ZkArwtwJVNg58nw0mm6kwJvolcm/CI
P6i1/raMwOBNg1qcFSBq0QV6unf/0E+ONUPaFCzz5NB909VzersPFCxz+8MB61vo
yj8d7b7kaq66tKBpbK3Iba4WiGYrZDQVfUNy3aIxvPjYvLUfqBHXLtWuFHyQr0Cb
XvHYEvWtwLNwvDN3BMcc0y4NB5kyMOquK210Mktnx5KTiUaN1eYJvUE5zj2kpA77
ODMI0OxgIGwDg3rFHWCTMUFPqX7KnNku1/i9yBluXiGIdxsokTxdqEpWLUopxU5s
SHJ3KGkLcDtYjl+iOyL/hSTgT5Qy0Zj95HEjYob3PaXJgiVWpFWv9d0o0y5YpZX9
QKo4So6fMVc3kLRAO0109UqSNXkvhZMSQ0gTx8KGPzv3qCea92E=
=dc+2
-----END PGP SIGNATURE-----

--SYDZGh+1LL6zN+xS--

