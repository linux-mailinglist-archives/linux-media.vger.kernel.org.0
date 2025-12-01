Return-Path: <linux-media+bounces-47964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B2DC97E1A
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 15:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C9BE14E1617
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 14:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DD931AF10;
	Mon,  1 Dec 2025 14:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DyV367uI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2558B30F541
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764600181; cv=none; b=IDFEzod2xsI/lS8415KOyqweUP///6l7i4wvDcYcb1HjC8uIQjuWAFOQ/Ax9pYqV2SRORmdGPPrfBKAIHBDy6/x3rUm1WTlXCv/wBrfwZ19cBaLDP0jKWjruyazeGopeP8I2ZC5xnyA49sa3RvpwsY9/YZnqLOBwL/YSy+Agh38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764600181; c=relaxed/simple;
	bh=P6LyJ9IP5bJ6bEkyBxb0zeluW49Ndt0A+7wS/L+K54U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kP7Dlsi0EVF1q9svOWBOdenY47tJdnaVwxXqhrAekYOKAsW1ZcB6BpWknohndoBNhefNwEiod3BMGY2zCVn46oP3b1WAh6ZaRQhMjV1suQG/gYREKSysauAkw7ftkC1y9c6rucgCrg4vuJCJtZ8+xsPYJZOoLsauGdXxlPiLHRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=DyV367uI; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63fc6d9fde5so3396837d50.3
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 06:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1764600178; x=1765204978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VNSVkBT2XpWiM2YE5tou94J7RkpaKIPjZ8KZt3u6ZSo=;
        b=DyV367uIhbUBZsmQ6JC1qP1/eQp16U2dU7SmzWZtjV1UQGtUH5CUDqSXZb8oNiDz5/
         hQeQkW7qHUCkekv6CRLL9ToAINUnmGNEwxKe51xFMseI61Z55VDBHv7SIdsMYR1FE+J3
         L0q9u9fVgLlbSkZdJr9KpwcG1sE2PPtlPE3QwbLXkewsCL7jpoQ/ekUFjLwKLyedaOXI
         O/i5kWdrkEm2c2waqk7I4ml4FOgyT2YpUvp2JWyj4ELgqEWNOwB2obU9RTZjoXk63ffg
         L+kp8UpaIkNZbiHDcYlNIlY9s2HXo8LtSxTd9xRSE/O836LZGIbfHom1IpywEHHbPanP
         vBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764600178; x=1765204978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNSVkBT2XpWiM2YE5tou94J7RkpaKIPjZ8KZt3u6ZSo=;
        b=jQf5vf0yGV+SAj6OzGhX3xi0xkWWlrHRjXxMEWpgk9LT7evsTxT2OtPdPgyfIT3mys
         HAXgbugX/GBMNojC1ZAQhcKnH5xyWazBx1KCTvfREN+IOU/omqTg2JUYtLSWy7wFEgNr
         9fp+qnN+CJqka3lDRNjkOuAhWj8l5eJ5litKwz7YnAC8g2C+cxLqbK0fjl/GE6A6ryfG
         KSEbV8U5Jb6cgbHXXB4m+BI24Y3uugu2Suea6AI9c4aPC+BFofsmAyDBfBuXJDdYUvO8
         IB0zW2jNO7VlZ9ZavRi9joeWq0bdvqoZA/mog0vqbxzB0NRuZzRgIsV75BKvFHWoJEOw
         JCXg==
X-Forwarded-Encrypted: i=1; AJvYcCWo3sQdmOi1ihqRE5PUUVZp3nYosGj2azmU3eT+ERRFQF8vjI9Ate3s3ah73xKfydVtHHbbV4FOpYKsdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5RIrezuI1O331+YQy34vWy7TPiAcSqs8DjMM6qIUpv5CLufL2
	Bt4M9H5HWntkUcTLM4JktYUIcuDNhNovAZoLNmVN4kWbpakdlSxzegP5MN37PJz6AEQfHGm8dU6
	Xt+3Dk60K6erlc1AdRQ35VQqXmp+uxtopiI9ko8IQYQ==
X-Gm-Gg: ASbGncvUbFv0a67q7Wvs7cdgOKr43ZnFc6ahEzNr6nSAssTMT+ESjajK//veFbtbxAA
	LZjTjo7HbZRJ+G4YfFJGyMlj1i+7ojLmkrlF9NUaue+nwSkgXU6wMx/hUycAQPXcCzGHmeuetwx
	M+idje/kl/JtnSmoZS4LFheVQU/DqestD/g9iUss5ciFOhHqVr/ZoG9hOyrnShEHj9seZLo+K9r
	TPp5Ihi28mtiJFPzC4fPlUfR0U8EhHXpI57cgZosdTpD5rD/sXW27co9xRjdRmkyg/eDfYOWo11
	hHBKdHXiNp4FPt7vN3Zwp6JSb3PH46ZR1uIQIw==
X-Google-Smtp-Source: AGHT+IEEoso/NKbOgKGH2pFUsB8C22p0vupqy/ORwY1aq61Vise9TFkHeuV2X5+aCLP4sGk+OvCo+DJJB9Z2Z4Mc5ws=
X-Received: by 2002:a05:690e:885:b0:643:719:4da2 with SMTP id
 956f58d0204a3-6432924ea88mr14512491d50.26.1764600178120; Mon, 01 Dec 2025
 06:42:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201-media-i2c-lc898217xc-initial-driver-v3-0-46e23897e921@mainlining.org>
 <20251201-media-i2c-lc898217xc-initial-driver-v3-2-46e23897e921@mainlining.org>
In-Reply-To: <20251201-media-i2c-lc898217xc-initial-driver-v3-2-46e23897e921@mainlining.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 1 Dec 2025 14:42:40 +0000
X-Gm-Features: AWmQ_bn0Qia67A-t31mg9seyWOhEEfdPpsFK7RAVfmRGlFrWOIEjCXCg9YSMzNk
Message-ID: <CAPY8ntCKfGX_5wCSnQz3YAmQD_pyeF+q3EoMDxyXA4Dgg9osmg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: i2c: Add driver for LC898217XC VCM
To: Vasiliy Doylov <nekocwd@mainlining.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, david@ixit.cz, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Vitalii Skorkin <nikroks@mainlining.org>, Antonio Rische <nt8r@protonmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vasiliy

On Mon, 1 Dec 2025 at 12:42, Vasiliy Doylov <nekocwd@mainlining.org> wrote:
>
> LC898217XC is a 11 bit DAC, designed for linear control
> of voice coil motor. This driver creates a V4L2 subdevice
> and provides control to set the desired focus.
>
> Tested on Oneplus 6 (oneplus-enchilada)
>
> Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
> ---
>  drivers/media/i2c/Kconfig      |   9 ++
>  drivers/media/i2c/Makefile     |   1 +
>  drivers/media/i2c/lc898217xc.c | 254 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 264 insertions(+)
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4b4db8c4f496..ee071505223f 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -866,6 +866,15 @@ config VIDEO_DW9807_VCM
>           capability. This is designed for linear control of
>           voice coil motors, controlled via I2C serial interface.
>
> +config VIDEO_LC898217XC
> +       tristate "LC898217XC lens voice coil support"
> +       select V4L2_CCI_I2C
> +       help
> +         This is a driver for the LC898217XC camera lens voice coil.
> +         LC898217XC is a 11 bit DAC with 110mA output current sink
> +         capability. This is designed for linear control of
> +         voice coil motors, controlled via I2C serial interface.
> +
>  endif
>
>  menu "Flash devices"
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index c5f17602454f..a17774eeb43c 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_VIDEO_IMX415) += imx415.o
>  obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
>  obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
> +obj-$(CONFIG_VIDEO_LC898217XC) += lc898217xc.o
>  obj-$(CONFIG_VIDEO_LM3560) += lm3560.o
>  obj-$(CONFIG_VIDEO_LM3646) += lm3646.o
>  obj-$(CONFIG_VIDEO_LT6911UXE) += lt6911uxe.o
> diff --git a/drivers/media/i2c/lc898217xc.c b/drivers/media/i2c/lc898217xc.c
> new file mode 100644
> index 000000000000..c2d75bd36ddb
> --- /dev/null
> +++ b/drivers/media/i2c/lc898217xc.c
> @@ -0,0 +1,254 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2025 Vasiliy Doylov <nekocwd@mainlining.org>
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-event.h>
> +
> +#define LC898217XC_NAME "lc898217xc"
> +/* Actuator has 11 bit resolution */
> +#define LC898217XC_MAX_FOCUS_POS (2048 - 1)
> +#define LC898217XC_MIN_FOCUS_POS 0
> +#define LC898217XC_FOCUS_STEPS 1
> +#define LC898217XC_DAC_ADDR CCI_REG16(0x84)
> +
> +static const char *const lc898217xc_supply_names[] = {
> +       "vcc",
> +};
> +
> +struct lc898217xc {
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(lc898217xc_supply_names)];
> +       struct v4l2_ctrl_handler ctrls;
> +       struct v4l2_ctrl *focus;

focus is never used.

> +       struct v4l2_subdev sd;
> +       struct regmap *regmap;
> +};
> +
> +static inline struct lc898217xc *sd_to_lc898217xc(struct v4l2_subdev *subdev)
> +{
> +       return container_of(subdev, struct lc898217xc, sd);
> +}
> +
> +static int lc898217xc_set_dac(struct lc898217xc *lc898217xc, u16 val)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&lc898217xc->sd);
> +       int ret;
> +
> +       ret = cci_write(lc898217xc->regmap, LC898217XC_DAC_ADDR, val, NULL);
> +       if (ret)
> +               dev_err(&client->dev, "failed to set DAC: %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static int __maybe_unused lc898217xc_runtime_suspend(struct device *dev)
> +{
> +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +       struct lc898217xc *lc898217xc = sd_to_lc898217xc(sd);
> +
> +       regulator_bulk_disable(ARRAY_SIZE(lc898217xc_supply_names),
> +                              lc898217xc->supplies);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused lc898217xc_runtime_resume(struct device *dev)
> +{
> +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +       struct lc898217xc *lc898217xc = sd_to_lc898217xc(sd);
> +       int ret;
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(lc898217xc_supply_names),
> +                                   lc898217xc->supplies);
> +
> +       if (ret < 0) {
> +               dev_err(dev, "failed to enable regulators\n");
> +               return ret;
> +       }
> +
> +       usleep_range(8000, 10000);

Do you not want to restore the current position after resuming power?
Potentially use  __v4l2_ctrl_handler_setup() to reset all controls
should any extra ones get added.

> +
> +       return ret;
> +}
> +
> +static int lc898217xc_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct lc898217xc *lc898217xc = container_of(ctrl->handler,
> +                                                    struct lc898217xc, ctrls);
> +
> +       if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
> +               return lc898217xc_set_dac(lc898217xc, ctrl->val);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops lc898217xc_ctrl_ops = {
> +       .s_ctrl = lc898217xc_set_ctrl,
> +};
> +
> +static int lc898217xc_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +       return pm_runtime_resume_and_get(sd->dev);
> +}
> +
> +static int lc898217xc_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +       pm_runtime_mark_last_busy(sd->dev);
> +       pm_runtime_put_autosuspend(sd->dev);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops lc898217xc_int_ops = {
> +       .open = lc898217xc_open,
> +       .close = lc898217xc_close,
> +};
> +
> +static const struct v4l2_subdev_core_ops lc898217xc_core_ops = {
> +       .log_status = v4l2_ctrl_subdev_log_status,
> +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,

subscribe and unsubscribe_event hooks shouldn't be needed if it's only
for controls since e7724e23196a ("media: v4l2-subdev: Refactor
events"). That may not have been merged when you added this in v2.

> +};
> +
> +static const struct v4l2_subdev_ops lc898217xc_ops = {
> +       .core = &lc898217xc_core_ops,
> +};
> +
> +static int lc898217xc_init_controls(struct lc898217xc *lc898217xc)
> +{
> +       struct v4l2_ctrl_handler *hdl = &lc898217xc->ctrls;
> +       const struct v4l2_ctrl_ops *ops = &lc898217xc_ctrl_ops;
> +
> +       v4l2_ctrl_handler_init(hdl, 1);
> +
> +       lc898217xc->focus = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE,
> +                                             LC898217XC_MIN_FOCUS_POS,
> +                                             LC898217XC_MAX_FOCUS_POS,
> +                                             LC898217XC_FOCUS_STEPS, 0);
> +
> +       if (hdl->error)
> +               return hdl->error;
> +
> +       lc898217xc->sd.ctrl_handler = hdl;
> +
> +       return 0;
> +}
> +
> +static int lc898217xc_probe(struct i2c_client *client)
> +{
> +       struct device *dev = &client->dev;
> +       struct lc898217xc *lc898217xc;
> +       unsigned int i;
> +       int ret;
> +
> +       lc898217xc = devm_kzalloc(dev, sizeof(*lc898217xc), GFP_KERNEL);
> +       if (!lc898217xc)
> +               return -ENOMEM;
> +
> +       lc898217xc->regmap = devm_cci_regmap_init_i2c(client, 8);
> +       if (IS_ERR(lc898217xc->regmap))
> +               return dev_err_probe(dev, PTR_ERR(lc898217xc->regmap),
> +                                    "failed to initialize CCI\n");
> +
> +       /* Initialize subdev */
> +       v4l2_i2c_subdev_init(&lc898217xc->sd, client, &lc898217xc_ops);
> +
> +       for (i = 0; i < ARRAY_SIZE(lc898217xc_supply_names); i++)
> +               lc898217xc->supplies[i].supply = lc898217xc_supply_names[i];
> +
> +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(lc898217xc_supply_names),
> +                                     lc898217xc->supplies);
> +
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +       /* Initialize controls */
> +       ret = lc898217xc_init_controls(lc898217xc);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "failed to init v4l2 controls\n");
> +               goto err_free_handler;
> +       }
> +
> +       /* Initialize subdev */
> +       lc898217xc->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +                               V4L2_SUBDEV_FL_HAS_EVENTS;

e7724e23196a  also removes the need for you to set
V4L2_SUBDEV_FL_HAS_EVENTS if you have a ctrl_handler.

  Dave

> +       lc898217xc->sd.internal_ops = &lc898217xc_int_ops;
> +
> +       ret = media_entity_pads_init(&lc898217xc->sd.entity, 0, NULL);
> +       if (ret < 0) {
> +               dev_err_probe(dev, ret, "failed to init media entity pads");
> +               goto err_free_handler;
> +       }
> +
> +       lc898217xc->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +       pm_runtime_enable(dev);
> +       ret = v4l2_async_register_subdev(&lc898217xc->sd);
> +
> +       if (ret < 0) {
> +               dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
> +               goto err_power_off;
> +       }
> +
> +       pm_runtime_set_autosuspend_delay(dev, 1000);
> +       pm_runtime_use_autosuspend(dev);
> +       pm_runtime_idle(dev);
> +
> +       return 0;
> +
> +err_power_off:
> +       pm_runtime_disable(dev);
> +       media_entity_cleanup(&lc898217xc->sd.entity);
> +err_free_handler:
> +       v4l2_ctrl_handler_free(&lc898217xc->ctrls);
> +
> +       return ret;
> +}
> +
> +static void lc898217xc_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +       struct lc898217xc *lc898217xc = sd_to_lc898217xc(sd);
> +       struct device *dev = &client->dev;
> +
> +       v4l2_async_unregister_subdev(&lc898217xc->sd);
> +       v4l2_ctrl_handler_free(&lc898217xc->ctrls);
> +       media_entity_cleanup(&lc898217xc->sd.entity);
> +       pm_runtime_disable(dev);
> +}
> +
> +static const struct of_device_id lc898217xc_of_table[] = {
> +       { .compatible = "onnn,lc898217xc" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, lc898217xc_of_table);
> +
> +static const struct dev_pm_ops lc898217xc_pm_ops = {
> +       SET_RUNTIME_PM_OPS(lc898217xc_runtime_suspend,
> +                          lc898217xc_runtime_resume, NULL)
> +};
> +
> +static struct i2c_driver lc898217xc_i2c_driver = {
> +       .driver = {
> +               .name = LC898217XC_NAME,
> +               .pm = &lc898217xc_pm_ops,
> +               .of_match_table = lc898217xc_of_table,
> +       },
> +       .probe = lc898217xc_probe,
> +       .remove = lc898217xc_remove,
> +};
> +module_i2c_driver(lc898217xc_i2c_driver);
> +
> +MODULE_AUTHOR("Vasiliy Doylov <nekocwd@mainlining.org>");
> +MODULE_DESCRIPTION("Onsemi LC898217XC VCM driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.52.0
>
>

