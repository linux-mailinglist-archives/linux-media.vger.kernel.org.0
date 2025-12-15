Return-Path: <linux-media+bounces-48825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78457CBFDBA
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 21:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8FF330115C0
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 20:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B77328266;
	Mon, 15 Dec 2025 20:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="w907xyFU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8009139D0A
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 20:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765832200; cv=none; b=UHyXRU8rofgwmKZTI5pjhFK2PQ0Qc/pbfgYcbabvfDPSDLvFBxHKPybyWbuNBIVARRCZXQjGZA+6B03heDh9xRzJTaADGoPea4lplWbmSI5GF3wXaLttJ5RFqoFkJa8xH0aLPteuzGhKof2yZPZLxfjpWQqX6s2pXrT4YqBoOP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765832200; c=relaxed/simple;
	bh=kPuMdDiFv4wPPtBAT+PrG9PgGxh/xlJVMp6p9EWQCuE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F+KBqvvOscBR7uIAOobZ2t9YA8QCkhW4K+BO2ENavtrKRIqgFykJNkhQjrDprIP3nMwAhgJBO+v4m9LaeiPYaY6SZ6IYnIi4xyxC806Rc5NRx/kGpCjnyINJ7JvSZnmQT/d/5inhV8+gCf2cMNp5DdacPiRbincl8zu/nRrQg4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=w907xyFU; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b2627269d5so397413085a.2
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 12:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765832197; x=1766436997; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kPuMdDiFv4wPPtBAT+PrG9PgGxh/xlJVMp6p9EWQCuE=;
        b=w907xyFUKZWm0d4XZN869nlStVtw5wFHSz3en0drKwenqXrc6KyTLQwpkxLjkhuM3H
         KRUgi3ujtZ5Zd8hzZ3SKYiX7w1BJDY+oArh9c/YHtkmbmGPV3ROF9xovB0Vp/kv13bOS
         jFZO9n4mD6cwbrH8EtDFMNi0DRri0xLT4xnef7kaPev/PrnXCOEGjWekoMfnAGzqBN7H
         84FXbe6WlkMckpiWggePX+jNSRCZx0jhopTPHqJqmufjyIeb5RWRnFk3bv7aCK8J9ONV
         piZK36X209nw0jUrxhQcbccN6wLqEVvtJ4ZL9ZBPFikWlC/VmZqDwLV11n2Bdgl+vLnu
         sBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765832197; x=1766436997;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPuMdDiFv4wPPtBAT+PrG9PgGxh/xlJVMp6p9EWQCuE=;
        b=GW6NV3y7D4CdYrRVbvOoEAXMfIvvyIUxriCTDSJOvqMsYWJvIA0KvohxonnuMcOAdd
         /0dKH/q84k5/MwvHFIApyYeTKFa/cFcdhjri1HcC6iaviTpQHiCdZwLD+Rg4p/RLKAxf
         w10hxxtVLyszwwi53iYAg3Nc/0l6xgRAKJxaEqYyKPfPIzmf6AhR5rskxUwPyp2L3Ntu
         ZPX2qK2IUk13Q/7s0EDC/qE+kY+a9kFaimHAUEidairmgHmXxawoSElHjES5o8ja0+kp
         tdPUAX5EifLimSFEVycE3yjYvzWh3UG94PvF9xiVTmKWmMQouNdjKd4FeRl1R8UZSIm6
         smaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGJmlTwocFCfvhZWDHbvty+Svku5ZBL3C8s7jg1U1PhWek4ERiF3Xd357bDMp+J/YnrcWY7qZmxnadzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5wUY7/w5QwNcfdeJmlKjyk+hwsOePuJqCYOkwVl6SPCgCF0ao
	yrlhSdqw5gdDCU/MPIkd7gO/OpRQ+Z1sQ1uvRNJNI2V2wbxGEvoLLva/iwbuaRtBSys=
X-Gm-Gg: AY/fxX5E8Ou7nAGVjhrRKm6OHkABWDpWylMnnGOkGwUxYC1cuMP5LdUPd+ZaI/Xl4tw
	LhkNaQj3YxWmwGRtxF6wm844OL0bFj+0cBysUiEhy+t5DNg6JjuupI1a+/897INaB7nAyJpJhIj
	BzKavI1qdl2kyQB/PkzyjjC2+PY+l52DC3ECYaOHfdN+TH8hAHkWITaj0h+0o2SFs25085oZvJM
	wOIl26Y1EVVlFqZM2y2aLaFVt14CBzO8Y1Bfn6+BUwu0QI4an5ht6C6kW52U/UcXV0JYAudhIqF
	Xx9/wfXMRxmqiyFLjS/8GoeJDYHc38wILFFNzAsO4eQwYG1biGKSD5RfvLH+Q9c5PiG1ItvBSD7
	7v656sRKR1e76vdXJgvhY8EbKTZBzyXgkvVRmzz6t80t9VYhE0h/06WYC0TvvdauxGBpPnNq+2P
	naGeC4lOXd0cUFAjVUxx6LkwEv+fo=
X-Google-Smtp-Source: AGHT+IGs0LQ+Ie8RHwoyHQrwsKMrselLQf8rxvRj46SnkpT1P4dgJ+/RfREgR+lIju27/zj/QDR/ag==
X-Received: by 2002:a05:620a:294f:b0:8b2:d56a:f2f6 with SMTP id af79cd13be357-8bb38f80fb1mr1742229685a.0.1765832197414;
        Mon, 15 Dec 2025 12:56:37 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be304dea8esm33418985a.8.2025.12.15.12.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:56:36 -0800 (PST)
Message-ID: <e265d412260226be67df3bfb0dd05bb74e36d551.camel@ndufresne.ca>
Subject: Re: [PATCH v1] media: videobuf2: Allow applications customize data
 offsets of capture buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hirokazu Honda <hiroh@chromium.org>, Hans Verkuil
	 <hverkuil+cisco@kernel.org>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 15 Dec 2025 15:56:35 -0500
In-Reply-To: <CAO5uPHPKLxySgwWUi6w0Nm-PbDSPkN=OySbLK8wNKwXdp3p1Rg@mail.gmail.com>
References: <20220322132329.6527-1-dmitry.osipenko@collabora.com>
	 <dd22c40e-1200-42f7-8c48-63534f759045@chromium.org>
	 <5d367bbb-551f-4164-8473-a6c4b68793c0@kernel.org>
	 <CAO5uPHPKLxySgwWUi6w0Nm-PbDSPkN=OySbLK8wNKwXdp3p1Rg@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-DfC7oLhIv795a64IjpFO"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-DfC7oLhIv795a64IjpFO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hirokazu, Hans,

Le vendredi 12 d=C3=A9cembre 2025 =C3=A0 15:15 -0800, Hirokazu Honda a =C3=
=A9crit=C2=A0:
> Thanks Hans for your quick response.
> And I apologize for my late reply.
>=20
> > So that's were I am: I'm not opposed to supporting this feature, but I
> > feel that struct v4l2_buffer has reached end-of-life, and that it is
> > time for a modern replacement.
>=20
> I got it.
> I will discuss in my team if I can contribute to v4l2_buffer_ext work
> or sponsor that work next year or in 2027.

I share Hans feeling in regard to trying to force partial support for
data_offset into some space left of v4l2_buffer. This brought me thinking t=
hat
doing that, or even v4l2_buffer_ext as last proposed was not the right solu=
tion
to modernize the old V4L2 framework. In fact, I believe that v4l2_buffer_ex=
t
would simply replicate the MPLANE disaster, leaving another permanent scar =
in
the API. Just to state simply, MPLANE have lead to duplication of every mul=
ti-
plane pixel formats, solving some plane alignment issue in multi-allocation
cases, but leaving behind the common single allocation case.

For me, the most central issue in V4L2 is that the memory allocation/import=
ation
is bound to the operation queues. That brings all sort of issues such=C2=A0

- We can't queue twice the same frame
- We can't mix external buffer with device allocated buffer
- All buffers must have the exact same stride
- Application is responsible for caching which memory goes to which v4l2_bu=
ffer
- Attempting to import a buffer requires a free spot in the queue

This adds on top of the v4l2_buffer structure limitation we have been targe=
ting
so far. With the growth of modern standard API (think Vulkan Video notably)=
, it
becomes apparent that the model is too inflexible. This inability to separa=
te
memory allocation and importation from operations creates a lot of complexi=
ty in
user-space, leading to complicated bugs.

I've been quite about it, since until now I didn't have a solution in mind,=
 but
I recently come with some ideas. I'll will try develop these ideas, at leas=
t in
prose for now and come up with an RFC, hopefully somewhere beginning of Jan=
uary
2026. That my proposal is accepted or not isn't quite relevant. But hopeful=
ly it
will be a starter to go go beyond just fixing what we see. In fact, this ne=
xt
step is for me doing to be quite decisive if I continue doing codecs in V4L=
2 or
not in the long run. But I'm sure this is not just about video codecs.

regards,
Nicolas

--=-DfC7oLhIv795a64IjpFO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUB2AwAKCRDZQZRRKWBy
9PpPAQCf/G+8N376JB4wpndUK0B4XNGAb4asSYBkndUCE0QwVQD8CeUnyF4v01AO
YnsSGwWBWLz7z6iWbESCvhNyNhyl3wM=
=wQFy
-----END PGP SIGNATURE-----

--=-DfC7oLhIv795a64IjpFO--

