Return-Path: <linux-media+bounces-43007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0451B98782
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 09:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E02DC4A1858
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 07:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2195F26A0D0;
	Wed, 24 Sep 2025 07:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="JQEGwDau"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B29421D3F3
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 07:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758697600; cv=none; b=IAuUdIl4upHY/RBTqu5ctZeAgkIB+zgrz/UIf+F121fpkZs5iRqRI3HJNOj2qZC7FM5v6BkzkrmUV0qzDQZTP/DuijZW0dLcSIIlKd8aW5x1pLiFetxkGSW74U1sXKCGM0Du24C4LE8Mpc95gF1kLAV9gEXiG3Ntf9qrEteSouM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758697600; c=relaxed/simple;
	bh=oUBI0d3ZCPt2cKz33OPp6FqJ544oXGlHTr6GYFfd2Eg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fBcoEgsg4iDzpo8J7x6Za5HQQYv3zzjhIBW1rCWAkXgOTPIQ8CsvbbexZFkw4Q2F6mNKicbH5uL1S9CtiIztKUCo2b8hyRIdiiKGG9B8KIDIvwiuWD01rNWDN5kPR5+NqlbCFkaq51PCIpNjhaRzTwumrR1GTJjCnb8rU3lnjy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=JQEGwDau; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1758697595; x=1758956795;
	bh=oUBI0d3ZCPt2cKz33OPp6FqJ544oXGlHTr6GYFfd2Eg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JQEGwDauamSP06vMSMY1DMfsSkFwx7RaNvh/HN29DRdORKqk7yYYCEusoJSOBAE5s
	 QFdMn3tLtroiCDdGvdLrDVX4enje5bGGFTZ0QY9sEd+nfP+gz9hH3aRSTbVO5pgT7Q
	 tiXFBKFFkH6vqbc6b9GdlA70G1H5iRhdT9z2URuqZOKzZ2NrZD1VAWyJVN3hQhL2da
	 N/UVCvVVAxtXZGzBUGlBH3qV7NA54zaLeb/mVvpSQ/xI2CTmm4s/lI163/GE0qw925
	 twwXSpVs4xp0Y9HBKXNSQ7fvdT1RPaJFLObE+wRputMzzpUDEgzcKIwZmZ8dYO7m0v
	 ge/F2uXp4Bvng==
Date: Wed, 24 Sep 2025 07:06:28 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/1] media: v4l2-subdev / pdx86: int3472: Use "privacy" as con_id for the privacy LED
Message-ID: <qWUcwd3SUhjavnDhfi9XGxQGsawpzg7ULgHBZllrjxgmELw17JPeZYZuN4bc_VvmoVzd73AmdyZfOcWyFzTvdYUNOG_ORuJhlzPgkxdyN-A=@vinarskis.com>
In-Reply-To: <ccdf3f79-b1ad-a7cd-5e40-0fb8f70d05d4@linux.intel.com>
References: <20250910104702.7470-1-hansg@kernel.org> <20250910104702.7470-2-hansg@kernel.org> <ccdf3f79-b1ad-a7cd-5e40-0fb8f70d05d4@linux.intel.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: a1fd173f53acf0b3a8a394808529889eb080dfeb
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wednesday, September 10th, 2025 at 12:51, Ilpo J=C3=A4rvinen <ilpo.jarvi=
nen@linux.intel.com> wrote:

>=20
>=20
> On Wed, 10 Sep 2025, Hans de Goede wrote:
>=20
> > During DT-binding review for extending the V4L2 camera sensor privacy L=
ED
> > support to systems using devicetree, it has come up that having a "-led=
"
> > suffix for the LED name / con_id is undesirable since it already is cle=
ar
> > that it is a LED.
> >=20
> > Drop the "-led" suffix from the con_id in both the lookup table in
> > the int3472 code, as well as from the con_id led_get() argument in
> > the v4l2-subdev code.
> >=20
> > Signed-off-by: Hans de Goede hansg@kernel.org
> > ---
> > drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
> > drivers/platform/x86/intel/int3472/led.c | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2=
-core/v4l2-subdev.c
> > index 113eb74eb7c1..babcc1120354 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -2602,7 +2602,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_is_streaming);
> > int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd)
> > {
> > #if IS_REACHABLE(CONFIG_LEDS_CLASS)
> > - sd->privacy_led =3D led_get(sd->dev, "privacy-led");
> > + sd->privacy_led =3D led_get(sd->dev, "privacy");
> > if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) !=3D -ENOENT)
> > return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led),
> > "getting privacy LED\n");
> > diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platfor=
m/x86/intel/int3472/led.c
> > index f1d6d7b0cb75..b1d84b968112 100644
> > --- a/drivers/platform/x86/intel/int3472/led.c
> > +++ b/drivers/platform/x86/intel/int3472/led.c
> > @@ -43,7 +43,7 @@ int skl_int3472_register_pled(struct int3472_discrete=
_device *int3472, struct gp
> >=20
> > int3472->pled.lookup.provider =3D int3472->pled.name;
> > int3472->pled.lookup.dev_id =3D int3472->sensor_name;
> > - int3472->pled.lookup.con_id =3D "privacy-led";
> > + int3472->pled.lookup.con_id =3D "privacy";
> > led_add_lookup(&int3472->pled.lookup);
> >=20
> > return 0;
>=20
>=20
> Acked-by: Ilpo J=C3=A4rvinen ilpo.jarvinen@linux.intel.com
>=20

Hi all,

Anything still pending before this patch can land? As DT-binding change tha=
t requires this [1] is already in linux-next it would be nice to land this =
in the same cycle.

Thanks,
Alex

[1] https://lore.kernel.org/all/20250910-leds-v5-0-bb90a0f897d5@vinarskis.c=
om/

>=20
> --
> i.

