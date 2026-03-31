Return-Path: <linux-media+bounces-57794-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH5+Jhbgy2m0MAYAu9opvQ
	(envelope-from <linux-media+bounces-57794-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 16:54:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B9E36B3A7
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 16:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51952300B294
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 14:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A133F9F31;
	Tue, 31 Mar 2026 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="mkQUPt9D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C7282F00
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968849; cv=none; b=YjEtJLAu6Lh5aM9Ac/QYPPyEzEIr0Wg6/D1NZnqoCqVaJI5yCuq6Xn51ubSgwH9vA/9RIGPncxgEn0rU44Q204sDI6sH+axVRwrT6snjUAgdh1c5wMEfVCgW1OJTY6S3+65rqtqKAmCRTdwhYUUpv+9VkS50T/ROKxb6hXvNxsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968849; c=relaxed/simple;
	bh=4UGmf50+gfLnZc6+u6iDl6NicmkmuoVpuu9aSS4dDAY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VzzX7JyJveXxy7+d26xgnXBjKtmRqI05Ss0qcGzEov3KdrsFc9eWosNmfahkovbkbHYUag+VAUhEwvOAcJOVcE4p6dJhry2PNww2PJBN+GnHA6XAQM0nvWmbNY97AqLzqk0QI1JnBUaCrx4Qczd1fewaZI/60yPcyPFvacJWGOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=mkQUPt9D; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8a016799d2cso34623796d6.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774968846; x=1775573646; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xn5zNT1spHRq0DkkC+7339Y+wwjQRD78iQTIrf+3mdw=;
        b=mkQUPt9DlZ3Qj65ZEnp3sTy8L8sWLjLstnNYuCrRqsDEXjLCA0ILua8dNgdl+y04w1
         I3+lJJ2RzW3rQreCPB4amYQMEvXn4mRQLBuC1YmueZTALgqBBfCFvTknfbP4fsY72Xsy
         Hh9yp+iYUZFdvqs9ML1o4gun5M7ey8/oGWcRDx59dFXHBwwAf095p9HvS+mgfgdtlA6r
         VXWdyMJ4NYgmbWwVqXOMjtxSKbkJE8w3mrbCMbQ4hCRkhyyX3fLcbVw7MI2LwLNq5KxB
         4dTngYFn0NUJYM2/8R/o8s5CisCS346Skkpv5xu1ekPvIHJZgXKVfdkh0Af93zOO8QDn
         fnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774968846; x=1775573646;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xn5zNT1spHRq0DkkC+7339Y+wwjQRD78iQTIrf+3mdw=;
        b=I0TN45semPWlGp4WqSZf8P0NfwAP5d4EnCwsy2ncrUXQV8j4fELRGVsDSQ+Dt0ALJ0
         rHMlECMu1T3yh363rhrV4BgH53QWU1RonDfC35rQ6aJeSv6hz91KjVEmvX1B/PpqeDi8
         mV0s1hdgoj/ig6LC7QpkB8kHgB0VPnXfx2yIWs2acTkbDTv/mr7z3RbN/3JghIibl/Q7
         g1s4X04/HJO9yqh0CO/39bVRw56mAw1IbLGtobtQZLzQjlRMft6MQ19/bFYuacFEh75i
         jE4rk5VOdTP/KVAxdYcDLjdAJXRCS3/o6hEJifK++500RWUYRCtl7FgUmWrmSf7YZx5a
         Hnuw==
X-Gm-Message-State: AOJu0Yzw1z5WN2aCJAAnDmj38Xmx1PHKesqZ5ROkIcs348j/VBHomP1R
	lfyXBtiZHA0yQck4vclX1bNURusP7d35B/cjYTXwJy9M9q0+7ebL97mLcVkTl2Rsjnc=
X-Gm-Gg: ATEYQzwikf1MOMbRg3eFNezpKhtazztMFRJwWVh4T7poqXDO0f56NuWNym/ixZTkklM
	FwrJkl2HfDJMx+xmmhIx1N6tVy1BGV5OsQyK87WIdHIcK/DL7ls6Oy+Itr2dgWP+PizRJZGecWd
	SKvYjrpYX5ThXYYPCd024gtZzXOqJVZ3cx/5uQ6H8O6jMZ9s9qh+1pCimRZbkOe+UtIgcrCniFf
	9AAzrFUyo1aWcWpx3O0tQhulKg7N3QqXfrsfJFhjuRjNF9l1M6CILAMJAWSz7yEq7LjZDJpEshz
	0WQN/VOpEG5bUyeIPyyzHM+m+v/2dOA0MrZ69ysldA4eRPctXaBcGnf8j9SKhYYV5zhPasRb0Uz
	c7Gdtd3PTS8nYxluJQqVeVZtThHruyoh54AypjTYaauWd/ApgxyO2wE7ql/60UkHilc3W8lqswi
	2XbtPbGl17GYCmlR/oxp+SCk0CBBWb
X-Received: by 2002:a05:6214:27cb:b0:89c:ca30:6b92 with SMTP id 6a1803df08f44-89ce8f8d2fcmr240762806d6.56.1774968846090;
        Tue, 31 Mar 2026 07:54:06 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecb5cb14bsm89054306d6.1.2026.03.31.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:54:05 -0700 (PDT)
Message-ID: <079b1630abe5dd22e032797fc12925c9c79ea305.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 31 Mar 2026 10:54:03 -0400
In-Reply-To: <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
	 <20260331072347.253-2-ming.qian@oss.nxp.com>
	 <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
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
	protocol="application/pgp-signature"; boundary="=-L4QS/jCTQxYv029Nq/FW"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57794-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,xs4all.nl,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email,ndufresne.ca:mid,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 49B9E36B3A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-L4QS/jCTQxYv029Nq/FW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 31 mars 2026 =C3=A0 10:33 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Tue, Mar 31, 2026 at 03:23:11PM +0800, ming.qian@oss.nxp.com=C2=A0wrot=
e:
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
> > applications to query the total amount of memory currently used
> > by a device instance.
> >=20
> > This control reports the memory consumption in bytes, including
> > internal buffers, intermediate processing data, and other
> > driver-managed allocations. Applications can use this information
> > for debugging, resource monitoring, or making informed decisions
> > about buffer allocation strategies.
> >=20
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > ---
>=20
> Not sure why not export these information by debugfs, or any benefit vs
> debugfs?

There is also a on-going proposal that uses fdinfo.

Nicolas

>=20
> Generanlly document should be first patch, then driver change.
>=20
> Frank
>=20
> > =C2=A0drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
> > =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 4 +++-
> > =C2=A02 files changed, 11 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 551426c4cd01..053db78ff661 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > =C2=A0	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
> > =C2=A0	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
> > =C2=A0	case V4L2_CID_COLORFX_RGB:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Color Effects, RGB";
> > +	case V4L2_CID_MEMORY_USAGE:		return "Memory Usage";
> >=20
> > =C2=A0	/*
> > =C2=A0	 * Codec controls
> > @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char **name, e=
num v4l2_ctrl_type *type,
> > =C2=A0		*min =3D 0;
> > =C2=A0		*max =3D 0xffff;
> > =C2=A0		break;
> > +	case V4L2_CID_MEMORY_USAGE:
> > +		*type =3D V4L2_CTRL_TYPE_INTEGER64;
> > +		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +		*min =3D 0;
> > +		*max =3D S64_MAX;
> > +		*step =3D 1;
> > +		break;
> > =C2=A0	case V4L2_CID_FLASH_FAULT:
> > =C2=A0	case V4L2_CID_JPEG_ACTIVE_MARKER:
> > =C2=A0	case V4L2_CID_3A_LOCK:
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index 68dd0c4e47b2..02c6f960d38e 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -110,8 +110,10 @@ enum v4l2_colorfx {
> > =C2=A0#define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
> > =C2=A0#define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE+43)
> >=20
> > +#define V4L2_CID_MEMORY_USAGE			(V4L2_CID_BASE+44)
> > +
> > =C2=A0/* last CID + 1 */
> > -#define V4L2_CID_LASTP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+44)
> > +#define V4L2_CID_LASTP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (V4L2_CID_BASE+45)
> >=20
> > =C2=A0/* USER-class private control IDs */
> >=20
> > --
> > 2.53.0
> >=20

--=-L4QS/jCTQxYv029Nq/FW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacvgCwAKCRDZQZRRKWBy
9HhiAP9pxmgO01Tw2u1jmX3JDGf0HUlwoJFHITjsspschCXhGwEA2CLSZfwaGF3P
FBjvjpv8iG0M2472UaZ+ET35dRy4DwA=
=NB0B
-----END PGP SIGNATURE-----

--=-L4QS/jCTQxYv029Nq/FW--

