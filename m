Return-Path: <linux-media+bounces-30319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DEAA8B6A1
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FC6619036C4
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 10:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D2C2459E9;
	Wed, 16 Apr 2025 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="lRi2NMrN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5729122157B
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744798811; cv=none; b=FlrLEjBMGH8D9J9xKLaSS5Z/iet4Eb9sJMtWbJZg+NRXW2LKLnvQpam0cqmtkqKrkdbnjIq/KTVdAuxh2F3zub4/OuQ5At0w9dH3EIXSi5ZXd8x1vNqNKdECMWB7FxkDoHURLvGmShDqRwT0fNCEdTMDgrn1PZiw4c+3TzeZ8+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744798811; c=relaxed/simple;
	bh=lk8itBF3g2U78bQflow6XOcxBs3ouzmGO79SD8ieLQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cE8gUwP6R+6nMK80iUMl6kb+1TgiO5+PF8WT3SkKd/YSG+DWm802pVPrCBRzyC73Dzsq23YrMQxW/VdWpRA2JmOco4oB7NQouqGp2OrB2bQ1bvFPXYq4vN3QY5IkQREqfbh2HC8rhAlf01osJpfGkxA/RQEAuNvLrewGAthvsko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=lRi2NMrN; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ef9b8b4f13so58898267b3.2
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1744798807; x=1745403607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBzOFMIJS5GCf+llQv5VzcdIgq5B2O4CspG2YCI195c=;
        b=lRi2NMrNBb6ACfebxIcMo4DtMBcsXriikbR8peA8lh9Repi+45S+zdN54RfAjxKXOJ
         vXCCdvpNCG3ihrYZ3zCQhK95gnrMO/pBFo1ti20rixJBBbK6BTDjBuZjKmXtcrUJQARD
         iJMbD990l8AtM7og8rPzo4BqjCyblnUEuRpVNovcUj3MHoacDG6dvIkUEiEx9j3bGkn9
         7qJ93aLwgUzCCYC5NhfXCB5PbP62qTAy7cSXWGFkLWNpNOxS+gmgl2M4Oy8hiSf80E5q
         roXMv177hdKPSjZXAZGRCiHkna7GqDVfmaMdR5R/oQ6n/2K3P92KsLcjeKT5P71aDIZT
         hq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744798807; x=1745403607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBzOFMIJS5GCf+llQv5VzcdIgq5B2O4CspG2YCI195c=;
        b=LHEx0r2wxy5oiA2R1TJcXa0TAthwxHKnEXVZn0IyJnr0NMD4Hs+cBTdgvhcuBl+IkV
         KXfgL70CvpW8pD7lnSbOqos0ZdyX1qNUFPyFjnmY9d4rv5A1A+bmQfQ6wivyohI3cxof
         D1Uyz3+FZpA1gx/i5sYP5GsPjPUR10O9BwuiE4W8TIwarzfaFnPm1ExNKnZGr/1q96SE
         TT3PTEmu7SPGq865D56XWHbvteb5cFwm59Gg4bNTNVP6tmc0WXZthMLxvNYJ5fbuud10
         xo+ru79QyNXVCtKUCzEUUIFlUbVbiqh0NdNqfD7u1EJG1xJcJwMmNz1Sofc3KiaozthT
         9oaA==
X-Forwarded-Encrypted: i=1; AJvYcCXsZmTtUM5KncIr21u7DUSG1nGjuMVFq6OtnUMrzWpQaoZQWwu36rwZM2jbpjRmAtTU30gHQZl39vvWkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYoVT9qgHRmX1uLBtbjc+ZBgJdm7kFdFOhoqvM546t081oLAWt
	muitjDMwA6BdX+uf0MYjwvBcE0GGGgHPMIEfZ7YgWekLjuQ+w/8qzoTbHIxUmUDGVxFCWuo4he1
	AwtyT8MJcbynxGLEU5N0HI44DDsBdE0qy19hAVA==
X-Gm-Gg: ASbGncut5pXLelWNQFPnU0gKtBAPz9HjDOF9oWKYeJnVri+TYkEunlWRJWM8uU4of+l
	X8eDGrOzRyN3Q2If/UBDnIxcJUhPVD5uNT9JSCmMPkK+d0uYQU5KAKv7U0RIagjuZlYyfx9k9JT
	M8gdGxzI31KKl/eUzYrOkkrrS+32dHvJF5ogY7rPr+jbjaIsFy6SpobA==
X-Google-Smtp-Source: AGHT+IFyoQgoToOvoJQppZRhk5xd7zoNxsR2/xNk8A38+q8I47NlECGoOfTILYy1tOs6hRIr6aK39cT0h8rASHoEzaQ=
X-Received: by 2002:a05:690c:6906:b0:703:b278:db2d with SMTP id
 00721157ae682-706b32a9751mr14424967b3.12.1744798807069; Wed, 16 Apr 2025
 03:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
 <20240630141802.15830-3-laurent.pinchart@ideasonboard.com>
 <Z_5EAQPG9tlFarWV@kekkonen.localdomain> <20250415131757.GD20685@pendragon.ideasonboard.com>
 <Z_9NyDsloCjK5j0D@kekkonen.localdomain>
In-Reply-To: <Z_9NyDsloCjK5j0D@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 16 Apr 2025 11:19:49 +0100
X-Gm-Features: ATxdqUGcJ40Mxkn8G64v5hyzin8s5pqaGFAZGI_rUHheuqh0DD0mC0Z9ITvobhA
Message-ID: <CAPY8ntDMgeo4kq=S0J96PTY+n9ew8nPztqqt9511o8=zWiZEfA@mail.gmail.com>
Subject: Re: [PATCH/RFC v1 2/9] media: i2c: Add a driver for the onsemi AR0144
 camera sensor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent and Sakari

On Wed, 16 Apr 2025 at 07:27, Sakari Ailus <sakari.ailus@linux.intel.com> w=
rote:
>
> Hi Laurent,
>
> On Tue, Apr 15, 2025 at 04:17:57PM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> >
> > On Tue, Apr 15, 2025 at 11:33:21AM +0000, Sakari Ailus wrote:
> > > Hi Laurent,
> > >
> > > Please do ping me if you don't get a review and expect one. :-)
> >
> > I'll try to. Please ping me if I don't ;-)
> >
> > > On Sun, Jun 30, 2024 at 05:17:52PM +0300, Laurent Pinchart wrote:
> > > > The AR0144 is a 1/4" 1MP CMOS camera sensor from onsemi. The driver
> > > > supports both the monochrome and color versions, and both the paral=
lel
> > > > and MIPI CSI-2 interfaces. Due to limitations of the test platform,=
 only
> > > > the CSI-2 output has been tested.
> > > >
> > > > The driver supports 8-, 10- and 12-bit output formats, analog crop =
and
> > > > binning/skipping. It exposes controls that cover the usual use case=
s for
> > > > camera sensors.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >  MAINTAINERS                |    1 +
> > > >  drivers/media/i2c/Kconfig  |   11 +
> > > >  drivers/media/i2c/Makefile |    1 +
> > > >  drivers/media/i2c/ar0144.c | 1826 ++++++++++++++++++++++++++++++++=
++++
> > > >  4 files changed, 1839 insertions(+)
> > > >  create mode 100644 drivers/media/i2c/ar0144.c
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 8e591445bec4..fff7554805dd 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -1642,6 +1642,7 @@ M:  Laurent Pinchart <laurent.pinchart@ideaso=
nboard.com>
> > > >  L:       linux-media@vger.kernel.org
> > > >  S:       Maintained
> > > >  F:       Documentation/devicetree/bindings/media/i2c/onnn,ar0144.y=
aml
> > > > +F:       drivers/media/i2c/ar0144.c
> > > >
> > > >  AR0521 ON SEMICONDUCTOR CAMERA SENSOR DRIVER
> > > >  M:       Krzysztof Ha=C5=82asa <khalasa@piap.pl>
> > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > index d37944e667f3..122cfea07853 100644
> > > > --- a/drivers/media/i2c/Kconfig
> > > > +++ b/drivers/media/i2c/Kconfig
> > > > @@ -51,6 +51,17 @@ config VIDEO_ALVIUM_CSI2
> > > >     To compile this driver as a module, choose M here: the
> > > >     module will be called alvium-csi2.
> > > >
> > > > +config VIDEO_AR0144
> > > > + tristate "onsemi AR0144 sensor support"
> > > > + select V4L2_CCI_I2C
> > > > + select VIDEO_CCS_PLL
> > > > + help
> > > > +   This is a Video4Linux2 sensor driver for the onsemi AR0144 came=
ra
> > > > +   sensor.
> > > > +
> > > > +   To compile this driver as a module, choose M here: the
> > > > +   module will be called ar0144.
> > > > +
> > > >  config VIDEO_AR0521
> > > >   tristate "ON Semiconductor AR0521 sensor support"
> > > >   help
> > > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefil=
e
> > > > index 3ca63cec3441..c21b8df0d50c 100644
> > > > --- a/drivers/media/i2c/Makefile
> > > > +++ b/drivers/media/i2c/Makefile
> > > > @@ -19,6 +19,7 @@ obj-$(CONFIG_VIDEO_AK7375) +=3D ak7375.o
> > > >  obj-$(CONFIG_VIDEO_AK881X) +=3D ak881x.o
> > > >  obj-$(CONFIG_VIDEO_ALVIUM_CSI2) +=3D alvium-csi2.o
> > > >  obj-$(CONFIG_VIDEO_APTINA_PLL) +=3D aptina-pll.o
> > > > +obj-$(CONFIG_VIDEO_AR0144) +=3D ar0144.o
> > > >  obj-$(CONFIG_VIDEO_AR0521) +=3D ar0521.o
> > > >  obj-$(CONFIG_VIDEO_BT819) +=3D bt819.o
> > > >  obj-$(CONFIG_VIDEO_BT856) +=3D bt856.o
> > > > diff --git a/drivers/media/i2c/ar0144.c b/drivers/media/i2c/ar0144.=
c
> > > > new file mode 100644
> > > > index 000000000000..b0e738a28de6
> > > > --- /dev/null
> > > > +++ b/drivers/media/i2c/ar0144.c
> > > > @@ -0,0 +1,1826 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (C) 2024 Ideas on Board Oy
> > > > + * Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > + */
> > > > +
> > > > +/*
> > > > + * Possible improvements:
> > > > + *
> > > > + * - Use grouped parameter hold to update controls atomically
> > > > + * - Expose debug information through debugfs (FRAME_COUNT, FRAME_=
STATUS, ...)
> > > > + * - Make MIPI D-PHY timings configurable
> > > > + * - Support the parallel interface
> > > > + * - Expose additional controls (in particular the temperature sen=
sor and the
> > > > + *   on-chip black level correction)
> > > > + */
> > > > +
> > > > +#include <linux/bitops.h>
> > > > +#include <linux/clk.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/device.h>
> > > > +#include <linux/errno.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/ktime.h>
> > > > +#include <linux/log2.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/pm_runtime.h>
> > > > +#include <linux/property.h>
> > > > +#include <linux/regmap.h>
> > > > +#include <linux/regulator/consumer.h>
> > > > +#include <linux/types.h>
> > > > +#include <linux/v4l2-mediabus.h>
> > > > +
> > > > +#include <media/mipi-csi2.h>
> > > > +#include <media/v4l2-async.h>
> > > > +#include <media/v4l2-cci.h>
> > > > +#include <media/v4l2-ctrls.h>
> > > > +#include <media/v4l2-fwnode.h>
> > > > +#include <media/v4l2-subdev.h>
> > > > +
> > > > +#include "ccs-pll.h"
> > > > +
> > > > +#define AR0144_CHIP_VERSION_REG                                  C=
CI_REG16(0x3000)
> > > > +#define          AR0144_CHIP_VERSION                              =
       0x0356
> > >
> > > Wouldn't one tab be enough?
> >
> > Do you mean
> >
> > #define AR0144_CHIP_VERSION_REG                                       C=
CI_REG16(0x3000)
> > #define AR0144_CHIP_VERSION                                   0x0356
> >
> > ? I can do that if you prefer. The additional indentation makes it
> > clearer which macros define registers and which macros define register
> > fields, but I'm also OK losing that distinction.
>
> Ok, either way works for me.
>
> >
> > If you meant "#define\tAR0144_CHIP_VERSION", that won't work as
> > "#define" is exactly 7 characters long.
> >
> > > > +#define AR0144_Y_ADDR_START                                      C=
CI_REG16(0x3002)
> > > > +#define AR0144_X_ADDR_START                                      C=
CI_REG16(0x3004)
> > > > +#define AR0144_Y_ADDR_END                                        C=
CI_REG16(0x3006)
> > > > +#define AR0144_X_ADDR_END                                        C=
CI_REG16(0x3008)
> > > > +#define AR0144_FRAME_LENGTH_LINES                                C=
CI_REG16(0x300a)
> > > > +#define          AR0144_MIN_FRAME_LENGTH_LINES                    =
       29
> > > > +#define          AR0144_MAX_FRAME_LENGTH_LINES                    =
       65535
> > > > +#define AR0144_LINE_LENGTH_PCK                                   C=
CI_REG16(0x300c)
> > > > +#define          AR0144_MIN_LINE_LENGTH_PCK                       =
       1488
> > > > +#define          AR0144_MAX_LINE_LENGTH_PCK                       =
       65534
> > > > +#define AR0144_REVISION_NUMBER                                   C=
CI_REG16(0x300e)
> > > > +#define          AR0144_REVISION_NUMBER_CREV(n)                   =
       (((n) >> 12) & 0xf)
> > > > +#define          AR0144_REVISION_NUMBER_SILICON(n)                =
       (((n) >> 4) & 0xf)
> > > > +#define          AR0144_REVISION_NUMBER_OTPM(n)                   =
       (((n) >> 0) & 0xf)
> > > > +#define AR0144_LOCK_CONTROL                                      C=
CI_REG16(0x3010)
> > > > +#define          AR0144_LOCK_CONTROL_VALUE                        =
       0xbeef
> > > > +#define AR0144_COARSE_INTEGRATION_TIME                           C=
CI_REG16(0x3012)
> > > > +#define AR0144_FINE_INTEGRATION_TIME                             C=
CI_REG16(0x3014)
> > > > +#define AR0144_COARSE_INTEGRATION_TIME_CB                        C=
CI_REG16(0x3016)
> > > > +#define AR0144_FINE_INTEGRATION_TIME_CB                          C=
CI_REG16(0x3018)
> > > > +#define AR0144_RESET_REGISTER                                    C=
CI_REG16(0x301a)
> > > > +#define          AR0144_GROUPED_PARAMETER_HOLD                    =
       BIT(15)
> > > > +#define          AR0144_SMIA_SERIALIZER_DIS                       =
       BIT(12)
> > > > +#define          AR0144_FORCED_PLL_ON                             =
       BIT(11)
> > > > +#define          AR0144_RESTART_BAD                               =
       BIT(10)
> > > > +#define          AR0144_MASK_BAD                                  =
       BIT(9)
> > > > +#define          AR0144_GPI_EN                                    =
       BIT(8)
> > > > +#define          AR0144_PARALLEL_EN                               =
       BIT(7)
> > > > +#define          AR0144_DRIVE_PINS                                =
       BIT(6)
> > > > +#define          AR0144_LOCK_REG                                  =
       BIT(3)
> > > > +#define          AR0144_STREAM                                    =
       BIT(2)
> > > > +#define          AR0144_RESTART                                   =
       BIT(1)
> > > > +#define          AR0144_RESET                                     =
       BIT(0)
> > > > +#define AR0144_MODE_SELECT                                       C=
CI_REG8(0x301c)
> > > > +#define          AR0144_MODE_STREAM                               =
       BIT(0)
> > > > +#define AR0144_IMAGE_ORIENTATION                         CCI_REG8(=
0x301d)
> > > > +#define          AR0144_ORIENTATION_VERT_FLIP                     =
       BIT(1)
> > > > +#define          AR0144_ORIENTATION_HORIZ_MIRROR                  =
       BIT(0)
> > > > +#define AR0144_DATA_PEDESTAL                                     C=
CI_REG16(0x301e)
> > > > +#define AR0144_SOFTWARE_RESET                                    C=
CI_REG8(0x3021)
> > > > +#define AR0144_GROUPED_PARAMETER_HOLD_                           C=
CI_REG8(0x3022)
> > > > +#define AR0144_MASK_CORRUPTED_FRAMES                             C=
CI_REG8(0x3023)
> > > > +#define AR0144_PIXEL_ORDER                                       C=
CI_REG8(0x3024)
> > > > +#define AR0144_GPI_STATUS                                        C=
CI_REG16(0x3026)
> > > > +#define          AR0144_TRIGGER                                   =
       BIT(2)
> > > > +#define          AR0144_OUTPUT_ENABLE_N                           =
       BIT(1)
> > > > +#define          AR0144_SADDR                                     =
       BIT(0)
> > > > +#define AR0144_ROW_SPEED                                 CCI_REG16=
(0x3028)
> > > > +#define          AR0144_ROW_SPEED_HALF_CLK                        =
       BIT(4)
> > > > +#define AR0144_VT_PIX_CLK_DIV                                    C=
CI_REG16(0x302a)
> > > > +#define AR0144_VT_SYS_CLK_DIV                                    C=
CI_REG16(0x302c)
> > > > +#define AR0144_PRE_PLL_CLK_DIV                                   C=
CI_REG16(0x302e)
> > > > +#define AR0144_PLL_MULTIPLIER                                    C=
CI_REG16(0x3030)
> > > > +#define AR0144_CTX_CONTROL_REG                                   C=
CI_REG16(0x3034)
> > > > +#define AR0144_OP_PIX_CLK_DIV                                    C=
CI_REG16(0x3036)
> > > > +#define AR0144_OP_SYS_CLK_DIV                                    C=
CI_REG16(0x3038)
> > > > +#define AR0144_FRAME_COUNT                                       C=
CI_REG16(0x303a)
> > > > +#define AR0144_FRAME_STATUS                                      C=
CI_REG16(0x303c)
> > > > +#define          AR0144_PLL_LOCKED                                =
       BIT(3)
> > > > +#define          AR0144_FRAME_START_DURING_GPH                    =
       BIT(2)
> > > > +#define          AR0144_STANDBY_STATUS                            =
       BIT(1)
> > > > +#define          AR0144_FRAMESYNC                                 =
       BIT(0)
> > > > +#define AR0144_LINE_LENGTH_PCK_CB                                C=
CI_REG16(0x303e)
> > > > +#define AR0144_READ_MODE                                 CCI_REG16=
(0x3040)
> > > > +#define          AR0144_VERT_FLIP                                 =
       BIT(15)
> > > > +#define          AR0144_HORIZ_MIRROR                              =
       BIT(14)
> > > > +#define          AR0144_READ_MODE_COL_BIN                         =
       BIT(13)
> > > > +#define          AR0144_READ_MODE_ROW_BIN                         =
       BIT(12)
> > > > +#define          AR0144_READ_MODE_COL_BIN_CB                      =
       BIT(11)
> > > > +#define          AR0144_READ_MODE_ROW_BIN_CB                      =
       BIT(10)
> > > > +#define          AR0144_READ_MODE_COL_SF_BIN_EN                   =
       BIT(9)
> > > > +#define          AR0144_READ_MODE_COL_SF_BIN_EN_CB                =
       BIT(8)
> > > > +#define          AR0144_READ_MODE_COL_SF_BIN_MONO_EN              =
       BIT(7)
> > > > +#define          AR0144_READ_MODE_COL_SF_BIN_MONO_EN_CB           =
       BIT(6)
> > > > +#define          AR0144_READ_MODE_COL_SUM                         =
       BIT(5)
> > > > +#define AR0144_EXTRA_DELAY                                       C=
CI_REG16(0x3042)
> > > > +#define AR0144_GREEN1_GAIN                                       C=
CI_REG16(0x3056)
> > > > +#define AR0144_BLUE_GAIN                                 CCI_REG16=
(0x3058)
> > > > +#define AR0144_RED_GAIN                                          C=
CI_REG16(0x305a)
> > > > +#define AR0144_GREEN2_GAIN                                       C=
CI_REG16(0x305c)
> > > > +#define AR0144_GLOBAL_GAIN                                       C=
CI_REG16(0x305e)
> > > > +#define AR0144_ANALOG_GAIN                                       C=
CI_REG16(0x3060)
> > > > +#define          AR0144_COARSE_GAIN_CB(n)                         =
       ((n) << 12)
> > > > +#define          AR0144_FINE_GAIN_CB(n)                           =
       ((n) << 8)
> > > > +#define          AR0144_COARSE_GAIN(n)                            =
       ((n) << 4)
> > > > +#define          AR0144_FINE_GAIN(n)                              =
       ((n) << 0)
> > > > +#define AR0144_SMIA_TEST                                 CCI_REG16=
(0x3064)
> > > > +#define          AR0144_EMBEDDED_DATA                             =
       BIT(8)
> > > > +#define          AR0144_STATS_EN                                  =
       BIT(7)
> > > > +#define AR0144_CTX_WR_DATA_REG                                   C=
CI_REG16(0x3066)
> > > > +#define AR0144_CTX_RD_DATA_REG                                   C=
CI_REG16(0x3068)
> > > > +#define AR0144_DATAPATH_SELECT                                   C=
CI_REG16(0x306e)
> > > > +#define          AR0144_SLEW_RATE_CTRL_PARALLEL(n)                =
       (((n) & 7) << 13)
> > > > +#define          AR0144_SLEW_RATE_CTRL_PARALLEL_MASK              =
       GENMASK(15, 13)
> > > > +#define          AR0144_SLEW_RATE_CTRL_PIXCLK(n)                  =
       (((n) & 7) << 10)
> > > > +#define          AR0144_SLOW_RATE_CTRL_PIXCLK_MASK                =
       GENMASK(12, 10)
> > > > +#define          AR0144_SPECIAL_LINE_VALID_NORMAL                 =
       (0U << 0)
> > > > +#define          AR0144_SPECIAL_LINE_VALID_CONTINUOUS             =
       (1U << 0)
> > > > +#define          AR0144_SPECIAL_LINE_VALID_CONTINUOUS_XOR         =
       (2U << 0)
> > > > +#define AR0144_TEST_PATTERN_MODE                         CCI_REG16=
(0x3070)
> > > > +#define          AR0144_TEST_PATTERN_NONE                         =
       0
> > > > +#define          AR0144_TEST_PATTERN_SOLID                        =
       1
> > > > +#define          AR0144_TEST_PATTERN_BARS                         =
       2
> > > > +#define          AR0144_TEST_PATTERN_BARS_FADE                    =
       3
> > > > +#define          AR0144_TEST_PATTERN_WALKING_1S                   =
       256
> > > > +#define AR0144_TEST_DATA_RED                                     C=
CI_REG16(0x3072)
> > > > +#define AR0144_TEST_DATA_GREENR                                  C=
CI_REG16(0x3074)
> > > > +#define AR0144_TEST_DATA_BLUE                                    C=
CI_REG16(0x3076)
> > > > +#define AR0144_TEST_DATA_GREENB                                  C=
CI_REG16(0x3078)
> > > > +#define AR0144_OPERATION_MODE_CTRL                               C=
CI_REG16(0x3082)
> > > > +#define AR0144_OPERATION_MODE_CTRL_CB                            C=
CI_REG16(0x3084)
> > > > +#define AR0144_SEQ_DATA_PORT                                     C=
CI_REG16(0x3086)
> > > > +#define AR0144_SEQ_CTRL_PORT                                     C=
CI_REG16(0x3088)
> > > > +#define          AR0144_SEQUENCER_STOPPED                         =
       BIT(15)
> > > > +#define          AR0144_AUTO_INC_ON_READ                          =
       BIT(14)
> > > > +#define          AR0144_ACCESS_ADDRESS(n)                         =
       ((n) & 0x3ff)
> > > > +#define AR0144_X_ADDR_START_CB                                   C=
CI_REG16(0x308a)
> > > > +#define AR0144_Y_ADDR_START_CB                                   C=
CI_REG16(0x308c)
> > > > +#define AR0144_X_ADDR_END_CB                                     C=
CI_REG16(0x308e)
> > > > +#define AR0144_Y_ADDR_END_CB                                     C=
CI_REG16(0x3090)
> > > > +#define AR0144_X_EVEN_INC                                        C=
CI_REG16(0x30a0)
> > > > +#define AR0144_X_ODD_INC                                 CCI_REG16=
(0x30a2)
> > > > +#define          AR0144_X_ODD_INC_SKIP(n)                         =
       (((n) << 1) - 1)
> > > > +#define AR0144_Y_EVEN_INC                                        C=
CI_REG16(0x30a4)
> > > > +#define AR0144_Y_ODD_INC                                 CCI_REG16=
(0x30a6)
> > > > +#define          AR0144_Y_ODD_INC_SKIP(n)                         =
       (((n) << 1) - 1)
> > > > +#define AR0144_Y_ODD_INC_CB                                      C=
CI_REG16(0x30a8)
> > > > +#define AR0144_FRAME_LINE_LENGTH_CB                              C=
CI_REG16(0x30aa)
> > > > +#define AR0144_X_ODD_INC_CB                                      C=
CI_REG16(0x30ae)
> > > > +#define AR0144_DIGITAL_TEST                                      C=
CI_REG16(0x30b0)
> > > > +#define          AR0144_PLL_COMPLETE_BYPASS                       =
       BIT(14)
> > > > +#define          AR0144_PIXCLK_ON                                 =
       BIT(8)
> > > > +#define          AR0144_MONO_CHROME_OPERATION                     =
       BIT(7)
> > > > +#define AR0144_TEMPSENS_DATA_REG                         CCI_REG16=
(0x30b2)
> > > > +#define AR0144_TEMPSENS_CTRL_REG                         CCI_REG16=
(0x30b4)
> > > > +#define          AR0144_RETRIGGER_THRESHOLD(n)                    =
       ((n) << 6)
> > > > +#define          AR0144_RETRIGGER_THRESHOLD_MASK                  =
       GENMASK(15, 6)
> > > > +#define          AR0144_TEMP_CLEAR_VALUE                          =
       BIT(5)
> > > > +#define          AR0144_TEMP_START_CONVERSION                     =
       BIT(4)
> > > > +#define          AR0144_TEMPSENS_POWER_ON                         =
       BIT(0)
> > > > +#define AR0144_GREEN1_GAIN_CB                                    C=
CI_REG16(0x30bc)
> > > > +#define AR0144_BLUE_GAIN_CB                                      C=
CI_REG16(0x30be)
> > > > +#define AR0144_RED_GAIN_CB                                       C=
CI_REG16(0x30c0)
> > > > +#define AR0144_GREEN2_GAIN_CB                                    C=
CI_REG16(0x30c2)
> > > > +#define AR0144_GLOBAL_GAIN_CB                                    C=
CI_REG16(0x30c4)
> > > > +#define AR0144_TEMPSENS_CALIB1                                   C=
CI_REG16(0x30c6)
> > > > +#define AR0144_TEMPSENS_CALIB2                                   C=
CI_REG16(0x30c8)
> > > > +#define AR0144_GRR_CONTROL1                                      C=
CI_REG16(0x30ce)
> > > > +#define AR0144_NOISE_PEDESTAL                                    C=
CI_REG16(0x30fe)
> > > > +#define AR0144_AECTRLREG                                 CCI_REG16=
(0x3100)
> > > > +#define          AR0144_MIN_ANA_GAIN(n)                           =
       ((n) << 5)
> > > > +#define          AR0144_MIN_ANA_GAIN_MASK                         =
       GENMASK(6, 5)
> > > > +#define          AR0144_AUTO_DG_EN                                =
       BIT(4)
> > > > +#define          AR0144_AUTO_AG_EN                                =
       BIT(1)
> > > > +#define          AR0144_AE_ENABLE                                 =
       BIT(0)
> > > > +#define AR0144_AE_LUMA_TARGET_REG                                C=
CI_REG16(0x3102)
> > > > +#define AR0144_AE_MIN_EV_STEP_REG                                C=
CI_REG16(0x3108)
> > > > +#define AR0144_AE_MAX_EV_STEP_REG                                C=
CI_REG16(0x310a)
> > > > +#define AR0144_AE_DAMP_OFFSET_REG                                C=
CI_REG16(0x310c)
> > > > +#define AR0144_AE_DAMP_GAIN_REG                                  C=
CI_REG16(0x310e)
> > > > +#define AR0144_AE_DAMP_MAX_REG                                   C=
CI_REG16(0x3110)
> > > > +#define AR0144_AE_MAX_EXPOSURE_REG                               C=
CI_REG16(0x311c)
> > > > +#define AR0144_AE_MIN_EXPOSURE_REG                               C=
CI_REG16(0x311e)
> > > > +#define AR0144_AE_COARSE_INTEGRATION_TIME                        C=
CI_REG16(0x3164)
> > > > +#define AR0144_DELTA_DK_CONTROL                                  C=
CI_REG16(0x3180)
> > > > +#define          AR0144_DELTA_DK_SUB_EN                           =
       BIT(15)
> > > > +#define          AR0144_DELTA_DK_EVERY_FRAME                      =
       BIT(14)
> > > > +#define          AR0144_DELTA_DK_RECALC                           =
       BIT(13)
> > > > +#define          AR0144_DELTA_DK_GRADIENT_REMOVAL                 =
       BIT(10)
> > > > +#define AR0144_DATA_FORMAT_BITS                                  C=
CI_REG16(0x31ac)
> > > > +#define          AR0144_DATA_FORMAT_IN(n)                         =
       ((n) << 8)
> > > > +#define          AR0144_DATA_FORMAT_OUT(n)                        =
       ((n) << 0)
> > > > +#define AR0144_SERIAL_FORMAT                                     C=
CI_REG16(0x31ae)
> > > > +#define          AR0144_NUM_LANES(n)                              =
       (n)
> > > > +#define          AR0144_NUM_LANES_MASK                            =
       GENMASK(1, 0)
> > > > +#define AR0144_FRAME_PREAMBLE                                    C=
CI_REG16(0x31b0)
> > > > +#define AR0144_LINE_PREAMBLE                                     C=
CI_REG16(0x31b2)
> > > > +#define AR0144_MIPI_TIMING_0                                     C=
CI_REG16(0x31b4)
> > > > +#define          AR0144_T_HS_PREPARE(n)                           =
       ((n) << 12)
> > > > +#define          AR0144_T_HS_ZERO(n)                              =
       ((n) << 8)
> > > > +#define          AR0144_T_HS_TRAIL(n)                             =
       ((n) << 4)
> > > > +#define          AR0144_T_CLK_TRAIL(n)                            =
       ((n) << 0)
> > > > +#define AR0144_MIPI_TIMING_1                                     C=
CI_REG16(0x31b6)
> > > > +#define          AR0144_T_CLK_PREPARE(n)                          =
       ((n) << 12)
> > > > +#define          AR0144_T_HS_EXIT(n)                              =
       ((n) << 6)
> > > > +#define          AR0144_T_CLK_ZERO(n)                             =
       ((n) << 0)
> > > > +#define AR0144_MIPI_TIMING_2                                     C=
CI_REG16(0x31b8)
> > > > +#define          AR0144_T_BGAP(n)                                 =
       ((n) << 12)
> > > > +#define          AR0144_T_CLK_PRE(n)                              =
       ((n) << 6)
> > > > +#define          AR0144_T_CLK_POST(n)                             =
       ((n) << 0)
> > > > +#define AR0144_MIPI_TIMING_3                                     C=
CI_REG16(0x31ba)
> > > > +#define          AR0144_T_LPX(n)                                  =
       ((n) << 7)
> > > > +#define          AR0144_T_WAKE_UP(n)                              =
       ((n) << 0)
> > > > +#define AR0144_MIPI_TIMING_4                                     C=
CI_REG16(0x31bc)
> > > > +#define          AR0144_CONT_TX_CLK                               =
       BIT(15)
> > > > +#define          AR0144_HEAVY_LP_LOAD                             =
       BIT(14)
> > > > +#define          AR0144_T_INIT(n)                                 =
       ((n) << 0)
> > > > +#define AR0144_SERIAL_CONFIG_STATUS                              C=
CI_REG16(0x31be)
> > > > +#define AR0144_SERIAL_CONTROL_STATUS                             C=
CI_REG16(0x31c6)
> > > > +#define          AR0144_FRAMER_TEST_MODE                          =
       BIT(7)
> > > > +#define AR0144_SERIAL_CRC_0                                      C=
CI_REG16(0x31c8)
> > > > +#define AR0144_COMPANDING                                        C=
CI_REG16(0x31d0)
> > > > +#define          AR0144_COMPAND_EN                                =
       BIT(0)
> > > > +#define AR0144_STAT_FRAME_ID                                     C=
CI_REG16(0x31d2)
> > > > +#define AR0144_I2C_WRT_CHEKCSUM                                  C=
CI_REG16(0x31d6)
> > > > +#define AR0144_SERIAL_TEST                                       C=
CI_REG16(0x31d8)
> > > > +#define          AR0144_TEST_LANE_EN(n)                           =
       ((n) << 8)
> > > > +#define          AR0144_TEST_LANE_EN_MASK                         =
       GENMASK(11, 8)
> > > > +#define          AR0144_TEST_MODE_LP00                            =
       (0 << 4)
> > > > +#define          AR0144_TEST_MODE_LP11                            =
       (1 << 4)
> > > > +#define          AR0144_TEST_MODE_HS0                             =
       (2 << 4)
> > > > +#define          AR0144_TEST_MODE_HS1                             =
       (3 << 4)
> > > > +#define          AR0144_TEST_MODE_SQUARE_HALF                     =
       (4 << 4)
> > > > +#define          AR0144_TEST_MODE_SQUARE_FULL                     =
       (5 << 4)
> > > > +#define          AR0144_TEST_MODE_SQUARE_LP                       =
       (6 << 4)
> > > > +#define          AR0144_TEST_MODE_PRBS31                          =
       (7 << 4)
> > > > +#define          AR0144_TEST_MODE_PRBS9                           =
       (8 << 4)
> > > > +#define          AR0144_TEST_MODE_MASK                            =
       GENMASK(7, 0)
> > > > +#define AR0144_PIX_DEF_1D                                        C=
CI_REG16(0x31e0)
> > > > +#define          AR0144_PIX_DEF_1D_DDC_EN                         =
       BIT(3)
> > > > +#define          AR0144_PIX_DEF_CORRECTION_MODE                   =
       BIT(1)
> > > > +#define          AR0144_PIX_DEF_ENABLE                            =
       BIT(0)
> > > > +#define AR0144_HORIZONTAL_CURSOR_POSITION                        C=
CI_REG16(0x31e8)
> > > > +#define AR0144_VERTICAL_CURSOR_POSITION                          C=
CI_REG16(0x31ea)
> > > > +#define AR0144_HORIZONTAL_CURSOR_WIDTH                           C=
CI_REG16(0x31ec)
> > > > +#define AR0144_VERTICAL_CURSOR_WIDTH                             C=
CI_REG16(0x31ee)
> > > > +#define AR0144_CCI_IDS                                           C=
CI_REG16(0x31fc)
> > > > +#define AR0144_CUSTOMER_REV                                      C=
CI_REG16(0x31fe)
> > > > +#define          AR0144_CUSTOMER_REV_CRA(n)                       =
       (((n) & GENMASK(9, 7)) >> 7)
> > > > +#define          AR0144_CUSTOMER_REV_CFA(n)                       =
       (((n) & GENMASK(6, 4)) >> 4)
> > > > +#define          AR0144_CUSTOMER_REV_CFA_COLOR                    =
       1
> > > > +#define          AR0144_CUSTOMER_REV_CFA_MONO                     =
       2
> > > > +#define AR0144_LED_FLASH_CONTROL                         CCI_REG16=
(0x3270)
> > > > +#define          AR0144_LED_FLASH_EN                              =
       BIT(8)
> > > > +#define          AR0144_LED_DELAY(n)                              =
       ((n) << 0)
> > > > +#define          AR0144_LED_DELAY_MASK                            =
       GENMASK(7, 0)
> > > > +#define AR0144_MIPI_TEST_CNTRL                                   C=
CI_REG16(0x3338)
> > > > +#define AR0144_MIPI_COMPRESS_8_DATA_TYPE                 CCI_REG16=
(0x333a)
> > > > +#define AR0144_MIPI_COMPRESS_7_DATA_TYPE                 CCI_REG16=
(0x333c)
> > > > +#define AR0144_MIPI_COMPRESS_6_DATA_TYPE                 CCI_REG16=
(0x333e)
> > > > +#define AR0144_MIPI_JPEG_PN9_DATA_TYPE                           C=
CI_REG16(0x3340)
> > > > +#define AR0144_MIPI_CNTRL                                        C=
CI_REG16(0x3354)
> > > > +#define          AR0144_CHAN_NUM(n)                               =
       ((n) << 6)
> > > > +#define          AR0144_DATA_TYPE_XMIT(n)                         =
       ((n) << 0)
> > > > +#define AR0144_MIPI_TEST_PATTERN_CNTRL                           C=
CI_REG16(0x3356)
> > > > +#define AR0144_MIPI_TEST_PATTERN_STATUS                          C=
CI_REG16(0x3358)
> > > > +#define AR0144_DIGITAL_CTRL_1                                    C=
CI_REG16(0x3786)
> > > > +#define          AR0144_LSB_ALIGN_PARA_OUT                        =
       BIT(5)
> > > > +#define          AR0144_USE_1FRAME_SYNCED                         =
       BIT(4)
> > > > +#define          AR0144_PLL_TEST_MODE                             =
       BIT(3)
> > > > +#define          AR0144_DRIVE_PIX_CLK                             =
       BIT(0)
> > > > +
> > > > +#define AR0144_MIN_CSI2_LINK_FREQ                150000000U
> > > > +#define AR0144_MAX_CSI2_LINK_FREQ                384000000U
> > > > +
> > > > +/*
> > > > + * The pixel array contains 1300x820 optically transparent pixels,=
 with 6 dummy
> > > > + * pixels on each side that can't be read out. The active size is =
1288x808.
> > > > + */
> > > > +#define AR0144_PIXEL_ARRAY_WIDTH         1300U
> > > > +#define AR0144_PIXEL_ARRAY_HEIGHT                820U
> > > > +#define AR0144_PIXEL_ARRAY_ACTIVE_LEFT           6U
> > > > +#define AR0144_PIXEL_ARRAY_ACTIVE_TOP            6U
> > > > +#define AR0144_PIXEL_ARRAY_ACTIVE_WIDTH          1288U
> > > > +#define AR0144_PIXEL_ARRAY_ACTIVE_HEIGHT 808U
> > > > +
> > > > +/*
> > > > + * Documentation indicates minimum horizontal and vertical blankin=
g of 208
> > > > + * pixels and 27 lines respectively, which matches the default val=
ues for the
> > > > + * LINE_LENGTH_PCK and FRAME_LENGTH_LINES registers. Out-of-tree d=
rivers are
> > > > + * known to successfully use 22 or 25 lines of vertical blanking. =
This is
> > > > + * likely related to the fact that the total number of rows per fr=
ame is equal
> > > > + * to FRAME_LENGTH_LINES plus a 5 lines overhead, as indicated in =
at least one
> > > > + * place in the documentation.
> > > > + */
> > > > +#define AR0144_MIN_HBLANK                        208U
> > > > +#define AR0144_MIN_VBLANK                        27U
> > > > +
> > > > +#define AR0144_FRAME_LENGTH_OVERHEAD             5U
> > > > +
> > > > +/* The minimum values are not documented, pick reasonable minimums=
. */
> > > > +#define AR0144_MIN_WIDTH                 32U
> > > > +#define AR0144_MIN_HEIGHT                        32U
> > > > +#define AR0144_DEF_WIDTH                 1280U
> > > > +#define AR0144_DEF_HEIGHT                        800U
> > > > +
> > > > +#define AR0144_NUM_SUPPLIES                      3
> > >
> > > Please use ARRAY_SIZE() macro where you need it.
> >
> > I can move
> >
> > static const char * const ar0144_supply_name[] =3D {
> >       "vaa",
> >       "vdd_io",
> >       "vdd",
> > };
> >
> > here, and use
> >
> > struct ar0144 {
> >       ...
> >       struct regulator_bulk_data supplies[ARRAY_SIZE(ar0144_supply_name=
)];
> >       ...
> > };
> >
> > below. Is that what you would prefer ? The macro isn't used anywhere
> > else, all other locations use ARRAY_SIZE already.
>
> Please.
>
> >
> > > > +
> > > > +struct ar0144_model {
> > > > + bool mono;
> > > > +};
> > > > +
> > > > +struct ar0144_format_info {
> > > > + u32 colour;
> > > > + u32 mono;
> > > > + u16 bpp;
> > > > + u16 dt;
> > > > +};
> > > > +
> > > > +static const struct ar0144_model ar0144_model_color =3D {
> > > > + .mono =3D false,
> > > > +};
> > > > +
> > > > +static const struct ar0144_model ar0144_model_mono =3D {
> > > > + .mono =3D true,
> > > > +};
> > > > +
> > > > +static const struct ar0144_format_info ar0144_formats[] =3D {
> > > > + {
> > > > +         .colour =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> > > > +         .mono =3D MEDIA_BUS_FMT_Y12_1X12,
> > > > +         .bpp =3D 12,
> > > > +         .dt =3D MIPI_CSI2_DT_RAW12,
> > > > + }, {
> > > > +         .colour =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> > > > +         .mono =3D MEDIA_BUS_FMT_Y10_1X10,
> > > > +         .bpp =3D 10,
> > > > +         .dt =3D MIPI_CSI2_DT_RAW10,
> > > > + }, {
> > > > +         .colour =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> > > > +         .mono =3D MEDIA_BUS_FMT_Y8_1X8,
> > > > +         .bpp =3D 8,
> > > > +         .dt =3D MIPI_CSI2_DT_RAW8,
> > > > + },
> > > > +};
> > > > +
> > > > +struct ar0144 {
> > > > + struct device *dev;
> > > > +
> > > > + struct regmap *regmap;
> > > > + struct clk *clk;
> > > > + struct gpio_desc *reset;
> > > > + struct regulator_bulk_data supplies[AR0144_NUM_SUPPLIES];
> > > > +
> > > > + ktime_t off_time;
> > > > +
> > > > + struct ccs_pll pll;
> > > > +
> > > > + struct v4l2_fwnode_endpoint bus_cfg;
> > > > + u64 valid_link_freqs[ARRAY_SIZE(ar0144_formats)];
> > > > + u32 valid_formats;
> > > > +
> > > > + struct v4l2_subdev sd;
> > > > + struct media_pad pad;
> > > > +
> > > > + const struct ar0144_model *model;
> > > > +
> > > > + struct v4l2_ctrl_handler ctrls;
> > > > + struct v4l2_ctrl *pixel_rate;
> > > > + struct v4l2_ctrl *link_freq;
> > > > + struct v4l2_ctrl *hblank;
> > > > + struct v4l2_ctrl *vblank;
> > > > + struct v4l2_ctrl *exposure;
> > > > + struct v4l2_ctrl *test_data[4];
> > > > + struct {
> > > > +         struct v4l2_ctrl *hflip;
> > > > +         struct v4l2_ctrl *vflip;
> > > > + };
> > > > +};
> > > > +
> > > > +static inline struct ar0144 *to_ar0144(struct v4l2_subdev *sd)
> > > > +{
> > > > + return container_of(sd, struct ar0144, sd);
> > > > +}
> > > > +
> > > > +static u32 ar0144_format_code(struct ar0144 *sensor,
> > > > +                       const struct ar0144_format_info *info)
> > > > +{
> > > > + return sensor->model->mono ? info->mono : info->colour;
> > > > +}
> > > > +
> > > > +static const struct ar0144_format_info *
> > > > +ar0144_format_info(struct ar0144 *sensor, u32 code, bool use_def)
> > > > +{
> > > > + const struct ar0144_format_info *def =3D NULL;
> > > > + unsigned int i;
> > > > +
> > > > + for (i =3D 0; i < ARRAY_SIZE(ar0144_formats); ++i) {
> > > > +         const struct ar0144_format_info *info =3D &ar0144_formats=
[i];
> > > > +         u32 info_code =3D ar0144_format_code(sensor, info);
> > > > +
> > > > +         if (!(sensor->valid_formats & BIT(i)))
> > > > +                 continue;
> > > > +
> > > > +         if (info_code =3D=3D code)
> > > > +                 return info;
> > > > +
> > > > +         if (!def)
> > > > +                 def =3D info;
> > > > + }
> > > > +
> > > > + return use_def ? def : NULL;
> > > > +}
> > > > +
> > > > +/* ---------------------------------------------------------------=
--------------
> > > > + * Hardware configuration
> > > > + */
> > > > +
> > > > +static int ar0144_configure_pll(struct ar0144 *sensor)
> > > > +{
> > > > + int ret =3D 0;
> > > > +
> > > > + cci_write(sensor->regmap, AR0144_PRE_PLL_CLK_DIV,
> > > > +           sensor->pll.vt_fr.pre_pll_clk_div, &ret);
> > > > + cci_write(sensor->regmap, AR0144_PLL_MULTIPLIER,
> > > > +           sensor->pll.vt_fr.pll_multiplier, &ret);
> > > > + cci_write(sensor->regmap, AR0144_VT_PIX_CLK_DIV,
> > > > +           sensor->pll.vt_bk.pix_clk_div, &ret);
> > > > + cci_write(sensor->regmap, AR0144_VT_SYS_CLK_DIV,
> > > > +           sensor->pll.vt_bk.sys_clk_div, &ret);
> > > > + cci_write(sensor->regmap, AR0144_OP_PIX_CLK_DIV,
> > > > +           sensor->pll.op_bk.pix_clk_div, &ret);
> > > > + cci_write(sensor->regmap, AR0144_OP_SYS_CLK_DIV,
> > > > +           sensor->pll.op_bk.sys_clk_div, &ret);
> > > > +
> > > > + /* Wait 1ms for the PLL to lock. */
> > > > + fsleep(1000);
> > > > +
> > > > + return ret;
> > > > +}
> > > > +
> > > > +static int ar0144_configure_mipi(struct ar0144 *sensor,
> > > > +                          const struct ar0144_format_info *info)
> > > > +{
> > > > + unsigned int num_lanes =3D sensor->bus_cfg.bus.mipi_csi2.num_data=
_lanes;
> > > > + bool cont_clk =3D !(sensor->bus_cfg.bus.mipi_csi2.flags &
> > > > +                   V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK);
> > > > + int ret =3D 0;
> > > > +
> > > > + cci_write(sensor->regmap, AR0144_SERIAL_FORMAT, num_lanes | 0x020=
0,
> > >
> > > What's 0x0200 for? It'd be nice to get a human-readable name for it.
> >
> > I don't know. This comes from register lists, and I don't have any
> > documentation for this bit. Same for the two other locations below. I
> > decided to keep them as magic constants because that's what they are,
> > defining
> >
> > #define AR0144_SERIAL_FORMAT_MAGIC_CONSTANT   0x0200
> >
> > doesn't really help much in my opinion. Keeping the magic constant in
> > the code is actually a reminder that we should try to investigate it an=
d
> > understand what the bit does.
> >
> > Can I keep it as-is ?
>
> Ack. A comment explaining this in a single location would be nice.

Docs I have (AND9322-D) for register 0x31ae say
"The upper byte of this register (interface type) is read-only"
It doesn't say whether it mirrors the lower byte or does something
else though, and I've not tried poking.

I can't help on the other instances - my docs just list those bits as reser=
ved.

  Dave

