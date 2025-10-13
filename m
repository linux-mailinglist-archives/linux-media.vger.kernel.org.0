Return-Path: <linux-media+bounces-44332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4273BD5819
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 19:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FAF7404EBF
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 17:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6DE2D2481;
	Mon, 13 Oct 2025 17:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ay1rwQ4u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D3225A33F
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760375746; cv=none; b=kF6yMF4FgmjX1ctndxt3XPzxzHPBquQd2GStVpCRU4fTdj4i9lWbI/XDL7EKnVbGLD8eEfdGYi11rdAwAtDhH6c5dL1jvxJxqf53HkCscYFZke2w+/x55MKOwOxghm+LB6WWqDvhQBi+WjY1fKVgYVA9yHtDLyAHuJoTVPL0jMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760375746; c=relaxed/simple;
	bh=3I2q4FFig443RkOgcOSg/Q8Y/Y0YyCuhr6K3TbbGJFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sz2kh9CwPsImFT3XgIqMKtYQC0y1+F0xmZ7bytU6A29xbve5/IvKBHGAdPRcFqVzMP76LODoAcHLjv0T9/4r47EyMlUozQov8DpRblOPOPMGjDBcuNuY0U9lvH9l7xmAu0wSA9W7WDUs5bCAYDWrc/mxJ24TrpkjSRulYIpdCPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ay1rwQ4u; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d71bcac45so46035037b3.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 10:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1760375743; x=1760980543; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E/O9t7TBwwt70z8OyoI7hWO+3GmPGXOYZ1mqjKP4ax4=;
        b=ay1rwQ4u84LmPOj85u4C3qGVoB9oCBiAFZ4CmPsePj6isYZLPDsv2pLz7UDhevZFJg
         sP9RV025vF/jJ+wxqAnVnh7KTe2Oq+IxPEIRGBceurnTLnQncEl2BJbSz6k5exCvKWKh
         Wti5C6IVF9tQygnAYhP0CrvUYFmQF6aO0CVD3we0d5JNM626YTeLvHP/VzC1cLMR3hu2
         M1+sXLZoDHZBgkusn7epWjONWZNKZa7RoQKx0fir6AsfX5kSWtEwEmkjoKUT2LwWvKcd
         TyQjNPMaeMxOch2VcsYjHltd79fLvcXeCyjeuAqfPRgLBvZQ/gl0ruCAGiw0B+4W8q3x
         aqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760375743; x=1760980543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/O9t7TBwwt70z8OyoI7hWO+3GmPGXOYZ1mqjKP4ax4=;
        b=QBEpcWF5bK9JclWaCsNobMHmrhNX/37aSX8n4JV30gXyYVybVM1QPclIATjD0FXO6/
         orfEaAMZ/XObrnIuvsEZCETuRCVxFNEqnvWECoHkKJ5CyxkbyQdBvqMS2gJ1i4B1NyKC
         YKthDjZz/2mKgHAeLknYGMgvX37N0cmIvcJOAy3/2ti2tCjrGRQziLHmRE4IWdUeWaJp
         rniCQXzLiE1fSRENjyi7iHZR1bmk7JOXd2e4jtR4Gy/pcMZqi0kJWXoHoq9ezwsDFUPL
         JOj+diV2vE+1Lqp7XK2W3/9JrVgmtHLcuqtfKzsKubkXtZxl5wnOoPs+sC8VViPNc3qF
         HSfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcLzVwBe0k7Jzj9/SVYCijEAiAdw3XGTHb+ZM8/parJU1jUUe2t6Llf2wKNNcE1aS0XkRQS1xezH7BuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVT6FYHSWf2wxftqO+1ugFgQJHs1zGMBLKpvwEhsPDtFKS44qI
	wkuhYzimrs/JOdfjWbimTlvk3ln272nbj03R8jLQkDeGvsCXriTWhjQb05SJ/Jw38AzjlFYxq8S
	0ZbxDv4dQkLWA5rtxaCM7MttaDi1uOcbbblFXCN0xkw==
X-Gm-Gg: ASbGncuLiVMxpulY8987JRlZUvM94Q7Wyuhbqn9egO+Zi3YwD81S5xKrgDGO6PDvUSk
	D2REj4nlnPlTpBUNjPLs/pIwtqcXjYiQWbIWi51fNT/QMbf0+TKvkf0Sre7ucPOtaak1EKf0k0Y
	ZhHExfvMEP53XEEgJflAIOxDk5sxljYKv00+XzzWwMPwnglRPDHF9qOcq6Vo8+G9d1sK9mQ3S+2
	FiRIgHzHNDv4S+dDYTSb2Z9QmveefHMME3269h7jbkVGkdCnBelC8nwBiTaBG7wHV4I
X-Google-Smtp-Source: AGHT+IEJQxVlOKCAVa0DVQXanxZU/wRmCwxvEZFjpEQs8heimsDwqo/IVVaLPjOJJ5BS0gzpEBytppqvbIJCJP7Jy0g=
X-Received: by 2002:a05:690e:192:b0:636:2424:e081 with SMTP id
 956f58d0204a3-63ccb91ccfcmr15814047d50.47.1760375742927; Mon, 13 Oct 2025
 10:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org> <20251013-csi-bgr-rgb-v4-3-55eab2caa69f@kernel.org>
In-Reply-To: <20251013-csi-bgr-rgb-v4-3-55eab2caa69f@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 13 Oct 2025 18:15:24 +0100
X-Gm-Features: AS18NWDjci6nyrfFGGRKGOpjVpZ_rVKN8DS9ywVFxJuE59j0an_kT_LgO6q6NT4
Message-ID: <CAPY8ntDnJexjt+wEBYdMXCPv7RUhJSoBupzcz+V9OiKQYK+yxw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] media: tc358743: Fix the RGB MBUS format
To: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mats Randgaard <matrandg@cisco.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 12:01, Maxime Ripard <mripard@kernel.org> wrote:
>
> The tc358743 is an HDMI to MIPI-CSI2 bridge. It can output all three
> HDMI 1.4 video formats: RGB 4:4:4, YCbCr 4:2:2, and YCbCr 4:4:4.
>
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

Apologies, I thought I'd already sent:

Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Patches 1 and 2 look fine, but I'm not sure it's in my scope to give
an R-b. I can do if it's worth it.
Patch 4 also looks good as it copies this pattern, but I have no
knowledge of that sensor.

  Dave

> ---
>  drivers/media/i2c/tc358743.c | 53 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 44 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index a0ca19359c43145988535d7816012ef607555b87..feb089d8de724dd25801a0fb621c768542e05254 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -754,10 +754,11 @@ static void tc358743_set_ref_clk(struct v4l2_subdev *sd)
>  }
>
>  static void tc358743_set_csi_color_space(struct v4l2_subdev *sd)
>  {
>         struct tc358743_state *state = to_state(sd);
> +       struct device *dev = &state->i2c_client->dev;
>
>         switch (state->mbus_fmt_code) {
>         case MEDIA_BUS_FMT_UYVY8_1X16:
>                 v4l2_dbg(2, debug, sd, "%s: YCbCr 422 16-bit\n", __func__);
>                 i2c_wr8_and_or(sd, VOUT_SET2,
> @@ -769,11 +770,21 @@ static void tc358743_set_csi_color_space(struct v4l2_subdev *sd)
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
> +               dev_warn_once(dev, "RGB format isn't actually supported by the hardware. The application should be fixed to use BGR.");
> +               fallthrough;
> +       case MEDIA_BUS_FMT_BGR888_1X24:
> +               v4l2_dbg(2, debug, sd, "%s: BGR 888 24-bit\n", __func__);
>                 i2c_wr8_and_or(sd, VOUT_SET2,
>                                 ~(MASK_SEL422 | MASK_VOUT_422FIL_100) & 0xff,
>                                 0x00);
>                 i2c_wr8_and_or(sd, VI_REP, ~MASK_VOUT_COLOR_SEL & 0xff,
>                                 MASK_VOUT_COLOR_RGB_FULL);
> @@ -1430,15 +1441,30 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
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
> +       case MEDIA_BUS_FMT_RGB888_1X24:
> +               v4l2_info(sd, "Color space: BGR 888 24-bit\n");
> +               break;
> +       case MEDIA_BUS_FMT_UYVY8_1X16:
> +               v4l2_info(sd, "Color space: YCbCr 422 16-bit\n");
> +               break;
> +       default:
> +               v4l2_info(sd, "Color space: Unsupported\n");
> +               break;
> +       }
>
>         v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
>         v4l2_info(sd, "HDCP encrypted content: %s\n",
>                         hdmi_sys_status & MASK_S_HDCP ? "yes" : "no");
>         v4l2_info(sd, "Input color space: %s %s range\n",
> @@ -1771,24 +1797,32 @@ static int tc358743_enum_mbus_code(struct v4l2_subdev *sd,
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
>         case MEDIA_BUS_FMT_RGB888_1X24:
>                 return V4L2_COLORSPACE_SRGB;
>         case MEDIA_BUS_FMT_UYVY8_1X16:
>                 return V4L2_COLORSPACE_SMPTE170M;
>         default:
> @@ -1822,11 +1856,12 @@ static int tc358743_set_fmt(struct v4l2_subdev *sd,
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
> @@ -2242,11 +2277,11 @@ static int tc358743_probe(struct i2c_client *client)
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
> 2.51.0
>

