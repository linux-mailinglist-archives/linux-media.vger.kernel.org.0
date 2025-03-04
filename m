Return-Path: <linux-media+bounces-27450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BCBA4DA9A
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E1413B1364
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342A01FECBB;
	Tue,  4 Mar 2025 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Y5lXYRRR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBDC1FE478
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084149; cv=none; b=smfzSQQxbbykG3K9F1WJVhFQlPKexQ+qXA1GchLuNKb6lA295nW/Z0b+TuskOeSwdZUAFS47EMylzceRs+LHbc21MQCqLY06YEpP60lMiL7cQxGnzt257r98S/XLCe4RzUHw5N/m7m4jubzttDvq0jt534i7Q28nrxlxFZnq4bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084149; c=relaxed/simple;
	bh=u0wzJkOlb2NOtpQdSRqkH75ov73zGbgV7M/uIzPHwxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhfJfEldle2PlWXtp5TR/Kuz+y2bFT6gOAS/3xOd6WbVKZf6ECmS+YRpto8t7kksmkmH/fk+jdO2zoF/eDILjCPuTWu+C3roZZhi4dPGTNCqLUUFQC/yZZO4sUJRwack71aNipdgb/2Khd8kkg6tK9XEVD3YNWNgVHA1ghVglhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Y5lXYRRR; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5496078888eso2391525e87.0
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 02:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1741084144; x=1741688944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkV4WU5vu+u9xcUFiF/yKQuWlevlYVIk4rdXgAFlIAA=;
        b=Y5lXYRRRuk27/x60ZZsuHKuReCCSWHZmRGpZwcv8YfGDPb5IQHbucGJk6Afh+bn8uO
         sYJ+k7+1u22bTfhSiZdfXt/zCZagxNvFv1MIPjrJaZh81w1Whjz3XIHiHto6mWvRyJN7
         eAaNWTZ2NWSO0ykpSt3BWsLNwgzWSKiG/r/35/dR/Fj/+uyHjcJGnB+99EyY88oE51kz
         ffsoNLtCYWzy8dglgQLSBwG/FjfhqpVXSHCSc3v4IleHCrnols9FocL4z0gqR01UQ70d
         T6AawmR+FHjWa/JzzaZgbfOmI6FaWAMwY+FqUmJPIi6ttJjoMJWSZoiPf413UoJvR+2y
         WSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084144; x=1741688944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkV4WU5vu+u9xcUFiF/yKQuWlevlYVIk4rdXgAFlIAA=;
        b=euRX1Ruuqfp5z+GGTsvvcdASO7YfRt7azDn7TxBj6vXD0yD6jvT2qhmVLIEH3/5E5u
         Su+Knoe2TLNxQ6zNU+I6No+YJAJYr3fE64zy8MOJhHFHEsTV6m9hWAtB/SZx7xMNS29M
         T0IlMNrX+dVJWC9+1q0N5cUsGmjqff89CtsP6yvm4O95ftqE+THtFqBYG7EhuiW/HCVk
         CGQB2zKcPmBZ9ZloYxComX52QQf5NGjCvwH4rSx5g1x5AVSW9V6iWQaOhzNOwoDEHYpe
         4KDCOFgnErjcs40STa9iR57Chb5xvNL8Nkd/ioTiEdMGH6Nz98aDGBBS9w03MeJ7kDLf
         zHCA==
X-Forwarded-Encrypted: i=1; AJvYcCU0n8ZcbHk5EK5u74Q7ZSickkzi6dOvrgAYii5SkFHO6zBGWU21k+N57ptW4OLmwYKBoOcvMY0JDdDdYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Q+3UZy2cpQaxnAtxP2NLWLiAHzREvy8ZqcAJARd1Bo+XOXrO
	/hsKIX/myn08IYookl2t5u0CIR34GmIzopiPUzqm7cX0wEMbVemZ6TvR38hu2nPPMIzXUMO+H0d
	DKGYr+EBQRSDKCi9j5j03cRWHR4ROlHrhpx1xDw==
X-Gm-Gg: ASbGncsK5vsKnbEYzA9uFsEQM4QqPRwrMpfjCXlnRw7dN/I8Uj5G4wI24RdALYrCg1K
	qm6uOH4GIz/1zKUmeolWz0zBVPKsWQfKVeBZao5sHedzurHBnh4f8b2VG0Co8fQxP5ptwqwpMMl
	VAWax+FF1bZeuV1H6n1N6NQw+MWpH3HvMCZ8FYAZAMvtmDwde1zW9AoNQVjw==
X-Google-Smtp-Source: AGHT+IGyWCE7oqPaNRbu7+yt+MPWSO/11a2jRPmhpX9vI10ASUpVvQ+B6oxJMKcUBcA+497AjGJYZ+kLhaVvyGZYKzI=
X-Received: by 2002:a05:6512:398e:b0:545:d70:1d1c with SMTP id
 2adb3069b0e04-5494c129ce8mr6672186e87.11.1741084144050; Tue, 04 Mar 2025
 02:29:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev> <20250303-ov9282-flash-strobe-v1-3-0fd57a1564ba@linux.dev>
In-Reply-To: <20250303-ov9282-flash-strobe-v1-3-0fd57a1564ba@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 4 Mar 2025 10:28:45 +0000
X-Gm-Features: AQ5f1Jp-FG4fprmVP0VWysQV5AbxKf4tv41HYnG9lm4HEWOxOlifuGN3CQWjVgY
Message-ID: <CAPY8ntBBiuQtKErZ1+zDD5HBwjPRdBryduuB3XnhCZAdPC88GA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov9282: add strobe_timeout v4l2 control
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard

On Mon, 3 Mar 2025 at 22:59, Richard Leitner <richard.leitner@linux.dev> wr=
ote:
>
> Add V4L2_CID_FLASH_TIMEOUT support using the "strobe_frame_span"
> feature of the sensor. This is implemented by transforming the given =C2=
=B5s
> value by an interpolated formula to a "span step width" value and
> writing it to register PWM_CTRL_25, PWM_CTRL_26, PWM_CTRL_27,
> PWM_CTRL_28 (0x3925, 0x3926, 0x3927, 0x3928).
>
> The maximum control value is set to the period of the current framerate.
> This must be changed to a dynamic range as soon as this driver
> implements the set_frame_interval() pad operation.
>
> All register values are based on the OV9281 datasheet v1.53 (jan 2019)
> and tested using an ov9281 VisionComponents module.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index c98ba466e9aea29baff0b13578d760bf69c958c5..f7dfe8987e524b73af7e16e12=
567e96627b4f89a 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -97,6 +97,10 @@
>  #define OV9282_REG_MIPI_CTRL00 0x4800
>  #define OV9282_GATED_CLOCK     BIT(5)
>
> +/* Flash/Strobe control registers */
> +#define OV9282_REG_FLASH_DURATION      0x3925
> +#define OV9282_FLASH_DURATION_DEFAULT  0x0000001A
> +
>  /* Input clock rate */
>  #define OV9282_INCLK_RATE      24000000
>
> @@ -193,6 +197,7 @@ struct ov9282_mode {
>   * @again_ctrl: Pointer to analog gain control
>   * @pixel_rate: Pointer to pixel rate control
>   * @flash_led_mode: Pointer to flash led mode control
> + * @flash_timeout: Pointer to flash timeout control
>   * @vblank: Vertical blanking in lines
>   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
>   * @cur_mode: Pointer to current selected sensor mode
> @@ -216,6 +221,7 @@ struct ov9282 {
>         };
>         struct v4l2_ctrl *pixel_rate;
>         struct v4l2_ctrl *flash_led_mode;
> +       struct v4l2_ctrl *flash_timeout;

You only access this in ov9282_set_ctrl where you already have the
struct v4l2_ctrl, so there is no need to store this in the main device
state.

  Dave

>         u32 vblank;
>         bool noncontinuous_clock;
>         const struct ov9282_mode *cur_mode;
> @@ -689,6 +695,24 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9=
282 *ov9282, int mode)
>                                 current_val);
>  }
>
> +static int ov9282_set_ctrl_flash_timeout(struct ov9282 *ov9282, int valu=
e)
> +{
> +       /* Calculate "strobe_frame_span" increments from a given value (=
=C2=B5s).
> +        * This is quite tricky as "The step width of shift and span is
> +        * programmable under system clock domain.", but it's not documen=
ted
> +        * how to program this step width (at least in the datasheet avai=
lable
> +        * to the author at time of writing).
> +        * The formula below is interpolated from different modes/framera=
tes
> +        * and should work quite well for most settings.
> +        */
> +       u32 val =3D value * 192 / (ov9282->cur_mode->width + ov9282->hbla=
nk_ctrl->val);
> +
> +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> 24=
) & 0xff);
> +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val >=
> 16) & 0xff);
> +       ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 2, 1, (val >=
> 8) & 0xff);
> +       return ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 3, 1,=
 val & 0xff);
> +}
> +
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -758,6 +782,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>         case V4L2_CID_FLASH_LED_MODE:
>                 ret =3D ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val)=
;
>                 break;
> +       case V4L2_CID_FLASH_TIMEOUT:
> +               ret =3D ov9282_set_ctrl_flash_timeout(ov9282, ctrl->val);
> +               break;
>         default:
>                 dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>                 ret =3D -EINVAL;
> @@ -1420,6 +1447,10 @@ static int ov9282_init_controls(struct ov9282 *ov9=
282)
>                                                         (1 << V4L2_FLASH_=
LED_MODE_TORCH),
>                                                         V4L2_FLASH_LED_MO=
DE_NONE);
>
> +       ov9282->flash_timeout =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ct=
rl_ops,
> +                                                 V4L2_CID_FLASH_TIMEOUT,
> +                                                 0, 13900, 1, 8);
> +
>         ret =3D v4l2_fwnode_device_parse(ov9282->dev, &props);
>         if (!ret) {
>                 /* Failure sets ctrl_hdlr->error, which we check afterwar=
ds anyway */
>
> --
> 2.47.2
>
>

