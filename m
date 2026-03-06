Return-Path: <linux-media+bounces-54803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G2WEPPpqmm8YAEAu9opvQ
	(envelope-from <linux-media+bounces-54803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:51:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C246C223191
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23E293037D4D
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E209539E6F2;
	Fri,  6 Mar 2026 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="nTMl+8Tv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AE0384231
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808328; cv=none; b=gT5fUml3d9sS8Q3zUQpwxrlhbvN+O2y5WJK80S/A41uUQjVBCa0qXD41nHk28QkRKK5vf1u0Pmqei1OGNvnQmCLJ8BJrRbNEIcPgbrqG3YI8EPPSbgz+XSm3c6IyOKjpq80QRzxYyRcGQYfSCTR6TVByqDDvVonzZ+nY4D8Mj58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808328; c=relaxed/simple;
	bh=F1HzEMsCx7cpozBpqVg2V2ShnSpY2XwQk9KyXCBJckY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZVzvzePNAYoCS9xP2/TVvbU93JR+oe4WI/by5vohXZVKUpqGZWF8DsPG0OyxHBtVuE3WJxt8Lx5QdWWKivdE9DwYgAyq6CM4Zy1FbW1Zlx5RRVUbFrT2mUhBhaw6XHo4TUEhooXl2iEYlNaBC21FasQcRBPrTRrucWSdPkcb5no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=nTMl+8Tv; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-508fe217a44so846231cf.2
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 06:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1772808326; x=1773413126; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F1HzEMsCx7cpozBpqVg2V2ShnSpY2XwQk9KyXCBJckY=;
        b=nTMl+8Tv1Mxbcno/FGAu53fm+v6fPFQfHlIL9SwNp85wFPBKBg8yGwbd2T5cw+i8gX
         AyYs9g+vFnJQppy7JYPxpLKK0prKP1Mr9JLw61cIKsghftCPXhFFdel46Hhe9nW1fkv1
         4YyR8g8gnBrCSQTlZg8jIGfLxeCMBbwBtM9HTYf5ZgtQVJ2fka0PmVTsV8krzaAIQfY5
         ljpDio3z55LZ+W7VhG4bCDZrT5rNQ45d9H5w67BrNnshSM5cOytZzzSKViOm8NotbvHR
         Iivd8aLv0X9lxcVOhdrXFX+NIUn+62iUYgUIT1WcBEgVt8281zZOYE2GJSqMUGQEeUXv
         HcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772808326; x=1773413126;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1HzEMsCx7cpozBpqVg2V2ShnSpY2XwQk9KyXCBJckY=;
        b=ZleQoQmJxQF5Tpc92XLEj8XRLbuCB1eg5XPkNvbE4XZRRbWAvr7Zbl+ks0SeaFJflQ
         ZND58glxVbqex94GvQokFOYKHfaRIJWUUi4gBAoICgOXDFybqKLh/yN5j97TfxSZ8bp9
         ZuR0ensN37IIQWNtSE39BQuWntgSCbKJkpEFl6pkw/GeHU3Br38EGpuvMkOTaGFkarVJ
         mjy80I3QU2eQMOwjVJl2xWa7F4tHwxA9ODMpkxaRW7L+nIXTY6RlCF5Pt/o781cQTJFO
         jO/ZUu4SjT6CVoVcOb2YxuGExEbM1sojci+IkTXPFqc90lQdtWdgHazwT910mSQ1VqIX
         UT+g==
X-Gm-Message-State: AOJu0Yz3LBeW9hsEdjvnGxOjcOah7kWwFjm6GoIhjw7CGKwDHB3Nvuib
	VcKIB3NkFPm4sjIWY5PdmRBfQdzJUh0jWQNoyYS8H4VQBosWOi6I4QyRdXfH0stVOJyNnI1x9Xu
	g7wnK
X-Gm-Gg: ATEYQzzzJ144bVbiRcfJDsY1qhHK/UmDhc/4blFBDZRcogXngJTGoDKVZhGvS533ytp
	LRNotbLZA/d5BPZPnJQFhERrkVnCGh0eQVkTr+3dxCZUMqavaK32ucXnD0Eo4X48joF+27d8MTP
	xMjgYnenW9BKd4sb73eA9/1BcpQMqjNQndfgD7w4smjA6SPJPZxlnR+rULD7E1DQF2zpqI92zKx
	pMx4OiLjV9N24ITC5oApIH9qi+BXO9I/FT1N+Vxho8+E2qrdUDim1PqaLafXX9sRdgcB55z+ACx
	eLhIqe73SAOaHWyWCoyxcgtE2SzO4d2xna7y5MPnTy1ZHcFfv2M1SZWMvN7y8FOKK9kWQGujRLk
	61lPxD7loXUw5gCOlIb8mW9t2jmh/zo7fDCIEPF7LCfu19U/KcumGesZkEz4WMywNkojTyC5rM9
	cAVlzSrkXqqcZRuzvDZPyPZsfj7lqn
X-Received: by 2002:a05:622a:15c3:b0:501:4ca3:7420 with SMTP id d75a77b69052e-508f491d090mr27373311cf.36.1772808324650;
        Fri, 06 Mar 2026 06:45:24 -0800 (PST)
Received: from ?IPv6:2606:6d00:15:210e::5ac? ([2606:6d00:15:210e::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-508f654bef3sm11475821cf.9.2026.03.06.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:45:23 -0800 (PST)
Message-ID: <e198ef6138d4b39b7002c2893d3a06a4ffea53e1.camel@ndufresne.ca>
Subject: Re: [PATCH v4l-utils] v4l2-tracer: trace: serialize all mplane
 planes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yehudis Safern <y0533159982@gmail.com>
Cc: linux-media@vger.kernel.org
Date: Fri, 06 Mar 2026 09:45:21 -0500
In-Reply-To: <CANgCxxocVL2nN8WSGo_OuTVV1cPopmsticKUqNDj0xKe3SmsBw@mail.gmail.com>
References: <20260225120048.156888-1-y0533159982@gmail.com>
	 <e18a526c3a4822d516cab634afa1e72704d23205.camel@ndufresne.ca>
	 <CANgCxxocVL2nN8WSGo_OuTVV1cPopmsticKUqNDj0xKe3SmsBw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-ZRbPRE//Lk+hNray5J0L"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: C246C223191
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-54803-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


--=-ZRbPRE//Lk+hNray5J0L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 mars 2026 =C3=A0 13:17 +0200, Yehudis Safern a =C3=A9crit=C2=A0=
:
> =E2=80=AB=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=99=D7=95=D7=9D =D7=94=
=D7=B3, 26 =D7=91=D7=A4=D7=91=D7=A8=D7=B3 2026 =D7=91-21:22 =D7=9E=D7=90=D7=
=AA =E2=80=AANicolas Dufresne=E2=80=AC=E2=80=8F
> <=E2=80=AAnicolas@ndufresne.ca=E2=80=AC=E2=80=8F>:=E2=80=AC
> >=20
> > Le mercredi 25 f=C3=A9vrier 2026 =C3=A0 14:00 +0200, yehudis9982 a =C3=
=A9crit :
> > > For V4L2_BUF_TYPE_*_MPLANE buffers, trace_v4l2_buffer() only serializ=
ed the first plane.
> > > Serialize all planes by iterating over buf->length and appending each=
 entry to m.planes in the JSON trace output.
> > >=20
> > > Signed-off-by: yehudis9982 <y0533159982@gmail.com>

nit: I'd expect "Yehudis Safern <y0533159982@gmail.com>" here instead.

> > > ---
> > > =C2=A0utils/v4l2-tracer/trace.cpp | 4 ++--
> > > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cp=
p
> > > index 996fb043..8e9039ef 100644
> > > --- a/utils/v4l2-tracer/trace.cpp
> > > +++ b/utils/v4l2-tracer/trace.cpp
> > > @@ -252,8 +252,8 @@ void trace_v4l2_buffer(void *arg, json_object *io=
ctl_args)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (buf->type =3D=3D V4L2_BUF_TYPE_VID=
EO_CAPTURE_MPLANE ||
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf->type =3D=
=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 json_object *planes_obj =3D json_object_new_array();
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* TODO add planes > 0 */
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 json_object_array_add(planes_obj, trace_v4l2_plane(buf->m.planes, bu=
f->memory));
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 for (__u32 i =3D 0; i < buf->length; i++)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json_object_array_ad=
d(planes_obj, trace_v4l2_plane(&buf->m.planes[i], buf->memory));
> >=20
> > Have you verified that it works with the deserializer ? (retrace functi=
on).
> >=20
> > Nicolas
>=20
> The current retrace implementation follows a different execution path
> and currently handles a single plane only.
>=20
> This change updates the tracing (serialization) side to correctly
> serialize all planes for multi-planar buffers. Retrace support for
> multiple planes will be addressed in a separate follow-up patch to
> extend the deserialization logic accordingly.
>=20
> >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 json_object_object_add(m_obj, "planes", planes_obj);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > >=20

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

cheers,
Nicolas

--=-ZRbPRE//Lk+hNray5J0L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaarogQAKCRDZQZRRKWBy
9KkcAQD5CTrIgpYkJ1IL7t81q7m5+JNrlV2bo8t/8Tc7SgtPNQEA+XK+EwTHfCv/
16FBWxU2M5UqykGg2BkGWlkpMwX58Ak=
=ZzWQ
-----END PGP SIGNATURE-----

--=-ZRbPRE//Lk+hNray5J0L--

