Return-Path: <linux-media+bounces-57654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJkQBb2fymmg+QUAu9opvQ
	(envelope-from <linux-media+bounces-57654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:07:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F328335E62E
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 74E913006D70
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55003750D5;
	Mon, 30 Mar 2026 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Sc68ieIf"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F0374172;
	Mon, 30 Mar 2026 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886132; cv=none; b=huai49LY5vRozeOjNJBkUNuqK2TkpEJaAwCZxtwmpVJf6tMzxAUMqpU6DOFRAyY7jocVy55xH1yi/UIVgho5vAYdh1IC0JbVY0NxUJiQpN44ZKAJmMmscBsP9xVzOnMLh7dYWfPthu4q05T7VTxXVUt5fsNmIi57TCM/MxrpB5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886132; c=relaxed/simple;
	bh=xvfnu8n9xWUUX3eTGlWSUWqJseakKmLqFYYbqi1qNng=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hy8eaMut0TM/4GhB6Anek8idIcdlDJXysz1UE8vQRsrYpn1BejmOdiCaR/0fl45mHypXbEhQkFTvATKlUKLpax+4ioiSBILYoVp1p6SiHYJ3Wn9wAPprMN/t9PnASndzv94gvorBxI2o7ct9rDjKN7TMywOsHVW4VYKEptX0oVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Sc68ieIf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774886129;
	bh=xvfnu8n9xWUUX3eTGlWSUWqJseakKmLqFYYbqi1qNng=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Sc68ieIfol+IQE7DIOloK1UgnGU8qNDmo2WSaON4sgBfUtYPS9via3VA7tGbBTORr
	 NazvT2v44pBTyMSY2i3icaKZnD6a6cUy0N570nGKn3KVANxwB0voefSZlYxARSz6TR
	 wGPxDRKtvLUvbU41H0gGyp+aHrYqS5/WBzMUfntfjUMqQi915joFlF9ROsUNEtLU8E
	 zitiLECuoGbdiFzuaI5QqFjGvCmyl1n5KQgznx5i5zr5XyoJU8XIDjb40SnBdetlfd
	 lXcjWISzqvOeBWzTbmhCANbHKMtZMyxRps9ecCxSKJstmoLI0Nv8WyGD4nuy7decj0
	 15u1ufIR/pRMQ==
Received: from [IPv6:2606:6d00:15:e06b::c41] (unknown [IPv6:2606:6d00:15:e06b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A680C17E4886;
	Mon, 30 Mar 2026 17:55:27 +0200 (CEST)
Message-ID: <603785eb48d69bc50c0296fc696eb0985c2a3ac5.camel@collabora.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: wens@kernel.org, Jernej =?UTF-8?Q?=C5=A0krabec?=
 <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 paulk@sys-base.io, 	mchehab@kernel.org, gregkh@linuxfoundation.org,
 samuel@sholland.org, 	linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 	linux-kernel@vger.kernel.org
Date: Mon, 30 Mar 2026 11:55:26 -0400
In-Reply-To: <CAGb2v674Ei2uFh6O0LoFoJrPcqGKGr_v+hfvE7TSfwztxDfTAA@mail.gmail.com>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
	 <2823210.mvXUDI8C0e@jernej-laptop>
	 <CAGb2v674Ei2uFh6O0LoFoJrPcqGKGr_v+hfvE7TSfwztxDfTAA@mail.gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-UJIS4LK7twx1My3JsxhL"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57654-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: F328335E62E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-UJIS4LK7twx1My3JsxhL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 29 mars 2026 =C3=A0 20:44 +0800, Chen-Yu Tsai a =C3=A9crit=C2=
=A0:
> On Sun, Mar 29, 2026 at 5:21=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >=20
> > Dne torek, 24. marec 2026 ob 09:08:56 Srednjeevropski poletni =C4=8Das =
je Pengpeng Hou napisal(a):
> > > Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> > > stateless slice control and later uses their indices to look up
> > > decode->dpb[] in _cedrus_write_ref_list().
> > >=20
> > > Rejecting such controls in cedrus_try_ctrl() would break existing
> > > userspace, since stateless H.264 reference lists may legitimately car=
ry
> > > out-of-range indices for missing references. Instead, guard the actua=
l
> > > DPB lookup in Cedrus and skip entries whose indices do not fit the fi=
xed
> > > V4L2_H264_NUM_DPB_ENTRIES array.
> > >=20
> > > This keeps the fix local to the driver use site and avoids out-of-bou=
nds
> > > reads from malformed or unsupported reference list entries.
> > >=20
> > > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> >=20
> > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Tested-by: Chen-Yu Tsai <wens@kernel.org>
>=20
> This fixes a KASAN slab-use-after-free warning when running fluster H.264
> tests.

Ah, very good, can you cite which test caused that ? I didn't expect fluste=
r to
cover cases with missing references. I think it will be handy for future
testing.

Nicolas

--=-UJIS4LK7twx1My3JsxhL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacqc7gAKCRDZQZRRKWBy
9FkKAP0bRa5EpH2LNXuNv/NodKoSH3KIa/khjuqrhbX9hctiygEA85x995KxTAzc
dj+/4z58jnmVuiq/T+Q69UrRdK9ypAg=
=STk2
-----END PGP SIGNATURE-----

--=-UJIS4LK7twx1My3JsxhL--

