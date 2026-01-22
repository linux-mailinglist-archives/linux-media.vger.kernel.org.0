Return-Path: <linux-media+bounces-51364-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yA7ECkNucmlpkwAAu9opvQ
	(envelope-from <linux-media+bounces-51364-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 19:36:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 769156C86E
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 19:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A1E6302D3CE
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 18:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF3531282E;
	Thu, 22 Jan 2026 18:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="sqySYp9i"
X-Original-To: linux-media@vger.kernel.org
Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8078B36CE06;
	Thu, 22 Jan 2026 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769104914; cv=none; b=M2ypeBHdxGimanZ0ExWlQiBncW7UaEXAuhV1vAZLKHG/PUwMSGQ/HyGVY8lZnzvfaQD9ndQMMWZWIeFrf6e9XxPo6Fp1/BlzCTufbHZfk0dicuZTvFlCzE72HfesVIjQVGxcVSDRBL9giUoAiG2NL0qjbbGUw4RXwuL3zg92O00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769104914; c=relaxed/simple;
	bh=d8MWN97v/uvNybh70ijB/cHsXFyop85ZOXdJWGGWR64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6aBh4zJhtF9+pdYQ/K7aPY6wGxVqkypR8x3BLE1NtgVsxYAfvdLdWOkf59PB2rkrVEMcaxjXDBk7r2WxUyd6NON0Z8Zd+hns6uz/ziRTrOLZwlhSbXPDB9MVc6biamorU2DrVC5Sz6gnCUFz6SDV7V5fv3L81nLt1gGl8ZJbR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=master.debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=sqySYp9i; arc=none smtp.client-ip=82.195.75.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description;
	bh=d8MWN97v/uvNybh70ijB/cHsXFyop85ZOXdJWGGWR64=; b=sqySYp9i9sGp71ItAgpu1cEMAA
	wBSTzHb2KfKYjsiRcc7jz3IhJOpFKToatmLMUdUoO9Oj8btAv+7N1EiAw+lWWWld82sEq8FzgrfF6
	fup5Wws6g45a87F/S4c2uzRIGRCCFEguLIqsERGdyQKFs8kVQtl2w6KgCgUW3dEfqnduvSAQlJW41
	MUrybt2CGMU20i6gjV+suGGwcV3jon1+8MsdF5XSPTlTnA8/72X3ONCs+s17xxWT7wAWIGkBE1ELl
	4dCuuKFpgk4G5XD8cI5SPNTJnQSbAO3CkeCWXxBXkoBrWnuPrk6wLCNYO0J1yFSxM01hv9sf3vtoC
	RPEMwFew==;
Received: from ukleinek by master.debian.org with local (Exim 4.96)
	(envelope-from <ukleinek@master.debian.org>)
	id 1viye3-00GB9n-2T;
	Thu, 22 Jan 2026 17:38:59 +0000
Date: Thu, 22 Jan 2026 18:38:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Ricardo Ribalda <ribalda@chromium.org>, 1121718-done@bugs.debian.org, 
	Ralf Jung <post@ralfj.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, linux-media@vger.kernel.org, 
	regressions@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD
 Pro Webcam shows flickering artifacts (sometimes)
Message-ID: <aeflgf6qtiqxodjdj7jf3qth6fg47p3wkmiunfpsk7suruhh2s@eud4pqticxxn>
References: <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de>
 <aVfPmZ8rUm3Vf7pT@eldamar.lan>
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de>
 <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
 <dc4c95e6-d19d-414a-a7ae-401dacbaebfd@ralfj.de>
 <CANiDSCuse+=+MrDUFc_Sd1zXvtY9TDrX0GF6bs2_w34b03Djkw@mail.gmail.com>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <CANiDSCt8KFH7d6cc4zTpf10F4G=O6vmZiSj5pPC0q+_e90Cjpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bbjbywci6sy4cwzq"
Content-Disposition: inline
In-Reply-To: <CANiDSCt8KFH7d6cc4zTpf10F4G=O6vmZiSj5pPC0q+_e90Cjpw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.master];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[debian.org];
	TAGGED_FROM(0.00)[bounces-51364-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[debian.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@debian.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 769156C86E
X-Rspamd-Action: no action


--bbjbywci6sy4cwzq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD
 Pro Webcam shows flickering artifacts (sometimes)
MIME-Version: 1.0

Hello Ricardo and Ralf,

On Tue, Jan 20, 2026 at 02:46:54PM +0100, Ricardo Ribalda wrote:
> Another update
>=20
> Zoom has notified that they plan to land this even earlier. In 6.7.5
>=20
> Ralf, if you could confirm that it works/doesn't when zoom is released
> I will be very grateful.

Given that this turned out to not be a bug in the kernel (and not even
Debian), I'm closing this bug. Even if the new Zoom release doesn't fix
it for you, this is their problem and not one in the kernel where we
could help.

I hope this is ok for all affected parties.

Best regards
Uwe


--bbjbywci6sy4cwzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlyYK0ACgkQj4D7WH0S
/k4A1Qf/SW2B0F+I/eo1RQZjXIcUACVqBLvahyuzoN0+pz1I/k9oeZlyGMEzY+W9
1sciy3aeCu5khydmRT3REhtt52Lwif4XjLR8GD6cmx1HGayqkwo9rKk3IOopMveF
2GsoPJQoJR/ygpMoIFSb1H/uZGrCCpK07rY9+S0belWM83g2wa0/yeEwOkXHi5i8
o6NkJspV7rX0+XAm6lT6NuHrOcMVUgnOqg4yQYE1kr8dSNcGwi5RrEWvhFOEhfOh
tkD8MbnUJ3r3aDfyhaBQjCHzoMRQu3kLOT2RqjKqqrZOlvTY8vomr9emhT9S9CpV
iyjkIoa2ZPot+Fd9SvaLVChb3HYC/Q==
=IBWS
-----END PGP SIGNATURE-----

--bbjbywci6sy4cwzq--

