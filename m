Return-Path: <linux-media+bounces-43348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3148FBA9C61
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 17:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8317D1893249
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 15:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFB030AAD7;
	Mon, 29 Sep 2025 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="faWBlZHd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7990C253954
	for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759159130; cv=none; b=alv+iqa1mJhCApLmb4oUJiIYOQQ69AFIBHPxrcVuPCPumtkMxjnb7D2gGBas7XNL6oDP1N2OB4H+x5LFtNc9Igm3E8qOvBUj1r5HY+CZdlbjNsT6aXHoX7leupCg2T9ozVDyOHiqzzkBUBXVY1FuBDNX4rbln8cPKzzFlIvcCTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759159130; c=relaxed/simple;
	bh=hibPDrOfOHA0CG36s6l5BHcQAZEXd6ET6NGSoVXjk1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElLGkEB9rp4iwDz9FfDLOWhHhLoPpDKB+aJXVtaN40YkkS8FFYVSnYxfWsOF2PvET1yHmysfJvduiONzdTnpiaGFxIbUfrSfX1G3pAQcDtn3rxo2JABp4dD3AgCbTR7IcumkM5zAymDs6GG9cNPsj9ZmZnWEq6qDd/uK2/aNc48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=faWBlZHd; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d60150590so47973807b3.0
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1759159127; x=1759763927; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iYN/A+65EY/WuEhTmKR9+ZqOkf3Wq1MC9dNSpJCQVbU=;
        b=faWBlZHdGEA6wK8CqltP/AttVwCzR7m4fQxU7K+3/9YxeZmtBsEHJlhlgzpp/oe+4P
         uUVz2VGHWGxtknR82QjWjfw2jMtIObZH+Wijwn/eEPV5S5lBLKBi3AG7YEyJY/fr55Fl
         /thUQCCkk9nyDCX0muzEbiwI7RQyz6nODH9ZDx8vAhfBRevu0JWrSSl/Q9P2rushX4uZ
         E/bWRqDjOL8nTf0umb6S1EWMOT9Wx0B21n63HzCjWvmFW6uS9YYBsqVRQaEshyTXlZKI
         pgteLDVA9NJsNLaU2zIU7YK6W/Y2JpiWLmknWbq2wELxy0oatZ/LWqxgIWM71WJyO87o
         HoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759159127; x=1759763927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYN/A+65EY/WuEhTmKR9+ZqOkf3Wq1MC9dNSpJCQVbU=;
        b=ZAs+AbsRezoTsmVYEHm4k7USdbxpIwUobjL5QJFnlC/jzFB6eP2rx9JNsM0oLtgLba
         wugLy59/rGNKu64WFWY7Ne9/0/jTRc2LJTyhPsWluEBBMqjiAxS5/BKKyirDK0aSvvEB
         fBOsGGa0y+jyb3QYoituHbb6pMjMsbGq5zMgzdiu11a84zWBwCgeo39MzjTSp+BrxYrt
         C44HyRl37WhQprnZ+XYKKnTo4aq2di8av36RXBRR2G7r5Gm3SIiuYpegk9MY/6m6hh8/
         f0NKvhE+EohvykODE57/jHVr4PrExsB50h3A0GQu7dEpudbzAyXr/lH79UvpLp2VzIWd
         aOpg==
X-Forwarded-Encrypted: i=1; AJvYcCWBdDhweBAxyimFlZzXdmu6KO1q6CCDJHssI9u92iKLZkWqSKjnldfW914ROkJg1+TovtrSuCwnBHIBkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaQ+YaZs/13/YRpG1hqwKxoJCro6jfvrakewdlO5+yP96PKFvu
	mKneZ1gHPmOHAaOfFQixlPSpExpB4iUfVfivwZe5ew27Qb55639/eSljfYqGEYj/KkxGMo8BdO7
	AlT/wfwuf3RCq3rdfY2YBAuRRQ668+W2JMetd+9R41w==
X-Gm-Gg: ASbGncuFL2ifH+52kmRUwKNwysko2w9X1DZlOWtojB0CTNXwK9NPPJsQaH9AzFUm/Q+
	/M7s9ClCadshudQczqDegjD+/9I6DuZpI2+H8n0JHZpQcB/z3ac+8o2C+9DnhpsOqTvpQ5rQTQU
	1naIn4dgvla9cN5M3w+936l6z8sF253r5GUXW3xesVqQvo+4DUMujtxCfPMFXvZn3qY/QxbzLuD
	1xKXXsqcYq6eRdRLSQ=
X-Google-Smtp-Source: AGHT+IH6aaKTBqDQhKhamdrQNEsh8tuXIX0AkhttkqeFUfmWetxxq38nYVAoUQBv1rIBpkR282zs7/4dDQhk5BAa8V0=
X-Received: by 2002:a05:690e:159b:20b0:636:d415:c8a with SMTP id
 956f58d0204a3-636d4151744mr14035717d50.48.1759159126901; Mon, 29 Sep 2025
 08:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com> <20250926073421.17408-2-loic.poulain@oss.qualcomm.com>
In-Reply-To: <20250926073421.17408-2-loic.poulain@oss.qualcomm.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 29 Sep 2025 16:18:26 +0100
X-Gm-Features: AS18NWClwRl4vUPA02512XuMA0r86DHMsQ3YTj65PRq54qagqNkXdrNRLpCDtLk
Message-ID: <CAPY8ntC-Or2ErudHmP0mQMY6Rb8yQ53wkB5fW3b+4DTeeytbdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: i2c: ov9282: Fix reset-gpio logical state
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, sakari.ailus@linux.intel.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, 26 Sept 2025 at 08:34, Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Ensure reset state is low in the power-on state and high in the
> power-off state (assert reset). Note that the polarity is abstracted
> by the GPIO subsystem, so the logic level reflects the intended reset
> behavior.
>
> This breaks backward compatibility for any downstream dts using the
> wrong polarity.

Ouch. That'll be a nasty surprise to some if this lands, and
particularly with a Fixes: tag so it gets backported to stable
kernels.

There are a number of sensor drivers that have been in the tree for
multiple years that do indeed have the reset logic inverted as it
wasn't something being routinely picked up in code review. ov9282,
imx219, imx334, and imx274 for a start. Krzysztof sent [1] recently to
flag that they are wrong and shouldn't be copied, but changing the
behaviour feels unfriendly.

I'll defer to Sakari as to whether this change is acceptable.

Checking all my use cases, they use regulators instead of reset-gpio,
so it doesn't actually have an impact.

  Dave

[1] https://lore.kernel.org/linux-media/20250818150025.247209-2-krzysztof.kozlowski@linaro.org/

> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/i2c/ov9282.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index c882a021cf18..fb6fcba503c8 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1127,7 +1127,7 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>
>         /* Request optional reset pin */
>         ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
> -                                                    GPIOD_OUT_LOW);
> +                                                    GPIOD_OUT_HIGH);
>         if (IS_ERR(ov9282->reset_gpio)) {
>                 dev_err(ov9282->dev, "failed to get reset gpio %ld",
>                         PTR_ERR(ov9282->reset_gpio));
> @@ -1238,7 +1238,7 @@ static int ov9282_power_on(struct device *dev)
>
>         usleep_range(400, 600);
>
> -       gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
> +       gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
>
>         ret = clk_prepare_enable(ov9282->inclk);
>         if (ret) {
> @@ -1261,7 +1261,7 @@ static int ov9282_power_on(struct device *dev)
>  error_clk:
>         clk_disable_unprepare(ov9282->inclk);
>  error_reset:
> -       gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> +       gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
>
>         regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
>
> @@ -1279,7 +1279,7 @@ static int ov9282_power_off(struct device *dev)
>         struct v4l2_subdev *sd = dev_get_drvdata(dev);
>         struct ov9282 *ov9282 = to_ov9282(sd);
>
> -       gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> +       gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
>
>         clk_disable_unprepare(ov9282->inclk);
>
> --
> 2.34.1
>

