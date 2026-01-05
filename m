Return-Path: <linux-media+bounces-49936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8EACF5091
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 18:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91662300873F
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 17:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E16A335095;
	Mon,  5 Jan 2026 17:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="sXToJtTB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2594335093
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767634957; cv=none; b=pM3rPpQbz9nnx6+NXdqLfmvgSS30OckGtaDvA/uvUt3jrxSWJH+680LpbfeN6Pd5gjXx6BWucknHE7y5zmDAmGMmf9nWfkjIhhbecZzjCCQOSrth6Dn4GNeTgf72nqYgHM/OtLOaSQwiRcZInRN5TxPFiW+4wk5yFTc+UJ6uqfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767634957; c=relaxed/simple;
	bh=z0utO/6ycokal14LGAWHrcXbjtCkE+QM/XrC+D0YMQU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j0KUYpBzfzCxupBWxkLrZiSVoIr/Xd9S1c6Ni4EDkoaNEQWQI5/CusHiFEIRDls+aXJXOFhPFmw4JvOKYaBBNlew2H/lXXrQOVbc8fwtG4GHPmaBbfduZ2yoKuEKttPmx2VRgo3b2iH5O+n9ev3/RFLPgO5rcIps1uu8TYxykdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=sXToJtTB; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2f2c5ec36so15111085a.1
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767634955; x=1768239755; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z0utO/6ycokal14LGAWHrcXbjtCkE+QM/XrC+D0YMQU=;
        b=sXToJtTBawVR33apfGgmmxtMir+p3HshSXirqJahFEeGA+G4lKTzqsGA7JLWlkEQaO
         7i073Ws+XLwjmYyIk3MgjuqNhTAq1ARlIh+iQnwtF27C9EjAWZLTUAKNIh+1RO9NssNK
         31TVvulcpK4egf2K8FnkZiKp94V+RVTEwAAfer3V4j7/BxY3i+vrKRP59j8ouY7WcV7Q
         kZRanuD730jUfztNysy8y+FEKyngP+Nz3vArRACqWNu6EZIMuvYx11VUkQpOk7DcJ8th
         6/9LTwV64TdyS/FUI7Rp7DhCz0+hntNEdug+9KXxIrb5jvzdS8h4PCYSSen8f1tBUH/v
         sk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767634955; x=1768239755;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0utO/6ycokal14LGAWHrcXbjtCkE+QM/XrC+D0YMQU=;
        b=syb4I+QVOQ5eespcMfwsaXy+9j7n+7QNH5w+KXSLZqB5JVUEbDpZVLuifkXqKUwlE0
         hkmq162xAPshzNfrwSxof2RZHU3iPkUGYxBxs3/bA8uOcxJB2hdeEW5QQ+iemH/HP03u
         79R1G6fL6jkEfJBJC8yoLqqoDcx8QUGTJkbiZYiVLbCWD2eFokzEt830tJptQ8/xPw57
         BOMlwfYlMEI8ohVbqMYTLuJT5T/CpOCA/2z6jKxoI2cHgybWKJEA/Rd6u8ugUCW4Jbym
         QAQbdnFwwahO8/rOl9MFUziPh31fUmpngiufKF2Nzamk3JkIvx7wihMZ6JObzJaCj4Yp
         hJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoL7VJNb7LfX7HmBn5NIIovD/DJF7tSdAEdolbOgbqp6iBPD30+VsativzcgS1MWtZ11gdvZk7E00/2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn/WaCQWwfdO6iKpNJGF3YfHmOJixzMRgEjpXzU4cSXwRfB5eU
	Ht3EmyKWwFJVhJhoLsZPmfWGTdMHGE9VwSeczPqo+giwq0oOK5oWV3raYL/dK/Vit08=
X-Gm-Gg: AY/fxX4Kj/bDungRDzd1y7TE6zL0BOwYdw8CedNF0sSRJTAp/7Q/y5nsOTVIdeiKJ+Q
	kckaLqzbzIqUJjkZ/1pUjGN9md6GOEPOoSR+nCDqISdUubTPo68tfR/xOkzFctnwUwdgZ5Rkool
	1VJM2CL/IJ+9ryh1zkOcmEsAuG5eA/8ux2Cnf9ODrC80yNwZ+LDwMwKYoSrg8kuqYrx3x3JuAWo
	l/KMpYpp2v07ou4K6I/s6sjl1Chz2JBcwLjne5jPQk+8AbM8/aa/HAq0LfzJdX8eikt1/cbpmr3
	Xkf+z2SgxjmqGuB89UJf2fQfNEpCjTiQ4L7NkTbtkOD+9ZFiQ/MkCLiFpeEICINOXMVq/PwYVS/
	K+7R+fK0xcWIC119RlcsXO4yRxxojkhVqdNrgcu+7jXnyTAu5qXU9Z+4/zVnOtOtgTI3PaSnX5n
	20h9qkUT3HwAaJ+Fat
X-Google-Smtp-Source: AGHT+IH7ZXNaLdxqUIVa321jKLLidzT/BcaaKqy0d6La1K8eJ6Z6rq5a2Zcrle8ssVpRrVaJUXep9Q==
X-Received: by 2002:a05:620a:3901:b0:88f:ee0a:3d66 with SMTP id af79cd13be357-8c37ebb7598mr55925685a.80.1767634950799;
        Mon, 05 Jan 2026 09:42:30 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37ea9786esm21526985a.37.2026.01.05.09.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 09:42:29 -0800 (PST)
Message-ID: <876ca21ae8638c0b801056a413b2660e255af722.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/3] media: rkvdec: Add support for the VDPU346
 variant
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian Hewitt <christianshewitt@gmail.com>, Diederik de Haas
	 <diederik@cknow-tech.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, Nicolas Dufresne	
 <nicolas.collabora@collabora.com>, Olivier =?ISO-8859-1?Q?Cr=EAte?=	
 <olivier.crete@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, Thomas
 Gleixner <tglx@linutronix.de>, Dragan Simic <dsimic@manjaro.org>, Chukun
 Pan <amadeus@jmu.edu.cn>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Mon, 05 Jan 2026 12:42:27 -0500
In-Reply-To: <71EA9FB8-83DB-4785-86C1-2E6BA9C739D9@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
	 <20251226113140.573759-3-christianshewitt@gmail.com>
	 <DF84QZ0YBLY8.2DYCSM2EQIF5@cknow-tech.com>
	 <71EA9FB8-83DB-4785-86C1-2E6BA9C739D9@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-3c8D5bbfI2H7z1OlXzoD"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-3c8D5bbfI2H7z1OlXzoD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 26 d=C3=A9cembre 2025 =C3=A0 16:25 +0400, Christian Hewitt a =
=C3=A9crit=C2=A0:
> > On 26 Dec 2025, at 4:00=E2=80=AFpm, Diederik de Haas <diederik@cknow-te=
ch.com> wrote:
> >=20
> > Hi Christian,
> >=20
> > On Fri Dec 26, 2025 at 12:31 PM CET, Christian Hewitt wrote:
> > > VDPU346 is similar to VDPU381 but with a single core and limited
> > > to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
> > > AVS2 capabilities. VDPU346 is used with RK3566 and RK3568.
> > >=20
> > > Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> > > Reviewed-by: Nicolas Dufresne <nicolas.collabora@collabora.com>
> > > ---
> > > .../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 103 +++++++=
+++++++++++
> > > 1 file changed, 103 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec.c
> > > index e547057dc75f..6b39e99d8a8b 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > @@ -236,6 +236,62 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctr=
ls =3D {
> > > .num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
> > > };
> > >=20
> > > +static const struct rkvdec_ctrl_desc vdpu346_hevc_ctrl_descs[] =3D {
> > > + {
> > > + .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> > > + },
> > > + {
> > > + .cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
> > > + .cfg.ops =3D &rkvdec_ctrl_ops,
> > > + },
> > > + {
> > > + .cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,
> > > + },
> > > + {
> > > + .cfg.id =3D V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
> > > + },
> > > + {
> > > + .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_MODE,
> > > + .cfg.min =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> > > + .cfg.max =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> > > + .cfg.def =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> > > + },
> > > + {
> > > + .cfg.id =3D V4L2_CID_STATELESS_HEVC_START_CODE,
> > > + .cfg.min =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> > > + .cfg.def =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> > > + .cfg.max =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> > > + },
> > > + {
> > > + .cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > > + .cfg.min =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > > + .cfg.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > + .cfg.menu_skip_mask =3D
> > > + BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > > + .cfg.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > > + },
> > > + {
> > > + .cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> > > + .cfg.min =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> > > + .cfg.max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
> > > + },
> > > + {
> > > + .cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
> > > + .cfg.ops =3D &rkvdec_ctrl_ops,
> > > + .cfg.dims =3D { 65 },
> > > + },
> > > + {
> > > + .cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
> > > + .cfg.ops =3D &rkvdec_ctrl_ops,
> > > + .cfg.dims =3D { 65 },
> > > + },
> > > +};
> > > +
> > > +static const struct rkvdec_ctrls vdpu346_hevc_ctrls =3D {
> > > + .ctrls =3D vdpu346_hevc_ctrl_descs,
> > > + .num_ctrls =3D ARRAY_SIZE(vdpu346_hevc_ctrl_descs),
> > > +};
> > > +
> > > static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D {
> > > {
> > > .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> > > @@ -463,6 +519,41 @@ static const struct rkvdec_coded_fmt_desc rk3288=
_coded_fmts[] =3D {
> > > }
> > > };
> > >=20
> > > +static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] =3D {
> > > + {
> > > + .fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
> > > + .frmsize =3D {
> > > + .min_width =3D 64,
> > > + .max_width =3D 65472,
> >=20
> > This should be 4096 according to page 469 of RK3568 TRM Part 2 ...
> >=20
> > > + .step_width =3D 64,
> > > + .min_height =3D 64,
> > > + .max_height =3D 65472,
> >=20
> > ... and this 2304.
> >=20
> > > + .step_height =3D 16,
> > > + },
> > > + .ctrls =3D &vdpu346_hevc_ctrls,
> > > + .ops =3D &rkvdec_vdpu381_hevc_fmt_ops,
> > > + .num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
> > > + .decoded_fmts =3D rkvdec_hevc_decoded_fmts,
> > > + .subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> > > + },
> > > + {
> > > + .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> > > + .frmsize =3D {
> > > + .min_width =3D 64,
> > > + .max_width =3D=C2=A0 65520,
> >=20
> > This too should be 4096 according to page 469 of RK3568 TRM Part 2 ...
> >=20
> > > + .step_width =3D 64,
> > > + .min_height =3D 64,
> > > + .max_height =3D=C2=A0 65520,
> >=20
> > ... and this 2304.
> >=20
> > I guess this also explains the 'green images' Nicolas noticed.
>=20
> Quite probably. I=E2=80=99ve picked the above changes into my working tre=
e
> (for those following it) and will send a v3 series in response to
> the next revision of Detlev=E2=80=99s patches.
>=20
> > + .step_height =3D 16,
> > > + },
> > > + .ctrls =3D &rkvdec_h264_ctrls,
> > > + .ops =3D &rkvdec_vdpu381_h264_fmt_ops,
> > > + .num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> > > + .decoded_fmts =3D rkvdec_h264_decoded_fmts,
> > > + .subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> > > + },
> >=20
> > I see you've reversed the order of the blocks so that HEVC now comes
> > before the H264 block. While that makes it consistent with what Detlev
> > has in their v7 and with the existing code in the driver ... I actually
> > prefer having H264 before HEVC as the alphabetical sorting order is
> > H264 before HEVC.
> > In the existing code the VP9 'stuff' is listed below H264 and HEVC.
> >=20
> > But then Detlev should do that too in their patch set ... and 'ideally'
> > the order of the existing code be updated to be alphabetically too.
> >=20
> > OTOH, a consistent order works for me too.
>=20
> I believe the reorder was requested by Nic (offline from the list) so
> there=E2=80=99s probably a reason behind it. I=E2=80=99ll keep things ali=
gned to the
> order in Detlev=E2=80=99s series (whatever that is).

I'm taking note of this feedback, and instead of multiplying the revisions,=
 I
will probably fix it on top once we have the series ready.

regards,
Nicolas

>=20
> Christian
>=20
>=20
> > Cheers,
> > =C2=A0Diederik
> >=20
> > > +};
> > > +
> > > static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
> > > {
> > > .fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
> > > @@ -1643,6 +1734,14 @@ static const struct rkvdec_variant_ops vdpu381=
_variant_ops =3D {
> > > .flatten_matrices =3D transpose_and_flatten_matrices,
> > > };
> > >=20
> > > +static const struct rkvdec_variant vdpu346_variant =3D {
> > > + .coded_fmts =3D vdpu346_coded_fmts,
> > > + .num_coded_fmts =3D ARRAY_SIZE(vdpu346_coded_fmts),
> > > + .rcb_sizes =3D vdpu381_rcb_sizes,
> > > + .num_rcb_sizes =3D ARRAY_SIZE(vdpu381_rcb_sizes),
> > > + .ops =3D &vdpu381_variant_ops,
> > > +};
> > > +
> > > static const struct rkvdec_variant vdpu381_variant =3D {
> > > .coded_fmts =3D vdpu381_coded_fmts,
> > > .num_coded_fmts =3D ARRAY_SIZE(vdpu381_coded_fmts),
> > > @@ -1691,6 +1790,10 @@ static const struct of_device_id of_rkvdec_mat=
ch[] =3D {
> > > .compatible =3D "rockchip,rk3399-vdec",
> > > .data =3D &rk3399_rkvdec_variant,
> > > },
> > > + {
> > > + .compatible =3D "rockchip,rk3568-vdec",
> > > + .data =3D &vdpu346_variant,
> > > + },
> > > {
> > > .compatible =3D "rockchip,rk3588-vdec",
> > > .data =3D &vdpu381_variant,
>=20
>=20

--=-3c8D5bbfI2H7z1OlXzoD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaVv4AwAKCRDZQZRRKWBy
9AnyAQCR6wDckohR/dX8mcl8s2VkUQKDimarfJ3O1pNx18aaqgD/QiCjpBqzjiJK
jawTJsVUFvbL8ljZr5V3Njr45dik0QM=
=qiWE
-----END PGP SIGNATURE-----

--=-3c8D5bbfI2H7z1OlXzoD--

