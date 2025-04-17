Return-Path: <linux-media+bounces-30457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F63FA91D19
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 14:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E3F87AF0F3
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 12:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA27245022;
	Thu, 17 Apr 2025 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoZmac+K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9582417F0;
	Thu, 17 Apr 2025 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894779; cv=none; b=QkUXEKDAewWYBAWAvZRxWtyng4lg6NSfcYV9jDMXFO4kAALjmJ2jRN0zVdnxVbIOWUJFUV6q5acEUvVR+5FvrTRuD9zyEvhZkBIcIj3nOPhJImep/eAPMuCLVaiDhwpo3ssIPhRMWpIjq9c3JjqUY4NZFuliPkDjtQGXvkqPLbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894779; c=relaxed/simple;
	bh=E1Pwq35kl675jGF7ZBDCJFUo/3F/SjufJe2KtcoKVyg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dBxvVPAvADhRYIPodwwFWCzpQxDVzyXrukZ2HUi/yRefmYDDHiUh+dlnCO80j7JeRQj5BxvUhgYRW/WPPEd9UNIOJJH084+4MCa44KBedldgex00lFZ1ix05RtyIT0Pawv+qgw3P1EH92AlIBqQqP8oGkZZKAG6BCTbmGQTIj/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoZmac+K; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744894778; x=1776430778;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=E1Pwq35kl675jGF7ZBDCJFUo/3F/SjufJe2KtcoKVyg=;
  b=aoZmac+KohYh+zYlyYVMT8aBy/rmuk+ki7KXnEEtPRld3pakTMyNDGQd
   JWUM3mU+0Ze/MI1COft010CLPTmtuS2yg5gjhXsG3HsEBIR3GreBervK8
   S8vMF0CFdtC/VdgVC7m78jA0e28ur3BRYbF9ASWPN1FYtNYdYKKSTtaHE
   89koUcG5Il1JhxblRzGesiGVAlY32MQMqKpFN29QXxYr1CKEr7bl6LJOw
   qS2POvBSWDm3jv+kth9LN8ROYgxsnZt3LNdzGGS1XEC7ttwr+v1VS962y
   CXjbYEdkkjFYXEP9lIAukzsr9/Ncgg1e2u7mzleiT0L0W02ic6oT64jxt
   Q==;
X-CSE-ConnectionGUID: 8t03R0zNSeqPmlj85itMpA==
X-CSE-MsgGUID: q9FJoqlXRIW5qsUpo+rzFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46612167"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46612167"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 05:59:23 -0700
X-CSE-ConnectionGUID: lw6Efo0ZTiGFL5xr1GRbdA==
X-CSE-MsgGUID: yvfnyEo8TfiS/3va4uKSiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="167987648"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 05:59:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Apr 2025 15:59:15 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>, 
    Alan Stern <stern@rowland.harvard.edu>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>, 
    Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
    platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/9] platform/x86: int3472: Add skl_int3472_register_clock()
 helper
In-Reply-To: <20250417111337.38142-2-hdegoede@redhat.com>
Message-ID: <252a5c3a-9ea1-a02b-627e-1937277e9c15@linux.intel.com>
References: <20250417111337.38142-1-hdegoede@redhat.com> <20250417111337.38142-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1823117670-1744894320=:939"
Content-ID: <8e76dfc8-1581-6940-e3e7-591a0ed7b624@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1823117670-1744894320=:939
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <d7cf8a4a-c7e3-ddb2-30ad-7b2e16c8b1a4@linux.intel.com>

On Thu, 17 Apr 2025, Hans de Goede wrote:

> skl_int3472_register_dsm_clock() and skl_int3472_register_gpio_clock() ar=
e
> 80% the same code. Factor out the common code into a new
> skl_int3472_register_clock() helper.
>=20
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../x86/intel/int3472/clk_and_regulator.c     | 57 +++++--------------
>  1 file changed, 13 insertions(+), 44 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/dri=
vers/platform/x86/intel/int3472/clk_and_regulator.c
> index 16e36ac0a7b4..837990af24fe 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -118,7 +118,7 @@ static const struct clk_ops skl_int3472_clock_ops =3D=
 {
>  =09.recalc_rate =3D skl_int3472_clk_recalc_rate,
>  };
> =20
> -int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int34=
72)
> +static int skl_int3472_register_clock(struct int3472_discrete_device *in=
t3472)
>  {
>  =09struct acpi_device *adev =3D int3472->adev;
>  =09struct clk_init_data init =3D {
> @@ -127,12 +127,6 @@ int skl_int3472_register_dsm_clock(struct int3472_di=
screte_device *int3472)
>  =09};
>  =09int ret;
> =20
> -=09if (int3472->clock.cl)
> -=09=09return 0; /* A GPIO controlled clk has already been registered */
> -
> -=09if (!acpi_check_dsm(adev->handle, &img_clk_guid, 0, BIT(1)))
> -=09=09return 0; /* DSM clock control is not available */
> -
>  =09init.name =3D kasprintf(GFP_KERNEL, "%s-clk", acpi_dev_name(adev));
>  =09if (!init.name)
>  =09=09return -ENOMEM;
> @@ -161,51 +155,26 @@ int skl_int3472_register_dsm_clock(struct int3472_d=
iscrete_device *int3472)
>  =09return ret;
>  }
> =20
> +int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int34=
72)
> +{
> +=09if (int3472->clock.cl)
> +=09=09return 0; /* A GPIO controlled clk has already been registered */
> +
> +=09if (!acpi_check_dsm(int3472->adev->handle, &img_clk_guid, 0, BIT(1)))
> +=09=09return 0; /* DSM clock control is not available */
> +
> +=09return skl_int3472_register_clock(int3472);
> +}
> +
>  int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3=
472,
>  =09=09=09=09    struct gpio_desc *gpio)
>  {
> -=09struct clk_init_data init =3D {
> -=09=09.ops =3D &skl_int3472_clock_ops,
> -=09=09.flags =3D CLK_GET_RATE_NOCACHE,
> -=09};
> -=09int ret;
> -
>  =09if (int3472->clock.cl)
>  =09=09return -EBUSY;
> =20
>  =09int3472->clock.ena_gpio =3D gpio;
> =20
> -=09init.name =3D kasprintf(GFP_KERNEL, "%s-clk",
> -=09=09=09      acpi_dev_name(int3472->adev));
> -=09if (!init.name)
> -=09=09return -ENOMEM;
> -
> -=09int3472->clock.frequency =3D skl_int3472_get_clk_frequency(int3472);
> -
> -=09int3472->clock.clk_hw.init =3D &init;
> -=09int3472->clock.clk =3D clk_register(&int3472->adev->dev,
> -=09=09=09=09=09  &int3472->clock.clk_hw);
> -=09if (IS_ERR(int3472->clock.clk)) {
> -=09=09ret =3D PTR_ERR(int3472->clock.clk);
> -=09=09goto out_free_init_name;
> -=09}
> -
> -=09int3472->clock.cl =3D clkdev_create(int3472->clock.clk, NULL,
> -=09=09=09=09=09  int3472->sensor_name);
> -=09if (!int3472->clock.cl) {
> -=09=09ret =3D -ENOMEM;
> -=09=09goto err_unregister_clk;
> -=09}
> -
> -=09kfree(init.name);
> -=09return 0;
> -
> -err_unregister_clk:
> -=09clk_unregister(int3472->clock.clk);
> -out_free_init_name:
> -=09kfree(init.name);
> -
> -=09return ret;
> +=09return skl_int3472_register_clock(int3472);
>  }
> =20
>  void skl_int3472_unregister_clock(struct int3472_discrete_device *int347=
2)
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

To get rid of a few kfree()s, one could consider this additional cleanup=20
as a separate patch:

=09char *name __free(kfree) =3D kasprintf(...);
=09if (!name)
=09=09return -ENOMEM;

=09init.name =3D name;

(FYI, I won't have time to go through rest of the patch in this series=20
today.)

--=20
 i.
--8323328-1823117670-1744894320=:939--

