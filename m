Return-Path: <linux-media+bounces-42960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D4CB9286F
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 20:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A65FA2A5BD8
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 18:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD03317704;
	Mon, 22 Sep 2025 18:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FrX5Zltf"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E017B318136;
	Mon, 22 Sep 2025 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758564007; cv=none; b=Etn8Znq4e9LFgWwOh4/qT7eunp8C2rQ0hb4Xa7km4jTiLDD0Ebh2PTPJKIpvtkrWSfu91o9dpjIOJ9KXpLe7BFrw60hvCGGEUyd4Ba2W8n9Gxp9hdhUH1mmlw1zgJeBS/UTuzOmsWKLrjNQVFUOZCCctt1NwkhVaS9TNdB8N+NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758564007; c=relaxed/simple;
	bh=p8E21R87obxQ5eDnJ6dm0V/d4KC9aZ4GRIbU+G+zi6s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L6hk0+GRPOryfi+BOab/O97fGbLtyujJkkxW/FSlBZ7Dn4AEQIv/EnWuyouSZY6cHhYHwuDQPm5C+c8Ufw2yLL2O+7DiGkmTC9h7DrJwPJZ1DYnKzfpi5U3rfj08g4Cv/lpxr4kjcOGw6fTrIX2Zr7ySmBjsyovsmN1QDfGeRIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FrX5Zltf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758564003;
	bh=p8E21R87obxQ5eDnJ6dm0V/d4KC9aZ4GRIbU+G+zi6s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FrX5ZltfJWthDwgm1gqnmBUQaq7LchnbCduyeFoMWA00+sYS8qhNxNgEdvAvCOabe
	 Cw+TWGHg1OIKqtptM6QFQMv3GfV8rrGOvuzCNW1Gs87whYybNcXbVms9uPWIn7Fb23
	 //17E5+sg1/Eac84sF30icaHyEra+wrLLg8GwpxUvBuUOgUD4udLwyBuJzjGIpt+7q
	 UnYoS3Lg+N/iZP7yhw+MG1iPWY7EWGTsM3MIpU3Cu8Jnrbn4DnbEnglpNCfzoz6jWH
	 kJph/82jhwO3woLaXqfNUg/J9pM6GNFUXe0fdyYyikwfiVHoU71CH6tRPIVUy+tsSh
	 jt/ahHfnCASjw==
Received: from [IPv6:2606:6d00:10:aee0::5ac] (unknown [IPv6:2606:6d00:10:aee0::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C7AD817E0125;
	Mon, 22 Sep 2025 20:00:02 +0200 (CEST)
Message-ID: <d4b7cc51f1bd7fcf88066e8510f950ec90cfb5aa.camel@collabora.com>
Subject: Re: [PATCH v5 4/4] media: chips-media: wave5: Improve performance
 of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Brandon Brnich <b-brnich@ti.com>, "Jackson.lee"	
 <jackson.lee@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, hverkuil@xs4all.nl, nas.chung@chipsnmedia.com
Date: Mon, 22 Sep 2025 14:00:00 -0400
In-Reply-To: <1f59f00d-eff7-4c65-a504-227df0de75d2@ti.com>
References: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
	 <20250922055255.116-5-jackson.lee@chipsnmedia.com>
	 <1f59f00d-eff7-4c65-a504-227df0de75d2@ti.com>
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
	protocol="application/pgp-signature"; boundary="=-1ejI2RC+CbxdNdlEAcBM"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-1ejI2RC+CbxdNdlEAcBM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brandon,

Le lundi 22 septembre 2025 =C3=A0 12:32 -0500, Brandon Brnich a =C3=A9crit=
=C2=A0:
> > -	/*
> > -	 * During a resolution change and while draining, the firmware may
> > flush
> > -	 * the reorder queue regardless of having a matching decoding
> > operation
> > -	 * pending. Only terminate the job if there are no more IRQ coming.
> > -	 */
> > -	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
> > -	if (q_status.report_queue_count =3D=3D 0 &&
> > -	=C2=A0=C2=A0=C2=A0 (q_status.instance_queue_count =3D=3D 0 ||
> > dec_info.sequence_changed)) {
> > -		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
> > -		pm_runtime_mark_last_busy(inst->dev->dev);
>=20
> Patch is failing to apply here to linux-next because these redundant=20
> calls have already been removed[0].

Which have not been merged back from the RC into media-committers/next, for=
cing
to skip a cycle. Jackson, feel free to rebase on linux-next like Brandon
suggest.

regards,
Nicolas

--=-1ejI2RC+CbxdNdlEAcBM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaNGOoAAKCRDZQZRRKWBy
9DIWAP4qLLuvr1F5whpba/LvQWT1xkoQSKc+MPsqt8wt1LzPkgEAw4S2lo0+ngr6
jHI3P4fJlgDGfV4Bwq7pwcmPUbXRyQY=
=mfSs
-----END PGP SIGNATURE-----

--=-1ejI2RC+CbxdNdlEAcBM--

