Return-Path: <linux-media+bounces-62286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GCSLnm6DWpT2wUAu9opvQ
	(envelope-from <linux-media+bounces-62286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:43:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA258EFC6
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38B2A3065E89
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075E62D739B;
	Wed, 20 May 2026 13:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="J5MPOzzV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DA22D12EE
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 13:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284231; cv=none; b=keA2A0er3/VHcCza5sfGutZLlXIstokgzCPXY4Oz4nZbVj0I5M5QO2VaasHIoe/zUWiCbHGZt2PrnlDuP27fOQFgpWnsBWlWbQvjTaTOE4f/zuqsjqxKIIoZD07191t+Qi0ULEt1g9acIJWmrle3pEsov5PPhIE0rkeLDmsmbE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284231; c=relaxed/simple;
	bh=qw5vtphIBtrKIXgfHaxpwioh/P4/NLp/lrkzaejmr1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QE9xAr673Y8XhbCoDMMCHRfeJiSglk3b69Ombmiwp9ytoSvOk6h+yJub8RFk+Fze2z+jywpYTlwEBk9b7cmkuOH+GuRS/AWnfNyvte7miK6or466DGYmTmtFpZGiOwJ08UFZon/86WXLjXGtLI6bHP+EYK45mGuuxDE6l5l9SQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=J5MPOzzV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso58775125e9.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 06:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779284227; x=1779889027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pln2jS0wEpbC2/LBF4G2PqS21mie7KJZ+c11Xau3VxQ=;
        b=J5MPOzzVpbh09R+QPmzo3sMCa2lwQeJ+Ln9YR9Ko6Pu088cacXtVUr7GHy2WWImjBf
         +kMTHUhnNtVzMmNbQkwjGgNGXXhtG633lxniAvD+u75dnZ+Ivsc2lRtK3zp0BwQex2A0
         6oUKMr/vo8lYUa1hapBmjlPSUwY7jlrcKvq1DVyMT6qMry26QhsBi85c3mn/9GA8NL2c
         G4K2EHUailTPjfiJ7iTxh8uPU6DTYLVkXkR6sNQN29RqdI4jLC8PUHytk27SQUBIhqQ4
         0Bk0ptM1ezUBqnb+t2Q5bEAKh8IZVr9t6HGTRQAC9sLA6c7rb7K+DyrH2+icGMycS+yq
         mt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284227; x=1779889027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pln2jS0wEpbC2/LBF4G2PqS21mie7KJZ+c11Xau3VxQ=;
        b=HljkjnjOlBLevq//MwaDUFyqvt9Z1V8AeW+j4naeIVe6Df2plCIUlPXL79h2T33Q56
         y/0sZ6EiR+6qm5F9vO5nFkwavF9HQ3V428PWSqCZL5/beoQ1LGaSI38JoJZRSUbWBfsZ
         HlVKDRPGHn4IIPqIdHlqYm1x02RkpvVfnVrq6JJAdJ2EXJCclJ3uJoboD493hjXTscnP
         olCOzxtb7OCbjoxncApOLSKbKsU6YnmWeRm5un9OQYzOOJCPtYGVb1PKcQB0qLOPDMMz
         OXovCj9E5fpdy4jr5+Cos7z6zWZpf2nkoIwMUPuH7grVKFutiM8FZe14CVOgsUIy/4pC
         03mQ==
X-Gm-Message-State: AOJu0YyyUDWnEkjYK5aIlArObv784Azldn4GweqA7LT64jWaN2k7GkRv
	dNBKwD0ZduB6V1kgZOS5XcINvZPAmEvFcbHxYV4p3SDdLpTv3aVSDVU2lOHdpWaTrlSsEGUuzge
	LNVNcEFySxg==
X-Gm-Gg: Acq92OGjlXpI+SmvoFz1pPotOGgzFIz3ytrJffAbWo8qb8k+3DYlhdHYBq7ipMK2ftd
	Xz8tnOVSZ0Wp+BC7ro5Dqi2rJ2qFyv/6Fpfy1Uo+mgcwRYdWqTkTVX1cH5k1qt2vpWekdh5vHHL
	vjDW+dwAf8ttA/y9soMHynVcFuxQv6j6VoTKWFIiK9ii7iFbNY7ovsYmHIHSjP4NlTaydLX9+U7
	LJhpB8sBs4Ifz5J+TnXXwm7GCpoT64/lMJhYcbTqVaCcW2uqh7uftkN8WRWEcg0w8tDvYurmU1t
	1+mFEz4it0pOYMWpcsezWWcBTgzOzJ0lNmHs8z4vq2gnn77R7EVgrBkygeMmaAvtLjPGbW2+HpC
	qKl48hh00qETgtF2k/E9n3pY99doccf1jyrpqOdUT8WpL2mh230o+KAE4XhmVxU2wOGp4PK0cRb
	NnzfhZ4GaRoAsDivu9S3+EdKvC+GNlD5HSSTrN9osRFlOClsQOeVGgv//4k2Oqm7FJ50laqN/Fk
	gDCiA==
X-Received: by 2002:a05:6000:2304:b0:441:1c95:17e7 with SMTP id ffacd0b85a97d-45e5c5c9e11mr39989414f8f.15.1779284226879;
        Wed, 20 May 2026 06:37:06 -0700 (PDT)
Received: from localhost (p200300f65f47db00000000000000081d.dip0.t-ipconnect.de. [2003:f6:5f47:db00::81d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da0fe248dsm53329484f8f.30.2026.05.20.06.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:37:06 -0700 (PDT)
Date: Wed, 20 May 2026 15:37:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [v1] media: Use named initializers for arrays of i2c_device_data
Message-ID: <ag24InIgERctIZyo@monoceros>
References: <20260515161528.465621-2-u.kleine-koenig@baylibre.com>
 <6a0764e6.ec7b09a3.350c1e.ff87@mx.google.com>
 <aggG2S-KG9aOTjsX@monoceros>
 <d5a34e40-2570-44d7-80e8-0646f6f0fe68@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fsi4iec7uclffo5t"
Content-Disposition: inline
In-Reply-To: <d5a34e40-2570-44d7-80e8-0646f6f0fe68@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-62286-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 59CA258EFC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--fsi4iec7uclffo5t
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [v1] media: Use named initializers for arrays of i2c_device_data
MIME-Version: 1.0

Hello Hans,

On Wed, May 20, 2026 at 09:16:18AM +0200, Hans Verkuil wrote:
> On 16/05/2026 08:26, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > On Fri, May 15, 2026 at 11:24:38AM -0700, Patchwork Integration wrote:
> >> Thanks for your patches! Unfortunately the Media CI robot detected some
> >> issues:
> >=20
> > I wonder about the Media CI robot testing iio and hwmon patches. What is
> > their source? (Hmm, I guess that's because I forgot to remove the
> > prerequisite-patch-id lines from the patch.)
>=20
> Yes, that's weird. Note that you also forgot to add a second '---'
> line before the 'drivers/media/cec/i2c/tda9950.c               |  2 +-' l=
ine.
>=20
> When I tried to apply your patch with 'git am' it thought the include/lin=
ux/mod_devicetable.h
> diff was part of the patch because of that missing line.

I don't know your tooling, but git-am gets that right on my end (i.e it sto=
ps the
commit log at the first (and here only) '---' and also ignores the
indented patch to include/.

Sorry this is more complicated for you than I intended.

Best regards
Uwe

--fsi4iec7uclffo5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoNuP4ACgkQj4D7WH0S
/k7+cgf/XGZC4sUCxW5Q7FEsPYnDVLOQZLwe6nZ0O1165PgwqGDH4Uo0UL953VaO
lzik1EuZewPmVVsHhQW9eqlMREEQpQWDf5XOtf1yBPmP1jO+xQGSHF+IhiR+lja+
pZ8mmYsg3LidFYL/lx9Vk3b1C6EzLiyDkeq6A0It6c7KNr1DkZtcOPpS1i+RMYT+
zYJo8LyrkJU2q4TmK2jul1lMQeJp/2sSX13Xv8pTZJ5yaBWaXr8SomDXdfHbrflS
GtdXdyJrecogmQPWv9wCRhhxEQr4HXVZXV/RhJjAj+NNJKSur4xCzs/6qtSHPl4r
/WfUhqBCqimMIa8q4D1UAbbh1AAr9A==
=mPzg
-----END PGP SIGNATURE-----

--fsi4iec7uclffo5t--

