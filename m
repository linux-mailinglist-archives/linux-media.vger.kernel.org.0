Return-Path: <linux-media+bounces-24940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD51A16AE4
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B88C3A9483
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 10:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BC21B423E;
	Mon, 20 Jan 2025 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="e38aZs02"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9010514387B
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737369468; cv=none; b=LFzen4RIAGia7zmOtrvWdB/Y0eUKNZlq8kTq1UHQDPrMfFXS/LOFUFN024M+Wiw6l174YMKsRuJs1wllruvvdwBnTTZ1ulRWWXbfB7D0e7F3cZsWXqCIo+z0u3FEoBFVwEyyKqJk/RapbT2ZoTLqOWm+rNnLuXofUh9R8sj0Tpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737369468; c=relaxed/simple;
	bh=fEJ2+dS3dsvvIda1WEOt3X4DiaCKjAMQBqIezyLF5bY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5/3lEiafuHZUwmo8dEmAqZVSbEt1PgHPx4xAEm5aW9WuelwnXaHfHEMbKv7RvDuNxgCoGmmk/Vc1PuS8Z+kwQurgrxpfooaCLc0C9BEKRDzF6FyjEWqs43nYMt+LKkKHjw0zgJmLlcSCnkqP7C9y1ZyyLUsFzh0D1Vyo9gt0Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=e38aZs02; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e549dd7201cso7331696276.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 02:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737369465; x=1737974265; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kC6kN0HQX37cERMGKplgEG3RDaAE3Koh8jAN93y+tYE=;
        b=e38aZs02LB25Eqz8T3P1ZqsJDziX9TgCeSGlVbkST/KBmbpDx7We/I4ZQMSw1RUEYl
         7eALO4bSpZqlnLwakoxaE285mQ51P/ODIXWD0C0dc5YGsfVDG/ylQ/BrvKCFLiUNzCls
         moVYMxfVptmHH9YvyVLU6X/baA1Pe547rDt2RtHy6okCheemTRkS4pzLPQuY8zuhe8tn
         GW39XePMwsPSVnqDwcjymUGcTqkeH1TpU8MOYPfCRfD++GuCVf6ZYqqHK0159OcaS86k
         TbxLdXOJ0ldlaVDzb8mXzy4G/VxrYt5c7maLKnoYi/XfQCuQ6vidB/UiZ8dJVpKEFar7
         5osQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737369465; x=1737974265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kC6kN0HQX37cERMGKplgEG3RDaAE3Koh8jAN93y+tYE=;
        b=H5l9tepcuGq5OlOd3n+esWpdvMJfr/OASYOxqJNYIiU0Isvtt/6+ZtHyeDeVpowahi
         Q1ZTooGExjC2+LsC1Eg5KI3+f9o4S2ttcoCP1tymPkRS7ulTxK11xtDmsUfypq+HgVZ/
         4XmxZTCEGVkXZKL1W+c77qQoIWhDcjxgYNoom4hnc7YZXuaBHhmVd/8/6h0vkV7497Xg
         9lZGmlqO+QvzM5shJn/2aS+m/6dPxlokQ+cGaRzw2Dar+jU6xJD7r6qdWsvxaIKX78SJ
         LQrDnDr0uXHy+g9apebbAJt0m3id1mBxctzmbpYwHSXF+WlgL++uLa/C8Ho6bXP5A5AO
         NOIg==
X-Gm-Message-State: AOJu0YyDwG17sHzNywDPNDE+iGURyOkA67zEZskTsRAv9qxgz6Uqah4Z
	vVu82LMsbqZW17EQoA/8RCEGtuvHKhRARpfBcWsn8bYi4sf8KSCVHrgnxHAJK5/HS9fG7zjbCY0
	x1SwKXvxkYGKaa0nNESYFlxNDQunCiYOpt2YUHNUqt2p7oXue
X-Gm-Gg: ASbGncttdOMjExFTiYEeO09tQl6IxHgZw6LZhBrJy2lIE244akDVSSatRk/8jVC84H9
	wJIOe3zU9RP0nvWmRCR+YafvqrFcH/r6OqpV3y6/Nus0FIzSZjOM=
X-Google-Smtp-Source: AGHT+IFkeuHps2+q8+oHPXZcH56u0NR3MDfiFl9U6yPtTEw89PEy88s4MFer5RtFebiANCo3DsvkE7KL0+xz8wS0LHI=
X-Received: by 2002:a05:6902:2749:b0:e55:12e2:62c4 with SMTP id
 3f1490d57ef6-e57b132efd2mr8495306276.35.1737369465481; Mon, 20 Jan 2025
 02:37:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 20 Jan 2025 10:37:28 +0000
X-Gm-Features: AbW1kvZUmHQ2Co49iRHvGJGXdgBqwPzODLf0NDVk66uAbgmZLPNYZ5aLypffERw
Message-ID: <CAPY8ntB513omFgFuD+_5YUmEFv5DTmF89ed9gOa3t4nxWnc6UA@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: ov7251: Set enable GPIO low in probe
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Daniel Scally <djrscally@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Mon, 20 Jan 2025 at 10:11, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Set the enable GPIO low when acquiring it.
>
> Fixes: d30bb512da3d ("media: Add a driver for the ov7251 camera sensor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Agreed that the datasheet says that as the regulators aren't on at
this point, the enable GPIO must be low.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov7251.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index 30f61e04ecaf..f3e2d26bb840 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -1696,7 +1696,7 @@ static int ov7251_probe(struct i2c_client *client)
>                 return PTR_ERR(ov7251->analog_regulator);
>         }
>
> -       ov7251->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> +       ov7251->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
>         if (IS_ERR(ov7251->enable_gpio)) {
>                 dev_err(dev, "cannot get enable gpio\n");
>                 return PTR_ERR(ov7251->enable_gpio);
>
> base-commit: 5de275c450c9496031006e0fb3f7c96a8fcaaa55
> --
> 2.39.5
>
>

