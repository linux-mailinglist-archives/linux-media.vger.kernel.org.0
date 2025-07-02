Return-Path: <linux-media+bounces-36536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E928AF1357
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D3BE1887849
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B446256C84;
	Wed,  2 Jul 2025 11:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJBgwbCM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C92F42;
	Wed,  2 Jul 2025 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454556; cv=none; b=uZKnV9yFRS4jQLSZnt5tM4Vyb6dt/4mhaLTfw4ZJKXuzT1BXaBZjL28anN5skAiP44zxAdYt4TrM1Slse/uqv3ebsZa1n8QHWRIHjPBLtnL8YAoRhdiObeYblJUyalDf9ptBLoW9apQoZAexMorxdU9++JKbIPwh+wsRnc7IQ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454556; c=relaxed/simple;
	bh=7Gy/vOo38uHF282ZpQJ3LrAPxZY9lz8SjOqzD0Ag+Sk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lKa8wVcc2IvBMCdZL9Zj5hbD6YsUu2wfb1X/czOxaMzMAPy+Xq4KXpiGpvJqKHjf/AHJEHMJbgIDMpSi/n3TuE3e0onDik2bJNJ8JcuGL14mJt4hP+HyW4ZGhR5Yw/LZ1mjSnz/O51uw+nRRleNAgPRNxotxdW4oZA3dxc88EYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJBgwbCM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751454555; x=1782990555;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7Gy/vOo38uHF282ZpQJ3LrAPxZY9lz8SjOqzD0Ag+Sk=;
  b=FJBgwbCMlmRz8HSHbdXoj112ggqp3/Xdh5X9olEgO9cwHD7/60+KncaA
   WbMjpLtY4warjNbSqsvvsS6OF9K2Kex6dC4YvAe+iKmLTmOVwD9OY8wjX
   Oe8PqPnjhHf6Sf3h1dmr6kHiDlPwoh5/pi4n/GRZ9Vk+ZJT81h7iP/cOt
   jnBw3burDG5n/NUc9EiHEhjw5yztbgXdKsVvLuLT8nsTQAlMcNom4MOpW
   THvuhqrb0cbl+Zg6rLptO1aXtTpgXe8zGLkcYYKF6xhHMJ+Hgj9/Uo1g9
   veITdn+PuqXPDZaHDf2x5iQsHtaYZqVp+/o43YXoEyvZeKKseXvlKrJC5
   w==;
X-CSE-ConnectionGUID: PWwc0a/KTX2N/8Thy2aB9Q==
X-CSE-MsgGUID: Plk/PXsVS/+3SSaM8ds3vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65199949"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="65199949"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:09:14 -0700
X-CSE-ConnectionGUID: e0oVH/PYTzCPINcOkkH7fQ==
X-CSE-MsgGUID: Y8f6r5DpSxOAVF1eNkQloA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="177723447"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.228])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:09:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Jul 2025 14:09:04 +0300 (EEST)
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
    "Yan, Dongcheng" <dongcheng.yan@intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org, 
    hverkuil@xs4all.nl, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, u.kleine-koenig@baylibre.com, 
    ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com, 
    stable@vger.kernel.org, dongcheng.yan@linux.intel.com, hao.yao@intel.com
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
In-Reply-To: <aGUPsDglThYGc/3g@svinhufvud>
Message-ID: <268e959b-84e8-ddb0-e760-46b7901b4c2e@linux.intel.com>
References: <20250425104331.3165876-1-dongcheng.yan@intel.com> <5a04f105-3075-3226-6ad6-f2c3f31b29da@linux.intel.com> <116ea6fa-e9b8-4c28-bc31-f4d1589eb34b@intel.com> <aGUPsDglThYGc/3g@svinhufvud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1366388325-1751454544=:939"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1366388325-1751454544=:939
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 2 Jul 2025, Sakari Ailus wrote:

> Hi Dongcheng, Ilpo,
>=20
> On Wed, Jul 02, 2025 at 06:23:19PM +0800, Yan, Dongcheng wrote:
> > Hi Ilpo,
> >=20
> > On 7/2/2025 6:19 PM, Ilpo J=E4rvinen wrote:
> > > On Fri, 25 Apr 2025, Dongcheng Yan wrote:
> > >=20
> > >> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data=
 is
> > >> being received. On the host side this is wired to a GPIO for polling=
 or
> > >> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
> > >> lt6911uxe and lt6911uxc.
> > >>
> > >> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use i=
t
> > >> here as well.
> > >>
> > >> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> > >> ---
> > >>  drivers/platform/x86/intel/int3472/common.h   | 1 +
> > >>  drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
> > >>  2 files changed, 7 insertions(+)
> > >>
> > >> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/p=
latform/x86/intel/int3472/common.h
> > >> index 51b818e62a25..4593d567caf4 100644
> > >> --- a/drivers/platform/x86/intel/int3472/common.h
> > >> +++ b/drivers/platform/x86/intel/int3472/common.h
> > >> @@ -23,6 +23,7 @@
> > >>  #define INT3472_GPIO_TYPE_CLK_ENABLE=09=09=09=090x0c
> > >>  #define INT3472_GPIO_TYPE_PRIVACY_LED=09=09=09=090x0d
> > >>  #define INT3472_GPIO_TYPE_HANDSHAKE=09=09=09=090x12
> > >> +#define INT3472_GPIO_TYPE_HOTPLUG_DETECT=09=09=090x13
> > >> =20
> > >>  #define INT3472_PDEV_MAX_NAME_LEN=09=09=09=0923
> > >>  #define INT3472_MAX_SENSOR_GPIOS=09=09=09=093
> > >> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers=
/platform/x86/intel/int3472/discrete.c
> > >> index 394975f55d64..efa3bc7af193 100644
> > >> --- a/drivers/platform/x86/intel/int3472/discrete.c
> > >> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > >> @@ -191,6 +191,10 @@ static void int3472_get_con_id_and_polarity(str=
uct int3472_discrete_device *int3
> > >>  =09=09*con_id =3D "privacy-led";
> > >>  =09=09*gpio_flags =3D GPIO_ACTIVE_HIGH;
> > >>  =09=09break;
> > >> +=09case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> > >> +=09=09*con_id =3D "hpd";
> > >> +=09=09*gpio_flags =3D GPIO_ACTIVE_HIGH;
> > >> +=09=09break;
> > >>  =09case INT3472_GPIO_TYPE_POWER_ENABLE:
> > >>  =09=09*con_id =3D "avdd";
> > >>  =09=09*gpio_flags =3D GPIO_ACTIVE_HIGH;
> > >> @@ -221,6 +225,7 @@ static void int3472_get_con_id_and_polarity(stru=
ct int3472_discrete_device *int3
> > >>   * 0x0b Power enable
> > >>   * 0x0c Clock enable
> > >>   * 0x0d Privacy LED
> > >> + * 0x13 Hotplug detect
> > >>   *
> > >>   * There are some known platform specific quirks where that does no=
t quite
> > >>   * hold up; for example where a pin with type 0x01 (Power down) is =
mapped to
> > >> @@ -290,6 +295,7 @@ static int skl_int3472_handle_gpio_resources(str=
uct acpi_resource *ares,
> > >>  =09switch (type) {
> > >>  =09case INT3472_GPIO_TYPE_RESET:
> > >>  =09case INT3472_GPIO_TYPE_POWERDOWN:
> > >> +=09case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> > >>  =09=09ret =3D skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id=
, gpio_flags);
> > >>  =09=09if (ret)
> > >>  =09=09=09err_msg =3D "Failed to map GPIO pin to sensor\n";
> > >=20
> > > I was informed about existance of this patch through an off-band chan=
nel=20
> > > (as I was not among receipients). In future, please include all relev=
ant=20
> > > maintainers and MLs as receipients as indicated by=20
> > > scripts/get_maintainers.pl.
>=20
> Hans used to handle these previously and I think that's why you weren't
> cc'd.

I understand I'm relatively new to this and changes such as this can be=20
easily missed for relatively long time. However, it won't explain why=20
pdx86 ML was not included.

Usually it's an indication of using fragile patch sending routine if the=20
get_maintainers.pl provided receipients are not factored in at least=20
semi-automatically at the time of sending, and ends up easily missing=20
necessary receipients. So my suggestion is the original submitter looks=20
into the process used at the moment of sending the patches out.

--=20
 i.

> > > This may go through a media tree,
> > >=20
> > > Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>=20
> Thank you!
>=20
> > >=20
> > >=20
> >=20
> > Thanks a lot and sorry for the trouble caused by me.
>=20
> No worries.
>=20
>=20
--8323328-1366388325-1751454544=:939--

