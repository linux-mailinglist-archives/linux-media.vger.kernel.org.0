Return-Path: <linux-media+bounces-23785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C79F7BC5
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 411E0162949
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 12:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E6F225411;
	Thu, 19 Dec 2024 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TuFrAAb1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C35422577A
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 12:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734612332; cv=none; b=nlAhlr8hDSUhFoYyxPcEE25kyXGbHje1e2WkJTTJnssrs7+XtXEaqy3zsvxmP1Ilg9hbF2Duhguiu+EL8+TQR+y3QLEkhwVgUHX/D9pa1oNWlDi+YDxkhXHq189Rdlrsf9nvlRE0euqFb5nz+MVgf55T45rR7qDoQ0ecYFH1PpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734612332; c=relaxed/simple;
	bh=UoTqUtvb77WTZhYbd9Al9kQtPWlPUHh98ytrCCaxZl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6YNCGqA0wNbPoztl5ihYnRoQ08YR7r56bzzc3MMhPnrnRzPjcaiEDE5svfhaRg5iGhrOy7ajlVBj0bETyWfSyWwqKEq+U+msGQqFgJPQW8FdMsT2pwOo2A3FL/rQfhLFX1Kx1s9FciSH6tx3Z1yQEqNEJ9uqUvBJcccTtxUdSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=TuFrAAb1; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e39885e1925so24482276.3
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 04:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734612329; x=1735217129; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7D1v+uWV1EY7RQo6P5/caRPa/nmdvq0wu/AmbRJR+XU=;
        b=TuFrAAb1iJpxWpeJUleV79fWG4bkPA5sN3wsInlkDG4GgJ2iwqap+m4EHYCfbPDAlF
         gp6v5c4DDE/35zKMm1aUEtRb2DVgEwRyakHfGc8dQTA5hPzXVKf8n3B/kdH4Iz3aX/bq
         rR7/vom61GtFlJtff+y7DaFuf3DNAri/bGcxRiYtA7/aztvjSFQtSJviwxVWUnJxkIz1
         PfKggde2JKNXiRTDJQxlgVoDvOxUF3B3csAE45iuLKIXnhOtp9j0XMavMjHLZp8XbRer
         GWAeRxsStDGqm+uaqiI9eK6oOdTvl26F6A4ctSxmhuCiMinDjjLw8AvSo8y5GUE1EHnv
         W0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734612329; x=1735217129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7D1v+uWV1EY7RQo6P5/caRPa/nmdvq0wu/AmbRJR+XU=;
        b=j6AiGligDxRgTbXDdG6hDSH95tYQadsKkPsI0yT3gr83UZV36G9/+enLILdZlyPybt
         Aklcr7w0Zr8862eaMuta6WwiG7+mahPwvKTUPygiZE1fRBJxrWOyeXF7l+lxZr7pTEF3
         1JdFwsIiBofuFSvtTJ7bqHQ1LGqr/PFls2ucu1jI/QYTBHld5QKAkga8TVH5iwdS+v//
         vhm4SV+SVHJh8DuVNUtmLcqP+3xkqH7w/aluUn8egVc4Dyrt/RucW9SdyFPJItuhs+IZ
         YH3ICljDq0D6ShaSeBE2EAewg/FhSs3BVEtRtoCVvZP7gkuN6LfNW4/ko6YBrScnmbLH
         i4KA==
X-Gm-Message-State: AOJu0YzuWd/oP9e2vH4aX23ft5DVw5mpmIF6zemEqLNHaYuT8PqKW2Po
	yFz870feHDsvWZayStTkDE0o8BFeAvg5gudXnkjWpGz0lQxOzMv5C+NB3U3QmYxPXXjSqvSbf7U
	1Furpl+CXNck1rCKuHJMStP2Dth1N+TjKSiYuAg==
X-Gm-Gg: ASbGncvsAwXlKLRWYeSzSqkjckaTPntLYRa6RYlyDMxf/sEjddF/JYjHwv3njRm986S
	gxj5ZuVoYwsen5xblrXT6gtfV9AqYODOxmOthlEm0+Jo2DaaJcDm810sqvDribJ1hfRpFTQ==
X-Google-Smtp-Source: AGHT+IGRIU9t1sW5Wt6lTsZbYdTzW9j8iC3+UQVSl6ZiClCa6wjLYwTvgs2bfCi4Dp6fiyWlGAjezayQS8Ezm+qFOEI=
X-Received: by 2002:a05:6902:118e:b0:e4c:b42e:14f5 with SMTP id
 3f1490d57ef6-e53621e1b6bmr2769806276.5.1734612328958; Thu, 19 Dec 2024
 04:45:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217215445.901459-10-sakari.ailus@linux.intel.com> <20241219110302.954411-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20241219110302.954411-1-sakari.ailus@linux.intel.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Thu, 19 Dec 2024 12:44:53 +0000
Message-ID: <CAEmqJPpRaPHbHosoj2jOUxJf7b0LHw9WTEupn4coAFAz0_rhgw@mail.gmail.com>
Subject: Re: [RESEND PATCH v8 9/9] media: v4l: Convert the users of
 v4l2_get_link_freq to call it on a pad
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Dan Scally <djrscally@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
	Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Benoit Parrot <bparrot@ti.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	"Duc-Long, Le" <duclong.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

Thank you for your patch.

On Thu, 19 Dec 2024 at 11:03, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Call v4l2_get_link_freq() on a pad, instead of a control handler. This way
> we can soon convert v4l2_get_link_freq() to be callable only on a pad and
> remove the compatibility code.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

The change to rp1-cfe looks reasonable:

Acked-by: Naushir Patuck <naush@raspberrypi.com>

> ---
> Included driver maintainers and reviewers.
>
> The full set is here
> <URL:https://lore.kernel.org/linux-media/20241217215445.901459-1-sakari.ailus@linux.intel.com/T/#t>.
>
>  drivers/media/i2c/st-mipid02.c                  |  5 +++--
>  drivers/media/i2c/tc358746.c                    |  4 +++-
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c        | 11 ++++++++---
>  drivers/media/platform/cadence/cdns-csi2rx.c    |  4 +++-
>  drivers/media/platform/nxp/imx-mipi-csis.c      |  5 +++--
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c   | 11 +++++++++--
>  .../media/platform/qcom/camss/camss-vfe-17x.c   |  8 +++++---
>  .../media/platform/qcom/camss/camss-vfe-gen1.c  |  8 +++++---
>  drivers/media/platform/qcom/camss/camss.c       | 17 +++++++----------
>  drivers/media/platform/qcom/camss/camss.h       |  2 +-
>  .../media/platform/raspberrypi/rp1-cfe/cfe.c    |  4 +++-
>  drivers/media/platform/st/stm32/stm32-csi.c     |  4 +++-
>  drivers/media/platform/ti/cal/cal-camerarx.c    |  3 ++-
>  drivers/media/platform/ti/cal/cal.c             |  4 +++-
>  drivers/media/platform/ti/cal/cal.h             |  1 +
>  15 files changed, 59 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> index f08db3cfe076..f4568e87f018 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -301,8 +301,9 @@ static int mipid02_detect(struct mipid02_dev *bridge)
>  static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
>                                            struct v4l2_mbus_framefmt *fmt)
>  {
> +       struct media_pad *remote =
> +               &bridge->s_subdev->entity.pads[bridge->s_subdev_pad_id];
>         struct i2c_client *client = bridge->i2c_client;
> -       struct v4l2_subdev *subdev = bridge->s_subdev;
>         struct v4l2_fwnode_endpoint *ep = &bridge->rx;
>         u32 bpp = bpp_from_code(fmt->code);
>         /*
> @@ -312,7 +313,7 @@ static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
>         u64 ui_4 = 2000000000;
>         s64 link_freq;
>
> -       link_freq = v4l2_get_link_freq(subdev->ctrl_handler, bpp,
> +       link_freq = v4l2_get_link_freq(remote, bpp,
>                                        2 * ep->bus.mipi_csi2.num_data_lanes);
>         if (link_freq < 0) {
>                 dev_err(&client->dev, "Failed to get link frequency");
> diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
> index 389582420ba7..31586f8e4be4 100644
> --- a/drivers/media/i2c/tc358746.c
> +++ b/drivers/media/i2c/tc358746.c
> @@ -896,6 +896,7 @@ tc358746_link_validate(struct v4l2_subdev *sd, struct media_link *link,
>         const struct tc358746_format *fmt;
>         unsigned int fifo_sz, tmp, n;
>         struct v4l2_subdev *source;
> +       struct media_pad *src_pad;
>         s64 source_link_freq;
>         int err;
>
> @@ -910,7 +911,8 @@ tc358746_link_validate(struct v4l2_subdev *sd, struct media_link *link,
>         fmt = tc358746_get_format_by_code(TC358746_SINK, mbusfmt->code);
>
>         source = media_entity_to_v4l2_subdev(link->source->entity);
> -       source_link_freq = v4l2_get_link_freq(source->ctrl_handler, 0, 0);
> +       src_pad = &source->entity.pads[source_fmt->pad];
> +       source_link_freq = v4l2_get_link_freq(src_pad, 0, 0);
>         if (source_link_freq <= 0) {
>                 dev_err(tc358746->sd.dev,
>                         "Failed to query or invalid source link frequency\n");
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 4e98f432ed55..7731eb70fc8e 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -309,12 +309,17 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
>                                  unsigned int bpp, unsigned int lanes)
>  {
>         struct device *dev = &cio2->pci_dev->dev;
> +       struct media_pad *src_pad;
>         s64 freq;
>
> -       if (!q->sensor)
> -               return -ENODEV;
> +       src_pad = media_entity_remote_source_pad_unique(&q->subdev.entity);
> +       if (IS_ERR(src_pad)) {
> +               dev_err(dev, "can't get source pad of %s (%ld)\n",
> +                       q->subdev.name, PTR_ERR(src_pad));
> +               return PTR_ERR(src_pad);
> +       }
>
> -       freq = v4l2_get_link_freq(q->sensor->ctrl_handler, bpp, lanes * 2);
> +       freq = v4l2_get_link_freq(src_pad, bpp, lanes * 2);
>         if (freq < 0) {
>                 dev_err(dev, "error %lld, invalid link_freq\n", freq);
>                 return freq;
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 4d64df829e75..cebcae196eec 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -164,6 +164,8 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>
>  static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  {
> +       struct media_pad *src_pad =
> +               &csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
>         union phy_configure_opts opts = { };
>         struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
>         struct v4l2_subdev_format sd_fmt = {
> @@ -181,7 +183,7 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>
>         fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
>
> -       link_freq = v4l2_get_link_freq(csi2rx->source_subdev->ctrl_handler,
> +       link_freq = v4l2_get_link_freq(src_pad,
>                                        fmt->bpp, 2 * csi2rx->num_lanes);
>         if (link_freq < 0)
>                 return link_freq;
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 29523bb84d95..d060eadebc7a 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -597,12 +597,13 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
>  static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>                                       const struct csis_pix_format *csis_fmt)
>  {
> +       struct media_pad *src_pad =
> +               &csis->source.sd->entity.pads[csis->source.pad->index];
>         s64 link_freq;
>         u32 lane_rate;
>
>         /* Calculate the line rate from the pixel rate. */
> -       link_freq = v4l2_get_link_freq(csis->source.sd->ctrl_handler,
> -                                      csis_fmt->width,
> +       link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
>                                        csis->bus.num_data_lanes * 2);
>         if (link_freq < 0) {
>                 dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 1f2657cf6e82..a8bcf60e2f37 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -287,6 +287,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
>                                           struct v4l2_subdev_state *sd_state,
>                                           u32 *hs_settle)
>  {
> +       struct media_pad *src_pad;
>         s64 link_freq;
>         u32 lane_rate;
>         unsigned long esc_clk_rate;
> @@ -294,13 +295,19 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
>         const struct v4l2_mbus_framefmt *fmt;
>         const struct csi2_pix_format *csi2_fmt;
>
> +       src_pad = media_entity_remote_source_pad_unique(&sd_state->sd->entity);
> +       if (IS_ERR(src_pad)) {
> +               dev_err(state->dev, "can't get source pad of %s (%ld)\n",
> +                       sd_state->sd->name, PTR_ERR(src_pad));
> +               return PTR_ERR(src_pad);
> +       }
> +
>         /* Calculate the line rate from the pixel rate. */
>
>         fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SINK);
>         csi2_fmt = find_csi2_format(fmt->code);
>
> -       link_freq = v4l2_get_link_freq(state->src_sd->ctrl_handler,
> -                                      csi2_fmt->width,
> +       link_freq = v4l2_get_link_freq(src_pad, csi2_fmt->width,
>                                        state->bus.num_data_lanes * 2);
>         if (link_freq < 0) {
>                 dev_err(state->dev, "Unable to obtain link frequency: %d\n",
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> index 380c99321030..cc93f79179dd 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -443,16 +443,18 @@ static int vfe_enable_output(struct vfe_line *line)
>         struct vfe_device *vfe = to_vfe(line);
>         struct vfe_output *output = &line->output;
>         const struct vfe_hw_ops *ops = vfe->res->hw_ops;
> -       struct media_entity *sensor;
> +       struct media_pad *sensor;
>         unsigned long flags;
>         unsigned int frame_skip = 0;
>         unsigned int i;
>
>         sensor = camss_find_sensor(&line->subdev.entity);
>         if (sensor) {
> -               struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(sensor);
> +               struct v4l2_subdev *subdev =
> +                       media_entity_to_v4l2_subdev(sensor->entity);
>
> -               v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
> +               v4l2_subdev_call(subdev, sensor, g_skip_frames,
> +                                &frame_skip);
>                 /* Max frame skip is 29 frames */
>                 if (frame_skip > VFE_FRAME_DROP_VAL - 1)
>                         frame_skip = VFE_FRAME_DROP_VAL - 1;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> index eb33c03df27e..1970f7aa6d4d 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> @@ -170,7 +170,7 @@ static int vfe_enable_output(struct vfe_line *line)
>         struct vfe_device *vfe = to_vfe(line);
>         struct vfe_output *output = &line->output;
>         const struct vfe_hw_ops *ops = vfe->res->hw_ops;
> -       struct media_entity *sensor;
> +       struct media_pad *sensor;
>         unsigned long flags;
>         unsigned int frame_skip = 0;
>         unsigned int i;
> @@ -182,9 +182,11 @@ static int vfe_enable_output(struct vfe_line *line)
>
>         sensor = camss_find_sensor(&line->subdev.entity);
>         if (sensor) {
> -               struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(sensor);
> +               struct v4l2_subdev *subdev =
> +                       media_entity_to_v4l2_subdev(sensor->entity);
>
> -               v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
> +               v4l2_subdev_call(subdev, sensor, g_skip_frames,
> +                                &frame_skip);
>                 /* Max frame skip is 29 frames */
>                 if (frame_skip > VFE_FRAME_DROP_VAL - 1)
>                         frame_skip = VFE_FRAME_DROP_VAL - 1;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 004a74f6b2f6..e86de4b59723 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1996,12 +1996,12 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock)
>  }
>
>  /*
> - * camss_find_sensor - Find a linked media entity which represents a sensor
> + * camss_find_sensor - Find the media pad via which the sensor is linked
>   * @entity: Media entity to start searching from
>   *
>   * Return a pointer to sensor media entity or NULL if not found
>   */
> -struct media_entity *camss_find_sensor(struct media_entity *entity)
> +struct media_pad *camss_find_sensor(struct media_entity *entity)
>  {
>         struct media_pad *pad;
>
> @@ -2017,7 +2017,7 @@ struct media_entity *camss_find_sensor(struct media_entity *entity)
>                 entity = pad->entity;
>
>                 if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
> -                       return entity;
> +                       return pad;
>         }
>  }
>
> @@ -2032,16 +2032,13 @@ struct media_entity *camss_find_sensor(struct media_entity *entity)
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>                         unsigned int lanes)
>  {
> -       struct media_entity *sensor;
> -       struct v4l2_subdev *subdev;
> +       struct media_pad *sensor;
>
>         sensor = camss_find_sensor(entity);
>         if (!sensor)
>                 return -ENODEV;
>
> -       subdev = media_entity_to_v4l2_subdev(sensor);
> -
> -       return v4l2_get_link_freq(subdev->ctrl_handler, bpp, 2 * lanes);
> +       return v4l2_get_link_freq(sensor, bpp, 2 * lanes);
>  }
>
>  /*
> @@ -2053,7 +2050,7 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>   */
>  int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
>  {
> -       struct media_entity *sensor;
> +       struct media_pad *sensor;
>         struct v4l2_subdev *subdev;
>         struct v4l2_ctrl *ctrl;
>
> @@ -2061,7 +2058,7 @@ int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
>         if (!sensor)
>                 return -ENODEV;
>
> -       subdev = media_entity_to_v4l2_subdev(sensor);
> +       subdev = media_entity_to_v4l2_subdev(sensor->entity);
>
>         ctrl = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
>
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 9a046eea334f..6da7131c0aaa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -153,7 +153,7 @@ void camss_add_clock_margin(u64 *rate);
>  int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>                         struct device *dev);
>  void camss_disable_clocks(int nclocks, struct camss_clock *clock);
> -struct media_entity *camss_find_sensor(struct media_entity *entity);
> +struct media_pad *camss_find_sensor(struct media_entity *entity);
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>                         unsigned int lanes);
>  int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 12660087b12f..ed3d18917f2d 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -1102,6 +1102,8 @@ static void cfe_buffer_queue(struct vb2_buffer *vb)
>
>  static s64 cfe_get_source_link_freq(struct cfe_device *cfe)
>  {
> +       struct media_pad *src_pad =
> +               &cfe->source_sd->entity.pads[cfe->source_pad];
>         struct v4l2_subdev_state *state;
>         s64 link_freq;
>         u32 bpp;
> @@ -1136,7 +1138,7 @@ static s64 cfe_get_source_link_freq(struct cfe_device *cfe)
>                 bpp = 0;
>         }
>
> -       link_freq = v4l2_get_link_freq(cfe->source_sd->ctrl_handler, bpp,
> +       link_freq = v4l2_get_link_freq(src_pad, bpp,
>                                        2 * cfe->csi2.dphy.active_lanes);
>         if (link_freq < 0)
>                 cfe_err(cfe, "failed to get link freq for subdev '%s'\n",
> diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
> index 48941aae8c9b..b25afeee4f24 100644
> --- a/drivers/media/platform/st/stm32/stm32-csi.c
> +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> @@ -444,6 +444,8 @@ static void stm32_csi_phy_reg_write(struct stm32_csi_dev *csidev,
>  static int stm32_csi_start(struct stm32_csi_dev *csidev,
>                            struct v4l2_subdev_state *state)
>  {
> +       struct media_pad *src_pad =
> +               &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
>         const struct stm32_csi_mbps_phy_reg *phy_regs;
>         struct v4l2_mbus_framefmt *sink_fmt;
>         const struct stm32_csi_fmts *fmt;
> @@ -465,7 +467,7 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
>         if (!csidev->s_subdev)
>                 return -EIO;
>
> -       link_freq = v4l2_get_link_freq(csidev->s_subdev->ctrl_handler,
> +       link_freq = v4l2_get_link_freq(src_pad,
>                                        fmt->bpp, 2 * csidev->num_lanes);
>         if (link_freq < 0)
>                 return link_freq;
> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> index 42dfe08b765f..9cc875665695 100644
> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> @@ -65,7 +65,8 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
>
>         bpp = fmtinfo->bpp;
>
> -       freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
> +       freq = v4l2_get_link_freq(&phy->source->entity.pads[phy->source_pad],
> +                                 bpp, 2 * num_lanes);
>         if (freq < 0) {
>                 phy_err(phy, "failed to get link freq for subdev '%s'\n",
>                         phy->source->name);
> diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
> index 4bd2092e0255..6cb3e5f49686 100644
> --- a/drivers/media/platform/ti/cal/cal.c
> +++ b/drivers/media/platform/ti/cal/cal.c
> @@ -798,7 +798,6 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
>                 return 0;
>         }
>
> -       phy->source = subdev;
>         phy_dbg(1, phy, "Using source %s for capture\n", subdev->name);
>
>         pad = media_entity_get_fwnode_pad(&subdev->entity,
> @@ -820,6 +819,9 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
>                 return ret;
>         }
>
> +       phy->source = subdev;
> +       phy->source_pad = pad;
> +
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/ti/cal/cal.h b/drivers/media/platform/ti/cal/cal.h
> index 0856297adc0b..72a246a64d9e 100644
> --- a/drivers/media/platform/ti/cal/cal.h
> +++ b/drivers/media/platform/ti/cal/cal.h
> @@ -174,6 +174,7 @@ struct cal_camerarx {
>         struct device_node      *source_ep_node;
>         struct device_node      *source_node;
>         struct v4l2_subdev      *source;
> +       unsigned int            source_pad;
>
>         struct v4l2_subdev      subdev;
>         struct media_pad        pads[CAL_CAMERARX_NUM_PADS];
> --
> 2.39.5
>

