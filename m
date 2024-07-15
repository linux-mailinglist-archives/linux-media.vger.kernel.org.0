Return-Path: <linux-media+bounces-15030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F29318EE
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 19:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDED21F22652
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 17:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE193EA76;
	Mon, 15 Jul 2024 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GBcGkr0Z"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C11DDAD;
	Mon, 15 Jul 2024 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721063165; cv=none; b=bowfIwEVaspCdj9ECm44qjYhszN4T9wQ/U50HtLolnPV+r8CXQUmC7klJaG3yLZ18A5K29kSICr7q0FmzPy+Ga+jbmnInrmrMytLYH3IY1thW1V9NC5afSqm1sPvHKCP8IPM/3zxbLWUIO6t68y9iMzfXX/CS/Gdvp+kWa7G+xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721063165; c=relaxed/simple;
	bh=UqvMPjs469cGfsajHjeqleYIK9wUwiE14NCA7Sf0gk4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TkGtDluFYDJXdOR68sRbkZ0YWATBXmV/wuI/AGcvqo0DDigfc145Y28BoennVztA1Gz0egU2EV5ZeTMH5WBI3nxFGJaILMKBDmj+X1mFfpWkeRkntJFPsYyCq213uUBPYoWGIIsNzlX+W05tjD1+v0LPPheASEjglCAaW/4geYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GBcGkr0Z; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721063162;
	bh=UqvMPjs469cGfsajHjeqleYIK9wUwiE14NCA7Sf0gk4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GBcGkr0ZPG0FrhQp1h5aq2BgeGDCnR2HLELicqx9XJxXm1D81CLTR5nzjrgrrrNR8
	 KxaLatUev8PPkISF0O36bXhnGOsoK/WtBnJN6Lo5TAjndndd9wYX8sjOtSZBfevYmH
	 ut+tPxnqTDwXHjC9gZIiT0tye0LFvNjVdovf39pumM2o+N+647gI6v8bww3nyVq1FN
	 RNPLJrTqOe0icacXi6armUn9cwundLzGi6/VPJSlbItt5zRTeww2ocbFDcP9jX+las
	 JOzJgnDPx3sHmWCHiFwJCpG7M9oxxT6SF2QE+VRM05jJHgrp6gljBUyzhmP8BMxDXN
	 vzf+23Z4dTTlQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0B2593780C13;
	Mon, 15 Jul 2024 17:05:59 +0000 (UTC)
Message-ID: <58ed6e3b06e6f156af9820b29d78cbd79d8e719f.camel@collabora.com>
Subject: Re: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support
 runtime suspend/resume
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, Devarsh Thakkar
	 <devarsht@ti.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "sebastian.fricke@collabora.com"
	 <sebastian.fricke@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,  Nas Chung
 <nas.chung@chipsnmedia.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>,
 "b-brnich@ti.com" <b-brnich@ti.com>, "Luthra, Jai" <j-luthra@ti.com>,
 Vibhore <vibhore@ti.com>,  Dhruva Gole <d-gole@ti.com>, Aradhya
 <a-bhatia1@ti.com>, "Raghavendra, Vignesh" <vigneshr@ti.com>
Date: Mon, 15 Jul 2024 13:05:57 -0400
In-Reply-To: <SE1P216MB130382E16D0CCD27341D535DEDA62@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
	 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
	 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
	 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
	 <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
	 <e901967f-59df-f4b0-de51-61e542c04161@ti.com>
	 <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
	 <SE1P216MB130382E16D0CCD27341D535DEDA62@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jackson,

Le vendredi 12 juillet 2024 =C3=A0 06:10 +0000, jackson.lee a =C3=A9crit=C2=
=A0:
> Hi Nicolas
>=20
> > -----Original Message-----
> > From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Sent: Friday, June 21, 2024 2:33 AM
> > To: Devarsh Thakkar <devarsht@ti.com>; jackson.lee
> > <jackson.lee@chipsnmedia.com>; mchehab@kernel.org;
> > sebastian.fricke@collabora.com
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> > hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>; lafley.kim
> > <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; Luthra, Jai <j-luthra@ti=
.com>;
> > Vibhore <vibhore@ti.com>; Dhruva Gole <d-gole@ti.com>; Aradhya <a-
> > bhatia1@ti.com>; Raghavendra, Vignesh <vigneshr@ti.com>
> > Subject: Re: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support r=
untime
> > suspend/resume
> >=20
> > Le jeudi 20 juin 2024 =C3=A0 19:50 +0530, Devarsh Thakkar a =C3=A9crit=
=C2=A0:
> > > Hi Nicolas,
> > >=20
> > > On 20/06/24 19:35, Nicolas Dufresne wrote:
> > > > Hi Devarsh,
> > > >=20
> > > > Le jeudi 20 juin 2024 =C3=A0 15:05 +0530, Devarsh Thakkar a =C3=A9c=
rit=C2=A0:
> > > > > In my view the delayed suspend functionality is generally helpful
> > > > > for devices where resume latencies are higher for e.g. this light
> > > > > sensor driver [2] uses it because it takes 250ms to stabilize
> > > > > after resumption and I don't see this being used in codec drivers
> > > > > generally since there is no such large resume latency. Please let
> > > > > me know if I am missing something or there is a strong reason to =
have
> > delayed suspend for wave5.
> > > >=20
> > > > It sounds like you did proper scientific testing of the suspend
> > > > results calls, mind sharing the actual data ?
> > >=20
> > > Nopes, I did not do that but yes I agree it is good to profile and
> > > evaluate the trade-off but I am not expecting 250ms kind of latency. =
I
> > > would suggest Jackson to do the profiling for the resume latencies.
> >=20
> > I'd clearly like to see numbers before we proceed.
> >=20
>=20
> I measured latency for the resume and suspend of our hw block.
>=20
> Resume : 124 microsecond
> Suspend : 355 microsecond
>=20
> I think if the delay is 100ms, it is enough.
> How about this ?

Seem very fast operation indeed, so a very small delay seems logical. I bel=
ieve
this is similar to what other drivers uses, so sounds good to me.=20

**If** we decide to go lower or drop the delay, then I'd like see someones
benchmark that show that doing suspend during playback does improve power
efficiently without reducing throughput.

Nicolas

>=20
> > >=20
> > > But perhaps a separate issue, I did notice that intention of the
> > > patchset was to suspend without waiting for the timeout if there is n=
o
> > > application having a handle to the wave5 device but even if I close
> > > the last instance I still see the IP stays on for 5seconds as seen in
> > > this logs [1] and this perhaps could be because extra pm counter refe=
rences
> > being hold.
> >=20
> > Not sure where this comes from, I'm not aware of drivers doing that wit=
h M2M
> > instances. Only
> >=20
> > >=20
> > > [2024-06-20 12:32:50] Freeing pipeline ...
> > >=20
> > > and after 5 seconds..
> > >=20
> > > [2024-06-20 12:32:55] |   204     | AM62AX_DEV_CODEC0 | DEVICE_STATE_=
ON |
> > > [2024-06-20 12:32:56] |   204     | AM62AX_DEV_CODEC0 | DEVICE_STATE_=
OFF
> > >=20
> > > [1]: https://gist.github.com/devarsht/009075d8706001f447733ed859152d9=
0
> >=20
> > Appart from the 5s being too long, that is expected. If it fails after =
that,
> > this is a bug, we we should hold on merging this until the problem has =
been
> > resolved.
> >=20
>=20
> After 5sec, the hw goes to suspend. So there is no bug in the current pat=
ch-set.
>=20
>=20
> Thanks
>=20
>=20
> > Imagine that userspace is going gapless playback, if you have a lets sa=
y 30ms
> > on forced suspend cycle due to close/open of the decoder instance, it w=
on't
> > actually endup gapless. The delay will ensure that we only suspend when
> > needed.
> >=20
> > There is other changes I have asked in this series, since we always hav=
e the
> > case where userspace just pause on streaming, and we want that prolonge=
d
> > paused lead to suspend. Hopefully this has been strongly tested and is =
not
> > just added for "completeness".
> >=20
> > Its important to note that has a reviewer only, my time is limited, and=
 I
> > completely rely on the author judgment of delay tuning and actual testi=
ng.
> >=20
> > Nicolas
> >=20
> > >=20
> > > Regards
> > > Devarsh
>=20


