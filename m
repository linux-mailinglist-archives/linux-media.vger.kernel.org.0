Return-Path: <linux-media+bounces-58284-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA6XIje31mlxHggAu9opvQ
	(envelope-from <linux-media+bounces-58284-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 22:14:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC28A3C3A83
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 22:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAA8B301A43A
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 20:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7823793AD;
	Wed,  8 Apr 2026 20:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="tn2tmqr1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB39F3537D5
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775679284; cv=none; b=jsqqIQ+eCvt70MYTbeLyMBPuQJvlRwlCD57P6FS1yAKpyILOOapS1SQr6bdiOeKQ/YXl4gV4tjxstLqUMS6tWm7pnETeqZGr3fv59X0uSpUiM/VcBh+H8YP0XDQ687US7a7/Ic/6Ga4rihQdXVTifcOe9BikVUY7peFo6Ura/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775679284; c=relaxed/simple;
	bh=v/LYZnZ32HH2DBxy2/IymyPQJ6BKDpSIAFSpzQ3fexo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XUy6hX26jQAnOPV3ngZIAaL95JlbwUmjRJZ6Zsf2MzzNisrC6jw6Fm1p7UKFXuKFwhjtNS/u2TkdNH1EiMsy4r2XYOGOE2EQgVxdW3xWxmUzmJ6UCZUODP7PSKzLGLPRZPmhunMYjYBtotrGDad90itcHMwcXDC90OjfoOyRzlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=tn2tmqr1; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a110e06b4cso1846346d6.1
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 13:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1775679282; x=1776284082; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v/LYZnZ32HH2DBxy2/IymyPQJ6BKDpSIAFSpzQ3fexo=;
        b=tn2tmqr19m0S8MhvKW6sw6Iy5WOda/Dlwwpjcj3RyX6gsxwKpqUFmlODkOU/LyTzNm
         4SpAx/ac3xOXPHyHjFFCxRUamW78Ka5UL19hcBW4+B3ZzhEk/nNK0ZsiiQ83cNw4IjDH
         M7xgP4JEtfOjMEz1u4hxqNuCDwct60NOJODkJ0l3GuXWFp7gVLOSRZvszXOzFWx6pScs
         kycgR8niqCxDKdSsWE4GpHOqCmZ9ju13DgB5Rdrw0sls862sVcsg6J6K4CbVhtf0/YZL
         PM7mt9JfbTazq6APzD2aV58Az3JAKlFbPhrvASPjsh4i0EqiYrkkF53K1w+I7jSaLHE8
         Ca1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775679282; x=1776284082;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/LYZnZ32HH2DBxy2/IymyPQJ6BKDpSIAFSpzQ3fexo=;
        b=Gz9QL6iC5IzRjPPn1xnUcZ4RM5a/frSvEVf4KO0yudtehvA7Wc0lu1ERMNN3QbufOj
         PiDbKMvK9z4qjsIDk0Bsjf9POWXWy0LNt0WH3TR+levXkWEYOD/ThCMIYNoPQIghUHxH
         KRRYZpeG3jMEqoMPC1os0mi67rxzMyRC55y6nGkfgifU2r2T0AGLDsF3Cy5FKzjoHEEU
         qEHLs1HboOR9NFLMFgBYW8td2x+vmdUIoOkr3oS48Mg1c9t4lgA3srRqmqiJz4xLsdUz
         h5jvl3W3vy2UBmDnlffX/xaFielyh4rPb53CTXMbhaUPZNYo0F2u4jndbbTalZO+aWbK
         tHyA==
X-Forwarded-Encrypted: i=1; AJvYcCUh1ZqkUC1UAdVXSwHFm5UYv95fFgBrwVmHIAEYtAx/ptsct3Eo5DKDifiK6v/kif/A5J/QDDWJIPPh5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4DbZ6agautmOLM6LvnEHhbK9MX1u3skbJFMGHLO7Ck2Kt5pEr
	Mkqb6EfDhoB054VcGcz74kyJAXTHoffaJl+/w31Tn5SqWjhMU0LGCQbr0nRuG+JMVho=
X-Gm-Gg: AeBDievJS/2P/hMvY0jgymqq5AwFbRRZ2c6ZBpTUTRHPlkaKNUyMBLJIO9SGbiv0/ZZ
	3sNht5+M2dsTBmtgPJHmXmtJrrSGOjMt8EGHS1RjeAbS7ZyReH2nT67qplnAyiXD3nmg75kKvss
	lFU24UG4UCK1aHugehw6tz7/Bu63IdBy8gHSQt4oAj7m8hd70OXW9q2edJBZ6a7NRqFG/Ce+kGI
	JYY+w8gVtubbigQ4LLgsMfYkgVS4aom6aEc1F0gbuxCtP37TemLSjHFFhMfu08vfSAbpONA2RPb
	cxe2BNQ1Z7ybv00QsNh8Asee/A65rJUfb5hXT2isFziA0lBAhwI0xbKCe3bRcnWljSgspAYzSrH
	zK8mg7OvxmkXeP3Xy8PycTRKU/DvBuMLc3JkllbeXgqUO1acrnJP6OT9zJaQlIf6Hhj3A3BpJ8K
	ZQmHtAkHsfb81dzWZGnrpSHdeL3NBIzVNoHggYNeY=
X-Received: by 2002:a05:6214:2262:b0:8a0:7c8:409b with SMTP id 6a1803df08f44-8a703c28bd8mr358116706d6.33.1775679281725;
        Wed, 08 Apr 2026 13:14:41 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593333516sm174379126d6.6.2026.04.08.13.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 13:14:40 -0700 (PDT)
Message-ID: <decaae644bfb2d37bbf973720d1ece7bddad0beb.camel@ndufresne.ca>
Subject: Re: [v2] Documentation: media: Fix v4l2_vp9_segmentation
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org
Date: Wed, 08 Apr 2026 16:14:39 -0400
In-Reply-To: <CAMfZQbwFwu4q-06eCqhmW-AGaPYFTFmjA5wcA5Yr7MbrLfTaRw@mail.gmail.com>
References: <20260324-try-2-v2-1-eedbd0d3cec5@chromium.org>
	 <69c30f82.050a0220.1ae388.4e92@mx.google.com>
	 <CAMfZQbwFwu4q-06eCqhmW-AGaPYFTFmjA5wcA5Yr7MbrLfTaRw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-t8FvYJLPgoyubngVnKJr"
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
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-58284-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EC28A3C3A83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-t8FvYJLPgoyubngVnKJr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 mars 2026 =C3=A0 16:06 -0700, Fritz Koenig a =C3=A9crit=C2=A0:
> On Tue, Mar 24, 2026 at 3:26=E2=80=AFPM Patchwork Integration
> <patchwork@media-ci.org> wrote:
> >=20
> > Dear Fritz Koenig:
> >=20
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> >=20
> >=20
> >=20
> > Please fix your series, and upload a new version. If you have a patchwo=
rk
> > account, do not forget to mark the current series as Superseded.
> >=20
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/9605=
1061/artifacts/report.htm=C2=A0.
> >=20
> >=20
> >=20
> > Best regards, and Happy Hacking!
> > Media CI robot on behalf of the linux-media community.
> >=20
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >=20
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues=C2=A0or re=
ply-all
> > to this message.
> >=20
> This looks like a CI issue:
>=20
> ERROR: Failed to remove container
> 3af6cab3e8515aa18b263a8011d0cddb070fa9fc24f018d3f89d5c6b0cc1b885
> ERROR: Failed to remove container
> bc3a1a2eae3b22087dcb8f5720f1a7dbbe3d1529205915f5b6f410af8b8dcd2c
> ERROR: Failed to cleanup volumes

Yes, don't worry about it.

cheers,
Nicolas

--=-t8FvYJLPgoyubngVnKJr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCada3LwAKCRDZQZRRKWBy
9FZ6AQCPNZM3KMRlHtYrfR/l1rt1ZMI8ZHEdEiZl6RacSXtHKwEAtuEYDWRlGYRr
1cO/1pDKBBf/3F9vB7mvf7pJr4nTng0=
=B4Sr
-----END PGP SIGNATURE-----

--=-t8FvYJLPgoyubngVnKJr--

