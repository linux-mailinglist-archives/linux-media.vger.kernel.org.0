Return-Path: <linux-media+bounces-48570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20957CB36B8
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 17:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58CAF3024376
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 16:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC8D30BB8E;
	Wed, 10 Dec 2025 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="AB6tQTtn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF853002A7
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765382677; cv=none; b=E9s2Rvc09doWx/pQdsQFtfLk1MYeQJg53dAi+Dh4qL3mKc/4hZyI+hAsNjiK2HaSGCiDYcNc9GglnGxoh86hlCqXQXZEFERTJoERyw5e5phDDsjv9iSkvdr3EsnxFmSI1ul+kw1Fkop7DZ5XFwZWHmk40xWScWUToN6FFL4qCeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765382677; c=relaxed/simple;
	bh=22GFvVwg6CTXyoOy4IhLZub/bJLrt9ksV7TaLrUKxsA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AIeEGOoeBPDPtuePYMV+h0xl9sJ6Vb+98Nda/ACa7sQyg/xghHZXrfBuJx2XG/K+Y13u5BtkpicHLZRNZVvjJdqM+Y/Onma/bwuCthwHwaM5FTXZdU9rD3GsRf0dTxODLPA1bbdDCl7Uv2YCrdioJEe7eaOTqypYZq4TU5twyKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=AB6tQTtn; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b5ccceb382so1713785a.1
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 08:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765382674; x=1765987474; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=22GFvVwg6CTXyoOy4IhLZub/bJLrt9ksV7TaLrUKxsA=;
        b=AB6tQTtnhjFPy2XtYmxqZDa08XxkYP2AhVggoAFk/wz40vHODPjAHKePKL8POYppEh
         4/MZ4mwueKuIZ8SN4/CLblk3+Mu7uj/91LGmCkEjM1rgiEs0RYx/e5q549pt2qoJcvDS
         Jn6z31WMBLyriMQTAES0seuEyAsPjOUhxv56QdtxJNOX5Qt1H9KWj8iXpgsw+72JQ6Yf
         iffkgNmvgITcQJ84x6BHH1Yu6aCDLIp2O9asKfrlZayHp3LhE8kfDpW4B12hHj7/+gdW
         E+xgvR8Ilx4AHbSyVA9ZeEYUXEr9qniTxtuFk47QIn0SHpeyyhT+TdTEswMpH63wghjM
         mh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765382674; x=1765987474;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22GFvVwg6CTXyoOy4IhLZub/bJLrt9ksV7TaLrUKxsA=;
        b=Npu5Y8P9fiyEHTk8K1QOBehxMWF1PH/S1fheHnYSvU8nf6wD96JSziSvITk6jf5HpS
         PO4dxExjJ7uvpO2uTzKWEN6ar1r/HRACjRF2lrTLfjgW5JIO7q0UcGGQHlmMfHQ+b79/
         v0Pybs7ww4lhzRqY27mnIflEpJvlwsd0rYS7jS6PNecs+RQx6KDxwhhULDQmxpJHvlzw
         28Ec/UOMBJ3Zny3ixp9AnRuCA/WRl+MWW70IOg2lSFZjxQxtTORAHS1SvlDg/4pOYi3O
         RSZXykeP/tlwOj0yT8XUS+UFlkLuwLDwk542UMP37mKHnhL/x6VKXciQoZMRV3qP8488
         FsZw==
X-Forwarded-Encrypted: i=1; AJvYcCX7prEYX/TwIGz6WWin59Q3QfgdZTqIIOW9ewV11fK1aHI/F2L0Y6Brqq6x7PjMK+lz3oqFOTbxevYLVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv+C2edy0KA2egzfbUQfRlwmpPb+Gs+jcDLQ0L/5hw/tyD2Rb4
	2VXu0/62f2y/3e1C9Jd1PP8thsC2jXlu1bAOmyzepaORPyPCvsnWXu3v02+uAk/g3eM=
X-Gm-Gg: ASbGncsKbaS4BIWelFQW9V808a2Uj9ZPA95N3KzxElOV8T6gHejujqD63CzcoQwrqEq
	A5EzimdAkrETIrpfoLFYl8ArKdn/BG77uBhVhj7LIzS7kLFgrxFRCXLmxkSDXtxAkzFIRbMThfG
	W28ikJZslNq2WB1Jwztbi0ux3SjK62VfDDUGYWb4oZEH3KXR/bbKJ1vxXxjdN3k3chtbO/GfzVE
	1nQBnkZ/dJ1K+JV7Tif1ESm58lD5EZvO8WxH2296AudabX3Y9ecY3S6BAp/yqEW/E4ep+slgUCc
	RMxzHLbfskxWsA3pCCpqAQhYbBjKjjRFgRSCzFcRXTrOBaavvFKCCTikMiSQr3xldoMjJFEx6xo
	NCHj7ORk9ziarPh0D7NeeD1r8xsHh1A9UlX64lvfYKYe8pbixX5+0JuvSOQ0t+v4rKiIYi3fb+Q
	xBKtde7AXqCJFs+MYL
X-Google-Smtp-Source: AGHT+IEfTxQ47WU6csn7D7l8n715tzML3PIXrdRc13mLvEzqqwlnsoWOBOkiL4m2DTG8vCqweijuJQ==
X-Received: by 2002:a05:620a:404f:b0:8b2:6b9e:5383 with SMTP id af79cd13be357-8ba3b01fd56mr444216185a.85.1765382674256;
        Wed, 10 Dec 2025 08:04:34 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b62529f08asm1574658685a.11.2025.12.10.08.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:04:33 -0800 (PST)
Message-ID: <fd401d1b4f1e7b7178699227d31976453de5891e.camel@ndufresne.ca>
Subject: Re: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic
 Weisbecker	 <frederic@kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>,  Michal Hocko <mhocko@suse.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>
Date: Wed, 10 Dec 2025 11:04:32 -0500
In-Reply-To: <CAAofZF44pUoyDPnnv9UUuMkYvqiSWP4gELg4rutgo=3tNpBZsw@mail.gmail.com>
References: <20251107141303.223254-1-marco.crivellari@suse.com>
	 <7e24110636db36e8c0a877d90d2ed9570c4aecf5.camel@ndufresne.ca>
	 <CAAofZF44pUoyDPnnv9UUuMkYvqiSWP4gELg4rutgo=3tNpBZsw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-elCTUJq05jQZ+s6e+80U"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-elCTUJq05jQZ+s6e+80U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 10 d=C3=A9cembre 2025 =C3=A0 16:30 +0100, Marco Crivellari a =
=C3=A9crit=C2=A0:
> On Tue, Dec 9, 2025 at 9:57=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresn=
e.ca> wrote:
> >=20
> > Hi,
> > I have to admit, there is likely no review here due to the lack of know=
ledge, so
> > in order to help educate myself (hopefully its not just me), can you ex=
plain why
> > the new default of WQ_UNBOUND would not be a fit for this driver ? Afte=
r all,
> > the author didn't care and didn't make a choice, so I feel like its wor=
th
> > asking.
>=20
> Hi Nicolas,
>=20
> The fact is that "alloc_workqueue()" without WQ_UNBOUND it means per-cpu.
> So what we are doing here is just make explicit that the workqueue is per=
-cpu.
>=20
> Currently there are no behavioral changes in alloc_workqueue(); in a
> future release
> WQ_UNBOUND will be removed and unbound will be the default. But as for no=
w,
> it is still per-cpu.
>=20
> We can of course change the current behavior and I can send the v2 with
> WQ_UNBOUND instead. Looking at the code there are not per-cpu variable an=
d
> the workqueue does not have the WQ_BH flag, so we can convert it if it
> is better.

thanks for clarifying. This driver having no clear maintainer, it is hard t=
o
delegate the checks needed, but from the description, it pretty much sounde=
d as
if most driver are picking up the wrong thing, because that is what the def=
ault
do.

I don't have strong opinion, if you think this driver can be ported in one =
step,
that is always my preference, and making things explicit is also nice. But =
I'm
also fine picking this as-is for now. Let me know, your preference, availab=
le
time and safety of not breaking anything is valid argument to me.

Nicolas

--=-elCTUJq05jQZ+s6e+80U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTmaEAAKCRDZQZRRKWBy
9EEeAQDs5xXNgxKj7E/WbnvR6sLKkzG6X122iEPvuj0dXihl0QEAhJoLXfaqlrU4
VxDFkGzm8D46bB6KVfJaGO3ukVUNUwQ=
=bgHX
-----END PGP SIGNATURE-----

--=-elCTUJq05jQZ+s6e+80U--

