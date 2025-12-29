Return-Path: <linux-media+bounces-49639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D9BCE6D02
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 14:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A34A13043F7D
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 13:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5261E1FF5E3;
	Mon, 29 Dec 2025 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K2/Ij/ou"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6D51DF759;
	Mon, 29 Dec 2025 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013306; cv=none; b=Q2lp0NMJHPnVg45TtFXgp3IizWqQeh4saUiPdaOCzZc0/ixzqNNysqPpJ8dq74UHp9wp3uXr2OElefp7McIKnQ2Y6aqe8jwUM1KJ+1zzycNcp7CKjG441PtWYFPWHGgOxuqx6MWXPmYD8lwmItk+Dl7IyQ+5a3oEPO8+1975J1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013306; c=relaxed/simple;
	bh=5miWv1lVi8/9CHl5nnHbDok0s1Q+OqxuNdI/rHrOVk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiLM+43S+OZ9fB0vb74ZxqGBIUlZG4bAnuvlpxLscaH4h96XEl7t9XSa107JUdWb/oeElu2QOaBzw0U/p1O7m4J04qRAG45tkJovIsPJ98q1J8LEIhRkFjAQsWumFDDctOA4f2US+cyqAjtbf7t7WIQDb4Obn5iJWwrPUhO8YXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K2/Ij/ou; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2FD81BCA;
	Mon, 29 Dec 2025 14:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767013279;
	bh=5miWv1lVi8/9CHl5nnHbDok0s1Q+OqxuNdI/rHrOVk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2/Ij/ouF2yW3Pd18hdu+qO9gXdJB7MFRx8lhZc1Wlnduh8Wh/SMUL2BPemmPBueQ
	 49YmkzLvaS6uxKCe2ocPpNyi8dtuwy9UCOQnqe+cvQDHIoe9XPtN6oIUWGAQ+8Vdin
	 USRQ5nTdH32w5PLo2FgeTrnmHzzLAVK1Lgk94/ik=
Date: Mon, 29 Dec 2025 15:01:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Xiaolei Wang <xiaolei.wang@windriver.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
	"jacopo@jmondi.org" <jacopo@jmondi.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"jai.luthra@ideasonboard.com" <jai.luthra@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] media: i2c: ov5647: Convert to CCI register
 access helpers
Message-ID: <20251229130116.GC6598@pendragon.ideasonboard.com>
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
 <20251229023018.2933405-2-xiaolei.wang@windriver.com>
 <PN3P287MB18291169FABF1E8A01AA88B88BBFA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB18291169FABF1E8A01AA88B88BBFA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

On Mon, Dec 29, 2025 at 12:37:41PM +0000, Tarang Raval wrote:
> > Use the new common CCI register access helpers to replace the private
> > register access helpers in the ov5647 driver. This simplifies the driver
> > by reducing the amount of code.
> > 
> > Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> > ---
> >  drivers/media/i2c/Kconfig  |   1 +
> >  drivers/media/i2c/ov5647.c | 997 +++++++++++++++++--------------------
> >  2 files changed, 453 insertions(+), 545 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 4b4db8c4f496..cce63349e71e 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -529,6 +529,7 @@ config VIDEO_OV5645
> > 
> >  config VIDEO_OV5647
> >         tristate "OmniVision OV5647 sensor support"
> > +       select V4L2_CCI_I2C
> >         help
> >           This is a Video4Linux2 sensor driver for the OmniVision
> >           OV5647 camera.
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index e193fef4fced..fd69f1616794 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/slab.h>
> >  #include <linux/videodev2.h>
> > +#include <media/v4l2-cci.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-event.h>
> > @@ -41,24 +42,19 @@
> >  #define MIPI_CTRL00_BUS_IDLE                   BIT(2)
> >  #define MIPI_CTRL00_CLOCK_LANE_DISABLE         BIT(0)
> > 
> > -#define OV5647_SW_STANDBY              0x0100
> > -#define OV5647_SW_RESET                        0x0103
> > -#define OV5647_REG_CHIPID_H            0x300a
> > -#define OV5647_REG_CHIPID_L            0x300b
> > -#define OV5640_REG_PAD_OUT             0x300d
> > -#define OV5647_REG_EXP_HI              0x3500
> > -#define OV5647_REG_EXP_MID             0x3501
> > -#define OV5647_REG_EXP_LO              0x3502
> > -#define OV5647_REG_AEC_AGC             0x3503
> > -#define OV5647_REG_GAIN_HI             0x350a
> > -#define OV5647_REG_GAIN_LO             0x350b
> > -#define OV5647_REG_VTS_HI              0x380e
> > -#define OV5647_REG_VTS_LO              0x380f
> > -#define OV5647_REG_FRAME_OFF_NUMBER    0x4202
> > -#define OV5647_REG_MIPI_CTRL00         0x4800
> > -#define OV5647_REG_MIPI_CTRL14         0x4814
> > -#define OV5647_REG_AWB                 0x5001
> > -#define OV5647_REG_ISPCTRL3D           0x503d
> > +#define OV5647_SW_STANDBY              CCI_REG8(0x0100)
> > +#define OV5647_SW_RESET                        CCI_REG8(0x0103)
> > +#define OV5647_REG_CHIPID              CCI_REG16(0x300a)
> > +#define OV5640_REG_PAD_OUT             CCI_REG8(0x300d)
> > +#define OV5647_REG_EXPOSURE            CCI_REG24(0x3500)
> > +#define OV5647_REG_AEC_AGC             CCI_REG8(0x3503)
> > +#define OV5647_REG_GAIN                        CCI_REG16(0x350b)
> 
> It should be 0x350a, not 0x350b.
> 
> > +#define OV5647_REG_VTS                 CCI_REG16(0x380e)
> > +#define OV5647_REG_FRAME_OFF_NUMBER    CCI_REG8(0x4202)
> > +#define OV5647_REG_MIPI_CTRL00         CCI_REG8(0x4800)
> > +#define OV5647_REG_MIPI_CTRL14         CCI_REG8(0x4814)
> > +#define OV5647_REG_AWB                 CCI_REG8(0x5001)
> > +#define OV5647_REG_ISPCTRL3D           CCI_REG8(0x503d)
> > 
> >  #define REG_TERM 0xfffe
> >  #define VAL_TERM 0xfe
> > @@ -81,23 +77,19 @@
> >  #define OV5647_EXPOSURE_DEFAULT                1000
> >  #define OV5647_EXPOSURE_MAX            65535
>  
> ...
> 
> > @@ -1435,6 +1335,13 @@ static int ov5647_probe(struct i2c_client *client)
> >         if (ret < 0)
> >                 goto ctrl_handler_free;
> > 
> > +       sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
> > +       if (IS_ERR(sensor->regmap)) {
> > +               ret = PTR_ERR(sensor->regmap);
> > +               dev_err(dev, "failed to initialize CCI: %d\n", ret);
> 
> Use return dev_err_probe();

dev_err_probe() is fine, but goto entity_cleanup is needed.

> > +               goto entity_cleanup;
> > +       }
> > +
> >         ret = ov5647_power_on(dev);
> >         if (ret)
> >                 goto entity_cleanup;

-- 
Regards,

Laurent Pinchart

