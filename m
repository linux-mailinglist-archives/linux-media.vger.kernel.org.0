Return-Path: <linux-media+bounces-60011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCgxECBO8mkapgEAu9opvQ
	(envelope-from <linux-media+bounces-60011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:29:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CC749910E
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B73FA3043500
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6938941B370;
	Wed, 29 Apr 2026 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ve22WaPF"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356863FF89E;
	Wed, 29 Apr 2026 18:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487360; cv=none; b=EyFi90PwdvdmrwKuM57Ya3sbA34Uq0ReMMapWX2y1jOLK7muNw38J42Weg+CCLW8LAtjxBlY+Khw/1WW01NI5msU4VuMN+n89CH4VYKxwIlRgzxdx9Fiwd5FE1QFHLkAqEYq825qo2fyimJvdV1UDUe/1Mbf4CR5w771Q8TDJJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487360; c=relaxed/simple;
	bh=Mx6ZqrXzw/EZH3FknqSGKqq5U7s6NAQhmou75DCoheA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dC9EhDhYRMk8Sa4B6ZCwdv92uADHEiqoQXNbE+0JhqSZh1zR4s/I8rMDgx9K2/FsxiiV3Bp/hsp8CnGG3xWInNA+xeCGYSBLzMQSoeQLZcM50w3nxBOVvVveMmOtfF/fVvyg55axuqvuD/2A3N3SrVW8P6nwU39Pf3U+7Iltms0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ve22WaPF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777487357;
	bh=Mx6ZqrXzw/EZH3FknqSGKqq5U7s6NAQhmou75DCoheA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Ve22WaPFRouD624zp7vfirsjG5wn3NCAK2Oyax1rT3cSSdTLdyRAgYKsvJn7o7hvi
	 0EMwg3dEf5o/Hc6J+weBK4qea6IaoBMdFJB3s82JBhVCF9HdXCwM5sPntPIXJc+cJ2
	 SdETmY3A/XI5xv7bPm3A5zN6da6S7XncX1gTcqxF2Mx/EYuykTCte8BG+yarsZoQlX
	 0IqTkRCmSgO437T631gXalzfjMxy4gLyN5YX5+69ZdPPDwHWrycBRb0kG+f7vWdVZ+
	 ntmVSgxwLOcnf8gZv+tNiCDDtj7NHKAYtXLK8wCHCJdsVhUGqS/OW6fhzSbY/QjTEb
	 8QesP7HwlZTkQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93BD717E061E;
	Wed, 29 Apr 2026 20:29:16 +0200 (CEST)
Message-ID: <1b8dbb58255edf9162d210061ad568d31f4e6848.camel@collabora.com>
Subject: Re: [PATCH 1/2] media: chips-media: wave5: Release m2m_ctx after
 Instance Removed from List
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Brandon Brnich <b-brnich@ti.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: detheridge@ti.com, mchehab@kernel.org, nas.chung@chipsnmedia.com, 
	jackson.lee@chipsnmedia.com
Date: Wed, 29 Apr 2026 14:29:15 -0400
In-Reply-To: <20260402184554.1751445-1-b-brnich@ti.com>
References: <20260402184554.1751445-1-b-brnich@ti.com>
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
	protocol="application/pgp-signature"; boundary="=-DE2pbvMbLAzc+lERn4+K"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 97CC749910E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60011-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email]


--=-DE2pbvMbLAzc+lERn4+K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 avril 2026 =C3=A0 13:45 -0500, Brandon Brnich a =C3=A9crit=C2=
=A0:
> Possible use after free if IRQ thread manages to obtain spinlock between
> m2m_ctx release and wave5_release function removing stream instance from
> list of active instances. The IRQ thread looks for the m2m_ctx which is
> freed so null pointer dereference occurs.
>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-helper.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/dr=
ivers/media/platform/chips-media/wave5/wave5-helper.c
> index 53a0ac068c2e..c3d34be833ff 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> @@ -68,7 +68,6 @@ int wave5_vpu_release_device(struct file *filp,
> =C2=A0	int ret =3D 0;
> =C2=A0	unsigned long flags;
> =C2=A0
> -	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> =C2=A0	/*
> =C2=A0	 * To prevent Null reference exception, the existing irq handler w=
ere
> =C2=A0	 * separated to two modules.
> @@ -89,6 +88,9 @@ int wave5_vpu_release_device(struct file *filp,
> =C2=A0	list_del_init(&inst->list);
> =C2=A0	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
> =C2=A0	mutex_unlock(&inst->dev->irq_lock);
> +
> +	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> +
> =C2=A0	if (inst->state !=3D VPU_INST_STATE_NONE) {
> =C2=A0		u32 fail_res;
> =C2=A0

--=-DE2pbvMbLAzc+lERn4+K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJN+wAKCRDZQZRRKWBy
9KM6AQC1rYKGE1r8rVxobE1aNYdR/Aoq9NTifwm1LkfNpEBs6QD/be8CUAEopIjL
ErP2rpQYfTNEczFzdI5M4ZsmJFEQhAk=
=IfOV
-----END PGP SIGNATURE-----

--=-DE2pbvMbLAzc+lERn4+K--

