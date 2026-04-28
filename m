Return-Path: <linux-media+bounces-59757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC2LKWky8Gm3PgEAu9opvQ
	(envelope-from <linux-media+bounces-59757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 06:07:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4AF47D55E
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 06:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C43130416F6
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 04:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C5831AAAF;
	Tue, 28 Apr 2026 04:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="McFxfwEO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OXq1yesh"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F7621B9F6
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 04:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777349144; cv=pass; b=QF6Y7MUB9HCej+R3HeXjZ0byJ2wlHIPCDDJMjlYivnF1xGGDQWYmbNpkf4fKn106Nz99sSDaOlwsk4mc/AR7C9oruSqUmOGm+yySJnPDV11hoGem2tNLCG/NwF34+tFIfS5VZ7YJyII2rYxJTfCJIpyehUvDD/izcjKZd647zA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777349144; c=relaxed/simple;
	bh=IRqEX/bpdjwsQa2vC9uhFVT/skLnExJfi+mc+Y+hzXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LbbZIoA8yQVPHFggY5/cxrYi7jBoLofVhIEkVkFyz361xS0AFPCZewpPpJdnJVj/ensXwr3FyOqonjNt7Dc50yt0gtBeSAeLKtXg67/P9B2FXWUTLNUbHQQfLNwG9CAsIox1ZlSu6ROYUEVYEluEgiDQAA2nbkhv0UUYZcf2TNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=McFxfwEO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OXq1yesh; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777349141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZt56sIKZuKDikbS2FQmtgQ7DCReL1SsEjAtvwPQSv4=;
	b=McFxfwEOJpX6hpJ06Yh+JQO6vHX0gauVPLJYpzuO4S11GqoqKG/qzvPpCd4eOuUs/lqb9o
	ImoSd7tuuIhmTuyNvU2BDXPhf+jTiqCHb5Z6CvCcZrjaW2jPY7Gg5/uHXWVCP4AK1bgs4h
	WzzjNWiu//dBhRrXkxb0y/fS6mFfn3E=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-f8lQdQ78OTeTMHfXXYYecA-1; Tue, 28 Apr 2026 00:05:38 -0400
X-MC-Unique: f8lQdQ78OTeTMHfXXYYecA-1
X-Mimecast-MFC-AGG-ID: f8lQdQ78OTeTMHfXXYYecA_1777349138
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6948eac3522so14837825eaf.3
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 21:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777349138; cv=none;
        d=google.com; s=arc-20240605;
        b=GY8H14FkqN78Coy+OuwaY9xEUbKUIC8fs2sHXJKMcyBKVpgD/OAxlAEpjlfKWOPbFP
         e2y7My9nbDsqmfe+k5o8SwQAuH/F2RGQcHAr4LiXbuCTqHD26f8BZNLazmiVKyokKGjg
         qoEtGIK8j4zQ6nCMK+Yl1J3aRaZNfivd3BHbEpQBqA2rE1qlm+I+pdozjMFEteBhtQUM
         xVHn0RNse0s8JdHpt7vcpVq1GEOytqtI5ebGjUWqe7Ax6OcfTqqLmHfz2M/1gTzV9376
         KihPaNGz7LfHmVN+7R+4LJzKc7ZuYS55vblHMKfOAzURJmwnTttBROzBxUIIjUFZsEHN
         z0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZt56sIKZuKDikbS2FQmtgQ7DCReL1SsEjAtvwPQSv4=;
        fh=ZpZnLPV7V0nCE5J++4ax3O9fOD7Nl4FTizpVcSIGmb8=;
        b=ghOhnoQIRcGn+aGeuVEkLfWXGmAOaPNqRiVrAvgjNC2XOBiZdh4Z0Iu3r4uB/2QI4y
         +aa3hFwVHen9GIiIAlX5QLU+X7GMHI+YDUNi0NSOCVaYJwc1iVUXS13mnxnR4aGdZvci
         G54RGF4CuFdY0mMOt9rHREIYndSVzwyMkBS0Ru0Ea//+QB4fLmmGr+8aezbOS1SkOKCa
         3jGBCZtS5IrUrRFcwCQ1MF9B81t5hOQF6N3pqj5fjWUAjYj3VA5tOPWI2G5Gi3fBKhxt
         k8cyg7beUeDC9WuL324fpbNyIdPvvPBQgs+AiouO22dnvbBwjwBXxRhNukI+PR9Wb1lv
         d5eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777349138; x=1777953938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZt56sIKZuKDikbS2FQmtgQ7DCReL1SsEjAtvwPQSv4=;
        b=OXq1yeshz/G6EAqUqIqIaOJy1ZXMYK6ExQcRK1QqZePyLOvKmVJTpXVKt3YSd2nTLj
         Xt78G8LHqx+6WlEDgOe2UJR0beWlR5qX0UOoiaQfhp+r1M7rj2HQ3Aef8kKOQE/jXQTo
         0UlNstvPz7oHPclHmFJppDZP6er2+KPt9o3cXyQxAwh1sn0Xx6GLObd6i6NLVzH4YSPe
         t+47Hd51xwZNXPIeaW/McV2GC4mtV3dPx1NZZ8dresCEytW520tylrJO8PWA/SS1fLfM
         HCH5N6+ovHA9ePlT0shwZThhtwxwcVS7ky5LS1OLSlOAPRw1PwaDtlzVxx7PC37SogqU
         6fnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777349138; x=1777953938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZt56sIKZuKDikbS2FQmtgQ7DCReL1SsEjAtvwPQSv4=;
        b=Q8VVLi3j83S3ndqaSpiFFeEs2wOd6bvg2R2F69O3Yn3G1flB1kc65rRapprmBTPHaw
         TJ11Xo2ORuK2Zv/Mu3NcGa5gGss1WgCGUG8jgWpL1LosVBgByeFqtiH0cbZvEAxkiU9B
         MlAGMLAlEggqZlxY3Qdw93v+Qs7in+ihNrHY0E7GY9PB6YwgeIsT+7vfKjlFdF84RXxw
         Cr9bpGut3AntISZQlmy0Y5lPZpNTuAwxuH76lIOOHhmi8dv5cadfMmEky3vPYZEocqwX
         G/owEHNhhjt9+qPr1TlJI6JEYkbUQDaQyGevhVZ4wYqQPdb8dviwAcOYJddiiGjzS41G
         /GNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2pCXjU9/xmVGuars90T4wqbOAPgYe3WBM2yuLlZwEtzozdN2ZcUOQTQqp6mMbSK9VgHKglu8GBamR+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6jrZxdFBbcAualZn7qFX+Gjha6NLFtNJuFK4KYy3yKgfaDNY
	mDDqX/FAOfMMnQcVb6x1jQfxN9TJ0+5yh5Zufqe77STHhstF1mozzPtHmsR7lZFNBy47dy4g9Rr
	jF08C0K/Gg5pbYrTbrpFDZd4E50/TJbG4F9ToY94xh+Xe5ARWrGbn68R0DUQieo48czihIpqddA
	wXUTkfNS4MDy4CuZ/r8YtV/eAF6LxYbbMyHG/q7RZdOv2EXHLza8qi
X-Gm-Gg: AeBDiet8ShvKZt3LJwoSKyhLFDTafFmtXTNo4cmxt26pkDqGZ8WCUXRLEIeHwKWK/GN
	aiLA4Y7uZbtvTV3THnYY70hbqKbQX1/Es9Nxb8zymnJNvxGyMevSpNBEdpEy7zxSKB4CwHygKho
	0ZrTzxXp/DmGi+mmE8/OHbBor26rLPUDySQadZCYHv0hjsLgqHk+PQoBt6QF5D1Kt8qz7U3tFd9
	IoVk3ozHpiY4nvT
X-Received: by 2002:a05:6820:6ad0:b0:694:8e29:a920 with SMTP id 006d021491bc7-6965cb3a3f9mr737438eaf.39.1777349137233;
        Mon, 27 Apr 2026 21:05:37 -0700 (PDT)
X-Received: by 2002:a05:6820:6ad0:b0:694:8e29:a920 with SMTP id
 006d021491bc7-6965cb3a3f9mr737430eaf.39.1777349136586; Mon, 27 Apr 2026
 21:05:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417083214.222189-1-hpa@redhat.com> <20260417083214.222189-3-hpa@redhat.com>
 <aedCF8LqEnl-IdhB@kekkonen.localdomain>
In-Reply-To: <aedCF8LqEnl-IdhB@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 28 Apr 2026 12:05:23 +0800
X-Gm-Features: AVHnY4LZaLMw4VdQUB9w7CPdYAYJrpaGMUI88qEo6i7lLGKc2CEl-c7KnbVcyGQ
Message-ID: <CAEth8oFXBFHn+Da5tB83sqOJ-b6+PbPiUA3M0+=0R2_476PwCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Serin Yeh <serin.yeh@intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CF4AF47D55E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-59757-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]

Hi Sakari

Thank you for the review.

On Tue, Apr 21, 2026 at 5:23=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> Thanks for the patch.
>
> On Fri, Apr 17, 2026 at 04:32:14PM +0800, Kate Hsuan wrote:
> > Add a new driver for Sony imx471 camera sensor. It is based on
> > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be foun=
d
> > in the following URL.
> > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/=
imx471.c
> >
> > This sensor can be found on Lenovo X9-14 and X9-15 laptop and it is a p=
art
> > of IPU7 solution. The driver was tested on Lenovo X9-14 and X9-15 lapto=
ps.
> >
> > Link: https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i=
2c/imx471.c
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2454119
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  MAINTAINERS                |    7 +
> >  drivers/media/i2c/Kconfig  |   10 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/imx471.c | 1047 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1065 insertions(+)
> >  create mode 100644 drivers/media/i2c/imx471.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1126fdd639ad..9a2b3cc799e1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24735,6 +24735,13 @@ T:   git git://linuxtv.org/media.git
> >  F:   Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> >  F:   drivers/media/i2c/imx415.c
> >
> > +SONY IMX471 SENSOR DRIVER
> > +M:   Kate Hsuan <hpa@redhat.com>
> > +L:   linux-media@vger.kernel.org
> > +S:   Maintained
> > +T:   git git://linuxtv.org/media.git
>
> Please drop T: as you have no commit access to the tree.
Okay

>
> > +F:   drivers/media/i2c/imx471.c
> > +
> >  SONY MEMORYSTICK SUBSYSTEM
> >  M:   Maxim Levitsky <maximlevitsky@gmail.com>
> >  M:   Alex Dubov <oakad@yahoo.com>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 5eb1e0e0a87a..1c28c498a9f1 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -287,6 +287,16 @@ config VIDEO_IMX415
> >         To compile this driver as a module, choose M here: the
> >         module will be called imx415.
> >
> > +config VIDEO_IMX471
> > +             tristate "Sony IMX471 sensor support"
> > +             select V4L2_CCI_I2C
> > +             help
> > +               This is a Video4Linux2 sensor driver for the Sony
> > +               IMX471 camera.
> > +
> > +               To compile this driver as a module, choose M here: the
> > +               module will be called imx471.
> > +
> >  config VIDEO_MAX9271_LIB
> >       tristate
> >
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index a3a6396df3c4..0539e9171030 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -61,6 +61,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o
> >  obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o
> >  obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
> >  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
> > +obj-$(CONFIG_VIDEO_IMX471) +=3D imx471.o
> >  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
> >  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
> >  obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o
> > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > new file mode 100644
> > index 000000000000..32a105a60731
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx471.c
> > @@ -0,0 +1,1047 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (C) 2025 Intel Corporation
> > +
> > +#include <linux/version.h>
>
> Is this needed?
No need, and it can be dropped.
>
> > +#include <linux/unaligned.h>
> > +#include <linux/acpi.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
>
> Alphabetical order, please.
sure

>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +
> > +#define IMX471_REG_MODE_SELECT               CCI_REG8(0x0100)
> > +#define IMX471_MODE_STANDBY          0x00
> > +#define IMX471_MODE_STREAMING                0x01
> > +
> > +/* Chip ID */
> > +#define IMX471_REG_CHIP_ID           CCI_REG16(0x0016)
> > +#define IMX471_CHIP_ID                       0x0471
> > +
> > +/* V_TIMING internal */
> > +#define IMX471_REG_FLL                       CCI_REG16(0x0340)
> > +#define IMX471_FLL_MAX                       0xffff
> > +
> > +/* Exposure control */
> > +#define IMX471_REG_EXPOSURE          CCI_REG16(0x0202)
> > +#define IMX471_EXPOSURE_MIN          1
> > +#define IMX471_EXPOSURE_STEP         1
> > +#define IMX471_EXPOSURE_DEFAULT              0x04f6
> > +
> > +/*
> > + *  the digital control register for all color control looks like:
> > + *  +-----------------+------------------+
> > + *  |      [7:0]      |       [15:8]     |
> > + *  +-----------------+------------------+
> > + *  |          0x020f      |       0x020e     |
> > + *  --------------------------------------
> > + *  it is used to calculate the digital gain times value(integral + fr=
actional)
> > + *  the [15:8] bits is the fractional part and [7:0] bits is the integ=
ral
> > + *  calculation equation is:
> > + *      gain value (unit: times) =3D REG[15:8] + REG[7:0]/0x100
> > + *  Only value in 0x0100 ~ 0x0FFF range is allowed.
> > + *  Analog gain use 10 bits in the registers and allowed range is 0 ~ =
960
> > + */
> > +/* Analog gain control */
> > +#define IMX471_REG_ANALOG_GAIN                       CCI_REG16(0x0204)
> > +#define IMX471_ANA_GAIN_MIN                  0
> > +#define IMX471_ANA_GAIN_MAX                  960
> > +#define IMX471_ANA_GAIN_STEP                 1
> > +#define IMX471_ANA_GAIN_DEFAULT                      0
> > +
> > +/* Digital gain control */
> > +#define IMX471_REG_DPGA_USE_GLOBAL_GAIN              CCI_REG16(0x3ff9)
> > +#define IMX471_REG_DIG_GAIN_GLOBAL           CCI_REG16(0x020e)
> > +#define IMX471_DGTL_GAIN_MIN                 256
> > +#define IMX471_DGTL_GAIN_MAX                 4095
> > +#define IMX471_DGTL_GAIN_STEP                        1
> > +#define IMX471_DGTL_GAIN_DEFAULT             256
> > +
> > +#define IMX471_VALUE_08BIT                   1
> > +
> > +/* HFLIP and VFLIP control */
> > +#define IMX471_REG_ORIENTATION                       CCI_REG8(0x0101)
> > +#define IMX471_HFLIP_BIT                     BIT(0)
> > +#define IMX471_VFLIP_BIT                     BIT(1)
> > +
> > +/* Default exposure margin */
> > +#define IMX471_EXPOSURE_MARGIN                       18
> > +
> > +/* Horizontal crop window offset */
> > +#define IMX471_REG_H_WIN_OFFSET                      CCI_REG8(0x0409)
> > +
> > +/* Vertical crop window offset */
> > +#define IMX471_REG_V_WIN_OFFSET                      CCI_REG8(0x034b)
> > +
> > +/* Test Pattern Control */
> > +#define IMX471_REG_TEST_PATTERN                      CCI_REG8(0x0600)
> > +#define IMX471_TEST_PATTERN_DISABLED         0
> > +#define IMX471_TEST_PATTERN_SOLID_COLOR              1
> > +#define IMX471_TEST_PATTERN_COLOR_BARS               2
> > +#define IMX471_TEST_PATTERN_GRAY_COLOR_BARS  3
> > +#define IMX471_TEST_PATTERN_PN9                      4
> > +
> > +/* default link frequency and external clock */
> > +#define IMX471_LINK_FREQ_DEFAULT             200000000LL
> > +#define IMX471_EXT_CLK                               19200000
> > +#define IMX471_LINK_FREQ_INDEX                       0
> > +
> > +#define to_imx471_data(_sd) container_of_const(_sd, \
> > +                                            struct imx471_data, sd)
> > +
> > +/* Mode : resolution and related config&values */
> > +struct imx471_mode {
> > +     /* Frame width */
> > +     u32 width;
> > +     /* Frame height */
> > +     u32 height;
> > +
> > +     /* V-timing */
> > +     u32 fll_def;
> > +     u32 fll_min;
> > +
> > +     /* H-timing */
> > +     u32 llp;
> > +
> > +     /* index of link frequency */
> > +     u32 link_freq_index;
> > +
> > +     /* Default register values */
> > +     const struct cci_reg_sequence *default_mode_regs;
> > +     const int default_mode_regs_length;
> > +};
> > +
> > +struct imx471_data {
> > +     struct v4l2_subdev sd;
> > +     struct media_pad pad;
> > +
> > +     struct v4l2_ctrl_handler ctrl_handler;
> > +     /* V4L2 Controls */
> > +     struct v4l2_ctrl *link_freq;
> > +     struct v4l2_ctrl *pixel_rate;
> > +     struct v4l2_ctrl *vblank;
> > +     struct v4l2_ctrl *hblank;
> > +     struct v4l2_ctrl *exposure;
> > +
> > +     struct gpio_desc *reset_gpio;
> > +     struct regulator *avdd;
> > +     struct clk *img_clk;
> > +
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +
> > +     /* Current mode */
> > +     const struct imx471_mode *cur_mode;
>
> Could you rely on sub-device state instead?
Okay.

>
> > +
> > +     int streaming;
> > +     int rotation;
> > +     int hflip_initialized;
>
> The controls that can't be changed while streaming can be grabbed. You ca=
n
> also access the control values (struct v4l2_ctrl field val).
This can be dropped. I'll rework the flip control.

>
> > +
> > +     /*
> > +      * Mutex for serialized access:
> > +      * Protect sensor set pad format and start/stop streaming safely.
> > +      * Protect access to sensor v4l2 controls.
> > +      */
> > +     struct mutex lock;
>
> Please rely on sub-device state instead of adding your own mutex. You can
> set the state mutex from the control handler; see imx219 for an example.

Okay.

>
> > +
> > +     /* True if the device has been identified */
> > +     bool identified;
> > +};
> > +
> > +static const struct cci_reg_sequence imx471_global_regs[] =3D {
> > +     { CCI_REG8(0x0136), 0x13 },
> > +     { CCI_REG8(0x0137), 0x33 },
> > +     { CCI_REG8(0x3c7e), 0x08 },
> > +     { CCI_REG8(0x3c7f), 0x05 },
> > +     { CCI_REG8(0x3e35), 0x00 },
> > +     { CCI_REG8(0x3e36), 0x00 },
> > +     { CCI_REG8(0x3e37), 0x00 },
> > +     { CCI_REG8(0x3f7f), 0x01 },
> > +     { CCI_REG8(0x4431), 0x04 },
> > +     { CCI_REG8(0x531c), 0x01 },
> > +     { CCI_REG8(0x531d), 0x02 },
> > +     { CCI_REG8(0x531e), 0x04 },
> > +     { CCI_REG8(0x5928), 0x00 },
> > +     { CCI_REG8(0x5929), 0x2f },
> > +     { CCI_REG8(0x592a), 0x00 },
> > +     { CCI_REG8(0x592b), 0x85 },
> > +     { CCI_REG8(0x592c), 0x00 },
> > +     { CCI_REG8(0x592d), 0x32 },
> > +     { CCI_REG8(0x592e), 0x00 },
> > +     { CCI_REG8(0x592f), 0x88 },
> > +     { CCI_REG8(0x5930), 0x00 },
> > +     { CCI_REG8(0x5931), 0x3d },
> > +     { CCI_REG8(0x5932), 0x00 },
> > +     { CCI_REG8(0x5933), 0x93 },
> > +     { CCI_REG8(0x5938), 0x00 },
> > +     { CCI_REG8(0x5939), 0x24 },
> > +     { CCI_REG8(0x593a), 0x00 },
> > +     { CCI_REG8(0x593b), 0x7a },
> > +     { CCI_REG8(0x593c), 0x00 },
> > +     { CCI_REG8(0x593d), 0x24 },
> > +     { CCI_REG8(0x593e), 0x00 },
> > +     { CCI_REG8(0x593f), 0x7a },
> > +     { CCI_REG8(0x5940), 0x00 },
> > +     { CCI_REG8(0x5941), 0x2f },
> > +     { CCI_REG8(0x5942), 0x00 },
> > +     { CCI_REG8(0x5943), 0x85 },
> > +     { CCI_REG8(0x5f0e), 0x6e },
> > +     { CCI_REG8(0x5f11), 0xc6 },
> > +     { CCI_REG8(0x5f17), 0x5e },
> > +     { CCI_REG8(0x7990), 0x01 },
> > +     { CCI_REG8(0x7993), 0x5d },
> > +     { CCI_REG8(0x7994), 0x5d },
> > +     { CCI_REG8(0x7995), 0xa1 },
> > +     { CCI_REG8(0x799a), 0x01 },
> > +     { CCI_REG8(0x799d), 0x00 },
> > +     { CCI_REG8(0x8169), 0x01 },
> > +     { CCI_REG8(0x8359), 0x01 },
> > +     { CCI_REG8(0x9302), 0x1e },
> > +     { CCI_REG8(0x9306), 0x1f },
> > +     { CCI_REG8(0x930a), 0x26 },
> > +     { CCI_REG8(0x930e), 0x23 },
> > +     { CCI_REG8(0x9312), 0x23 },
> > +     { CCI_REG8(0x9316), 0x2c },
> > +     { CCI_REG8(0x9317), 0x19 },
> > +     { CCI_REG8(0xb046), 0x01 },
> > +     { CCI_REG8(0xb048), 0x01 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_1928x1088_regs[] =3D {
> > +     { CCI_REG8(0x0101), 0x00 },
> > +     { CCI_REG8(0x0112), 0x0a },
> > +     { CCI_REG8(0x0113), 0x0a },
> > +     { CCI_REG8(0x0114), 0x03 },
> > +     { CCI_REG8(0x0342), 0x0a },
> > +     { CCI_REG8(0x0343), 0x00 },
> > +     { CCI_REG8(0x0340), 0x13 },
> > +     { CCI_REG8(0x0341), 0xb0 },
> > +     { CCI_REG8(0x0344), 0x00 },
> > +     { CCI_REG8(0x0345), 0x00 },
> > +     { CCI_REG8(0x0346), 0x01 },
> > +     { CCI_REG8(0x0347), 0xbc },
> > +     { CCI_REG8(0x0348), 0x12 },
> > +     { CCI_REG8(0x0349), 0x2f },
> > +     { CCI_REG8(0x034a), 0x0b },
> > +     { CCI_REG8(0x034b), 0xeb },
> > +     { CCI_REG8(0x0381), 0x01 },
> > +     { CCI_REG8(0x0383), 0x01 },
> > +     { CCI_REG8(0x0385), 0x01 },
> > +     { CCI_REG8(0x0387), 0x01 },
> > +     { CCI_REG8(0x0900), 0x01 },
> > +     { CCI_REG8(0x0901), 0x22 },
> > +     { CCI_REG8(0x0902), 0x08 },
> > +     { CCI_REG8(0x3f4c), 0x81 },
> > +     { CCI_REG8(0x3f4d), 0x81 },
> > +     { CCI_REG8(0x0408), 0x00 },
> > +     { CCI_REG8(0x0409), 0xc8 },
> > +     { CCI_REG8(0x040a), 0x00 },
> > +     { CCI_REG8(0x040b), 0x6c },
> > +     { CCI_REG8(0x040c), 0x07 },
> > +     { CCI_REG8(0x040d), 0x88 },
> > +     { CCI_REG8(0x040e), 0x04 },
> > +     { CCI_REG8(0x040f), 0x40 },
> > +     { CCI_REG8(0x034c), 0x07 },
> > +     { CCI_REG8(0x034d), 0x88 },
> > +     { CCI_REG8(0x034e), 0x04 },
> > +     { CCI_REG8(0x034f), 0x40 },
> > +     { CCI_REG8(0x0301), 0x06 },
> > +     { CCI_REG8(0x0303), 0x02 },
> > +     { CCI_REG8(0x0305), 0x02 },
> > +     { CCI_REG8(0x0306), 0x00 },
> > +     { CCI_REG8(0x0307), 0x79 },
> > +     { CCI_REG8(0x030b), 0x01 },
> > +     { CCI_REG8(0x030d), 0x02 },
> > +     { CCI_REG8(0x030e), 0x00 },
> > +     { CCI_REG8(0x030f), 0x53 },
> > +     { CCI_REG8(0x0310), 0x01 },
> > +     { CCI_REG8(0x0202), 0x13 },
> > +     { CCI_REG8(0x0203), 0x9e },
> > +     { CCI_REG8(0x0204), 0x00 },
> > +     { CCI_REG8(0x0205), 0x00 },
> > +     { CCI_REG8(0x020e), 0x01 },
> > +     { CCI_REG8(0x020f), 0x00 },
> > +     { CCI_REG8(0x3f78), 0x01 },
> > +     { CCI_REG8(0x3f79), 0x31 },
> > +     { CCI_REG8(0x3ffe), 0x00 },
> > +     { CCI_REG8(0x3fff), 0x8a },
> > +     { CCI_REG8(0x5f0a), 0xb6 },
> > +};
> > +
> > +static const char * const imx471_test_pattern_menu[] =3D {
> > +     "Disabled",
> > +     "Solid Colour",
> > +     "Eight Vertical Colour Bars",
> > +     "Colour Bars With Fade to Grey",
> > +     "Pseudorandom Sequence (PN9)",
> > +};
> > +
> > +/*
> > + * When adding more than the one below, make sure the disallowed ones =
will
> > + * actually be disabled in the LINK_FREQ control.
> > + */
> > +static const s64 link_freq_menu_items[] =3D {
> > +     IMX471_LINK_FREQ_DEFAULT,
> > +};
> > +
> > +/* Mode configs */
> > +static const struct imx471_mode supported_modes[] =3D {
> > +     {
> > +             .width =3D 1928,
> > +             .height =3D 1088,
> > +             .fll_def =3D 1308,
> > +             .fll_min =3D 1308,
> > +             .llp =3D 2328,
> > +             .link_freq_index =3D IMX471_LINK_FREQ_INDEX,
> > +             .default_mode_regs =3D mode_1928x1088_regs,
> > +             .default_mode_regs_length =3D ARRAY_SIZE(mode_1928x1088_r=
egs),
> > +     },
> > +};
> > +
> > +static int imx471_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *=
fh)
> > +{
> > +     struct imx471_data *sensor =3D to_imx471_data(sd);
> > +     struct v4l2_mbus_framefmt *try_fmt =3D
> > +                             v4l2_subdev_state_get_format(fh->state, 0=
);
> > +
> > +     /* Initialize try_fmt */
> > +     try_fmt->width =3D sensor->cur_mode->width;
> > +     try_fmt->height =3D sensor->cur_mode->height;
> > +     try_fmt->code =3D MEDIA_BUS_FMT_SRGGB10_1X10;
> > +     try_fmt->field =3D V4L2_FIELD_NONE;
>
> Please implement init_state pad op instead.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx471_update_flip(struct imx471_data *sensor, u32 value,
> > +                           u8 flip_bit)
> > +{
> > +     int ret;
> > +     u64 val =3D value ? flip_bit : 0;
> > +
> > +     if (sensor->streaming)
> > +             return -EBUSY;
> > +
> > +     /* hflip */
> > +     /*
> > +      * Some manufacturers mount the sensor upside-down (rotation =3D=
=3D 180).
> > +      * V4L2 sets both h/vflip to 1 for 180-degree rotation, but only =
the
> > +      * vflip should actually be applied. Skip the initial hflip write=
 to
> > +      * preserve correct orientation.
>
> Why? It's up to the userspace to configure flipping.
I'll rework this function. the color can be managed by tweaking the
Bayer format when setting up the h/v flip.

>
> > +      */
> > +     if (flip_bit =3D=3D IMX471_HFLIP_BIT) {
> > +             if (sensor->rotation =3D=3D 180 && !sensor->hflip_initial=
ized) {
> > +                     sensor->hflip_initialized =3D true;
> > +                     return 0;
> > +             }
> > +
> > +             cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> > +                             flip_bit, val, &ret);
> > +
> > +             return ret;
> > +     }
> > +
> > +     /* vflip */
> > +     cci_update_bits(sensor->regmap, IMX471_REG_ORIENTATION,
> > +                     flip_bit, val, &ret);
> > +     if (ret)
> > +             return ret;
> > +
> > +     cci_write(sensor->regmap, IMX471_REG_V_WIN_OFFSET,
> > +               value ? 0xe0 : 0xeb, &ret);
> > +     if (ret)
> > +             return ret;
> > +
> > +     cci_update_bits(sensor->regmap, IMX471_REG_H_WIN_OFFSET, 1,
> > +                     value ? 0x01 : 0x00, &ret);
>
> Both of these appear to be mode specific.
I'll rework this :)

>
> > +     return ret;
> > +}
> > +
> > +static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct imx471_data *sensor =3D container_of(ctrl->handler,
> > +                                               struct imx471_data,
> > +                                               ctrl_handler);
> > +     s64 max;
> > +     int ret;
> > +
> > +     /* Propagate change of current control to all related controls */
> > +     if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +             /* Update max exposure while meeting expected vblanking *=
/
> > +             max =3D sensor->cur_mode->height + ctrl->val -
> > +                   IMX471_EXPOSURE_MARGIN;
> > +             __v4l2_ctrl_modify_range(sensor->exposure,
> > +                                      sensor->exposure->minimum,
> > +                                      max, sensor->exposure->step, max=
);
> > +     }
> > +
> > +     /* V4L2 controls values will be applied only when power is alread=
y up */
> > +     if (!pm_runtime_get_if_in_use(sensor->dev))
> > +             return 0;
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_ANALOGUE_GAIN:
> > +             cci_write(sensor->regmap, IMX471_REG_ANALOG_GAIN,
> > +                       ctrl->val, &ret);
> > +             break;
> > +     case V4L2_CID_DIGITAL_GAIN:
> > +             cci_write(sensor->regmap, IMX471_REG_DIG_GAIN_GLOBAL,
> > +                       ctrl->val, &ret);
> > +             break;
> > +     case V4L2_CID_EXPOSURE:
> > +             cci_write(sensor->regmap, IMX471_REG_EXPOSURE,
> > +                       ctrl->val, &ret);
> > +             break;
> > +     case V4L2_CID_VBLANK:
> > +             /* Update FLL that meets expected vertical blanking */
> > +             cci_write(sensor->regmap, IMX471_REG_FLL,
> > +                       sensor->cur_mode->height + ctrl->val, &ret);
> > +             break;
> > +     case V4L2_CID_TEST_PATTERN:
> > +             cci_write(sensor->regmap, IMX471_REG_TEST_PATTERN,
> > +                       ctrl->val, &ret);
> > +             break;
> > +
> > +     case V4L2_CID_HFLIP:
> > +             ret =3D imx471_update_flip(sensor, ctrl->val, IMX471_HFLI=
P_BIT);
> > +             break;
> > +
> > +     case V4L2_CID_VFLIP:
> > +             ret =3D imx471_update_flip(sensor, ctrl->val, IMX471_VFLI=
P_BIT);
> > +             break;
> > +
> > +     default:
> > +             ret =3D -EINVAL;
> > +             dev_info(sensor->dev, "ctrl(id:0x%x,val:0x%x) is not hand=
led",
> > +                      ctrl->id, ctrl->val);
> > +             break;
> > +     }
> > +
> > +     pm_runtime_put(sensor->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops imx471_ctrl_ops =3D {
> > +     .s_ctrl =3D imx471_set_ctrl,
> > +};
> > +
> > +static int imx471_enum_mbus_code(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     if (code->index > 0)
> > +             return -EINVAL;
> > +
> > +     code->code =3D MEDIA_BUS_FMT_SRGGB10_1X10;
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx471_enum_frame_size(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_frame_size_enum *fse=
)
> > +{
> > +     if (fse->index >=3D ARRAY_SIZE(supported_modes))
> > +             return -EINVAL;
> > +
> > +     fse->min_width =3D supported_modes[fse->index].width;
> > +     fse->max_width =3D fse->min_width;
> > +     fse->min_height =3D supported_modes[fse->index].height;
> > +     fse->max_height =3D fse->min_height;
> > +
> > +     return 0;
> > +}
> > +
> > +static void imx471_update_pad_format(struct imx471_data *sensor,
> > +                                  const struct imx471_mode *mode,
> > +                                  struct v4l2_subdev_format *fmt)
> > +{
> > +     fmt->format.width =3D mode->width;
> > +     fmt->format.height =3D mode->height;
> > +     fmt->format.code =3D MEDIA_BUS_FMT_SRGGB10_1X10;
> > +     fmt->format.field =3D V4L2_FIELD_NONE;
> > +}
> > +
> > +static int
> > +imx471_set_pad_format(struct v4l2_subdev *sd,
> > +                   struct v4l2_subdev_state *sd_state,
> > +                   struct v4l2_subdev_format *fmt)
> > +{
> > +     struct imx471_data *sensor =3D to_imx471_data(sd);
> > +     const struct imx471_mode *mode;
> > +     s32 vblank_def;
> > +     s32 vblank_min;
> > +     s64 h_blank;
> > +     u64 pixel_rate;
> > +     u32 height;
> > +
> > +     fmt->format.code =3D MEDIA_BUS_FMT_SRGGB10_1X10;
> > +
> > +     mode =3D v4l2_find_nearest_size(supported_modes,
> > +                                   ARRAY_SIZE(supported_modes),
> > +                                   width, height,
> > +                                   fmt->format.width, fmt->format.heig=
ht);
> > +
> > +     imx471_update_pad_format(sensor, mode, fmt);
> > +
> > +     *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format=
;
> > +
> > +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > +             return 0;
> > +
> > +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && sensor->stream=
ing)
>
> You can use media_entity_is_streaming() here.
Okay.
>
> > +             return -EBUSY;
> > +
> > +     sensor->cur_mode =3D mode;
> > +     pixel_rate =3D IMX471_LINK_FREQ_DEFAULT * 2 * 4;
> > +     do_div(pixel_rate, 10);
> > +     __v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate, pixel_rate);
> > +
> > +     /* Update limits and set FPS to default */
> > +     height =3D sensor->cur_mode->height;
> > +     vblank_def =3D sensor->cur_mode->fll_def - height;
> > +     vblank_min =3D sensor->cur_mode->fll_min - height;
> > +     height =3D IMX471_FLL_MAX - height;
> > +
> > +     __v4l2_ctrl_modify_range(sensor->vblank, vblank_min, height, 1,
> > +                              vblank_def);
> > +     __v4l2_ctrl_s_ctrl(sensor->vblank, vblank_def);
>
> Note that these can fail, please check return values.
Okay
>
> > +     h_blank =3D mode->llp - sensor->cur_mode->width;
> > +     /*
> > +      * Currently hblank is not changeable.
> > +      * So FPS control is done only by vblank.
> > +      */
> > +     __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> > +                              h_blank, 1, h_blank);
>
> Ditto.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx471_identify_module(struct imx471_data *sensor)
> > +{
> > +     int ret;
> > +     u64 val;
> > +
> > +     if (sensor->identified)
> > +             return 0;
> > +
> > +     ret =3D cci_read(sensor->regmap, IMX471_REG_CHIP_ID, &val, NULL);
> > +     if (ret)
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "failed to read chip id\n");
> > +
> > +     if (val !=3D IMX471_CHIP_ID)
> > +             return dev_err_probe(sensor->dev, -EIO,
> > +                                  "chip id mismatch: %x!=3D%llx\n",
> > +                                  IMX471_CHIP_ID, val);
> > +
> > +     sensor->identified =3D true;
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx471_pm_suspend(struct device *dev)
>
> I'd call these imx471_power_o{ff,n}().
I'll change the name to yours.

>
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx471_data *sensor =3D to_imx471_data(sd);
> > +
> > +     clk_disable_unprepare(sensor->img_clk);
> > +     gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> > +     if (sensor->avdd)
>
> Don't you always have a dummy regulator here at least?
I think it can be replaced by using "regulator_bulk_disable()" to
disable all of them.
>
> > +             regulator_disable(sensor->avdd);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx471_pm_resume(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx471_data *sensor =3D to_imx471_data(sd);
> > +     int ret;
> > +
> > +     if (sensor->avdd) {
> > +             ret =3D regulator_enable(sensor->avdd);
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to enable avdd: %d", ret);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     ret =3D clk_prepare_enable(sensor->img_clk);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to enable imaging clock: %d", ret);
>
> What happens to the regulator here?
Power off. I'll disable the regulator here.

>
> > +             return ret;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> > +
> > +     usleep_range(10000, 15000);
> > +
> > +     return 0;
> > +}
> > +
> > +/* Start streaming */
> > +static int imx471_enable_stream(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *state,
> > +                             u32 pad, u64 streams_mask)
> > +{
> > +     struct imx471_data *sensor =3D to_imx471_data(sd);
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_resume_and_get(sensor->dev);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "power-up err.\n");
>
> The resume and suspend functions already print a specific error message.
I'll drop it.

>
> > +             goto error_powerdown;
>
>                 return ret;
>
> > +     }
> > +
> > +     ret =3D imx471_identify_module(sensor);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Global Setting */
> > +     cci_multi_reg_write(sensor->regmap, imx471_global_regs,
> > +                         ARRAY_SIZE(imx471_global_regs), &ret);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "failed to set global settings");
> > +             goto error_powerdown;
> > +     }
> > +
> > +     /* Apply default values of current mode */
> > +     cci_multi_reg_write(sensor->regmap, sensor->cur_mode->default_mod=
e_regs,
> > +                         sensor->cur_mode->default_mode_regs_length, &=
ret);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "failed to set mode");
> > +             goto error_powerdown;
> > +     }
> > +
> > +     /* set digital gain control to all color mode */
> > +     cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GAIN, 1, &re=
t);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     /* Apply customized values from user */
> > +     ret =3D  __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> > +               IMX471_MODE_STREAMING, &ret);
> > +     if (ret)
> > +             goto error_powerdown;
> > +
> > +     sensor->streaming =3D 1;
> > +
> > +     return ret;
> > +
> > +error_powerdown:
> > +     pm_runtime_put(sensor->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +/* Stop streaming */
> > +static int imx471_disable_stream(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *state,
> > +                              u32 pad, u64 streams_mask)
> > +{
> > +     struct imx471_data *sensor =3D to_imx471_data(sd);
> > +     int ret;
> > +
> > +     cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> > +               IMX471_MODE_STANDBY, &ret);
> > +     pm_runtime_put(sensor->dev);
> > +     sensor->streaming =3D 0;
> > +     sensor->hflip_initialized =3D false;
> > +
> > +     if (ret)
> > +             dev_err(sensor->dev,
> > +                     "failed to disable stream with return value: %d\n=
",
> > +                     ret);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops imx471_subdev_core_ops =3D {
> > +     .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> > +     .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops imx471_video_ops =3D {
> > +     .s_stream =3D v4l2_subdev_s_stream_helper,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops imx471_pad_ops =3D {
> > +     .enum_mbus_code =3D imx471_enum_mbus_code,
> > +     .get_fmt =3D v4l2_subdev_get_fmt,
> > +     .set_fmt =3D imx471_set_pad_format,
> > +     .enum_frame_size =3D imx471_enum_frame_size,
> > +     .enable_streams =3D imx471_enable_stream,
> > +     .disable_streams =3D imx471_disable_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_ops imx471_subdev_ops =3D {
> > +     .core =3D &imx471_subdev_core_ops,
> > +     .video =3D &imx471_video_ops,
> > +     .pad =3D &imx471_pad_ops,
> > +};
> > +
> > +static const struct media_entity_operations imx471_subdev_entity_ops =
=3D {
> > +     .link_validate =3D v4l2_subdev_link_validate,
>
> This is redundant as the sensor doesn't have connected sink pads.
I'll drop it.

>
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops imx471_internal_ops =3D {
> > +     .open =3D imx471_open,
> > +};
> > +
> > +/* Initialize control handlers */
> > +static int imx471_init_controls(struct imx471_data *sensor)
> > +{
> > +     struct v4l2_ctrl_handler *ctrl_hdlr;
> > +     struct v4l2_fwnode_device_properties props;
> > +
> > +     s64 exposure_max;
> > +     s64 vblank_def;
> > +     s64 vblank_min;
> > +     s64 hblank;
> > +     u64 pixel_rate;
> > +     const struct imx471_mode *mode;
> > +     u32 max;
> > +     int ret;
> > +
> > +     ctrl_hdlr =3D &sensor->ctrl_handler;
> > +     ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ctrl_hdlr->lock =3D &sensor->lock;
> > +     max =3D ARRAY_SIZE(link_freq_menu_items) - 1;
>
> No need for a temporary variable.
Okay

>
> > +     sensor->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx471_c=
trl_ops,
> > +                                                V4L2_CID_LINK_FREQ, ma=
x, 0,
> > +                                                link_freq_menu_items);
> > +     if (sensor->link_freq)
> > +             sensor->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +     /* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample *=
/
> > +     pixel_rate =3D IMX471_LINK_FREQ_DEFAULT * 2 * 4;
> > +     do_div(pixel_rate, 10);
> > +     /* By default, PIXEL_RATE is read only */
> > +     sensor->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_=
ops,
> > +                                            V4L2_CID_PIXEL_RATE, pixel=
_rate,
> > +                                            pixel_rate, 1, pixel_rate)=
;
> > +
> > +     /* Initial vblank/hblank/exposure parameters based on current mod=
e */
> > +     mode =3D sensor->cur_mode;
> > +     vblank_def =3D mode->fll_def - mode->height;
> > +     vblank_min =3D mode->fll_min - mode->height;
> > +     sensor->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> > +                                        V4L2_CID_VBLANK, vblank_min,
> > +                                        IMX471_FLL_MAX - mode->height,
> > +                                        1, vblank_def);
>
> I'd do the same here. You could wrap after '=3D' as well.

Okay
>
> > +
> > +     hblank =3D mode->llp - mode->width;
> > +     sensor->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> > +                                        V4L2_CID_HBLANK, hblank, hblan=
k,
> > +                                        1, hblank);
> > +     if (sensor->hblank)
> > +             sensor->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +     /* fll >=3D exposure time + adjust parameter (default value is 18=
) */
> > +     exposure_max =3D mode->fll_def - IMX471_EXPOSURE_MARGIN;
> > +     sensor->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_op=
s,
> > +                                          V4L2_CID_EXPOSURE,
> > +                                          IMX471_EXPOSURE_MIN, exposur=
e_max,
> > +                                          IMX471_EXPOSURE_STEP,
> > +                                          IMX471_EXPOSURE_DEFAULT);
> > +
> > +     v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_ANALOGUE_=
GAIN,
> > +                       IMX471_ANA_GAIN_MIN, IMX471_ANA_GAIN_MAX,
> > +                       IMX471_ANA_GAIN_STEP, IMX471_ANA_GAIN_DEFAULT);
> > +
> > +     /* Digital gain */
> > +     v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_DIGITAL_G=
AIN,
> > +                       IMX471_DGTL_GAIN_MIN, IMX471_DGTL_GAIN_MAX,
> > +                       IMX471_DGTL_GAIN_STEP, IMX471_DGTL_GAIN_DEFAULT=
);
> > +
> > +     v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx471_ctrl_ops,
> > +                                  V4L2_CID_TEST_PATTERN,
> > +                                  ARRAY_SIZE(imx471_test_pattern_menu)=
 - 1,
> > +                                  0, 0, imx471_test_pattern_menu);
> > +
> > +     /* HFLIP & VFLIP */
> > +     v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> > +                       V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +
> > +     v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> > +                       V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +
> > +     if (ctrl_hdlr->error) {
> > +             ret =3D ctrl_hdlr->error;
> > +             dev_err(sensor->dev, "%s control init failed: %d",
> > +                     __func__, ret);
> > +             goto error;
> > +     }
> > +
> > +     ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);
>
> You could do this as first and do error handling for the control handler
> just once.
I'll move it to the beginning of the function.

>
> > +     if (ret) {
> > +             dev_err(sensor->dev, "failed to parse fwnode: %d", ret);
> > +             return ret;
>
>                 goto error;
>
> > +     }
> > +
> > +     sensor->rotation =3D props.rotation;
> > +
> > +     v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx471_ctrl_ops, &pro=
ps);
> > +     if (ctrl_hdlr->error)
> > +             return ctrl_hdlr->error;
>
>                 goto error;
>
> > +
> > +     sensor->sd.ctrl_handler =3D ctrl_hdlr;
> > +
> > +     return 0;
> > +
> > +error:
> > +     v4l2_ctrl_handler_free(ctrl_hdlr);
> > +
> > +     return ret;
> > +}
> > +
> > +static int imx471_get_pm_resources(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx471_data *sensor =3D to_imx471_data(sd);
> > +
> > +     sensor->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> > +                                                  GPIOD_OUT_HIGH);
> > +     if (IS_ERR(sensor->reset_gpio)) {
> > +             return dev_err_probe(dev, PTR_ERR(sensor->reset_gpio),
> > +                                  "failed to get reset gpio\n");
> > +     }
> > +
> > +     fsleep(1000);
>
> This doesn't seem to belong here.

Drop it.
>
> > +
> > +     sensor->avdd =3D devm_regulator_get(dev, "avdd");
> > +     if (IS_ERR(sensor->avdd)) {
> > +             return dev_err_probe(dev, PTR_ERR(sensor->avdd),
> > +                                  "failed to get avdd regulator\n");
> > +     }
>
> No need for braces.
Drop it.

>
> > +
> > +     sensor->img_clk =3D devm_clk_get_optional(dev, NULL);
> > +     if (IS_ERR(sensor->img_clk))
> > +             return dev_err_probe(dev, PTR_ERR(sensor->img_clk),
> > +                                  "failed to get imaging clock\n");
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx471_check_hwcfg(struct imx471_data *sensor)
> > +{
> > +     struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +             .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +     };
> > +     struct fwnode_handle *ep, *fwnode =3D dev_fwnode(sensor->dev);
> > +     unsigned long link_freq_bitmap;
> > +     int ret;
> > +     u32 ext_clk;
> > +
> > +     /*
> > +      * The fwnode graph may be initialized by the bridge driver,
> > +      * wait for this.
> > +      */
> > +     ep =3D fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> > +     if (!ep)
> > +             return dev_err_probe(sensor->dev, -EPROBE_DEFER,
> > +                                  "waiting for fwnode graph endpoint\n=
");
>
> You can omit this error check, but please parse the endpoint right after
> obtaining it.
>
I'll rework this part.

> > +
> > +     ret =3D fwnode_property_read_u32(dev_fwnode(sensor->dev),
> > +                                    "clock-frequency", &ext_clk);
>
> Please use devm_v4l2_sensor_clk_get().

Okay.
>
> > +     if (ret) {
> > +             fwnode_handle_put(ep);
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "can't get clock frequency\n");
> > +     }
> > +
> > +     if (ext_clk !=3D IMX471_EXT_CLK) {
> > +             fwnode_handle_put(ep);
> > +             return dev_err_probe(sensor->dev, -EINVAL,
> > +                                  "external clock %u is not supported\=
n",
> > +                                  ext_clk);
> > +     }
> > +
> > +     ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +     fwnode_handle_put(ep);
> > +     if (ret)
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "parsing endpoint failed");
> > +
> > +     ret =3D v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_freque=
ncies,
> > +                                    bus_cfg.nr_of_link_frequencies,
> > +                                    link_freq_menu_items,
> > +                                    ARRAY_SIZE(link_freq_menu_items),
> > +                                    &link_freq_bitmap);
> > +
> > +     if (ret =3D=3D -ENOENT)
> > +             goto check_hwcfg_error;
>
>         if (ret)
>                 goto check_hwcfg_error;
>
>
> I'd call the label e.g. error_endpoint_free, too.

Okay
>
> > +
> > +     if (ret =3D=3D -ENODATA)
> > +             goto check_hwcfg_error;
> > +
> > +check_hwcfg_error:
> > +     v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +     return ret;
> > +}
> > +
> > +static int imx471_probe(struct i2c_client *client)
> > +{
> > +     struct imx471_data *sensor;
> > +     bool full_power;
> > +     int ret;
> > +
> > +     sensor =3D devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL=
);
> > +     if (!sensor)
> > +             return dev_err_probe(&client->dev, -ENOMEM,
> > +                                  "failed to allocate memory\n");
> > +
> > +     sensor->dev =3D &client->dev;
> > +
> > +     /* Check HW config */
> > +     ret =3D imx471_check_hwcfg(sensor);
> > +     if (ret)
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "failed to check hwcfg: %d\n", ret);
> > +
> > +     mutex_init(&sensor->lock);
> > +
> > +     /* Initialize subdev */
> > +     v4l2_i2c_subdev_init(&sensor->sd, client, &imx471_subdev_ops);
> > +
> > +     ret =3D imx471_get_pm_resources(sensor->dev);
> > +     if (ret)
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "failed to get pm resources\n");
> > +
> > +     /* Initialize regmap */
> > +     sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > +     if (IS_ERR(sensor->regmap))
> > +             return PTR_ERR(sensor->regmap);
> > +
> > +     ret =3D imx471_pm_resume(sensor->dev);
> > +     if (ret)
> > +             return dev_err_probe(sensor->dev, ret,
> > +                                  "failed to power on\n");
> > +
> > +     /* Check module identity */
> > +     ret =3D imx471_identify_module(sensor);
> > +     if (ret) {
> > +             dev_err(&client->dev, "failed to find sensor: %d", ret);
> > +             goto probe_error_power_off;
> > +     }
> > +
> > +     /* Set default mode to max resolution */
> > +     sensor->cur_mode =3D &supported_modes[0];
> > +
> > +     ret =3D imx471_init_controls(sensor);
> > +     if (ret) {
> > +             dev_err(sensor->dev, "failed to init controls: %d", ret);
> > +             goto probe_error_power_off;
> > +     }
> > +
> > +     /* Initialize subdev */
> > +     sensor->sd.internal_ops =3D &imx471_internal_ops;
> > +     sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +                         V4L2_SUBDEV_FL_HAS_EVENTS;
> > +     sensor->sd.entity.ops =3D &imx471_subdev_entity_ops;
> > +     sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +     /* Initialize source pad */
> > +     sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +     ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pa=
d);
> > +     if (ret) {
> > +             dev_err(&client->dev, "failed to init entity pads: %d", r=
et);
> > +             goto probe_error_v4l2_ctrl_handler_free;
> > +     }
> > +
> > +     sensor->sd.state_lock =3D sensor->ctrl_handler.lock;
> > +     ret =3D v4l2_subdev_init_finalize(&sensor->sd);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to init subdev: %d", ret);
> > +             goto probe_error_media_entity_pm;
> > +     }
> > +
> > +     /* Set the device's state to active if it's in D0 state. */
> > +     if (full_power)
>
> Uh-oh.
My bad. I dropped the D0 state check here, but I missed it.

>
> > +             pm_runtime_set_active(sensor->dev);
> > +     pm_runtime_enable(sensor->dev);
> > +     pm_runtime_idle(sensor->dev);
> > +
> > +     ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> > +     if (ret < 0)
> > +             goto probe_error_v4l2_subdev_cleanup;
> > +
> > +     return 0;
> > +
> > +probe_error_v4l2_subdev_cleanup:
>
> You can drop "probe_" from the labels.
Okay.
>
> > +     pm_runtime_disable(sensor->dev);
> > +     pm_runtime_set_suspended(sensor->dev);
> > +     v4l2_subdev_cleanup(&sensor->sd);
> > +
> > +probe_error_media_entity_pm:
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +
> > +probe_error_v4l2_ctrl_handler_free:
> > +     v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> > +
> > +probe_error_power_off:
> > +     imx471_pm_suspend(sensor->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static void imx471_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct imx471_data *sensor =3D to_imx471_data(sd);
> > +
> > +     v4l2_async_unregister_subdev(sd);
> > +     v4l2_subdev_cleanup(sd);
> > +     media_entity_cleanup(&sd->entity);
> > +     v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +
> > +     pm_runtime_disable(&client->dev);
> > +
> > +     if (!pm_runtime_status_suspended(sensor->dev)) {
> > +             imx471_pm_suspend(sensor->dev);
> > +             pm_runtime_set_suspended(sensor->dev);
> > +     }
> > +}
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(imx471_pm_ops, imx471_pm_suspend,
> > +                              imx471_pm_resume, NULL);
> > +
> > +static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused =
=3D {
> > +     { "SONY471A" },
> > +     { "TBE20A0"  },
>
> "TBE" isn't a valid PNP ID prefix. Where does this ID come from?
I can't find the corresponding device, either, so it can be dropped.
>
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, imx471_acpi_ids);
> > +
> > +static struct i2c_driver imx471_i2c_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "imx471",
> > +             .acpi_match_table =3D ACPI_PTR(imx471_acpi_ids),
> > +             .pm =3D pm_sleep_ptr(&imx471_pm_ops),
> > +     },
> > +     .probe =3D imx471_probe,
> > +     .remove =3D imx471_remove,
> > +};
> > +module_i2c_driver(imx471_i2c_driver);
> > +
> > +MODULE_AUTHOR("Jimmy Su <jimmy.su@intel.com>");
> > +MODULE_AUTHOR("Serin Yeh <serin.yeh@intel.com>");
> > +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
> > +MODULE_DESCRIPTION("Sony imx471 sensor driver");
> > +MODULE_LICENSE("GPL");
>
> --
> Kind regards,
>
> Sakari Ailus
>


--=20
BR,
Kate


