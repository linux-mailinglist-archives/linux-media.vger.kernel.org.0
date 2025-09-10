Return-Path: <linux-media+bounces-42183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A268FB51483
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FFC05433C0
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA33316907;
	Wed, 10 Sep 2025 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5/Pju/3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D732D5951;
	Wed, 10 Sep 2025 10:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501510; cv=none; b=hqwBZExxTvZ8fCWkVQ9Fw1Sy+F0qi697ZSYFBxDgsJ6bDVnDmfYml4R80Q4PbE9VTt6NO1sruy8tmmGjkF7gSuZlnJ4tX+zCEV+cdnxtM9dtCoUN82TOiRaOo0F5qvP71Z2a/irmAN40dUMuiY6w+KV5TLMpyLICt4mvJgGldh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501510; c=relaxed/simple;
	bh=ePdXqVMZSz5llJU4ribehyUQ2FnGPGZQoFQ+CqoIb/k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DN8nazXP1iM6NbsrNiy3zF8b3wCIXXGWaUXdbE5hzLUCdTYg9WJFhgYfekR7GLzxHIhej3MQZACIGn1tw2LhZ9j2tMai4fWdBTGWqLq6sMd3kApCSgEDasM7c8tXQlKx7mEMs0hVka4Oprz27sdDUwoY5C1ICo1YOZqijTzqA7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5/Pju/3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757501509; x=1789037509;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ePdXqVMZSz5llJU4ribehyUQ2FnGPGZQoFQ+CqoIb/k=;
  b=G5/Pju/3hkKnJjtbHo4FK1y+J4Mqe2Vg1I/94xq1Wo4uj6+yRiOapaKI
   7tvBVkBNXrGqo11y3P3RiLLoDo3f7vLKLEE2mEdgMzlnrt4yook46YPac
   MLwTfjsOtZmKIwrkInAjyqXZDiEOhhOwQ9Y6AssuDp0Du/zLQB/7RW+Vx
   NLXTjihH/Oh+MCKmA2QRbsnMbr/WD/YnsuIU56hz9THyyLbT+aCPWM5eo
   NGY4WiZW5r+Xh/nkHxZBFDzrdD+7hHRGTGZKxolL1ub8hw6Tp2uGHK+02
   AcScqjxyh+oUS+oYvAST902EyLwnVQWLjTOtmYZF4KZZLRcc0BMPk0AX0
   g==;
X-CSE-ConnectionGUID: WMd+lfqqT86roG7qWz9Ikg==
X-CSE-MsgGUID: o/R3Swh+RIGYIIUnfm6X1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59914429"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="59914429"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 03:51:46 -0700
X-CSE-ConnectionGUID: 8iWd5USLQRSSgYqOYIb4QA==
X-CSE-MsgGUID: YPg9Uj0MQCaPmKaQof8xxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="173193655"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.59])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 03:51:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Sep 2025 13:51:39 +0300 (EEST)
To: Hans de Goede <hansg@kernel.org>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Aleksandrs Vinarskis <alex@vinarskis.com>, 
    platform-driver-x86@vger.kernel.org, 
    Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] media: v4l2-subdev / pdx86: int3472: Use "privacy"
 as con_id for the privacy LED
In-Reply-To: <20250910104702.7470-2-hansg@kernel.org>
Message-ID: <ccdf3f79-b1ad-a7cd-5e40-0fb8f70d05d4@linux.intel.com>
References: <20250910104702.7470-1-hansg@kernel.org> <20250910104702.7470-2-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1252060198-1757501499=:937"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1252060198-1757501499=:937
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 10 Sep 2025, Hans de Goede wrote:

> During DT-binding review for extending the V4L2 camera sensor privacy LED
> support to systems using devicetree, it has come up that having a "-led"
> suffix for the LED name / con_id is undesirable since it already is clear
> that it is a LED.
>=20
> Drop the "-led" suffix from the con_id in both the lookup table in
> the int3472 code, as well as from the con_id led_get() argument in
> the v4l2-subdev code.
>=20
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c    | 2 +-
>  drivers/platform/x86/intel/int3472/led.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-c=
ore/v4l2-subdev.c
> index 113eb74eb7c1..babcc1120354 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2602,7 +2602,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_is_streaming);
>  int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd)
>  {
>  #if IS_REACHABLE(CONFIG_LEDS_CLASS)
> -=09sd->privacy_led =3D led_get(sd->dev, "privacy-led");
> +=09sd->privacy_led =3D led_get(sd->dev, "privacy");
>  =09if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) !=3D -ENOENT)
>  =09=09return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led),
>  =09=09=09=09     "getting privacy LED\n");
> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/=
x86/intel/int3472/led.c
> index f1d6d7b0cb75..b1d84b968112 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -43,7 +43,7 @@ int skl_int3472_register_pled(struct int3472_discrete_d=
evice *int3472, struct gp
> =20
>  =09int3472->pled.lookup.provider =3D int3472->pled.name;
>  =09int3472->pled.lookup.dev_id =3D int3472->sensor_name;
> -=09int3472->pled.lookup.con_id =3D "privacy-led";
> +=09int3472->pled.lookup.con_id =3D "privacy";
>  =09led_add_lookup(&int3472->pled.lookup);
> =20
>  =09return 0;
>=20

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1252060198-1757501499=:937--

