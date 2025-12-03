Return-Path: <linux-media+bounces-48186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B1877CA0CEB
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 19:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2689C30019D4
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 18:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE40C311C32;
	Wed,  3 Dec 2025 18:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="yKO33AvT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1562D949E
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785468; cv=none; b=ENLF8D3xC5ePNwhZLST2YPlz9lL2121BKiq+6OvHjArjF3722BMcyeP398KSrA6mQpX7MjoiM69ay8wTFKkbEZNKr//Oeq8NcMyfwIJApZsmkqRNrPgMYZiZ5GUO6gMsg+1vjn3KnGJLHvwl/y9ePt4zqt8oFRu1DgDkm1Ozvr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785468; c=relaxed/simple;
	bh=1IrJiXDgyU4C8dSO1PbGNsu61VWYAfgOJPUSXjYihOQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ax6cYUTJdOeoJWnwc/XWOFd+JsgVvSAwBRnx+bXqIQMrBHJYMsJCNa0B4K5llaNEm3uefI07MOhczoBhaBUhTYSNWaun9k8bQT4UXZiBBLxLe7eflOo7m4PvkxEPVSDGDPjmSuQ++mAJ4WGUqOqW9QNeKj0qJRuh/WsYlKL70S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=yKO33AvT; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2dec4d115so2436485a.0
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 10:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764785460; x=1765390260; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1IrJiXDgyU4C8dSO1PbGNsu61VWYAfgOJPUSXjYihOQ=;
        b=yKO33AvTh7fgAstI+6c4xYAaApG47YqQqBqYcIrAGtNAVBWi8SOPJ91v8M0GF/Cl3C
         PK6Sk91A4h8wwm0UFGiO0mq6HjwIhbVRuWQs69Hqqj2Ho1UgqR8VwE3klasHG7mg5rBc
         3ui1hhaSBQ3EsuxEM6ntIeWU8gVGRT0WWbI56dQbbuZxHlgk5+4L+GZq2Ih6/u98mQQm
         f9+P8Eceop13F4hQaIZpvgFrsD0gYnwqUM/R7U/i46/xIEFiE6Sagw5qBb4iQlnbDgYP
         6iyxqZryn0hZePx+AvTmeexgjJtV7ObQ1hwfphAt3/boBkOY7so87moLbPNwX3JwXR0c
         BdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764785460; x=1765390260;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IrJiXDgyU4C8dSO1PbGNsu61VWYAfgOJPUSXjYihOQ=;
        b=WyHhdHkYpo6wTUMGSmiFUcRt5iWltY7+8StQ80m4qpMemGRY7K6I/q/JFv2ppiUFB2
         WIA5VLaWVV2jEDzpycNPdTF2Msnqa8Rc9USikFcDJ3uGCASV2U6ZyT0qJ5zIbMUuQt2+
         H+xyajCMENAP45lm09dNQACAEc5bDWjSN1Zw7BHGWrtI7ERhQ++nB9MkQO9AetiG7Btl
         gaWcu5ZkNAkknoUDA1/8xJQZUNSh0lkhk5z2Tj5rZ6asVHK3j1T5rTL8q9uS7Y7zZ7Rq
         Z4yFxDC39tIOohF7ljnd+AtggIvsO9xalzAyiei4W1483Enmzu6F4lrmwH2XFnXGFOz5
         mAxQ==
X-Gm-Message-State: AOJu0YyHvBZeThaNdZLxABbqX9dR0eBEJJLeAFIfIQ67p685mnrutv7L
	pB+wlp9dOVbPUcGeko1gkFyZb1evXgxKVTl6ECpg5bi/1WMtaNjxv9IQ/FtsNgIelOhugsdzEpB
	ocwkXfGY=
X-Gm-Gg: ASbGncvOIPbPcFrRHL3dgeRs7Y75jHC/rZPDM2TKAagYw5MMQFDc6xg5aZl10ur8hh0
	cklsb7DUqHTy6oxOCSG5Cs50M80u4RYD2g2vJrvMCzc5+aG08jb667qJnLMkvO6AGQhlZ5Df3W5
	z9PK2H0yqdjQXNn02vyzPHndMZ8qGe9SFZA+rYGDFOkwlJXR7Pm2h7Wxoh9/Y6un9kFGNjN0n57
	tQyKtnZq+rLHEKcaEt2lUaJQ9Bxmo1u2Zh8HsZIb5HsuoqHvlP3Q39wZ6qGLcJu8ak7wgJCms/T
	GxAHpLktgq3xDuIuVQ1XyvlBg2gFGZ6nah9pzeHc5r8XlTWT5F/I8PbC40NcNYavbfQJyl4w+xj
	9N957exuLsyCYmqCv66Jvt5KSFzNlX/sqmE7WfpmyXY8Sulsgu05bLGvRmCRVSOZZifqqd4Whch
	Y0O7/4jPbzKYZqXUHc
X-Google-Smtp-Source: AGHT+IEaOEQhBqOZedIgKibmGORWzjoSJ4nDUCWPm8yIQS9LJdxFOttTpzKAq2HUEnCPE22SYVxHqQ==
X-Received: by 2002:a05:622a:314:b0:4e8:b2df:fe1f with SMTP id d75a77b69052e-4f017576c94mr39864301cf.28.1764785460344;
        Wed, 03 Dec 2025 10:11:00 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f0230b8dd6sm1706421cf.29.2025.12.03.10.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 10:10:59 -0800 (PST)
Message-ID: <519cdc6933469378086e97d11d31552d76ddd9d6.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] media: wave5: Fix critical issues in driver remove
 path
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Xulin Sun <xulin.sun@windriver.com>, nas.chung@chipsnmedia.com, 
	jackson.lee@chipsnmedia.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 03 Dec 2025 13:10:58 -0500
In-Reply-To: <20251203040935.2685490-1-xulin.sun@windriver.com>
References: <20251203040935.2685490-1-xulin.sun@windriver.com>
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
	protocol="application/pgp-signature"; boundary="=-8wd1bXvUSgRz2Q/bde/e"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-8wd1bXvUSgRz2Q/bde/e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 12:09 +0800, Xulin Sun a =C3=A9cri=
t=C2=A0:
> This patch series fixes three critical issues in the wave5 VPU driver's
> remove path that cause kernel warnings and system crashes.
>=20
> The issues were discovered and consistently reproduced on kernel 6.12.58-=
rt6
> with the TI AM62A platform. While testing on kernel 6.18 shows the issues
> are harder to trigger, the underlying logic problems still exist in the c=
ode.
>=20
> Patch 1: Fixes PM runtime reference count underflow
> Patch 2: Fixes kthread worker destruction warning=C2=A0=20
> Patch 3: Fixes kernel panic due to incorrect cleanup order

Thanks, applicable to all your patches, please reformat your commits messag=
e to
follow the guidelines. Avoid the "Symptoms:/Root cause:/Fix:" titles, reade=
r can
figure-out what this is. And then reverse the order, what is fixed in the f=
irst
paragraph, explanation of the root cause in the second and what users would=
 get
(symptoms) at the end.

Also for all your patches, add the missing Fixes: tags, these are important=
 for
backports.

>=20
> All patches have been tested with 50+ consecutive encoding operations and
> multiple modprobe/rmmod cycles without any warnings or crashes on 6.12.58=
-rt6.

I don't think its going to be a big deal, but please, retest on media-
committers/next (currently 6.18-rc5) branch and report.

With all this covered, you can add my Rb to your v2.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

regards,
Nicolas

>=20
> Xulin Sun (3):
> =C2=A0 media: wave5: Fix PM runtime usage count underflow
> =C2=A0 media: wave5: Fix kthread worker destruction in polling mode
> =C2=A0 media: wave5: Fix device cleanup order to prevent kernel panic
>=20
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu.c | 12 +++++++--=
---
> =C2=A01 file changed, 7 insertions(+), 5 deletions(-)

--=-8wd1bXvUSgRz2Q/bde/e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTB9MgAKCRDZQZRRKWBy
9JBkAQDzO7dKDJwxGvAC1U1QbDRZm6qI4LvLIrK1/KgEtePhwgEAsJrrDM6poglz
eO19J1mgcdm0bocG0rt9pSG6/Am+hgE=
=+5SC
-----END PGP SIGNATURE-----

--=-8wd1bXvUSgRz2Q/bde/e--

