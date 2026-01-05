Return-Path: <linux-media+bounces-49940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8DCCF530A
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 19:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F0EB30F1C43
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 18:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517E933BBD7;
	Mon,  5 Jan 2026 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="M/shUAvW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D67313536
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 18:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636607; cv=none; b=cMOH7hV8GFVtMm1G1dLmtvgEiCVRCCFyNIL15Hzfd/kFgiox48I+KcuInpdwm6UvFjQGRWBIK2NCgXhT9WjpnDGZoMC3FWJNMXQbiuO8RyXOJgCEIGAsXw2BGeP8kOien6Ob9MQzRu7HJA8F5qC3gJwn0+mgJ9HkjcugUhb7Wzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636607; c=relaxed/simple;
	bh=aOnfX3XPhgpVehluEO+HeLrdEIbIUxCCiC8mUuqAjdo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ph1ylGLWLpf61zIUl2GtUr43bw1Z89OiuqKDOh9qMYOURCZrIi49uuH2m8pq4y3ecfGWJ8pXO9l32Yv+UutqpTZH4b3nnQfk9saeUyeCL0dTY5gubpWI61+WteHVPLb14r40Rk5dG11+dGELT25lGx8q1xhVam7RQM9FOdLchSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=M/shUAvW; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b25ed53fcbso22959585a.0
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767636605; x=1768241405; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aOnfX3XPhgpVehluEO+HeLrdEIbIUxCCiC8mUuqAjdo=;
        b=M/shUAvWtuGg25JQahxti0tqMV1RLsTH33BA/OrLQ5RqHVRx25YdqwvkOPvIx2Hacl
         nNj+8JJ9OSNOwZLJOdww30f0xb93hEJihrBXXFq4iDupVDXVjqDFCSDXJycqaoLRIgMa
         r34aKJ4emH8gOcyNXIP5EacoTi+8BNg9EcUaHKEg5U9aJyZD4wCJrHbp7Sk+AglBaNqW
         Kngx8qVIxmZ0d7TZetTFYHa4DBOyeFB5eia6+VGvrgjDyks6eNa1akLhylOY8DoJd/ff
         L/HvOrFjI6+KqprTMJdRKHgx3wiwTpt2oiM5mlcaIGN11z8CXNSzh58Ccuw7eZRNLlyA
         a8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767636605; x=1768241405;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOnfX3XPhgpVehluEO+HeLrdEIbIUxCCiC8mUuqAjdo=;
        b=L8fwYmVH9cJ7PKkpucKsWaTMbfrXnGhym0WdSJVwbtDUgog6fLtWff9ahVhYf4ns2T
         8HQUrKUUtYc4K/KAkmoVJFsbX2weVGWS5OqrJtI7mIlTY8Gk9ghIb5tgR1Xm8qIVqhpC
         ErNsxzPtu6+NNS5gLbP0J6vc1LH+rWbSpei4l+1M3m4IN8ULuF4aWw7O5CPsktyLp3mU
         CHE4PdOkQ54/HU9e/Lb7EYX0rAP5FEseDN/NMPhgtXLM5O66qoOY+VCPY7jSbM58Gnci
         tSP2usN9X3qvukHp3XD1edYEAwNCFALtjMLQOKbqWoTQ2MZ1ygqd0M1F0JzTON8myRH0
         o5BA==
X-Gm-Message-State: AOJu0YyXZzSG+9X6OPk7g6bqBZCiEz6HMI+DQarAXMFSGKjBvwL8tOoW
	OFwPsCuod93PfDEVOLTOJU4geWSxgRzuoCc69bQCu9T0QcO0J09wtmWMQEoTw1ZWOOs=
X-Gm-Gg: AY/fxX4xkpKikbVMf5kHRI/KnnlzJLP0sTD7pf54mGtKy9PKUp4dD6kPtRjTxLnTuv0
	m5WYh6uPFTaea7WWpX8YBHAdid47iCV9tt7LP5ZRBJG3dPcxqii50pfqcMLAZUeZsmrooPEGkgK
	B4oPPy604iapuOzeViSPs6GjsqBdBnz1fGdndFprdSulLTW8dzWvOh3Vm/4Zze7Xz331edIrnCn
	i2cPVW+u4xeTdeXuX7yPoil+cNYGjeFAjgFWLsg59jbIBzsoqd4O71HX32odtUArwR5vwqWag2q
	YvUUW2rm9utcZ5HujI6ctLMcbHTGGavI703oIkRdPPTsH2gQULYCEowJuCGLyv1eQKa0+h0/SV2
	9SLSRkbczb7An/DZSwYJkkQ4JhClPB94Q3MwOcfQPp+TVsLueLkyfF/Y4jyT94rUSjrs4vZ5hB9
	biA42gP5b7P4ZI4PJNcLt1IpMDESQ=
X-Google-Smtp-Source: AGHT+IFR3DFd9jpe0oN2x6M/8bWNFU8mAiEEjbZ9LTTfuDxwfvW0bq8zMCRJmYOp1ZK5Jd4YL/mM9g==
X-Received: by 2002:a05:620a:46a0:b0:85b:8a42:eff9 with SMTP id af79cd13be357-8c37ebbb452mr64060085a.53.1767636604517;
        Mon, 05 Jan 2026 10:10:04 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a9a19sm3638685a.1.2026.01.05.10.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 10:10:03 -0800 (PST)
Message-ID: <4d885ca36bef3e8227f8e0ee80bf5bcc3959e9ce.camel@ndufresne.ca>
Subject: Re: [PATCH v4 0/3] Fix concurrency issues between G1 and G2 on
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ulf Hansson <ulf.hansson@linaro.org>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	benjamin.gaignard@collabora.com,
 p.zabel@pengutronix.de, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, 	l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 05 Jan 2026 13:10:02 -0500
In-Reply-To: <CAPDyKFpFm9kCSNbALJTqeyzFdg3OoooE2gUOXJcjv=WgQeZ84Q@mail.gmail.com>
References: <20251205015428.643-1-ming.qian@oss.nxp.com>
	 <CAPDyKFpFm9kCSNbALJTqeyzFdg3OoooE2gUOXJcjv=WgQeZ84Q@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-zvFzPoy3A7lV+wocoxlB"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-zvFzPoy3A7lV+wocoxlB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 30 d=C3=A9cembre 2025 =C3=A0 14:42 +0100, Ulf Hansson a =C3=A9crit=
=C2=A0:
> On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
> >=20
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > On the i.MX8MQ, we encountered some concurrency issues with H264 and HE=
VC
> > decoding.
> >=20
> > There are two main reasons:
> > 1. The vpu blk-ctrl don't have separate reset and clock enable bits.
> > 2. The g1 VPU and g2 VPU cannot decode simultaneously.
> >=20
> > We attempted to make corresponding fix to address these two issues.
> >=20
> > Ming Qian (2):
> > =C2=A0 pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8=
mq vpu
> > =C2=A0 media: verisilicon: Avoid G2 bus error while decoding H.264 and =
HEVC
> >=20
> > Nicolas Dufresne (1):
> > =C2=A0 media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev structure
> >=20
> > =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=C2=A0 2=
 +
> > =C2=A0.../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 | 42 ++++=
+++++++++++++--
> > =C2=A0.../media/platform/verisilicon/imx8m_vpu_hw.c |=C2=A0 8 ++++
> > =C2=A0drivers/media/v4l2-core/v4l2-mem2mem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 23 ++++++++++
> > =C2=A0drivers/pmdomain/imx/imx8m-blk-ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 11 +++--
> > =C2=A0include/media/v4l2-mem2mem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++=
+++++++
> > =C2=A06 files changed, 100 insertions(+), 7 deletions(-)
> >=20
>=20
> Can I pick the pmdomain patch separately from the others? Or does this
> need to go together?

I believe you did already, and its perfect, we have picked the rest in the =
media
tree now.

regards,
Nicolas

--=-zvFzPoy3A7lV+wocoxlB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaVv+egAKCRDZQZRRKWBy
9FfKAPwIfuzu0Oju3HLojCHI9FM9JdnnqW5c8KFbwAK37MdTNgD/erN0pVhummc6
5FGqJ5UvmnrrAGczimw1n6SlMWulQQk=
=CTsW
-----END PGP SIGNATURE-----

--=-zvFzPoy3A7lV+wocoxlB--

