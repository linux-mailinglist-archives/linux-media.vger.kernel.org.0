Return-Path: <linux-media+bounces-61278-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGTlDGJDA2pV2QEAu9opvQ
	(envelope-from <linux-media+bounces-61278-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:12:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D641523613
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E36B830A7B5E
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8DB3B1EEE;
	Tue, 12 May 2026 15:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="SpWeMTXA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3633812F1
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598581; cv=none; b=X54L86KiwHHdG1bxoudmfpNPQSMajh5mQ0N4tMcqpplP21vEHdwyrolJyrvDiBvDsm4s5EupSxDkdUgjLg3vmHEyutJxYN5UHGgXivCgp37z845aeYFSTSLnZiGXPq/XT9xR6P/3rHzI6XWWa4leZz0WXV39plykoZsIb/6sV3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598581; c=relaxed/simple;
	bh=lUCx5uFXTTWqLehLj1KPSUPQozM+3vjKHNmquKV+oo0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L8IWE4eUP6+5n2R6MAVlXPpSNKAfjsdAmuiTuf5K8eaCtxMdb4VTpA2K439zrZMGXh55grUSBDwyjwaIgEoHrIEdIpIQ1BFeeE7lxXA3VeD7A1W3r4wzEHuHWZDXmfEQucyaT9u04BU7QF8uR+OVMeWUBfyFGtZU9aQA3ZI31PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=SpWeMTXA; arc=none smtp.client-ip=209.85.160.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-50d876329bbso53527371cf.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778598579; x=1779203379; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e1GJZ3i503zdsckWYgIltPX4s+TXFKGqeqpxW9ex+gs=;
        b=SpWeMTXA75Lx0BqUFlDaJNteIGw5mMT8LYIZU7bmdX3Cczsslb0+kUBSU/Y66xmV+T
         w4I5GmgpOg9qswTHDpDMl5jX/NrC0zyzozuEKst3BSjwjKLjUPpSffw/AbXhHW75O3f/
         BbQH+Y1K7CX9XIRj+0CExdPDdqvwH6BlHhXR8ymF8azBmbg0AiyRzwza8em3QtT39lQj
         JU5AfoHXU/8V0kQmAXwZtp+948l/6i5QqRriV6oWQZKGc46WSN8rk0OH8MVjbaa0EJTs
         ov9MYmB+kigPabl/Fzm1DAhRcvXMrOnkd+9Fs0J0Xmxck2zIVBq6BwG7HKwEUj4cEhos
         zFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598579; x=1779203379;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1GJZ3i503zdsckWYgIltPX4s+TXFKGqeqpxW9ex+gs=;
        b=IL15jXfNP4cqWOkckA9B/8KGzLU4wYV6Di+aE93+ggiZhFCFbckxJQga+uE/NTxGnW
         6nmaKxt8ja9bwN2VUS+MkKZLQqUbPOHm/uQVIJB50JdCLepnUUl8PUz/DcqYvL+98vKg
         arMZ9BqOFZhsiYXp1S1pqDnoTRH/UddimQf6eSYvauAp6KbS6HTA432Px2JyN1YmnRPX
         l1WT9409/hVlkXvBGGYEnHmbS5AzWqTwCFF7H8PoXjXhUAkzQcFj5gTK/eG5ZMyrzJuO
         SgmhfdTeQMtvulhJlL6QCVcY2MEuvWqYm6ejxf1Bf7W/OsdTLhVO227bCk1FcB7PQ0Fe
         YS0A==
X-Gm-Message-State: AOJu0Yx9D+yba3tAbjbugP+XCx6CtsSEZr3UEj5A6CVJ8npo9MUGJ9UR
	xW750bahcMmQHzpVL+2FInbZJ8JRh977hSR3Q5Y0KwHDOuYm5C79Z8SbTI1nMNCbUTs=
X-Gm-Gg: Acq92OFC2btiPZHbnuWmehLzwTv0CZ/K4FFr6EeD2JN9WpDZVHXBZcpX76W2/JtVp2+
	/A9W3sPcJoGAGClzgUQURQpedEZkxXIHMzNMJRpT7XNvCXL+P9Fn4lcoPmXhhHsvfABSG2DH+XK
	iFXl1v63gS+kIxKgJJwe8Q8dbVdnBVs7IvqVB5YiM7fRNs9PrQ87sfXdbT5wHpZxfC3s3GwSZf8
	fmUQI2Pc/bUZWKf1/U16/YDVB9KwfJmiYbZAYpDZhitkijTM5CoqvH3zNg1uDR9GpMkSz/5Z1ea
	DyoX6I9zxnnLtnrX7wXlae9Df0f93RFx5vpAShYrOmJ3lw9Loxw18+5wVqLFzx0sY4OdohoGkNL
	A6MyomtIPiN+eR57vG4Jro5sL/nG9s+e5gAEhZauE09aei8wnorix5niXAnMvrqQHKKb3UCZJJr
	3bqTDaJcdoLM0gn8piOVXS61gimIJqMeTZlLFFq3A=
X-Received: by 2002:a05:622a:341:b0:510:138e:b83c with SMTP id d75a77b69052e-514d20e0341mr47122861cf.33.1778598578821;
        Tue, 12 May 2026 08:09:38 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e656452sm136800971cf.7.2026.05.12.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:09:37 -0700 (PDT)
Message-ID: <b354afdfd28ec3736791755d9ce8cae49a744a96.camel@ndufresne.ca>
Subject: Re: [PATCH v5 12/29] media: rockchip: rga: avoid odd frame sizes
 for YUV formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com
Date: Tue, 12 May 2026 11:09:35 -0400
In-Reply-To: <e6d562e7-a9d2-4a1a-a139-c6e05eb4aaef@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-12-eb7f5d019d86@pengutronix.de>
	 <4f5e481c8883b358ee4cef64f26f3f00f0ac7304.camel@ndufresne.ca>
	 <e6d562e7-a9d2-4a1a-a139-c6e05eb4aaef@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-qN1+gvfnAtUxv/ubnzMi"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8D641523613
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61278-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ndufresne.ca:mid,pengutronix.de:email]
X-Rspamd-Action: no action


--=-qN1+gvfnAtUxv/ubnzMi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 12 mai 2026 =C3=A0 16:56 +0200, Sven P=C3=BCschel a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On 5/8/26 11:18 PM, Nicolas Dufresne wrote:
> > Le mardi 28 avril 2026 =C3=A0 11:00 +0200, Sven P=C3=BCschel a =C3=A9cr=
it=C2=A0:
> > > Avoid odd frame sizes for YUV formats, as they may cause undefined
> > > behavior. This is done in preparation for the RGA3, which hangs when =
the
> > > output format is set to 129x129 pixel YUV420 SP (NV12).
> > >=20
> > > This requirement is documented explicitly for the RGA3 in=C2=A0 secti=
on 5.6.3
> > > of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
> > > (section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions th=
e
> > > x/y offsets and stride aligning requirements. But the vendor driver f=
or
> > > the RGA2 also contains checks for the width and height to be aligned =
to
> > > 2 bytes.
> > >=20
> > > Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > > ---
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++=
++++-----
> > > =C2=A0=C2=A01 file changed, 14 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/medi=
a/platform/rockchip/rga/rga.c
> > > index f599c992829dd..77b8c7ab74274 100644
> > > --- a/drivers/media/platform/rockchip/rga/rga.c
> > > +++ b/drivers/media/platform/rockchip/rga/rga.c
> > > @@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, voi=
d *priv, struct v4l2_format *f)
> > > =C2=A0=C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> > > =C2=A0=C2=A0	const struct rga_hw *hw =3D ctx->rga->hw;
> > > =C2=A0=C2=A0	struct rga_fmt *fmt;
> > > +	struct v4l2_frmsize_stepwise frmsize =3D {
> > > +		.min_width =3D hw->min_width,
> > > +		.max_width =3D hw->max_width,
> > > +		.min_height =3D hw->min_height,
> > > +		.max_height =3D hw->max_height,
> > > +		.step_width =3D 1,
> > > +		.step_height =3D 1,
> > > +	};
> > > +
> > > +	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
> > > +		frmsize.step_width =3D 2;
> > > +		frmsize.step_height =3D 2;
> > I think its fine like this, so let's start with:
> >=20
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >=20
> > But it does not feel like a hardware alignment to me. When we process i=
n
> > software these things, the minimum alignment is bound to the subsamplin=
g, since
> > there is no way to store half or quarter pixels, the padded width/heigh=
t
> > requires a step that follow the subsampling, something like:
> >=20
> > 		frmsize.step_width =3D finfo->hdiv;
> > 		frmsize.step_height =3D finfo->vdiv;
>=20
> I agree that this looks better. My main intention is to be more=20
> conservative, as the Rockchip related code/docs seem to always ensure a=
=20
> 2 pixel alignment in both directions even for formats like YUV422, where=
=20
> we shouldn't have an alignment requirement in the height. Besides the=20
> vendor driver and TRM mentioned in the datasheet, the librga and it's=20
> docs also mention an alignment of 2 (pixels?!) for all YUV formats (see=
=20
> format alignment list in [1] and Q2.5 in [2]).
>=20
> Given that the driver currently doesn't have any way to get the cores=20
> unstuck/reset in case of a hang, I'd like to play it more safely by=20
> adhering to what the vendor does instead of trying to do more and=20
> therefore allowing some potential breaking format. E.g. I've also=20
> experimented with sizes of=C2=A068x2, which the librga allows as input/ou=
tput=20
> of the RGA3 (whereas the TRM specifies a min size of 128x128), but=20
> quickly dropped it as it produced some interesting broken outputs.

Agreed, simply preserve my Rb in next version.

cheers,
Nicolas

>=20
> Sincerely
> =C2=A0=C2=A0 =C2=A0 Sven
>=20
>=20
> [1]=20
> https://codeberg.org/airockchip/librga/src/branch/main/docs/Rockchip_Deve=
loper_Guide_RGA_EN.md#image-format-alignment-instructions
>=20
> [2]=20
> https://codeberg.org/airockchip/librga/src/branch/main/docs/Rockchip_FAQ_=
RGA_EN.md
>=20
> >=20
> > Nicolas
> >=20
> >=20
> > > +	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> > > =C2=A0=C2=A0		const struct rga_frame *frm;
> > > @@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, voi=
d *priv, struct v4l2_format *f)
> > > =C2=A0=C2=A0	if (!fmt)
> > > =C2=A0=C2=A0		fmt =3D &hw->formats[0];
> > > =C2=A0=20
> > > -	pix_fmt->width =3D clamp(pix_fmt->width,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->min_width, hw->max_width=
);
> > > -	pix_fmt->height =3D clamp(pix_fmt->height,
> > > -				hw->min_height, hw->max_height);
> > > -
> > > +	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &=
frmsize);
> > > =C2=A0=C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width=
, pix_fmt->height);
> > > =C2=A0=C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> > > =C2=A0=20

--=-qN1+gvfnAtUxv/ubnzMi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagNCsAAKCRDZQZRRKWBy
9C0fAP457K60/ZJ3ZLSyjkjg60UiJKpqRH2brs1rrxHPVXniJgEA9cbujVJ5Cbin
Jn9LmlNpceZNGbjSuImEtMjHkEqw3AU=
=l7Hh
-----END PGP SIGNATURE-----

--=-qN1+gvfnAtUxv/ubnzMi--

