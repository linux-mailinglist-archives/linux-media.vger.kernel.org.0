Return-Path: <linux-media+bounces-50042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9E6CF90EF
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 16:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A83330230E2
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 15:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49C833C503;
	Tue,  6 Jan 2026 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="dYOCfxfp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2160C337BBD
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767713259; cv=none; b=oCE9tS2f4e6M3VaeCjv2IM1E50ztsjkbjB3Q2ES1Gh6yOyf8mcpGw6tmZaMPMvoBiYGZuVDtRxhYvLPsiC8JvqziOp3jC1vaNgOfZiOgQ8X0VBi6vQa8TdLQTUvkL+Mnbcg6eTPFL8J8cbUxQLSf/SAGOMf319A1jVsqw3gJY/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767713259; c=relaxed/simple;
	bh=QX2LtdUErqvD4jZsxkBCFKr82NhjKu96wSqyajbvVkY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HH2Cga708umq2UFNyVosKY1IJoK6k8JPq4hZqz3K1XH+MK0ZZbcxISDyV4QrCiFvOXzcppaCbNECZDyEIhwjHqDalIyMHmOY5ZVYNoo9lrFI/ekbSWrmP+S64jHJFTs7mqTwXr+SopYKsrSaeUQUqkzJEUm++sRdiMS4r3XPFmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=dYOCfxfp; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4f1aecac2c9so10924121cf.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 07:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767713255; x=1768318055; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HlyL6ir9rr6kD5Uup2D4ImbUfywS89pe0m/jczEyFK8=;
        b=dYOCfxfpN7aL51DFhrTcOpQyjnEoVAvh5R5SJhUo1bTwt7E8VzWm8vhHe0BCnqjsHv
         w5R1rSMMJEnLYCgyh/TS80cduEU9KbVJ3AqJ8vdkRnPHwTZuG9bmAVh7sJWpkGCe/D1U
         cxEdInIQRWRGRds9si+ZLAD3/oO/cLkTTdA1hT86bE8vxror38kthRG1+VCM3AQa84Qz
         L+/QMcUg1GKCnT0e1s8UGWuoxOSN6M0HVDgIhQmIx0dOMoZuAjV0xy9PFuTSeQzW3n4n
         dl/eMsbNR624thbA/nzSYina6yJTVRttZVohMtk8+OXgs18j4D/9GWjnRdJZ1M0fLXkn
         XYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713255; x=1768318055;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlyL6ir9rr6kD5Uup2D4ImbUfywS89pe0m/jczEyFK8=;
        b=pDXHKJ/05ZXlDXI+uZeA8nXjCb5gjME7qWHjSSO6qvtwSRSw9CW3rKJOdMmPhjxVMl
         mU1llMAPLwSn44vIooaJAxjX6RoToLMZM8zy71+lpOThrwk1a5wGFYOc0Qq1IX47rGVm
         zX74TvsNrqXyM8TQ8bp0qg3/YgARlCVOMM7I9hE8Fr8xFFISCY3z6O4DKOVZXGe/NqHn
         UqOgpxY45fg8avFIl7c8tRmrmbPQlq4cWqd71B6djyIU8OrZfj3ardDKe9kjFG1jbobf
         wqgLlWLKwxPPUp+yj7LpTgDUUQXUL5ZReB9eWbSRZewm7o6f2HcgWF1cgr5cP+LdVbXe
         TDUw==
X-Forwarded-Encrypted: i=1; AJvYcCWv9lUY7MXnYCXy0Y3NTxvQmg+/Et5PffXg9170GWuT7mwsm/6gaeEtt229i0/BrGdHkgsvYahXTG1B2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61JMe6T/sLEUimZhm4TOY+tabaEK9y/BOr8oqkKVMkbCoeL8e
	iP3kGHcfWDCjXmKzVLoX60DoBiFza0cXTTwbaaJdLZR2WN5iZIyL/KK9r5RjIfVv/vc=
X-Gm-Gg: AY/fxX6tRemgK9xQPOr94Vwe/5WhAZIfx6+o17MqPBvdQzhCd/2bIa1Rgl8vJ2K8O6a
	2Px0/knRljSMO//l8EY1nsiFXnmh80T1Mtm7c9TeMpSwkLY2oatQesaZkLu+g9ejpV6z6MJ5ufD
	/8p/edHOeoNVp22GzzsRFfi5EIZGMArtbb7hUxqdbUou7FC0lbTE3h0KnMw3DWc7Sl3N8u8oO6d
	J9x8liNTMJmMvYNqkKK2oxkyUIwYRElAFdarStsMenY5oMg5JkM68K62WDCvWnnV9H3wSQVOtP5
	up40EAYrpMas2xhvoQC8lgTzXxxF4B4o2QR+3Y1Bx8wG9tW1xJ6BPYjHfQIVyuSrC9GztxqwKCO
	7nAe9+QzTh7DFp69tf1wnTsx81vRM6EQHKMdXCcWGOt0pcXsfgisgu+ruRd5S96lk8uBdz1L8LK
	meM5+2c99qXP5oVn89GEwwi4PIKwE=
X-Google-Smtp-Source: AGHT+IHybAbF3H+IJN/yvYCsk7W4cWAGrCLZ8GzdP+IKOzhpBxC7YXlvzlqofYK3609iFN8lfn51iQ==
X-Received: by 2002:ac8:59ca:0:b0:4ff:b0f4:c307 with SMTP id d75a77b69052e-4ffb0f4c3b3mr9966711cf.24.1767713254789;
        Tue, 06 Jan 2026 07:27:34 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d3d92esm13054401cf.5.2026.01.06.07.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:27:34 -0800 (PST)
Message-ID: <542f97c1b2dee066f9961b508958f7397faaaf8f.camel@ndufresne.ca>
Subject: Re: [PATCH 2/4] media: dw100: Implement dynamic vertex map update
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Stefan Klug <stefan.klug@ideasonboard.com>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Date: Tue, 06 Jan 2026 10:27:31 -0500
In-Reply-To: <176770977089.12184.13455944501335843394@localhost>
References: 
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-2-65af34d04fd8@ideasonboard.com>
	 <f4e0b1f13ee54d88d1035828af548f5cf3a25c16.camel@ndufresne.ca>
	 <20260106004206.GK10026@pendragon.ideasonboard.com>
	 <2dbb2c41422cb4dbc8c3692646aeaf70c4d87df0.camel@ndufresne.ca>
	 <176770977089.12184.13455944501335843394@localhost>
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
	protocol="application/pgp-signature"; boundary="=-WOl4j+GsYoelptSN5dqf"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-WOl4j+GsYoelptSN5dqf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

	Le mardi 06 janvier 2026 =C3=A0 15:29 +0100, Stefan Klug a =C3=A9crit=C2=
=A0:
> Hi,
>=20
> Quoting Nicolas Dufresne (2026-01-06 14:47:59)
> > Hi,
> >=20
> > Le mardi 06 janvier 2026 =C3=A0 02:42 +0200, Laurent Pinchart a =C3=A9c=
rit=C2=A0:
> > > On Mon, Jan 05, 2026 at 01:58:25PM -0500, Nicolas Dufresne wrote:
> > > > Le lundi 05 janvier 2026 =C3=A0 12:35 +0100, Stefan Klug a =C3=A9cr=
it=C2=A0:
> > > > > Implement dynamic vertex map updates by handling the
> > > > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control during streamin=
g. This
> > > > > allows to implement features like dynamic zoom, pan, rotate and d=
ewarp.
> > > > >=20
> > > > > To stay compatible with the old version, updates of
> > > > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP are ignored during stre=
aming
> > > > > when requests are not used. Print a corresponding warning once.
> > > > >=20
> > > > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > > > ---
> > > > > =C2=A0drivers/media/platform/nxp/dw100/dw100.c | 27 +++++++++++++=
++++++++------
> > > > >=20
> >=20
> > [...]
> >=20
> > > > > =C2=A0 dev_dbg(&ctx->dw_dev->pdev->dev,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%ux%u %s =
mapping created (d:%pad-c:%p) for stream %ux%u->%ux%u\n",
> > > > > @@ -351,6 +355,7 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctr=
l)
> > > > > =C2=A0 switch (ctrl->id) {
> > > > > =C2=A0 case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->user_=
map_is_set =3D true;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->user_map_n=
eeds_update =3D true;
> > > >=20
> > > > This will be called before the new mapping is applied by
> > > > v4l2_ctrl_request_complete(), and then may be cleared too soon if y=
ou queue
> > > > depth is high enough.
> > >=20
> > > v4l2_ctrl_request_complete() does not apply a mapping, what am I miss=
ing
> > > ?
> >=20
> > Sorry for my confusion, after reading back, you are correct, this is ca=
lled
> > v4l2_ctrl_request_setup() inside the device_run() function. You can dis=
miss the
> > bit about user_map_needs_update in my review (the paragraph below).
> >=20
>=20
> That means nothing has to change here, right?

Correct.

>=20
> > >=20
> > > > Instead, you should check in the request for the presence of
> > > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP to optimize the updates. =
Yo may still
> > > > set this to true if if there is no request, in the case you also wa=
nted to
> > > > change the original behaviour of only updating that vertex on strea=
mon, but I
> > > > don't see much point though.
> > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > =C2=A0 }
> > > > > =C2=A0
> > > > > @@ -405,6 +410,7 @@ static void dw100_ctrl_dewarping_map_init(con=
st struct v4l2_ctrl *ctrl,
> > > > > =C2=A0 }
> > > > > =C2=A0
> > > > > =C2=A0 ctx->user_map_is_set =3D false;
> > > > > + ctx->user_map_needs_update =3D true;
> > > > > =C2=A0}
> > > > > =C2=A0
> > > > > =C2=A0static const struct v4l2_ctrl_type_ops dw100_ctrl_type_ops =
=3D {
> > > > > @@ -1482,6 +1488,15 @@ static void dw100_device_run(void *priv)
> > > > > =C2=A0 v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &ctx->hdl);
> > > > > =C2=A0
> > > > > + if (src_buf->vb2_buf.req_obj.req) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dw100_update_ma=
pping(ctx);
> > > > > + } else if (ctx->user_map_needs_update && !ctx->warned_dynamic_u=
pdate) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->warned_dyn=
amic_update =3D true;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_warn(&ctx->=
dw_dev->pdev->dev,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "V4L2 requests are required to update the=
 vertex map dynamically"
> > > >=20
> > > > Do you know about dev_warn_once() ? That being said, the driver is =
usable
> > > > without requests and a static vertex (and must stay this way to not=
 break the
> > > > ABI). I don't think you should warn here at all.
>=20
> My idea was that I'd like to see the warning once per context and not
> once per boot. Afaik I can't use dev_warn_once() for that.

I didn't catch this detail (commit comment welcome), fair enough if that's =
the
direction we are heading. Again, I don't understand why we don't just apply=
 that
on next device_run in "legacy" mode.

>=20
> > >=20
> > > Applications should move to using requests. We'll do so in libcamera
> > > unconditionally. I don't expect many other direct users, so warning t=
hat
> > > the mapping won't be applied when an application sets the correspondi=
ng
> > > control during streaming without using requests seems fair to me. It
> > > will help debugging issues.
> >=20
> > It is also a miss-use of dev_warn which is meant to indicate a problem =
with the
> > driver or the hardware. The V4L2 core uses dev_dbg() or customer log le=
vel for
> > that in general. Also, don't re-implement _once() variants with
> > warned_dynamic_update please. Personally, I would just let the out-of r=
equest
> > change the control on the next device_run(), even if that means its out=
 of sync.
>=20
> But then you end up with potentially difficult to debug issues, because
> users would not know that they should use requests. Not warning (or
> dev_dbg) has the same effect from my point of view, because users just
> see a device not working as expected. Is a customer log level the
> solution?

Custom level are hard to discover for sure, but the rules around dev_warn()
aren't mine. We can perhaps makes an argument that the driver is broken, bu=
t why
don't we fix it to match the V4L2 spec is still unknown, specially that its=
 an
easy fix match the V4L2 spec (even if in practice, this is not quite usable=
).
Normally everything else we add above the V4L2 spec, specially stuff using
request get a domain specific spec. With that in hand, we could create bett=
er
rules, but otherwise I don't have much foundation to make a good call here.

Nicolas

>=20
> Best regards,
> Stefan
>=20
> >=20
> > Nicolas
> >=20
> > >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 );
> > > > > + }
> > > > > +
> > > > > =C2=A0 v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0 &ctx->hdl);
> > > > >=20

--=-WOl4j+GsYoelptSN5dqf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV0p5AAKCRDZQZRRKWBy
9FTJAP9laFUh4oNuGbatX55S4EZoM1i0MWKK4qSoXWvoIj5h2QEAnSLwsjCq+Wgq
EGsT96v3o5wXkrMLCHylAnMUoqhgLw8=
=lDcR
-----END PGP SIGNATURE-----

--=-WOl4j+GsYoelptSN5dqf--

