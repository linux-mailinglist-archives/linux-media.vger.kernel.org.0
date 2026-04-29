Return-Path: <linux-media+bounces-60005-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEYsGfFJ8mnOpQEAu9opvQ
	(envelope-from <linux-media+bounces-60005-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:12:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB3498CF4
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC8C83034B24
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC8A3FFAAA;
	Wed, 29 Apr 2026 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ewbsn7Rs"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A97E30499A;
	Wed, 29 Apr 2026 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486307; cv=none; b=o3f9TXy6vbemeVD3DM/WqpTVZDdrGjJNIwCtZgGQPmg9xa3HokQQIVbH7y78dPx3ns/bYPXPY2x3IykST5/OJhcmqnnnPqls5YzwsKzzf/BiZM3dlu/wupcr3BqRAemblU+psVBxv/nzOkP+Ned0a+YjIntSgFXrD27gLnHCQiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486307; c=relaxed/simple;
	bh=vVHtEP46vGKolJeaCtgCNYw3z2ZwVl3u6h4t7hanr/Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DF6T4bySbE71jvipUtf0+MZbxryzMUNT41VuINdjIY9uO14G7BfCinIC3XOsyY+fP8o9AvzIl6Z9D81+v2MpvJYkFsEpvcIQtTOr6QFEH5GjnMwQLI/Hyia6r7xkGDwALd6OBCgdBoF5mC0CZuYjmDSR3znOlSJsfosf01ff4Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ewbsn7Rs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777486304;
	bh=vVHtEP46vGKolJeaCtgCNYw3z2ZwVl3u6h4t7hanr/Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Ewbsn7RsB40xrAgPa5Bt4o5YasSBzfCpYAa5hJAcwhvoee//1lhLEL4dBxIxE02fT
	 377ycqD41TJX1eAocyvNU5r0RozZ16EWrWFFAbFuMHMP8721NsQ0u8JvDVmnxU8yQD
	 h+KJ6pMsL8PVxghCIF5D1fotq2uEXqpReN0jdKIBjrekbSDDeFz9kpyS6tRBdGxmVO
	 dKOKNYdZtl4YE0DkDvos5ajf1QVWgimYG8EXuaWXbuOdQwRNmgJZRS3bNoODeH5wxk
	 vsxC85TM9D836M2JgN+f6bSyxzrF+JYqZ00fTrTKJPXjBMhygefczmatRlPIiVzeTn
	 +j2i9I+mM04KA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3381517E0EBB;
	Wed, 29 Apr 2026 20:11:42 +0200 (CEST)
Message-ID: <4064d0168c3409a1e15f9c92da56cea93956b31e.camel@collabora.com>
Subject: Re: [PATCH v3 1/2] media: verisilicon: Simplify motion vectors and
 rfc buffers allocation
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Frank Li <Frank.li@nxp.com>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, heiko@sntech.de, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-kernel@vger.kernel.org, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	kernel@collabora.com
Date: Wed, 29 Apr 2026 14:11:41 -0400
In-Reply-To: <aeIRWW937ev_F8zF@lizhi-Precision-Tower-5810>
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
	 <20260415140420.282084-2-benjamin.gaignard@collabora.com>
	 <aeIRWW937ev_F8zF@lizhi-Precision-Tower-5810>
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
	protocol="application/pgp-signature"; boundary="=-hO3VKyof1zFkkmRUWXyp"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: BFEB3498CF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60005-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,sntech.de,foss.st.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]


--=-hO3VKyof1zFkkmRUWXyp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

Le vendredi 17 avril 2026 =C3=A0 06:54 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Wed, Apr 15, 2026 at 04:04:19PM +0200, Benjamin Gaignard wrote:
> > Until now we reserve the space needed for motion vectors and reference
> > frame compression at the end of the frame buffer.
> > Disentanglement mv and rfc from frame buffers by allocating
> > distinct buffers for each purpose.
> > That simplify the code by removing lot of offset computation.
>=20
> Can you try split to more small and straight forward patches, for example
>=20
> for example create patch just move hantro_h264_mv_size() to header file,

Marking this has Change Requested, as I completely agree with Frank that a =
split
of this giant will help proper review.

Nicolas

>=20
> ...
> > +++ b/drivers/media/platform/verisilicon/hantro_hevc.c
> > @@ -44,30 +44,49 @@ dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ct=
x *ctx,
> > =C2=A0	int i;
> >=20
> > =C2=A0	/* Find the reference buffer in already known ones */
> > -	for (i =3D 0;=C2=A0 i < NUM_REF_PICTURES; i++) {
> > +	for (i =3D 0; i < NUM_REF_PICTURES; i++) {
> > =C2=A0		if (hevc_dec->ref_bufs_poc[i] =3D=3D poc) {
> > =C2=A0			hevc_dec->ref_bufs_used |=3D 1 << i;
> > =C2=A0			return hevc_dec->ref_bufs[i].dma;
> > =C2=A0		}
> > =C2=A0	}
> > -
> > =C2=A0	return 0;
>=20
> Move this code style change to new patches.
>=20
> Frank

--=-hO3VKyof1zFkkmRUWXyp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJJ3QAKCRDZQZRRKWBy
9H3UAQDXMPc16wto5clUhLZLnohxaOrBBoEinO5d3WvhOAdRDAEAq/QIRB2+WigR
13DyCJr+rFfmdUWiBtqbZtZoXN1CVgg=
=FgIy
-----END PGP SIGNATURE-----

--=-hO3VKyof1zFkkmRUWXyp--

