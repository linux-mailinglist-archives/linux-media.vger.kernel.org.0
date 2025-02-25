Return-Path: <linux-media+bounces-26965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 512F8A44470
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 16:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74D5217834A
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 15:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170C314F9C4;
	Tue, 25 Feb 2025 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="L8hsneJE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A132E224EA
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 15:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740497435; cv=none; b=PSb3WVp/KZBn9HGdGlUhmmfXUnCSlkBfWFnXolFdHTm0+g5Gcuefv5BaU4H6Mw1XEeTaKwH8UHvmyusp2Qzi8u1l1qWIhnpeMu/neOly6EVYIhRAHu9uyldYL5KCNkGf4eSAPgYyfWN8YGsdidrfq11MUJ+MxK2RepeuGVst4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740497435; c=relaxed/simple;
	bh=IaKNOR+jJAMt3BEDuqUtFSYG0Yat04sYjFaoF4lMOyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIpt3G6t9nzXGkaps0BrywoLXF/IQd9OE1KQKy2k/zL+V7u/wvtwl+ZamTW8fVpXnv+aj0Of0bsj24XWld1B659FkJfRxFbvh70qHAWhmi1d6dksyfqxl/btK9QvS24MoA8dtwIH7y7db3HpCuV4wFmNPAac5dqdBWkXbIcz9Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=L8hsneJE; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e461015fbd4so4221850276.2
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 07:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740497432; x=1741102232; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KwFIy+pfxKXbXFSW3tXFLJhNS2T5ZHeCg/y22PAaxLU=;
        b=L8hsneJE5y8QHXQk5CGCnHufi+uvUEDcnBMHu8LTJ8HS5/YJMexlFYEU0KwVTJkBeV
         joKtY6PLA7hOwx0g1QksVmcyHg21ZXdSVZZyEQhNAFqyJA35/2TtUdJ7DS+wcAg7zBci
         ws7rpRttZuAX8sm9i7AZ/z6Ium2ZkhWvnl810vlxLe+vrE/K5XHul71LJPHotk9Sgdxy
         UiWgbS1DzlDrc9cTO9akUqdRIM61HN0wL2TrmIlOmq9FurFgd11MrDELGd9dI0NcVduY
         05fgXyeCOOIyrAl0P6v6QN/dagrWf12ew21v4l610QrKtk7RNDMraVLYKyJKoWcZdhRp
         BncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497432; x=1741102232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwFIy+pfxKXbXFSW3tXFLJhNS2T5ZHeCg/y22PAaxLU=;
        b=aqq6+wj7xuNeaf+A8vFjsxCEu+8nPBlYmhBx0qcHGvzkl5Po7/OblT9GasWIQ0dmDR
         B+P1fBx3VdjTgRWeCSbKou6KanFw0PwpoIbK9025e/c5GQY9bxcHlpNRfyxjwcc8x3D/
         rmcwkQOkWUfG+wrPsOLjXNNYtURlPRV1D4qaSZbpaoNEv9UpWlKAVOyQPkRUYRqLjOdW
         pKdJVDt/6NHyJeA0gAuBJTS3aQOU6YCtJljE2zhkR62uJfXc4LO11zvjQMBLkShs4g5i
         FYgTsrh6rLKXPkCh8wmdGYrdUOm5XESRDG6InpLUMhVXACAOSu6Aj5scawP8+wYkpe7k
         1LrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUhFL15OU+CoStVHBinWY6khAjrcSGgyjSoIQAIUD5oxJOyQnSMC60CjMI77lSwpwwPM1VV1K3X/S4Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1BbC/98YVBZVHoo/b+zDgLqRZqw8krJ1+2jTWhb+AwLdYqls+
	eSMXaBT1hXtvJcK3/KileE8K1Y1PXIZ8+RzFsJR63VlHHg8xlt7eS9LheLZtBicBwvkPqQaoNRL
	wwdMeRN8+tz1cp6ySBQvfVZ0jTSA3taMTtNX2wQ==
X-Gm-Gg: ASbGncsr6h0RdZItUHymB/exWkjLvWvMTqcFV7RaFGLObreRP2WhgCDu/Wrw/alnOrF
	yDMrYHZsP5pRI2KsM1Ao11Vyn4Ms9RzY4aXaCvPPlCCtmwvfxseNs06KbtYO21VkJLlkVo3f9lU
	8WW92FYCyozB1n3ugIES44gmIj0lsoBSutj0Q8K04=
X-Google-Smtp-Source: AGHT+IF67EI0gNo1oQTwHhmZVcpbL4ZitqmXV46b+PzRbtROLKZwoilrpvSrY1kXE0u0S1BQog3YNexBmVYItvnDdOk=
X-Received: by 2002:a05:6902:1706:b0:e60:782f:3a34 with SMTP id
 3f1490d57ef6-e607a4c9e5dmr2905768276.2.1740497432457; Tue, 25 Feb 2025
 07:30:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev> <20250225-b4-ov9282-gain-v1-3-a24af2820dde@linux.dev>
In-Reply-To: <20250225-b4-ov9282-gain-v1-3-a24af2820dde@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 25 Feb 2025 15:30:16 +0000
X-Gm-Features: AQ5f1JqDNLQeYCXCr9B35EOsUjzzSxxxDQGLVzHslMJFFKWlkPxFWSjqna-ILMQ
Message-ID: <CAPY8ntCLUVX91+QYbFk-bHQumuvs70CuDLe85VZRTS2wW-tYHw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov9282: fix analogue gain maximum
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Tue, 25 Feb 2025 at 13:09, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> The sensors analogue gain is stored within two "LONG GAIN" registers
> (0x3508 and 0x3509) where the first one holds the upper 5 bits of the
> value. The second register (0x3509) holds the lower 4 bits of the gain
> value in its upper 4 bits. The lower 4 register bits are fraction bits.
>
> This patch changes the gain control to adhere to the datasheet and
> make the "upper gain register" (0x3508) accessible via the gain control,
> resulting in a new maximum of 0x1fff instead of 0xff.
>
> As the "upper gain register" is now written during exposure/gain update
> remove the hard-coded 0x00 write to it from common_regs.
>
> We cover only the "real gain format" use-case. The "sensor gain
> format" one is ignored as based on the hard-coded "AEC MANUAL" register
> configuration it is disabled.
>
> All values are based on the OV9281 datasheet v1.01 (09.18.2015).

My web searches turn up a 1.53 from Jan 2019 -
http://www.sinotimes-tech.com/product/20220217221034589.pdf
That lists 0x3508 as DEBUG, not LONG_GAIN.

The current range allows analogue gain to x15.9375.
Expanding it to 0x1ff.f would be up to x511.9375. I believe that
equates to ~54dB as we're scaling voltages, not power. The spec sheet
for the sensor lists S/N of 38dB and dynamic range of 68dB, so x511
will be almost pure noise.

Doing a very basic test using i2ctransfer to set gain values whilst
the sensor is running suggests that the image is the same regardless
of bits 2-4 of 0x3508. Setting either bits 0 or 1 increases the gain
by around x8.5, but they don't combine.

Overall can I ask how you've tested that a range up to 0x1fff works,
and on which module? I currently don't believe this works as intended.

  Dave

> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index c882a021cf18852237bf9b9524d3de0c5b48cbcb..e6effb2b42d4d5d0ca3d924df59c60512f9ce65d 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -54,11 +54,11 @@
>  #define OV9282_AEC_MANUAL_DEFAULT      0x00
>
>  /* Analog gain control */
> -#define OV9282_REG_AGAIN       0x3509
> -#define OV9282_AGAIN_MIN       0x10
> -#define OV9282_AGAIN_MAX       0xff
> -#define OV9282_AGAIN_STEP      1
> -#define OV9282_AGAIN_DEFAULT   0x10
> +#define OV9282_REG_AGAIN       0x3508
> +#define OV9282_AGAIN_MIN       0x0010
> +#define OV9282_AGAIN_MAX       0x1fff
> +#define OV9282_AGAIN_STEP      0x0001
> +#define OV9282_AGAIN_DEFAULT   0x0010
>
>  /* Group hold register */
>  #define OV9282_REG_HOLD                0x3308
> @@ -226,7 +226,6 @@ static const struct ov9282_reg common_regs[] = {
>         {OV9282_REG_AEC_MANUAL, OV9282_GAIN_PREC16_EN},
>         {0x3505, 0x8c},
>         {0x3507, 0x03},
> -       {0x3508, 0x00},
>         {0x3610, 0x80},
>         {0x3611, 0xa0},
>         {0x3620, 0x6e},
> @@ -605,7 +604,11 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>         if (ret)
>                 goto error_release_group_hold;
>
> -       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
> +       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, (gain >> 8) & 0x1f);
> +       if (ret)
> +               goto error_release_group_hold;
> +
> +       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN + 1, 1, gain & 0xff);
>
>  error_release_group_hold:
>         ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
>
> --
> 2.47.2
>
>

