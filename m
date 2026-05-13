Return-Path: <linux-media+bounces-61477-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLSNLya0BGowNQIAu9opvQ
	(envelope-from <linux-media+bounces-61477-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:25:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 233E253800B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69DE93133CE8
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23AD4D90C7;
	Wed, 13 May 2026 16:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="hNEXT+9v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2435944B696
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 16:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691265; cv=none; b=Wrrby/L5vpuh2MBLDZkXuhnYHsuPX07/hNNcnRII0vQgQdG7KqFUr+7LHBOuw8K7ck4+3lvC9Dy2TkUJThuuyu4yIf4g9UhPSANPiSjiaIpbQoKDy2auDgGa0uIGvrHdDqnD7dnM9n6oY+RR45DqJhkocJSjgH9jVgRiyivzJuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691265; c=relaxed/simple;
	bh=zjrVcTrTTWQCfhxILgChHYoh0VZq+sDnXGjkQwsAF1Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AZK9WVgI1y5afbXR+3F7XyQ5eBILLBuL6N2M1oJqz47etYsgDSLVjX3GNkw0rWfMgzV8TXdBa1s52/fhrzS2r9ft/sgqYJtzRHp+AT+/SyGSJOyexaagRwbukxq0L/NAY1MClXh1FoVzMAv8bolQd+IRaIpBVytLiWf1rchSuCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=hNEXT+9v; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50fb8e9a4edso75888881cf.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 09:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778691263; x=1779296063; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zjrVcTrTTWQCfhxILgChHYoh0VZq+sDnXGjkQwsAF1Q=;
        b=hNEXT+9vwGsUaDbhP5YPLKWukz0ZWaParOXmXeRWkeZPwGMsReUfu8ITWl7I5qRX0v
         R2AJRz1MhEvHdLWJjuZhfzyrYzSkPxRGVpnBygUfGMT2aLWUj6wapT8Tmy/h1cEuBefr
         NVfkZL2jK06pEcewMJaI9EEBAnGJHuBy2jPpmJo613DjfYfE+Rb4N8sRfJId79zywUkM
         kwsHRhYz/DW6CGhbmDL8n6137nRkbpWB6k5M88Q7shu/CMkxMXgZmTKeB+U6B/us1MOV
         P7e/QzN0UWQ4vUkP7bVvpiq1Yxfjach2nNtU4P+nnOQC0c4t8/8SMX9p438noQQcNzbD
         ic3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691263; x=1779296063;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjrVcTrTTWQCfhxILgChHYoh0VZq+sDnXGjkQwsAF1Q=;
        b=Yj/QfQSlrE2cquxiIt2l8FTfGX491Lqh2I+6dDBAIw7pvKUrGzmpRfMND0rtTTOhy2
         0fWNMD6dE2eAXOQmT+l8uwOINXgL2j7xKo0Qek5XFVXMKGfB0y+RoBSku9vjNBH9QjuK
         rpGqS3E/Czp9Dvaqd5FOzlwN4SWYxUcyP5uSWhEwEvAW9Fi2mvJNmc4Bzdee3IhcjMfv
         w1ynBxCV3d7ZCmN7nVM1Xp2Rv9DCt0EYybI/Wg51Kw6y9Yrsv3d0pSpYuKE2UAZPS20e
         p9huh4+UlLNiXT6FXL32eIMxDvpAlojfIjivi0n5YBndPYuyFClUz8KF/NcbxrVHeod/
         dKrQ==
X-Gm-Message-State: AOJu0YwKzHG8fyur1fyEbXj9+BariTWtOu9bIELDhgLAHeJ+q96ejGPj
	Ba5Fst4XSuHU+sejFe5GFysMqaQApZXtxv6XNApg5wxD8fMevAKQy44JOyg90mr6MSs=
X-Gm-Gg: Acq92OHQhVfPJ8jIVMOITB5LFyKeUM7SOptWXZLDZ4UUl3+z5Uq5US2BJ/d0q8q0CUB
	L6Kj+kwsvhiGODGlVFkef++kbANSD9aGwT/JizkzEcC1pCWUOVYvv8SJvpjVIrcrNu6GwxyULAf
	DQXgp/IESG8j/Y+WrewFK+kYtdvook/zbWLPdO4KTMY1claXFrUrTphXdKfpsjIetyAvuro0NMR
	vK2aQv4qN3rKq0iT6wp70XNb7lzwztnfpdHoIweAY/C9WGloNlqlmbbxvLdm/BeJ4ZcWCBBmtwY
	sy83jWAa1cqxlQGr7tJeXX4M6dU5wJk6GdHqfRIdwR55tNqr4YZwJQpysqRSz0KJecSRl2KjHD3
	K2wFcG+mV/pPQWkJmYzPwKXVclLD0heXZgyNv0pGNVIocHwGZDZ91Ly8iBcyHuUpwiu8Ypu6HVt
	pKi3a3/w4iZfVoYrO6eMWXltRIUgPE+8G7qpKb53DEsu3McZ3IL6U8m1cQw55I8HoZkOl4
X-Received: by 2002:ac8:57ce:0:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-5162ff0791cmr48491321cf.30.1778691263060;
        Wed, 13 May 2026 09:54:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90874e5e4sm813106d6.6.2026.05.13.09.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:54:22 -0700 (PDT)
Message-ID: <4efb85a777683e8eba1e19501c4bf6de3494d2f9.camel@ndufresne.ca>
Subject: Re: [PATCH v5 16/29] media: rockchip: rga: split flip and rotate
 into separate function
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Philipp Zabel
	 <pza@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com
Date: Wed, 13 May 2026 12:54:20 -0400
In-Reply-To: <aeff9412-1c69-469d-bee3-7b9efa9b3947@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-16-eb7f5d019d86@pengutronix.de>
	 <ebe5cd6689923eb1e2124e177f694895383fba54.camel@ndufresne.ca>
	 <1f447423-8c63-4545-a4f7-d8d5ef821255@pengutronix.de>
	 <30f56a0ac9f724b5ec1b936eec7b5b7c5e751c75.camel@ndufresne.ca>
	 <aeff9412-1c69-469d-bee3-7b9efa9b3947@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-aSiFsAE5dKCPdAUlYUtL"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 233E253800B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61477-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne-ca.20251104.gappssmtp.com:dkim,ndufresne.ca:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--=-aSiFsAE5dKCPdAUlYUtL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 13 mai 2026 =C3=A0 16:29 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Philipp Zabel just mentioned that a 90 degree rotation would just cause=
=20
> the RGA to scale it to the output format (deforming if it isn't=20
> quadratic). The existing code already considers the rotation to set the=
=20
> scaling factor accordingly (which I've also missed in this commit. But=
=20
> the commit is dropped anyways in v6 due to the various footguns).
>=20
> While I see that the V4L2_CID_ROTATE docs mention the need to set the=20
> format according to the chosen rotation, it feels like it's intended for=
=20
> non-scaling converters. So I don't see a problem to just allow the=20
> current state, as the user has to adjust the format anyways if he isn't=
=20
> interested in a deformed image (instead of blocking this potential rare=
=20
> use-case).
>=20
> But I'd add a check in my scaling commit to also check in the streaming=
=20
> state that we don't set a 90 degree rotation causing the scaling factor=
=20
> to be exceeded (e.g. 1x2 -> 1x32 scales by 16, whereas 90 degree=20
> rotation causes a scaling factor of 32).

Ok, didn't think it would just break aspect ratio to make it fit, but it me=
ans
its valid for this HW.

Nicolas

--=-aSiFsAE5dKCPdAUlYUtL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagSsvAAKCRDZQZRRKWBy
9DGsAQDFF4AUa8rwW+g79CDHXNSmFRT9T7gidDUKZhGYQYsr2wEA65cExpikwkg2
lV7COvcRf9/k95Nx5NJ2kLXO9C4PsAs=
=fHbK
-----END PGP SIGNATURE-----

--=-aSiFsAE5dKCPdAUlYUtL--

