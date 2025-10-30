Return-Path: <linux-media+bounces-45962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CE3C1E826
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 07:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E0C618920EB
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 06:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51D23148DB;
	Thu, 30 Oct 2025 06:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="utU8PCoz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FA42F12DA;
	Thu, 30 Oct 2025 06:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761804480; cv=none; b=kxtVI4FW9pbq0K6ZAwK+P9NcS1e8PuLSANxctkBWqfbkbszw8Lp2zhmIBtEUPmHSXuLFkFi5md1rqHJxBgHPGF+w+UltLNa0Gbh/xMsiTTERIdfxxnHfiMBTmBJEO1pRodv5PzuNQ8CFskZOsjk7pzH9IufTBCr+MtrB1LJaTi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761804480; c=relaxed/simple;
	bh=zczIPpc0KWPLn9zXQ3ZoaFjpPTnJbDtjuzfwpUxJB5g=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=f2oAMJqPk43to7ruwInIRO7GNZouAVgtpFDfVh1SH2DlqriBav616GkGsFOu8FbI8tbe+cuCp8//pLkMIQ3BCdTE8j1qAImeXIr6tbjxR26q0rJUJpkWCtpsSFpECws5S83YerVhiSO/+hGdw/w7jrxK41u8aEuHVB43lahaZ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=utU8PCoz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 288606F3;
	Thu, 30 Oct 2025 07:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761804365;
	bh=zczIPpc0KWPLn9zXQ3ZoaFjpPTnJbDtjuzfwpUxJB5g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=utU8PCozLh0qFegg5Nivf//IQXFEM+4PC1QnaSa/h+a6JbDTaYTYLxGu0Q3DGXyyv
	 5PGAPDv54VigbM7G5oo95YrpViI3Esw5yrv5AlmdiprhtjmsExFtl5gkDhNebvvf1f
	 SQUhgj6Rc/X9mlyVqim1fr2K5p+HsTQeoc8p4hSA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202510290816.8EQhDjD8-lkp@intel.com>
References: <20251028-b4-rpi-ov5647-v1-4-098413454f5e@ideasonboard.com> <202510290816.8EQhDjD8-lkp@intel.com>
Subject: Re: [PATCH 04/13] media: i2c: ov5647: Fix v4l2-compliance failure subscribing to events
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Ivan T. Ivanov <iivanov@suse.de>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, kernel test robot <lkp@intel.com>
Date: Thu, 30 Oct 2025 11:37:49 +0530
Message-ID: <176180446968.8690.15499732608328141859@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Quoting kernel test robot (2025-10-29 06:27:53)
> Hi Jai,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/media-i=
2c-ov5647-Parse-and-register-properties/20251028-153619
> base:   3a8660878839faadb4f1a6dd72c3179c1df56787
> patch link:    https://lore.kernel.org/r/20251028-b4-rpi-ov5647-v1-4-0984=
13454f5e%40ideasonboard.com
> patch subject: [PATCH 04/13] media: i2c: ov5647: Fix v4l2-compliance fail=
ure subscribing to events
> config: sparc64-randconfig-r134-20251029 (https://download.01.org/0day-ci=
/archive/20251029/202510290816.8EQhDjD8-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d=
1c086e82af239b245fe8d7832f2753436634990)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251029/202510290816.8EQhDjD8-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510290816.8EQhDjD8-lkp=
@intel.com/
>=20
> sparse warnings: (new ones prefixed by >>)
> >> drivers/media/i2c/ov5647.c:870:10: sparse: sparse: Initializer entry d=
efined twice
>    drivers/media/i2c/ov5647.c:876:10: sparse:   also defined here

My bad, this patch is already mainlined. I will drop it in next iteration.

>=20
> vim +870 drivers/media/i2c/ov5647.c
>=20
> 3c2472a3c54895 Ramiro Oliveira 2017-03-22  867 =20
> c9a05cece64c60 Jacopo Mondi    2020-11-19  868  /* Subdev core operations=
 registration */
> 3c2472a3c54895 Ramiro Oliveira 2017-03-22  869  static const struct v4l2_=
subdev_core_ops ov5647_subdev_core_ops =3D {
> dc3373081396f5 Jacopo Mondi    2020-11-19 @870          .subscribe_event =
       =3D v4l2_ctrl_subdev_subscribe_event,
> dc3373081396f5 Jacopo Mondi    2020-11-19  871          .unsubscribe_even=
t      =3D v4l2_event_subdev_unsubscribe,
> 3c2472a3c54895 Ramiro Oliveira 2017-03-22  872  #ifdef CONFIG_VIDEO_ADV_D=
EBUG
> 3c2472a3c54895 Ramiro Oliveira 2017-03-22  873          .g_register      =
       =3D ov5647_sensor_get_register,
> 3c2472a3c54895 Ramiro Oliveira 2017-03-22  874          .s_register      =
       =3D ov5647_sensor_set_register,
> 3c2472a3c54895 Ramiro Oliveira 2017-03-22  875  #endif
> d812c6225cf5be David Plowman   2025-10-28  876          .subscribe_event =
=3D v4l2_ctrl_subdev_subscribe_event,
> d812c6225cf5be David Plowman   2025-10-28  877          .unsubscribe_even=
t =3D v4l2_event_subdev_unsubscribe,
> 3c2472a3c54895 Ramiro Oliveira 2017-03-22  878  };
> 3c2472a3c54895 Ramiro Oliveira 2017-03-22  879 =20
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks,
    Jai

