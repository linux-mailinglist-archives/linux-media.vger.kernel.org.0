Return-Path: <linux-media+bounces-14937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DB92EE6D
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 20:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D13E2848D7
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 18:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E293A16F904;
	Thu, 11 Jul 2024 18:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Kcv5hf2X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529116F8E0
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 18:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720721181; cv=none; b=G9O1q4Hhsh5SXK/KQb4pbo4RJJCZjeuVBgPfbnCnU1pzcK+U4cDdTsYlqJZcux0cMVdw9P7aVlOjTtWQEFR3Fragg5oxycI7X2/R08LJWrlN/xJRD1rydTktMrxbhLvEegRTTsyK2cfImS09aGMvjv16ADVg1SsZwaulq2dl+xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720721181; c=relaxed/simple;
	bh=gFG7bWWKXvaRsOu0x+oSTssCyfH2PUKSwfOd/c3z4As=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVVnjLbsJIGfA+fBTpvaXajgsQZdMxZ0qOtj9H7D4kRRVxKr0mnJHZfmvmSuJJXX1ma+6456U0T49iAC3nchbk+fs1N4VFKXtkZQFN1neSC5Y9HsiL/IhIKYgDZ6rl9qs5XT6xPbXLlQongFqqfjaCDE65GoJXJUeNMnTMbTF3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Kcv5hf2X; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfdb6122992so1119991276.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 11:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1720721177; x=1721325977; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lXKEOscG0VMMrtZere3+7d0XI5uCYwTcT+IzK28hY6E=;
        b=Kcv5hf2XNEUPeQhoS/brUVI8+CO+lbl8SrU+z1dQqqJN9YhAlfR51aCDMZwdSKHnbh
         4KuwH+yjhcorCAslbqSKHlY6Ru7/tHao6ztVsGZu/Ws6bIVyMGG0kGY8OKPYg08YCtcH
         LZqSne/N4mzvoVQj6CYNVOcJVhNyBAKlbl/xv3MtZy8aRWW68Ud4ZDOddYozOIn4Edju
         1IsQ06YYX/A/FdIOY0Z2HQvEugy5YOVuSgHUt8z3yl44lopguDrCI3detqwkRadIkt+w
         fjHFEBgKbbkSsEfpiTRqrQijUMtzRyzXa2BMS3FSgGrPY/KQhOfUk0+4qGzstVuu8mtS
         VHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720721177; x=1721325977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXKEOscG0VMMrtZere3+7d0XI5uCYwTcT+IzK28hY6E=;
        b=vG/RLJe7DWAVzv5IMsIKejifTnM/7E/c6Mnd7MX0db0UlkPAGLmc2AAV/G5IpwOVyl
         g8MametzCAfA+XtfN3cQMXW5dAMDNFjx0WS2Np68R0vIKQaF6O/3QONDUTJrNUx4rL6M
         C3RWLzNP2b0kfNK22kgyUyLtaU3kxmuCA4+71TQJXeC/uH5f5MqBBMPG4EMB/pQH7dyL
         kxjUqvEd2xGL0tF5ygpCVPBgcnL4cK4Shr+wOkPPuODglME5Mrsbb0fL1RDPi8AdWPHz
         rsjTJwh9sL+tMshLUcQIN91CmxH77c6L3jVL4dEJDoajUrlSUezYEMdkhoCBQ1XXPObj
         s+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzBZkO6Rko6bp5iOYYhEs/YhUR/O7fU1TQSolAc1pidLFQcSU9NJqNJCG/mI32s8Sv6/Ryi+/aRqeyZd/nNmL+FxacHQivtKDvf6o=
X-Gm-Message-State: AOJu0YxXaX9crXRHRgK45YuqR00+lblydpjhNg0optMKhDwe2pTqLQ03
	xIxO65Yhk/G2dsUc8eGFUPOJxSiD9+sCkXDwSBBZinXG9OkIeCxWLrSviOwIXOZUl9QKYcQAlB/
	NOWgIYboecqS5f52mN5fxNOeC5x6o38s5zTvumA==
X-Google-Smtp-Source: AGHT+IH33Is+IrdBeix0CoCErKBf5qaiFmD2OHGWO9zmXp9sy2jVTULmnXu3TuSgmYQoSvGvVvSHRcW/E5pEohIaEhY=
X-Received: by 2002:a0d:f942:0:b0:647:7782:421a with SMTP id
 00721157ae682-658f0dc5e12mr96986787b3.45.1720721177082; Thu, 11 Jul 2024
 11:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711-linux-next-ov5675-v2-1-d0ea6ac2e6e9@linaro.org>
In-Reply-To: <20240711-linux-next-ov5675-v2-1-d0ea6ac2e6e9@linaro.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 11 Jul 2024 19:05:59 +0100
Message-ID: <CAPY8ntBvJFDtUKxQkzmnitCH5+uAijswwHmyvc0O=SKGpUSbjg@mail.gmail.com>
Subject: Re: [PATCH v2] media: ov5675: Fix power on/off delay timings
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Johan Hovold <johan@kernel.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bryan

On Thu, 11 Jul 2024 at 15:38, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The ov5675 specification says that the gap between XSHUTDN deassert and the
> first I2C transaction should be a minimum of 8192 XVCLK cycles.
>
> Right now we use a usleep_rage() that gives a sleep time of between about
> 430 and 860 microseconds.
>
> On the Lenovo X13s we have observed that in about 1/20 cases the current
> timing is too tight and we start transacting before the ov5675's reset
> cycle completes, leading to I2C bus transaction failures.
>
> The reset racing is sometimes triggered at initial chip probe but, more
> usually on a subsequent power-off/power-on cycle e.g.
>
> [   71.451662] ov5675 24-0010: failed to write reg 0x0103. error = -5
> [   71.451686] ov5675 24-0010: failed to set plls
>
> The current quiescence period we have is too tight. Instead of expressing
> the post reset delay in terms of the current XVCLK this patch converts the
> power-on and power-off delays to the maximum theoretical delay @ 6 MHz with
> an additional buffer.
>
> 1.365 milliseconds on the power-on path is 1.5 milliseconds with grace.
> 853 microseconds on the power-off path is 900 microseconds with grace.

I think you've got the decimal point in the wrong place for power off.

The comment you've removed in the power off path says
/* 512 xvclk cycles after the last SCCB transation or MIPI frame end */

512 clocks at 6MHz I make 85.3usecs.

I'm happy to be corrected if I've blundered on my maths though.

  Dave

>
> Fixes: 49d9ad719e89 ("media: ov5675: add device-tree support and support runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> v2:
> - Drop patch to read and act on reported XVCLK
> - Use worst-case timings + a reasonable grace period in-lieu of previous
>   xvclk calculations on power-on and power-off.
> - Link to v1: https://lore.kernel.org/r/20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org
>
> v1:
> One long running saga for me on the Lenovo X13s is the occasional failure
> to either probe or subsequently bring-up the ov5675 main RGB sensor on the
> laptop.
>
> Initially I suspected the PMIC for this part as the PMIC is using a new
> interface on an I2C bus instead of an SPMI bus. In particular I thought
> perhaps the I2C write to PMIC had completed but the regulator output hadn't
> become stable from the perspective of the SoC. This however doesn't appear
> to be the case - I can introduce a delay of milliseconds on the PMIC path
> without resolving the sensor reset problem.
>
> Secondly I thought about reset pin polarity or drive-strength but, again
> playing about with both didn't yield decent results.
>
> I also played with the duration of reset to no avail.
>
> The error manifested as an I2C write timeout to the sensor which indicated
> that the chip likely hadn't come out reset. An intermittent fault appearing
> in perhaps 1/10 or 1/20 reset cycles.
>
> Looking at the expression of the reset we see that there is a minimum time
> expressed in XVCLK cycles between reset completion and first I2C
> transaction to the sensor. The specification calls out the minimum delay @
> 8192 XVCLK cycles and the ov5675 driver meets that timing almost exactly.
>
> A little too exactly - testing finally showed that we were too racy with
> respect to the minimum quiescence between reset completion and first
> command to the chip.
>
> Fixing this error I choose to base the fix again on the number of clocks
> but to also support any clock rate the chip could support by moving away
> from a define to reading and using the XVCLK.
>
> True enough only 19.2 MHz is currently supported but for the hypothetical
> case where some other frequency is supported in the future, I wanted the
> fix introduced in this series to still hold.
>
> Hence this series:
>
> 1. Allows for any clock rate to be used in the valid range for the reset.
> 2. Elongates the post-reset period based on clock cycles which can now
> vary.
>
> Patch #2 can still be backported to stable irrespective of patch #1.
> ---
>  drivers/media/i2c/ov5675.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 3641911bc73f..547d6fab816a 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -972,12 +972,10 @@ static int ov5675_set_stream(struct v4l2_subdev *sd, int enable)
>
>  static int ov5675_power_off(struct device *dev)
>  {
> -       /* 512 xvclk cycles after the last SCCB transation or MIPI frame end */
> -       u32 delay_us = DIV_ROUND_UP(512, OV5675_XVCLK_19_2 / 1000 / 1000);
>         struct v4l2_subdev *sd = dev_get_drvdata(dev);
>         struct ov5675 *ov5675 = to_ov5675(sd);
>
> -       usleep_range(delay_us, delay_us * 2);
> +       usleep_range(900, 1000);
>
>         clk_disable_unprepare(ov5675->xvclk);
>         gpiod_set_value_cansleep(ov5675->reset_gpio, 1);
> @@ -988,7 +986,6 @@ static int ov5675_power_off(struct device *dev)
>
>  static int ov5675_power_on(struct device *dev)
>  {
> -       u32 delay_us = DIV_ROUND_UP(8192, OV5675_XVCLK_19_2 / 1000 / 1000);
>         struct v4l2_subdev *sd = dev_get_drvdata(dev);
>         struct ov5675 *ov5675 = to_ov5675(sd);
>         int ret;
> @@ -1014,8 +1011,11 @@ static int ov5675_power_on(struct device *dev)
>
>         gpiod_set_value_cansleep(ov5675->reset_gpio, 0);
>
> -       /* 8192 xvclk cycles prior to the first SCCB transation */
> -       usleep_range(delay_us, delay_us * 2);
> +       /* Worst case quiesence gap is 1.365 milliseconds @ 6MHz XVCLK
> +        * Add an additional threshold grace period to ensure reset
> +        * completion before initiating our first I2C transaction.
> +        */
> +       usleep_range(1500, 1600);
>
>         return 0;
>  }
>
> ---
> base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
> change-id: 20240710-linux-next-ov5675-60b0e83c73f1
>
> Best regards,
> --
> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
>

