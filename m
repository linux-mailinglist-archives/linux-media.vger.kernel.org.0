Return-Path: <linux-media+bounces-13853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141A910F70
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 19:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D9E0B288D3
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 17:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4711C0040;
	Thu, 20 Jun 2024 17:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="4e3GMXpV"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774A21BF32C;
	Thu, 20 Jun 2024 17:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904781; cv=none; b=m/NuB4APjPidz2VPI/3GnFhxvfuFGO1E4B47QSUWJm+6i5jPvpfSn+cWyKbATPTheXrtYPOkGDjI4qc+UpWPGKGazRmvXs3tEkyNd640kzmURUW333V6ezMA/xdr07z9l3lbxMIVQnPGBdtvHroDje3AMOoMKyohR29TJhnEHBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904781; c=relaxed/simple;
	bh=kp1Q4kOh5cBalrsrfuwKZ2xz4Q7tGmSDRh5ia6AColo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ew4eyQrtXCnF6KweAx3aHE7rllFAcMYEFyHRWtnqTdVeI5/+rWiLSPiGwLvYiuENDI6klur1NsEalqcDZfADL4tug7jiv2S2L7oTgGF1IDMIWjeQeQ+YNyP7WkDTZ9D0s+qsrTZpXUstUgw357FuiNp4ypCcuMDPgaXsnO0vi9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=4e3GMXpV; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718904777;
	bh=kp1Q4kOh5cBalrsrfuwKZ2xz4Q7tGmSDRh5ia6AColo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=4e3GMXpVwKiIbMVo4FBTo077VSFfO5NQaKIm+GvYE0c9IoGOwMTxnAhivY1LKwwJn
	 f4B2jyWmH4Zf3NACjEEVJr8gYnVYui4oms0nZU56Lmt1Q4zIreD8y/4lvW/G4JVJQi
	 2sCeaJn5B11ezbhnsWDv0ra281KOkh5mLup6am1As6xZY7xD60TuXOMarPf5YB4BEw
	 iNcKY9zGZQHLoWE9aywIFKjLzsJNz6dnEpbd3QeYpmg/Yngvv+D+sm0VFO0C5SjU+x
	 VyQfhhXyjzfKH9padDtAaxaYRH5vcljyGsa6LUfyFMVXx/tDRqbkd3qjN7jbxX+cQT
	 DPor6Xqk351pA==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B112237810CD;
	Thu, 20 Jun 2024 17:32:55 +0000 (UTC)
Message-ID: <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
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
 "b-brnich@ti.com" <b-brnich@ti.com>, "Luthra, Jai" <j-luthra@ti.com>,
 Vibhore <vibhore@ti.com>,  Dhruva Gole <d-gole@ti.com>, Aradhya
 <a-bhatia1@ti.com>, "Raghavendra, Vignesh" <vigneshr@ti.com>
Date: Thu, 20 Jun 2024 13:32:52 -0400
In-Reply-To: <e901967f-59df-f4b0-de51-61e542c04161@ti.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
	 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
	 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
	 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
	 <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
	 <e901967f-59df-f4b0-de51-61e542c04161@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 20 juin 2024 =C3=A0 19:50 +0530, Devarsh Thakkar a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On 20/06/24 19:35, Nicolas Dufresne wrote:
> > Hi Devarsh,
> >=20
> > Le jeudi 20 juin 2024 =C3=A0 15:05 +0530, Devarsh Thakkar a =C3=A9crit=
=C2=A0:
> > > In my view the delayed suspend functionality is generally helpful for=
 devices
> > > where resume latencies are higher for e.g. this light sensor driver [=
2] uses
> > > it because it takes 250ms to stabilize after resumption and I don't s=
ee this
> > > being used in codec drivers generally since there is no such large re=
sume
> > > latency. Please let me know if I am missing something or there is a s=
trong
> > > reason to have delayed suspend for wave5.
> >=20
> > It sounds like you did proper scientific testing of the suspend results=
 calls,
> > mind sharing the actual data ?
>=20
> Nopes, I did not do that but yes I agree it is good to profile and evalua=
te
> the trade-off but I am not expecting 250ms kind of latency. I would sugge=
st
> Jackson to do the profiling for the resume latencies.

I'd clearly like to see numbers before we proceed.

>=20
> But perhaps a separate issue, I did notice that intention of the patchset=
 was
> to suspend without waiting for the timeout if there is no application hav=
ing a
> handle to the wave5 device but even if I close the last instance I still =
see
> the IP stays on for 5seconds as seen in this logs [1] and this perhaps co=
uld
> be because extra pm counter references being hold.

Not sure where this comes from, I'm not aware of drivers doing that with M2=
M
instances. Only=20

>=20
> [2024-06-20 12:32:50] Freeing pipeline ...
>=20
> and after 5 seconds..
>=20
> [2024-06-20 12:32:55] |   204     | AM62AX_DEV_CODEC0 | DEVICE_STATE_ON |
> [2024-06-20 12:32:56] |   204     | AM62AX_DEV_CODEC0 | DEVICE_STATE_OFF
>=20
> [1]: https://gist.github.com/devarsht/009075d8706001f447733ed859152d90

Appart from the 5s being too long, that is expected. If it fails after that=
,
this is a bug, we we should hold on merging this until the problem has been
resolved.

Imagine that userspace is going gapless playback, if you have a lets say 30=
ms on
forced suspend cycle due to close/open of the decoder instance, it won't
actually endup gapless. The delay will ensure that we only suspend when nee=
ded.

There is other changes I have asked in this series, since we always have th=
e
case where userspace just pause on streaming, and we want that prolonged pa=
used
lead to suspend. Hopefully this has been strongly tested and is not just ad=
ded
for "completeness".

Its important to note that has a reviewer only, my time is limited, and I
completely rely on the author judgment of delay tuning and actual testing.

Nicolas

>=20
> Regards
> Devarsh


