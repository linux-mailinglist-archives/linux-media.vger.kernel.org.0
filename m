Return-Path: <linux-media+bounces-13838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF59109C6
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 17:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD0492858C9
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 15:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFEB1AF69D;
	Thu, 20 Jun 2024 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="080EvxFB"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F401AE85C;
	Thu, 20 Jun 2024 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718897050; cv=none; b=UfbssXpT3740I/J8b19+A3mQoQs3zzb1Amwfnx2ZlYEwHVgafmYuSZoYM65zNvfWEJ5w61UWuWUO9FZTsEUDLCxDWvtRQLWKZFsQPJOefRzjQ0AC4U0QfewRaRbmACvK7BYv+Bbp7NzG1aHSEG1MeO9EeG0mjF4U85toV6K8xxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718897050; c=relaxed/simple;
	bh=qH0pcx9ew3ssWqcgy5oeN9GRicTrXQ5mf6ItNJRYD7s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kryAZJVvZHwPNb5UZN6YVDg+uTQTk7HiFDJhvoGEYfBUbllsm+lXAy9zmn8OjM7Rkj1jaYC6l+UMnAqCeVlywNQXnqD9g72QQPxIdt+69n8P0AbAdE4VdzGFuOJ6D2qmS4Ny6mlJoEac309NcyVugFCzsqRNbvtHIA9P5lOBHWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=080EvxFB; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718897047;
	bh=qH0pcx9ew3ssWqcgy5oeN9GRicTrXQ5mf6ItNJRYD7s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=080EvxFBpgdjOSNNxaBmNMGsHxi9ulWJXbbHzkh/Q5/V/+oeOglUMaF960trKNEEa
	 +IEDkjxDMtEtxx/NdcXnnYkI0TnqYYLGw0fbYTnVuMg6pCicEsXgFO2h5WYdc9+j94
	 /T7kcxuecx3xcLcAt9iir1cPR2syZN3KEIGba4IgEQ93nH3xc/rFki6SCThxthGKJf
	 lZ5AyYWvZvnbDZKluXlA9yStFZeDqarPsUpl79cwLNcgRSdEh3RZsFULq7VrPjeVVk
	 M551U8g7JOnO3uXAOzFAjSUBlUMNYG7hgdgkjvUzYNxGr2BRUHYBqEGj4R7pl5qXom
	 ytIa1c9p2RC0g==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2305537820B5;
	Thu, 20 Jun 2024 15:24:06 +0000 (UTC)
Message-ID: <0b84bd4640c4c7ff52d1452d73e1ba46f6cedd7d.camel@collabora.com>
Subject: Re: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support
 runtime suspend/resume
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Devarsh Thakkar <devarsht@ti.com>, "jackson.lee"
	 <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "sebastian.fricke@collabora.com"
	 <sebastian.fricke@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,  Nas Chung
 <nas.chung@chipsnmedia.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>,
 "b-brnich@ti.com" <b-brnich@ti.com>
Date: Thu, 20 Jun 2024 11:24:03 -0400
In-Reply-To: <1cefd686-2eb2-e0b2-0b24-2c4efb0c41a1@ti.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
	 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
	 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
	 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <bc8796ef8107507e99df079f6d7ce2575ead3cab.camel@collabora.com>
	 <1cefd686-2eb2-e0b2-0b24-2c4efb0c41a1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 20 juin 2024 =C3=A0 20:22 +0530, Devarsh Thakkar a =C3=A9crit=C2=
=A0:
> Hi Jackson, Nicolas,
>=20
> On 20/06/24 19:33, Nicolas Dufresne wrote:
> > Hi Jackson, Devarsh,
> >=20
> > Le mercredi 19 juin 2024 =C3=A0 23:56 +0000, jackson.lee a =C3=A9crit=
=C2=A0:
> > > Hi Devarsh
> > >=20
> > > If there is no feeding bitstreams during encoding and decoding frames=
, then driver's status is switched to suspended automatically by autosuspen=
d.
> > > And if we don=E2=80=99t use autosuspend, it is very difficult for us =
to catch if there is feeding or not while working a pipeline.
> > > So it is very efficient for managing power status.
> > >=20
> > > If the delay is very great value, we can adjust it.
> >=20
> > One way to resolve this, would be if someone share measurement of the s=
uspend /
> > resume cycle duration. With firmware (third party OS) like this, the co=
st and
> > duration is few order of magnitude higher then with more basic ASIC lik=
e Hantro
> > and other single function HW.
> >=20
> > Yet, 5s might be to much (but clearly safe), but getting two low may me=
ans that
> > we suspect "between two frames", and if that happens, we may endup with=
 various
> > range of side effect, like reduce throughput due to suspend collisions,=
 or even
> > worse power footprint. Some lab testing to adjust the value will be nee=
ded, we
> > have very little of that happening at the moment as I understood.
> >=20
>=20
> Okay I see the intention here is that if there is a process holding the v=
pu
> device handle and the input feed is stalled for some seconds due to netwo=
rk
> delay or CPU throughput then after a specified timeout say 5 seconds we w=
ant
> to suspend even if the process is still active and holding the vpu device
> handle ? I agree then if we want to support this feature a safer/slightly
> larger value is required to avoid frequent suspend/resume due to network
> jitter or any other bottleneck and maybe 5s is a good value to start with=
.
>=20
> But if last instance is closed/stops streaming and there is no process ho=
lding
> the device handle anymore then I think we should suspend immediately with=
out
> any delay.

Our emails crossed each other, but see my explanation about gapless playbac=
k
transiton, were userspace may destroy and create a new video session. I bel=
ieve
5s is way too long to be honest.

Nicolas

>=20
> Regards
> Devarsh


