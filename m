Return-Path: <linux-media+bounces-48656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA39CB73C3
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 22:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE46E3028E64
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 21:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6F62D5957;
	Thu, 11 Dec 2025 21:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mubyx5H/"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB8172618;
	Thu, 11 Dec 2025 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765489887; cv=none; b=awoQ3LshmuIU87edCyHdeh5PivCCL8qYzS62JCwPFuT0DiaJdh8IN/EV7XzgLZG6aQy3ROCet7SV8tmPyjS2t/HCuwfBt/hSYTVz1khswGfhWLbdqlCF9dPJvm0vKZKpG++KNQ1NdcxYsaXp2AFJtcOJ15Zt53qNY2qsFqem2e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765489887; c=relaxed/simple;
	bh=ev/Xj2i7PqHJlTaDWmzF5joPuwC2Sah9RO2UsU8KHAc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZmQJp1Xx6o4Vcf0SMDIVzcMhwHvcDQ9lwG/w1vb8VNW+30rlT76PQZKqFVzH9aoo+Iq+flx1J4HGUr2GFrdYCQyXimiMv9dwcKdZRxH9st1dlh09wA3imLbNmHrtk0769qDel4JMuJxHZQ7198pb26cimJu9B83/tiqhuWPnJp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mubyx5H/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765489883;
	bh=ev/Xj2i7PqHJlTaDWmzF5joPuwC2Sah9RO2UsU8KHAc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mubyx5H/FZzJt+UtSwiWkSc7jM08h3eRePMprCVbYjEDQMtvC2wFuKEVrUWumjxNv
	 1Cmnw+nMiNIUBCsOK6HZ7tNFdVQWGf291VMUO/lmDtSa1++kPBfPB9jEkXaM8i2Xkp
	 zTkksA+8OTYfEKviqg+CmVL7R5o1Qj5f4zU2jynCZ8eQVcrmG7gNoa0dZhSSk9GlS7
	 Khm8Lup3WmBbcOM+HOFp5JMTWLNLeVU+gK/Cs1lb4qTO+WDS2ASadfRLd6x8Uoscnj
	 rPGhqiTVAzAoLguqD9MYVns2W3z1lQo0fbXwilCeF7rJJqvfnAnJr+FZEZmFaN38Fk
	 8DeKKk8mKOe6A==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3674117E04D6;
	Thu, 11 Dec 2025 22:51:22 +0100 (CET)
Message-ID: <b17ccc682c636df47055678dacef1c435155f190.camel@collabora.com>
Subject: Re: [PATCH] media: chips-media: wave5: Fix Potential Probe Resource
 Leak
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Brandon Brnich <b-brnich@ti.com>, "jackson.lee"	
 <jackson.lee@chipsnmedia.com>, Nas Chung <nas.chung@chipsnmedia.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>,  "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>
Cc: Darren Etheridge <detheridge@ti.com>
Date: Thu, 11 Dec 2025 16:51:20 -0500
In-Reply-To: <8ea74bbf-b796-41ac-8500-1956a8a46ba8@ti.com>
References: <20251119213152.1442329-1-b-brnich@ti.com>
	 <SLXP216MB1148CE2E7ABF4280D6C27B44EDD8A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
	 <fb603b6159766bbba606260d44080733786d290f.camel@collabora.com>
	 <8ea74bbf-b796-41ac-8500-1956a8a46ba8@ti.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-yG+as83aM5QlWgOSIYo5"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-yG+as83aM5QlWgOSIYo5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 11 d=C3=A9cembre 2025 =C3=A0 15:36 -0600, Brandon Brnich a =C3=A9c=
rit=C2=A0:
> Hi Jackson and Nicolas,
>=20
> On 12/11/2025 9:04 AM, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 02 d=C3=A9cembre 2025 =C3=A0 02:06 +0000, jackson.lee a =C3=A9=
crit=C2=A0:
> > > Hi Brandon
> > >=20
> > >=20
> > > > -----Original Message-----
> > > > From: Brandon Brnich <b-brnich@ti.com>
> > > > Sent: Thursday, November 20, 2025 6:32 AM
> > > > To: Nas Chung <nas.chung@chipsnmedia.com>; jackson.lee
> > > > <jackson.lee@chipsnmedia.com>; Mauro Carvalho Chehab <mchehab@kerne=
l.org>;
> > > > linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Nicolas
> > > > Dufresne <nicolas.dufresne@collabora.com>
> > > > Cc: Darren Etheridge <detheridge@ti.com>; Brandon Brnich <b-brnich@=
ti.com>
> > > > Subject: [PATCH] media: chips-media: wave5: Fix Potential Probe Res=
ource
> > > > Leak
> > > >=20
> > > > After kthread creation during probe sequence, a handful of other fa=
ilures
> > > > could occur. If this were to happen, the kthread is never explicitl=
y
> > > > deleted which results in a resource leak. Add explicit cleanup of t=
his
> > > > resource.
> > > >=20
> > > > Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> > > > ---
> > > >=20
> > > > I am aware that all the dev attributes would be freed since it is
> > > > allocated using the devm_* framework. But I did not believe that th=
is
> > > > framework would recursively free the thread and stop the timer. The=
se
> > > > would just be dangling resources unable to get killed unless delibe=
rately
> > > > removed in the probe function.
> > > >=20
> > > > =C2=A0=C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu.c | =
5 +++++
> > > > =C2=A0=C2=A01 file changed, 5 insertions(+)
> > > >=20
> > > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > > b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > > index e1715d3f43b0..f027b4ac775a 100644
> > > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > > > @@ -339,6 +339,11 @@ static int wave5_vpu_probe(struct platform_dev=
ice
> > > > *pdev)
> > > > =C2=A0=C2=A0	v4l2_device_unregister(&dev->v4l2_dev);
> > > > =C2=A0=C2=A0err_vdi_release:
> > > > =C2=A0=C2=A0	wave5_vdi_release(&pdev->dev);
> > > > +
> > > > +	if (dev->irq < 0) {
> > > > +		kthread_destroy_worker(dev->worker);
> > > > +		hrtimer_cancel(&dev->hrtimer);
> > > > +	}
> > >=20
> > > I'd like to change the above to as below.
> > > I think we have to distinguish failure between registering IRQ handle=
r and
> > > registering v4l2_device_register.
> > >=20
> > > err_irq_release:
> > > 	if (dev->irq < 0) {
> > > 		kthread_destroy_worker(dev->worker);
> > > 		hrtimer_cancel(&dev->hrtimer);
> > > 	}
> > > err_vdi_release:
> >=20
> > That's seems more then just a suggestion, I see that err_vdi_release: i=
s reached
> > on worker creation failure. Checking the kthread code, this will cause =
a use
> > after free instead of a leak.
>=20
> Agreed with all above statements. I will update to fix use after free=20
> that I introduced in v1.
>=20
> >=20
> > An additional question, aren't we are supposed to also cleanup irq_thre=
ad ? We
> > have this code being introduced in the remove function now:
> >=20
> >=20
> > 		if (dev->irq_thread) {
> > 			kthread_stop(dev->irq_thread);
> > 			up(&dev->irq_sem);
> > 			dev->irq_thread =3D NULL;
> > 		}
>=20
> This portion of code is being introduced in Jackson's performance=20
> series. I did not base my patch on this series since it hasn't been=20
> accepted yet. I assumed my patch would make it in before since this is=
=20
> easier to review than that series. Apologies if I need to base on that=
=20
> series. Can rebase this in v2 if requested.
>=20
> Otherwise, I suggest Jackson to add irq_thread cleanup in next iteration=
=20
> of performance series.

I see, this is good point. I discourage writing code against my upcoming PR
branch, its not a proper tree, but for this one you may just base you patch
against it, since it will all be sent together ideally.

https://gitlab.freedesktop.org/linux-media/users/ndufresne/-/tree/for-6.20

regards,
Nicolas

>=20
> Best,
> Brandon
>=20
> >=20
> >=20
> >=20
> > regards,
> > Nicolas
> >=20
> >=20
> > >=20
> > > thanks
> > > Jackson
> > >=20
> > >=20
> > > > =C2=A0=C2=A0err_clk_dis:
> > > > =C2=A0=C2=A0	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
> > > > =C2=A0=C2=A0err_reset_assert:
> > > > --
> > > > 2.34.1
> > >=20
>=20

--=-yG+as83aM5QlWgOSIYo5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTs82AAKCRDZQZRRKWBy
9JOPAQDa7MPRF3XjlnL9sz8ECog0ayLpzkB3jKLKKrrswy0VtAD+Mo1DwA38IavT
XcCQWQhIkw2HDpdICm3epDqZWs/5TAU=
=b/OT
-----END PGP SIGNATURE-----

--=-yG+as83aM5QlWgOSIYo5--

