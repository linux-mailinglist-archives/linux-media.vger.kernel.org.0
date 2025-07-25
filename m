Return-Path: <linux-media+bounces-38477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C30B1203D
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 16:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 166363A84FF
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 14:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D98E21D590;
	Fri, 25 Jul 2025 14:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jeuI/77b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB561E5701;
	Fri, 25 Jul 2025 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753454432; cv=none; b=U0Hpvgurwf4r6n6iPHBctfOArz0AWpWGwhPzwpeNffqIeWkETaBzdKtpeBGh61V5bme8dyUjMeLv23QZUwIIsJasqoHdjJ31d5Q8a+zZXX07fYYS0AeTMAWRqAfep2V5+yG1aESChNBgWAt15w5xrjLIqZ23CevJQNu0BYX1dI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753454432; c=relaxed/simple;
	bh=Pe1O6JQBpM96y38GlEwysMUHU2QGMRFxNAE0yGjeyqU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=i6BrEUYbpkJTPneBdOzxQkWMMj+AnS0HHAiSvle4ep4GL/8auMO4Z+q4679UcqUPnxKG2Og7AaOkMusRRER3dQYQCTDHhgTH8aIG4UUOpnRVEtzRe15l7ofcvUrNSoTJrPUOvlJk5USVlkQniGKZT/WO6uv4JiKC7zXRDKEfLgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jeuI/77b reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E307982;
	Fri, 25 Jul 2025 16:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753454387;
	bh=Pe1O6JQBpM96y38GlEwysMUHU2QGMRFxNAE0yGjeyqU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jeuI/77b/1trNj4HKV+BBArKHz6hRUxwdCQmxDOV1ismZ3kfNs/DnLvLzGPHHHsVW
	 Pn/vKlaF+8Ks6JkxJGa3gblLj+ead7ywPotcOPcA55yiR0DGlN1hUfhvSrt5VC9Y1M
	 a5wcqS412S/LIACvSjsLsd4ltomOGs21nqCy40p4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN3P287MB35190A4AEE4C8D98142E7B6AFF59A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250724104711.18764-1-hardevsinh.palaniya@siliconsignals.io> <20250724104711.18764-3-hardevsinh.palaniya@siliconsignals.io> <aIKi1BkNzNvsf5Tr@smile.fi.intel.com> <PN3P287MB35190A4AEE4C8D98142E7B6AFF59A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v5 2/2] media: i2c: add ov2735 image sensor driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com>, laurent.pinchart@ideasonboard.com <laurent.pinchart@ideasonboard.com>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede <hansg@kernel.org>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Matthias Fend <matthias.fend@emfend.at>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Jingjing Xiong <jingjing.xiong@intel.com>, Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org <linux-media@vger.kernel.org>, devicetree@vger.kernel.org <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.
 org <linux-kernel@vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Date: Fri, 25 Jul 2025 15:40:24 +0100
Message-ID: <175345442477.2567018.13588829522231689027@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Hardevsinh Palaniya (2025-07-25 06:55:23)
<snip>
> > > +static int ov2735_page_access(struct ov2735 *ov2735,
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD u32 reg, void *val, int *err, bool is_read)
> > > +{
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD u8 page =3D (reg >> CCI_REG_PRI=
VATE_SHIFT) & 0xff;
> >=20
> > ' & 0xff' part is redundant.
> >=20
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD u32 addr =3D reg & ~CCI_REG_PRI=
VATE_MASK;
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD int ret =3D 0;
> >=20
> > How is this assignment being used?
> >=20
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD if (err && *err)
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD return *err;
> > > +
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD mutex_lock(&ov2735->page_lock);
> > > +
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD /* Perform page access before r=
ead/write */
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD if (ov2735->current_page !=3D p=
age) {
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD ret =3D cci_write(ov2735->cci, O=
V2735_REG_PAGE_SELECT, page, err);
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD if (ret)
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD goto err_mutex_unlock;
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD ov2735->current_page =3D page;
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD }
> > > +
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD if (is_read)
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD ret =3D cci_read(ov2735->cci, ad=
dr, (u64 *)val, err);
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD else
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD ret =3D cci_write(ov2735->cci, a=
ddr, *(u64 *)val, err);
> >=20
> > Do you really need this castings?
>=20
> Do you really think this casting is unnecessary?
>=20

Yes? Well quite probably - I haven't checked myself yet but ..


> Please check the definitions of cci_read/write
>=20
> without this, we can't even build the driver.

How about ... changing the function prototype of ov2735_page_access ?

Then you might be able to build without casts ?


> > > +err_mutex_unlock:
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD mutex_unlock(&ov2735->page_lock=
);
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD return ret;
> >=20
> > Hmm... Wouldn't be cleanup.h helpful here?
> >
> > > +}
> >=20
> > ...
> >=20
> > > +static int ov2735_write(struct ov2735 *ov2735, u32 reg, u64 val, int=
 *err)
> > > +{
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD return ov2735_page_access(ov273=
5, reg, (void *)&val, err, false);
> >=20
> > Why casting?
> >=20
> > > +}
> >=20
> > ...

<snip>

> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD /* Apply format settings. */
> >=20
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD /* Apply customized values from=
 user */
> >=20
> > Define a single style for one-line comments and use it everywhere consi=
stently.
>=20
> Are you referring to the period at the end of the comment?
> =20
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD goto error_power_off;
> >=20
> > ...
> >=20
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD devm_pm_runtime_set_active_enab=
led(ov2735->dev);
> > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD devm_pm_runtime_get_noresume(ov=
2735->dev);
> >=20
> > No error checks? What's the point to use devm and what will happen if t=
he first
> > fails, for example?
> >=20
> > --
> > With Best Regards,
> > Andy Shevchenko
>=20
> With all due respect,
>=20
> I completely understand and appreciate the need for multiple rounds of re=
view.
> However, where feasible, it would be helpful to receive style-related and=
=20
> non-blocking comments earlier in the review process. Iterating on minor i=
ssues
> in later versions, especially ones that could have been addressed togethe=
r=20
> earlier, can become a bit frustrating at times. I hope you can understand=
 this=20
> perspective.

I certainly understand that public patch review can be slow and tedious
at times, but please remember that unless you have paid Andy to review
this work, there are no contractual 'requirements' on which bits get
reviewed first. All reviews are helpful, whereever they come in - and
the goal here is to get as many eyes on code as possible to support high
quality code being maintained in the linux kernel.


Perhaps one path to speed this up in the future might be if you might
find some time to read more kernel code and also review some other
kernel patches publicly as well. It might accelerate/help you learn the
linux coding style sooner to avoid some cycles, and provide more eyes
where we need them in the community.

Regards
--
Kieran


> Once again, thank you for your time and effort in helping improve the qua=
lity
> of the driver.
>=20
> Best Regards,
> Hardev

