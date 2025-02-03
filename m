Return-Path: <linux-media+bounces-25531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A89A25461
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC7CA160AEE
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 08:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9D31FBC8B;
	Mon,  3 Feb 2025 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hov9qOej"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549126AE4;
	Mon,  3 Feb 2025 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738571198; cv=none; b=OhItXZEpFiKQFm7+4YjcRLsahRg+vSJw75vSmNl7kHo3bnpDER0DGXlMNuPycvxvWItOKma/St4a926aOYMbtWvLAwjARLG24Gi4IcBeC6C8o+tVEnmavcmZYurAQGApliygNuwhhb5/1NC7r91RBroIlWLB1uj2FO6/zdRQG6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738571198; c=relaxed/simple;
	bh=49izfw/s8J7t1BTsmtbLRAyA+9LUt/RteUeaMPBoxmw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=F8/18zQJlZ2Xn0wtaBRY7es/JXi/JK6cfrwQMnqZgJKR9QGl0z6qy0wMHI63lv0K+yASyW1F+gHIwqhUzhSCaUjkxu5b8xItyKEUwSJUTvVZpQ3CHhTuOWtz9LMTx7T9inuXVQH1pdC9D6Mle3EuxTjjX/M+/9CvowGoCQiFi3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hov9qOej; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738571196; x=1770107196;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=49izfw/s8J7t1BTsmtbLRAyA+9LUt/RteUeaMPBoxmw=;
  b=hov9qOej/tHJrC8rvNY75V5LrjqabqU8SHW3CbOgD+OjQiylw6+zPoza
   kzG5lXrGDxpAlg/aMipEnPKXFjhpTlG8GQcFZcPcnwpA1InpEIZmz0Ab3
   YTxdltamsoknEK+rTaAka1ryF2+Lvvyyw84CDDWJWtRDt7/dmynICCe0Y
   J5JPdfKQTN0h4EvNDWdR73v301491Cf9DMxhL9L8dWNIdlxbsvF9nPeaD
   dMo5uHzmYhg5qw1vGDd9h9dBUgkUXIDLDj0WuEJ/pIXDxO22dpDI8Tp5m
   dotCGJgcfeiQqBwta/I4Kea7hMsz0+QVrYHp9AuohqCmzugozNP/zIOmu
   g==;
X-CSE-ConnectionGUID: B1SM/U85TPCknTbH0hhKpQ==
X-CSE-MsgGUID: A2qKwzivRm2wS6dWUiYBBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="42976939"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42976939"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:26:35 -0800
X-CSE-ConnectionGUID: THNK2Jr+SeexkLURHj0gzA==
X-CSE-MsgGUID: Ub/M5QWpTuSyiSa7lkzJ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="109983634"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:26:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 10:26:29 +0200 (EET)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: Daniel Scally <djrscally@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl, 
    linux-media@vger.kernel.org
Subject: Re: [PATCH v5 2/3] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
In-Reply-To: <Z6B8WWwNwxS42ARa@kekkonen.localdomain>
Message-ID: <acc436c0-2aad-2ce3-d1ba-f6fd40cf1fc0@linux.intel.com>
References: <20250131120152.1109476-1-sakari.ailus@linux.intel.com> <20250131120152.1109476-3-sakari.ailus@linux.intel.com> <86489549-c34c-e6ba-e8f6-c96543d06541@linux.intel.com> <Z6B8WWwNwxS42ARa@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1556452726-1738571189=:934"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1556452726-1738571189=:934
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 3 Feb 2025, Sakari Ailus wrote:

> Hi Ilpo,
>=20
> On Mon, Feb 03, 2025 at 10:03:14AM +0200, Ilpo J=E4rvinen wrote:
> > On Fri, 31 Jan 2025, Sakari Ailus wrote:
> >=20
> > > The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> > > documentation) but the int3472 indiscriminately provides this as a "r=
eset"
> > > GPIO to sensor drivers. Take this into account by assigning it as "en=
able"
> > > with active high polarity for INT347E devices, i.e. ov7251. "reset" w=
ith
> > > active low polarity remains the default GPIO name for other devices.
> > >=20
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  drivers/platform/x86/intel/int3472/discrete.c | 47 +++++++++++++++++=
--
> > >  1 file changed, 43 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/=
platform/x86/intel/int3472/discrete.c
> > > index 3f7624714869..529ea2d08a21 100644
> > > --- a/drivers/platform/x86/intel/int3472/discrete.c
> > > +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > > @@ -2,6 +2,7 @@
> > >  /* Author: Dan Scally <djrscally@gmail.com> */
> > > =20
> > >  #include <linux/acpi.h>
> > > +#include <linux/array_size.h>
> > >  #include <linux/bitfield.h>
> > >  #include <linux/device.h>
> > >  #include <linux/gpio/consumer.h>
> > > @@ -122,10 +123,48 @@ skl_int3472_gpiod_get_from_temp_lookup(struct i=
nt3472_discrete_device *int3472,
> > >  =09return desc;
> > >  }
> > > =20
> > > -static void int3472_get_func_and_polarity(u8 type, const char **func=
,
> > > -=09=09=09=09=09  unsigned long *gpio_flags)
> > > +/**
> > > + * struct int3472_gpio_map - Map GPIOs to whatever is expected by th=
e
> > > + * sensor driver (as in DT bindings)
> > > + * @hid: The ACPI HID of the device without the instance number e.g.=
 INT347E
> > > + * @type_from: The GPIO type from ACPI ?SDT
> > > + * @type_to: The assigned GPIO type, typically same as @type_from
> > > + * @func: The function, e.g. "enable"
> > > + * @polarity_low: GPIO_ACTIVE_LOW true if the @polarity_low is true,
> > > + * GPIO_ACTIVE_HIGH otherwise
> > > + */
> > > +struct int3472_gpio_map {
> > > +=09const char *hid;
> > > +=09u8 type_from;
> > > +=09u8 type_to;
> > > +=09bool polarity_low;
> > > +=09const char *func;
> > > +};
> > > +
> > > +static const struct int3472_gpio_map int3472_gpio_map[] =3D {
> > > +=09{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, fa=
lse, "enable" },
> > > +};
> > > +
> > > +static void int3472_get_func_and_polarity(struct acpi_device *adev, =
u8 *type,
> > > +=09=09=09=09=09  const char **func, unsigned long *gpio_flags)
> > >  {
> > > -=09switch (type) {
> > > +=09unsigned int i;
> > > +
> > > +=09for (i =3D 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
> > > +=09=09if (*type !=3D int3472_gpio_map[i].type_from)
> > > +=09=09=09continue;
> > > +
> > > +=09=09if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NUL=
L))
> > > +=09=09=09continue;
> > > +
> > > +=09=09*type =3D int3472_gpio_map[i].type_to;
> > > +=09=09*gpio_flags =3D int3472_gpio_map[i].polarity_low ?
> > > +=09=09=09GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
> >=20
> > Don't start this continuation line left of =3D sign unless you really=
=20
> > really have to do that, and it's not such a case here!
>=20
> Why? The documentation says the subsequent lines should be aligned
> "substantially" (I believe a tab stop qualifies), except in cases of
> arguments in parentheses just right of the opening parenthesis but that's
> not the case here.

Because I say so, it's not substancial to me when it's left of =3D. This is=
=20
not negotiable.

--=20
 i.


> I can submit v6 with that if others agree.
>=20
> >=20
> > Either put GPIO_ACTIVE_LOW on the first line and align the defines, or=
=20
> > align the second line as it is with int3472_gpio_map[...].
> >=20
> > > +=09=09*func =3D int3472_gpio_map[i].func;
> > > +=09=09return;
> > > +=09}
> > > +
> > > +=09switch (*type) {
> > >  =09case INT3472_GPIO_TYPE_RESET:
> > >  =09=09*func =3D "reset";
> > >  =09=09*gpio_flags =3D GPIO_ACTIVE_LOW;
> > > @@ -218,7 +257,7 @@ static int skl_int3472_handle_gpio_resources(stru=
ct acpi_resource *ares,
> > > =20
> > >  =09type =3D FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
> > > =20
> > > -=09int3472_get_func_and_polarity(type, &func, &gpio_flags);
> > > +=09int3472_get_func_and_polarity(int3472->sensor, &type, &func, &gpi=
o_flags);
> > > =20
> > >  =09pin =3D FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
> > >  =09if (pin !=3D agpio->pin_table[0])
> > >=20
>=20
>=20
--8323328-1556452726-1738571189=:934--

