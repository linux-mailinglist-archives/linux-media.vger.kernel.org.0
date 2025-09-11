Return-Path: <linux-media+bounces-42311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A296B52FDC
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 13:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE96F1B24B21
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 11:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D45031A04D;
	Thu, 11 Sep 2025 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="sxHpqSMq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6763126C5
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757589118; cv=none; b=RDSVv4M9AR4kvwZk/coMkzCiqjsuI1eKwWto3yVredoVdlaanc+35Jl5HmQEToUD1Z+zhX6noBjHqloH8YzPr20jUJ6k9cTaFfHYJWz73fIIf7h+hJukT5vIhF4QcR6ve8TLjKu9ggM3T2G7JY3F6L26v3YF0b/aL1pfMqUbe70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757589118; c=relaxed/simple;
	bh=gVFXcbZQ+9b0oRAjYg149MD2xbFgWe31Cp48AQ8Ym5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxgH6rZEArSKyvzm5dN1mlhFfuISBB+nCqfaPGTndzBIgMtjnzHMZg5l7+4UZmNtQEqFYRujYISsnxwc8vANHoK3psIgE5t9bIMAB7DMPnC/zeHCSZGqF/Hq97SWTr63tU0OxSgzDuY5CX/GhuM63U91jy9F4WyHopurh9i4+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=sxHpqSMq; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-60f476e97c3so305491d50.3
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1757589116; x=1758193916; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=efbdMdx8ppc0y57jvJ/WyQmejsRqkjVJNHYS/A58AwU=;
        b=sxHpqSMqb9ka0iiLV3hdG66SvoXg/qEh8SrOQugbdoOGfZpcu+wpRethOzFV+BPOJJ
         zWR22diHkCNFat05VlrQhpIvQeOEwHOJCNbQ17yS6u4GGqQi0BM1NFTope6KzWhp8LaO
         j/blGLAfLPkZeFZ49m+0sYf6UXwlYAdp4QnchU7ikmK+BJZsE0K5QvaEbaf2JkIYuMVi
         t9N4HCIwXxZNn627IP2hS94H9HimDMlTX5rmCorP+cLhiLf2/FOvF1Awpk7oO1gdtZI4
         JlIcnEHOpiOXZDEDLpP/B083+jOfvpSfjt0ktPNxZR3NhQDGtCpRw0ZAOSBvxq6XrGPy
         nFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589116; x=1758193916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efbdMdx8ppc0y57jvJ/WyQmejsRqkjVJNHYS/A58AwU=;
        b=DyRD73nL0yg/e++ESuPCR/O0ryvcGoMwxSPEblcoGRvOK8LKc3NI5PGsKAinA5cqT7
         aovi3N5apre2dLKWnH1JyglVIpxbtwPcJe+5M35pI3nIZbfd+ChKa8i6oNQlFbbQpRri
         Wf+IVvNAaTUr/X1aqpsA6s9A7vpRE6v1K+7BusN1xhNOmun7jINYhdM4GXjZF4W7LEci
         wmyhsYcLu+V0IHtB1QGC1+KsAvsTFoaz4s2uuFjLe2RnA2cFhnVTnMaZKKCxbjrsyseE
         d5xSXyPLOl1NuK36QqB3nRDHI5JfYzeIMChPHu4ynubXqLVcWsYfKHfnX+4rqxacHsWH
         8PVw==
X-Forwarded-Encrypted: i=1; AJvYcCWE/N0+TJ/QiypIq/xEjfuc1b05Uf6jhqHlha7hcczVlAFgtwqgtcauDhC4GN+VcoO6QqooUxleurITqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv62wbhWXAj5PhqKH0OjYXatIrnnrgMbWOTxKTpZTOKTlGWgwD
	Ak97CqNCybVBF57XylDW55sklbyk04biYAW082XZR+lATqz3BHAwT5Cv7nYu3AS/H6fdWv1WVTh
	r3J7DN45sXsR2n3nb2HzCrX9HtQaD4iQB6cXwPqsBjQXZ5FMOqZ1h5Ng=
X-Gm-Gg: ASbGncs0XwNBozPq8s7zgw+5BVrWyOnRjM4R2A6VAFKY5U/3VE9cBwBETlly1b0h598
	k72IOb8y2nHM/2heZQBydnAEVnTMJIohUj9cC+2HBRn7w1z8ZDWKv6XpbPsKJCUya++rzCd1F8t
	ermqAB/3sFCO210e1ZyCMshF1tQdbf3Bf0lGREbNhCwSrr8kJhAaalo07EldS8MTarwbe5sLFgO
	WeB2NqkCRX6NTB+QlT63hEihM0unDqmLMpcr/zpAKv3MfidEWskYq/OEA6g
X-Google-Smtp-Source: AGHT+IE7y61jt3BTlrPRKkVkpCYFN38tMn+ivWJPXhndffSVM4yTnzAa+3i9UFwR0NwUlApg9Hm4vAD5GYaII64RmTA=
X-Received: by 2002:a53:bb8c:0:b0:5f5:1097:6eb5 with SMTP id
 956f58d0204a3-61028ea0f6cmr13119918d50.31.1757589115637; Thu, 11 Sep 2025
 04:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org> <20250911-csi-bgr-rgb-v2-3-e6c6b10c1040@kernel.org>
In-Reply-To: <20250911-csi-bgr-rgb-v2-3-e6c6b10c1040@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 11 Sep 2025 12:11:36 +0100
X-Gm-Features: Ac12FXwM4P6Wgf9tLO5WbK4KrfQkMtG4PtgDAGpSmTQ1XNJtyPSZGehGiSIImmA
Message-ID: <CAPY8ntBG=ghLmFGkA4-Tg4pAzAv6jWARkyiZU-4uCVhQuwZa9Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: tc358743: Fix the RGB MBUS format
To: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mats Randgaard <matrandg@cisco.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"

Hi Maxime

On Thu, 11 Sept 2025 at 10:15, Maxime Ripard <mripard@kernel.org> wrote:
>
> The tc358743 is an HDMI to MIPI-CSI2 bridge. It supports two of the
> three HDMI 1.4 video formats: RGB 4:4:4 and YCbCr 422.

It accepts 3 HDMI video formats: 24bpp RGB 4:4:4, 24bpp YCbCr 4:4:4,
or 16bpp YCbCr 4:2:2.

It supports outputting the incoming video data as either 24bpp RGB
4:4:4 or 16bpp YCbCr 4:2:2, and will convert the incoming HDMI video
data to either of these.
(Rereading the datasheet it can also send YCbCr 4:4:4, but that's
non-standard as it by default reuses data type 0x24 which is RGB888,
but says it uses RAW12 packing!)

> RGB 4:4:4 is converted to the MIPI-CSI2 RGB888 video format, and listed
> in the driver as MEDIA_BUS_FMT_RGB888_1X24.
>
> Most CSI2 receiver drivers then map MEDIA_BUS_FMT_RGB888_1X24 to
> V4L2_PIX_FMT_RGB24.
>
> However, V4L2_PIX_FMT_RGB24 is defined as having its color components in
> the R, G and B order, from left to right. MIPI-CSI2 however defines the
> RGB888 format with blue first.
>
> This essentially means that the R and B will be swapped compared to what
> V4L2_PIX_FMT_RGB24 defines.
>
> The proper MBUS format would be BGR888, so let's use that.
>
> Fixes: d32d98642de6 ("[media] Driver for Toshiba TC358743 HDMI to CSI-2 bridge")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/media/i2c/tc358743.c | 51 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 42 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index 1cc7636e446d77d7c6266ca86517496261d2b039..a3054cd823da4cf3db24c6b2bfbf0fcaa43f2814 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -693,11 +693,21 @@ static void tc358743_set_csi_color_space(struct v4l2_subdev *sd)
>                 i2c_wr16_and_or(sd, CONFCTL, ~MASK_YCBCRFMT,
>                                 MASK_YCBCRFMT_422_8_BIT);
>                 mutex_unlock(&state->confctl_mutex);
>                 break;
>         case MEDIA_BUS_FMT_RGB888_1X24:
> -               v4l2_dbg(2, debug, sd, "%s: RGB 888 24-bit\n", __func__);
> +               /*
> +                * The driver was initially introduced with RGB888
> +                * support, but CSI really means BGR.
> +                *
> +                * Since we might have applications that would have
> +                * hard-coded the RGB888, let's support both.
> +                */
> +               v4l2_warn(sd, "RGB format isn't actually supported by the hardware. The application should be fixed to use BGR.");

warn_once? Otherwise repeatedly setting the format to RGB888 will spam
the kernel log.
(Annoying that there doesn't appear to be a v4l2_warn_once macro)

> +               fallthrough;
> +       case MEDIA_BUS_FMT_BGR888_1X24:
> +               v4l2_dbg(2, debug, sd, "%s: BGR 888 24-bit\n", __func__);
>                 i2c_wr8_and_or(sd, VOUT_SET2,
>                                 ~(MASK_SEL422 | MASK_VOUT_422FIL_100) & 0xff,
>                                 0x00);
>                 i2c_wr8_and_or(sd, VI_REP, ~MASK_VOUT_COLOR_SEL & 0xff,
>                                 MASK_VOUT_COLOR_RGB_FULL);
> @@ -1354,15 +1364,28 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
>                         (i2c_rd16(sd, CSI_STATUS) & MASK_S_RXACT) ?
>                         "yes" : "no");
>         v4l2_info(sd, "Stopped: %s\n",
>                         (i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
>                         "yes" : "no");
> -       v4l2_info(sd, "Color space: %s\n",
> -                       state->mbus_fmt_code == MEDIA_BUS_FMT_UYVY8_1X16 ?
> -                       "YCbCr 422 16-bit" :
> -                       state->mbus_fmt_code == MEDIA_BUS_FMT_RGB888_1X24 ?
> -                       "RGB 888 24-bit" : "Unsupported");
> +
> +       switch (state->mbus_fmt_code) {
> +       case MEDIA_BUS_FMT_BGR888_1X24:
> +               /*
> +                * The driver was initially introduced with RGB888
> +                * support, but CSI really means BGR.
> +                *
> +                * Since we might have applications that would have
> +                * hard-coded the RGB888, let's support both.
> +                */
> +               fallthrough;
> +       case MEDIA_BUS_FMT_RGB888_1X24:
> +               v4l2_info(sd, "Color space: BGR 888 24-bit\n");
> +               break;
> +       case MEDIA_BUS_FMT_UYVY8_1X16:
> +               v4l2_info(sd, "Color space: YCbCr 422 16-bit\n");
> +               break;

This has lost printing "Unsupported" if not one of the supported
formats, however I don't think there is a way for that to ever happen.
As it's not an enum, the compiler shouldn't be complaining of
unhandled values.

> +       }
>
>         v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
>         v4l2_info(sd, "HDCP encrypted content: %s\n",
>                         hdmi_sys_status & MASK_S_HDCP ? "yes" : "no");
>         v4l2_info(sd, "Input color space: %s %s range\n",
> @@ -1695,24 +1718,33 @@ static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
>                 struct v4l2_subdev_state *sd_state,
>                 struct v4l2_subdev_mbus_code_enum *code)
>  {
>         switch (code->index) {
>         case 0:
> -               code->code = MEDIA_BUS_FMT_RGB888_1X24;
> +               code->code = MEDIA_BUS_FMT_BGR888_1X24;
>                 break;
>         case 1:
>                 code->code = MEDIA_BUS_FMT_UYVY8_1X16;
>                 break;
> +       case 2:
> +               /*
> +                * We need to keep RGB888 for backward compatibility,
> +                * but we should list it last for userspace to pick BGR.
> +                */
> +               code->code = MEDIA_BUS_FMT_RGB888_1X24;
> +               break;
>         default:
>                 return -EINVAL;
>         }
>         return 0;
>  }
>
>  static u32 tc358743_g_colorspace(u32 code)
>  {
>         switch (code) {
> +       case MEDIA_BUS_FMT_BGR888_1X24:
> +               fallthrough;

Do we need a fallthrough when there is no extra code between the two cases?

Otherwise it looks good to me.

  Dave

>         case MEDIA_BUS_FMT_RGB888_1X24:
>                 return V4L2_COLORSPACE_SRGB;
>         case MEDIA_BUS_FMT_UYVY8_1X16:
>                 return V4L2_COLORSPACE_SMPTE170M;
>         default:
> @@ -1746,11 +1778,12 @@ static int tc358743_set_fmt(struct v4l2_subdev *sd,
>         struct tc358743_state *state = to_state(sd);
>
>         u32 code = format->format.code; /* is overwritten by get_fmt */
>         int ret = tc358743_get_fmt(sd, sd_state, format);
>
> -       if (code == MEDIA_BUS_FMT_RGB888_1X24 ||
> +       if (code == MEDIA_BUS_FMT_BGR888_1X24 ||
> +           code == MEDIA_BUS_FMT_RGB888_1X24 ||
>             code == MEDIA_BUS_FMT_UYVY8_1X16)
>                 format->format.code = code;
>         format->format.colorspace = tc358743_g_colorspace(format->format.code);
>
>         if (ret)
> @@ -2166,11 +2199,11 @@ static int tc358743_probe(struct i2c_client *client)
>         sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>         err = media_entity_pads_init(&sd->entity, 1, &state->pad);
>         if (err < 0)
>                 goto err_hdl;
>
> -       state->mbus_fmt_code = MEDIA_BUS_FMT_RGB888_1X24;
> +       state->mbus_fmt_code = MEDIA_BUS_FMT_BGR888_1X24;
>
>         sd->dev = &client->dev;
>
>         mutex_init(&state->confctl_mutex);
>
>
> --
> 2.50.1
>

