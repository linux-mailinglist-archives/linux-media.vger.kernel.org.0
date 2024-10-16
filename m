Return-Path: <linux-media+bounces-19761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1089A09C8
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 14:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78A76281E13
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7806208D77;
	Wed, 16 Oct 2024 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2OvrwFh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329C207A1C;
	Wed, 16 Oct 2024 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729081666; cv=none; b=UGvK1XkPqPMcXTIqqjAF1Eb6/DV/qcjQrY7Ctuy3D7hwG8HPU0Ai9oalB5MYiTa20t3X6LLD9tZyh6KC+oXnPZBBzPAcwgD2Mtr0sF6cc6Mqx53tGbnvci5MDMcdXD1haf6FyDS/UoNhSJZIaxQIlRhlsV0OFXhEC9DxUC+YrHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729081666; c=relaxed/simple;
	bh=mRrpLqfiZkFKvG4EUg662iIlRqBHsth27gwtSVwVAY4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sUNkDo1WSRBiWtPfdR/rhJUuaYnzqgzvYowvbLvkbPp7vvbDCQ0fi5JzsvKPU2KxrETYHnwfmgmMaWU1jgHPV4qSmJhSb6RutuP8cCxikzZcM4axQDFuIVZqzSEwZqDeL8RvFGNxQ5OrKJ/hW4Q3ho9XhLkfj6YO4anVCorIOqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2OvrwFh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729081665; x=1760617665;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mRrpLqfiZkFKvG4EUg662iIlRqBHsth27gwtSVwVAY4=;
  b=V2OvrwFhO79CV1ObKCKNBwM0jnl39Z8NEHrsh2MErBFQZfGCt9kYTrTy
   uBw15PJDtnxw+7OSQdtwwychrAuOFNtp0aXhoXrKJYA4OYTUgzQhMZKRi
   DAIkafYWfYd5/wHPGiwuSmZj0iyD/DHYM7XQJIVzFlneVDyVDpuuohuSS
   P4pI9hjuo1pfe3zc53V6F0LwYqsIjiRjTcrKO9ls0t8Mc2T4hsC+JCuMW
   M36PajQdoUTiPobcEAE1x/o//a30QC7EpsmblUjJ6LlUHSTwWcUbq4OqN
   LWIVezcnuvMuU3saYZLh7UOT27ryfzRS+Sbdjec12sLQ7J0rU75ifuhG1
   Q==;
X-CSE-ConnectionGUID: /VunYUANSJ6yVIqwk2pQFA==
X-CSE-MsgGUID: 3a32nx+SQM6ht5WhDitVvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45997740"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45997740"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 05:27:43 -0700
X-CSE-ConnectionGUID: KLL+A1EfSQKk+DVeGxoxnA==
X-CSE-MsgGUID: 7s6r5U5HRB2RCiVdrrJqjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78230907"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.221])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 05:27:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Oct 2024 15:27:36 +0300 (EEST)
To: Dan Scally <dan.scally@ideasonboard.com>
cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    anders.ruke@gmail.com, sakari.ailus@linux.intel.com, 
    Hans de Goede <hdegoede@redhat.com>, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 2/3] platform/x86: int3472: Add board data for Dell
 7212
In-Reply-To: <d839bbd7-c6c5-424d-9f8b-fe8d0f61e7ba@ideasonboard.com>
Message-ID: <78e5d87a-c489-dba6-9eaf-88c36bbc8a89@linux.intel.com>
References: <20241015211958.1465909-1-dan.scally@ideasonboard.com> <20241015211958.1465909-3-dan.scally@ideasonboard.com> <fcb92c2d-f422-ef97-721e-f59b5e026474@linux.intel.com> <d839bbd7-c6c5-424d-9f8b-fe8d0f61e7ba@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1805929126-1729081656=:1010"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1805929126-1729081656=:1010
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 16 Oct 2024, Dan Scally wrote:

> Afternoon - thanks for the review
>=20
> On 16/10/2024 12:58, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 15 Oct 2024, Daniel Scally wrote:
> >=20
> > > The Dell 7212 Rugged Extreme Tablet pairs an OV5670 sensor with the
> > > Intel IPU3 ISP. The sensor is powered by a TPS68470 PMIC, and so we
> > > need some board data to describe how to configure the GPIOs and
> > > regulators to run the sensor.
> > >=20
> > > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > ---
> > >   .../x86/intel/int3472/tps68470_board_data.c   | 128 +++++++++++++++=
+++
> > >   1 file changed, 128 insertions(+)
> > >=20
> > > diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > > b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > > index 322237e056f3..d28053733bd2 100644
> > > --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > > +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > > @@ -129,6 +129,109 @@ static const struct tps68470_regulator_platform=
_data
> > > surface_go_tps68470_pdata =3D
> > >   =09},
> > >   };
> > >   +/* Settings for Dell 7212 Tablet */
> > > +
> > > +static struct regulator_consumer_supply int3479_vsio_consumer_suppli=
es[]
> > > =3D {
> > > +=09REGULATOR_SUPPLY("avdd", "i2c-INT3479:00"),
> > > +};
> > > +
> > > +static struct regulator_consumer_supply int3479_aux1_consumer_suppli=
es[]
> > > =3D {
> > > +=09REGULATOR_SUPPLY("dvdd", "i2c-INT3479:00"),
> > > +};
> > > +
> > > +static struct regulator_consumer_supply int3479_aux2_consumer_suppli=
es[]
> > > =3D {
> > > +=09REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
> > > +};
> > > +
> > > +static const struct regulator_init_data
> > > dell_7212_tps68470_core_reg_init_data =3D {
> > > +=09.constraints =3D {
> > > +=09=09.min_uV =3D 1200000,
> > > +=09=09.max_uV =3D 1200000,
> > > +=09=09.apply_uV =3D 1,
> > > +=09=09.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> > > +=09},
> > > +=09.num_consumer_supplies =3D 0,
> > > +=09.consumer_supplies =3D NULL
> > Add comma to any non-terminator entry.
> Ack
> >=20
> > > +};
> > > +
> > > +static const struct regulator_init_data
> > > dell_7212_tps68470_ana_reg_init_data =3D {
> > > +=09.constraints =3D {
> > > +=09=09.min_uV =3D 2815200,
> > > +=09=09.max_uV =3D 2815200,
> > > +=09=09.apply_uV =3D 1,
> > > +=09=09.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> > > +=09},
> > > +=09.num_consumer_supplies =3D 0,
> > > +=09.consumer_supplies =3D NULL
> > > +};
> > > +
> > > +static const struct regulator_init_data
> > > dell_7212_tps68470_vcm_reg_init_data =3D {
> > > +=09.constraints =3D {
> > > +=09=09.min_uV =3D 2815200,
> > > +=09=09.max_uV =3D 2815200,
> > > +=09=09.apply_uV =3D 1,
> > > +=09=09.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> > > +=09},
> > > +=09.num_consumer_supplies =3D 0,
> > > +=09.consumer_supplies =3D NULL
> > > +};
> > This looks exactly identical to dell_7212_tps68470_ana_reg_init_data.
>=20
> It is the same currently, but only because I've not added the consumers y=
et -
> largely because the sensor/vcm combination that will consume these lines =
needs
> additional driver work anyway. When they're done I'd plan to add consumer
> definitions for these regulators too.

Fair enough. Thanks.

--
 i.

> Thanks
>=20
> Dan
>=20
> >=20
> > > +static const struct regulator_init_data
> > > dell_7212_tps68470_vio_reg_init_data =3D {
> > > +=09.constraints =3D {
> > > +=09=09.min_uV =3D 1800600,
> > > +=09=09.max_uV =3D 1800600,
> > > +=09=09.apply_uV =3D 1,
> > > +=09=09.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> > > +=09},
> > > +=09.num_consumer_supplies =3D 0,
> > > +=09.consumer_supplies =3D NULL,
> > > +};
> > > +
> > > +static const struct regulator_init_data
> > > dell_7212_tps68470_vsio_reg_init_data =3D {
> > > +=09.constraints =3D {
> > > +=09=09.min_uV =3D 1800600,
> > > +=09=09.max_uV =3D 1800600,
> > > +=09=09.apply_uV =3D 1,
> > > +=09=09.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> > > +=09},
> > > +=09.num_consumer_supplies =3D ARRAY_SIZE(int3479_vsio_consumer_suppl=
ies),
> > > +=09.consumer_supplies =3D int3479_vsio_consumer_supplies,
> > > +};
> > > +
> > > +static const struct regulator_init_data
> > > dell_7212_tps68470_aux1_reg_init_data =3D {
> > > +=09.constraints =3D {
> > > +=09=09.min_uV =3D 1213200,
> > > +=09=09.max_uV =3D 1213200,
> > > +=09=09.apply_uV =3D 1,
> > > +=09=09.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> > > +=09},
> > > +=09.num_consumer_supplies =3D ARRAY_SIZE(int3479_aux1_consumer_suppl=
ies),
> > > +=09.consumer_supplies =3D int3479_aux1_consumer_supplies,
> > > +};
> > > +
> > > +static const struct regulator_init_data
> > > dell_7212_tps68470_aux2_reg_init_data =3D {
> > > +=09.constraints =3D {
> > > +=09=09.min_uV =3D 1800600,
> > > +=09=09.max_uV =3D 1800600,
> > > +=09=09.apply_uV =3D 1,
> > > +=09=09.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> > > +=09},
> > > +=09.num_consumer_supplies =3D ARRAY_SIZE(int3479_aux2_consumer_suppl=
ies),
> > > +=09.consumer_supplies =3D int3479_aux2_consumer_supplies,
> > > +};
> > > +
> > > +static const struct tps68470_regulator_platform_data
> > > dell_7212_tps68470_pdata =3D {
> > > +=09.reg_init_data =3D {
> > > +=09=09[TPS68470_CORE] =3D &dell_7212_tps68470_core_reg_init_data,
> > > +=09=09[TPS68470_ANA]  =3D &dell_7212_tps68470_ana_reg_init_data,
> > > +=09=09[TPS68470_VCM]  =3D &dell_7212_tps68470_vcm_reg_init_data,
> > > +=09=09[TPS68470_VIO] =3D &dell_7212_tps68470_vio_reg_init_data,
> > Inconsistent spaces.
> >=20
>=20
--8323328-1805929126-1729081656=:1010--

