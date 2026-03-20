Return-Path: <linux-media+bounces-56534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCXnKGtVvWlr8gIAu9opvQ
	(envelope-from <linux-media+bounces-56534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 15:10:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1527C2DB9D9
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 15:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6EC23151150
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695843AD53D;
	Fri, 20 Mar 2026 14:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMpCaTCc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51C839A064;
	Fri, 20 Mar 2026 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774015463; cv=none; b=KSatzAbHyxbbmLkYfSWaeb8ILZGSqcpNOXZVHHhtVfRsuKYsmS7odYJiSpaA+RPQhSiuCeBYZt8h7Ey69yvtZtHlX7V70Yg8WQhe4gZeRm1YepTlkmVXHIjvIkx1dOTMJ7td2ceBxtHaKNzoNsZUhE7D0MnmTi9wMt+ThQePIuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774015463; c=relaxed/simple;
	bh=p4oP3nyURCAzcweQTVMBiIvnJn7aASK0lOUGX1gwh2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQttMM+LU5CfwdMQTZTtaD7JgCTs29tkbJ3QegfHBHiBKsLxmG0TyUZDhIoj9e0S4aP76ulu87vaD9MOu4ApIEbXPzRLRO00cE9mae66Fhw2qRs+HbUwfVy/MVzZVg9E/0Zmjfbjdr54cq6TUTw1BYkVdfVEXrjUgNN4lKU8ZNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMpCaTCc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119AAC2BCAF;
	Fri, 20 Mar 2026 14:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774015463;
	bh=p4oP3nyURCAzcweQTVMBiIvnJn7aASK0lOUGX1gwh2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMpCaTCcDUGPNLeH+GDoGa+cMCxTkW2ksessdvoPR24IciQ8DCcOWd1l6O032ZG7J
	 019mKluSNWDtQ5xXVjvIQxGhelTyjpuVcEKZE77xx3E7T2Gfj4A9XpBe+5W4NENsyT
	 1/LJ2GI/XvBiVXLujRSTBOwi1C9d3M2dIl2NUKHLspaYooFPUIpTy3WV4eJgGnh+TD
	 21HfZVGJoDbMeN+ozbrwItFPB6nxqC8lUlHt0Khj7bq4NquJ0d/mVmAson2ALNh0Ut
	 PhGqbDb8QAdCeqIhtr1Ha8vsfWixdjo62dNoFN+4a1LOjh9NnyHVZtAZYQ+SP48Abj
	 5UvJhME/aRzlw==
Date: Fri, 20 Mar 2026 15:04:20 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v7 05/15] gpu: host1x: convert MIPI to use operation
 function pointers
Message-ID: <ab1TTxuq3XxaWRCw@orome>
References: <20260303084239.15007-1-clamor95@gmail.com>
 <20260303084239.15007-6-clamor95@gmail.com>
 <31e56301-2764-4d3b-bc21-555227248e5f@kernel.org>
 <10139201.lOV4Wx5bFT@senjougahara>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="np3tkwdvsekjytbb"
Content-Disposition: inline
In-Reply-To: <10139201.lOV4Wx5bFT@senjougahara>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56534-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.939];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 1527C2DB9D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--np3tkwdvsekjytbb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 05/15] gpu: host1x: convert MIPI to use operation
 function pointers
MIME-Version: 1.0

On Thu, Mar 19, 2026 at 11:20:58AM +0900, Mikko Perttunen wrote:
> On Tuesday, March 17, 2026 10:07=E2=80=AFPM Hans Verkuil wrote:
> > Hi Svyatoslav, Mikko, Thierry,
> >=20
> > On 03/03/2026 09:42, Svyatoslav Ryhel wrote:
> > > Convert existing MIPI code to use operation function pointers, a nece=
ssary
> > > step for supporting Tegra20/Tegra30 SoCs. All common MIPI configurati=
on
> > > that is SoC-independent remains in mipi.c, while all SoC-specific cod=
e is
> > > moved to tegra114-mipi.c (The naming matches the first SoC generation=
 with
> > > a dedicated calibration block). Shared structures and function calls =
are
> > > placed into tegra-mipi-cal.h.
> > >=20
> > > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, paral=
lel
> > > camera Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
> >=20
> > I would like to merge this series, but in the v5 series there was a
> > discussion about this host1x split:
> >=20
> > https://lore.kernel.org/linux-media/CAPVz0n0fkMYV-O4xWTBELd6HtKR83wrs+D=
S1wTV
> > DOXdWuAK2OA@mail.gmail.com/
> >=20
> > Mikko Acked this patch, but Thierry objected. However, I saw no further
> > updates on this, and I do agree with Svyatoslav that this patch makes
> > sense.
> >=20
> > If there are no objections, then I plan to merge series this on Monday =
for
> > v7.1.
>=20
> Please do, I believe we ended up resolving that discussion offline.

I don't think we did. I never got any replies to my original objections,
only some vague complaints about the current state of the code being a
maintainer's hell (curious that I never felt it to be that way, being
the actual maintainer of this code...).

Anyway, the damage is done, you guys get to deal with it now.

Thierry

--np3tkwdvsekjytbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmm9U+IACgkQ3SOs138+
s6FOgg//Z/cV/ZRKd5kqx1IYrzzGUOyufl9uQekK34/hH/jdWeymR3UNOpOYtRS3
mJujOUhekO3g52OGRo3RIf4Q5qsShd2y4NNmD+Fea0fN0nK76QN5hBopc+2oLah7
IXMbzU6w/GWSIVYWWeHpYYIYZjP6Yb8CLOBMNegbqyeln5Ui1C6b4Xnyahn44Na/
zGA1IGxDWwZTAwQZNy+nXT08LvwWbwheqKUJa35DLzL46mYEqRlj4DZiCvWg04aG
+qirQPdYTbfq/yL9pWPViVxTQGcHIygftcNSR9isSVqYJpEMv43luSIxmNYXJ/7c
yveuUieZghIhrq/KMc6eB/fpF822ANABW17b0yiT/uSHdGa+1zlwXd7V0Yy7COpo
n9bqKNCQidPIwj64uKey0FrzLoYjbWHosgxu2zJVBZepc2VwJJv0qCXXaF+b2JMg
uvkJgt4IYk0kHevCbTi+XzbU2BWGgxAqvRb1EHgFuR82LKSLSzYgj7PbF8vaMcYo
xbW5CecN4Z73kvaWzXwePx/l1NsQr1GsBMyd0+gldTeU/xjQj7I/D0QDj/QMom2K
JSWxBFSERbN+akweX9qnTyu0pqOsC791Hfs4yodq1l6uGATqW1OQ6ACZAb19L8Yu
RG8V0i5a2iOFpOo2E58hioCF1rKYI4b4Jn4esF0nnhFbSaJ81l0=
=c+mj
-----END PGP SIGNATURE-----

--np3tkwdvsekjytbb--

