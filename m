Return-Path: <linux-media+bounces-48491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C013CB1066
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 21:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03C8430A954D
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 20:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F8F20B7ED;
	Tue,  9 Dec 2025 20:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RF4kEHQb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB2E22CBD9;
	Tue,  9 Dec 2025 20:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765312278; cv=none; b=oWPHq5V0RzE+qDuoc1/M3WzMemayUpiu/beP8+ATaLpgKjpWiY/J3mBMSnkXkI+V8seWhhRW9nkBw+frGf97ihc1yzv6jZzQqLkSPKMpyk2vG/d64YI27vnNkojPnvK0hYcEAjvkPkz9nUOgt/NmRQmld2jq1T7ZgJ5VqqS3sWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765312278; c=relaxed/simple;
	bh=pq/+1QGo8vpog8fReh0FEOX9/0a1d+29RlAlv6/q/98=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P3fS+HCv8kPnTo/Ry72X7QUIrgDf2WvTQHMw4hXhMFoehN/IxJqwEumoOalASAWhR5H27hTgv3vFSg7TMxvzP8geGqlDLirqLxTVglsID/fU2ib/Cf9O6HXEn2XuPoK8x1HA5rzFOWUVnIY4YqwAy8tOHvLRtQLWfUl0MhiDBYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RF4kEHQb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765312274;
	bh=pq/+1QGo8vpog8fReh0FEOX9/0a1d+29RlAlv6/q/98=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RF4kEHQbWAC5GpivvA1pw2I1bJCLG7Nj7hnujQxbM79mVMQ/19SOtK7KuGmonnnUj
	 WopeMDaOlHziCqSiH72+CX8v+I7YcM06bDt9xnwzD7RDWP8dnuKhJDcilZdWIy9yOE
	 amPEg+GWj/jLDHQneJrpBcR+tUhgfN7624hoWwtVEI2lyvds220Quzxnc9zGNodXZi
	 yJ8pPH6g33Pm5LBjpQGThaTM0LnCyNpjATmBIKppD9odafTNwvhQyt2skHhBsMQIOh
	 j7iyulKsOrb/oxxSKHVzkRpNs1qIHDxtmcQbXnrIbC/DN46v/BWI65d+dpvLrn6NUb
	 U8A1XUGSBy7lg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64EC917E10DC;
	Tue,  9 Dec 2025 21:31:13 +0100 (CET)
Message-ID: <49c961b58fab07f8274f5cf7512d18d004f86db6.camel@collabora.com>
Subject: Re: [PATCH v2 1/2] media: chips-media: wave5: Fix conditional in
 start_streaming
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Brandon Brnich <b-brnich@ti.com>, Nas Chung <nas.chung@chipsnmedia.com>,
  Jackson Lee <jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Darren Etheridge <detheridge@ti.com>
Date: Tue, 09 Dec 2025 15:31:11 -0500
In-Reply-To: <cfa3360c-1ad2-4e3b-a67b-259110d194e3@ti.com>
References: <20251021204618.2441939-1-b-brnich@ti.com>
	 <420ba3c838b7fe2a6f2414d09fe1226c581ca09d.camel@collabora.com>
	 <cfa3360c-1ad2-4e3b-a67b-259110d194e3@ti.com>
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
	protocol="application/pgp-signature"; boundary="=-mpHxqF59PqWh1eXgn9Vj"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-mpHxqF59PqWh1eXgn9Vj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 29 octobre 2025 =C3=A0 10:08 -0500, Brandon Brnich a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> On 10/28/2025 11:42 AM, Nicolas Dufresne wrote:
> > Le mardi 21 octobre 2025 =C3=A0 15:46 -0500, Brandon Brnich a =C3=A9cri=
t=C2=A0:
> > > When STREAMON(CAP) is called after STREAMON(OUT), the driver was fail=
ing to
> > > switch states from VPU_INST_STATE_OPEN to VPU_INST_STATE_INIT_SEQ and
> > > VPU_INST_STATE_PIC_RUN because the capture queue streaming boolean ha=
d not
> > > yet been set to true. This led to a hang in the encoder since the sta=
te
> > > was stuck in VPU_INST_STATE_OPEN. During the second call to
> > > start_streaming, the sequence initialization and frame buffer allocat=
ion
> > > should occur.
> > >=20
> > > Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> >=20
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> I just saw I received a messaged from the CI bot on an alignment error=
=20
> on my conditional statement below. Would you like me to submit a v3 or=
=20
> will this be fixed up before being pulled to media tree? I can submit a=
=20
> new version today if required.

Late response, I'll fix while applying.

cheers,
Nicolas

>=20
> Best,
> Brandon
>=20
> >=20
> > > ---
> > > =C2=A0=C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c =
| 3 ++-
> > > =C2=A0=C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > index 1978551a28fa..0a2eab372913 100644
> > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > > @@ -1367,7 +1367,8 @@ static int wave5_vpu_enc_start_streaming(struct
> > > vb2_queue *q, unsigned int count
> > > =C2=A0=C2=A0		if (ret)
> > > =C2=A0=C2=A0			goto return_buffers;
> > > =C2=A0=C2=A0	}
> > > -	if (inst->state =3D=3D VPU_INST_STATE_OPEN && m2m_ctx-
> > > > cap_q_ctx.q.streaming) {
> > > +	if (inst->state =3D=3D VPU_INST_STATE_OPEN && (m2m_ctx-
> > > > cap_q_ctx.q.streaming ||
> > > +		q->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)) {
> > > =C2=A0=C2=A0		ret =3D initialize_sequence(inst);
> > > =C2=A0=C2=A0		if (ret) {
> > > =C2=A0=C2=A0			dev_warn(inst->dev->dev, "Sequence not found: %d\n",
> > > ret);
>=20

--=-mpHxqF59PqWh1eXgn9Vj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTiHDwAKCRDZQZRRKWBy
9HbfAQCQ7glpyzBYCzFDSI7+QL8BgC8spEdEDmo6rjcBHn+7qgD/eCrxI0EtJugF
fKD2BSBQnoxuGg2tEhPnIhc8AIQaQQ8=
=avGN
-----END PGP SIGNATURE-----

--=-mpHxqF59PqWh1eXgn9Vj--

