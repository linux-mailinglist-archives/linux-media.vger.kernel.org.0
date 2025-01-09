Return-Path: <linux-media+bounces-24537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7018DA079C0
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 15:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8443A3A3EE1
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 14:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C267E21B8F7;
	Thu,  9 Jan 2025 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="k7+gd84X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3026F21764D
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434313; cv=none; b=RAatJxEmtHFVHOQMi8IUGCPIYGtZJahcxuozdNkpQWCV+QXXCnTuUGyYAWEZD8/au97hubEv5FjVe1cZE5RY4kxnyVXgo4henpSJROBnGjRLtMsyPYsR7/Bm0rhSa2BzsBrUARNxbv4iZSeuQciilfpaZoegcsbcuWUenJfXxL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434313; c=relaxed/simple;
	bh=5iWcb2DT3oa1kBAmOPvx4VdqBGmT80iw/qGGBIb8tMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ss1cNMoQ91s2+yab4OvXQi46612XlnGr4+1YrvRnczcdsTvRf04UYXaScZeO0e+xXCJPapcdtOlseSvNKSENTt5u79q6Pg5MC1V98lpYNPGHAX/IAIApZWol+MQ1Ij3pCAP2DBCoYIsrbvObL8Gs7PIsqMYegt5X8hEerACeyNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=k7+gd84X; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e460717039fso1309149276.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2025 06:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736434310; x=1737039110; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3cfBkmvLTg4/yEDxW6jq/Ewc8vKfMbUsnqUNmouV8Go=;
        b=k7+gd84XngeKT3VmKQTX2lDHQ6rXOEfjwNsUrtMePPRkP56jFTbo/r12g3oyHCFKpy
         NaqT0UYlSPRV1K3n1nw9+3BzpCQtS5m8XSgFAAg8Qu4fZrQEcMabBRLajlXv+eZ86UCd
         U6hsmN4WbPdNBaZXZ/Fa5zQbHekcbUPUgt7gH+5Q0cNq/nf1lKtj7hhmJkme/efvVkEa
         7is2YN084tydZdHPwNZJu3e/5RHZUq0cIvMlNG8A17+bi5JXh5TByV9wCN87q+20RkyC
         gBkGa5g8Quh3t07PWSEqOree66hoX6464JFQd5SHHOmZpUJ9Gg0vKVBxdZoN5DlLm44I
         j+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736434310; x=1737039110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cfBkmvLTg4/yEDxW6jq/Ewc8vKfMbUsnqUNmouV8Go=;
        b=U6s/kN6m5+nSrVWqUiosa9tGg0SJbJv1HuF7+U5dyO790JTDXZdGK6iTxX7YvMiDfM
         4jLslbG3FX+iIYvEwyNIdUxSILijHeCIB8mw74UcOB10W4P9JQPNTGn5j9x1UmhyCxlS
         2rfYO6sAOZwVTFsAZrK69kXsH2kmzWsrgSp06vnH6BVcHfDexlrq9N4s8i206bFambqP
         FQb+Ly291fOIRT79Q/utJG/7XZNwnGvHzmbqptKkF5qZlBstetFx0jldbrloSbOU4hNP
         JqHYv7oz3IM6mCNb7YB9PSAUTRI5dDcvz/WUZcJQR730KWk98K+kj7FCXk9UxzeY5NVc
         UNmw==
X-Gm-Message-State: AOJu0Yz00eJG0JaW0Y7qWBUK9QvlS3YoPBpyEtlZ5IHx6MdxiBHHEDLk
	E95mAQxWvXnLQEVHa+XhErUgi5jDl0p8T9KIirsO5DmTKmiEYcCad7b4kU8jxU0NUQgtDC47C3h
	6l8Mhanp4MjAOtYQpP//77U4P9FxK3CZ22umF7Q==
X-Gm-Gg: ASbGnctnRiC/84NHeeRXD7ur82fpHGomk0A2CH1yO/+biGhrEESHPEigDbjn+g9yZDa
	pGlfYeei1Djo/Po+EANqtJ7VF+LIB/LqmsfdfAQ==
X-Google-Smtp-Source: AGHT+IE/CtVlqMMVIQSjDPi3r1E+PtV8X3hW/j9xojPlittU/jPrcGxJ7aSyZ8hw1dHSSfwmD5xNhwuVg5oHn2+Ij00=
X-Received: by 2002:a05:690c:4486:b0:6ef:7c45:84cc with SMTP id
 00721157ae682-6f531224a8cmr56217647b3.18.1736434309974; Thu, 09 Jan 2025
 06:51:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com> <20250109-media-imx415-v1-1-366ba6a234ab@raspberrypi.com>
In-Reply-To: <20250109-media-imx415-v1-1-366ba6a234ab@raspberrypi.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 9 Jan 2025 14:51:31 +0000
X-Gm-Features: AbW1kvaw6nBvKOjfPZGLbC45PRkCiCJV1VRWzcQFf82UwuI_vw1EIBmxweUXl7w
Message-ID: <CAPY8ntCe8LB-sEwsG8iWgRWDEfUSGv+YMFtavoVhMryAo7awjg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: imx415: Add read/write control of VBLANK
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Michael Riesch <michael.riesch@wolfvision.net>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jan 2025 at 11:17, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> This also requires that the ranges for the exposure control
> are updated.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx415.c | 51 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 3f7924aa1bd3..2c8c0905aa99 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -26,6 +26,7 @@
>  #define IMX415_PIXEL_ARRAY_WIDTH  3864
>  #define IMX415_PIXEL_ARRAY_HEIGHT 2192
>  #define IMX415_PIXEL_ARRAY_VBLANK 58
> +#define IMX415_EXPOSURE_OFFSET   8
>
>  #define IMX415_NUM_CLK_PARAM_REGS 11
>
> @@ -51,6 +52,7 @@
>  #define IMX415_OUTSEL            CCI_REG8(0x30c0)
>  #define IMX415_DRV               CCI_REG8(0x30c1)
>  #define IMX415_VMAX              CCI_REG24_LE(0x3024)
> +#define IMX415_VMAX_MAX                  0xfffff
>  #define IMX415_HMAX              CCI_REG16_LE(0x3028)
>  #define IMX415_SHR0              CCI_REG24_LE(0x3050)
>  #define IMX415_GAIN_PCG_0        CCI_REG16_LE(0x3090)
> @@ -447,7 +449,6 @@ static const struct imx415_clk_params imx415_clk_params[] = {
>
>  /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_2_720[] = {
> -       { IMX415_VMAX, 0x08CA },
>         { IMX415_HMAX, 0x07F0 },
>         { IMX415_LANEMODE, IMX415_LANEMODE_2 },
>         { IMX415_TCLKPOST, 0x006F },
> @@ -463,7 +464,6 @@ static const struct cci_reg_sequence imx415_mode_2_720[] = {
>
>  /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_2_1440[] = {
> -       { IMX415_VMAX, 0x08CA },
>         { IMX415_HMAX, 0x042A },
>         { IMX415_LANEMODE, IMX415_LANEMODE_2 },
>         { IMX415_TCLKPOST, 0x009F },
> @@ -479,7 +479,6 @@ static const struct cci_reg_sequence imx415_mode_2_1440[] = {
>
>  /* all-pixel 4-lane 891 Mbps 30 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_4_891[] = {
> -       { IMX415_VMAX, 0x08CA },
>         { IMX415_HMAX, 0x044C },
>         { IMX415_LANEMODE, IMX415_LANEMODE_4 },
>         { IMX415_TCLKPOST, 0x007F },
> @@ -600,6 +599,7 @@ struct imx415 {
>         struct v4l2_ctrl *vblank;
>         struct v4l2_ctrl *hflip;
>         struct v4l2_ctrl *vflip;
> +       struct v4l2_ctrl *exposure;
>
>         unsigned int cur_mode;
>         unsigned int num_data_lanes;
> @@ -730,17 +730,37 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
>                                              ctrls);
>         const struct v4l2_mbus_framefmt *format;
>         struct v4l2_subdev_state *state;
> +       u32 exposure_max;
>         unsigned int vmax;
>         unsigned int flip;
>         int ret;
>
> -       if (!pm_runtime_get_if_in_use(sensor->dev))
> -               return 0;
> -
>         state = v4l2_subdev_get_locked_active_state(&sensor->subdev);
>         format = v4l2_subdev_state_get_format(state, 0);
>
> +       if (ctrl->id == V4L2_CID_VBLANK) {
> +               exposure_max = format->height + ctrl->val -
> +                              IMX415_EXPOSURE_OFFSET;
> +               __v4l2_ctrl_modify_range(sensor->exposure,
> +                                        sensor->exposure->minimum,
> +                                        exposure_max, sensor->exposure->step,
> +                                        sensor->exposure->default_value);
> +       }
> +
> +       if (!pm_runtime_get_if_in_use(sensor->dev))
> +               return 0;
> +
>         switch (ctrl->id) {
> +       case V4L2_CID_VBLANK:
> +               ret = cci_write(sensor->regmap, IMX415_VMAX,
> +                               format->height + ctrl->val, NULL);
> +               if (ret)
> +                       return ret;
> +               /*
> +                * Deliberately fall through as exposure is set based on VMAX
> +                * which has just changed.
> +                */
> +               fallthrough;

Checkpatch complains "WARNING: Prefer 'fallthrough;' over fallthrough comment"
Having a comment as to why we're wanting to fall through as well as
fallthrough; seems reasonable to me.

However what I have just noticed is that the V4L2_CID_EXPOSURE case
uses ctrl->val, which is going to be incorrect when we fall through.
I'll sort out an update in due course.

  Dave

>         case V4L2_CID_EXPOSURE:
>                 /* clamp the exposure value to VMAX. */
>                 vmax = format->height + sensor->vblank->cur.val;
> @@ -787,7 +807,8 @@ static int imx415_ctrls_init(struct imx415 *sensor)
>         u64 pixel_rate = supported_modes[sensor->cur_mode].pixel_rate;
>         u64 lane_rate = supported_modes[sensor->cur_mode].lane_rate;
>         u32 exposure_max = IMX415_PIXEL_ARRAY_HEIGHT +
> -                          IMX415_PIXEL_ARRAY_VBLANK - 8;
> +                          IMX415_PIXEL_ARRAY_VBLANK -
> +                          IMX415_EXPOSURE_OFFSET;
>         u32 hblank;
>         unsigned int i;
>         int ret;
> @@ -816,8 +837,9 @@ static int imx415_ctrls_init(struct imx415 *sensor)
>         if (ctrl)
>                 ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> -       v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops, V4L2_CID_EXPOSURE,
> -                         4, exposure_max, 1, exposure_max);
> +       sensor->exposure = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
> +                                            V4L2_CID_EXPOSURE, 4,
> +                                            exposure_max, 1, exposure_max);
>
>         v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
>                           V4L2_CID_ANALOGUE_GAIN, IMX415_AGAIN_MIN,
> @@ -834,16 +856,9 @@ static int imx415_ctrls_init(struct imx415 *sensor)
>         sensor->vblank = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
>                                            V4L2_CID_VBLANK,
>                                            IMX415_PIXEL_ARRAY_VBLANK,
> -                                          IMX415_PIXEL_ARRAY_VBLANK, 1,
> -                                          IMX415_PIXEL_ARRAY_VBLANK);
> -       if (sensor->vblank)
> -               sensor->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +                                          IMX415_VMAX_MAX - IMX415_PIXEL_ARRAY_HEIGHT,
> +                                          1, IMX415_PIXEL_ARRAY_VBLANK);
>
> -       /*
> -        * The pixel rate used here is a virtual value and can be used for
> -        * calculating the frame rate together with hblank. It may not
> -        * necessarily be the physically correct pixel clock.
> -        */
>         v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE, pixel_rate,
>                           pixel_rate, 1, pixel_rate);
>
>
> --
> 2.34.1
>

