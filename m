Return-Path: <linux-media+bounces-41678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73AB4201A
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EA0C3B4459
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA56302CD0;
	Wed,  3 Sep 2025 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="j00Rlx9R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C17301001
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903914; cv=none; b=EUrmIJfISvHzMtUhkUdXF5ps1hGNh/vhGueWGOGBaDXIYJ0tgF69N+ue1aMlshVRBMz0dklhUd4GrHX6cNKlsHGDnVSUIbQIDH/kB/0ABZ8l6YvktNQCeStCVHVx2hZv7haJMjjo4QSBDBmdf+ONCHPxyNNqC9zu9sMNJazlDTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903914; c=relaxed/simple;
	bh=AIKFtWlK7GYq5oSMffbje2ESCsIUc5V1H8t8dEEMHJc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JmW3K548l6DC8jnJpEA3LZ0K6WzOUu5fjChCfWRRSITTne/eCsUo56wOS52L9OJCvWMda8x+NY/5SOpA7De0xPfx8yimwCUUd8Q24ofwhRDWAk8V+wQZU3xXEPJ/+ci7YeQMwRuFWCKKEfu0Zk575GVSanzm2rRtbLSqkzeVkbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=j00Rlx9R; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b109c482c8so115285001cf.3
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756903911; x=1757508711; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AIKFtWlK7GYq5oSMffbje2ESCsIUc5V1H8t8dEEMHJc=;
        b=j00Rlx9RLaE1YxzYMYw7HwIAs0Dn2BbGEAkIVylIsV9SAFpWSbjZnfwMdQpqzZNyuV
         oEq/yMdij3xx5CYm+UHnVyPp2aG/yB0RzMf1zs23yadxxexOyiHfebdgSKaYI03Qo3PA
         VL8uXHJo3LzqzU1wmQ8REzGBa0WusTsFf4Q2027/cAipRktgq/5MSlGll1PDQ5VkANSS
         JRUI0W51CrmMqPaTNPuS8DLF+TznqubDlbVLzOCeqCUoUwg5UiBOrkhrOVc+V9J7vZYW
         4DxxONexdIcbqVK2aStZT1laO60IvLE3QiUHMr3/eJbeAXiUw3jzoEpXdHg4pwIYmLFR
         FlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756903911; x=1757508711;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIKFtWlK7GYq5oSMffbje2ESCsIUc5V1H8t8dEEMHJc=;
        b=BphXZdA6NdniHVIgA4ycuPAQ6EV0UsmLOGAuq9r0hyytUb9kqWc+z4KXwWUqxo3MP8
         vPKAs1+A8FbbYL1Uob8oLEYwqQChrx8yMuY7J/gado/pHxM/obvHYsGZfe3eLKedEqoj
         Rjl2Vo0vryHEfsaBGFMMZ1wZ6udpRV1/IgoJfZxGf89nF3p/MkTxaOAgkw4vUyCiVgEa
         h+bS7WtqpPkSNISl87NI9Huzlp0+Bw1yQCDX7PS4+CcvhAX1JF4Eu6rWjhQY0OZKwh/Y
         U0tSbUEh3S5ahr+PEFc0YQbCqdcmTj1VCM8LKJnK4Wy57F4ZwrXNY+iOPhpFLZghMLzr
         ImSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZhdtY3gYM0A1LgXk6ru+3X9RHYX1P9tpDBwm3C/Gzic/wrn8Ljzgp3enYqI09SLs2hp08wHbUB/u6SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiyMFBr2dZ779WreJbsPdIe3SGvZGTIqVslZ6QKw6PAvFtAOPr
	Khzw9eCxOui512l3H6FXugaO7qLu6rtErcME5Z5KXqqoVXkxe5mSUg0Bf1ZHE3w7RDs=
X-Gm-Gg: ASbGncsid8UdCGO49A9+V/OXyC7Im08TJUlLmtV0fVqHIuL155PAKByCaT6E8SMKc32
	hvt5RlAHLrH61zMnxdGFOQiDuS5w/zuV09FKi0kkUgljscIsh0v8rkvXI1t//uTHLXvfuqjfw0C
	JGRmlNX7XuSf1e0Cn7s09CoHVgr06/11gLW12zbwtyckY03pQvk5tPncEQrJ4ko1T9OTZ5qonSW
	iWoGTBh0ZfJ8xadkhNtGAYbfzI86CC85x+m/OoZN8Ipp5UMrV5tsIAPVSWJOKLQWoM6wyOHgs1f
	QLcp8u1RQytR8wbbusqs6Zidlhq6WRZlTK2LukLGJ+011h8jNX5ct+HEWg5bmWhzu8iH3sjBBbi
	TMolXVyl/VNdk9LzfoB2P4m43qqQ=
X-Google-Smtp-Source: AGHT+IE72v8aFSokPKeCW+j5I/H9PRUxg3lIUX4jhYLcoDzr0VzT7udk6OxKSXEObKTn7EUimLGAsg==
X-Received: by 2002:a05:622a:c3:b0:4b4:3788:baae with SMTP id d75a77b69052e-4b43788cbc6mr44528761cf.43.1756903911203;
        Wed, 03 Sep 2025 05:51:51 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f501690sm11289281cf.0.2025.09.03.05.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:51:50 -0700 (PDT)
Message-ID: <78b80e3bc761eee2151a32af8b7f1a782fa5e500.camel@ndufresne.ca>
Subject: Re: [PATCH] .mailmap: update Vikash Garodia's email addresses
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, Krzysztof Kozlowski
	 <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com
Date: Wed, 03 Sep 2025 08:51:48 -0400
In-Reply-To: <b60f364e-3aeb-7e01-d03e-b7ec8eed1a42@quicinc.com>
References: <20250902152224.1150300-1-quic_vgarodia@quicinc.com>
	 <de89f325-0e4c-4040-a7ae-fd36d3e4a177@kernel.org>
	 <b60f364e-3aeb-7e01-d03e-b7ec8eed1a42@quicinc.com>
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
	protocol="application/pgp-signature"; boundary="=-YMMHO9Yvb4q6LHa/9hL4"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-YMMHO9Yvb4q6LHa/9hL4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 septembre 2025 =C3=A0 17:54 +0530, Vikash Garodia a =C3=A9cr=
it=C2=A0:
>=20
> On 9/3/2025 12:56 AM, Krzysztof Kozlowski wrote:
> > On 02/09/2025 17:22, Vikash Garodia wrote:
> > > Add vikash.garodia@oss.qualcomm.com=C2=A0as the main address for upst=
ream
> > > work.
> > >=20
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >=20
> > That's the same person. SoB does not mean any rights to an email, but
> > DCO. Please read submitting patches about meaning of SoB and drop the
> > first fake SoB.
>=20
> I referred this [1], at the same time, i find your point valid given its
> basically represents an identity, which remains same irrespective of mult=
iple
> email IDs.
>=20
> [1]
> https://lore.kernel.org/linux-media/fb481f2d-d230-4869-9cc2-6f56e75f92a2@=
xs4all.nl/
>=20
> >=20
> > Subject - it's mailmap, not mailmap,=20
>=20
> What are you trying to say here "its mailmap, not mailmap" ?

My guess, and since I also prefer it this way, would be to drop the leading=
 dot
in the subject, quite cosmetic preference, but I believe this is what the
comment was about. ".mailmap -> mailmap"

regards,
Nicolas

>=20
> > but more important - MAINTAINERS
> > patch should be squashed here.
>=20
> I was planning to do it separately, but i agree its even better to update
> MAINTAINERS alongwith this.
>=20
> Regards,
> Vikash

--=-YMMHO9Yvb4q6LHa/9hL4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLg55QAKCRDZQZRRKWBy
9E23AP9uxXuhj6wIQTKfXjvP1QE55j4Z81pfP+3CGzl/HBFIAwD8Dh27hEts5q8r
J9OdeuMxQH0NBQuAPybw5JV+NrDyEgo=
=VynR
-----END PGP SIGNATURE-----

--=-YMMHO9Yvb4q6LHa/9hL4--

