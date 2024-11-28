Return-Path: <linux-media+bounces-22240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE0E9DBB8A
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 17:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABF9E282452
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BF81BD9FD;
	Thu, 28 Nov 2024 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFHrPcZ/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA1C19923C
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732812652; cv=none; b=sD4a/7pENvzu4veVX1r6VV5v9SqMSrBNHmYKj6WkpDyQvPN0w+akTuJXwbvkvoMdCDD0kZl+7OyyI+rkDuNjCNWYRtQa4pjQehJNRAcO+jU/DALIecc3bXc4wDlSo9r5qIYH8cBOJWG7qKb9Q5pmxLkaIxgpv3Li4ynNjifnO5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732812652; c=relaxed/simple;
	bh=cAKcgzbsAkHcoMQVjZA053Kf1lEEpJMGkhIDNb/O7iM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QI6kmN0QBU1dOmmOMAtdXo6DgT1yn04/hu1sFXn3sUqa33aILRWwyfp/2V6ILKl9W0prHBXMORlHIATkDZqe4/HequIaSJBUYUFyJ8JbdKDYDy3xhekSdXTuSEPgOYSlNmNrQzh2SVYypj98uTUdG72iP6jsx74SRFImV/FxGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFHrPcZ/; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5152377321cso289852e0c.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 08:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732812649; x=1733417449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVi0gXEFjcHFqNU07rv8qbPGt5btAOnDzzMnTuOazoE=;
        b=KFHrPcZ/6eOBwmZRRUfT2/KPEuWxpoC4vzmU6Blp47X9Aj6O7uiReG3o/w8ir8zgOs
         /GndtWNwMAsOBEHaxN3Du7N02qR8ufe4kZvl21LTbG2Sy+mSm++bHcMfDRFX9oTCuHMJ
         +iqIfE/SBLL7TlIAaFRlxeqLIjvvv3JTZmmmY9Zprf6BJ1AObgHgHrI07hIVzn6VxdMF
         i1bByb+juTlHm+hobGaZruoCiVZV3YuHWSvxh/T4Gv7vyO+APTSZYkR9S7gCSrJ3Q93o
         YttR5Hhk57lW56uuPUAdwPBCtnsL7wD4ki17ooQvslvtd7LmWkpiLkcusSD0Cn9fZ/h4
         9JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732812649; x=1733417449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVi0gXEFjcHFqNU07rv8qbPGt5btAOnDzzMnTuOazoE=;
        b=tQCqNs3/YsT/anz3FqvjON+TJqmE9mR2IjOL42TNn3T0ovvy1qZPcYfSVvnQFDR9rY
         24p+72IyBwhnrybbGVcVRq5vOkeplX0ibBH7Su1xr0AqzxSwTpLbT3bMSMmmZvrGqif2
         fwE6Fn+kniN0sVneZTRZrQxB08IHLL6jSZrvoageKCwtWcuD/bpr8im+jLNVr2ymIVRN
         P42o1wgASecMdZIRw1Hmdx6jmW/AzbT5s4WsEQ27VASQjaFZxEU9A4GmxdMp6XHPKgHq
         nH4MCjyB3xZRM96BVuehyE9HQ790mUb3et+xqCsbPTuncllvo58cxY/8qrbFII6z/CW3
         EV8g==
X-Forwarded-Encrypted: i=1; AJvYcCUneadS0uKPqTFwP36xGTMoVx1/Ba5PTvu2DhFBC4Ws0IwFQUOysxJ3FhNF3SMsAP3+UBruBCeBPIuXpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz5aC2H/94wY1hbw3efuizFp2oDvaSJ7hXE9WKFa8Ru5qMk5rA
	2el21nUjoyr6317j2Dfe1amg4v+6kLhQggHy+Y6pIMdtlwgyVQp1VuNC00pQgXPa6zf8n6hjmJY
	H0p1O6AB+l56myAW9KchaFd2xuOg=
X-Gm-Gg: ASbGncv4t7DLIr9PdM2SyfFir8epfiVa0dGbREB2bMvEUn3JVyOsPnm6FDKsaM8roQo
	wMb4Dr72pnAErFTVLSpo+GW6vZ7qnHw==
X-Google-Smtp-Source: AGHT+IHKs09DHKUjkHTB+k2Mcfgyq0KXyk07xVPktgMuhqAKhty5h1hvOzp1JhkPrCl/KX1kq3enpjoN/uNXzfKsiCM=
X-Received: by 2002:a05:6122:658a:b0:515:26e7:736 with SMTP id
 71dfb90a1353d-5155693e11cmr10454295e0c.6.1732812649218; Thu, 28 Nov 2024
 08:50:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128152338.4583-1-hdegoede@redhat.com> <20241128152338.4583-5-hdegoede@redhat.com>
In-Reply-To: <20241128152338.4583-5-hdegoede@redhat.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 28 Nov 2024 17:50:33 +0100
Message-ID: <CAPybu_2zcucNaMkE=mbSbf1R_BVDxz6V7Rmz4Q_hOKiviKu43g@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: ov2740: Add regulator support
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 4:24=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> On some designs the regulators for the AVDD / DOVDD / DVDD power rails
> are controlled by Linux.
>
> Add support to the driver for getting regulators for these 3 rails and
> for enabling these regulators when necessary.
>
> The datasheet specifies a delay of 0ns between enabling the regulators,
> IOW they can all 3 be enabled at the same time. This allows using the bul=
k
> regulator API.
>
> The regulator core will provide dummy regulators for the 3 power-rails
> when necessary.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>

Do we need to update the device tree with this change? (honest
question :), I have no idea)

> ---
>  drivers/media/i2c/ov2740.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 14d0a0588cc2..c766c1f83e12 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -11,6 +11,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/nvmem-provider.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -76,6 +77,14 @@
>  /* OTP registers from sensor */
>  #define OV2740_REG_OTP_CUSTOMER                0x7010
>
> +static const char * const ov2740_supply_name[] =3D {
> +       "AVDD",
> +       "DOVDD",
> +       "DVDD",
> +};
> +
> +#define OV2740_NUM_SUPPLIES ARRAY_SIZE(ov2740_supply_name)
> +
>  struct nvm_data {
>         struct nvmem_device *nvmem;
>         struct regmap *regmap;
> @@ -523,10 +532,11 @@ struct ov2740 {
>         struct v4l2_ctrl *hblank;
>         struct v4l2_ctrl *exposure;
>
> -       /* GPIOs, clocks */
> +       /* GPIOs, clocks, regulators */
>         struct gpio_desc *reset_gpio;
>         struct gpio_desc *powerdown_gpio;
>         struct clk *clk;
> +       struct regulator_bulk_data supplies[OV2740_NUM_SUPPLIES];
>
>         /* Current mode */
>         const struct ov2740_mode *cur_mode;
> @@ -1309,6 +1319,7 @@ static int ov2740_suspend(struct device *dev)
>         gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
>         gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
>         clk_disable_unprepare(ov2740->clk);
> +       regulator_bulk_disable(OV2740_NUM_SUPPLIES, ov2740->supplies);
>         return 0;
>  }
>
> @@ -1318,10 +1329,16 @@ static int ov2740_resume(struct device *dev)
>         struct ov2740 *ov2740 =3D to_ov2740(sd);
>         int ret;
>
> -       ret =3D clk_prepare_enable(ov2740->clk);
> +       ret =3D regulator_bulk_enable(OV2740_NUM_SUPPLIES, ov2740->suppli=
es);
>         if (ret)
>                 return ret;
>
> +       ret =3D clk_prepare_enable(ov2740->clk);
> +       if (ret) {
> +               regulator_bulk_disable(OV2740_NUM_SUPPLIES, ov2740->suppl=
ies);
> +               return ret;
> +       }
> +
>         gpiod_set_value_cansleep(ov2740->powerdown_gpio, 0);
>         gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
>         msleep(20);
> @@ -1334,7 +1351,7 @@ static int ov2740_probe(struct i2c_client *client)
>         struct device *dev =3D &client->dev;
>         struct ov2740 *ov2740;
>         bool full_power;
> -       int ret;
> +       int i, ret;
>
>         ov2740 =3D devm_kzalloc(&client->dev, sizeof(*ov2740), GFP_KERNEL=
);
>         if (!ov2740)
> @@ -1372,6 +1389,13 @@ static int ov2740_probe(struct i2c_client *client)
>                 return dev_err_probe(dev, PTR_ERR(ov2740->clk),
>                                      "failed to get clock\n");
>
> +       for (i =3D 0; i < OV2740_NUM_SUPPLIES; i++)
> +               ov2740->supplies[i].supply =3D ov2740_supply_name[i];
> +
> +       ret =3D devm_regulator_bulk_get(dev, OV2740_NUM_SUPPLIES, ov2740-=
>supplies);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to get regulators\=
n");
> +
>         full_power =3D acpi_dev_state_d0(&client->dev);
>         if (full_power) {
>                 /* ACPI does not always clear the reset GPIO / enable the=
 clock */
> --
> 2.47.0
>
>


--=20
Ricardo Ribalda

