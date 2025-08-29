Return-Path: <linux-media+bounces-41358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 986A5B3C38E
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 22:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 003545862C4
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 20:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3F72459FE;
	Fri, 29 Aug 2025 20:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="LxVGcw9O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B68F233721
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 20:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756498046; cv=none; b=GHBnax18dLOPfB2kf1rFZAsHSl9TUckCwO2S5o2xEn2SVcNVetN8WhyyRiYQGI+WwVdbdhfeK7DN3iRyc+Vhq/O7irJIt1X8dck85ky0S3sJ/hJzQs+H382AaM2GBE2dE9FVohTWaeC7T3oCcddYsd+RE1iInVEqlohy+8QrUkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756498046; c=relaxed/simple;
	bh=7qYDpn+rwMtXUF+JzwjRCMstZnhe2mh2jSO0ckR1Qco=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M9KBoMoW/cQHxjBWC9F50+A1NhA/xHCXeA87TkKNx19pWUgMWXDuKq3rlfNyymUTimOAG+MUEn3Atoc2kJY9/rna6xPU5v38BpHPPqzTYS6zogecXyyY8RoCS3cBoN5CdXBhL2wJbx9Ky4mK7xm4JyH4rRLlMHThmlwDtWEILGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=LxVGcw9O; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7f7381bd1fcso116704285a.0
        for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 13:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756498042; x=1757102842; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7mVucHPb5ysrmzzkidCX5VCEdnwiQvgze17nPNBDCT0=;
        b=LxVGcw9OZB3mZoFoPLyKWWssd7Lru/wpge9/BCKFiCwK7vtcpTLixAT+tZRC3bHjWj
         ILduR5MjWdOMrSaisv89WMf8FqMF8LD3iU0ay6sCuJbNy1eWkYBanLhFdBE6qc5a2sx8
         eKxRFW4vaeQYHNill3beh3h65ijPvumVSUEYi+ayw00tXj8Jp2sOvsTuTM/OPFmuO/sX
         eYBnIvf014DXP9OhONiHmmH3d1Absf1Z4X3SLyR73gZaC9fJCWd3a6Fl5KGwC4nWoGuq
         mN7sxop+f0wFqX41CM29CQv38zArupZ10wnSd7ccZT0u0VLs0IxwXnIMsAqdrWPkWmBD
         QJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756498042; x=1757102842;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mVucHPb5ysrmzzkidCX5VCEdnwiQvgze17nPNBDCT0=;
        b=WyJ8kdN0U22NEwGmwiq2NDOi2cl9EhXZ8Xmksf1PGR8CTjNfOY7WoLAdp8JOnxJiR5
         DLE1IqktRGzb7FZ8SnECOJtQiAmWVW/K6jdQ6TEJTRV5NUlHuwrQD08kPdo3QinnDTVQ
         oDWP7vPM/rv0X2OWFULapQSDNPlWpSnQ4jesmk4QDaZsQTEHprISEyxiIo7cTRt2qFUm
         P6/7jxAztFn74FTqEEv6Blv7Qt8ZLT8mz0fdWhJ09jG7aUvMIo1sT1haJhqdGOdbDhKc
         QZpsOYWn9ctWWgSoUnQGDGRog6s33W+GPO86Jz6Ep3o/ZMy/UT6vdac6S3FxhKOMxKw7
         2wBA==
X-Forwarded-Encrypted: i=1; AJvYcCWg8TfXYhGMFUeSDCbKlQFqT28oexYujRH3OgqmOTi970LnPGDoCcpmgibKbWFFfLtWOMzBO1nuu86FwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ5WuhHE9atl8SHS7lRa2RrJB0OIGtiwEPn7HPHyG7UMvL182J
	GsuNkXvFqx0ftgbeLdd6U1Y0VS/jLfxmuQ9Dm1YlfuQBtxummVsmzTTxY3V7x0WHjRw=
X-Gm-Gg: ASbGncvHDCWuA+BHZgIUn9GNlEwJBapfzzOeprI3MlGiO8lmWMwCSCDfo6YvE4qax5P
	MxbZaw1x8Pp5rGUDzbYr5+gXxoytxpn1oF9/I05sXBC1OO2EsoKp07UDE77tKX7Lrc6OBCGUxC+
	Cc5/cIsBeaTdcUO5KIFGtuSCPC6He5OFoM9KyRMJx9mR5NJX4ch0MQUtKhLLqrOw8o3/eoW//p+
	SoOr3CtG7NdUsP5AVR/eQiNKnGHTqffS+HcMDBDtcNhrfd56MSLT9J904zEXeNLUR3dGbMKV6X2
	Tnd/uIiyaKrw+y5KDb7xoEVuJplAFlS/kdTV9lAnKlohCfK2HEiHuK08+U2vZcY+Z/VfN/MGRt/
	WCSBsowxfw/GPrFGP+Lgm0os8RSLgv5NqMq2RAQ==
X-Google-Smtp-Source: AGHT+IE8DhCsJH0EvyAuK4Vz9280U37BMOETV4y3Nv5wsQvwvjEYFAHtOUrIGVOTCD1Tn4oDmElK+g==
X-Received: by 2002:a05:620a:a119:b0:7e7:faaa:e7c9 with SMTP id af79cd13be357-7ea10f7492bmr3210665085a.12.1756498042375;
        Fri, 29 Aug 2025 13:07:22 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc15c83bbasm232495085a.60.2025.08.29.13.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 13:07:21 -0700 (PDT)
Message-ID: <ede4226a80e27c8b047b0eb25fe8f5ba90214d12.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Drop the sequence header after seek for
 VC1L
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 29 Aug 2025 16:07:19 -0400
In-Reply-To: <20250725080712.1705-1-ming.qian@oss.nxp.com>
References: <20250725080712.1705-1-ming.qian@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lmqDXEuDoXQ5YOWLo31s"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-lmqDXEuDoXQ5YOWLo31s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 25 juillet 2025 =C3=A0 16:07 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> For Simple and Main Profiles of VC-1 format stream, the amphion vpu
> requires driver to discard the sequence header, but insert a custom
> sequence start code at the beginning.
> The first buffer after a seek always contains only the sequence header.
> But vpu_vb_is_codecconfig() always return false as there is currently no
> flag indicating that the buffer contains only sequence header data and
> not frame data.
> So driver needs to drop the first buffer after seek, otherwise the driver
> will treat the sequence header as a frame, which will cause the image to
> be corrupted after the vpu decodes.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> =C2=A0drivers/media/platform/amphion/vpu_malone.c | 4 +---
> =C2=A01 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index ba688566dffd..a4c423600d70 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -1373,11 +1373,9 @@ static int vpu_malone_insert_scode_vc1_l_seq(struc=
t malone_scode_t *scode)
> =C2=A0	int size =3D 0;
> =C2=A0	u8 rcv_seqhdr[MALONE_VC1_RCV_SEQ_HEADER_LEN];
> =C2=A0
> -	if (vpu_vb_is_codecconfig(to_vb2_v4l2_buffer(scode->vb)))

Please remove vpu_vb_is_codecconfig() entirely, it always returns false, so=
 its
miss-leading.

> -		scode->need_data =3D 0;
> +	scode->need_data =3D 0;
> =C2=A0	if (scode->inst->total_input_count)
> =C2=A0		return 0;
> -	scode->need_data =3D 0;

I only remember testing this once quickly on Exynos 4 and I had no clue wha=
t
Annex G vs J was and most likley the MFC firmware was detecting it. Checkin=
g
quickly, I'm not sure GStreamer actually support both, despite the v4l2 wra=
pper
pretending. I would expect one to be used in ASF/ISOMP4/AVI, and the other =
used
in MPEG Transport Stream. GStreamer does not support VC1 in MPEG TS.

Have you tested this with FFMPEG ? It only maps annex G.

In general, I don't mind the the change if this is correct userspace behavi=
or.
If ffmpeg and gstreamer don't agree though, we'll have to rethink. GStreame=
r
code back in the days was design in a way that it should not matter if the
header is split or not. This limitation came with lower latency decoder lat=
er,
but none had VC1.

Please test both userspace, and lets see if this solution is acceptable. ff=
mpeg
have ffplay and you can seek with your keyboard arrows.

Nicolas

> =C2=A0
> =C2=A0	ret =3D vpu_malone_insert_scode_seq(scode, MALONE_CODEC_ID_VC1_SIM=
PLE, sizeof(rcv_seqhdr));
> =C2=A0	if (ret < 0)

--=-lmqDXEuDoXQ5YOWLo31s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLIIdwAKCRDZQZRRKWBy
9AwxAQCJh1T0bFehpk0F+AD8I2rT9QoDpnwtdP+Y3WjH20xOpgD+PqJE3+yMnDsA
UjNnQYnMYU2r4Puchu4W9nu8fZiitQQ=
=rWlj
-----END PGP SIGNATURE-----

--=-lmqDXEuDoXQ5YOWLo31s--

