Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2278134E4DD
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 11:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbhC3JzL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 05:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhC3Jyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 05:54:52 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C75C061764
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 02:54:52 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 11so11774792pfn.9
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uKnmfRJzGmpHij9OjXp/+pldlJw2MpuaAC/mHxvBXyU=;
        b=i6PaUXVNLfM6UzGmBZKH2kkMx0+1/axJCQK4vlMup8H9ZuhKFBQwfxb+H3KOqIAuJ9
         hLBxR9IveT7Ig6P/XJl1dVZEdbIuR15r514bOEac5cDwDp/wOHfobMJJ2PfbohvkMoeN
         pO0fnHBJkwXFxzvbczCjNg5zEoBotkiuN1r0qNVGN/e1J/bLcn3zwvC1JGdIZCbBewnP
         8Hnp6EbUUepuzugzjABIiV0lVd9OGrJ6zHeJvorQPt7Hj1+Z5WUcFYSQ8w+pS4YN5eK0
         TAkSgDmJxo6JtX+Zr7v4W9BROyEenUIH5A9mWlJliVaS+EtVIbFhzf9sbAaDPl98R3YQ
         Jv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uKnmfRJzGmpHij9OjXp/+pldlJw2MpuaAC/mHxvBXyU=;
        b=aQaaqqy6Q2oD0QUgsUexnLXzgFKeq8m9f8MNJmMZQfTUgMYu6DLkeAb+HJCFThTWbG
         NPBtcQHpbOrmY2/p9iq0dSIKiSQqAECFX892KlSGD4yka5pajjq1omStIRcxXXbpc8bW
         OStM/E9CWGtSi8kNd+oUQyB+lRZbBNleCxJQqz/PqSFANCwsZEkgeZwaYYRV/wOmpj5Z
         70/w7Xmmy1ARZyFRnVW/6ou104D5O/KIGvFWKojh044X4c+Rs86Dc4Bj3ZXVAq4kx8qf
         3xQFKk9tcqpYRIbBQ3WcWX1S1qku1jR3XuHhwLpTCjPedyryr3M42NLXbr3QYWarJv7h
         EF/w==
X-Gm-Message-State: AOAM532cmdDHnqDjbbQmNKDEBng6DrBVhp+9GDYTWYnecaAACtNPxDtZ
        WELcvPC59iD+igT4HWj4P+FgEexGlcwdoPhNwzO0vA==
X-Google-Smtp-Source: ABdhPJy+sF0AFhkeUUE71yZ5Vv/0O2C3KdJkp9j8lrAei/FtGJI84s6ef0YWQ8zy0qb/KqnBI1efcwu75mP8vV2xkZE=
X-Received: by 2002:a65:5c42:: with SMTP id v2mr28258073pgr.339.1617098091252;
 Tue, 30 Mar 2021 02:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com> <1615952569-4711-13-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1615952569-4711-13-git-send-email-victor.liu@nxp.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 30 Mar 2021 11:54:40 +0200
Message-ID: <CAG3jFytpciiAGKnUyb6H-GoLYks9RRxHm3cRaH_PN_zhxZDUjQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/14] drm/bridge: imx: Add LDB support for i.MX8qxp
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

checkpatch --strict lists some nit and a warning. With those fixed
feel free to add my r-b.

On Wed, 17 Mar 2021 at 04:57, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds a drm bridge driver for i.MX8qxp LVDS display bridge(LDB)
> which is officially named as pixel mapper.  The LDB has two channels.
> Each of them supports up to 24bpp parallel input color format and can map
> the input to VESA or JEIDA standards.  The two channels cannot be used
> simultaneously, that is to say, the user should pick one of them to use.
> Two LDB channels from two LDB instances can work together in LDB split
> mode to support a dual link LVDS display.  The channel indexes have to be
> different.  Channel0 outputs odd pixels and channel1 outputs even pixels.
> This patch supports the LDB single mode and split mode.
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
> * Correspondingly, rename 'imx8qxp-ldb.c' to 'imx8qxp-ldb-drv.c'.
>
> v3->v4:
> * No change.
>
> v2->v3:
> * No change.
>
> v1->v2:
> * Drop unnecessary DT validation.
> * Use of_graph_get_endpoint_by_regs() and of_graph_get_remote_endpoint() to
>   get the input remote endpoint in imx8qxp_ldb_set_di_id().
> * Avoid using companion_port OF node after putting it in
>   imx8qxp_ldb_parse_dt_companion().
> * Mention i.MX8qxp LDB official name 'pixel mapper' in the bridge driver
>   and Kconfig help message.
>
>  drivers/gpu/drm/bridge/imx/Kconfig           |   9 +
>  drivers/gpu/drm/bridge/imx/Makefile          |   3 +
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c | 720 +++++++++++++++++++++++++++
>  3 files changed, 732 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 1ea1ce7..94f8db4d 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -1,3 +1,12 @@
> +config DRM_IMX8QXP_LDB
> +       tristate "Freescale i.MX8QXP LVDS display bridge"
> +       depends on OF
> +       depends on COMMON_CLK
> +       select DRM_KMS_HELPER
> +       help
> +         Choose this to enable the internal LVDS Display Bridge(LDB) found in
> +         Freescale i.MX8qxp processor.  Official name of LDB is pixel mapper.
> +
>  config DRM_IMX8QXP_PIXEL_COMBINER
>         tristate "Freescale i.MX8QM/QXP pixel combiner"
>         depends on OF
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index e74dd64..96d5d1e 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,3 +1,6 @@
> +imx8qxp-ldb-objs := imx-ldb-helper.o imx8qxp-ldb-drv.o
> +obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
> +
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
> new file mode 100644
> index 00000000..d7f59c1
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
> @@ -0,0 +1,720 @@
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
> +#define  LDB_CH_SEL            (1 << 28)
> +
> +#define SS_CTRL                        0x20
> +#define  CH_HSYNC_M(id)                BIT(0 + ((id) * 2))
> +#define  CH_VSYNC_M(id)                BIT(1 + ((id) * 2))
> +#define  CH_PHSYNC(id)         BIT(0 + ((id) * 2))
> +#define  CH_PVSYNC(id)         BIT(1 + ((id) * 2))
> +
> +#define DRIVER_NAME            "imx8qxp-ldb"
> +
> +struct imx8qxp_ldb_channel {
> +       struct ldb_channel base;
> +       struct phy *phy;
> +       unsigned int di_id;
> +};
> +
> +struct imx8qxp_ldb {
> +       struct ldb base;
> +       struct device *dev;
> +       struct imx8qxp_ldb_channel channel[MAX_LDB_CHAN_NUM];
> +       struct clk *clk_pixel;
> +       struct clk *clk_bypass;
> +       struct drm_bridge *companion;
> +       int active_chno;
> +};
> +
> +static inline struct imx8qxp_ldb_channel *
> +base_to_imx8qxp_ldb_channel(struct ldb_channel *base)
> +{
> +       return container_of(base, struct imx8qxp_ldb_channel, base);
> +}
> +
> +static inline struct imx8qxp_ldb *base_to_imx8qxp_ldb(struct ldb *base)
> +{
> +       return container_of(base, struct imx8qxp_ldb, base);
> +}
> +
> +static void imx8qxp_ldb_set_phy_cfg(struct imx8qxp_ldb *imx8qxp_ldb,
> +                                   unsigned long di_clk, bool is_split,
> +                                   struct phy_configure_opts_lvds *phy_cfg)
> +{
> +       phy_cfg->bits_per_lane_and_dclk_cycle = 7;
> +       phy_cfg->lanes = 4;
> +
> +       if (is_split) {
> +               phy_cfg->differential_clk_rate = di_clk / 2;
> +               phy_cfg->is_slave = !imx8qxp_ldb->companion;
> +       } else {
> +               phy_cfg->differential_clk_rate = di_clk;
> +               phy_cfg->is_slave = false;
> +       }
> +}
> +
> +static int imx8qxp_ldb_bridge_atomic_check(struct drm_bridge *bridge,
> +                                  struct drm_bridge_state *bridge_state,
> +                                  struct drm_crtc_state *crtc_state,
> +                                  struct drm_connector_state *conn_state)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +       struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +                                       base_to_imx8qxp_ldb_channel(ldb_ch);
> +       struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
> +       struct drm_bridge *companion = imx8qxp_ldb->companion;
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
> +       imx8qxp_ldb_set_phy_cfg(imx8qxp_ldb, di_clk, is_split, phy_cfg);
> +       ret = phy_validate(imx8qxp_ldb_ch->phy, PHY_MODE_LVDS, 0, &opts);
> +       if (ret < 0) {
> +               DRM_DEV_DEBUG_DRIVER(imx8qxp_ldb->dev,
> +                                    "failed to validate PHY: %d\n", ret);
> +               return ret;
> +       }
> +
> +       if (is_split && companion) {
> +               ret = companion->funcs->atomic_check(companion,
> +                                       bridge_state, crtc_state, conn_state);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return ret;
> +}
> +
> +static void
> +imx8qxp_ldb_bridge_mode_set(struct drm_bridge *bridge,
> +                           const struct drm_display_mode *mode,
> +                           const struct drm_display_mode *adjusted_mode)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb_channel *companion_ldb_ch;
> +       struct ldb *ldb = ldb_ch->ldb;
> +       struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +                                       base_to_imx8qxp_ldb_channel(ldb_ch);
> +       struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
> +       struct drm_bridge *companion = imx8qxp_ldb->companion;
> +       struct device *dev = imx8qxp_ldb->dev;
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
> +       ret = phy_init(imx8qxp_ldb_ch->phy);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(dev, "failed to initialize PHY: %d\n", ret);
> +
> +       ret = phy_set_mode(imx8qxp_ldb_ch->phy, PHY_MODE_LVDS);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(dev, "failed to set PHY mode: %d\n", ret);
> +
> +       if (is_split && companion) {
> +               companion_ldb_ch = bridge_to_ldb_ch(companion);
> +
> +               companion_ldb_ch->in_bus_format = ldb_ch->in_bus_format;
> +               companion_ldb_ch->out_bus_format = ldb_ch->out_bus_format;
> +       }
> +
> +       clk_set_rate(imx8qxp_ldb->clk_bypass, di_clk);
> +       clk_set_rate(imx8qxp_ldb->clk_pixel, di_clk);
> +
> +       imx8qxp_ldb_set_phy_cfg(imx8qxp_ldb, di_clk, is_split, phy_cfg);
> +       ret = phy_configure(imx8qxp_ldb_ch->phy, &opts);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(dev, "failed to configure PHY: %d\n", ret);
> +
> +       if (chno == 0)
> +               ldb->ldb_ctrl &= ~LDB_CH_SEL;
> +       else
> +               ldb->ldb_ctrl |= LDB_CH_SEL;
> +
> +       /* input VSYNC signal from pixel link is active low */
> +       if (imx8qxp_ldb_ch->di_id == 0)
> +               ldb->ldb_ctrl |= LDB_DI0_VS_POL_ACT_LOW;
> +       else
> +               ldb->ldb_ctrl |= LDB_DI1_VS_POL_ACT_LOW;
> +
> +       /*
> +        * For split mode, settle input VSYNC signal polarity and
> +        * channel selection down early.
> +        */
> +       if (is_split)
> +               regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
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
> +
> +       if (is_split && companion)
> +               companion->funcs->mode_set(companion, mode, adjusted_mode);
> +}
> +
> +static void
> +imx8qxp_ldb_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +                                    struct drm_bridge_state *old_bridge_state)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +       struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
> +       struct drm_bridge *companion = imx8qxp_ldb->companion;
> +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> +
> +       clk_prepare_enable(imx8qxp_ldb->clk_pixel);
> +       clk_prepare_enable(imx8qxp_ldb->clk_bypass);
> +
> +       if (is_split && companion)
> +               companion->funcs->atomic_pre_enable(companion, old_bridge_state);
> +}
> +
> +static void
> +imx8qxp_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
> +                                struct drm_bridge_state *old_bridge_state)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +       struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +                                       base_to_imx8qxp_ldb_channel(ldb_ch);
> +       struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
> +       struct drm_bridge *companion = imx8qxp_ldb->companion;
> +       struct device *dev = imx8qxp_ldb->dev;
> +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> +       int ret;
> +
> +       if (ldb_ch->chno == 0 || is_split) {
> +               ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
> +               ldb->ldb_ctrl |= imx8qxp_ldb_ch->di_id == 0 ?
> +                               LDB_CH0_MODE_EN_TO_DI0 : LDB_CH0_MODE_EN_TO_DI1;
> +       }
> +       if (ldb_ch->chno == 1 || is_split) {
> +               ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
> +               ldb->ldb_ctrl |= imx8qxp_ldb_ch->di_id == 0 ?
> +                               LDB_CH1_MODE_EN_TO_DI0 : LDB_CH1_MODE_EN_TO_DI1;
> +       }
> +
> +       ldb_bridge_enable_helper(bridge);
> +
> +       ret = phy_power_on(imx8qxp_ldb_ch->phy);
> +       if (ret)
> +               DRM_DEV_ERROR(dev, "failed to power on PHY: %d\n", ret);
> +
> +       if (is_split && companion)
> +               companion->funcs->atomic_enable(companion, old_bridge_state);
> +}
> +
> +static void
> +imx8qxp_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
> +                                 struct drm_bridge_state *old_bridge_state)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       struct ldb *ldb = ldb_ch->ldb;
> +       struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +                                       base_to_imx8qxp_ldb_channel(ldb_ch);
> +       struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
> +       struct drm_bridge *companion = imx8qxp_ldb->companion;
> +       struct device *dev = imx8qxp_ldb->dev;
> +       bool is_split = ldb_channel_is_split_link(ldb_ch);
> +       int ret;
> +
> +       ret = phy_power_off(imx8qxp_ldb_ch->phy);
> +       if (ret)
> +               DRM_DEV_ERROR(dev, "failed to power off PHY: %d\n", ret);
> +
> +       ret = phy_exit(imx8qxp_ldb_ch->phy);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(dev, "failed to teardown PHY: %d\n", ret);
> +
> +       ldb_bridge_disable_helper(bridge);
> +
> +       clk_disable_unprepare(imx8qxp_ldb->clk_bypass);
> +       clk_disable_unprepare(imx8qxp_ldb->clk_pixel);
> +
> +       if (is_split && companion)
> +               companion->funcs->atomic_disable(companion, old_bridge_state);
> +
> +       ret = pm_runtime_put(dev);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
> +}
> +
> +static const u32 imx8qxp_ldb_bus_output_fmts[] = {
> +       MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +       MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +       MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> +       MEDIA_BUS_FMT_FIXED,
> +};
> +
> +static bool imx8qxp_ldb_bus_output_fmt_supported(u32 fmt)
> +{
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(imx8qxp_ldb_bus_output_fmts); i++) {
> +               if (imx8qxp_ldb_bus_output_fmts[i] == fmt)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
> +static u32 *
> +imx8qxp_ldb_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
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
> +       if (!imx8qxp_ldb_bus_output_fmt_supported(output_fmt))
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
> +                * Default to MEDIA_BUS_FMT_RGB888_1X24, if no match.
> +                */
> +               if (di->num_bus_formats) {
> +                       finfo = drm_format_info(di->bus_formats[0]);
> +
> +                       input_fmts[0] = finfo->depth == 18 ?
> +                                       MEDIA_BUS_FMT_RGB666_1X24_CPADHI :
> +                                       MEDIA_BUS_FMT_RGB888_1X24;
> +               } else {
> +                       input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +               }
> +               break;
> +       case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +               input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> +               break;
> +       case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +       case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +               input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
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
> +imx8qxp_ldb_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +                                       struct drm_bridge_state *bridge_state,
> +                                       struct drm_crtc_state *crtc_state,
> +                                       struct drm_connector_state *conn_state,
> +                                       unsigned int *num_output_fmts)
> +{
> +       *num_output_fmts = ARRAY_SIZE(imx8qxp_ldb_bus_output_fmts);
> +       return kmemdup(imx8qxp_ldb_bus_output_fmts,
> +                       sizeof(imx8qxp_ldb_bus_output_fmts), GFP_KERNEL);
> +}
> +
> +static enum drm_mode_status
> +imx8qxp_ldb_bridge_mode_valid(struct drm_bridge *bridge,
> +                             const struct drm_display_info *info,
> +                             const struct drm_display_mode *mode)
> +{
> +       struct ldb_channel *ldb_ch = bridge->driver_private;
> +       bool is_single = ldb_channel_is_single_link(ldb_ch);
> +
> +       if (mode->clock > 170000)
> +               return MODE_CLOCK_HIGH;
> +
> +       if (mode->clock > 150000 && is_single)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
> +static const struct drm_bridge_funcs imx8qxp_ldb_bridge_funcs = {
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset           = drm_atomic_helper_bridge_reset,
> +       .mode_valid             = imx8qxp_ldb_bridge_mode_valid,
> +       .attach                 = ldb_bridge_attach_helper,
> +       .atomic_check           = imx8qxp_ldb_bridge_atomic_check,
> +       .mode_set               = imx8qxp_ldb_bridge_mode_set,
> +       .atomic_pre_enable      = imx8qxp_ldb_bridge_atomic_pre_enable,
> +       .atomic_enable          = imx8qxp_ldb_bridge_atomic_enable,
> +       .atomic_disable         = imx8qxp_ldb_bridge_atomic_disable,
> +       .atomic_get_input_bus_fmts =
> +                       imx8qxp_ldb_bridge_atomic_get_input_bus_fmts,
> +       .atomic_get_output_bus_fmts =
> +                       imx8qxp_ldb_bridge_atomic_get_output_bus_fmts,
> +};
> +
> +static int imx8qxp_ldb_set_di_id(struct imx8qxp_ldb *imx8qxp_ldb)
> +{
> +       struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +                        &imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
> +       struct ldb_channel *ldb_ch = &imx8qxp_ldb_ch->base;
> +       struct device_node *ep, *remote;
> +       struct device *dev = imx8qxp_ldb->dev;
> +       struct of_endpoint endpoint;
> +       int ret;
> +
> +       ep = of_graph_get_endpoint_by_regs(ldb_ch->np, 0, -1);
> +       if (!ep) {
> +               DRM_DEV_ERROR(dev, "failed to get port0 endpoint\n");
> +               return -EINVAL;
> +       }
> +
> +       remote = of_graph_get_remote_endpoint(ep);
> +       of_node_put(ep);
> +       if (!remote) {
> +               DRM_DEV_ERROR(dev, "failed to get port0 remote endpoint\n");
> +               return -EINVAL;
> +       }
> +
> +       ret = of_graph_parse_endpoint(remote, &endpoint);
> +       of_node_put(remote);
> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "failed to parse port0 remote endpoint: %d\n",
> +                                                                       ret);
> +               return ret;
> +       }
> +
> +       imx8qxp_ldb_ch->di_id = endpoint.id;
> +
> +       return 0;
> +}
> +
> +static int
> +imx8qxp_ldb_check_chno_and_dual_link(struct ldb_channel *ldb_ch, int link)
> +{
> +       if ((link == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS && ldb_ch->chno != 0) ||
> +           (link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS && ldb_ch->chno != 1))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
> +{
> +       struct imx8qxp_ldb_channel *imx8qxp_ldb_ch =
> +                        &imx8qxp_ldb->channel[imx8qxp_ldb->active_chno];
> +       struct ldb_channel *ldb_ch = &imx8qxp_ldb_ch->base;
> +       struct ldb_channel *companion_ldb_ch;
> +       struct device_node *companion;
> +       struct device_node *child;
> +       struct device_node *companion_port = NULL;
> +       struct device_node *port1, *port2;
> +       struct device *dev = imx8qxp_ldb->dev;
> +       const struct of_device_id *match;
> +       u32 i;
> +       int dual_link;
> +       int ret;
> +
> +       /* Locate the companion LDB for dual-link operation, if any. */
> +       companion = of_parse_phandle(dev->of_node, "fsl,companion-ldb", 0);
> +       if (!companion)
> +               return 0;
> +
> +       if (!of_device_is_available(companion)) {
> +               DRM_DEV_ERROR(dev, "companion LDB is not available\n");
> +               ret = -ENODEV;
> +               goto out;
> +       }
> +
> +       /*
> +        * Sanity check: the companion bridge must have the same compatible
> +        * string.
> +        */
> +       match = of_match_device(dev->driver->of_match_table, dev);
> +       if (!of_device_is_compatible(companion, match->compatible)) {
> +               DRM_DEV_ERROR(dev, "companion LDB is incompatible\n");
> +               ret = -ENXIO;
> +               goto out;
> +       }
> +
> +       for_each_available_child_of_node(companion, child) {
> +               ret = of_property_read_u32(child, "reg", &i);
> +               if (ret || i > MAX_LDB_CHAN_NUM - 1) {
> +                       DRM_DEV_ERROR(dev,
> +                                     "invalid channel node address: %u\n", i);
> +                       ret = -EINVAL;
> +                       of_node_put(child);
> +                       goto out;
> +               }
> +
> +               /*
> +                * Channel numbers have to be different, because channel0
> +                * transmits odd pixels and channel1 transmits even pixels.
> +                */
> +               if (i == (ldb_ch->chno ^ 0x1)) {
> +                       companion_port = child;
> +                       break;
> +               }
> +       }
> +
> +       if (companion_port == NULL) {
> +               DRM_DEV_ERROR(dev,
> +                             "failed to find companion LDB channel port\n");
> +               ret = -EINVAL;
> +               goto out;
> +       }
> +
> +       /*
> +        * We need to work out if the sink is expecting us to function in
> +        * dual-link mode.  We do this by looking at the DT port nodes we are
> +        * connected to.  If they are marked as expecting odd pixels and
> +        * even pixels than we need to enable LDB split mode.
> +        */
> +       port1 = of_graph_get_port_by_id(ldb_ch->np, 1);
> +       port2 = of_graph_get_port_by_id(companion_port, 1);
> +       dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> +       of_node_put(port1);
> +       of_node_put(port2);
> +
> +       switch (dual_link) {
> +       case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
> +               ldb_ch->link_type = LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
> +               break;
> +       case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
> +               ldb_ch->link_type = LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS;
> +               break;
> +       default:
> +               ret = dual_link;
> +               DRM_DEV_ERROR(dev,
> +                             "failed to get dual link pixel order: %d\n", ret);
> +               goto out;
> +       }
> +
> +       ret = imx8qxp_ldb_check_chno_and_dual_link(ldb_ch, dual_link);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(dev,
> +                             "unmatched channel number(%u) vs dual link(%d)\n",
> +                                                       ldb_ch->chno, dual_link);
> +               goto out;
> +       }
> +
> +       imx8qxp_ldb->companion = of_drm_find_bridge(companion_port);
> +       if (!imx8qxp_ldb->companion) {
> +               ret = -EPROBE_DEFER;
> +               DRM_DEV_DEBUG_DRIVER(dev,
> +                      "failed to find bridge for companion bridge: %d\n", ret);
> +               goto out;
> +       }
> +
> +       DRM_DEV_DEBUG_DRIVER(dev,
> +               "dual-link configuration detected (companion bridge %pOF)\n",
> +                                                               companion);
> +
> +       companion_ldb_ch = bridge_to_ldb_ch(imx8qxp_ldb->companion);
> +       companion_ldb_ch->link_type = ldb_ch->link_type;
> +out:
> +       of_node_put(companion_port);
> +       of_node_put(companion);
> +       return ret;
> +}
> +
> +static int imx8qxp_ldb_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct imx8qxp_ldb *imx8qxp_ldb;
> +       struct imx8qxp_ldb_channel *imx8qxp_ldb_ch;
> +       struct ldb *ldb;
> +       struct ldb_channel *ldb_ch;
> +       int ret, i;
> +
> +       imx8qxp_ldb = devm_kzalloc(dev, sizeof(*imx8qxp_ldb), GFP_KERNEL);
> +       if (!imx8qxp_ldb)
> +               return -ENOMEM;
> +
> +       imx8qxp_ldb->clk_pixel = devm_clk_get(dev, "pixel");
> +       if (IS_ERR(imx8qxp_ldb->clk_pixel)) {
> +               ret = PTR_ERR(imx8qxp_ldb->clk_pixel);
> +               if (ret != -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev,
> +                                     "failed to get pixel clock: %d\n", ret);
> +               return ret;
> +       }
> +
> +       imx8qxp_ldb->clk_bypass = devm_clk_get(dev, "bypass");
> +       if (IS_ERR(imx8qxp_ldb->clk_bypass)) {
> +               ret = PTR_ERR(imx8qxp_ldb->clk_bypass);
> +               if (ret != -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev,
> +                                     "failed to get bypass clock: %d\n", ret);
> +               return ret;
> +       }
> +
> +       imx8qxp_ldb->dev = dev;
> +
> +       ldb = &imx8qxp_ldb->base;
> +       ldb->dev = dev;
> +       ldb->ctrl_reg = 0xe0;
> +
> +       for (i = 0; i < MAX_LDB_CHAN_NUM; i++)
> +               ldb->channel[i] = &imx8qxp_ldb->channel[i].base;
> +
> +       ret = ldb_init_helper(ldb);
> +       if (ret)
> +               return ret;
> +
> +       if (ldb->available_ch_cnt == 0) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "no available channel\n");
> +               return 0;
> +       } else if (ldb->available_ch_cnt > 1) {
> +               DRM_DEV_ERROR(dev, "invalid available channel number(%u)\n",
> +                                                       ldb->available_ch_cnt);
> +               return -ENOTSUPP;
> +       }

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#683: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c:625:
+        return -ENOTSUPP;

Maybe -EINVAL is a better return value.
