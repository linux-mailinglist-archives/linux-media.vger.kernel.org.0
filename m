Return-Path: <linux-media+bounces-48639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA58CB6466
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 16:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED0CF304DA01
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 15:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713AB2D9EC9;
	Thu, 11 Dec 2025 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YyiFDA2n"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF482D7D42;
	Thu, 11 Dec 2025 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765465477; cv=none; b=qwY73OglQX229IpC3ZzlU8O+/BEf3ufIJT9Hn0Gi+sOkgPh4f2QE9ZNl8sLR0SXRyr386ZAgZiKTkwyi3fy+jCL4wQLl3WSE3arxpv822Ql06Ls6ciUeXVvOU2MsQlyGdBKtadEblD09isYLAee7GkJubb34bIMx311P1iqSKHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765465477; c=relaxed/simple;
	bh=qRVLEKycuFWj03LoREVZGVkeix+qSjWLRddZpKQNuF0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KO1EGUJM73tqUeEkHH0X9/CjthfEd57JY6uUpAGwyt8nRMDYvqp4wxPP1LOCMbXiUu+lsZe9HbwKngYWuB+PbSN8gR457hNAD4LSrAqQfXXGY+G5n7GQN3p3lT38HUAE/yDy2qbLy5NKJaqeI8090Ezq32ViejojA5ODBwH0c/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YyiFDA2n; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765465468;
	bh=qRVLEKycuFWj03LoREVZGVkeix+qSjWLRddZpKQNuF0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YyiFDA2nKVfeaPy9ZVYdgfHrlyYf64frxHTY2LcFuL146IOR4yAgtUGN7eROqKJyp
	 MetZPU2FLbPjdSIrD5GOuk91aswNIB3VZBfIKnsMKB+whjIOOHSVldDKhPBLPbd6B8
	 ma69v6wp/Akltr5eoIGe3vIL59Zm9BFna99LFgRG3KUQriLWQz3M6WPMovxw7xddWG
	 Qcv1YILunnyY9i7KLV7sebuhPE5fU1HcQFXL16GXo8JLvRbQ+LKlzyzzMvB53NEvzQ
	 1jCogg46z3fF0Vh+N1CJEA1kC1pYFOtJRpTEH0JaM+yRUTVYo1kXI3hTjC5I3O1VAc
	 QxHF2VBsdWAcA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 324B517E0506;
	Thu, 11 Dec 2025 16:04:27 +0100 (CET)
Message-ID: <fb603b6159766bbba606260d44080733786d290f.camel@collabora.com>
Subject: Re: [PATCH] media: chips-media: wave5: Fix Potential Probe Resource
 Leak
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, Brandon Brnich	
 <b-brnich@ti.com>, Nas Chung <nas.chung@chipsnmedia.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, "linux-media@vger.kernel.org"	
 <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>
Cc: Darren Etheridge <detheridge@ti.com>
Date: Thu, 11 Dec 2025 10:04:25 -0500
In-Reply-To: <SLXP216MB1148CE2E7ABF4280D6C27B44EDD8A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20251119213152.1442329-1-b-brnich@ti.com>
	 <SLXP216MB1148CE2E7ABF4280D6C27B44EDD8A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="=-fIN90FCxIt8yXQm5s7ns"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-fIN90FCxIt8yXQm5s7ns
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 02:06 +0000, jackson.lee a =C3=A9crit=
=C2=A0:
> Hi Brandon
>=20
>=20
> > -----Original Message-----
> > From: Brandon Brnich <b-brnich@ti.com>
> > Sent: Thursday, November 20, 2025 6:32 AM
> > To: Nas Chung <nas.chung@chipsnmedia.com>; jackson.lee
> > <jackson.lee@chipsnmedia.com>; Mauro Carvalho Chehab <mchehab@kernel.or=
g>;
> > linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Nicolas
> > Dufresne <nicolas.dufresne@collabora.com>
> > Cc: Darren Etheridge <detheridge@ti.com>; Brandon Brnich <b-brnich@ti.c=
om>
> > Subject: [PATCH] media: chips-media: wave5: Fix Potential Probe Resourc=
e
> > Leak
> >=20
> > After kthread creation during probe sequence, a handful of other failur=
es
> > could occur. If this were to happen, the kthread is never explicitly
> > deleted which results in a resource leak. Add explicit cleanup of this
> > resource.
> >=20
> > Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> > ---
> >=20
> > I am aware that all the dev attributes would be freed since it is
> > allocated using the devm_* framework. But I did not believe that this
> > framework would recursively free the thread and stop the timer. These
> > would just be dangling resources unable to get killed unless deliberate=
ly
> > removed in the probe function.
> >=20
> > =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu.c | 5 +++++
> > =C2=A01 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > index e1715d3f43b0..f027b4ac775a 100644
> > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > @@ -339,6 +339,11 @@ static int wave5_vpu_probe(struct platform_device
> > *pdev)
> > =C2=A0	v4l2_device_unregister(&dev->v4l2_dev);
> > =C2=A0err_vdi_release:
> > =C2=A0	wave5_vdi_release(&pdev->dev);
> > +
> > +	if (dev->irq < 0) {
> > +		kthread_destroy_worker(dev->worker);
> > +		hrtimer_cancel(&dev->hrtimer);
> > +	}
>=20
> I'd like to change the above to as below.
> I think we have to distinguish failure between registering IRQ handler an=
d
> registering v4l2_device_register.
>=20
> err_irq_release:
> 	if (dev->irq < 0) {
> 		kthread_destroy_worker(dev->worker);
> 		hrtimer_cancel(&dev->hrtimer);
> 	}
> err_vdi_release:

That's seems more then just a suggestion, I see that err_vdi_release: is re=
ached
on worker creation failure. Checking the kthread code, this will cause a us=
e
after free instead of a leak.

An additional question, aren't we are supposed to also cleanup irq_thread ?=
 We
have this code being introduced in the remove function now:


		if (dev->irq_thread) {
			kthread_stop(dev->irq_thread);
			up(&dev->irq_sem);
			dev->irq_thread =3D NULL;
		}



regards,
Nicolas


>=20
> thanks
> Jackson
>=20
>=20
> > =C2=A0err_clk_dis:
> > =C2=A0	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
> > =C2=A0err_reset_assert:
> > --
> > 2.34.1
>=20

--=-fIN90FCxIt8yXQm5s7ns
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTrdeQAKCRDZQZRRKWBy
9IqnAP9TtxqhGnmwV2Z2CgbHfeaCPEw0iy59N222E5oYAXM4dQEAjo1HznjPj0PN
Mkb4Z/MUf0dG39YH/ZU8HaYHZg3lGgs=
=f0Ga
-----END PGP SIGNATURE-----

--=-fIN90FCxIt8yXQm5s7ns--

