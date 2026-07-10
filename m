Return-Path: <linux-media+bounces-67322-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TzDTG8VZUWrVCwMAu9opvQ
	(envelope-from <linux-media+bounces-67322-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 22:44:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 031D273E76D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 22:44:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=CnVVOsUp;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67322-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67322-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 591D6301D61F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 20:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CE03AA9CA;
	Fri, 10 Jul 2026 20:44:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576DA3A4F3E;
	Fri, 10 Jul 2026 20:44:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716289; cv=none; b=VQxELy4pQC2U5aJkE58sit0uKz2p6ARtwzi2Aj3K2rgfBWuP+UtSj5Sb73p9YwDdE1Yxe5bjB2uepLbWE58jDhhwQcLxCxzjaBMdznZZ9Q95eF3JnZ6sByPmH9g+x8GSuY7EUP9tLGYcfEe3/O86L+fp80y8f903np631gKIFJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716289; c=relaxed/simple;
	bh=ltqMKCiaqQdjvTI+FF1Bbx8iaCWQ0kLFmcfGnyBTD70=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z2p8WdPUVF7OyzQ82pghymccaeHc7ngACAiFEpSRLvuRrdyQZlsg6tVNbFoqk617N+NivxY6Ip2jrwq66fsA78Tu3d5mjz+uyL8VhhsIMio38KkodWlClyYfyJZZJyDMATiRyARpFl0vZi6G4NjlblfVG/DX+0+mHVURd2EQopo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CnVVOsUp; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783716284;
	bh=ltqMKCiaqQdjvTI+FF1Bbx8iaCWQ0kLFmcfGnyBTD70=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=CnVVOsUpmfXVpd5NASaGnZj2GulmbwGyMJKdSNXJPWhcrujOmjTkV+9t5n7689Nka
	 8NUvv8FnT/G4c4p6720OQw0ksqjvI5Ey196DAZh7zw0wy87sYnBu+IoDNH0bIXEc+b
	 l5etBxyFOZe3MEyw9Dp9N0GbUicFnd6UDjykD2a2qxpOeo0Pdbk2AMFCK5CL3O4+Al
	 OkdfhZCO4CMeDHEQM1wew+ibxJRZIwHy0a72eK+k2Z5VXR9HBVh11SDBrvHohHr/5w
	 gEkApOdH8jU0XlHa40XIHPWPz83KFrSZFXc+pYC0aTVC0oga/hXypRwe8GofYvErXd
	 ZLrU4ofi8pQpQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 33BAE17E03CE;
	Fri, 10 Jul 2026 22:44:43 +0200 (CEST)
Message-ID: <88535b996b84fae201592da11847ce9f7735a7eb.camel@collabora.com>
Subject: Re: [PATCH v2] media: cedrus: reject invalid active H.264 ref
 indices
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland	 <samuel@sholland.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 10 Jul 2026 16:44:41 -0400
In-Reply-To: <273883f0479afb1037d9b4b815937267b6bd658d.camel@collabora.com>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
		 <20260409223001.1-cedrus-h264-active-v2-pengpeng@iscas.ac.cn>
	 <273883f0479afb1037d9b4b815937267b6bd658d.camel@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-o4MtyftxKrMMeCtHeUA0"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67322-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:mripard@kernel.org,m:paulk@sys-base.io,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,iscas.ac.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 031D273E76D


--=-o4MtyftxKrMMeCtHeUA0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 10 juillet 2026 =C3=A0 16:34 -0400, Nicolas Dufresne a =C3=A9cr=
it=C2=A0:
> Le jeudi 09 avril 2026 =C3=A0 21:30 +0800, Pengpeng Hou a =C3=A9crit=C2=
=A0:
> > Cedrus consumes the active ref_pic_list0/ref_pic_list1 entries and uses
> > their indices to look up decode->dpb[] in _cedrus_write_ref_list().
> >=20
> > Those active portions are the first
> > num_ref_idx_l0_active_minus1 + 1 / num_ref_idx_l1_active_minus1 + 1
> > entries in the two reference lists.
> >=20
> > An out-of-range index in that active portion can therefore read past th=
e
> > fixed V4L2_H264_NUM_DPB_ENTRIES array.
> >=20
> > Checking this in cedrus_try_ctrl() is awkward because the request-local
> > DPB state may not have been applied yet. Instead, validate the active
> > entries at the actual Cedrus use site and fail setup with -EINVAL if on=
e
> > points past decode->dpb[].
> >=20
> > Entries beyond the active reference counts remain ignored as before, so
> > this does not change how Cedrus treats unused tail data in the
> > reference-list controls.
> >=20
> > Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> > ---
> > Changes since v1:
> > - reject invalid indices in the active reference list entries instead o=
f
> > =C2=A0 silently skipping them
> > - keep the validation at the Cedrus use site, but propagate -EINVAL bac=
k
> > =C2=A0 through setup
> >=20
> > =C2=A0drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 32 +++++++++++=
+++--
> > =C2=A01 file changed, 29 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers=
/staging/media/sunxi/cedrus/cedrus_h264.c
> > index 3e2843ef6cce..58c411c580f3 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -186,10 +186,10 @@ static int cedrus_write_frame_list(struct cedrus_=
ctx *ctx,
> > =C2=A0
> > =C2=A0#define CEDRUS_MAX_REF_IDX	32
> > =C2=A0
> > -static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
> > -				=C2=A0=C2=A0 struct cedrus_run *run,
> > -				=C2=A0=C2=A0 const struct v4l2_h264_reference *ref_list,
> > -				=C2=A0=C2=A0 u8 num_ref, enum cedrus_h264_sram_off sram)
> > +static int _cedrus_write_ref_list(struct cedrus_ctx *ctx,
> > +				=C2=A0 struct cedrus_run *run,
> > +				=C2=A0 const struct v4l2_h264_reference *ref_list,
> > +				=C2=A0 u8 num_ref, enum cedrus_h264_sram_off sram)
> > =C2=A0{
> > =C2=A0	const struct v4l2_ctrl_h264_decode_params *decode =3D run->h264.=
decode_params;
> > =C2=A0	struct vb2_queue *cap_q;
> > @@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_ct=
x *ctx,
> > =C2=A0		u8 dpb_idx;
> > =C2=A0
> > =C2=A0		dpb_idx =3D ref_list[i].index;
> > +		if (dpb_idx >=3D V4L2_H264_NUM_DPB_ENTRIES)
> > +			return -EINVAL;
> > +

Ah, got confused in triaging, this one got actually replaced by what we alr=
eady
merged, which is just these two lines. Marking as obsolete, feel free to fo=
llow-
up.

cheers,
Nicolas

> > =C2=A0		dpb =3D &decode->dpb[dpb_idx];
> > =C2=A0
> > =C2=A0		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> > @@ -229,28 +232,30 @@ static void _cedrus_write_ref_list(struct cedrus_=
ctx *ctx,
> > =C2=A0
> > =C2=A0	size =3D min_t(size_t, ALIGN(num_ref, 4), sizeof(sram_array));
> > =C2=A0	cedrus_h264_write_sram(dev, sram, &sram_array, size);
> > +
> > +	return 0;
> > =C2=A0}
> > =C2=A0
> > -static void cedrus_write_ref_list0(struct cedrus_ctx *ctx,
> > -				=C2=A0=C2=A0 struct cedrus_run *run)
> > +static int cedrus_write_ref_list0(struct cedrus_ctx *ctx,
> > +				=C2=A0 struct cedrus_run *run)
> > =C2=A0{
> > =C2=A0	const struct v4l2_ctrl_h264_slice_params *slice =3D run->h264.sl=
ice_params;
> > =C2=A0
> > -	_cedrus_write_ref_list(ctx, run,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->ref_pic_list0,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->num_ref_idx_l0_active_m=
inus1 + 1,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CEDRUS_SRAM_H264_REF_LIST_0);
> > +	return _cedrus_write_ref_list(ctx, run,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->ref_pic_list0,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->num_ref_idx_l0_active_minus1=
 + 1,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CEDRUS_SRAM_H264_REF_LIST_0);
> > =C2=A0}
> > =C2=A0
> > -static void cedrus_write_ref_list1(struct cedrus_ctx *ctx,
> > -				=C2=A0=C2=A0 struct cedrus_run *run)
> > +static int cedrus_write_ref_list1(struct cedrus_ctx *ctx,
> > +				=C2=A0 struct cedrus_run *run)
> > =C2=A0{
> > =C2=A0	const struct v4l2_ctrl_h264_slice_params *slice =3D run->h264.sl=
ice_params;
> > =C2=A0
> > -	_cedrus_write_ref_list(ctx, run,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->ref_pic_list1,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->num_ref_idx_l1_active_m=
inus1 + 1,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CEDRUS_SRAM_H264_REF_LIST_1);
> > +	return _cedrus_write_ref_list(ctx, run,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->ref_pic_list1,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slice->num_ref_idx_l1_active_minus1=
 + 1,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CEDRUS_SRAM_H264_REF_LIST_1);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void cedrus_write_scaling_lists(struct cedrus_ctx *ctx,
> > @@ -338,8 +343,8 @@ static void cedrus_skip_bits(struct cedrus_dev *dev=
, int num)
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > -static void cedrus_set_params(struct cedrus_ctx *ctx,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct cedrus_run *run)
> > +static int cedrus_set_params(struct cedrus_ctx *ctx,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct cedrus_run *run)
> > =C2=A0{
> > =C2=A0	const struct v4l2_ctrl_h264_decode_params *decode =3D run->h264.=
decode_params;
> > =C2=A0	const struct v4l2_ctrl_h264_slice_params *slice =3D run->h264.sl=
ice_params;
> > @@ -351,6 +356,7 @@ static void cedrus_set_params(struct cedrus_ctx *ct=
x,
> > =C2=A0	size_t slice_bytes =3D vb2_get_plane_payload(src_buf, 0);
> > =C2=A0	unsigned int pic_width_in_mbs;
> > =C2=A0	bool mbaff_pic;
> > +	int ret;
> > =C2=A0	u32 reg;
> > =C2=A0
> > =C2=A0	cedrus_write(dev, VE_H264_VLD_LEN, slice_bytes * 8);
> > @@ -393,11 +399,17 @@ static void cedrus_set_params(struct cedrus_ctx *=
ctx,
> > =C2=A0
> > =C2=A0	if ((slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_P) ||
> > =C2=A0	=C2=A0=C2=A0=C2=A0 (slice->slice_type =3D=3D V4L2_H264_SLICE_TYP=
E_SP) ||
> > -	=C2=A0=C2=A0=C2=A0 (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B))
> > -		cedrus_write_ref_list0(ctx, run);
> > +	=C2=A0=C2=A0=C2=A0 (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B))=
 {
> > +		ret =3D cedrus_write_ref_list0(ctx, run);
> > +		if (ret)
> > +			return ret;
> > +	}
> > =C2=A0
> > -	if (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B)
> > -		cedrus_write_ref_list1(ctx, run);
> > +	if (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B) {
> > +		ret =3D cedrus_write_ref_list1(ctx, run);
> > +		if (ret)
> > +			return ret;
> > +	}
> > =C2=A0
> > =C2=A0	// picture parameters
> > =C2=A0	reg =3D 0;
> > @@ -478,6 +490,8 @@ static void cedrus_set_params(struct cedrus_ctx *ct=
x,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 VE_H264_CTRL_SLICE_DECODE_INT |
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 VE_H264_CTRL_DECODE_ERR_INT |
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 VE_H264_CTRL_VLD_DATA_REQ_INT);
> > +
> > +	return 0;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static enum cedrus_irq_status
> > @@ -531,9 +545,7 @@ static int cedrus_h264_setup(struct cedrus_ctx *ctx=
, struct cedrus_run *run)
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > -	cedrus_set_params(ctx, run);
> > -
> > -	return 0;
> > +	return cedrus_set_params(ctx, run);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int cedrus_h264_start(struct cedrus_ctx *ctx)

--=-o4MtyftxKrMMeCtHeUA0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFZuQAKCRDZQZRRKWBy
9E4gAP9IKReqizEjnQfn4ApLGat1bJ5U0qQKq3VhmdZ9lvsLyQEAlR9FERLUU97O
YAYg5Flg0N0JR45jozsHFNE8RcF5JgE=
=Ag+W
-----END PGP SIGNATURE-----

--=-o4MtyftxKrMMeCtHeUA0--

