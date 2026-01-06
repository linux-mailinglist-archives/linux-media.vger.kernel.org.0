Return-Path: <linux-media+bounces-50029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5772CF8A57
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 15:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E53B30DB4B6
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 13:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6EA33030F;
	Tue,  6 Jan 2026 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="0jLnEXHv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6EF33D51C
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767707284; cv=none; b=SbWHqppzzvUY2YaWLRx8ODgG7VGWn0hxDSb6lgKjPfxvxcAu0ANcxaY/RvMyCWGaywRtVIxZcI6detaRr9LZ4GHPHDRSdIkLZ1CY39ih5H9hptmHYc818Yx3/KQNMGIJgzqmNU+HlGvKjEWI0xjMPgCnMgDFQfsRrwjT72GN0Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767707284; c=relaxed/simple;
	bh=jDJRIImtUM+Sap2ZZ70MkzYXTKPe2n+pedbG3qOpp1Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fdCUeMIrNgWveg2tIcrON36AohTUh+iimGefC08MD5WnOk+VnljXLhBlPFhOAMQxJ8WeHtGa3mMYAA4MFxWpEI5cmOkMP6FaK1O+f1vT4ici7SKFJ18hJZ+mpaxniYTLfSqau9zPP1ctA+6n6fHPthlQ+7nM8PBHQK5MQ4qxfZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=0jLnEXHv; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c0f15e8247so126662485a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 05:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767707281; x=1768312081; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QYQAMvkDBUiH8527EZY8gzXitbwedJ/WC+XJbOfoPE4=;
        b=0jLnEXHvhLpaQo2QMtoT+s4eNmtd9zOubrFk2kW2RzwEbOfoXc79fZxGyuTrfIftKE
         OgWr5M6wwIfJEC7z0Ub/K61mo7lncfGYCQgsrKZQv5Oc4pLVRUkyUhrqcaZ1datdjzGJ
         HH0ZVPvVztIoHYW9Mac7RQt9kdPyD1JD0ucIkWZ89YkpTVl5sLNqTMEin0R+jeXoIush
         3VXSPkSr5yhn1BSMXe0BbgOGeEvkPVPjIlaiPrZmUyUaaF0yWy2jwBoeTkhz/XMDeHnM
         8701VJGPGQwpSeK+Y0Sp+fLsNHztj2esjMZpvPtYypvCmwy0LHY3FUZdP1RCxdI4Wocy
         Xtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707281; x=1768312081;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYQAMvkDBUiH8527EZY8gzXitbwedJ/WC+XJbOfoPE4=;
        b=efKwBY/k/FSEkO4Sl8/GYWpaSn/a9vwsdT3nvKOS+NdyurpPjm3BaHqZNZsTI+I0KD
         I1TThoUqfRjSjpzhVaooFiJoPa1A9m2a6x9ekOxV/wudL09z3hmdgPfOYTSAvnLZ8wKd
         8g9UJmkSY8sXiyuCldqP6M4Hi/1uyZssDq3Xf7Tf9goh3IlkMjas6C9tVRQAT7G5ii2Y
         9xSGj9cG01y0bBzOY1zBU8w+vjuATNO6lDKznKgRPXcZVpkpcom6aLaBKQEr8dSyVWTD
         lIM2DauVYhhBmH+cs6yCQ0EhP2WR/UDx3bWHvGE52f3eo/1IvwjcZd99JS98FO8LMMDE
         wlTw==
X-Forwarded-Encrypted: i=1; AJvYcCVMADu+NqQJwkT/PVd8CPGcbhOgGYs21kyqjBIPXLlIV7chTEYYOStoTAxm80RdPOonyTe8qHwuqSgvSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsjwvWh7rP6rQun30TuV/MwBkZ4njZno3k0Ku19OG+kjLL8MsZ
	0POCcqAtWXl5t3Y7thcq3Ir0OPBgedCofyYxX/pe4Hc5FSOkReZMqUvLRN1Dz/Xcq8g=
X-Gm-Gg: AY/fxX4vf+jH564D7ou7jUZ3EDJ1B/N3KLA/Y7/oB/v2vXNVRsIAIYFG9DotH1Bxhqv
	e14UNY1nrx4rnyDbUIhdFD/JfCovMu+TnOefT91jWIkfzpJpQ168X15QCnAzF1pa6dDN1qCeRg+
	KUWLODuDYzVmrUscApimMKQez9cxmrb5PILEUbDfvT8qmgWRxwbRERyDnkyeqDjtMDSrKFh5EiA
	IQSJealOZioL8dv8lB3IzFNHsOWEOdAbGLmlmIQFyIJX26gC/cTWg0KavC6V4EYJ+Asn0ZgPSsD
	DrbGH7zdSd3U5n0a/Em5iV6kzjNPYQo58ZiebDZ1LN9qXOXZmJrRGLBXmIlFjKJmb1ZXxERjblp
	/SEdj7Uf52brNLiRmCFf9RhXVD0nhxAvrAfTISBIi6C8VUT4y0V8WacsrcKMNCgnql0VFEbpKlH
	EU3eWQ+AIL16ZDaXjloxnLoBxpoEY=
X-Google-Smtp-Source: AGHT+IEIZHwvMbSK8vnvsSywqF7t6CLAMyaEdlU775mO1QqZdH6WE9vc5np1VrqWDys4zXUvYly1gQ==
X-Received: by 2002:a05:620a:d96:b0:8b2:e565:50b5 with SMTP id af79cd13be357-8c37ebdedf0mr375341285a.60.1767707281506;
        Tue, 06 Jan 2026 05:48:01 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e20bcsm13660196d6.15.2026.01.06.05.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:48:00 -0800 (PST)
Message-ID: <2dbb2c41422cb4dbc8c3692646aeaf70c4d87df0.camel@ndufresne.ca>
Subject: Re: [PATCH 2/4] media: dw100: Implement dynamic vertex map update
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, Xavier Roumegue	
 <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior	 <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt	 <rostedt@goodmis.org>,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Date: Tue, 06 Jan 2026 08:47:59 -0500
In-Reply-To: <20260106004206.GK10026@pendragon.ideasonboard.com>
References: 
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-2-65af34d04fd8@ideasonboard.com>
	 <f4e0b1f13ee54d88d1035828af548f5cf3a25c16.camel@ndufresne.ca>
	 <20260106004206.GK10026@pendragon.ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-jG59v6/w1zB+en1MGiEP"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-jG59v6/w1zB+en1MGiEP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 06 janvier 2026 =C3=A0 02:42 +0200, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> On Mon, Jan 05, 2026 at 01:58:25PM -0500, Nicolas Dufresne wrote:
> > Le lundi 05 janvier 2026 =C3=A0 12:35 +0100, Stefan Klug a =C3=A9crit=
=C2=A0:
> > > Implement dynamic vertex map updates by handling the
> > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control during streaming. T=
his
> > > allows to implement features like dynamic zoom, pan, rotate and dewar=
p.
> > >=20
> > > To stay compatible with the old version, updates of
> > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP are ignored during streamin=
g
> > > when requests are not used. Print a corresponding warning once.
> > >=20
> > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > ---
> > > =C2=A0drivers/media/platform/nxp/dw100/dw100.c | 27 +++++++++++++++++=
++++------
> > >=20

[...]

> > > =C2=A0	dev_dbg(&ctx->dw_dev->pdev->dev,
> > > =C2=A0		"%ux%u %s mapping created (d:%pad-c:%p) for stream %ux%u->%ux=
%u\n",
> > > @@ -351,6 +355,7 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
> > > =C2=A0	switch (ctrl->id) {
> > > =C2=A0	case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
> > > =C2=A0		ctx->user_map_is_set =3D true;
> > > +		ctx->user_map_needs_update =3D true;
> >=20
> > This will be called before the new mapping is applied by
> > v4l2_ctrl_request_complete(), and then may be cleared too soon if you q=
ueue
> > depth is high enough.
>=20
> v4l2_ctrl_request_complete() does not apply a mapping, what am I missing
> ?

Sorry for my confusion, after reading back, you are correct, this is called
v4l2_ctrl_request_setup() inside the device_run() function. You can dismiss=
 the
bit about user_map_needs_update in my review (the paragraph below).

>=20
> > Instead, you should check in the request for the presence of
> > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP to optimize the updates. Yo m=
ay still
> > set this to true if if there is no request, in the case you also wanted=
 to
> > change the original behaviour of only updating that vertex on streamon,=
 but I
> > don't see much point though.
> >=20
> > > =C2=A0		break;
> > > =C2=A0	}
> > > =C2=A0
> > > @@ -405,6 +410,7 @@ static void dw100_ctrl_dewarping_map_init(const s=
truct v4l2_ctrl *ctrl,
> > > =C2=A0	}
> > > =C2=A0
> > > =C2=A0	ctx->user_map_is_set =3D false;
> > > +	ctx->user_map_needs_update =3D true;
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static const struct v4l2_ctrl_type_ops dw100_ctrl_type_ops =3D =
{
> > > @@ -1482,6 +1488,15 @@ static void dw100_device_run(void *priv)
> > > =C2=A0	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> > > =C2=A0				&ctx->hdl);
> > > =C2=A0
> > > +	if (src_buf->vb2_buf.req_obj.req) {
> > > +		dw100_update_mapping(ctx);
> > > +	} else if (ctx->user_map_needs_update && !ctx->warned_dynamic_updat=
e) {
> > > +		ctx->warned_dynamic_update =3D true;
> > > +		dev_warn(&ctx->dw_dev->pdev->dev,
> > > +			"V4L2 requests are required to update the vertex map dynamically"
> >=20
> > Do you know about dev_warn_once() ? That being said, the driver is usab=
le
> > without requests and a static vertex (and must stay this way to not bre=
ak the
> > ABI). I don't think you should warn here at all.
>=20
> Applications should move to using requests. We'll do so in libcamera
> unconditionally. I don't expect many other direct users, so warning that
> the mapping won't be applied when an application sets the corresponding
> control during streaming without using requests seems fair to me. It
> will help debugging issues.

It is also a miss-use of dev_warn which is meant to indicate a problem with=
 the
driver or the hardware. The V4L2 core uses dev_dbg() or customer log level =
for
that in general. Also, don't re-implement _once() variants with
warned_dynamic_update please. Personally, I would just let the out-of reque=
st
change the control on the next device_run(), even if that means its out of =
sync.

Nicolas

>=20
> > > +		);
> > > +	}
> > > +
> > > =C2=A0	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> > > =C2=A0				=C2=A0=C2=A0 &ctx->hdl);
> > > =C2=A0

--=-jG59v6/w1zB+en1MGiEP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV0SjwAKCRDZQZRRKWBy
9I0zAPwMBT2m5Eu08OcMqqAgIeUrDuena/auDvFtv/Y48D62SQEA+0CzAV/t1+5d
shzTvTgiPmZHbLaeT9awJ6BCeTc4DQY=
=NgWR
-----END PGP SIGNATURE-----

--=-jG59v6/w1zB+en1MGiEP--

