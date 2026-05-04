Return-Path: <linux-media+bounces-60268-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGRYCqdx+GlCvAIAu9opvQ
	(envelope-from <linux-media+bounces-60268-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 12:15:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1444BB8AD
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 12:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E8BE301486C
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 10:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93635391E59;
	Mon,  4 May 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ax6LyqKG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF62388E6E;
	Mon,  4 May 2026 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889694; cv=none; b=iyjgc2nz2uMtmtLblXb9wkUqhL4wux/S/mnyn+NSq8jZDV+duvjKMOcYhjfGramDIq7b+PLY3RRG/DT7MX5iV5QIF9MaU+d6Pjp3jv77hDP3W9CWJIvsRfJOURUvKjV2nXU87CuGedIqy+SMCWki+ya4SmHv/f0u6vDz7m9ew9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889694; c=relaxed/simple;
	bh=ykKwEVy1lJuWU9VraiVjEa/obI0hhaY7quEW3vvb40c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BflSfnmoc+qmza9p2lSbrpRsMdbUHFP4ZFIkuraJ+oNO2ui/BfW+fzt6zBCJ+ygjYo4wDX2isIrU2OXln9K8ENqkvo9vrHmiIR1PYo3m2vTjMbXgaul6QHGZfDvuYEKI+FVSaFnrs/DrOkiO78URU780qlquK4rIHRsRVrPUGrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ax6LyqKG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777889692; x=1809425692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ykKwEVy1lJuWU9VraiVjEa/obI0hhaY7quEW3vvb40c=;
  b=Ax6LyqKGzOFDskfzGvXxbsHhRatx+aKFg0gaPTaAbu3l6k5PU4r8R7FF
   Ws09GNYnfD8hSFVCVnH5Zei65a2amUZ/SOZ/adrIWgeUbtf4R0r/9x2Ck
   SaWpIjAIhXc8Q3PxfkLZ9oEYE2diUH9BARvSwzALtrVC5G2eVitr+zU+y
   wR0fkobA60WnIgz0SqiKVYOLcMykKp13PBSf/nJobKnRHdPxoEktIZr8P
   mfoo5SdcNzkt6sYYRWqv7iqs0re56XzgQ4Q44+hlPj7BKhma9vWGC0c21
   gYMOH6+PpL5ai6V3VY6LEYvUKY0BYoQ7IqVNpt9eUSpSgKC3iI0V2CTGU
   Q==;
X-CSE-ConnectionGUID: 7pIEgCI1TaiVfZcIzls4SA==
X-CSE-MsgGUID: hyHD6tsIRKW72oe364js/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78450438"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78450438"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 03:14:51 -0700
X-CSE-ConnectionGUID: tN4x25PbTmCX4PF7r0MO6w==
X-CSE-MsgGUID: /Y3OYc5lQrSBPiHJVB0n0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="235731311"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.114])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 03:14:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B7895121CC4;
	Mon, 04 May 2026 13:14:46 +0300 (EEST)
Date: Mon, 4 May 2026 13:14:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 5/6] media: i2c: lm3560: Add support for PM features
Message-ID: <afhxlsgnCjzbbEWQ@kekkonen.localdomain>
References: <20260503164445.215540-1-clamor95@gmail.com>
 <20260503164445.215540-6-clamor95@gmail.com>
 <afg-ldFd7hockYn-@kekkonen.localdomain>
 <CAPVz0n0w90AuczbhdPrWewpKpJC_iJ5u3LsPug5mVPJ+KDnZRQ@mail.gmail.com>
 <CAPVz0n0f5Q5+CbBRU3VNT_juir3vPi4EywwTgM2oCK7KsdgLUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0f5Q5+CbBRU3VNT_juir3vPi4EywwTgM2oCK7KsdgLUQ@mail.gmail.com>
X-Rspamd-Queue-Id: AC1444BB8AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60268-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,kekkonen.localdomain:mid]

On Mon, May 04, 2026 at 12:37:40PM +0300, Svyatoslav Ryhel wrote:
> пн, 4 трав. 2026 р. о 10:40 Svyatoslav Ryhel <clamor95@gmail.com> пише:
> >
> > пн, 4 трав. 2026 р. о 09:37 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> > >
> > > Hi Svyatoslav,
> > >
> > > On Sun, May 03, 2026 at 07:44:44PM +0300, Svyatoslav Ryhel wrote:
> > > > Add support for power management features to better control the LM3560
> > > > within the media framework. To achieve the desired PM support, the HWEN
> > > > GPIO and VIN power supply were added and configured into power on/off
> > > > sequences. Added PM operations along with the PM configuration setup.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/media/i2c/lm3560.c | 117 ++++++++++++++++++++++++++++++++++---
> > > >  1 file changed, 110 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> > > > index ce4b09d1f208..15741ea5684f 100644
> > > > --- a/drivers/media/i2c/lm3560.c
> > > > +++ b/drivers/media/i2c/lm3560.c
> > > > @@ -12,13 +12,16 @@
> > > >  #include <linux/bitmap.h>
> > > >  #include <linux/delay.h>
> > > >  #include <linux/module.h>
> > > > +#include <linux/gpio/consumer.h>
> > > >  #include <linux/i2c.h>
> > > >  #include <linux/slab.h>
> > > >  #include <linux/mod_devicetable.h>
> > > >  #include <linux/mutex.h>
> > > >  #include <linux/of.h>
> > > > +#include <linux/pm_runtime.h>
> > > >  #include <linux/property.h>
> > > >  #include <linux/regmap.h>
> > > > +#include <linux/regulator/consumer.h>
> > > >  #include <linux/videodev2.h>
> > > >  #include <media/i2c/lm3560.h>
> > > >  #include <media/v4l2-ctrls.h>
> > > > @@ -49,6 +52,8 @@ enum led_enable {
> > > >   * @dev: pointer to &struct device
> > > >   * @regmap: reg. map for i2c
> > > >   * @lock: muxtex for serial access.
> > > > + * @hwen_gpio: line connected to HWEN pin
> > > > + * @vin_supply: line connected to IN supply (2.5V - 5.5V)
> > > >   * @led_mode: V4L2 LED mode
> > > >   * @ctrls_led: V4L2 controls
> > > >   * @subdev_led: V4L2 subdev
> > > > @@ -63,6 +68,9 @@ struct lm3560_flash {
> > > >       struct regmap *regmap;
> > > >       struct mutex lock;
> > > >
> > > > +     struct gpio_desc *hwen_gpio;
> > > > +     struct regulator *vin_supply;
> > > > +
> > > >       enum v4l2_flash_led_mode led_mode;
> > > >       struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
> > > >       struct v4l2_subdev subdev_led[LM3560_LED_MAX];
> > > > @@ -177,12 +185,17 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
> > > >       struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
> > > >       int rval = -EINVAL;
> > > >
> > > > +     if (!pm_runtime_get_if_in_use(flash->dev))
> > > > +             return 0;
> > > > +
> > > >       if (ctrl->id == V4L2_CID_FLASH_FAULT) {
> > > >               s32 fault = 0;
> > > >               unsigned int reg_val;
> > > >               rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
> > > > -             if (rval < 0)
> > > > +             if (rval < 0) {
> > > > +                     pm_runtime_put(flash->dev);
> > > >                       return rval;
> > > > +             }
> > > >               if (reg_val & FAULT_SHORT_CIRCUIT)
> > > >                       fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
> > > >               if (reg_val & FAULT_OVERTEMP)
> > > > @@ -192,6 +205,8 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
> > > >               ctrl->cur.val = fault;
> > > >       }
> > > >
> > > > +     pm_runtime_put(flash->dev);
> > > > +
> > > >       return rval;
> > > >  }
> > > >
> > > > @@ -201,6 +216,9 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
> > > >       u8 tout_bits;
> > > >       int rval = -EINVAL;
> > > >
> > > > +     if (!pm_runtime_get_if_in_use(flash->dev))
> > >
> > > This should be pm_runtime_get_if_active().
> > >
> >
> 
> For both lm3560_set_ctrl and lm3560_get_ctrl or only for lm3560_set_ctrl?

For both.

It doesn't matter much at this point as the usage_count is incremented for
each file handle.

> 
> > Noted
> >
> > > > +             return 0;
> > > > +
> > > >       switch (ctrl->id) {
> > > >       case V4L2_CID_FLASH_LED_MODE:
> > > >               flash->led_mode = ctrl->val;
> > > > @@ -246,6 +264,8 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
> > > >               break;
> > > >       }
> > > >
> > > > +     pm_runtime_put(flash->dev);
> > > > +
> > > >       return rval;
> > > >  }
> > > >
> > > > @@ -409,6 +429,38 @@ static int lm3560_init_device(struct lm3560_flash *flash)
> > > >       return rval;
> > > >  }
> > > >
> > > > +static int __maybe_unused lm3560_power_off(struct device *dev)
> > > > +{
> > > > +     struct lm3560_flash *flash = dev_get_drvdata(dev);
> > > > +
> > > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > > > +     regulator_disable(flash->vin_supply);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int __maybe_unused lm3560_power_on(struct device *dev)
> > > > +{
> > > > +     struct lm3560_flash *flash = dev_get_drvdata(dev);
> > > > +     int rval;
> > > > +
> > > > +     rval = regulator_enable(flash->vin_supply);
> > > > +     if (rval < 0) {
> > > > +             dev_err(flash->dev, "failed to enable vin power supply\n");
> > > > +             return rval;
> > > > +     }
> > > > +
> > > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > > > +
> > > > +     rval = lm3560_init_device(flash);
> > > > +     if (rval < 0) {
> > > > +             lm3560_power_off(dev);
> > > > +             return rval;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> > > >  {
> > > >       int led_no;
> > > > @@ -442,6 +494,17 @@ static int lm3560_probe(struct i2c_client *client)
> > > >
> > > >       bitmap_zero(flash->led_id, LM3560_LED_MAX);
> > > >
> > > > +     flash->hwen_gpio = devm_gpiod_get_optional(flash->dev, "enable",
> > > > +                                                GPIOD_OUT_LOW);
> > > > +     if (IS_ERR(flash->hwen_gpio))
> > > > +             return dev_err_probe(flash->dev, PTR_ERR(flash->hwen_gpio),
> > > > +                                  "failed to get hwen gpio\n");
> > > > +
> > > > +     flash->vin_supply = devm_regulator_get(flash->dev, "vin");
> > > > +     if (IS_ERR(flash->vin_supply))
> > > > +             return dev_err_probe(flash->dev, PTR_ERR(flash->vin_supply),
> > > > +                                  "failed to get vin-supply\n");
> > > > +
> > > >       flash->peak = LM3560_PEAK_1600mA;
> > > >       rval = device_property_read_u32(flash->dev,
> > > >                                       "ti,peak-current-microamp", &peak_ua);
> > > > @@ -469,9 +532,19 @@ static int lm3560_probe(struct i2c_client *client)
> > > >                                &flash->max_flash_timeout);
> > > >       flash->max_flash_timeout /= 1000;
> > > >
> > > > +     rval = regulator_enable(flash->vin_supply);
> > > > +     if (rval < 0)
> > > > +             return dev_err_probe(flash->dev, rval,
> > > > +                                  "failed to enable vin power supply\n");
> > > > +
> > > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> > > > +
> > > >       rval = lm3560_init_device(flash);
> > > >       if (rval < 0)
> > > > -             return rval;
> > > > +             goto error_disable;
> > > > +
> > > > +     pm_runtime_set_active(flash->dev);
> > > > +     pm_runtime_enable(flash->dev);
> > > >
> > > >       for_each_available_child_of_node(dev_of_node(flash->dev), node) {
> > > >               u32 reg;
> > > > @@ -492,10 +565,10 @@ static int lm3560_probe(struct i2c_client *client)
> > > >
> > > >                       rval = lm3560_subdev_init(flash, reg, node);
> > > >                       if (rval < 0) {
> > > > -                             lm3560_subdev_cleanup(flash);
> > > > -                             return dev_err_probe(flash->dev, rval,
> > > > -                                                 "failed to register led%d\n",
> > > > -                                                 reg);
> > > > +                             dev_err(flash->dev,
> > > > +                                     "failed to register led%d: %d\n",
> > > > +                                     reg, rval);
> > > > +                             goto error_clean;
> > > >                       }
> > > >
> > > >                       set_bit(reg, flash->led_id);
> > > > @@ -504,7 +577,23 @@ static int lm3560_probe(struct i2c_client *client)
> > > >
> > > >       i2c_set_clientdata(client, flash);
> > > >
> > > > +     pm_runtime_set_autosuspend_delay(flash->dev, 1000);
> > > > +     pm_runtime_use_autosuspend(flash->dev);
> > > > +     pm_runtime_idle(flash->dev);
> > > > +
> > > >       return 0;
> > > > +
> > > > +error_clean:
> > > > +     pm_runtime_disable(flash->dev);
> > > > +     pm_runtime_set_suspended(flash->dev);
> > > > +
> > > > +     lm3560_subdev_cleanup(flash);
> > > > +
> > > > +error_disable:
> > > > +     gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> > > > +     regulator_disable(flash->vin_supply);
> > > > +
> > > > +     return rval;
> > > >  }
> > > >
> > > >  static void lm3560_remove(struct i2c_client *client)
> > > > @@ -512,8 +601,22 @@ static void lm3560_remove(struct i2c_client *client)
> > > >       struct lm3560_flash *flash = i2c_get_clientdata(client);
> > > >
> > > >       lm3560_subdev_cleanup(flash);
> > > > +
> > > > +     /*
> > > > +      * Disable runtime PM. In case runtime PM is disabled in the kernel,
> > > > +      * make sure to turn power off manually.
> > > > +      */
> > > > +     pm_runtime_disable(&client->dev);
> > > > +     if (!pm_runtime_status_suspended(&client->dev)) {
> > > > +             lm3560_power_off(&client->dev);
> > > > +             pm_runtime_set_suspended(&client->dev);
> > > > +     }
> > > >  }
> > > >
> > > > +static const struct dev_pm_ops lm3560_pm_ops = {
> > > > +     SET_RUNTIME_PM_OPS(lm3560_power_off, lm3560_power_on, NULL)
> > > > +};
> > > > +
> > > >  static const struct of_device_id lm3560_of_match[] = {
> > > >       { .compatible = "ti,lm3559" },
> > > >       { .compatible = "ti,lm3560" },
> > > > @@ -532,7 +635,7 @@ MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
> > > >  static struct i2c_driver lm3560_i2c_driver = {
> > > >       .driver = {
> > > >                  .name = LM3560_NAME,
> > > > -                .pm = NULL,
> > > > +                .pm = pm_ptr(&lm3560_pm_ops),
> > > >                  .of_match_table = lm3560_of_match,
> > > >                  },
> > > >       .probe = lm3560_probe,
> > >
> > > --
> > > Kind regards,
> > >
> > > Sakari Ailus

-- 
Sakari Ailus

