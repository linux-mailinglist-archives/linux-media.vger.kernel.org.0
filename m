Return-Path: <linux-media+bounces-17385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A6968D19
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 20:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C60221C220FD
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 18:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D48205E0D;
	Mon,  2 Sep 2024 18:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Rj+DUTF9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CE01C62C5
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725300638; cv=none; b=DzVJuzvsmoTnpkKnNZPyTVHRLOo11cdhsM4f28mZfNaK4a6U/Zlsrvh16gBjH02nFKZz7KgK7RuyTpg+PQqcYxqdIwMIGyPJ3h2SZplMsyyBfhdNIfIe8OXs2pBmZ0EJgtBDs6FXiIrpHA42qW/YxxRYrzZwRN4aIA8aX/bXMck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725300638; c=relaxed/simple;
	bh=3cL5NMcgEXtbhFptOectthbG4sP6a7RMPWmpWfXZ9hM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajSKwCh8KVPpmfDMnCJluAF3V2H1vLIG30bGQkK2cIUPKSM25VL/Jq7TXs3XIUUmTBJkIUM3zwK45iqPrr0NrbjZq/qxhMJTHtjyAbGhSCzLkFS8WkJ8u8s6kZ8VZ0PnXGgPp5cp+YCiDqDhSIe7MqZ+Fevg97RFjyrUSAZPqTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Rj+DUTF9; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6b47ff8a59aso40150907b3.2
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 11:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1725300635; x=1725905435; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YOzFMa9JvKLNWav1OD93oKbCZ1rl0D3dPw5owUu5nzM=;
        b=Rj+DUTF9IrePyMDKuvI2g674CWmI0P0uLCQux45d84wmtOHmj3gAJr1O9EZ6Zk20N0
         GPFxbv6MHCLn8v4Zx+1zh5xXmy5uSwmIujGc/JqkjBc4Rzd1IxqC9muX44A4AU1rUsfX
         DBBr8UprY4xxTiQiaE2KB1s3U11JVOu/cnQVrdgp7no3MZ3rfw0HJ5CZL9NhUHb1m6xJ
         bR/Tu2i1JYKYmAsF+OlDyeQeV4bA+N2EyGn2MDKGJ8ujqF5xPRbzhw7hjl3Namw6d0LF
         kMUAx21YPcTfwsuinxPoj0a93g2ObcB6brn4r9QJ4QmqauE4G+uGAoVC6A9QiYj9Kazw
         xlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725300635; x=1725905435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOzFMa9JvKLNWav1OD93oKbCZ1rl0D3dPw5owUu5nzM=;
        b=M6gY9uOrZlIE2FEAinVoFvKNMYVBr04CDPKYK9QxjxbJNrd1llSmuFEZzHARJn1eTv
         5E+KxsafehXLKayHU97bw6wMFx/fzsCNsv6GOCeJEEzx7FxYbDIAUxH8KJ6wlG1Jp0Cd
         YXctAUcE59fQ1Py/kYEBo2NTyVp65Yu+/lBq2TdOjSzj1sr9S3id2jS5F3zUiaNyypSu
         JAx+eEgF2ZTmJTXElZ7BTpjEuohAVsJNo1GRJxonYOPiNp/O0m7YrpUrxUy3Stj8umX3
         84hFPiQYptLUvwxd0HmwfYOumO1esruR/VYrbgyPOEqRhrdmWCkEKDo2c4OxRDay4RXs
         4qBA==
X-Forwarded-Encrypted: i=1; AJvYcCVPwCWmJO23vrmdBXXvrp6wKiJU/C+yL1I4P7cKieMyYEDc/ZsT0nznEiJ3BOXDp2rMPxST48DjDRTf7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZMIhgSQYrUNRIinU+rrAEa0N0le4IczIKT+t12jUbVjngnH68
	tAmfzNd30G/Sp3rWzZ0x0HH3LO6IcNpMslAoDjbjePQdQ44+xY/s0KcSBuikZef4MF8mr7Ri6+u
	SbWjMQUtUTD81R9cS8kkIUv/P834v6HO6kmAsxg==
X-Google-Smtp-Source: AGHT+IGvdze6QLu4u7QZREmqsj+OPK7Zr+FCdq2/LnaRDq91d4uRwf8j4lp8zyPXyQ0kTiQMVcgTEOh3e9m6/hEk4/Y=
X-Received: by 2002:a05:690c:dca:b0:632:5b24:c0c with SMTP id
 00721157ae682-6d40ee57299mr134666787b3.5.1725300634884; Mon, 02 Sep 2024
 11:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com> <20240902-imx290-avail-v3-7-b32a12799fed@skidata.com>
In-Reply-To: <20240902-imx290-avail-v3-7-b32a12799fed@skidata.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 2 Sep 2024 19:10:19 +0100
Message-ID: <CAPY8ntA8V+816=UwaDa7Y-8vccPNfOoLQUvkQbC6KAtDZ0QxKw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] media: i2c: imx290: Implement a "privacy mode" for probe()
To: bbara93@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Benjamin

On Mon, 2 Sept 2024 at 16:59, <bbara93@gmail.com> wrote:
>
> From: Benjamin Bara <benjamin.bara@skidata.com>
>
> Currently, we have a trade-off between potentially enabling the privacy
> LED and reading out the connection state of the sensor during probe().
>
> To have a somewhat defined policy for now, make a decision based on the
> power supplies of the sensor. If they are enabled anyways, communicate
> with the powered sensor for an availability check. Otherwise, create the
> subdevice without knowing whether the sensor is connected or not.

Almost all the camera modules used on Raspberry Pi have regulators
controlled via a GPIO, but no privacy LED. The preference from us is
very definitely to query the sensor during probe where possible to
flag up any connectivity issues, and indeed I've had a number of
support threads with imx290 where it's just not been connected but it
probed fully and showed up in libcamera.

How can I opt in to patch 6 checking basic I2C to the sensor during
probe when I have a controllable regulator? (This is where the
discussions over a dtbinding for privacy LEDs and not powering up
sensors during probe comes in).

Thanks
  Dave

> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
> Changes since v2:
> - new
> ---
>  drivers/media/i2c/imx290.c | 82 ++++++++++++++++++++++++++++++++--------------
>  1 file changed, 57 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 6b292bbb0856..338b2c5ea547 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1354,6 +1354,17 @@ static void imx290_subdev_cleanup(struct imx290 *imx290)
>   * Power management
>   */
>
> +static bool is_imx290_power_on(struct imx290 *imx)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(imx->supplies); i++)
> +               if (!regulator_is_enabled(imx->supplies[i].consumer))
> +                       return false;
> +
> +       return true;
> +}
> +
>  static int imx290_power_on(struct imx290 *imx290)
>  {
>         int ret;
> @@ -1571,6 +1582,7 @@ static int imx290_probe(struct i2c_client *client)
>  {
>         struct device *dev = &client->dev;
>         struct imx290 *imx290;
> +       bool power_on;
>         u64 val;
>         int ret;
>
> @@ -1611,36 +1623,54 @@ static int imx290_probe(struct i2c_client *client)
>                 return ret;
>
>         /*
> -        * Enable power management. The driver supports runtime PM, but needs to
> -        * work when runtime PM is disabled in the kernel. To that end, power
> -        * the sensor on manually here.
> +        * Privacy mode: if the regulators are not enabled, avoid enabling them.
> +        * In case the regulators are enabled, we still want to make sure that
> +        * the regulators know that they have another consumer, therefore run
> +        * the powering sequence.
>          */
> -       ret = imx290_power_on(imx290);
> -       if (ret < 0) {
> -               dev_err(dev, "Could not power on the device\n");
> -               return ret;
> +       power_on = is_imx290_power_on(imx290);
> +       dev_dbg(dev, "%s: power on: %d\n", __func__, power_on);
> +       if (power_on) {
> +               /*
> +                * Enable power management. The driver supports runtime PM, but
> +                * needs to work when runtime PM is disabled in the kernel. To
> +                * that end, power the sensor on manually here.
> +                */
> +               ret = imx290_power_on(imx290);
> +               if (ret < 0) {
> +                       dev_err(dev, "Could not power on the device\n");
> +                       return ret;
> +               }
> +
> +               /*
> +                * Enable runtime PM with autosuspend. As the device has been
> +                * powered manually, mark it as active, and increase the usage
> +                * count without resuming the device.
> +                */
> +               pm_runtime_set_active(dev);
> +               pm_runtime_get_noresume(dev);
>         }
>
> -       /*
> -        * Enable runtime PM with autosuspend. As the device has been powered
> -        * manually, mark it as active, and increase the usage count without
> -        * resuming the device.
> -        */
> -       pm_runtime_set_active(dev);
> -       pm_runtime_get_noresume(dev);
>         pm_runtime_enable(dev);
>         pm_runtime_set_autosuspend_delay(dev, 1000);
>         pm_runtime_use_autosuspend(dev);
>
> -       /* Make sure the sensor is available before V4L2 subdev init. */
> -       ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> -       if (ret) {
> -               ret = dev_err_probe(dev, -ENODEV, "Failed to detect sensor\n");
> -               goto err_pm;
> -       }
> -       if (val != IMX290_STANDBY_STANDBY) {
> -               ret = dev_err_probe(dev, -ENODEV, "Sensor is not in standby\n");
> -               goto err_pm;
> +       /*
> +        * Make sure the sensor is available before V4L2 subdev init.
> +        * This only works when the sensor is powered.
> +        */
> +       if (power_on) {
> +               ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> +               if (ret) {
> +                       ret = dev_err_probe(dev, -ENODEV,
> +                                           "Failed to detect sensor\n");
> +                       goto err_pm;
> +               }
> +               if (val != IMX290_STANDBY_STANDBY) {
> +                       ret = dev_err_probe(dev, -ENODEV,
> +                                           "Sensor is not in standby\n");
> +                       goto err_pm;
> +               }
>         }
>
>         /* Initialize the V4L2 subdev. */
> @@ -1666,8 +1696,10 @@ static int imx290_probe(struct i2c_client *client)
>          * Decrease the PM usage count. The device will get suspended after the
>          * autosuspend delay, turning the power off.
>          */
> -       pm_runtime_mark_last_busy(dev);
> -       pm_runtime_put_autosuspend(dev);
> +       if (power_on) {
> +               pm_runtime_mark_last_busy(dev);
> +               pm_runtime_put_autosuspend(dev);
> +       }
>
>         return 0;
>
>
> --
> 2.46.0
>
>

