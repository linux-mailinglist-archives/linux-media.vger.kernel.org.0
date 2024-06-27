Return-Path: <linux-media+bounces-14266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039A91AB9E
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 17:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94CDE1C20402
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4531991A7;
	Thu, 27 Jun 2024 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aAAyLaeB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5AC1991A4
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719502801; cv=none; b=MywWO7dLPDP9J7If19ToSQigtdsxmsTlhlhWr1WbBPbMKclLoGs4HA7i5ScRxcrMYpz2ltF9NxrtOJIVDjWzc+xlBjruTpHushmye1Ix9yRpkC0EYRZ5oIlQ14Ozb8eUrxSn3NGY0bD79+PS1qVU93Mpe06MAIqIuZzgWAdZ35Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719502801; c=relaxed/simple;
	bh=bgOG9mwHgWzz16HTrXYcLCnwc7PTqJhEkhfrIfsM3bY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exODI+UyThRhuH32HHU0SYNse1HCftkiDyeVz4+kREt/wt8fxSwsZLnwGoyfvI3Ax0po5yrxXm/TovkKQUZ3L2V2ow8CPODHwRSPc2AumpMMrAVmDKivMmhIgJnn14CgLcMVIMM+iavrkontkmvZ8JH9+8uJdQci3ogQ2Z64cKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=aAAyLaeB; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-63f7d53bd88so64680837b3.2
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1719502797; x=1720107597; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mwEWqBVN03NNnfmsrjbe3NFMaApgiOXCWRzmdVPAQ70=;
        b=aAAyLaeBTOPSfStEzxhTfuN9hPyAqs79WAmrhwgaDr2fDBzL4MOO0a2QYuljCpA+3h
         Hb0/QQYVXFmiCquZzXDC1RkP55afJmUOzogrlOtFiPpqnA/iB1Bwl82GgMpakPdEdxIU
         sx25H6obSPbQJO3Ef7uIaDmEpR+EK2vKdg19WjEVztomjReBCWBVUc2Stgi+hncLd1wl
         mmmG23//ukLvnF/2pa0Dlxyhd+Be2g+2qCGqDgw4KFH1YHa2HPE6LeybdXMyQC7CuoWN
         vK7Qr1LHQFEuE/t6zxS7FcIs5BMkwbKCxhdQ8D5C9QD38TBsM149Oa/tcmiI5v7DdXHD
         q9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719502797; x=1720107597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwEWqBVN03NNnfmsrjbe3NFMaApgiOXCWRzmdVPAQ70=;
        b=CZM3YDOQIn9svSpStNtFSL7+SvY2qAZLkhuW4oInHlbnJ45zXCvG1SmRmqaLixOkZq
         WISPCwIFQL1Y03cUeWp2Wq1BEJaC4qm6vShFlLHK22ag8mG/ePbbZhZ7ItMzlVjDpShH
         MVHboKPblIQykIu0+dGD4Z5xi+YTCK/RVsfw6svYHO3KYZZhX1auZZxswUEFY8kWHj7h
         evFuPfA+4oZU8yRBrvN7/orLUFbeLS25nPAE1tdlNkAgPArZdYIyLvwfzzt2MkFuoOOo
         GqhDFpWCSg0469Y8xyo+8n3yAQzxRwbW4IYsBMXallWvI7XZX0V74mCH1pIA2IdvG0OV
         Cikg==
X-Gm-Message-State: AOJu0Yy1GO5fXcuqqz/QfKOqVQmQa1FYaLclWZ490UwOU0uLl/KH2eb0
	7/e/VEgFAdl+Wm0dugDzTl71ePSQBc/dgWexhD4e0hKBhPKEcLK9V3Vj2LGFYQIVA7EabRUJmtC
	xVRM1JwlUn8QqIPJ9lc+RLUl9YGHLMra5Vr9/QQ==
X-Google-Smtp-Source: AGHT+IH44xwulSjMoiZrbGI3tJeFIZBRCAi6jwUriUDMKbVMRWi8SWCUYb82eRkNTRuoSC+zNblYl8n7+42psAlL1tU=
X-Received: by 2002:a25:2705:0:b0:dff:2b58:f5d with SMTP id
 3f1490d57ef6-e0303ed9d21mr12645367276.4.1719502796257; Thu, 27 Jun 2024
 08:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626211529.2068473-1-shill@d3engineering.com> <20240626211529.2068473-2-shill@d3engineering.com>
In-Reply-To: <20240626211529.2068473-2-shill@d3engineering.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 27 Jun 2024 16:39:37 +0100
Message-ID: <CAPY8ntBdh05qpKypgTsNA5-rqDUDTU1LJhyH9Xsjh_tvA_ctQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: Add driver for Sony IMX728
To: Spencer Hill <shill@d3engineering.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Spencer

Thanks for the patch - always nice to see new sensors being supported.

I assume there's no public datasheet for the sensor, but are you aware
of even a product brief? Reviews are tricky without data to work with.
I've just read through looking for discrepancies and common errors.

On Wed, 26 Jun 2024 at 22:16, Spencer Hill <shill@d3engineering.com> wrote:
>
> Add a driver for the Sony IMX728 image sensor.
>
> Signed-off-by: Spencer Hill <shill@d3engineering.com>
> ---
>  drivers/media/i2c/Kconfig  |   11 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx728.c | 1167 ++++++++++++
>  drivers/media/i2c/imx728.h | 3458 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 4637 insertions(+)
>  create mode 100644 drivers/media/i2c/imx728.c
>  create mode 100644 drivers/media/i2c/imx728.h
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index c6d3ee472d81..46b6463c558a 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -233,6 +233,17 @@ config VIDEO_IMX415
>           To compile this driver as a module, choose M here: the
>           module will be called imx415.
>
> +config VIDEO_IMX728
> +       tristate "Sony IMX728 sensor support"
> +       depends on OF_GPIO
> +       select V4L2_CCI_I2C
> +       help
> +         This is a Video4Linux2 sensor driver for the Sony
> +         IMX728 camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called imx728.
> +
>  config VIDEO_MAX9271_LIB
>         tristate
>
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index dfbe6448b549..1188420ee1b4 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_VIDEO_IMX335) += imx335.o
>  obj-$(CONFIG_VIDEO_IMX355) += imx355.o
>  obj-$(CONFIG_VIDEO_IMX412) += imx412.o
>  obj-$(CONFIG_VIDEO_IMX415) += imx415.o
> +obj-$(CONFIG_VIDEO_IMX728) += imx728.o
>  obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
>  obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
> diff --git a/drivers/media/i2c/imx728.c b/drivers/media/i2c/imx728.c
> new file mode 100644
> index 000000000000..b23359133a22
> --- /dev/null
> +++ b/drivers/media/i2c/imx728.c
> @@ -0,0 +1,1167 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Sony IMX728 CMOS Image Sensor Driver
> + *
> + * Copyright (c) 2024 Define Design Deploy Corp
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/v4l2-mediabus.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +
> +#include "imx728.h"
> +
> +static inline struct imx728 *to_imx728(struct v4l2_subdev *sd)
> +{
> +       return container_of(sd, struct imx728, subdev);
> +}
> +
> +static int imx728_read(struct imx728 *imx728, u16 addr, u32 *val, size_t nbytes)
> +{
> +       int ret;
> +       __le32 val_le = 0;
> +
> +       ret = regmap_bulk_read(imx728->regmap, addr, &val_le, nbytes);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "%s: failed to read reg 0x%04x: %d\n",
> +                       __func__, addr, ret);
> +               return ret;
> +       }
> +
> +       *val = le32_to_cpu(val_le);
> +
> +       return 0;
> +}
> +
> +static int imx728_write(struct imx728 *imx728, u16 addr, u32 val, size_t nbytes)
> +{
> +       int ret;
> +       __le32 val_le = cpu_to_le32(val);
> +
> +       ret = regmap_bulk_write(imx728->regmap, addr, &val_le, nbytes);
> +       if (ret < 0)
> +               dev_err(imx728->dev, "%s: failed to write reg 0x%04x: %d\n",
> +                       __func__, addr, ret);
> +
> +       return ret;
> +}
> +
> +static int imx728_update_bits(struct imx728 *imx728, u16 addr, u32 val, u32 mask, size_t nbytes)
> +{
> +       int ret;
> +       u32 cfg;
> +
> +       ret = imx728_read(imx728, addr, &cfg, nbytes);
> +       if (ret < 0)
> +               return ret;
> +
> +       cfg = (val) ? (cfg | mask) : (cfg & (~mask));
> +
> +       return imx728_write(imx728, addr, cfg, nbytes);
> +}
> +
> +static int imx728_write_table(struct imx728 *imx728,
> +                             const struct reg_sequence *regs,
> +                             unsigned int nr_regs)
> +{
> +       int ret;
> +
> +       ret = regmap_multi_reg_write(imx728->regmap, regs, nr_regs);
> +       if (ret < 0)
> +               dev_err(imx728->dev,
> +                       "%s: failed to write reg table (%d)!\n", __func__, ret);
> +       return ret;
> +}
> +
> +static int imx728_wait_for_state(struct imx728 *imx728, enum imx728_sensor_state state)
> +{
> +       int ret, i;
> +       u32 val;
> +
> +       for (i = 0; i < 50; i++) {
> +               ret = imx728_read(imx728, 0x2CAC, &val, 1);
> +               if (ret == 0 && val == state) {
> +                       dev_info(imx728->dev, "%s: Enter state %u\n", __func__, val);
> +                       return 0;
> +               }
> +               usleep_range(1000, 10000);
> +       }
> +
> +       return -EBUSY;
> +}
> +
> +static void imx728_init_formats(struct v4l2_subdev_state *state)
> +{
> +       struct v4l2_mbus_framefmt *format;
> +
> +       format = v4l2_subdev_state_get_format(state, 0, 0);
> +       format->code = imx728_mbus_formats[0];
> +       format->width = imx728_framesizes[0].width;
> +       format->height = imx728_framesizes[0].height;
> +       format->field = V4L2_FIELD_NONE;
> +       format->colorspace = V4L2_COLORSPACE_SMPTE170M;
> +}
> +
> +static int _imx728_set_routing(struct v4l2_subdev *sd,
> +                              struct v4l2_subdev_state *state)
> +{
> +       struct v4l2_subdev_route routes[] = {
> +               {
> +                       .source_pad = 0,
> +                       .source_stream = 0,
> +                       .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +               },
> +               {
> +                       .source_pad = 0,
> +                       .source_stream = 1,
> +               }
> +       };
> +
> +       struct v4l2_subdev_krouting routing = {
> +               .num_routes = ARRAY_SIZE(routes),
> +               .routes = routes,
> +       };
> +
> +       int ret;
> +
> +       ret = v4l2_subdev_set_routing(sd, state, &routing);
> +       if (ret < 0)
> +               return ret;
> +
> +       imx728_init_formats(state);
> +
> +       return 0;
> +}
> +
> +static int imx728_enum_mbus_code(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state,
> +                                struct v4l2_subdev_mbus_code_enum *code)
> +{
> +
> +       if (code->index >= ARRAY_SIZE(imx728_mbus_formats))

imx728_mbus_formats only lists MEDIA_BUS_FMT_SRGGB10_1X10. Is this for
potential addition of the 12, 16, or 20 bit readout modes? How likely
are those to actually happen?

> +               return -EINVAL;
> +
> +       code->code = imx728_mbus_formats[code->index];
> +
> +       return 0;
> +}
> +
> +static int imx728_enum_frame_sizes(struct v4l2_subdev *sd,
> +                                  struct v4l2_subdev_state *state,
> +                                  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(imx728_mbus_formats); ++i) {
> +               if (imx728_mbus_formats[i] == fse->code)
> +                       break;
> +       }
> +
> +       if (i == ARRAY_SIZE(imx728_mbus_formats))
> +               return -EINVAL;
> +
> +       if (fse->index >= ARRAY_SIZE(imx728_framesizes))
> +               return -EINVAL;
> +
> +       fse->min_width = imx728_framesizes[fse->index].width;
> +       fse->max_width = fse->min_width;
> +       fse->min_height = imx728_framesizes[fse->index].height;
> +       fse->max_height = fse->min_height;
> +
> +       return 0;
> +}
> +
> +static int imx728_set_fmt(struct v4l2_subdev *sd,
> +                         struct v4l2_subdev_state *state,
> +                         struct v4l2_subdev_format *fmt)
> +{
> +       struct imx728 *imx728 = to_imx728(sd);
> +       struct v4l2_mbus_framefmt *format;
> +       const struct v4l2_area *fsize;
> +       unsigned int i;
> +       u32 code;
> +       int ret = 0;
> +
> +       if (fmt->pad != 0)
> +               return -EINVAL;
> +
> +       if (fmt->stream != 0)
> +               return -EINVAL;
> +
> +       for (i = 0; i < ARRAY_SIZE(imx728_mbus_formats); ++i) {
> +               if (imx728_mbus_formats[i] == fmt->format.code) {
> +                       code = fmt->format.code;
> +                       break;
> +               }
> +       }
> +
> +       if (i == ARRAY_SIZE(imx728_mbus_formats))
> +               code = imx728_mbus_formats[0];
> +
> +       fsize = v4l2_find_nearest_size(imx728_framesizes,
> +                                      ARRAY_SIZE(imx728_framesizes), width,
> +                                      height, fmt->format.width,
> +                                      fmt->format.height);
> +
> +       mutex_lock(&imx728->lock);
> +
> +       format = v4l2_subdev_state_get_format(state, fmt->pad, fmt->stream);
> +
> +       if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && imx728->streaming) {
> +               ret = -EBUSY;
> +               goto done;
> +       }
> +
> +       format->code = code;
> +       format->width = fsize->width;
> +       format->height = fsize->height;
> +
> +       fmt->format = *format;
> +
> +done:
> +       mutex_unlock(&imx728->lock);
> +
> +       return ret;
> +}
> +
> +static int imx728_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +                                struct v4l2_mbus_frame_desc *fd)
> +{
> +       struct v4l2_subdev_state *state;
> +       struct v4l2_mbus_framefmt *fmt;
> +       u32 bpp;
> +       int ret = 0;
> +
> +       if (pad != 0)
> +               return -EINVAL;
> +
> +       state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +       fmt = v4l2_subdev_state_get_format(state, 0, 0);
> +       if (!fmt) {
> +               ret = -EPIPE;
> +               goto out;
> +       }
> +
> +       memset(fd, 0, sizeof(*fd));
> +
> +       fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +       bpp = 10;
> +
> +       fd->entry[fd->num_entries].stream = 0;
> +
> +       fd->entry[fd->num_entries].flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
> +       fd->entry[fd->num_entries].length = fmt->width * fmt->height * bpp / 8;
> +       fd->entry[fd->num_entries].pixelcode = fmt->code;
> +       fd->entry[fd->num_entries].bus.csi2.vc = 0;
> +       fd->entry[fd->num_entries].bus.csi2.dt = 0x2b;

Presumably this 0x2b is MIPI_CSI2_DT_RAW10.
That comes back to the question above as to whether supporting other
bit depths is really likely, as if so then prepare to change this
value based on mbus_code.

> +
> +       fd->num_entries++;

Presumably this fd->num_entries manipulation is due to expecting to
support multiple data types? Whilst not wrong, at the moment it feels
a little redundant.

> +
> +out:
> +
> +       v4l2_subdev_unlock_state(state);
> +
> +       return ret;
> +}
> +
> +static int imx728_set_routing(struct v4l2_subdev *sd,
> +                             struct v4l2_subdev_state *state,
> +                             enum v4l2_subdev_format_whence which,
> +                             struct v4l2_subdev_krouting *routing)
> +{
> +       int ret;
> +
> +       if (routing->num_routes == 0 || routing->num_routes > 1)
> +               return -EINVAL;
> +
> +       ret = _imx728_set_routing(sd, state);
> +
> +       return ret;
> +}
> +
> +static int imx728_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct imx728 *imx728 = container_of(ctrl->handler,
> +                                       struct imx728, ctrl.handler);
> +       int ret = 0;
> +
> +       dev_dbg(imx728->dev, "%s: %s, value: %d\n",
> +                       __func__, ctrl->name, ctrl->val);
> +
> +       if (!pm_runtime_get_if_in_use(imx728->dev))
> +               return 0;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE:
> +               ret = imx728_write(imx728, 0x98DC, ctrl->val, 4);
> +               break;
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               ret = imx728_update_bits(imx728, 0x98F8,
> +                               (ctrl->val * 10),
> +                               0x1FFFF, 4);
> +               break;
> +       case V4L2_CID_HFLIP:
> +               ret = imx728_update_bits(imx728, 0x9651,
> +                                        ctrl->val, 0x1, 1);
> +               ret |= imx728_update_bits(imx728, 0xB67C,
> +                                         ctrl->val, 0x1, 1);
> +               break;
> +       case V4L2_CID_VFLIP:
> +               ret = imx728_update_bits(imx728, 0x9651,
> +                                        ctrl->val << 1, 0x2, 1);
> +               ret = imx728_update_bits(imx728, 0xB67D,
> +                                        ctrl->val, 0x1, 1);
> +               break;
> +       case V4L2_CID_WIDE_DYNAMIC_RANGE:
> +       case V4L2_CID_TEST_PATTERN:
> +               // Both of these are configured during start stream.
> +               ret = 0;
> +               break;
> +       default:
> +               ret = -EINVAL;
> +       }
> +
> +       pm_runtime_put_noidle(imx728->dev);
> +       return ret;
> +}
> +
> +static int imx728_detect(struct imx728 *imx728)
> +{
> +       int ret;
> +       u32 minor, major;
> +
> +       ret = imx728_read(imx728, 0x6002, &major, 1);
> +       if (ret != 0) {
> +               dev_err(imx728->dev, "Could not read PARAM_MAJOR_VER!");
> +               return ret;
> +       }
> +       ret = imx728_read(imx728, 0x6000, &minor, 1);
> +       if (ret != 0) {
> +               dev_err(imx728->dev, "Could not read PARAM_MINOR_VER!");
> +               return ret;
> +       }
> +       dev_dbg(imx728->dev, "Got version: %d.%d", major, minor);
> +
> +       return 0;
> +}
> +
> +static int imx728_reset(struct imx728 *imx728)
> +{
> +
> +       if (!IS_ERR_OR_NULL(imx728->xclr_gpio)) {
> +               gpiod_set_value_cansleep(imx728->xclr_gpio, 1);
> +               usleep_range(1000, 10000);
> +               gpiod_set_value_cansleep(imx728->xclr_gpio, 0);
> +               msleep(100);
> +
> +               return 0;
> +       }
> +
> +       return -1;
> +}
> +
> +static int imx728_power_on(struct imx728 *imx728)
> +{
> +       int ret;
> +
> +       ret = clk_prepare_enable(imx728->clk);
> +       if (ret < 0)
> +               return ret;
> +
> +       imx728_reset(imx728);
> +       return 0;
> +}
> +
> +static int imx728_power_off(struct imx728 *imx728)
> +{
> +
> +       if (imx728->xclr_gpio) {
> +               gpiod_set_value_cansleep(imx728->xclr_gpio, 1);
> +
> +               usleep_range(1, 10);
> +       }
> +       clk_disable_unprepare(imx728->clk);
> +       return 0;
> +}
> +
> +static int imx728_get_frame_interval(struct v4l2_subdev *sd,
> +                                    struct v4l2_subdev_state *sd_state,
> +                                    struct v4l2_subdev_frame_interval *fi)
> +{
> +       struct imx728 *imx728 = to_imx728(sd);
> +
> +       fi->interval.numerator = 1;
> +       fi->interval.denominator = imx728->fps;
> +       return 0;
> +}
> +
> +static int imx728_set_frame_interval(struct v4l2_subdev *sd,
> +                                    struct v4l2_subdev_state *sd_state,
> +                                    struct v4l2_subdev_frame_interval *fi)
> +{
> +       struct imx728 *imx728 = to_imx728(sd);
> +       u32 req_fps;
> +
> +       mutex_lock(&imx728->lock);
> +
> +       if (fi->interval.numerator == 0 || fi->interval.denominator == 0) {
> +               fi->interval.denominator = IMX728_FRAMERATE_DEFAULT;
> +               fi->interval.numerator = 1;
> +       }
> +
> +       req_fps = clamp_val(DIV_ROUND_CLOSEST(fi->interval.denominator,
> +                                             fi->interval.numerator),
> +                           IMX728_FRAMERATE_MIN, IMX728_FRAMERATE_MAX);
> +
> +       fi->interval.numerator = 1;
> +       fi->interval.denominator = req_fps;
> +
> +       imx728->fps = req_fps;
> +
> +       mutex_unlock(&imx728->lock);
> +       dev_dbg(imx728->dev, "%s frame rate = %d\n", __func__, imx728->fps);

Is setting the frame rate actually supported in the driver? I can't
see imx728->fps being used other than to return the value in
imx728_get_frame_interval.

Frame rate control on raw sensors is normally controlled through
V4L2_CID_VBLANK and V4L2_CID_HBLANK, not these ioctls.
See https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-sensor.html#raw-camera-sensors

> +
> +       return 0;
> +}
> +
> +static int imx728_powerup_to_standby(struct imx728 *imx728)
> +{
> +       int ret;
> +
> +       dev_info(imx728->dev, "powerup -> standby...");
> +
> +       ret = imx728_reset(imx728);
> +       if (ret) {
> +               dev_err(imx728->dev, "Error resetting: %i", ret);
> +               return ret;
> +       }
> +
> +       ret = imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_SLEEP);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Could not transition to Sleep state!");
> +               return ret;
> +       }
> +
> +       ret = imx728_write(imx728, 0x1B20, imx728->clk_rate / 1000000, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write INCK frequency!");
> +               return ret;
> +       }
> +
> +       ret = imx728_write(imx728, 0x1B1C, 0x1, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write INCK frequency!");
> +               return ret;
> +       }
> +
> +       ret = imx728_write(imx728, 0x1B05, 0xFF, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write to CK_SLEEP!");
> +               return ret;
> +       }
> +
> +       ret = imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STANDBY);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't transition from Sleep to Standby state!");
> +               return ret;
> +       }
> +
> +       ret = imx728_write(imx728, 0xFFFF, IMX728_REMAP_MODE_STANDBY, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write regmap mode!");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx728_hdr_fixed_brightness(struct imx728 *imx728)
> +{
> +       int ret;
> +
> +       // Sony recommended values
> +       unsigned int exposure_sp1_sp2_us = 10000;
> +       unsigned int exposure_sp1vs_us = 56;
> +       unsigned int sp1h_gain = 240;
> +       unsigned int sp1l_gain = 75;
> +       unsigned int sp1ec_gain = 21;
> +       unsigned int sp2_gain = 33;
> +       unsigned int sp1vs_gain = 84;
> +
> +       ret = imx728_write(imx728, 0x98DC, exposure_sp1_sp2_us, 4);
> +       ret |= imx728_write(imx728, 0x98E4, exposure_sp1_sp2_us, 4);
> +       ret |= imx728_write(imx728, 0x98EC, exposure_sp1vs_us, 4);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Failed to write fixed exposure values.");
> +               return ret;
> +       }
> +
> +       ret = imx728_update_bits(imx728, 0x98F8,
> +                         sp1h_gain,
> +                         0x1FFFF,
> +                         4);
> +       ret |= imx728_update_bits(imx728, 0x98FC,
> +                         sp1l_gain,
> +                         0x1FFFF,
> +                         4);
> +       ret |= imx728_update_bits(imx728, 0x9900,
> +                         sp1ec_gain,
> +                         0x1FFFF,
> +                         4);
> +       ret |= imx728_update_bits(imx728, 0x9904,
> +                         sp2_gain,
> +                         0x1FFFF,
> +                         4);
> +       ret |= imx728_update_bits(imx728, 0x9908,
> +                         sp1vs_gain,
> +                         0x1FFFF,
> +                         4);
> +
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Failed to write fixed gain values.");
> +               return ret;
> +       }
> +
> +       dev_info(imx728->dev, "Wrote fixed brightness for HDR");
> +
> +       return 0;
> +}
> +
> +static int imx728_hdr_configure(
> +       struct imx728 *imx728,
> +       struct imx728_ctrl_point *points,
> +       int hdr_bits)
> +{
> +       u32 hdr_norm_x0;
> +       u32 hdr_norm_x1;
> +       u32 hdr_norm_y0;
> +       u32 hdr_norm_y1;
> +
> +       int ret;
> +       int i;
> +
> +       switch (hdr_bits) {
> +       case 20:
> +               hdr_norm_x0 = 0x2000;
> +               hdr_norm_x1 = 0x5000;
> +
> +               hdr_norm_y0 = 0x0;
> +               hdr_norm_y1 = 0xd000;
> +               break;
> +       case 24:
> +               hdr_norm_x0 = 0x3000;
> +               hdr_norm_x1 = 0x5000;
> +
> +               hdr_norm_y0 = 0x0;
> +               hdr_norm_y1 = 0xe000;
> +               break;
> +       default:
> +               dev_err(imx728->dev, "%i bit HDR not supported.", hdr_bits);
> +               break;
> +       }
> +
> +       ret = imx728_write(imx728, 0x9C60, hdr_norm_x0, 4);
> +       ret |= imx728_write(imx728, 0x9C6C, hdr_norm_x0, 4);
> +       ret |= imx728_write(imx728, 0x9C64, hdr_norm_x1, 4);
> +       ret |= imx728_write(imx728, 0x9C70, hdr_norm_x1, 4);
> +       ret |= imx728_write(imx728, 0x9C68, hdr_norm_y0, 2);
> +       ret |= imx728_write(imx728, 0x9C74, hdr_norm_y0, 2);
> +       ret |= imx728_write(imx728, 0x9C6A, hdr_norm_y1, 2);
> +       ret |= imx728_write(imx728, 0x9C76, hdr_norm_y1, 2);
> +
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Failed when setting HDR Normalization gains: %i", ret);
> +               return ret;
> +       }
> +
> +       for (i = 0; i < 16; i++) {
> +               ret = imx728_write(
> +                       imx728,
> +                       IMX728_REG_CTRL_POINT_X(i),
> +                       points->x, 4);
> +
> +               ret |= imx728_write(
> +                       imx728,
> +                       IMX728_REG_CTRL_POINT_Y(i),
> +                       points->y, 4);
> +
> +               if (ret < 0) {
> +                       dev_err(imx728->dev, "Failed to write control point %i", i);
> +                       return ret;
> +               }
> +
> +               if ((points+1)->x >= 0 && (points+1)->y >= 0)
> +                       points++;
> +       }
> +
> +       return imx728_hdr_fixed_brightness(imx728);
> +}
> +
> +static int imx728_configure(struct imx728 *imx728)
> +{
> +       int ret;
> +       bool hdr = imx728->ctrl.wdr->val;
> +       enum imx728_img_raw_mode img_out_mode;
> +       enum imx728_drive_mode mode_sel;
> +       enum imx728_aemode ae_mode;
> +
> +       if (hdr) {
> +               img_out_mode = IMX728_IMG_MODE_HDR;
> +               mode_sel = IMX728_MODE_3856x2176_40_4LANE_RAW10;
> +               ae_mode = IMX728_AEMODE_FULL_ME;
> +       } else {
> +               img_out_mode = IMX728_IMG_MODE_LINEAR;
> +               mode_sel = IMX728_MODE_3856x2176_40_4LANE_RAW10;
> +               ae_mode = IMX728_AEMODE_FULL_ME;

Unless my eyes deceive me, mode_sel and ae_mode are the same in both
modes. Why do they need to be conditional?

> +       }
> +
> +       ret = imx728_write(imx728, 0x98AC, ae_mode, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't set AE mode!");
> +               return ret;
> +       }
> +
> +       ret = imx728_write(imx728, 0xA248, IMX728_AWBMODE_FULL_MWB, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't set full manual white balance mode!");
> +               return ret;
> +       }
> +
> +       ret = imx728_update_bits(imx728, 0x1808, 0x1, 0x1, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't enable full manual white balance mode!");
> +               return ret;
> +       }
> +
> +       ret = imx728_write(imx728, 0x98E0, IMX728_FME_SHTVAL_UNIT_MICROSECONDS, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write exposure time unit to microseconds!");
> +               return ret;
> +       }
> +
> +       ret = imx728_write(imx728, 0x98E8, IMX728_FME_SHTVAL_UNIT_MICROSECONDS, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write exposure time unit to microseconds!");
> +               return ret;
> +       }
> +
> +       ret = imx728_write(imx728, 0x98F0, IMX728_FME_SHTVAL_UNIT_MICROSECONDS, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write exposure time unit to microseconds!");
> +               return ret;
> +       }
> +
> +       if (hdr) {

The xclr GPIO is optional, so is there a guaranteed register reset in
the big table to reset these HDR registers back to defaults?

> +               ret = imx728_hdr_configure(imx728, imx728_hdr_20bit, 20);
> +               if (ret < 0) {
> +                       dev_err(imx728->dev, "Couldn't configure sensor for HDR mode: %i", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       dev_info(imx728->dev, "Disabling metadata...");
> +       ret = imx728_write(imx728, 0x1708, 0x00, 1);
> +       ret |= imx728_write(imx728, 0x1709, 0x00, 1);
> +       ret |= imx728_write(imx728, 0x170A, 0x00, 1);
> +       ret |= imx728_write(imx728, 0x1B40, 0x00, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Error disabling metadata: %i", ret);
> +               return ret;
> +       }
> +
> +       ret = imx728_update_bits(imx728, 0x9728,
> +                         mode_sel,
> +                         0x7FFF,
> +                         2);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't write mode select.");
> +               return ret;
> +       }
> +
> +       ret = imx728_update_bits(imx728, 0xEC7E,
> +                         img_out_mode,
> +                         0x7,
> +                         1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't select image out mode.");
> +               return ret;
> +       }
> +
> +       ret = imx728_write(imx728, 0xEC12, 0x28, 2);
> +       ret |= imx728_write(imx728, 0xEC14, 0x0, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Error disabling OB output.");
> +               return ret;
> +       }
> +
> +       ret = imx728_write(imx728, 0x1761, 0x0, 1);
> +       if (ret < 0)
> +               dev_err(imx728->dev, "Error disabling skew calibration from sensor to SER");
> +
> +       switch (imx728->ctrl.pg_mode->val) {

Even if the test mode can't be changed whilst running, this could be
in imx728_set_ctrl as it'll be called by __v4l2_ctrl_handler_setup

> +       case 0:

Again xclr GPIO is optional. Are these reset to defaults?

> +               break;
> +       case 1:
> +               // Horizontal Color Bars
> +               ret = imx728_write(imx728, 0x1A2A, 8, 2);
> +               ret |= imx728_write(imx728, 0x1A30, 0, 3);
> +               ret |= imx728_write(imx728, 0x1A38, 1, 3);
> +               ret |= imx728_write(imx728, 0xB58F, 0x0, 1);
> +               ret |= imx728_write(imx728, 0xB6C5, 0x0, 1);
> +               break;
> +       case 2:
> +               // Vertical Color Bars
> +               ret = imx728_write(imx728, 0x1A2C, 16, 2);
> +               ret |= imx728_write(imx728, 0x1A30, 0, 3);
> +               ret |= imx728_write(imx728, 0x1A38, 1, 3);
> +               ret |= imx728_write(imx728, 0xB58F, 0x1, 1);
> +               ret |= imx728_write(imx728, 0xB6C5, 0x1, 1);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       // Assume that everything except 'disabled' requires pattern gen enable
> +       if (imx728->ctrl.pg_mode->val != 0) {
> +               ret |= imx728_write(imx728, 0xB58E, 0x1, 1);
> +               ret |= imx728_write(imx728, 0xB6C4, 0x1, 1);
> +
> +               if (ret < 0) {
> +                       dev_err(imx728->dev, "Failed to enable PG mode.");
> +                       return ret;
> +               }
> +       }
> +
> +       ret = imx728_update_bits(imx728, 0x9714,
> +                         IMX728_RAW_SEL_SP1H,
> +                         0x7,
> +                         1);
> +       ret |= imx728_update_bits(imx728, 0xB684,
> +                          IMX728_RAW_SEL_SP1H,
> +                          0x7,
> +                          1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Failed to set subpixel register");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx728_start_stream(struct imx728 *imx728)
> +{
> +       int ret;
> +
> +       ret = imx728_powerup_to_standby(imx728);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = imx728_write_table(imx728, imx728_3840x2160, ARRAY_SIZE(imx728_3840x2160));

You've enabled delayed suspend through pm_runtime, but you're always
sending the whole of this array. Is there an option for only resending
on actual power up to reduce the time to restart if the device hasn't
suspended?

> +       if (ret < 0)
> +               return ret;
> +
> +       msleep(100);
> +
> +       ret = imx728_configure(imx728);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = __v4l2_ctrl_handler_setup(imx728->subdev.ctrl_handler);
> +       if (ret < 0) {
> +               dev_err(imx728->dev,
> +                       "%s: failed to apply v4l2 ctrls: %d\n", __func__, ret);
> +               return ret;
> +       }
> +
> +       ret = imx728_write(imx728, 0x1B04, 0x5C, 1);
> +       if (ret < 0)
> +               return ret;
> +       ret = imx728_write(imx728, 0x1B04, 0xA3, 1);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STREAMING);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Could not transition to Streaming!");
> +               return ret;
> +       }
> +
> +       msleep(20);
> +
> +       return 0;
> +}
> +
> +static int imx728_stop_stream(struct imx728 *imx728)
> +{
> +       int ret;
> +
> +       ret = imx728_write(imx728, 0x1B04, 0xFF, 1);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Error sending stop stream command: %i", ret);
> +               return ret;
> +       }
> +
> +       imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STANDBY);
> +       if (ret < 0) {
> +               dev_err(imx728->dev, "Couldn't transition out of Streaming mode!");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx728_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +       struct imx728 *imx728 = to_imx728(sd);
> +       int ret;
> +
> +       mutex_lock(&imx728->lock);
> +       if (imx728->streaming == enable) {
> +               mutex_unlock(&imx728->lock);
> +               return 0;
> +       }
> +
> +       if (enable) {
> +               ret = pm_runtime_get_sync(imx728->dev);
> +               if (ret < 0) {
> +                       pm_runtime_put_noidle(imx728->dev);
> +                       goto err_unlock;
> +               }
> +
> +               ret = imx728_start_stream(imx728);
> +               if (ret < 0)
> +                       goto err_runtime_put;
> +       } else {
> +               ret = imx728_stop_stream(imx728);
> +               if (ret < 0)
> +                       goto err_runtime_put;
> +               pm_runtime_mark_last_busy(imx728->dev);
> +               pm_runtime_put_autosuspend(imx728->dev);
> +       }
> +
> +       imx728->streaming = enable;
> +
> +       __v4l2_ctrl_grab(imx728->ctrl.wdr, enable);
> +       __v4l2_ctrl_grab(imx728->ctrl.h_flip, enable);
> +       __v4l2_ctrl_grab(imx728->ctrl.v_flip, enable);
> +       __v4l2_ctrl_grab(imx728->ctrl.pg_mode, enable);
> +
> +       mutex_unlock(&imx728->lock);
> +       return 0;
> +
> +err_runtime_put:
> +       pm_runtime_put(imx728->dev);
> +
> +err_unlock:
> +       mutex_unlock(&imx728->lock);
> +       dev_err(imx728->dev,
> +               "%s: failed to setup streaming %d\n", __func__, ret);
> +       return ret;
> +}
> +
> +static const struct v4l2_subdev_core_ops imx728_core_ops = {
> +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops imx728_subdev_video_ops = {
> +       .s_stream = imx728_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx728_subdev_pad_ops = {
> +       .enum_mbus_code = imx728_enum_mbus_code,
> +       .enum_frame_size = imx728_enum_frame_sizes,
> +       .get_fmt = v4l2_subdev_get_fmt,
> +       .set_fmt = imx728_set_fmt,
> +       .get_frame_interval = imx728_get_frame_interval,
> +       .set_frame_interval = imx728_set_frame_interval,
> +       .set_routing = imx728_set_routing,
> +       .get_frame_desc = imx728_get_frame_desc,

Support for get_selection would be nice to reflect the array geometry,
assuming the information is in the datasheet. It's likely to be
mandatory for libcamera soon.

> +};
> +
> +static const struct v4l2_subdev_ops imx728_subdev_ops = {
> +       .core  = &imx728_core_ops,
> +       .video = &imx728_subdev_video_ops,
> +       .pad   = &imx728_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_ctrl_ops imx728_ctrl_ops = {
> +       .s_ctrl = imx728_set_ctrl,
> +};
> +
> +static int imx728_probe(struct i2c_client *client)
> +{
> +       struct imx728 *imx728;
> +       struct v4l2_subdev *sd;
> +       struct v4l2_ctrl_handler *ctrl_hdr;
> +       int ret;
> +
> +       imx728 = devm_kzalloc(&client->dev, sizeof(*imx728), GFP_KERNEL);
> +       if (!imx728)
> +               return -ENOMEM;
> +
> +       imx728->dev = &client->dev;
> +
> +       imx728->regmap = devm_regmap_init_i2c(client, &imx728_regmap_config);
> +       if (IS_ERR(imx728->regmap))
> +               return PTR_ERR(imx728->regmap);
> +
> +       imx728->xclr_gpio = devm_gpiod_get_optional(imx728->dev,
> +                                            "xclr", GPIOD_OUT_LOW);
> +       if (IS_ERR(imx728->xclr_gpio))
> +               return PTR_ERR(imx728->xclr_gpio);
> +
> +       imx728->clk = devm_clk_get(imx728->dev, "inck");
> +       if (IS_ERR(imx728->clk))
> +               return PTR_ERR(imx728->clk);
> +
> +       imx728->clk_rate = clk_get_rate(imx728->clk);
> +       dev_info(imx728->dev, "inck rate: %lu Hz\n", imx728->clk_rate);
> +
> +       if (imx728->clk_rate < 18000000 || imx728->clk_rate > 30000000)
> +               return -EINVAL;
> +
> +       ret = imx728_power_on(imx728);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = imx728_detect(imx728);
> +       if (ret < 0)
> +               return ret;
> +
> +       sd = &imx728->subdev;
> +       v4l2_i2c_subdev_init(sd, client, &imx728_subdev_ops);
> +
> +       sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +                    V4L2_SUBDEV_FL_HAS_EVENTS |
> +                    V4L2_SUBDEV_FL_STREAMS;
> +
> +       imx728->pad.flags = MEDIA_PAD_FL_SOURCE;
> +       sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +       ret = media_entity_pads_init(&sd->entity, 1, &imx728->pad);
> +       if (ret < 0) {
> +               dev_err(imx728->dev,
> +                       "%s: media entity init failed %d\n", __func__, ret);
> +               return ret;
> +       }
> +
> +       ctrl_hdr = &imx728->ctrl.handler;
> +       ret = v4l2_ctrl_handler_init(ctrl_hdr, 8);
> +       if (ret < 0) {
> +               dev_err(imx728->dev,
> +                       "%s: ctrl handler init failed: %d\n", __func__, ret);
> +               goto err_media_cleanup;
> +       }
> +
> +       mutex_init(&imx728->lock);
> +       imx728->ctrl.handler.lock = &imx728->lock;
> +       imx728->fps = IMX728_FRAMERATE_DEFAULT;
> +
> +       imx728->ctrl.exposure = v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_ops,
> +                                                 V4L2_CID_EXPOSURE, 0,
> +                                                 33000, 1,
> +                                                 IMX728_EXPOSURE_DEFAULT);

That looks like you're clipping the max exposure time based on 30fps,
and the units are usecs.
Units on V4L2_CID_EXPOSURE are undefined, and normally expected to be
lines for raw image sensors, but that then needs to know HBLANK and
PIXEL_RATE.
There is V4L2_CID_EXPOSURE_ABSOLUTE which has defined units of
100usecs, but I'm not sure if that is very useful in this case.

> +
> +       imx728->ctrl.again = v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_ops,
> +                                              V4L2_CID_ANALOGUE_GAIN, 0,
> +                                              102, 1,
> +                                              24);
> +
> +       imx728->ctrl.wdr = v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_ops,
> +                                            V4L2_CID_WIDE_DYNAMIC_RANGE,
> +                                            0, 1, 1, 1);
> +
> +       imx728->ctrl.h_flip = v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_ops,
> +                                               V4L2_CID_HFLIP, 0, 1, 1, 0);
> +
> +       imx728->ctrl.v_flip = v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_ops,
> +                                               V4L2_CID_VFLIP, 0, 1, 1, 0);

Other Sony sensors end up changing the Bayer order based on flips. I
just want to check that this isn't the case for this sensor, otherwise
you need to set the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag and report the
mbus code based on flips.

> +
> +       imx728->ctrl.pg_mode = v4l2_ctrl_new_std_menu_items(ctrl_hdr,
> +                                       &imx728_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +                                       ARRAY_SIZE(imx728_ctrl_pg_qmenu) - 1,
> +                                       0, 0, imx728_ctrl_pg_qmenu);
> +
> +       imx728->ctrl.pixel_rate = v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_ops,
> +                                            V4L2_CID_PIXEL_RATE,
> +                                            IMX728_PIXEL_RATE,
> +                                            IMX728_PIXEL_RATE, 1,
> +                                            IMX728_PIXEL_RATE);
> +
> +       imx728->ctrl.link_freq = v4l2_ctrl_new_int_menu(ctrl_hdr, &imx728_ctrl_ops,
> +                                                V4L2_CID_LINK_FREQ,
> +                                                ARRAY_SIZE(imx728_link_freq_menu) - 1, 0,
> +                                                imx728_link_freq_menu);
> +
> +       if (imx728->ctrl.link_freq)
> +               imx728->ctrl.link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       imx728->subdev.ctrl_handler = ctrl_hdr;
> +       if (imx728->ctrl.handler.error) {
> +               ret = imx728->ctrl.handler.error;
> +               dev_err(imx728->dev,
> +                       "%s: failed to add the ctrls: %d\n", __func__, ret);
> +               goto err_ctrl_free;
> +       }
> +
> +       pm_runtime_set_active(imx728->dev);
> +       pm_runtime_enable(imx728->dev);
> +       pm_runtime_set_autosuspend_delay(imx728->dev, IMX728_PM_IDLE_TIMEOUT);
> +       pm_runtime_use_autosuspend(imx728->dev);
> +       pm_runtime_get_noresume(imx728->dev);
> +
> +       ret = v4l2_subdev_init_finalize(sd);
> +       if (ret < 0)
> +               goto err_pm_disable;
> +
> +       ret = v4l2_async_register_subdev(sd);
> +       if (ret < 0) {
> +               dev_err(imx728->dev,
> +                       "%s: v4l2 subdev register failed %d\n", __func__, ret);
> +               goto err_subdev_cleanup;
> +       }
> +
> +       dev_info(imx728->dev, "imx728 probed\n");
> +       pm_runtime_mark_last_busy(imx728->dev);
> +       pm_runtime_put_autosuspend(imx728->dev);
> +       return 0;
> +
> +err_subdev_cleanup:
> +       v4l2_subdev_cleanup(&imx728->subdev);
> +
> +err_pm_disable:
> +       pm_runtime_dont_use_autosuspend(imx728->dev);
> +       pm_runtime_put_noidle(imx728->dev);
> +       pm_runtime_disable(imx728->dev);
> +
> +err_ctrl_free:
> +       v4l2_ctrl_handler_free(ctrl_hdr);
> +       mutex_destroy(&imx728->lock);
> +
> +err_media_cleanup:
> +       media_entity_cleanup(&imx728->subdev.entity);
> +
> +       return ret;
> +}
> +
> +static int __maybe_unused imx728_runtime_resume(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +       struct imx728 *imx728 = to_imx728(sd);
> +       int ret;
> +
> +       ret = imx728_power_on(imx728);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused imx728_runtime_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +       struct imx728 *imx728 = to_imx728(sd);
> +
> +       imx728_power_off(imx728);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused imx728_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +       struct imx728 *imx728 = to_imx728(sd);
> +       int ret;
> +
> +       if (imx728->streaming)
> +               imx728_stop_stream(imx728);
> +
> +       ret = pm_runtime_force_suspend(dev);
> +       if (ret < 0)
> +               dev_warn(dev, "%s: failed to suspend: %i\n", __func__, ret);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused imx728_resume(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +       struct imx728 *imx728 = to_imx728(sd);
> +       int ret;
> +
> +       ret = pm_runtime_force_resume(dev);
> +       if (ret < 0)
> +               dev_warn(dev, "%s: failed to resume: %i\n", __func__, ret);
> +
> +       if (imx728->streaming)
> +               ret = imx728_start_stream(imx728);

You're likely to get comment from Laurent on this one. He went through
and removed all the suspend/resume handlers as they should really be
handled by the CSI2 receiver driver, not the sensor driver.
Resuming streaming in a random order on system resume is unlikely to work.

> +
> +       if (ret < 0) {
> +               imx728_stop_stream(imx728);
> +               imx728->streaming = 0;
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void imx728_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +       struct imx728 *imx728 = to_imx728(sd);
> +
> +       v4l2_async_unregister_subdev(sd);
> +       v4l2_ctrl_handler_free(&imx728->ctrl.handler);
> +       v4l2_subdev_cleanup(&imx728->subdev);
> +       media_entity_cleanup(&sd->entity);
> +       mutex_destroy(&imx728->lock);
> +
> +       pm_runtime_disable(imx728->dev);
> +       pm_runtime_dont_use_autosuspend(imx728->dev);
> +       pm_runtime_set_suspended(imx728->dev);
> +}
> +
> +static const struct dev_pm_ops imx728_pm_ops = {
> +       SET_RUNTIME_PM_OPS(imx728_runtime_suspend,
> +                          imx728_runtime_resume, NULL)
> +       SET_SYSTEM_SLEEP_PM_OPS(imx728_suspend, imx728_resume)
> +};
> +
> +static const struct of_device_id imx728_dt_id[] = {
> +       { .compatible = "sony,imx728" },
> +       { /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, imx728_dt_id);
> +
> +static struct i2c_driver imx728_i2c_driver = {
> +       .driver = {
> +               .name = "imx728",
> +               .of_match_table = of_match_ptr(imx728_dt_id),
> +               .pm = &imx728_pm_ops,
> +       },
> +       .probe = imx728_probe,
> +       .remove = imx728_remove,
> +};
> +
> +module_i2c_driver(imx728_i2c_driver);
> +
> +MODULE_DESCRIPTION("Camera Sensor Driver for Sony IMX728");
> +MODULE_AUTHOR("Spencer Hill <shill@d3engineering.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/i2c/imx728.h b/drivers/media/i2c/imx728.h
> new file mode 100644
> index 000000000000..6f320214b780
> --- /dev/null
> +++ b/drivers/media/i2c/imx728.h
> @@ -0,0 +1,3458 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Sony IMX728 CMOS Image Sensor Driver
> + *
> + * Copyright (c) 2024 Define Design Deploy Corp
> + */
> +
> +#include <linux/types.h>
> +
> +#define IMX728_OUT_WIDTH               3840
> +#define IMX728_OUT_HEIGHT              2160

https://leopardimaging.com/wp-content/uploads/pdf/LI-IMX728-9295-xxxH-_Datasheet.pdf
lists IMX728 as 3857x2177 (strange to see odd numbers in a Bayer
sensor). Do you have definitive numbers for the array size?

Seeing as these defines are only used in imx728_framesizes, I'd stick
the values directly in the structure.

> +
> +#define IMX728_FRAMERATE_MAX           30
> +#define IMX728_FRAMERATE_DEFAULT       30
> +#define IMX728_FRAMERATE_MIN           10
> +
> +#define IMX728_PIXEL_RATE              225504000

225504000 / 3840 / 2160 = 27.18fps. How does that square with achieving 30fps?

> +#define IMX728_LINK_FREQ               800000000

1.6Gbit/s per lane feels high. I assume it has been checked.

> +
> +#define IMX728_EXPOSURE_DEFAULT                10000
> +
> +#define IMX728_PM_IDLE_TIMEOUT         1000
> +
> +
> +#define IMX728_REG_CTRL_POINT_X(i) (0xA198 + (i) * 8)
> +#define IMX728_REG_CTRL_POINT_Y(i) (IMX728_REG_CTRL_POINT_X(i) + 4)
> +
> +enum imx728_sensor_state {
> +       IMX728_SENSOR_STATE_SLEEP               = 0x02,
> +       IMX728_SENSOR_STATE_STANDBY             = 0x04,
> +       IMX728_SENSOR_STATE_STREAMING           = 0x10,
> +       IMX728_SENSOR_STATE_SAFE                = 0x20,
> +};
> +
> +
> +enum imx728_remap_mode_id {
> +       IMX728_REMAP_MODE_STANDBY = 0x00,
> +       IMX728_REMAP_MODE_STANDBY_PIXEL_SHADING_COMPENSATION = 0x01,
> +       IMX728_REMAP_MODE_STANDBY_SPOT_PIXEL_COMPENSATION = 0x02,
> +       IMX728_REMAP_MODE_STREAMING = 0x04,
> +       IMX728_REMAP_MODE_STREAMING_PIXEL_SHADING_COMPENSATION = 0x05,
> +       IMX728_REMAP_MODE_STREAMING_SPOT_PIXEL_COMPENSATION = 0x06,
> +       IMX728_REMAP_MODE_SLEEP = 0x20,
> +};
> +
> +enum imx728_drive_mode {
> +       IMX728_MODE_3856x2176_45_4LANE_RAW10 = 0x01,
> +       IMX728_MODE_3856x2176_45_4LANE_RAW12 = 0x02,
> +       IMX728_MODE_3856x2176_45_4LANE_RAW16 = 0x03,
> +       IMX728_MODE_3856x2176_45_4LANE_RAW20 = 0x04,
> +       IMX728_MODE_3856x2176_45_4LANE_RAW12_HDR = 0x05,
> +       IMX728_MODE_3856x2176_40_4LANE_RAW10 = 0x11,
> +       IMX728_MODE_3856x2176_40_4LANE_RAW12 = 0x12,
> +       IMX728_MODE_3856x2176_40_4LANE_RAW16 = 0x13,
> +       IMX728_MODE_3856x2176_40_4LANE_RAW20 = 0x14,
> +       IMX728_MODE_3856x2176_40_4LANE_RAW12_HDR = 0x16,
> +};
> +
> +enum imx728_awbmode {
> +       IMX728_AWBMODE_ATW = 0,
> +       IMX728_AWBMODE_ALL_PULL_IN = 1,
> +       IMX728_AWBMODE_USER_PRESET = 2,
> +       IMX728_AWBMODE_FULL_MWB = 3,
> +       IMX728_AWBMODE_HOLD = 4,
> +};
> +
> +enum imx728_img_raw_mode {
> +       IMX728_IMG_MODE_LINEAR = 0x0,
> +       IMX728_IMG_MODE_LI = 0x1,
> +       IMX728_IMG_MODE_HDR = 0x2,
> +       IMX728_IMG_MODE_LI_HDR = 0x3,
> +};
> +
> +enum imx728_aemode {
> +       IMX728_AEMODE_AE_AUTO  = 0,
> +       IMX728_AEMODE_AE_HOLD  = 1,
> +       IMX728_AEMODE_SCALE_ME = 2,
> +       IMX728_AEMODE_FULL_ME  = 3,
> +};
> +
> +enum imx728_fme_shtval_unit {
> +       IMX728_FME_SHTVAL_UNIT_LINES            = 1,
> +       IMX728_FME_SHTVAL_UNIT_MICROSECONDS     = 3,
> +       IMX728_FME_SHTVAL_UNIT_FRAMES           = 4,
> +};
> +
> +enum imx728_linear_raw_sel {
> +       IMX728_RAW_SEL_SP1H = 0x0,
> +       IMX728_RAW_SEL_SP1L = 0x1,
> +       IMX728_RAW_SEL_SP1EC = 0x2,
> +       IMX728_RAW_SEL_SP2 = 0x3,
> +       IMX728_RAW_SEL_SP1VS = 0x4
> +};
> +
> +enum imx728_binn_avg {
> +       IMX728_BINN_SIMPLE_AVG,
> +       IMX728_BINN_WEIGHTED_AVG,
> +};

Not used.

> +
> +struct imx728_ctrl {
> +       struct v4l2_ctrl_handler handler;
> +       struct v4l2_ctrl *wdr;
> +       struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *again;
> +       struct v4l2_ctrl *h_flip;
> +       struct v4l2_ctrl *v_flip;
> +       struct v4l2_ctrl *pg_mode;
> +       struct v4l2_ctrl *pixel_rate;
> +       struct v4l2_ctrl *link_freq;
> +};
> +
> +struct imx728_ctrl_point {
> +       int x, y;
> +};
> +
> +/*
> + * struct imx728 - imx728 device structure
> + * @dev: Device handle
> + * @clk: Pointer to imx728 clock
> + * @client: Pointer to I2C client
> + * @regmap: Pointer to regmap structure
> + * @xclr_gpio: Pointer to XCLR gpio
> + * @subdev: V4L2 subdevice structure
> + * @format: V4L2 media bus frame format structure
> + *             (width and height are in sync with the compose rect)
> + * @pad: Media pad structure
> + * @ctrl: imx728 control structure
> + * @clk_rate: Frequency of imx728 clock
> + * @lock: Mutex structure for V4L2 ctrl handler
> + * @streaming: Flag to store streaming on/off status
> + */
> +struct imx728 {
> +       struct device *dev;
> +
> +       struct clk *clk;
> +       struct i2c_client *client;
> +       struct regmap *regmap;
> +       struct gpio_desc *xclr_gpio;
> +
> +       struct v4l2_subdev subdev;
> +       struct v4l2_mbus_framefmt format;
> +       struct media_pad pad;
> +
> +       struct imx728_ctrl ctrl;
> +
> +       unsigned long clk_rate;
> +       u32 fps;
> +
> +       struct mutex lock;
> +       bool streaming;
> +};
> +
> +static const struct v4l2_area imx728_framesizes[] = {
> +       {
> +               .width = IMX728_OUT_WIDTH,
> +               .height = IMX728_OUT_HEIGHT,
> +       },
> +};
> +
> +static const u32 imx728_mbus_formats[] = {
> +       MEDIA_BUS_FMT_SRGGB10_1X10,
> +};
> +
> +static const s64 imx728_link_freq_menu[] = {
> +       IMX728_LINK_FREQ,
> +};
> +
> +static const struct regmap_config imx728_regmap_config = {
> +       .reg_bits = 16,
> +       .val_bits = 8,
> +};
> +
> +static const char *const imx728_ctrl_pg_qmenu[] = {
> +       "Disabled",
> +       "Horizontal Color Bars",
> +       "Vertical Color Bars",
> +};
> +
> +static struct imx728_ctrl_point imx728_hdr_20bit[] = {
> +       {0, 0},
> +       {1566 >> 4, 938},
> +       {105740 >> 4, 1863},
> +       {387380 >> 4, 2396},
> +       {3818601 >> 4, 3251},
> +       {16777215 >> 4, 4095},
> +       {-1, -1}
> +};
> +
> +static const struct reg_sequence imx728_3840x2160[] = {
> +       {0xFFFF, 0x00, 1000},
<snip>
This is one heck of a table at 3268 register writes.
Are they really all necessary, or are some setting registers to
default values, or duplicated elsewhere in the driver?

Thanks
  Dave

