Return-Path: <linux-media+bounces-58287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBMtFx+51mlxHggAu9opvQ
	(envelope-from <linux-media+bounces-58287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 22:22:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C91BE3C3BBB
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 22:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95DE63028036
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 20:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7400A3914F0;
	Wed,  8 Apr 2026 20:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="PbunIx6x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B266626F29B
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775679765; cv=none; b=s40o45YNlMd7jTZUrh1/ETHtOdL44BPhAsWDMg6Rz4dnWUGH7daRNtbx4FvVG3CCgJZCDHYVIMfL92HPrLY0SJB5vFz4ekKTX8rT4PM52/CXhx4yL7EigvYxjCAUF3+1hEgiWLqaaGpXQJ8I72YuAbL6rthQCjmhrmcHMb3ZBL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775679765; c=relaxed/simple;
	bh=wBJw70mUEicNNB549MIpFjeIXaI1p71OdOWBzakHM6k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g+t0kS2XbnPOytK6dYicvtmNMjsZxuRjktDdkWjQ0/5BWbn2w3OSWeNNQT1PdIDhqo1Oo4tV2MLX5f7a3yZ1IrGbfueoCZkxp/kyAuNJAf6H9m/WLTj+F2b7In9rd6Nq2Lt+GSv5VmltiRazRWslOvPEBP297TMT5m1/coLHZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=PbunIx6x; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50b2b289925so1306761cf.2
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1775679764; x=1776284564; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wBJw70mUEicNNB549MIpFjeIXaI1p71OdOWBzakHM6k=;
        b=PbunIx6xsIZReNa8H55QpfJ0/7fuLDbX1yBGnYJMoFfaiZ22vYJNkPfPV8/d2DRMWK
         y3cLbx+t6IgznddHmhpiBsMFXOCslhs3yIgdKJZinGNGKo87WwmdybUJIP9qWJM2jJVa
         mSACY/CZrWybzwGeCtyKIrx+RPVBYkDgBnjyI11xPQZ4xAMAp7HOWzoHXxAFM/QI5LmU
         gfMZDqpzmBZH58FxJGVZQ33d/ISBpI5R0jbYTL+nSeDcSnljsiZjjJckRsBsqIykRwro
         3VOCU7mV2ugfzPc7wZEButaeuOmg6vWnPvosyiboIT69TVaX39KWh3i9K2PnG3yAOyxc
         rNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775679764; x=1776284564;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBJw70mUEicNNB549MIpFjeIXaI1p71OdOWBzakHM6k=;
        b=DlPQWqUu3RofkFg8eCWyCxEkA4oYligQzkhVrQn6Ku9qrZb4Ys0uk7FmT5oc43BEDE
         Q6j9tlDImzJUbefGI9gPd7LMDwQnt9VSaYIs6BsFa/NTK3IjkCj8MgyNqxYPweqCIVSd
         5sgTL6GN9jF0nhLzvzoW4XIXHQ5wQ/k5ii3hCQlJ4WGcHitzeGpZvvNcbxYnvwU6/NqC
         udm4Pfr0lDmETunVAjVc9zXAnY6WMohR1sfiOPvb6SW7HeBLaAj951VwXBZArK+JXTtf
         J6nCfe1KNJ/Dab5rx584P+i61rGynNPYbw8BVbdcwn1JtN+Z4U0v1GV9N21ynkAVSX7m
         5McA==
X-Forwarded-Encrypted: i=1; AJvYcCVp47Uj4NHhUeH7CYboglyQxBbhtBi7xIl4+vodijT6lfn3NimM/q7+PHpv0ClSqewlaAi83ISxTKFjxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsXfqF9V+qLxw9r9cOBSXKTPFhkkTjmsKDZImud7Tq4Kk1IrGs
	nwHyYUxQNifzuEHcXBjFVyd8QDaHpOm/1D5JThfqEuxJJQRWvPt+BUSGuN3+K3Iw/TE=
X-Gm-Gg: AeBDieuf0kSSZeN0fRnt9XbzjltGI2QbkoEqciti7fH+ZDiXzV6LpEr1RTWJfzgMAg1
	fuqP3isasAl31SCwuonvJibXzJKugM3lAP80e3utAGdqZiDfdN4Q9WqH1/bBSUhJXOk3PYBHo2S
	evkgQUjJKoEno/K87Leezf9K3QpntI1fzxik5gMN2AIxPMxhS7z5l0/y1ud5RqKkxzwYLYkmh1j
	ldvv8mMpJi7OO0W9KsLIM/x/fJvTpE75lLtxzbZEPqY/UQevY0qRDzE3AEis6BJien9WWZtD1tM
	CimLAbik7+zZriJ6uo8+PqmWkiZRX9IPLhUz+M661v/s8SOJW1TXOucZf+WDoNGIqk0L12wyyQf
	bPZlpHhU2i16lzAAjJe5vAM3OQtvpiOX+7xT+CSCweyl6uc50iLlBHR/ea+TklfogP0x2ter7br
	darPqqxy4CAd7UGS3Hw7fOYE2S9/ld
X-Received: by 2002:a05:622a:1984:b0:50b:4ba4:9add with SMTP id d75a77b69052e-50d62a9ca10mr334496991cf.34.1775679763542;
        Wed, 08 Apr 2026 13:22:43 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4aed181asm192301041cf.0.2026.04.08.13.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 13:22:42 -0700 (PDT)
Message-ID: <cd1de04076917d65ccd7dd91d9392af7977a4906.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/5] Migrate soc, drm-mediatek, mdp3 to new CMDQ APIs
 (series 2/4)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Jassi Brar	
 <jassisinghbrar@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin	
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen	 <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang	 <xiandong.wang@mediatek.com>, Sirius Wang
 <sirius.wang@mediatek.com>, Fei Shao	 <fshao@chromium.org>, Chen-yu Tsai
 <wenst@chromium.org>, 	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Date: Wed, 08 Apr 2026 16:22:41 -0400
In-Reply-To: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
References: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-RDSjhy/5yQt09mvK/09B"
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58287-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,gmail.com,kernel.org,collabora.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[gmail.com,mediatek.com,chromium.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C91BE3C3BBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-RDSjhy/5yQt09mvK/09B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 25 mars 2026 =C3=A0 11:57 +0800, Jason-JH Lin a =C3=A9crit=C2=
=A0:
> This series migrates the MediaTek SoC, DRM, and MDP3 drivers to the new
> CMDQ APIs introduced for MT8196.
>=20
> Series application order:
> =C2=A0 1. [Series V2 2/4] Migrate subsystems to new CMDQ APIs (this serie=
s)
> =C2=A0 2. [Series V2 3/4] Remove shift_pa from CMDQ jump functions
> =C2=A0 3. [Series V2 4/4] Remove deprecated CMDQ APIs
>=20
> Please apply this series after the MT8196 GCE support series,
> and before the following series.
>=20
> ---
>=20
> Change in v2:
> 1. Rebase on linux-next
> 2. Fix build error of -EINVAL in patch2.
>=20
> ---
>=20
> Jason-JH Lin (5):
> =C2=A0 soc: mediatek: Use pkt_write function pointer for subsys ID
> =C2=A0=C2=A0=C2=A0 compatibility
> =C2=A0 soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing
> =C2=A0=C2=A0=C2=A0 shift_pa
> =C2=A0 drm/mediatek:Use reg_write function pointer for subsys ID
> =C2=A0=C2=A0=C2=A0 compatibility
> =C2=A0 media: platform: mtk-mdp3: Refactor CMDQ writes for CMDQ API chang=
e
> =C2=A0 media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to
> =C2=A0=C2=A0=C2=A0 cmdq_pkt_jump_rel_temp()

Can the two last be applied to the media tree alone without breaking anythi=
ng ?
Otherwise I will need to wait for the soc: patches to have landed.

Nicolas

>=20
> =C2=A0drivers/gpu/drm/mediatek/mtk_ddp_comp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 12 +++++-----
> =C2=A0.../platform/mediatek/mdp3/mtk-mdp3-cmdq.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++---
> =C2=A0.../platform/mediatek/mdp3/mtk-mdp3-comp.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++---
> =C2=A0drivers/soc/mediatek/mtk-mmsys.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++---
> =C2=A0drivers/soc/mediatek/mtk-mutex.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++--
> =C2=A0include/linux/soc/mediatek/mtk-cmdq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 24 +++++++++++++++++++
> =C2=A06 files changed, 44 insertions(+), 17 deletions(-)

--=-RDSjhy/5yQt09mvK/09B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCada5EQAKCRDZQZRRKWBy
9BvDAQDiGnxs8IuI1dVJpXUEYd4nLqhHu0mrYWUd+Xo+VGU9BQD+M4bHsQCcq4KC
eU/cm+cZeMh1990/2+dj1+RYXPBBewk=
=HqBw
-----END PGP SIGNATURE-----

--=-RDSjhy/5yQt09mvK/09B--

