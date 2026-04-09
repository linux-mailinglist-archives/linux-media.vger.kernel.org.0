Return-Path: <linux-media+bounces-58351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMNBHFK712l0SAgAu9opvQ
	(envelope-from <linux-media+bounces-58351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:44:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB5F3CC27E
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18534300B74B
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 14:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5383D9045;
	Thu,  9 Apr 2026 14:44:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E45C3BED1B;
	Thu,  9 Apr 2026 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745863; cv=none; b=r5eymJ/dnf8A3W6yu6fJ4xLUAEJB3feWbEwwm/oDlVSqehFRjYc3U3sBRKZH4o7p8gJV8VFnMtUE6kk4FnqJHADo+d6BmjW2X4ej6ACWG3BIoykViiyzkwRiVUCSoPvBAO02LG2XtJQaKWHwkOeXYYiztB+AZ5vxxGkQNvZ4cHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745863; c=relaxed/simple;
	bh=BV/CJI8+VGH3r4rVE8fgL+Qlls9YGWhMnRicWettroA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvoNEH0mLj+RKSsMm7PCdJKxzW4HQx9PuRf4bS4dM6YVGGI0cv5g+SaUEtE/TGOtcAmNM2AHtlGtWg+cGF3eLhbW4ZvmbJSgFT2ptjAuO3oClNFUdab58+I7zcK4Ug7foOU81UKo4Y1lXjrwBOsvxZgjDux/c+Oo7qr+8ku11Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D8C481F8005C;
	Thu,  9 Apr 2026 14:44:14 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 41AC0B401BA; Thu,  9 Apr 2026 14:44:13 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 0F23DB401B3;
	Thu,  9 Apr 2026 14:44:12 +0000 (UTC)
Date: Thu, 9 Apr 2026 16:44:10 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, mchehab@kernel.org,
	hverkuil@kernel.org, sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com, opensource206@gmail.com,
	jernej.skrabec@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-ctrls: validate HEVC slice reference lists
Message-ID: <ade7OpV7nLdztVVE@shepard>
References: <20260323083031.30941-1-pengpeng@iscas.ac.cn>
 <176cfd181e783d2b24fad1a2c7b18425374b4622.camel@collabora.com>
 <adevHyqtwtEj2_-l@shepard>
 <8035203a724b54969ba5f3cbd484160124792f78.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F4uVa+sHPSe1eFIW"
Content-Disposition: inline
In-Reply-To: <8035203a724b54969ba5f3cbd484160124792f78.camel@collabora.com>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[iscas.ac.cn,kernel.org,linux.intel.com,ideasonboard.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58351-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DBB5F3CC27E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--F4uVa+sHPSe1eFIW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Thu 09 Apr 26, 10:14, Nicolas Dufresne wrote:
> Le jeudi 09 avril 2026 =C3=A0 15:52 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> > Hi Nicolas,
> >=20
> > On Mon 23 Mar 26, 09:41, Nicolas Dufresne wrote:
> > > > +
> > > > +		for (i =3D 0; i <=3D p_hevc_slice_params->num_ref_idx_l0_active_=
minus1;
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0 i++)
> > > > +			if (p_hevc_slice_params->ref_idx_l0[i] >=3D
> > > > +			=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> > > > +				return -EINVAL;
> > >=20
> > > That one is a breaking change since userspace already passes off limi=
t values
> > > such as 0xff when a reference is missing (was lost). See:
> > >=20
> > > 	47825b1646a6a9eca0f90baa3d4f98947c2add96
> > >=20
> > > The hardware may or may not be capable of doing concealment, but with=
 this
> > > change, we bring down all drivers to failing the decode completely.
> >=20
> > So while some decoders may be able to deal with missing references, it =
seems
> > that cedrus should still error out in that case. I don't think it will =
be very
> > happy if we configure the hardware with L0/L1 lists that don't match wh=
at was
> > used for the encode.
>=20
> The L0/L1 list passed by application do match the decoder list, but has g=
aps. By
> the spec, decoder should be gap resistant. You are better place them me t=
o know
> what the Cedrus hardware can and cannot do. This is rarely well document,=
 and in
> RE case like this, you probably have to do some trial and errors.

Indeed. My concern here is more specific to cedrus: since the references are
written to a SRAM area we have to configure something for the entry or it w=
ill
just keep the value from the previous frame.

Also the current cedrus h265 code doesn't check for cases of missing refere=
nces,
which will certainly blow up when trying to access the corresponding DPB in=
dex.

> > But maybe we could pick up another (existing or empty) reference to rep=
lace the
> > missing one, which would be better than failing to decode the frame. IM=
O this
> > would be best done by userspace, but maybe we'd need some indication to=
 know
> > that the hardware cannot deal with missing references.
>=20
> Exact, experimenting first seems key, every hardware I've worked with beh=
aves
> differently. Hantro G2 notably tends to cause system wide issues on imx8m=
q if
> you don't carefully select your replacement. Yet, after testing and looki=
ng at
> the visual result, its way better (visually) to pick a replacement. I have
> patches coming that tracks which frame have decoded successfully and holds
> initialized MV data (which was the reason it was going wild).
>=20
> Note that going one step further, on HEVC we could use the poc to find a =
valid
> replacement that is temporarily closer, but that would simply be an enhan=
cement
> for streams with reordering.

Right, for both H.264 and H.265 we could have a (hopefully generic) way to =
find
the most recent frame to replace a missing reference, and return an error s=
tatus
with a full payload size.

All the best,

Paul

> Nicolas
>=20
> >=20
> > What do you think?
> >=20
> > All the best,
> >=20
> > Paul
> >=20
> > > > +
> > > > +		if (p_hevc_slice_params->slice_type !=3D V4L2_HEVC_SLICE_TYPE_B)
> > > > +			break;
> > > > +
> > > > +		if (p_hevc_slice_params->num_ref_idx_l1_active_minus1 >=3D
> > > > +		=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> > > > +			return -EINVAL;
> > >=20
> > > Ack.
> > >=20
> > > > +
> > > > +		for (i =3D 0; i <=3D p_hevc_slice_params->num_ref_idx_l1_active_=
minus1;
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0 i++)
> > > > +			if (p_hevc_slice_params->ref_idx_l1[i] >=3D
> > > > +			=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> > > > +				return -EINVAL;
> > >=20
> > > Same.
> > >=20
> > > cheers,
> > > Nicolas
> > >=20
> > > > =C2=A0		break;
> > > > =C2=A0
> > > > =C2=A0	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
> >=20
> >=20



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--F4uVa+sHPSe1eFIW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXuzoACgkQhP3B6o/u
lQxUJxAAi5YTQdeK1wdJVH3PmkxdpZYcEvkoYvtHum9hvcdTy2DlYT7ew0FGFzAK
0Za33zJwniSV+8za5VGtLFfntGcHCyvxZSOCDTBC2+eLIHTD1KvOfbQTCQHeWHYE
GaWagjcbfQ9/VOy4sGmiG2GrmDhp0ItADpUNkKZjp9g3rb1/T7A7YTdVutqgXcVz
ciVw+Pg8BYTp/gHLf0bx1cMml+TOjyXr0nClWiOKR9dC2pq2TyHzCbBJlDbmrSEY
hC25i6wWsGuMYuxyEgsdNepJdt+SwcBXE4YoUJtojKaAQUwWhv8tmiwxlNM5lMrm
90lMWEZKyaQOHf/73jBDyqofBTj47va1LZrsFl6wWj/x/bEXBECRNtxgQscFctmf
jnqkEI0UV0Oy2y5s49AcozgbiGVIi6y3pvMzmIvVZ5or83DQ0/NigrXMlKLNuZd4
7VUs08X3PDJBQ2E7Y89/iSx+tq0e4NIA9GgpZuIH5Zd0JY64GAvuyyU3Yx5VQFfj
5N8R/cqqW/fjF2kYZY+a6Q9JJxFwZv0gCpckhG6w54XGrgxt7/5vfIMstmUzuTMa
LFyL+s0wnvaz5mPmhKO9SiFH41h+JjT0C3+bxeQaVTMnRWRqD7HcP/kIvBwEbkwE
JOSnhbaeMeWt0rcF9vG3PN/GXx+H1fkmabsnGG5oVV1CkerfE9o=
=IdfD
-----END PGP SIGNATURE-----

--F4uVa+sHPSe1eFIW--

