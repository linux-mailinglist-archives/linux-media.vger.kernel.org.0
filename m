Return-Path: <linux-media+bounces-58938-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKd4N3kU4WlRpAAAu9opvQ
	(envelope-from <linux-media+bounces-58938-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 18:55:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E16412206
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 18:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43441304D277
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D92C313298;
	Thu, 16 Apr 2026 16:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="DP/LyrjZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE0613AA2D
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358288; cv=none; b=C38zt8gb9zg1OLOxr0Q8T08pnNlmyqrcGgPsZGmjRBltGAFLwU5+saRk3vOK9Te2VNrG6iPLOJDK17oH0JSARnrKVrV5RE/hm9VXJ7hUSeI0aMAYSmhSWCa2a0xwN2EgEKfzpPUlw3QVLbnSD2S0pItWWruIBsA8e16zPZs1lAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358288; c=relaxed/simple;
	bh=AIz7JCeYRpMeZ7jflvH6ybzk733+/kWsKta+LKqtY0I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JlR22rsHSFMxF2ZHuIEvqvJoLKtMlVcTKlk0+PA/5EreAKpIxS/YKJbPmQPZU31S/rL22xjSye4B88hcvZJYzOF9hcdI44hp0cPOHUeSYqL7X9XoowdJmsZeoAzboU2rXVXddgC55dxBXnLfx9yOAK2OHzgHHrcKvdUReKaAUsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=DP/LyrjZ; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cd71fb9f06so514761785a.2
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 09:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1776358286; x=1776963086; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xPyM6IMDCrn9iJ0noD+kd2RubSF1Yi19RUzc3ARKtw0=;
        b=DP/LyrjZKBG+btAUmtCkAbvBYDz5PSZ3OoMK3NWBKFuZKHFL0DZN43vLN2YEseJw1z
         Ajpmeh+vRrSEjYOt8At0YQsVVJkTflt9YBPA9/UtXCENKgRTe2kbcUjrhnyWGanf/Fi2
         z0OKYV+in0+pX3+/V20WPEmXOl/dSNt+dAsTWfCWy6GzRCV9POG3oaK0ndWgZTv5mMuH
         d1uUhgg71CKHHqaC0+6ZIVk0XBN/CiSZZ+Y+5VFtUVGXAnbsLgGLb96cvNJw4NLls77l
         pG14YvMGgJyH73MWkmok4/lkXIa2tb/iSkQyxbmuBeZCbW6TD4p2HUoVVrELJ2Dcpd1Q
         kCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358286; x=1776963086;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPyM6IMDCrn9iJ0noD+kd2RubSF1Yi19RUzc3ARKtw0=;
        b=qcjmPLHCeX2N5Ti4bh4j2CkBXz5CGyaCsB9pYjj/BGno5OT5vBNMjFu20RxFigzop5
         IgUTrwK2qGs44m24ilS5ychBSMs8skGRsPyRyUOdmYREffcvW14xE6tMrSrobOU3Z/SJ
         Roi4LiyhOjXlnSxj1Kv1G8/3wl/73rz+yUTpu2ObPYIYxRwULUWlX6g1OmEKEMXVqaQO
         81dFgm8gYuAE14BvhrDflpUk6wlnl1Vs5DgeafQ/W5+OqRffIRMXhluci7jPnoLiMVi1
         2jL6N8NqLDxJo/9WHgs9XFLF8ofSV98eHLjG+DBkuTK8C3QOgGlyeVHqdqLLneGUysf2
         36Og==
X-Gm-Message-State: AOJu0Yw41Jgdu6S/ZFzESyQZcg9gVGWtiGnyuFIeTmTOZ4YciCDkDzka
	6//airx0gmsWdP0+r9cGhY1lBSXxii+8k7Ioxx+fZ0aisOg8TBsuTaGd9z5mqyZZvQI=
X-Gm-Gg: AeBDiesNMrxxNFqXZ1xs2BVamfeJmIE6fzC843dbMszOEtUnMfZza2D48fpjilJIjYG
	f27uTqWZnr6RRDoyLp89EcduTvYV9fY0Xs9jZz6BpZTUhGs9OI+A0a1bXzzaE+iePeKsdriH629
	2NNaFYTTln4AAwTenJB9mqz4Gajuim/doFhGcAFCujSSH+iOzW8QzhvdiKcPr4BlFQgyxSV5q/c
	ZFB6Qu6kDIbbta8scL27tvMGG0Wiamctwz+2E117rTQU6rm4V94KzkPwblRr1tUERwkkbSbZ6rc
	aqdlZsEIzyfaxOl3VRsFRmVEBtyzjIfjtY4pzgd6htzBEbAj27WS38n/M9gJfFecD5ITHwolrsI
	6mW4tGR0g96Lzc47xPpeEPnPip/iErtvKXZGQckGUAoU4fI5ySc+I1RdIYw3ACYnEnPci2CzCZI
	9L7IFkxsKk0kyRaaP7N5RxGJTFvzdbVlBMEG1Jqh8=
X-Received: by 2002:a05:620a:4414:b0:8d7:4f7c:8736 with SMTP id af79cd13be357-8e749183c3amr21023385a.13.1776358285489;
        Thu, 16 Apr 2026 09:51:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e4f2345c3bsm474518785a.24.2026.04.16.09.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 09:51:24 -0700 (PDT)
Message-ID: <0be3862a8a11a337197cabb87174dd38dc2b47a9.camel@ndufresne.ca>
Subject: Re: [RFC] media: Add AFBC pixel formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 	corbet@lwn.net, hverkuil+cisco@kernel.org,
 laurent.pinchart@ideasonboard.com, 	sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Thu, 16 Apr 2026 12:51:22 -0400
In-Reply-To: <a108f9f2-e274-4d81-8101-900fa629b4fb@collabora.com>
References: <20260416124143.128412-1-benjamin.gaignard@collabora.com>
	 <0407249c6dcceec5419af3870c7bb4defb230e5a.camel@ndufresne.ca>
	 <a108f9f2-e274-4d81-8101-900fa629b4fb@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-bWFKK7BJz2xIIAJbHLBD"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-58938-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconimaging.com:url,collabora.com:email,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 39E16412206
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-bWFKK7BJz2xIIAJbHLBD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 16 avril 2026 =C3=A0 18:29 +0200, Benjamin Gaignard a =C3=A9crit=
=C2=A0:
>=20
> Le 16/04/2026 =C3=A0 17:23, Nicolas Dufresne a =C3=A9crit=C2=A0:
> > Le jeudi 16 avril 2026 =C3=A0 14:41 +0200, Benjamin Gaignard a =C3=A9cr=
it=C2=A0:
> > > Add 8-bit and 10-bit YUV420 Arm Frame Buffer Compression (AFBC)
> > > pixel formats.
> > >=20
> > > AFBC stride and image size computation needed to be done by
> > > specific helpers functions which are also exported to be used
> > > by drivers.
> > >=20
> > > Add documentation for each of the formats.
> > >=20
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > ---
> > > =C2=A0=C2=A0.../userspace-api/media/v4l/pixfmt-afbc.rst=C2=A0=C2=A0 |=
=C2=A0 64 +++++++++++
> > > =C2=A0=C2=A0.../userspace-api/media/v4l/pixfmt.rst=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0=C2=A0drivers/media/v4l2-core/v4l2-common.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 104 ++++++++++++++++++
> > > =C2=A0=C2=A0drivers/media/v4l2-core/v4l2-ioctl.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > > =C2=A0=C2=A0include/media/v4l2-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 4 +
> > > =C2=A0=C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 6 +
> > > =C2=A0=C2=A06 files changed, 183 insertions(+)
> > > =C2=A0=C2=A0create mode 100644 Documentation/userspace-api/media/v4l/=
pixfmt-afbc.rst
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-afbc.rst b/=
Documentation/userspace-api/media/v4l/pixfmt-afbc.rst
> > > new file mode 100644
> > > index 000000000000..2867e5d45810
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-afbc.rst
> > > @@ -0,0 +1,64 @@
> > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > +
> > > +.. afbc:
> > > +
> > > +*******************************************
> > > +ARM Frame Buffer Compression formats (AFBC)
> > > +*******************************************
> > > +
> > > +The AFBC format is a lossless compression format which can support
> > > +up to four components. It could compress 8 bits to 64 bits per pixel=
.
> > > +The internal superblock size could be:
> > > +
> > > +- 16x16 pixels
> > > +
> > > +- 32x8 pixels
> > > +
> > > +- 64x4 pixels.
> > > +
> > > +The memory layout is composed of a header block followed by payload =
data.
> > Because these format are so tied with the Graphics, I would avoid past =
mistakes
> > with QC formats, and up-front document their matching DRM format and mo=
difiers.
>=20
> sure, I can add a column with the matching DRM format + modifier
>=20
> >=20
> > While its documented in ./Documentation/userspace-api/dma-buf-alloc-exc=
hange.rst
> > I would still document a bit the way we calculate a stride for this for=
mats, or
> > cross-reference that documentation, but being explicit for this specifi=
c format
> > may avoid a lot of issues.
>=20
> I don't see that in dma-buf-alloc-exchange.rst if you a place where it is
> documented I can add a link to it.


The documentation is:
    stride:
      A value that denotes the relationship between pixel-location co-ordin=
ates
      and byte-offset values. Typically used as the byte offset between two
      pixels at the start of vertically-consecutive tiling blocks. For line=
ar
      layouts, the byte offset between two vertically-adjacent pixels. For
      non-linear formats the stride must be computed in a consistent way, w=
hich
      usually is done as-if the layout was linear.



Its heavily generalized, not obvious, that's why I think documenting it mig=
ht be
nice. Specially that its arbitrary, but if you get it wrong it fails. In
practice, once you have aligned the width, its just aligned_width * 3 *
bit_depth / 2 / 8 iirc (so either 12bit per pixel, or 15bit per pixels, ali=
gned
so we don't chop pixels or bytes.


>=20
> > > +AFBC Formats
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +.. tabularcolumns:: |p{5.2cm}|p{1.0cm}|p{1.5cm}|p{1.9cm}|p{1.2cm}|p{=
1.8cm}|
> > > +
> > > +.. flat-table:: Overview of AFBC formats
> > > +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 1
> > > +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> > > +
> > > +=C2=A0=C2=A0=C2=A0 * - Identifier
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Code
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Colorspace
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Bits per component
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Superblock size
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Compression parameters
> > > +=C2=A0=C2=A0=C2=A0 * - V4L2_PIX_FMT_AFBC_YUV420_16x16
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 'A168'
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - YUV420
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 8 bits
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 16x16
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Sparse, Split
> > =C2=A0From my accumulate knowledge, RK35xx RKVDEC produce non-split, an=
d this one is
> > split. To make it easy for naming in the future, I'd rename this one.
> >=20
> > 	V4L2_PIX_FMT_AFBC_YUV420_16x16_SPLIT
> >=20
> > Or
> >=20
> > 	V4L2_PIX_FMT_AFBC_YUV420_16x16_S
> > 	V4L2_PIX_FMT_AFBC_YUV420_16x16S
> >=20
> > Other ideas, but it would be really hard to come up with a name for "no=
t slip".
> > While non-sparse is very special, and not commonly used.
>=20
> Let's go for SPLIT it is more readable.

Great!

>=20
> >=20
> > > +=C2=A0=C2=A0=C2=A0 * - V4L2_PIX_FMT_AFBC_YUV420_32x8
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 'A328'
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - YUV420
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 8 bits
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 32x8
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Sparse
> > > +=C2=A0=C2=A0=C2=A0 * - V4L2_PIX_FMT_AFBC_YUV420_16x16_10
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 'A16a'
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - YUV420
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 10 bits
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 16x16
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Sparse, Split
> > > +=C2=A0=C2=A0=C2=A0 * - V4L2_PIX_FMT_AFBC_YUV420_32x8_10
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 'A32a'
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - YUV420
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 10 bits
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 32x8
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Sparse
> > > +
> > > +.. _V4L2-PIX-FMT-AFBC-YUV420-16x16:
> > > +.. _V4L2-PIX-FMT-AFBC-YUV420-32x8:
> > > +.. _V4L2-PIX-FMT-AFBC-YUV420-16x16-10:
> > > +.. _V4L2-PIX-FMT-AFBC-YUV420-32x8-10:
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Docum=
entation/userspace-api/media/v4l/pixfmt.rst
> > > index 71b29267488f..c6728b91b74f 100644
> > > --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
> > > @@ -26,6 +26,7 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixfmt-indexed
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixfmt-rgb
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixfmt-bayer
> > > +=C2=A0=C2=A0=C2=A0 pixfmt-afbc
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 yuv-formats
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hsv-formats
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depth-formats
> > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4=
l2-core/v4l2-common.c
> > > index 554c591e1113..9187cb18a4ef 100644
> > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > @@ -332,6 +332,16 @@ const struct v4l2_format_info *v4l2_format_info(=
u32 format)
> > > =C2=A0=C2=A0		{ .format =3D V4L2_PIX_FMT_NV12MT_16X16,=C2=A0 .pixel_e=
nc =3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D =
{ 1, 2, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > > =C2=A0=C2=A0		=C2=A0 .block_w =3D { 16,=C2=A0 8, 0, 0 },	.block_h =3D=
 { 16,=C2=A0 8, 0, 0 }},
> > > =C2=A0=20
> > > +		/* AFBC formats */
> > > +		{ .format =3D V4L2_PIX_FMT_AFBC_YUV420_16x16, .pixel_enc =3D V4L2_=
PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0=
 }, .bpp_div =3D { 4, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1,
> > > +		=C2=A0 .block_w =3D { 16, 0, 0, 0 },	.block_h =3D { 16, 0, 0, 0 }}=
,
> > > +		{ .format =3D V4L2_PIX_FMT_AFBC_YUV420_32x8, .pixel_enc =3D V4L2_P=
IXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 =
}, .bpp_div =3D { 4, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1,
> > > +		=C2=A0 .block_w =3D { 32, 0, 0, 0 },	.block_h =3D { 8, 0, 0, 0 }},
> > > +		{ .format =3D V4L2_PIX_FMT_AFBC_YUV420_16x16_10, .pixel_enc =3D V4=
L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 15, 0, =
0, 0 }, .bpp_div =3D { 8, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1,
> > > +		=C2=A0=C2=A0 .block_w =3D { 16, 0, 0, 0 },	.block_h =3D { 16, 0, 0=
, 0 }},
> > > +		{ .format =3D V4L2_PIX_FMT_AFBC_YUV420_32x8_10, .pixel_enc =3D V4L=
2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 15, 0, 0=
, 0 }, .bpp_div =3D { 8, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1,
> > > +		=C2=A0=C2=A0 .block_w =3D { 32, 0, 0, 0 },	.block_h =3D { 8, 0, 0,=
 0 }},
> > > +
> > > =C2=A0=C2=A0		/* Bayer RGB formats */
> > > =C2=A0=C2=A0		{ .format =3D V4L2_PIX_FMT_SBGGR8,	.pixel_enc =3D V4L2_=
PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, 0, 0,=
 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> > > =C2=A0=C2=A0		{ .format =3D V4L2_PIX_FMT_SGBRG8,	.pixel_enc =3D V4L2_=
PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, 0, 0,=
 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> > > @@ -448,6 +458,97 @@ void v4l2_apply_frmsize_constraints(u32 *width, =
u32 *height,
> > > =C2=A0=C2=A0}
> > > =C2=A0=C2=A0EXPORT_SYMBOL_GPL(v4l2_apply_frmsize_constraints);
> > > =C2=A0=20
> > > +size_t v4l2_pixfmt_afbc_header_size(int fourcc, int width, int heigh=
t)
> > > +{
> > > +	int width_in_block, height_in_block;
> > > +
> > > +	if (!v4l2_is_format_afbc(fourcc))
> > > +		return 0;
> > > +
> > > +	switch (fourcc) {
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
> > > +		width_in_block =3D ALIGN(width, 16) >> 4;
> > > +		height_in_block =3D ALIGN(height, 16) >> 4;
> > > +		break;
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
> > > +		width_in_block =3D ALIGN(width, 32) >> 5;
> > > +		height_in_block =3D ALIGN(height, 8) >> 3;
> > > +		break;
> > > +	}
> > > +
> > > +	return ALIGN(width_in_block * 16 * height_in_block, 128);
> > > +}
> > > +EXPORT_SYMBOL_GPL(v4l2_pixfmt_afbc_header_size);
> > > +
> > > +size_t v4l2_pixfmt_afbc_payload_size(int fourcc, int width, int heig=
ht)
> > > +{
> > > +	int width_in_block, height_in_block, block_payload_size;
> > > +
> > > +	if (!v4l2_is_format_afbc(fourcc))
> > > +		return 0;
> > > +
> > > +	switch (fourcc) {
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
> > > +		width_in_block =3D ALIGN(width, 16) >> 4;
> > > +		height_in_block =3D ALIGN(height, 16) >> 4;
> > > +		break;
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
> > > +		width_in_block =3D ALIGN(width, 32) >> 5;
> > > +		height_in_block =3D ALIGN(height, 8) >> 3;
> > > +		break;
> > > +	}
> > > +
> > > +	switch (fourcc) {
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
> > > +		block_payload_size =3D 384;
> > > +		break;
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
> > > +		block_payload_size =3D 512;
> > > +		break;
> > > +	}
> > > +
> > > +	return ALIGN(block_payload_size * width_in_block * height_in_block,=
 128);
> > > +}
> > > +EXPORT_SYMBOL_GPL(v4l2_pixfmt_afbc_payload_size);
> > > +
> > > +static int v4l2_fill_pixfmt_afbc(struct v4l2_pix_format_mplane *pixf=
mt,
> > > +				 const struct v4l2_format_info *info)
> > > +{
> > > +	struct v4l2_plane_pix_format *plane =3D &pixfmt->plane_fmt[0];
> > > +	unsigned int width =3D pixfmt->width;
> > > +	unsigned int height =3D pixfmt->height;
> > > +	unsigned int aligned_width =3D ALIGN(width, v4l2_format_block_width=
(info, 0));
> > > +	unsigned int stride =3D DIV_ROUND_UP(aligned_width, info->hdiv) *
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->bpp[0] / info->bpp_div[0];
> > > +	size_t header_size =3D v4l2_pixfmt_afbc_header_size(info->format, w=
idth, height);
> > > +	size_t payload_size =3D v4l2_pixfmt_afbc_payload_size(info->format,=
 width, height);
> > > +
> > > +	plane->bytesperline =3D stride;
> > > +	plane->sizeimage =3D header_size + payload_size;
> > I want to give some more thought on this, its literally by-pass
> > v4l2_apply_frmsize_constraints(), and that I don't like much.
> >=20
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +bool v4l2_is_format_afbc(int fourcc)
> > > +{
> > > +	switch (fourcc) {
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
> > > +		return true;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > +EXPORT_SYMBOL_GPL(v4l2_is_format_afbc);
> > Does that really need to be exported ?
>=20
> Yes it is useful to not duplicate it in all drivers.
>=20
> >=20
> > > +
> > > =C2=A0=C2=A0int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pi=
xfmt,
> > > =C2=A0=C2=A0			u32 pixelformat, u32 width, u32 height)
> > > =C2=A0=C2=A0{
> > > @@ -464,6 +565,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mp=
lane *pixfmt,
> > > =C2=A0=C2=A0	pixfmt->pixelformat =3D pixelformat;
> > > =C2=A0=C2=A0	pixfmt->num_planes =3D info->mem_planes;
> > > =C2=A0=20
> > > +	if (v4l2_is_format_afbc(info->format))
> > > +		return v4l2_fill_pixfmt_afbc(pixfmt, info);
> > > +
> > > =C2=A0=C2=A0	if (info->mem_planes =3D=3D 1) {
> > > =C2=A0=C2=A0		plane =3D &pixfmt->plane_fmt[0];
> > > =C2=A0=C2=A0		plane->bytesperline =3D v4l2_format_plane_stride(info, =
0, width);
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> > > index a2b650f4ec3c..016d4244c9ee 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1387,6 +1387,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtde=
sc *fmt)
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_YVU422M:	descr =3D "Planar YVU 4:2:2 (=
N-C)"; break;
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_YUV444M:	descr =3D "Planar YUV 4:4:4 (=
N-C)"; break;
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_YVU444M:	descr =3D "Planar YVU 4:4:4 (=
N-C)"; break;
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_16x16: descr =3D "AFBC 8-bit YUV420 1=
6x16"; break;
> > Missing "split" in the descr, which will cause confusion in the future.
>=20
> Ok, just keep in mind that description field is limited to 32 bytes.

I know, pretty annoying. You already compressed YUV 4:2:0 to YUV420, perhap=
s you
can compress 8-bit in 8b. I'm out of idea if you need more.


Nicolas

>=20
> Benjamin
>=20
> >=20
> > Nicolas
> >=20
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_32x8: descr =3D "AFBC 8-bit YUV420 32=
x8"; break;
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10: descr =3D "AFBC 10-bit YUV4=
20 16x16"; break;
> > > +	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10: descr =3D "AFBC 10-bit YUV42=
0 32x8"; break;
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_SBGGR8:	descr =3D "8-bit Bayer BGBG/GR=
GR"; break;
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_SGBRG8:	descr =3D "8-bit Bayer GBGB/RG=
RG"; break;
> > > =C2=A0=C2=A0	case V4L2_PIX_FMT_SGRBG8:	descr =3D "8-bit Bayer GRGR/BG=
BG"; break;
> > > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.=
h
> > > index f8b1faced79c..d1a75e6a7d4c 100644
> > > --- a/include/media/v4l2-common.h
> > > +++ b/include/media/v4l2-common.h
> > > @@ -549,6 +549,10 @@ static inline bool v4l2_is_format_bayer(const st=
ruct v4l2_format_info *f)
> > > =C2=A0=C2=A0	return f && f->pixel_enc =3D=3D V4L2_PIXEL_ENC_BAYER;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +bool v4l2_is_format_afbc(int fourcc);
> > > +size_t v4l2_pixfmt_afbc_header_size(int fourcc, int width, int heigh=
t);
> > > +size_t v4l2_pixfmt_afbc_payload_size(int fourcc, int width, int heig=
ht);
> > > +
> > > =C2=A0=C2=A0const struct v4l2_format_info *v4l2_format_info(u32 forma=
t);
> > > =C2=A0=C2=A0void v4l2_apply_frmsize_constraints(u32 *width, u32 *heig=
ht,
> > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0 const struct v4l2_frmsize_stepwise=
 *frmsize);
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index eda4492e40dc..88fafadbe13c 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -698,6 +698,12 @@ struct v4l2_pix_format {
> > > =C2=A0=C2=A0#define V4L2_PIX_FMT_NV12M_8L128=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
> > > =C2=A0=C2=A0#define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N',=
 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> > > =C2=A0=20
> > > +/* AFBC formats */
> > > +#define V4L2_PIX_FMT_AFBC_YUV420_16x16=C2=A0=C2=A0=C2=A0 v4l2_fourcc=
('A', '1', '6', '8') /* AFBC containing 8-bit YUV420 in 16x16 blocks, spars=
e, split */
> > > +#define V4L2_PIX_FMT_AFBC_YUV420_32x8=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_f=
ourcc('A', '3', '2', '8') /* AFBC containing 8-bit YUV420 in 32x8 blocks, s=
parse */
> > > +#define V4L2_PIX_FMT_AFBC_YUV420_16x16_10 v4l2_fourcc('A', '1', '6',=
 'a') /* AFBC containing 10-bit YUV420 in 16x16 blocks, sparse, split */
> > > +#define V4L2_PIX_FMT_AFBC_YUV420_32x8_10=C2=A0 v4l2_fourcc('A', '3',=
 '2', 'a') /* AFBC containing 10-bit YUV420 in 32x8 blocks, sparse */
> > > +
> > > =C2=A0=C2=A0/* Bayer formats - see http://www.siliconimaging.com/RGB%=
20Bayer.htm=C2=A0*/
> > > =C2=A0=C2=A0#define V4L2_PIX_FMT_SBGGR8=C2=A0 v4l2_fourcc('B', 'A', '=
8', '1') /*=C2=A0 8=C2=A0 BGBG.. GRGR.. */
> > > =C2=A0=C2=A0#define V4L2_PIX_FMT_SGBRG8=C2=A0 v4l2_fourcc('G', 'B', '=
R', 'G') /*=C2=A0 8=C2=A0 GBGB.. RGRG.. */

--=-bWFKK7BJz2xIIAJbHLBD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaeETigAKCRDZQZRRKWBy
9CnXAQDO8u3zWH+Y/GWTqShsvkmOYSbwlT5hiNzj2lQG9AgoUgD+KoxiOY6lLxpU
nvpHz+n+xc2j1ny38bRiqho0s1qzNAs=
=VD6M
-----END PGP SIGNATURE-----

--=-bWFKK7BJz2xIIAJbHLBD--

