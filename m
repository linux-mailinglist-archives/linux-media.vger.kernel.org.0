Return-Path: <linux-media+bounces-6469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B68872379
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 17:01:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19CA6283014
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 16:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AF5128374;
	Tue,  5 Mar 2024 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ADzi9eq1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3906A7764A
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709654491; cv=none; b=sJH/q2mtrDhMRV8YSyI4s7y6KXsNpu/v9KTf/um2Q4cm8I4lAji61mcA6HmBZtABSoVeSANEESKq/f1Rad2TIOS3N/NUmwL7A4Qced2VZrwn9vy1eSVYk5By88CV49ns+tC/coe3QqeeHtiRRUWja5T+JvMxSpbf53lbLO02yqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709654491; c=relaxed/simple;
	bh=SoZXdQ8mlFt8Uv/DD89jFd8fl2rolN+/8/IzksQ0TOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABAVSkPgO7Iaae+ECL6OoF2YVP/T05uBFfZkTCClIo0RWmUEeh6MVDGHAhyRJLD/EPjph4M7WeojOLqEqPlwc8SBSKWjXg5L6f0iTVTdqdskJl+qyRuaUJB4HRToVfLxJ5gBSwY3slM49291+z/5GCZwq3S02OfFCvD/EM8mr6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ADzi9eq1; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so5697180276.2
        for <linux-media@vger.kernel.org>; Tue, 05 Mar 2024 08:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1709654488; x=1710259288; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QVtM2JWdDPQLjfw6hUTwiRlVPddAoppsdNC+i1b82ic=;
        b=ADzi9eq1L6kiqJ/hKcBZQ8UkfCGBvjbKJbHtKg/f+x4couDoCP09KJfqUA1x32yIfd
         Bwaemks01UKyx6bwnPKSw4NsOtBYgxuYLV+F4CFEYDKSwMCOzS4ZH4xVGRYvr0Kuzfex
         zWFoCUEpMR/rbLIoTTk0UiNTQ7PA8pgBAnuVBdGXxwjaEyjANQ5HIX0uHs0++H/plUUd
         coqsdnqqhdvfXuS2jwT8TPaBE8XKNOSHhuuV2cZ9U7UMzL0Jsrq8En+qU0pyzz1E+X9d
         xhwU2qTozyOQ97RA8ZnT7MorLg1fP21VXrkrkEJR1GR0kJuxsmIcihj98bRm7+dahveU
         Tlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709654488; x=1710259288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVtM2JWdDPQLjfw6hUTwiRlVPddAoppsdNC+i1b82ic=;
        b=odfQbgxS87Sgma0qmoSt2DFD61fUdrUx7r8wXQyOa/JjJgyEXmwbRXMaE4mJmLGbVe
         U6WhItScTqQlxk/TJiVuHaU0/Yzec4gidc6p8WwRy0gX050/dYlyPtV3BvIM3v5NBP8+
         rCanK2M8sLQq4KnDaOP5SAUw6t48xy3xVkI+zzbKIhMIBovvllzEtIM9nkkGDzHIPo3W
         TVwCJ5CgMwgad+n/6bot+jbbwJ2CvzXzVvqk81TehfVK1wkM+JKVkBU8bIT5U0gF5mAj
         WIwZeORLdYM1pg9QQOBhJ2wKilW2t33a1t71YBnK2Irt3OQ8mVcNWN2aTL3l1SxR/q6m
         gRFw==
X-Gm-Message-State: AOJu0YykrQZ02GhVrICBp7IzkgP52wejKT+B4SaavBJcC+8x5DCWPzOE
	JvXyTazrTCKL/zffE6h8xJ7McIGS+1YI3uD13h0oEkC/nCGJBViP8evutnzXA1vv9TgM6QUO7Zq
	ahUGWPNAQco/8aXNNMYnTKjeb05IuyyTawBBhwg==
X-Google-Smtp-Source: AGHT+IFYgyIe3rxZ+FW9/tz9tgT/MIzI2yay7/coOJPuLcQhs1GjVZDDOQZBKpk2ydYTvozFEQie6Ladzg671MmJuQI=
X-Received: by 2002:a25:a28f:0:b0:dc7:32e5:a707 with SMTP id
 c15-20020a25a28f000000b00dc732e5a707mr9572750ybi.61.1709654487932; Tue, 05
 Mar 2024 08:01:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com> <20240301213231.10340-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240301213231.10340-2-laurent.pinchart@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 5 Mar 2024 16:01:11 +0000
Message-ID: <CAPY8ntCaKspqDxHNMSfLXQbnS32e5C6AnTS31iWDWBCBuf1=JA@mail.gmail.com>
Subject: Re: [PATCH v6 01/15] media: i2c: imx219: Inline imx219_update_pad_format()
 in its caller
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, David Plowman <david.plowman@raspberrypi.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Naushir Patuck <naush@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, kernel-list@raspberrypi.com, 
	linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 1 Mar 2024 at 21:32, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The imx219_update_pad_format() is short and called from a single place,
> in imx219_set_pad_format(). Inline the code in the caller to keep all
> format adjustements grouped in a single place and improve readability.

s/adjustements/adjustments

>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Otherwise
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index e17ef2e9d9d0..3878da50860e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -758,21 +758,6 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
>         return ret;
>  }
>
> -static void imx219_update_pad_format(struct imx219 *imx219,
> -                                    const struct imx219_mode *mode,
> -                                    struct v4l2_mbus_framefmt *fmt, u32 code)
> -{
> -       /* Bayer order varies with flips */
> -       fmt->code = imx219_get_format_code(imx219, code);
> -       fmt->width = mode->width;
> -       fmt->height = mode->height;
> -       fmt->field = V4L2_FIELD_NONE;
> -       fmt->colorspace = V4L2_COLORSPACE_RAW;
> -       fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> -       fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> -       fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> -}
> -
>  static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
> @@ -819,12 +804,23 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         struct v4l2_rect *crop;
>         unsigned int bin_h, bin_v;
>
> +       /*
> +        * Adjust the requested format to match the closest mode. The Bayer
> +        * order varies with flips.
> +        */
>         mode = v4l2_find_nearest_size(supported_modes,
>                                       ARRAY_SIZE(supported_modes),
>                                       width, height,
>                                       fmt->format.width, fmt->format.height);
>
> -       imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
> +       fmt->format.code = imx219_get_format_code(imx219, fmt->format.code);
> +       fmt->format.width = mode->width;
> +       fmt->format.height = mode->height;
> +       fmt->format.field = V4L2_FIELD_NONE;
> +       fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> +       fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
> +       fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +       fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
>
>         format = v4l2_subdev_state_get_format(state, 0);
>         *format = fmt->format;
> --
> Regards,
>
> Laurent Pinchart
>

