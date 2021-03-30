Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E83A34E50F
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 12:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbhC3KF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 06:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbhC3KFY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 06:05:24 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA15C061764
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 03:05:22 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id o2so5894736plg.1
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tS1uhWIe/TEg11FeZtjuul/9EnB/YPwQB5kwRzF6Kkg=;
        b=BNIlFcHcQ56OWXrqMMS4DcWAQfSI3YSiUUW266M2va/uUY4Gh/0/fFMm9kWrNeo5bf
         rAJD6xswYN54xQIDiyUNEtY5o16h8jcRfqPMYVVVWOA+Ly2NjOdBgq+X5f8s5G2WgeLp
         Kw3KcOYoJktJ/8zM4W1XVmBy2bmFAOCgGuoUfsqrOwkjN9eZsqdsKD3cSSw8Y5J7FN7W
         ej1i1cfffC2H8eaLVzWj1zHmGFv5+EXMjCTAv2hx1wufA0abSTCJuHEQbJnZW4WYq6pB
         pBYa5ADeezBCb7GE/qUYENefL2SjOTPuMK2N2OOQlHZe+QThQPe7UMCCgy200llASUEI
         Na9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tS1uhWIe/TEg11FeZtjuul/9EnB/YPwQB5kwRzF6Kkg=;
        b=NzxPOci2SzuqD4uruJz8K6y53z2z9gIIikrRNnxsOx4aytQE4M5Sy+E7Q9iigYOg/H
         /y+K9kIK+ApzsdR4nQNzeYXk7mg8M0hM9eT2Fo3Q9RQn3o5bsMd4LfUfP/Fg2PvhrLPo
         ysoFFHH+xEB01ATVDdgwPuWidh8wwF5Yzjs/MsxNgoXPa5tRn7q4c8blRMRIG2M1bFGw
         xidUX0Tc5y/tPYpZrlOEJ2OW0nsRluurtnjZtHAOZPAitTs3Rtg1od0UJcUwsQ9Qhs0k
         Htc3khhHsLpbX06jQGTDqp83olknABRkTOBLhAqe2QFhMJFka2WcKuhETnxJqBHQMcQF
         0oMQ==
X-Gm-Message-State: AOAM533wY07ejcNkyJBxdt5uZ87uwDHwwfV/I3I20MuI0yCL+1+PqWaI
        oZDLTyuETMICN8kPM6H8jwZtAkJJHelhmsi44Uy0BA==
X-Google-Smtp-Source: ABdhPJwttdbQgWbQqKewGqf82CaKDeAXOp4eqCQsHTq++cvvYV+9J1PWyEEO3AJFEuacxioJYvp3w9Hf+/G4qKJlhG8=
X-Received: by 2002:a17:90a:4a8f:: with SMTP id f15mr3636664pjh.19.1617098721401;
 Tue, 30 Mar 2021 03:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com> <1615952569-4711-14-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1615952569-4711-14-git-send-email-victor.liu@nxp.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 30 Mar 2021 12:05:10 +0200
Message-ID: <CAG3jFystgcgm3PDx_1gTbOg0awnON-f6ihNWBbX8s-ck1Tp70A@mail.gmail.com>
Subject: Re: [PATCH v6 13/14] drm/bridge: imx: Add LDB support for i.MX8qm
To:     Liu Ying <victor.liu@nxp.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>, kishon@ti.com,
        Vinod Koul <vkoul@kernel.org>, lee.jones@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Liu,

checkpatch --strict lists some nits for this patch with those and the
below warning fixed, feel free to add my r-b.

On Wed, 17 Mar 2021 at 04:57, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds a drm bridge driver for i.MX8qm LVDS display bridge(LDB)
> which is officially named as pixel mapper.  The LDB has two channels.
> Each of them supports up to 30bpp parallel input color format and can
> map the input to VESA or JEIDA standards.  The two channels can be used
> simultaneously, either in dual mode or split mode.  In dual mode, the
> two channels output identical data.  In split mode, channel0 outputs
> odd pixels and channel1 outputs even pixels.  This patch supports the
> LDB single mode and split mode.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> Note that this patch depends on the patch 'phy: Add LVDS configuration options',
> which has already been sent with the following series to add Mixel combo PHY
> found in i.MX8qxp:
> https://www.spinics.net/lists/arm-kernel/msg879957.html
>
> v5->v6:
> * No change.
>
> v4->v5:
> * Link with the imx-ldb-helper object. (Robert)
> * Correspondingly, rename 'imx8qm-ldb.c' to 'imx8qm-ldb-drv.c'.
>
> v3->v4:
> * No change.
>
> v2->v3:
> * No change.
>
> v1->v2:
> * Drop unnecessary check for maximum available LDB channels.
> * Mention i.MX8qm LDB official name 'pixel mapper' in the bridge driver
>   and Kconfig help message.
>
>  drivers/gpu/drm/bridge/imx/Kconfig          |   9 +
>  drivers/gpu/drm/bridge/imx/Makefile         |   3 +
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c | 586 ++++++++++++++++++++++++++++
>  3 files changed, 598 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 94f8db4d..3a8683f 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -1,3 +1,12 @@
> +config DRM_IMX8QM_LDB
> +       tristate "Freescale i.MX8QM LVDS display bridge"
> +       depends on OF
> +       depends on COMMON_CLK
> +       select DRM_KMS_HELPER
> +       help
> +         Choose this to enable the internal LVDS Display Bridge(LDB) found in
> +         Freescale i.MX8qm processor.  Official name of LDB is pixel mapper.
> +
>  config DRM_IMX8QXP_LDB
>         tristate "Freescale i.MX8QXP LVDS display bridge"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index 96d5d1e..aa90ec8 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,3 +1,6 @@
> +imx8qm-ldb-objs := imx-ldb-helper.o imx8qm-ldb-drv.o
> +obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
> +
>  imx8qxp-ldb-objs := imx-ldb-helper.o imx8qxp-ldb-drv.o
>  obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
>
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
> new file mode 100644
> index 00000000..6c92636
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
> @@ -0,0 +1,586 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/phy/phy.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +
> +#include "imx-ldb-helper.h"
> +
> +#define  LDB_CH0_10BIT_EN              (1 << 22)
> +#define  LDB_CH1_10BIT_EN              (1 << 23)
> +#define  LDB_CH0_DATA_WIDTH_24BIT      (1 << 24)
> +#define  LDB_CH1_DATA_WIDTH_24BIT      (1 << 26)
> +#define  LDB_CH0_DATA_WIDTH_30BIT      (2 << 24)
> +#define  LDB_CH1_DATA_WIDTH_30BIT      (2 << 26)
> +
> +#define SS_CTRL                                0x20
> +#define  CH_HSYNC_M(id)                        BIT(0 + ((id) * 2))
> +#define  CH_VSYNC_M(id)                        BIT(1 + ((id) * 2))
> +#define  CH_PHSYNC(id)                 BIT(0 + ((id) * 2))
> +#define  CH_PVSYNC(id)                 BIT(1 + ((id) * 2))
> +
> +#define DRIVER_NAME                    "imx8qm-ldb"
> +
> +struct imx8qm_ldb_channel {
> +       struct ldb_channel base;
> +       struct phy *phy;
> +};
> +
> +struct imx8qm_ldb {
> +       struct ldb base;
> +       struct device *dev;
> +       struct imx8qm_ldb_channel channel[MAX_LDB_CHAN_NUM];
> +       struct clk *clk_pixel;
> +       struct clk *clk_bypass;
> +       int active_chno;
> +};
> +
> +static inline struct imx8qm_ldb_channel *
> +base_to_imx8qm_ldb_channel(struct ldb_channel *base)
> +{
> +       return container_of(base, struct imx8qm_ldb_channel, base);
> +}
> +
> +static inline struct imx8qm_ldb *base_to_imx8qm_ldb(struct ldb *base)
> +{
> +       return container_of(base, struct imx8qm_ldb, base);
> +}
> +
> +static void imx8qm_ldb_set_phy_cfg(struct imx8qm_ldb *imx8qm_ldb,
> +                                  unsigned long di_clk,
> +                                  bool is_split, bool is_slave,
> +                                  struct phy_configure_opts_lvds *phy_cfg)
> +{
> +       phy_cfg->bits_per_lane_and_dclk_cycle = 7;
> +       phy_cfg->lanes = 4;
> +       phy_cfg->differential_clk_rate = is_split ? di_clk / 2 : di_clk;
> +       phy_cfg->is_slave = is_slave;
> +}
> +
> +static int imx8qm_ldb_bridge_atomic_check(struct drm_bridge *bridge,
> +                                         struct drm_bridge_state *bridge_state,
> +                                         struct drm_crtc_state *crtc_state,
> +                                         struct drm_connector_state *conn_state)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +       struct imx8qm_ldb_channel *imx8qm_ldb_ch =
> +                                       base_to_imx8qm_ldb_channel(ldb_ch);
> +       struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
> +       struct drm_display_mode *adj = &crtc_state->adjusted_mode;
> +       unsigned long di_clk = adj->clock * 1000;
> +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> +       union phy_configure_opts opts = { };
> +       struct phy_configure_opts_lvds *phy_cfg = &opts.lvds;
> +       int ret;
> +
> +       ret = ldb_bridge_atomic_check_helper(bridge, bridge_state,
> +                                               crtc_state, conn_state);
> +       if (ret)
> +               return ret;
> +
> +       imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, false, phy_cfg);
> +       ret = phy_validate(imx8qm_ldb_ch->phy, PHY_MODE_LVDS, 0, &opts);
> +       if (ret < 0) {
> +               DRM_DEV_DEBUG_DRIVER(imx8qm_ldb->dev,
> +                                    "failed to validate PHY: %d\n", ret);
> +               return ret;
> +       }
> +
> +       if (is_split) {
> +               imx8qm_ldb_ch =
> +                       &imx8qm_ldb->channel[imx8qm_ldb->active_chno ^ 1];
> +               imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, true,
> +                                                                       phy_cfg);
> +               ret = phy_validate(imx8qm_ldb_ch->phy, PHY_MODE_LVDS, 0, &opts);
> +               if (ret < 0) {
> +                       DRM_DEV_DEBUG_DRIVER(imx8qm_ldb->dev,
> +                               "failed to validate slave PHY: %d\n", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       return ret;
> +}
> +
> +static void
> +imx8qm_ldb_bridge_mode_set(struct drm_bridge *bridge,
> +                          const struct drm_display_mode *mode,
> +                          const struct drm_display_mode *adjusted_mode)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +       struct imx8qm_ldb_channel *imx8qm_ldb_ch =
> +                                       base_to_imx8qm_ldb_channel(ldb_ch);
> +       struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
> +       struct device *dev = imx8qm_ldb->dev;
> +       unsigned long di_clk = adjusted_mode->clock * 1000;
> +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> +       union phy_configure_opts opts = { };
> +       struct phy_configure_opts_lvds *phy_cfg = &opts.lvds;
> +       u32 chno = ldb_ch->chno;
> +       int ret;
> +
> +       ret = pm_runtime_get_sync(dev);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(dev, "failed to get runtime PM sync: %d\n", ret);
> +
> +       ret = phy_init(imx8qm_ldb_ch->phy);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(dev, "failed to initialize PHY: %d\n", ret);
> +
> +       clk_set_rate(imx8qm_ldb->clk_bypass, di_clk);
> +       clk_set_rate(imx8qm_ldb->clk_pixel, di_clk);
> +
> +       imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, false, phy_cfg);
> +       ret = phy_configure(imx8qm_ldb_ch->phy, &opts);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(dev, "failed to configure PHY: %d\n", ret);
> +
> +       if (is_split) {
> +               imx8qm_ldb_ch =
> +                       &imx8qm_ldb->channel[imx8qm_ldb->active_chno ^ 1];
> +               imx8qm_ldb_set_phy_cfg(imx8qm_ldb, di_clk, is_split, true,
> +                                                                       phy_cfg);
> +               ret = phy_configure(imx8qm_ldb_ch->phy, &opts);
> +               if (ret < 0)
> +                       DRM_DEV_ERROR(dev, "failed to configure slave PHY: %d\n",
> +                                                                       ret);
> +       }
> +
> +       /* input VSYNC signal from pixel link is active low */
> +       if (ldb_ch->chno == 0 || is_split)
> +               ldb->ldb_ctrl |= LDB_DI0_VS_POL_ACT_LOW;
> +       if (ldb_ch->chno == 1 || is_split)
> +               ldb->ldb_ctrl |= LDB_DI1_VS_POL_ACT_LOW;
> +
> +       switch (ldb_ch->out_bus_format) {
> +       case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +               break;
> +       case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +       case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +               if (ldb_ch->chno == 0 || is_split)
> +                       ldb->ldb_ctrl |= LDB_CH0_DATA_WIDTH_24BIT;
> +               if (ldb_ch->chno == 1 || is_split)
> +                       ldb->ldb_ctrl |= LDB_CH1_DATA_WIDTH_24BIT;
> +               break;
> +       }
> +
> +       ldb_bridge_mode_set_helper(bridge, mode, adjusted_mode);
> +
> +       if (adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC)
> +               regmap_update_bits(ldb->regmap, SS_CTRL, CH_VSYNC_M(chno), 0);
> +       else if (adjusted_mode->flags & DRM_MODE_FLAG_PVSYNC)
> +               regmap_update_bits(ldb->regmap, SS_CTRL,
> +                                  CH_VSYNC_M(chno), CH_PVSYNC(chno));
> +
> +       if (adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC)
> +               regmap_update_bits(ldb->regmap, SS_CTRL, CH_HSYNC_M(chno), 0);
> +       else if (adjusted_mode->flags & DRM_MODE_FLAG_PHSYNC)
> +               regmap_update_bits(ldb->regmap, SS_CTRL,
> +                                  CH_HSYNC_M(chno), CH_PHSYNC(chno));
> +}
> +
> +static void
> +imx8qm_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
> +                               struct drm_bridge_state *old_bridge_state)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +       struct imx8qm_ldb_channel *imx8qm_ldb_ch =
> +                                       base_to_imx8qm_ldb_channel(ldb_ch);
> +       struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
> +       struct device *dev = imx8qm_ldb->dev;
> +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> +       int ret;
> +
> +       clk_prepare_enable(imx8qm_ldb->clk_pixel);
> +       clk_prepare_enable(imx8qm_ldb->clk_bypass);
> +
> +       /* both DI0 and DI1 connect with pixel link, so ok to use DI0 only */
> +       if (ldb_ch->chno == 0 || is_split) {
> +               ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
> +               ldb->ldb_ctrl |= LDB_CH0_MODE_EN_TO_DI0;
> +       }
> +       if (ldb_ch->chno == 1 || is_split) {
> +               ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
> +               ldb->ldb_ctrl |= LDB_CH1_MODE_EN_TO_DI0;
> +       }
> +
> +       if (is_split) {
> +               ret = phy_power_on(imx8qm_ldb->channel[0].phy);
> +               if (ret)
> +                       DRM_DEV_ERROR(dev,
> +                                     "failed to power on channel0 PHY: %d\n",
> +                                     ret);
> +
> +               ret = phy_power_on(imx8qm_ldb->channel[1].phy);
> +               if (ret)
> +                       DRM_DEV_ERROR(dev,
> +                                     "failed to power on channel1 PHY: %d\n",
> +                                     ret);
> +       } else {
> +               ret = phy_power_on(imx8qm_ldb_ch->phy);
> +               if (ret)
> +                       DRM_DEV_ERROR(dev, "failed to power on PHY: %d\n", ret);
> +       }
> +
> +       ldb_bridge_enable_helper(bridge);
> +}
> +
> +static void
> +imx8qm_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
> +                                struct drm_bridge_state *old_bridge_state)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +       struct imx8qm_ldb_channel *imx8qm_ldb_ch =
> +                                       base_to_imx8qm_ldb_channel(ldb_ch);
> +       struct imx8qm_ldb *imx8qm_ldb = base_to_imx8qm_ldb(ldb);
> +       struct device *dev = imx8qm_ldb->dev;
> +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> +       int ret;
> +
> +       ldb_bridge_disable_helper(bridge);
> +
> +       if (is_split) {
> +               ret = phy_power_off(imx8qm_ldb->channel[0].phy);
> +               if (ret)
> +                       DRM_DEV_ERROR(dev,
> +                                     "failed to power off channel0 PHY: %d\n",
> +                                     ret);
> +               ret = phy_power_off(imx8qm_ldb->channel[1].phy);
> +               if (ret)
> +                       DRM_DEV_ERROR(dev,
> +                                     "failed to power off channel1 PHY: %d\n",
> +                                     ret);
> +       } else {
> +               ret = phy_power_off(imx8qm_ldb_ch->phy);
> +               if (ret)
> +                       DRM_DEV_ERROR(dev, "failed to power off PHY: %d\n", ret);
> +       }
> +
> +       clk_disable_unprepare(imx8qm_ldb->clk_bypass);
> +       clk_disable_unprepare(imx8qm_ldb->clk_pixel);
> +
> +       ret = pm_runtime_put(dev);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
> +}
> +
> +static const u32 imx8qm_ldb_bus_output_fmts[] = {
> +       MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +       MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +       MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> +       MEDIA_BUS_FMT_FIXED,
> +};
> +
> +static bool imx8qm_ldb_bus_output_fmt_supported(u32 fmt)
> +{
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(imx8qm_ldb_bus_output_fmts); i++) {
> +               if (imx8qm_ldb_bus_output_fmts[i] == fmt)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
> +static u32 *
> +imx8qm_ldb_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +                                       struct drm_bridge_state *bridge_state,
> +                                       struct drm_crtc_state *crtc_state,
> +                                       struct drm_connector_state *conn_state,
> +                                       u32 output_fmt,
> +                                       unsigned int *num_input_fmts)
> +{
> +       struct drm_display_info *di;
> +       const struct drm_format_info *finfo;
> +       u32 *input_fmts;
> +
> +       if (!imx8qm_ldb_bus_output_fmt_supported(output_fmt))
> +               return NULL;
> +
> +       *num_input_fmts = 1;
> +
> +       input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +       if (!input_fmts)
> +               return NULL;
> +
> +       switch (output_fmt) {
> +       case MEDIA_BUS_FMT_FIXED:
> +               di = &conn_state->connector->display_info;
> +
> +               /*
> +                * Look at the first bus format to determine input format.
> +                * Default to MEDIA_BUS_FMT_RGB888_1X36_CPADLO, if no match.
> +                */
> +               if (di->num_bus_formats) {
> +                       finfo = drm_format_info(di->bus_formats[0]);
> +
> +                       input_fmts[0] = finfo->depth == 18 ?
> +                                       MEDIA_BUS_FMT_RGB666_1X36_CPADLO :
> +                                       MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
> +               } else {
> +                       input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
> +               }
> +               break;
> +       case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +               input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X36_CPADLO;
> +               break;
> +       case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +       case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +               input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
> +               break;
> +       default:
> +               kfree(input_fmts);
> +               input_fmts = NULL;
> +               break;
> +       }
> +
> +       return input_fmts;
> +}
> +
> +static u32 *
> +imx8qm_ldb_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +                                       struct drm_bridge_state *bridge_state,
> +                                       struct drm_crtc_state *crtc_state,
> +                                       struct drm_connector_state *conn_state,
> +                                       unsigned int *num_output_fmts)
> +{
> +       *num_output_fmts = ARRAY_SIZE(imx8qm_ldb_bus_output_fmts);
> +       return kmemdup(imx8qm_ldb_bus_output_fmts,
> +                       sizeof(imx8qm_ldb_bus_output_fmts), GFP_KERNEL);
> +}
> +
> +static enum drm_mode_status
> +imx8qm_ldb_bridge_mode_valid(struct drm_bridge *bridge,
> +                            const struct drm_display_info *info,
> +                            const struct drm_display_mode *mode)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       bool is_single = ldb_channel_is_single_link(ldb_ch);
> +
> +       if (mode->clock > 300000)
> +               return MODE_CLOCK_HIGH;
> +
> +       if (mode->clock > 150000 && is_single)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
> +static const struct drm_bridge_funcs imx8qm_ldb_bridge_funcs = {
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset           = drm_atomic_helper_bridge_reset,
> +       .mode_valid             = imx8qm_ldb_bridge_mode_valid,
> +       .attach                 = ldb_bridge_attach_helper,
> +       .atomic_check           = imx8qm_ldb_bridge_atomic_check,
> +       .mode_set               = imx8qm_ldb_bridge_mode_set,
> +       .atomic_enable          = imx8qm_ldb_bridge_atomic_enable,
> +       .atomic_disable         = imx8qm_ldb_bridge_atomic_disable,
> +       .atomic_get_input_bus_fmts =
> +                       imx8qm_ldb_bridge_atomic_get_input_bus_fmts,
> +       .atomic_get_output_bus_fmts =
> +                       imx8qm_ldb_bridge_atomic_get_output_bus_fmts,
> +};
> +
> +static int imx8qm_ldb_get_phy(struct imx8qm_ldb *imx8qm_ldb)
> +{
> +       struct imx8qm_ldb_channel *imx8qm_ldb_ch;
> +       struct ldb_channel *ldb_ch;
> +       struct device *dev = imx8qm_ldb->dev;
> +       int i, ret;
> +
> +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> +               imx8qm_ldb_ch = &imx8qm_ldb->channel[i];
> +               ldb_ch = &imx8qm_ldb_ch->base;
> +
> +               if (!ldb_ch->is_available)
> +                       continue;
> +
> +               imx8qm_ldb_ch->phy = devm_of_phy_get(dev, ldb_ch->np,
> +                                                               "lvds_phy");
> +               if (IS_ERR(imx8qm_ldb_ch->phy)) {
> +                       ret = PTR_ERR(imx8qm_ldb_ch->phy);
> +                       if (ret != -EPROBE_DEFER)
> +                               DRM_DEV_ERROR(dev,
> +                                       "failed to get channel%d PHY: %d\n",
> +                                                               i, ret);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx8qm_ldb_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct imx8qm_ldb *imx8qm_ldb;
> +       struct imx8qm_ldb_channel *imx8qm_ldb_ch;
> +       struct ldb *ldb;
> +       struct ldb_channel *ldb_ch;
> +       struct device_node *port1, *port2;
> +       int pixel_order;
> +       int ret, i;
> +
> +       imx8qm_ldb = devm_kzalloc(dev, sizeof(*imx8qm_ldb), GFP_KERNEL);
> +       if (!imx8qm_ldb)
> +               return -ENOMEM;
> +
> +       imx8qm_ldb->clk_pixel = devm_clk_get(dev, "pixel");
> +       if (IS_ERR(imx8qm_ldb->clk_pixel)) {
> +               ret = PTR_ERR(imx8qm_ldb->clk_pixel);
> +               if (ret != -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev,
> +                                     "failed to get pixel clock: %d\n", ret);
> +               return ret;
> +       }
> +
> +       imx8qm_ldb->clk_bypass = devm_clk_get(dev, "bypass");
> +       if (IS_ERR(imx8qm_ldb->clk_bypass)) {
> +               ret = PTR_ERR(imx8qm_ldb->clk_bypass);
> +               if (ret != -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev,
> +                                     "failed to get bypass clock: %d\n", ret);
> +               return ret;
> +       }
> +
> +       imx8qm_ldb->dev = dev;
> +
> +       ldb = &imx8qm_ldb->base;
> +       ldb->dev = dev;
> +       ldb->ctrl_reg = 0xe0;
> +
> +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++)
> +               ldb->channel[i] = &imx8qm_ldb->channel[i].base;
> +
> +       ret = ldb_init_helper(ldb);
> +       if (ret)
> +               return ret;
> +
> +       if (ldb->available_ch_cnt == 0) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "no available channel\n");
> +               return 0;
> +       }
> +
> +       if (ldb->available_ch_cnt == 2) {
> +               port1 = of_graph_get_port_by_id(ldb->channel[0]->np, 1);
> +               port2 = of_graph_get_port_by_id(ldb->channel[1]->np, 1);
> +               pixel_order =
> +                       drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> +               of_node_put(port1);
> +               of_node_put(port2);
> +
> +               if (pixel_order != DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS) {
> +                       DRM_DEV_ERROR(dev, "invalid dual link pixel order: %d\n",
> +                                                               pixel_order);
> +                       return -EINVAL;
> +               }
> +
> +               imx8qm_ldb->active_chno = 0;
> +               imx8qm_ldb_ch = &imx8qm_ldb->channel[0];
> +               ldb_ch = &imx8qm_ldb_ch->base;
> +               ldb_ch->link_type = pixel_order;
> +       } else {
> +               for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> +                       imx8qm_ldb_ch = &imx8qm_ldb->channel[i];
> +                       ldb_ch = &imx8qm_ldb_ch->base;
> +
> +                       if (ldb_ch->is_available) {
> +                               imx8qm_ldb->active_chno = ldb_ch->chno;
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       ret = imx8qm_ldb_get_phy(imx8qm_ldb);
> +       if (ret)
> +               return ret;
> +
> +       ret = ldb_find_next_bridge_helper(ldb);
> +       if (ret)
> +               return ret;
> +
> +       platform_set_drvdata(pdev, imx8qm_ldb);
> +       pm_runtime_enable(dev);
> +
> +       ldb_add_bridge_helper(ldb, &imx8qm_ldb_bridge_funcs);
> +
> +       return ret;
> +}
> +
> +static int imx8qm_ldb_remove(struct platform_device *pdev)
> +{
> +       struct imx8qm_ldb *imx8qm_ldb = platform_get_drvdata(pdev);
> +       struct ldb *ldb = &imx8qm_ldb->base;
> +
> +       ldb_remove_bridge_helper(ldb);
> +
> +       pm_runtime_disable(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused imx8qm_ldb_runtime_suspend(struct device *dev)
> +{
> +       return 0;
> +}
> +
> +static int __maybe_unused imx8qm_ldb_runtime_resume(struct device *dev)
> +{
> +       struct imx8qm_ldb *imx8qm_ldb = dev_get_drvdata(dev);
> +       struct ldb *ldb = &imx8qm_ldb->base;
> +
> +       /* disable LDB by resetting the control register to POR default */
> +       regmap_write(ldb->regmap, ldb->ctrl_reg, 0);
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops imx8qm_ldb_pm_ops = {
> +       SET_RUNTIME_PM_OPS(imx8qm_ldb_runtime_suspend,
> +                          imx8qm_ldb_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id imx8qm_ldb_dt_ids[] = {
> +       { .compatible = "fsl,imx8qm-ldb" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8qm_ldb_dt_ids);
> +
> +static struct platform_driver imx8qm_ldb_driver = {
> +       .probe  = imx8qm_ldb_probe,
> +       .remove = imx8qm_ldb_remove,
> +       .driver = {
> +               .pm = &imx8qm_ldb_pm_ops,
> +               .name = DRIVER_NAME,
> +               .of_match_table = imx8qm_ldb_dt_ids,
> +       },
> +};
> +module_platform_driver(imx8qm_ldb_driver);
> +
> +MODULE_DESCRIPTION("i.MX8QM LVDS Display Bridge(LDB)/Pixel Mapper bridge driver");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRIVER_NAME);
> --
> 2.7.4
>
