Return-Path: <linux-media+bounces-60636-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKQ+DFBZ+2kuZwMAu9opvQ
	(envelope-from <linux-media+bounces-60636-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:08:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4D44DCE30
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F06C301412F
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F8047F2EE;
	Wed,  6 May 2026 15:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="MgRQAh7m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBC92DAFA9
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 15:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079757; cv=none; b=HvynNWqfK35A5mEsfpLc3QTiUkke1Y/9LLXl1Gz0qmtTEtZ8Qy5kl/mMycyyw0l9MHdOKWvlRIF5Tm7BFlBC2GH6N8B3txwSYSxRRhhpgeOamQilYiN1FHy+dMRBmV4luUbuKNu1JpLBECeRHCnylXlLoLBBTSEZo2azqsaz+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079757; c=relaxed/simple;
	bh=NVtokff+FgN7c5YjfBm+qv9hmUVsT8Ucvu2C0waL2bE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kIRnI/nAmszPp/zwmx3wDz/nLDVcdOyNNKzlFv/GJfPVYSuKpti8JKDINp9F6wtKdK1LpVeV4cudSXrQWGIYud0KFMyxm41iffOXxmtoVCQ323at/cTXBaeTKDHIgtBAhU2fYf4yTGpeazznIj/Et44hXw+Qe81gTC/rdIh0SGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=MgRQAh7m; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-699a23b2b08so155129eaf.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778079755; x=1778684555; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NVtokff+FgN7c5YjfBm+qv9hmUVsT8Ucvu2C0waL2bE=;
        b=MgRQAh7meEujYicfN29eVrTfRihWZUX7v92bo4YjkPqH8Qc/WI7acFrEUcglkH5Jgh
         iwTISLIUZE0VoPCdI+Enxbu672J1kbZfuMlyqt38GYNro5ZvKgJ7yjG8Y07PahN6wKI8
         eBJ+I2rkDfFoaPm9N5gMlMWbpowqG2QSQSO7tquOgxJoFMQ0UVpm5nctUtlZWn3H+Jhd
         pqPCJ2bE2g7PstYGVhJ4jvPlrMzjSP/qjP25NVNijmVYzqxXWxopGK1A9wBinfGpPDXF
         4gpaVr5SbqbREIKeM7KJUbyZ2F0/k4bgdSxAXTeJJIHQ8XchOI882bEASVrEZwGhWiBP
         ZEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079755; x=1778684555;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVtokff+FgN7c5YjfBm+qv9hmUVsT8Ucvu2C0waL2bE=;
        b=TuiraWKtqCv5rRWtK5OzsESeKRLcOhokLdxCIeCWbPRD6HeKHfKGD8awhiuA+waJfB
         e/1JFh8f51zu03h5NdeDH6yCPskUpdhVxZXMrB86bV3B2locgmacm91oR2CTIY9onGlB
         wfDk3NyOE+RQTz9mv47LzjrlQYnpKcDx3kpP8UoEJdgapX0+/F5C9ei4lNyyp+1ieNg1
         /FmJ0mdtO0LVxKFYfzxSX7mJPkuOdbTGeeoku5JIOTAmAaHC/ajZismKa/9R4kQHueON
         ul7McF77O/1NRS+dwj06X4kxPkALMEnXnU1Qjz1V1szVwGEfMXpHBqZv4wdpvxNw0ZDX
         l/nQ==
X-Gm-Message-State: AOJu0Yxw5WeGE+g1ecE7GhtYK965gObgj0KM3jXR4KGqCotCl6e3iTPE
	QN3WwV7tP/apLfoE8I4p2MXzTTgvTuljnKvrVHJyLKRp+DcYyTa0TwonAbMNUiK9AGs=
X-Gm-Gg: AeBDievi7prXkMngb0gjplGKlxnpt07DthDBXYuSp7LH3UbqBYAD2Z2JYL8t0mlo0lh
	4nR1WuAobrDJxM1/n0rSAyqSgZd/P7CXsNJ5Oekg1FaROnoMSQQpUvcjV986mH12m5QHMQEGfci
	IVbU/B0Lo/DVIfrRu7Ya56bPc0DSynQw4VXW78tnn2k3tmrvO+nYGTjA/G4ZKmYbQSkNoqxm33N
	80tMnb5iCH0SWEjTiXn6NS+C3eQSjgvO0ZkQ1jX4jmZ0sLUlF1/r01b4B3p6JLNAASK/9oun0iH
	qcDXPZbng+8neSbkieMKPTBMAk/wEjafx2O9CRWrKeMIPiNA6dMa2WtxY9ylFgBwMK7lrzNwbT1
	3rgIB8mZVSOz75zW9vJj1mK+oOPBcjzY0ig9HE+T+TVOHI+ivVY3Cwwjf65oDNDylSwPnGOJaU4
	ZWaKSIhPqbs9d49GwlwFEus2nuvu+VykO8e3FqZGo=
X-Received: by 2002:a05:6820:1529:b0:696:1fae:fb83 with SMTP id 006d021491bc7-69998d175dfmr1837181eaf.34.1778079754570;
        Wed, 06 May 2026 08:02:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-696896e72cfsm10117264eaf.10.2026.05.06.08.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:02:32 -0700 (PDT)
Message-ID: <71e36717853798d292f01d40fc48566456152397.camel@ndufresne.ca>
Subject: Re: [PATCH 0/4] media: mediatek: vcodec: VP9 slice setup cleanups
 and fixes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Wed, 06 May 2026 11:02:29 -0400
In-Reply-To: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-aCXV78f8vUia3AirisRd"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 7F4D44DCE30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60636-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[isrc.iscas.ac.cn,mediatek.com,kernel.org,gmail.com,collabora.com,ideasonboard.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne-ca.20251104.gappssmtp.com:dkim,ndufresne.ca:mid]


--=-aCXV78f8vUia3AirisRd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 06 mai 2026 =C3=A0 16:41 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> Patches 1 and 2 change the signatures of two functions to void, removing
> the now-unnecessary return value and its associated dead error checks.
> Patches 3 and 4 add missing memory release operations in error paths,
> fixing resource leaks.
>=20
> These patches are carried out under the guidance of Nicolas Dufresne.
> Thanks, Nicolas!

Thanks a lot for the patches. Something to improve, as I suppose you are fa=
irly
knew to this, is that when sending a new version of a existing patch, we tr=
y and
make it clear and make version the subjects (e.g. [PATCH v2 ...) and in the
cover letter, we summarize the changes from v1 -> v2. If you use tools like=
 b4,
the process become painless. Meanwhile, this is fresh in my memory, so its =
fine.

cheers,
Nicolas

>=20
> Haoxiang Li (4):
> =C2=A0 media: mediatek: vcodec: remove redundant return value of
> =C2=A0=C2=A0=C2=A0 vdec_vp9_slice_setup_lat_buffer()
> =C2=A0 media: mediatek: vcodec: remove redundant return value of
> =C2=A0=C2=A0=C2=A0 vdec_vp9_slice_setup_prob_buffer()
> =C2=A0 media: mediatek: vcodec: free working buf on error path in
> =C2=A0=C2=A0=C2=A0 vdec_vp9_slice_setup_lat()
> =C2=A0 media: mediatek: vcodec: free working buf in
> =C2=A0=C2=A0=C2=A0 vdec_vp9_slice_setup_single()
>=20
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 29 +++++++---------=
---
> =C2=A01 file changed, 11 insertions(+), 18 deletions(-)

--=-aCXV78f8vUia3AirisRd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaftYBQAKCRDZQZRRKWBy
9H5uAQD5iErjoa19qX645IZyDFpDOl+SfeQ9tlDuByFz7QhXpQEA1ZamfAAkcf3b
gObBxdlpTm71LJSa0qRUAw4fhwkj2As=
=hUse
-----END PGP SIGNATURE-----

--=-aCXV78f8vUia3AirisRd--

