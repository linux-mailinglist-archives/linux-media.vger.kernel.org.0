Return-Path: <linux-media+bounces-24222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F89FFC48
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 17:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 119061883059
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 16:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB8341C69;
	Thu,  2 Jan 2025 16:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fjuiDJ/u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E051F5FD
	for <linux-media@vger.kernel.org>; Thu,  2 Jan 2025 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735836505; cv=none; b=MNLoxOq29gxotr1ziXLW++q/XabRFzutmULFuoVAoUQftSdsX1KvzRo08qB74igSa7MKstyfCYa5gmvMEB37scFpVWctcge6BdyVzlr4RdX9vXKqLa0L9FOw7F+aq5tMI7wO27iQR+zF2GIXLgXhTlW57pY5nV7l3f8GSFusM0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735836505; c=relaxed/simple;
	bh=ftxWox2jvOWt7IKkZ1kM4q9gOeKIY+mDxE2AIql3u38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6oem/dBB6x7a1WVb+Eplt8GwuYJzZ63A1bmhG/7/Y66YBhx9ArKIqLzD5NpKKN92Ztn/DRgffm46L7uuQIZFjwnMOJdPt8O7oCRI9dWBaMSMztvU2byDuLd0GDLts53x60R+jn4sT8vTTgTG/G0TSfnURgEegTRa3R3Y1SMoSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fjuiDJ/u; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e460717039fso14235729276.0
        for <linux-media@vger.kernel.org>; Thu, 02 Jan 2025 08:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1735836502; x=1736441302; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lyMDNkHK0etH+cUtpIiuVqa9ieM+D+8yuqnyQLckCd4=;
        b=fjuiDJ/u8W97EQYYkpK+CNRuBTg1bvBUwG/RsHe+mF8LSDNsXuoQCyTCWZ5IqIFf5K
         Dfm0bKbA9VT8tuxQjTe61ARgms+MDoJzNA76ltygHmNHhubO97Hr/dI42Hy0VLfs14lf
         bOTposnqg+9KJx1qVZocxRObMZ/AAaUXNgw5TTRy3RQDJE4Au6goD2DW0ECpIoAGrmkJ
         OOlodqruOpVsJ4iYNbdyK5CHdnNW+eOMo/JyUVg0MbkmfCeec83jAH8P1A5ocGCfQmIR
         Pq53LTKaMIFJ13/hYyJ7aGfNN2vN8JmVnFVZTF9qgVQIzbMq2i4R1rn44U80p1dLOK1I
         eamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735836502; x=1736441302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyMDNkHK0etH+cUtpIiuVqa9ieM+D+8yuqnyQLckCd4=;
        b=t7bizuzYiC9qtSbs9qGV+Y+2VurrlWiAlIm2Gf2rfnqt8bny/NnacbbyxescAb+UA7
         p45IRZ9S5g/E+oASyPbGJSSem+GKU47pHaNq0ti28IkLg303YZsKLpyEgzsP+gXYG4ba
         OvzilSOXa0vPSw0Qhcjb3hqXLH985trPpcGwHYhPlaHd43LnVg9b4p9fcwyGRutUR7WH
         L19g2S60y+KkVclHbzgAsLVxqHQlqRFLB+mEuTJVkQ3h+qx9yhdCXf/T3vAiM+LxxNtr
         /rLX/P4pHxZjteMXwcRnCA8vIONU3CVaLsReoLcDbCNfp/89Alaa8SgCGXNdbOgTLGM7
         5E4w==
X-Forwarded-Encrypted: i=1; AJvYcCVg3R9TCYrSRSdCC+aj/0e86Bzw3tYi8sEDoMB1t+GwEY9G3N5OTl38Bn5nUvAptHJvpaExY9dutiG43A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNeCZ5Gi/HKJ7V5WmPZDV94XUIVr/22my3U/RSQ1/hLLP9R26F
	F4soUfNlMF6jRUfn+/2xif3I6Rv07Y+XxFqhdIQiGQW1IPsKEmA4H84iWxo3IqSgrj5gSplhDfm
	FQTmQLJ4RlQiG37eeZhNqV0kdWaGetYlD6EtYTg==
X-Gm-Gg: ASbGncvNfG4PFWZFMyK6PsW4k6SrKbXdpOPJLsZ45oNAdgROWEyajMG1UJBTiyOKH13
	OX2rs8hibyiZ5y0xMtmnhDHTLdyGjiQ7gXN4y1w==
X-Google-Smtp-Source: AGHT+IExV5pC7e0Fu0IoS4SJ6PwHpfiqmNZCTsT47Ez1h61wHrXnx1XgHz6PCs1R4oLxdc2TTj/NsViwgognmzEuesM=
X-Received: by 2002:a05:690c:4988:b0:6f0:21d6:44a4 with SMTP id
 00721157ae682-6f3f81229b2mr315079927b3.10.1735836502667; Thu, 02 Jan 2025
 08:48:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241230-imx219_fixes-v5-0-98446d816489@ideasonboard.com> <20241230-imx219_fixes-v5-3-98446d816489@ideasonboard.com>
In-Reply-To: <20241230-imx219_fixes-v5-3-98446d816489@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 2 Jan 2025 16:48:04 +0000
Message-ID: <CAPY8ntDHdKZOp8o_ebYPJHsCJe=FdVkFkD4OPw+hV4q5Xkp6vQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] media: i2c: imx219: make HBLANK r/w to allow
 longer exposures
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai

On Mon, 30 Dec 2024 at 06:12, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> The HBLANK control was read-only, and always configured such that the
> sensor line length register was 3448. This limited the maximum exposure
> time that could be achieved to around 1.26 secs.
>
> Make HBLANK read/write so that the line time can be extended, and
> thereby allow longer exposures (and slower frame rates). Retain the
> overall line length setting when changing modes rather than resetting it
> to a default.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 49 +++++++++++++++++++++++++++-------------------
>  1 file changed, 29 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 8565b1b030be2ee24bcc37415e99ee4ef83cc683..9682a74feb3b7b74cd2ca54779323396c77cd5a5 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -73,11 +73,10 @@
>  #define IMX219_REG_FRM_LENGTH          CCI_REG16(0x0160)
>  #define IMX219_FLL_MAX                 0xffff
>  #define IMX219_VBLANK_MIN              32
> +#define IMX219_REG_LINE_LENGTH         CCI_REG16(0x0162)

The datasheet calls the register LINE_LENGTH_A as it has an A and B
back of settings for quick switching between the two. Whilst we don't
use the quick mode switching, IMHO using the correct name is sensible.

Same is true for 0x0160 being FRM_LENGTH_A, not just FRM_LENGTH
(should be part of 2/5 if adopted).

> +#define IMX219_LLP_MIN                 0x0d78
> +#define IMX219_LLP_MAX                 0x7ff0
>
> -/* HBLANK control - read only */
> -#define IMX219_PPL_DEFAULT             3448
> -
> -#define IMX219_REG_LINE_LENGTH_A       CCI_REG16(0x0162)
>  #define IMX219_REG_X_ADD_STA_A         CCI_REG16(0x0164)
>  #define IMX219_REG_X_ADD_END_A         CCI_REG16(0x0166)
>  #define IMX219_REG_Y_ADD_STA_A         CCI_REG16(0x0168)
> @@ -191,7 +190,7 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
>         { CCI_REG8(0x479b), 0x0e },
>
>         /* Frame Bank Register Group "A" */
> -       { IMX219_REG_LINE_LENGTH_A, 3448 },
> +       { IMX219_REG_LINE_LENGTH, IMX219_LLP_MIN },

LINE_LENGTH is also set from imx219_set_ctrl for V4L2_CID_HBLANK, so
this line is redundant and should be removed.
(I'm aware that I missed removing it in the downstream version of this
patch - it's only your rename that highlighted it).

Otherwise this looks good to me.

  Dave

>         { IMX219_REG_X_ODD_INC_A, 1 },
>         { IMX219_REG_Y_ODD_INC_A, 1 },
>
> @@ -420,6 +419,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH,
>                           format->height + ctrl->val, &ret);
>                 break;
> +       case V4L2_CID_HBLANK:
> +               cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH,
> +                         format->width + ctrl->val, &ret);
> +               break;
>         case V4L2_CID_TEST_PATTERN_RED:
>                 cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
>                           ctrl->val, &ret);
> @@ -465,7 +468,7 @@ static int imx219_init_controls(struct imx219 *imx219)
>         const struct imx219_mode *mode = &supported_modes[0];
>         struct v4l2_ctrl_handler *ctrl_hdlr;
>         struct v4l2_fwnode_device_properties props;
> -       int exposure_max, exposure_def, hblank;
> +       int exposure_max, exposure_def;
>         int i, ret;
>
>         ctrl_hdlr = &imx219->ctrl_handler;
> @@ -489,17 +492,16 @@ static int imx219_init_controls(struct imx219 *imx219)
>         if (imx219->link_freq)
>                 imx219->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> -       /* Initial vblank/hblank/exposure parameters based on current mode */
> +       /* Initial blanking and exposure. Limits are updated during set_fmt */
>         imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
>                                            V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
>                                            IMX219_FLL_MAX - mode->height, 1,
>                                            mode->fll_def - mode->height);
> -       hblank = IMX219_PPL_DEFAULT - mode->width;
>         imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> -                                          V4L2_CID_HBLANK, hblank, hblank,
> -                                          1, hblank);
> -       if (imx219->hblank)
> -               imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +                                          V4L2_CID_HBLANK,
> +                                          IMX219_LLP_MIN - mode->width,
> +                                          IMX219_LLP_MAX - mode->width, 1,
> +                                          IMX219_LLP_MIN - mode->width);
>         exposure_max = mode->fll_def - 4;
>         exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>                 exposure_max : IMX219_EXPOSURE_DEFAULT;
> @@ -815,6 +817,10 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         struct v4l2_mbus_framefmt *format;
>         struct v4l2_rect *crop;
>         unsigned int bin_h, bin_v;
> +       u32 prev_line_len;
> +
> +       format = v4l2_subdev_state_get_format(state, 0);
> +       prev_line_len = format->width + imx219->hblank->val;
>
>         mode = v4l2_find_nearest_size(supported_modes,
>                                       ARRAY_SIZE(supported_modes),
> @@ -822,8 +828,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                                       fmt->format.width, fmt->format.height);
>
>         imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
> -
> -       format = v4l2_subdev_state_get_format(state, 0);
>         *format = fmt->format;
>
>         /*
> @@ -859,13 +863,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                                          exposure_max, imx219->exposure->step,
>                                          exposure_def);
>                 /*
> -                * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
> -                * depends on mode->width only, and is not changeble in any
> -                * way other than changing the mode.
> +                * Retain PPL setting from previous mode so that the
> +                * line time does not change on a mode change.
> +                * Limits have to be recomputed as the controls define
> +                * the blanking only, so PPL values need to have the
> +                * mode width subtracted.
>                  */
> -               hblank = IMX219_PPL_DEFAULT - mode->width;
> -               __v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1,
> -                                        hblank);
> +               hblank = prev_line_len - mode->width;
> +               __v4l2_ctrl_modify_range(imx219->hblank,
> +                                        IMX219_LLP_MIN - mode->width,
> +                                        IMX219_LLP_MAX - mode->width, 1,
> +                                        IMX219_LLP_MIN - mode->width);
> +               __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
>         }
>
>         return 0;
>
> --
> 2.47.1
>

