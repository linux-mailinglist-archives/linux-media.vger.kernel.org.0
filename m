Return-Path: <linux-media+bounces-58360-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HAoA8nI12k/TAgAu9opvQ
	(envelope-from <linux-media+bounces-58360-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 17:42:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A273CCE4F
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 17:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CA613089ED8
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 15:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6494A3B52F7;
	Thu,  9 Apr 2026 15:32:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020C026B777;
	Thu,  9 Apr 2026 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748726; cv=none; b=XdkZ5l2cFf/eTJTH42Vv1tBqFAYR/ApXhobsM6Eb9pFtX47jeFhP0Qiw7KgPASAe6WD56YeB8fz3He+phQote1VhwNcHn0nVUtUNqGbJ9OW5WB3tEqiUK3LCDfvUJNUt3BZqM5p2v6u9Yqh+6neKFy7NkRq3mbMG+WeluNbgQuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748726; c=relaxed/simple;
	bh=jZNZnmvRPm3LeBqvn1h1FsH6Ouoyskaqzekqd+96NrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5/zDlhx4TrVjc2v84ZAktr/RJJiBdcv8lcEbjzvjzR+cdrulu5Ru09YW16oa5vTdJySSQb6s/HqKSpA/Tzc7fER/hEUYQGMgY1PsGin4KjrndeRqOGbASeNcxIKtU8blc13ep3KuTDN+Mib725ikqnIivWGS80CmX7QxcL3uv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5CA181F8005E;
	Thu,  9 Apr 2026 15:31:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 6E908B401BC; Thu,  9 Apr 2026 15:31:52 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id D4EF3B401B3;
	Thu,  9 Apr 2026 15:31:50 +0000 (UTC)
Date: Thu, 9 Apr 2026 17:31:48 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, mripard@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
Message-ID: <adfGZHR9wM2d6-yJ@shepard>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
 <adeqkmA9VhaPkSAk@shepard>
 <4bd5d70a6144f3e8d4356c182f314cf735f1921c.camel@collabora.com>
 <ade4Qe4OS04au2Ba@shepard>
 <a5f8c14becdc926f14ea852c8c5a2d4665a2ef8a.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8zWVGOCXRFNtUVQP"
Content-Disposition: inline
In-Reply-To: <a5f8c14becdc926f14ea852c8c5a2d4665a2ef8a.camel@collabora.com>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58360-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[iscas.ac.cn,kernel.org,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sys-base.io:url,paulk.fr:url]
X-Rspamd-Queue-Id: 70A273CCE4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--8zWVGOCXRFNtUVQP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 09 Apr 26, 10:39, Nicolas Dufresne wrote:
> Hi,
>=20
> Le jeudi 09 avril 2026 =C3=A0 16:31 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> > I think it make sense yes, but it would be good to document it in the u=
API
> > document too.
>=20
> Basically, extend in the M2M decoder spec(s) on the existing documentatio=
n:
>   =20
>    V4L2_BUF_FLAG_ERROR:
>    -
>    When this flag is set, the buffer has been dequeued successfully, alth=
ough
>    the data might **have been corrupted**. This is recoverable, streaming=
 may
>    continue as normal and the buffer may be reused normally. Drivers set =
this
>    flag when the VIDIOC_DQBUF ioctl is called.

Well this part is about v4l2 buffers in general, not just m2m/decoders.
But I guess this mechanism would make sense for more device classes than ju=
st
decoders, so we could indeed specify it there. Maybe with a sufficiently br=
oad
wording.

But it would be good to also update the stateless decode document (and maybe
stateful too) where V4L2_BUF_FLAG_ERROR is already mentionned a few times.
We could indicate how this behavior related to reference frames there.

If we agree I could make a series with the following:
- Introduce a V4L2_H264_REF_MISSING 0xff define (same for HEVC)
- Update the v4l2_h264_reference doc to mention it
- Update the cedrus driver to error out (zero-size payload) when the L0/L1 =
index
  is either V4L2_H264_REF_MISSING or an invalid index that doesn't exist in=
 the
  DPB (same for HEVC)
- Update the v4l2 buffer and stateless(+stateful) documents to mention that
  buffers marked with V4L2_BUF_FLAG_ERROR may or may not contain usable (yet
  corrupted) data depending on the payload size and how it relates to refer=
ence
  frames.

Then we could later envision having a mechanism (hopefully common) to figur=
e out
the best replacement to a given missing reference, which would allow cedrus
(and maybe other drivers too) to return a frame with incorrect data instead=
 of
a zero-size payload error.

What do you think?

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--8zWVGOCXRFNtUVQP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXxmQACgkQhP3B6o/u
lQz8nA//drat7vJDY+ABdsZlCoKtEB58kHDwiuxolmRi5JwVyxQfQoaO3exwOicd
dAQmv1DYkEvV6C/BFO/4F+LtT3BOjASFPChxlB8jsWN+NU8TJhizp6BURanrmDns
PT2BOKE33OVvN+ZpumARIBZ2IjlPUOvuDZqj9wvnQKZBrqIn6n6bh0zMHmZ53Dxm
yADWxQhvGhP1Q9IKFjocOZwc4hULqolm1HDj7oc2sJBhNGoBHU49co5lUcaMuEag
DSC+wSkH5xGSNZsTbKuasl5XDIjObFlRTpoGykMFuQtKqKJu+SNYFCl1Gq4loyjX
5pkh2LbRUJeu3A6Zo3XDBRJACdRH9dh5ttaaR0tstL9XaQAU78MVvLPslumAmhti
wwq46BdVRBPOWkYw07HEsVXbFPZMZGX/BYq+Mfyj7whW3xfSQUn1wXjPOI6ed1OS
MH1GuZKy8nRXHnvo6RDqE0dvlBeeEb49uPDk/S92f/tvI7tVwIBTYFKzZzEtHusy
lx1QJj7U6hA2jUa/O/uWgRkDU2d/OVH7PN0wRh1DeDC4F9/TCX7/Qb1L5yaD81KN
kO4+GO4VlZD0g6yWPjvyrITJbmQF0e4yowB6BaOHJa8Z4Zf/G8AfVvkoxxs1byaA
+X+wV7C+8yveA0dP9fdbqvf8DCoixA0U6FHZSLRvACk+HAy84P8=
=EPPU
-----END PGP SIGNATURE-----

--8zWVGOCXRFNtUVQP--

