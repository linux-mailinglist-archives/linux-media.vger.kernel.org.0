Return-Path: <linux-media+bounces-36523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1763BAF119A
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 12:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1AAD4A01CF
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 10:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E19258CD4;
	Wed,  2 Jul 2025 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcwzrEY1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03589254B18;
	Wed,  2 Jul 2025 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451565; cv=none; b=hI6+KpuiOKiYXOZQ6yR8xx2k+XtwwajYnL9S4hmGTn5FVZPo54YJ1eYlGc5iAnmmSa5sSnyI7wcwfdykNB3EUyAsNRhTHxdBvodvIJUrJHj4NswVi0aElb0BpkZPbwbu9+9pCursTRMiLvS15fEMpXemk0artOC/eJgElankoLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451565; c=relaxed/simple;
	bh=MI9v+T1vRm2UOm6bwtBl32ZAGRMRsZgCocLfyH2LcB0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NfnrAWrmNwbv9Oo5zk1b57zqO6te/FfGDrHaqHbzdyYYEBNzzs8IrQRabXc7faueVA2XLLXdeqZ76EF7eJqdWZEqA2kYbp274YOJd8w7G2F6XErGCx4rtaqX3okNwUza+t0D1FJX50CyRirN3a6xIc5Bf7oVyzPlGymCkK6SfkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcwzrEY1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751451564; x=1782987564;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MI9v+T1vRm2UOm6bwtBl32ZAGRMRsZgCocLfyH2LcB0=;
  b=KcwzrEY1n7ZBW1pFRz2Es2XwrTWARkLRqB5r4Ke7Tm5eeT0cgKwwELc4
   TOy9t+fSf1KwIX+xKzZ6avZ1bLB6VqMoa5ErSfyCRfo+wsJlZUvbr+SAJ
   oK2sv/Q4yr7+zjlflkJp28uINWkQ8Jv5nzNBBDyvhI12JHK2gWrxT8mqg
   D3x234AAzsTjYzNGpo6Yzb7BY5A7BUX1arA9r8YxkxGzITEChbD/uTHMJ
   /VGJ+xytiWt/xOLfzB7sEXsUthPNTwIk5m2GLSWZaOJAWk+2B/xAfJTLQ
   6E+Pr6dr/2HxTPs3NgPBPHxDkwMtJa8AUg9JtiMDnOfSaKoigBGEP9klK
   Q==;
X-CSE-ConnectionGUID: cxknw5LhS8Kl7T6GjsgNGw==
X-CSE-MsgGUID: rS7ZHop8TBKcNMecV3v60g==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65195588"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="65195588"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 03:19:23 -0700
X-CSE-ConnectionGUID: 5Tf4oaJNQBeALBNQklx4ZQ==
X-CSE-MsgGUID: xqeQ+ZU7QeSeQTgNS/ALKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154115244"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.228])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 03:19:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Jul 2025 13:19:16 +0300 (EEST)
To: Dongcheng Yan <dongcheng.yan@intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org, 
    sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, u.kleine-koenig@baylibre.com, 
    ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com, 
    stable@vger.kernel.org, dongcheng.yan@linux.intel.com, hao.yao@intel.com
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
In-Reply-To: <20250425104331.3165876-1-dongcheng.yan@intel.com>
Message-ID: <5a04f105-3075-3226-6ad6-f2c3f31b29da@linux.intel.com>
References: <20250425104331.3165876-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-729750740-1751451556=:939"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-729750740-1751451556=:939
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 25 Apr 2025, Dongcheng Yan wrote:

> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
> being received. On the host side this is wired to a GPIO for polling or
> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
> lt6911uxe and lt6911uxc.
>=20
> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
> here as well.
>=20
> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> ---
>  drivers/platform/x86/intel/int3472/common.h   | 1 +
>  drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platfo=
rm/x86/intel/int3472/common.h
> index 51b818e62a25..4593d567caf4 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -23,6 +23,7 @@
>  #define INT3472_GPIO_TYPE_CLK_ENABLE=09=09=09=090x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED=09=09=09=090x0d
>  #define INT3472_GPIO_TYPE_HANDSHAKE=09=09=09=090x12
> +#define INT3472_GPIO_TYPE_HOTPLUG_DETECT=09=09=090x13
> =20
>  #define INT3472_PDEV_MAX_NAME_LEN=09=09=09=0923
>  #define INT3472_MAX_SENSOR_GPIOS=09=09=09=093
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/plat=
form/x86/intel/int3472/discrete.c
> index 394975f55d64..efa3bc7af193 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -191,6 +191,10 @@ static void int3472_get_con_id_and_polarity(struct i=
nt3472_discrete_device *int3
>  =09=09*con_id =3D "privacy-led";
>  =09=09*gpio_flags =3D GPIO_ACTIVE_HIGH;
>  =09=09break;
> +=09case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> +=09=09*con_id =3D "hpd";
> +=09=09*gpio_flags =3D GPIO_ACTIVE_HIGH;
> +=09=09break;
>  =09case INT3472_GPIO_TYPE_POWER_ENABLE:
>  =09=09*con_id =3D "avdd";
>  =09=09*gpio_flags =3D GPIO_ACTIVE_HIGH;
> @@ -221,6 +225,7 @@ static void int3472_get_con_id_and_polarity(struct in=
t3472_discrete_device *int3
>   * 0x0b Power enable
>   * 0x0c Clock enable
>   * 0x0d Privacy LED
> + * 0x13 Hotplug detect
>   *
>   * There are some known platform specific quirks where that does not qui=
te
>   * hold up; for example where a pin with type 0x01 (Power down) is mappe=
d to
> @@ -290,6 +295,7 @@ static int skl_int3472_handle_gpio_resources(struct a=
cpi_resource *ares,
>  =09switch (type) {
>  =09case INT3472_GPIO_TYPE_RESET:
>  =09case INT3472_GPIO_TYPE_POWERDOWN:
> +=09case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>  =09=09ret =3D skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpi=
o_flags);
>  =09=09if (ret)
>  =09=09=09err_msg =3D "Failed to map GPIO pin to sensor\n";

I was informed about existance of this patch through an off-band channel=20
(as I was not among receipients). In future, please include all relevant=20
maintainers and MLs as receipients as indicated by=20
scripts/get_maintainers.pl.

This may go through a media tree,

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.

--8323328-729750740-1751451556=:939--

