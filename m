Return-Path: <linux-media+bounces-58346-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MyXGmC012kORggAu9opvQ
	(envelope-from <linux-media+bounces-58346-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:14:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BA03CBD94
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0808300C7E6
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 14:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED1E2E0925;
	Thu,  9 Apr 2026 14:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YK2BzoFv"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83031A045;
	Thu,  9 Apr 2026 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744072; cv=none; b=RW1yk9nZyCXsr10HjJi4+7s0kD/Jr/tNQ5M/Q7458jocrYoMi3aACQC5VdzFONd3w7MsgA9pzEzoQve7lDoBxddBrs6soePFeferyVdt/S7QkDgySCvypDDEGADESsbDnA4LFq/q7Lm/+m4Zn72LZxs6O2pps1Pv5d8d1qk74ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744072; c=relaxed/simple;
	bh=FU2WnDZms77qZT5DPcMHojBrq+Yr8ChCaLv6KM2JXDw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N71dD1HCULwAr/fOn/co+kfV83GZ8UEt4LKNB5NzgkjpgJcShX2wEVQkF5HD5mU7lsPb41LPZxw7o6//WJ9VIpF1YHZDLulyF9Rev0GD1Mm2ES/OWhxH8C1xwFrMGqZ7I39DP/gsU8ZPSABVvcjodkoSV8QubGmplmZ6xX75ztU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YK2BzoFv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775744069;
	bh=FU2WnDZms77qZT5DPcMHojBrq+Yr8ChCaLv6KM2JXDw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YK2BzoFvxZvgct/geopQl7/Avdjap4RFBEi16dl39QmEvCqw5BgPq+dBRUdTh+QwU
	 lh+3pJZn0HptOz1l/Y5Lto6mJEUw7ZrTE8Jn7cznFHXyMtxAtyVPSqmuCPI1vapT01
	 L6qJ4LTsIrABJdkV7CRc1gYci+bnqp6b/0OZ0s7tK9TQ63ilXYNigNsJ7lNAUcPrDA
	 h1kx3AGNC1pEj+5j1D6DTMJWUOrZ6OcbuKX3D3WFV71zqj7t+g7V4//PcItyzRaadG
	 Vk0FcA1lbulZr/4Y2w/zR/2D4Ry6jxu2UI6eZjX3+pldNFVLGlReSnFF2KrMXyqQX/
	 /NqmZuHc/Jw6Q==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F23E717E1396;
	Thu,  9 Apr 2026 16:14:27 +0200 (CEST)
Message-ID: <8035203a724b54969ba5f3cbd484160124792f78.camel@collabora.com>
Subject: Re: [PATCH v2] media: v4l2-ctrls: validate HEVC slice reference
 lists
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, mchehab@kernel.org, 
	hverkuil@kernel.org, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, opensource206@gmail.com, 
	jernej.skrabec@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 09 Apr 2026 10:14:26 -0400
In-Reply-To: <adevHyqtwtEj2_-l@shepard>
References: <20260323083031.30941-1-pengpeng@iscas.ac.cn>
	 <176cfd181e783d2b24fad1a2c7b18425374b4622.camel@collabora.com>
	 <adevHyqtwtEj2_-l@shepard>
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
	protocol="application/pgp-signature"; boundary="=-ZeoIaUve0XpjsNwgsS5b"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58346-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[iscas.ac.cn,kernel.org,linux.intel.com,ideasonboard.com,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 55BA03CBD94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-ZeoIaUve0XpjsNwgsS5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 09 avril 2026 =C3=A0 15:52 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> On Mon 23 Mar 26, 09:41, Nicolas Dufresne wrote:
> > > +
> > > +		for (i =3D 0; i <=3D p_hevc_slice_params->num_ref_idx_l0_active_mi=
nus1;
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0 i++)
> > > +			if (p_hevc_slice_params->ref_idx_l0[i] >=3D
> > > +			=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> > > +				return -EINVAL;
> >=20
> > That one is a breaking change since userspace already passes off limit =
values
> > such as 0xff when a reference is missing (was lost). See:
> >=20
> > 	47825b1646a6a9eca0f90baa3d4f98947c2add96
> >=20
> > The hardware may or may not be capable of doing concealment, but with t=
his
> > change, we bring down all drivers to failing the decode completely.
>=20
> So while some decoders may be able to deal with missing references, it se=
ems
> that cedrus should still error out in that case. I don't think it will be=
 very
> happy if we configure the hardware with L0/L1 lists that don't match what=
 was
> used for the encode.

The L0/L1 list passed by application do match the decoder list, but has gap=
s. By
the spec, decoder should be gap resistant. You are better place them me to =
know
what the Cedrus hardware can and cannot do. This is rarely well document, a=
nd in
RE case like this, you probably have to do some trial and errors.

>=20
> But maybe we could pick up another (existing or empty) reference to repla=
ce the
> missing one, which would be better than failing to decode the frame. IMO =
this
> would be best done by userspace, but maybe we'd need some indication to k=
now
> that the hardware cannot deal with missing references.

Exact, experimenting first seems key, every hardware I've worked with behav=
es
differently. Hantro G2 notably tends to cause system wide issues on imx8mq =
if
you don't carefully select your replacement. Yet, after testing and looking=
 at
the visual result, its way better (visually) to pick a replacement. I have
patches coming that tracks which frame have decoded successfully and holds
initialized MV data (which was the reason it was going wild).

Note that going one step further, on HEVC we could use the poc to find a va=
lid
replacement that is temporarily closer, but that would simply be an enhance=
ment
for streams with reordering.

Nicolas

>=20
> What do you think?
>=20
> All the best,
>=20
> Paul
>=20
> > > +
> > > +		if (p_hevc_slice_params->slice_type !=3D V4L2_HEVC_SLICE_TYPE_B)
> > > +			break;
> > > +
> > > +		if (p_hevc_slice_params->num_ref_idx_l1_active_minus1 >=3D
> > > +		=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> > > +			return -EINVAL;
> >=20
> > Ack.
> >=20
> > > +
> > > +		for (i =3D 0; i <=3D p_hevc_slice_params->num_ref_idx_l1_active_mi=
nus1;
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0 i++)
> > > +			if (p_hevc_slice_params->ref_idx_l1[i] >=3D
> > > +			=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> > > +				return -EINVAL;
> >=20
> > Same.
> >=20
> > cheers,
> > Nicolas
> >=20
> > > =C2=A0		break;
> > > =C2=A0
> > > =C2=A0	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
>=20
>=20

--=-ZeoIaUve0XpjsNwgsS5b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCade0QgAKCRDZQZRRKWBy
9N4YAQCW2AwWKUdRC6yk9gPMKjnR+paqzheVLQrItflUxwOlqgD+KjrxaXTGViqV
o7gy0OVBq5Pz7dapSxeq0JP+y/w+Cgs=
=lLjM
-----END PGP SIGNATURE-----

--=-ZeoIaUve0XpjsNwgsS5b--

