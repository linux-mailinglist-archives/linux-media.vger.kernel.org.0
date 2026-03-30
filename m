Return-Path: <linux-media+bounces-57656-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMlFOgefymmg+QUAu9opvQ
	(envelope-from <linux-media+bounces-57656-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:04:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6D435E543
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF7EA304A590
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55AA334C1B;
	Mon, 30 Mar 2026 15:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="H7oy+stF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE4B2DCBFA
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886237; cv=none; b=RRt5WAteMp7xqKsiANrE5EaiNzca14NS1NCRUZAP4DoaVvricrJgxHT8JoNztVhZqLoh96Kv3O+r2w+s8KawJc532JW8SD+FX9z9eyY/MUg2XJp4MQN1AcLnUJZ8F9rc5241Km4bYJLVE8n+ZCnq4zgYi26AGy9hUhTkN8GrTIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886237; c=relaxed/simple;
	bh=Gh5oXb2HZ7Bu0fz2O+Gvc+k34BjGtp57MpBJnwrNoM8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JkBf+WgEdkozFiOd7WKTJaQMty1lRN58KyP9KXZo2Z8y97EBH0MYE1KPOMWhySg4OORplJpAPqYUg6TTX+Ns0Bdx6x28hF6j4xU+Pe2pHUZIxNdn5DJWmsnKElNY4w4YKRUGCqvcRY6GYIlS5KE46T069tXw7fkX0vZTMHzeNVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=H7oy+stF; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cfc497a604so618699885a.3
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774886235; x=1775491035; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gh5oXb2HZ7Bu0fz2O+Gvc+k34BjGtp57MpBJnwrNoM8=;
        b=H7oy+stFlWuw7Vrb2UicWRYinSRGpICECtKoUhi26wCcwY5TjYr9ch8dEQuwUE7vtG
         dcr/D5cz3Q7vMGvdKeGunucWGWRakgpX6ydl8RZn5zQIFBkraCk8+EW9IwEEqHAkXTyd
         C10ZGBn0/UdSGYjFhtETvhdIG2yX7SIzRTSL9Q4kk3ADhJgT7csAz6MF210PXcg3cBZI
         jnLv2yUQIPhtzthOPtRmlXkJIR9poPfmKzQ0E982rDcz8WVi0+H4dgFD+eu1tdhuHHdk
         7ZuVNhY9CveFAC5GnlGLeXsR9enVEp2erIw2ujwhyhSB53sg/3MJv4lYK3YAnDpjuXdA
         0+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774886235; x=1775491035;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gh5oXb2HZ7Bu0fz2O+Gvc+k34BjGtp57MpBJnwrNoM8=;
        b=nBRknQ0s+pWogDdWxfj/utApNvZNLq948fAe4Pu8cm/wmji3Q1Q4RMtXItjVxl6Mkh
         tAPK/O2VPaTYRjaE8S9j6MXWFh5MlUpjjwwS6bwnkbr9LEPsDQxj7CQ2WFyiQLhfXMwQ
         YWr4/h7sk+09ByRyd4Eo1LYtpwOJur28nClqQUG00WR05TTt/8FSKrkpE4dro1mhm0wX
         XAQcJXPJ+xUVL/217iJ/F3didzlRmZD8HiJ0+mezzVweDhqDm8Pt3Glyy1GQrQGJvFYP
         4NyTVZUmnL1L0MHClSh+upG0+I5PwtU08XNPCz3GyHKhSeRo8WOvoE8ynOIuFRk3pB2y
         W5kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq2mBf5ubxFy2//dVv8hz1a/5u/OZDweAIJ5EieoPWzbNQk6k0MeE4WZNIjMxSdBQoU7TfCNUuv/AeIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYBwmlM2u8HokiCeOPJnXtNPiGHYAyGpUJGc5VpcwPVV61mcPm
	HWpXE5CVt11fVn8aG+FrTTBdzOCUecSKDrZFuSEGJxXJ2bNDLX9iEUeAhyjIhtsl1Og=
X-Gm-Gg: ATEYQzyCIZoI70NqcdhPespjgqZbv/DvRQSsVDANAV8n1/Lq+3o+bQ18RxJBCZ/N4Is
	enU18nc0aQp12ekSaEmkXMeI5YxcK02iP0ZRGkwPbq0FNP2zFdwMqKNlGgJLtWDOZpKOjEyDx5I
	/xsRromiHFlNeoZ+yAKuABaO8/fxBP0bY+R2bc++Jg8M+CWZrVn+xaDBPMmKjg2ohcstE+x/zjS
	xTrvL9iay0cZ9XVEt0tILebA36aajBW/NTl2SrVsCGxJt3cOmBCSSiz2yFs2Zt1/v0fCOdQMxIy
	VqE28ZEv48va3piTyqyiJ6H1t6i5lriisQi/kiVoCHu/DrOlyVydefMIOToUUF5vimLstRPu6eA
	9TW1px6Ag/L2PSPerIIf05cnWM+Q1AJpaFktM/JOABB5+z87fh9a3rsUcVCIiGIZK51ItQvQWBs
	nau2ndrdqaeSON3cQ/pzb4EEWmbgrh
X-Received: by 2002:a05:620a:4688:b0:8d0:19f:252f with SMTP id af79cd13be357-8d01c7e32ebmr1714073685a.59.1774886234796;
        Mon, 30 Mar 2026 08:57:14 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d028035d46sm613968985a.24.2026.03.30.08.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:57:14 -0700 (PDT)
Message-ID: <fe6f42341c098c34165fca2c6fee8971a3264dd5.camel@ndufresne.ca>
Subject: Re: [PATCH v4l-utils] v4l2-tracer: retrace: support all mplane
 planes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Esther Zilberberg <esty5664@gmail.com>, linux-media@vger.kernel.org
Date: Mon, 30 Mar 2026 11:57:13 -0400
In-Reply-To: <CAPMPFbgjVSB-W6tLJuCFdh_axWqSkJbtfNq+_ParWB9tYpqQxA@mail.gmail.com>
References: <20260318084936.10626-1-esty5664@gmail.com>
	 <CAPMPFbgjVSB-W6tLJuCFdh_axWqSkJbtfNq+_ParWB9tYpqQxA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-RqGdWRSOrCG7G7u8wlkF"
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-57656-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 0A6D435E543
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-RqGdWRSOrCG7G7u8wlkF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 30 mars 2026 =C3=A0 04:50 +0300, Esther Zilberberg a =C3=A9crit=C2=
=A0:
> Gentle reminder to review the patch below.

Since its a continuation of a previous patch you sent, try and CC your prev=
ious
reviewers.

Nicolas

--=-RqGdWRSOrCG7G7u8wlkF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacqdWQAKCRDZQZRRKWBy
9K7gAP45VNT8uB+mIfioYFIdUEbfv/YlpZzErZ7oG/OvzSJQbwEA13hlWqxtstgw
/e/GEpT0tk4vgMQHN9aeJ2G4Wa0U2AM=
=adl8
-----END PGP SIGNATURE-----

--=-RqGdWRSOrCG7G7u8wlkF--

