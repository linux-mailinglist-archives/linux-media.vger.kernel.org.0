Return-Path: <linux-media+bounces-24958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 184A4A16C58
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C37018830CF
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D611DFE00;
	Mon, 20 Jan 2025 12:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jYvunCzR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26BC1DF257
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737376107; cv=none; b=aIGDpJ62bYC9d97aSatYG1QUbxKd1mdXcSIOrx0sMbfGGEiSd1c3lE+K24DSEMM623qe6EwlQNMC6qScqrXkzZuA+V/Q1+yrnlBr4xutW7ZdVfB2KPLTxomrz8J7OtwPD13vr7D5sQS9j860FuNSDwh81nXiP/WZCH0P+H/9XRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737376107; c=relaxed/simple;
	bh=CK3xPvQnCokeTskE75DijI6ZmLLDOJM1rjdUxpcDxnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJXUGQhFevjD99J+QUa+cuyuqL5CMZdO5S76z7xlzVk605V61wT0MP7wDlgp0QqQfZI31vzKx3DInpq1TnqJrg9AZjNt5mX5ncjGzwObxpxunUpEoRUTr5WRE7XfingoXdr/1IXOlgeLgHqiel/4IwaB1wuigwGCAPfH4ZapN9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jYvunCzR; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e53537d8feeso6317687276.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 04:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737376104; x=1737980904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lV70bDDXqQSLTw4jmAF3p1crqVCV8bGnlVi82KemcAo=;
        b=jYvunCzRUFPRE9VhbBlPh0Vuny2H7Ce9cG+zFR2KNDH33BcW/h/10wQh4EQ4P3pMXu
         yi6O/X5Ag0eCC1y3KflnpXwwsHZ1FnLrTveZ19c3wYrBj0q/cg35mfGsTHl4vbE2hm4m
         BcJMrroy5v4flCMuv0LopwuJJWM4AwKmFuZQsf0zh4wIe262iq4BCPApiCPIUP0vZsza
         ibJuZRDmNae5tzCSuflhk/uq4U/5kcv0keA9tkxzmKHDWO69ih9UThTYN+aqCmMaYQWF
         FZ3ES2HoJehOcWkgtCCwAZdNEPynVibLDEuqXMZonarXtCD3sWDqtgqZgsptQoBXDi+L
         Kvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737376104; x=1737980904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV70bDDXqQSLTw4jmAF3p1crqVCV8bGnlVi82KemcAo=;
        b=ajmSKDiASC7uwjvD3IUDMyirXP+fOU7a5Cfq+igXITInTanvDnMCOFgWPw6QWYcSMu
         OGeEkNBqYdTilbvLIxIYQxC1JVd5ijVxzxQRR7t2qIfONjZLljMOOneHW+iOEZfOYZ+I
         JvtTjjPbkMMynu3eSQA9L+79nywOQ6xsAqgLg9IvPVs07rsBskUJmxoyuyEbwQmHf3sV
         cba1c2MZyxgc95ozUNluv4LdPDknhS3AUtxiF+lWep8ICcofBteeKfEkg02mR0j6h6F6
         nyCZnWqQCvJgf+/cThbFfGySHt+cSPUqE7IvMuFvp3m0qpFhml4HvJhHUwwnzE5QR92X
         zqZg==
X-Forwarded-Encrypted: i=1; AJvYcCWRAVtxwJtsOKeNneltIqxfNUwcQywEpHw+AFb2kEGw9FpQCDq/sI986tKkbDrZ73GMVcIQE/xm4q2bWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsY6wGV2Aiiv86HkhJfPfQUgrWMTWQnhZpokxOHcksVszyy9gB
	DmYfp7PwCQ2iLrHj/v2XfBZ/lyRH/FUYMHNw1ysjUzazjbuWZSdavklH/MfJuphlzWqjEfdJk+d
	2QZVHMtlbdAuun/S9KgkpKtWus+Z0Yien9MBj7Q==
X-Gm-Gg: ASbGncvVbWVhUn3ZJnDiKncS/Itd+NeLgUbmv3aI/hnUt+o30EJ+r5/0l+38Wg6ES6p
	/+FnFLc6od3kvSWMaOUPlQ6lSw7E7Cl5n6YfuHeWuVDIAe4MSKfI=
X-Google-Smtp-Source: AGHT+IEhfd+/gGOPLvTpociBdpXw2s58VpFJSOGSJCUMcfxjlEAS0gGRWbnet6vzaQc6nMmbQQiuNydoXMF+3Vju6ak=
X-Received: by 2002:a05:6902:2387:b0:e57:3bef:e083 with SMTP id
 3f1490d57ef6-e57b135201fmr9723975276.43.1737376103848; Mon, 20 Jan 2025
 04:28:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20200110200915.22575-1-andrey.konovalov@linaro.org>
 <20200110200915.22575-3-andrey.konovalov@linaro.org> <Z44soIWngnmCjoe6@kekkonen.localdomain>
In-Reply-To: <Z44soIWngnmCjoe6@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 20 Jan 2025 12:28:04 +0000
X-Gm-Features: AbW1kvaiuOZQSNGomDp4EsawWoPbCa79FN43ZoZFckeOa6XV8JIiDtpsNJu29Ow
Message-ID: <CAPY8ntBXwUmjSgb2z65mUZ1GSEUT8oczQMN+dewaevz9HemYag@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: Add driver for Sony IMX219 sensor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: robh+dt@kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, peter.griffin@linaro.org, ezequiel@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Mon, 20 Jan 2025 at 10:59, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Fri, Jan 10, 2020 at 11:09:15PM +0300, Andrey Konovalov wrote:
> > +/* Power/clock management functions */
> > +static int imx219_power_on(struct device *dev)
> > +{
> > +     struct i2c_client *client = to_i2c_client(dev);
> > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +     struct imx219 *imx219 = to_imx219(sd);
> > +     int ret;
> > +
> > +     ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
> > +                                 imx219->supplies);
> > +     if (ret) {
> > +             dev_err(&client->dev, "%s: failed to enable regulators\n",
> > +                     __func__);
> > +             return ret;
> > +     }
> > +
> > +     ret = clk_prepare_enable(imx219->xclk);
> > +     if (ret) {
> > +             dev_err(&client->dev, "%s: failed to enable clock\n",
> > +                     __func__);
> > +             goto reg_off;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(imx219->reset_gpio, 1);
> > +     msleep(IMX219_XCLR_DELAY_MS);
> > +
> > +     return 0;
> > +reg_off:
> > +     regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> > +     return ret;
> > +}
> > +
> > +static int imx219_power_off(struct device *dev)
> > +{
> > +     struct i2c_client *client = to_i2c_client(dev);
> > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +     struct imx219 *imx219 = to_imx219(sd);
> > +
> > +     gpiod_set_value_cansleep(imx219->reset_gpio, 0);
>
> The polarity of the reset GPIO appears to be wrong above. Given it works
> somewhere (arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso), the
> existing DTS files have it wrong, too. The bindings still appear to
> document it correctly.

Why do you say it is wrong?
I don't recall why this got called reset-gpio - the signal on the
sensor is XCLR, and that is documented in the binding.
The datasheet says low is standby and high is active, which matches
what the driver does.

> Laurent confirmed xcrl isn't controllable in the RPi imx219 camera module.
>
> How about fixing this? Currently correctly written DTBs including imx219
> won't work.

Seeing as the DTB is ABI, the only improvement I can see is to rename
"imx219->reset_gpio" to "imx219->xclr_gpio".
What else would you be proposing?

  Dave

> I noticed this while fixing the power sequences in this and a few other
> drivers.
>
> > +     regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> > +     clk_disable_unprepare(imx219->xclk);
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +static int imx219_probe(struct i2c_client *client,
> > +                     const struct i2c_device_id *id)
> > +{
> > +     struct device *dev = &client->dev;
> > +     struct fwnode_handle *endpoint;
> > +     struct imx219 *imx219;
> > +     int ret;
> > +
> > +     imx219 = devm_kzalloc(&client->dev, sizeof(*imx219), GFP_KERNEL);
> > +     if (!imx219)
> > +             return -ENOMEM;
> > +
> > +     imx219->dev = dev;
> > +
> > +     v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
> > +
> > +     /* Get CSI2 bus config */
> > +     endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> > +                                               NULL);
> > +     if (!endpoint) {
> > +             dev_err(dev, "endpoint node not found\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     ret = v4l2_fwnode_endpoint_parse(endpoint, &imx219->ep);
> > +     fwnode_handle_put(endpoint);
> > +     if (ret) {
> > +             dev_err(dev, "could not parse endpoint\n");
> > +             return ret;
> > +     }
> > +
> > +     /* Check the number of MIPI CSI2 data lanes */
> > +     if (imx219->ep.bus_type != V4L2_MBUS_CSI2_DPHY ||
> > +         imx219->ep.bus.mipi_csi2.num_data_lanes != 2) {
> > +             dev_err(dev, "only 2 data lanes are currently supported\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* Get system clock (xclk) */
> > +     imx219->xclk = devm_clk_get(dev, NULL);
> > +     if (IS_ERR(imx219->xclk)) {
> > +             dev_err(dev, "failed to get xclk\n");
> > +             return PTR_ERR(imx219->xclk);
> > +     }
> > +
> > +     imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > +     if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> > +             dev_err(dev, "xclk frequency not supported: %d Hz\n",
> > +                     imx219->xclk_freq);
> > +             return -EINVAL;
> > +     }
> > +
> > +     ret = imx219_get_regulators(imx219);
> > +     if (ret) {
> > +             dev_err(dev, "failed to get regulators\n");
> > +             return ret;
> > +     }
> > +
> > +     /* Request optional enable pin */
> > +     imx219->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > +                                                   GPIOD_OUT_HIGH);
> > +
> > +     /*
> > +      * The sensor must be powered for imx219_identify_module()
> > +      * to be able to read the CHIP_ID register
> > +      */
> > +     ret = imx219_power_on(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = imx219_identify_module(imx219);
> > +     if (ret)
> > +             goto error_power_off;
> > +
> > +     /* Set default mode to max resolution */
> > +     imx219->mode = &supported_modes[0];
> > +
> > +     ret = imx219_init_controls(imx219);
> > +     if (ret)
> > +             goto error_power_off;
> > +
> > +     /* Initialize subdev */
> > +     imx219->sd.internal_ops = &imx219_internal_ops;
> > +     imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +     /* Initialize source pad */
> > +     imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +
> > +     ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> > +     if (ret) {
> > +             dev_err(dev, "failed to init entity pads: %d\n", ret);
> > +             goto error_handler_free;
> > +     }
> > +
> > +     ret = v4l2_async_register_subdev_sensor_common(&imx219->sd);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
> > +             goto error_media_entity;
> > +     }
> > +
> > +     /* Enable runtime PM and turn off the device */
> > +     pm_runtime_set_active(dev);
> > +     pm_runtime_enable(dev);
> > +     pm_runtime_idle(dev);
> > +
> > +     return 0;
> > +
> > +error_media_entity:
> > +     media_entity_cleanup(&imx219->sd.entity);
> > +
> > +error_handler_free:
> > +     imx219_free_controls(imx219);
> > +
> > +error_power_off:
> > +     imx219_power_off(dev);
> > +
> > +     return ret;
> > +}
>
> --
> Kind regards,
>
> Sakari Ailus

