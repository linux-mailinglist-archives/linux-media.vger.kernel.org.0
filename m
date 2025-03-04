Return-Path: <linux-media+bounces-27515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEE0A4EBC3
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 455CF3BB3D2
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDD8284B4A;
	Tue,  4 Mar 2025 17:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GgAHljGj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683472836BC
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 17:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109278; cv=none; b=dxrd8OhRefFBmFsgxFmaWFKOiz3iCwow9d0AtLkWQyk4CLWB++t6xGkZ4/uK+u4prNDllOLm/3z1z83BVkP/BRnlm25kXifoSXgwl6oVhq/NAXeNlD8+SGcKU8enIEAJLcGNlKnGzWsDwK4tvHNo/Mm3I+P3Szzfsu/exc/AqMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109278; c=relaxed/simple;
	bh=C+bBi1F8wyKjwRGAGxl1KKgwS6bfayqNblzlF2k9bno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZpa2BJNZwTzxtfXpwtu8tRVGSkC9SIjQlVJmcnT3j87pAiE052lpcgP21GWGqwdkHiymNfdSycfl+55aYkjM7kqhl1GyhT3IPrexZzGO6a3SZKcJ75mIjtht+k4F+hUq5xJv8vM4+QXf5Qd0Me1GtWwnkk7LHhRHNc4faDmTK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GgAHljGj; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6fd6f7f8df9so73897b3.1
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 09:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1741109275; x=1741714075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pngwxWfatCIaGOPaCop7AUGkDzTeoWBcZRo0gHnL7tc=;
        b=GgAHljGjEgNI2dr07VpAxkYCpphJNweeEq/dQtRYeiW4OHUY5hU+qJ0qocEndRvYSq
         wAlHjvWnGBW0f328KK1hqLv0Fy8vGLNQdJ9mFK3Bd1LCiUiVp+Aqz8Wb/8NSnhxLkMyx
         goC0MHmjYt/j4hpKHi+r4LrLCoX5Dv+bkujouaJDk/pXMX+sdOqNXo0PgzVZjNKAms8I
         7kMtYVRRQZa84WiRoK+uiqtY8cupuJAeseLBqhBRkTSJHicNm6i94fixQNGpPOHzEwIX
         ZMQBZsL094Wrstnxi5spLAJeZ2O/8bliSr7UIeIB2BRkjgwFgUnN8lxb53aw/yqdkfBT
         VLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741109275; x=1741714075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pngwxWfatCIaGOPaCop7AUGkDzTeoWBcZRo0gHnL7tc=;
        b=N5TCWr0dMFzReYosz9Qvb3bYAy/jjBd6zaG28Kj3K5njr9TaTRxarWI68iw3h7dAiz
         Mhe3Y/woTvnxDhOizEUScbjzf8Z5xMJW4VQa+CdSoJs+3R9uCzgaR1svqwYORHBaoK24
         pFRIFqkbHC/nChggEk+0FbvTbd8TRf70c1wtDSCbzYHgmeinEeiK+rW8aa/iu7u2bL+D
         5SIllgkKaziBr9Naj9FlK/PKGrlCKbGO0B74ZGyf6ANWKBVUJY61gtswAk31+LII3cP9
         Bn8cgtbyfnph3s7REprduBk36JELihVl7X5aU3P4Ej1HLl0oxD8WjvVgb3t1AxUpIgda
         UgcA==
X-Forwarded-Encrypted: i=1; AJvYcCUB7b6bpc3xkO2E98i+9d3qH9/4NnpPHIddCVOGsSgnURshnx+gFCrbdgP8fsdYEmGPA6VkL/l1XRhx3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAif09kA+oGPC85yxJKzVATsuCUehZti6oyAjlXg2/EzhViQTy
	mguGYyelB0vz8mBDL+NaQRKIv82stj8XWwergXV/emQbx3lxlT9ihf+MwqOKoLmXDCulTpmmpnX
	GFgCNxUoQKUZ4i5XVKhR7h80iZ/zcnr71QUKVNJ1uBE+Eq+nORtA=
X-Gm-Gg: ASbGncsQrxfXPT71sLeA5dDSupFKSsTAwxSexSqAdXjYJ8yz5uEo9VdyHE7wyIpPxP8
	N0cDV3UQ3500pfZ9bcG5EuvTdRCgFFY1/E1coPvfR+bosLNNUrEsFFKWBKjv4prvHDwpOxkLrUO
	qzDve10vnUNk76ZZUrbWdkkpJS8YwZtEaMNviTw+l0ywUTGxf/gDAi4B6fbA==
X-Google-Smtp-Source: AGHT+IG8rLJKP6QjcPJKBs6HHA5CSFh2OOfYDm0eu1lQ1W/CYWNV7actn7v/IuxMTC+ofswxxNQvZvTBOc2XcAmsQ0g=
X-Received: by 2002:a05:690c:688a:b0:6fb:a222:6bff with SMTP id
 00721157ae682-6fd9413c257mr52561027b3.4.1741109275343; Tue, 04 Mar 2025
 09:27:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev> <20250303-ov9282-flash-strobe-v1-2-0fd57a1564ba@linux.dev>
In-Reply-To: <20250303-ov9282-flash-strobe-v1-2-0fd57a1564ba@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 4 Mar 2025 17:27:34 +0000
X-Gm-Features: AQ5f1JqnbgG6UGzwinCOtaxggx0TCkVpbxuND_5KOBtFKC8Gj8lxhcgdz2N9p2E
Message-ID: <CAPY8ntAQnN+Ea4oMKK5RkCa+EZMwbCjX4uJx2ex5E=peuz0vAA@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: ov9282: add led_mode v4l2 control
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Mon, 3 Mar 2025 at 22:59, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> Add V4L2_CID_FLASH_LED_MODE support using the "strobe output enable"
> feature of the sensor. This implements following modes:
>
>  - V4L2_FLASH_LED_MODE_NONE, which disables the strobe output
>  - V4L2_FLASH_LED_MODE_FLASH, which enables the strobe output
>
> All values are based on the OV9281 datasheet v1.53 (january 2019) and
> tested using an ov9281 VisionComponents module.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index f42e0d439753e74d14e3a3592029e48f49234927..c98ba466e9aea29baff0b13578d760bf69c958c5 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -192,6 +192,7 @@ struct ov9282_mode {
>   * @exp_ctrl: Pointer to exposure control
>   * @again_ctrl: Pointer to analog gain control
>   * @pixel_rate: Pointer to pixel rate control
> + * @flash_led_mode: Pointer to flash led mode control
>   * @vblank: Vertical blanking in lines
>   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
>   * @cur_mode: Pointer to current selected sensor mode
> @@ -214,6 +215,7 @@ struct ov9282 {
>                 struct v4l2_ctrl *again_ctrl;
>         };
>         struct v4l2_ctrl *pixel_rate;
> +       struct v4l2_ctrl *flash_led_mode;

As with 3/3, you only use this control from within ov9282_set_ctrl
where you are given the struct v4l2_ctrl, so there is no need to store
it in the device state structure.

>         u32 vblank;
>         bool noncontinuous_clock;
>         const struct ov9282_mode *cur_mode;
> @@ -670,6 +672,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
>                                 current_val);
>  }
>
> +static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
> +{
> +       u32 current_val;
> +       int ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> +                                 &current_val);
> +       if (ret)
> +               return ret;
> +
> +       if (mode == V4L2_FLASH_LED_MODE_FLASH)
> +               current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
> +       else
> +               current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
> +
> +       return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> +                               current_val);
> +}
> +
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -736,6 +755,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
>                                        (ctrl->val + ov9282->cur_mode->width) >> 1);
>                 break;
> +       case V4L2_CID_FLASH_LED_MODE:
> +               ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
> +               break;
>         default:
>                 dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>                 ret = -EINVAL;
> @@ -1391,6 +1413,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>                                                 OV9282_TIMING_HTS_MAX - mode->width,
>                                                 1, hblank_min);
>
> +       /* Flash/Strobe controls */
> +       ov9282->flash_led_mode = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> +                                                       V4L2_CID_FLASH_LED_MODE,
> +                                                       V4L2_FLASH_LED_MODE_TORCH,
> +                                                       (1 << V4L2_FLASH_LED_MODE_TORCH),
> +                                                       V4L2_FLASH_LED_MODE_NONE);
> +
>         ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>         if (!ret) {
>                 /* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
>
> --
> 2.47.2
>
>

