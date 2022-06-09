Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF1A544791
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 11:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242744AbiFIJbZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 05:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234644AbiFIJbM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 05:31:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0ED12C06AA;
        Thu,  9 Jun 2022 02:30:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 680636CF;
        Thu,  9 Jun 2022 11:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654767039;
        bh=kZT0E6W+dxE5XhgRvxlJJcEQGCXQC0DhdfL/VJDDOd0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QdQZzI4LNcRbs61xKgYg7J2uCMUidlb0P5G2xU1uoeW24aT20FVAVy+Fpb4OF1mQ4
         K1/oUvKikeVqI7MpOvv4/xMBkQpRCVoglcrEJJ3Ah5f9Nnl4JDwVaHx/yicjHwgB/L
         tAd0E81Djw7z+kD9+kxDS6TtD4dhVAGMr5zhECPk=
Date:   Thu, 9 Jun 2022 12:30:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, andrzej.hajda@intel.com,
        narmstrong@baylibre.com, robert.foss@linaro.org, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, lee.jones@linaro.org,
        mchehab@kernel.org, marcel.ziswiler@toradex.com
Subject: Re: [PATCH v8 06/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel
 link support
Message-ID: <YqG9uaGOOp8gEYZh@pendragon.ideasonboard.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
 <20220609064931.3068601-7-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220609064931.3068601-7-victor.liu@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Liu,

Thank you for the patch.

On Thu, Jun 09, 2022 at 02:49:23PM +0800, Liu Ying wrote:
> This patch adds a drm bridge driver for i.MX8qm/qxp display pixel link.
> The pixel link forms a standard asynchronous linkage between
> pixel sources(display controller or camera module) and pixel
> consumers(imaging or displays).  It consists of two distinct
> functions, a pixel transfer function and a control interface.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri iMX8X, LT170410-2WHC, LP156WF1
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> Robert, I keep your R-b tag from v5. Let me know if you want me to drop it, as
> v7 contains a fix for checkpatch complaints.
> Marcel, as the fix is trivial, I add your T-b tag. Let me know if you want me
> to drop it.
> 
> v7->v8:
> * No change.
> 
> v6->v7:
> * Fix 'Alignment should match open parenthesis' complaints from
>   'checkpatch.pl --strict'.
> * Add Marcel's T-b tag.
> 
> v5->v6:
> * No change.
> 
> v4->v5:
> * Make a comment occupy a line. (Robert)
> * Add Robert's R-b tag.
> 
> v3->v4:
> * No change.
> 
> v2->v3:
> * Drop two macros which help define functions and define them directly.
> * Properly disable all pixel link controls to POR value by calling
>   imx8qxp_pixel_link_disable_all_controls() from
>   imx8qxp_pixel_link_bridge_probe().
> 
> v1->v2:
> * Rewrite the function to find the next bridge by properly using OF APIs
>   and dropping unnecessary DT validation. (Rob)
> 
>  drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
>  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
>  .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 429 ++++++++++++++++++
>  3 files changed, 438 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index f1c91b6814a5..4d1f027d07f8 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -6,3 +6,11 @@ config DRM_IMX8QXP_PIXEL_COMBINER
>  	help
>  	  Choose this to enable pixel combiner found in
>  	  Freescale i.MX8qm/qxp processors.
> +
> +config DRM_IMX8QXP_PIXEL_LINK
> +	tristate "Freescale i.MX8QM/QXP display pixel link"
> +	depends on OF
> +	select DRM_KMS_HELPER

Should this depend on (or select) IMX_SCU ?

> +	help
> +	  Choose this to enable display pixel link found in
> +	  Freescale i.MX8qm/qxp processors.
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index 7d7c8d674bf0..c15469fb5789 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> +obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> new file mode 100644
> index 000000000000..52b9b96549e1
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> @@ -0,0 +1,429 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +#include <linux/firmware/imx/svc/misc.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_print.h>
> +
> +#include <dt-bindings/firmware/imx/rsrc.h>
> +
> +#define DRIVER_NAME		"imx8qxp-display-pixel-link"
> +#define PL_MAX_MST_ADDR		3
> +#define PL_MAX_NEXT_BRIDGES	2
> +
> +struct imx8qxp_pixel_link {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct device *dev;
> +	struct imx_sc_ipc *ipc_handle;
> +	int id;
> +	int stream_id;
> +	int dc_id;
> +	u32 sink_rsc;
> +	u32 mst_addr;
> +	u8 mst_addr_ctrl;
> +	u8 mst_en_ctrl;
> +	u8 mst_vld_ctrl;
> +	u8 sync_ctrl;
> +};
> +
> +static void imx8qxp_pixel_link_enable_mst_en(struct imx8qxp_pixel_link *pl)
> +{
> +	int ret;
> +
> +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +				      pl->mst_en_ctrl, true);
> +	if (ret)
> +		DRM_DEV_ERROR(pl->dev,
> +			      "failed to enable DC%d stream%d pixel link mst_en: %d\n",
> +			      pl->dc_id, pl->stream_id, ret);
> +}
> +
> +static void imx8qxp_pixel_link_enable_mst_vld(struct imx8qxp_pixel_link *pl)
> +{
> +	int ret;
> +
> +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +				      pl->mst_vld_ctrl, true);
> +	if (ret)
> +		DRM_DEV_ERROR(pl->dev,
> +			      "failed to enable DC%d stream%d pixel link mst_vld: %d\n",
> +			      pl->dc_id, pl->stream_id, ret);
> +}
> +
> +static void imx8qxp_pixel_link_enable_sync(struct imx8qxp_pixel_link *pl)
> +{
> +	int ret;
> +
> +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +				      pl->sync_ctrl, true);
> +	if (ret)
> +		DRM_DEV_ERROR(pl->dev,
> +			      "failed to enable DC%d stream%d pixel link sync: %d\n",
> +			      pl->dc_id, pl->stream_id, ret);
> +}
> +
> +static int imx8qxp_pixel_link_disable_mst_en(struct imx8qxp_pixel_link *pl)
> +{
> +	int ret;
> +
> +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +				      pl->mst_en_ctrl, false);
> +	if (ret)
> +		DRM_DEV_ERROR(pl->dev,
> +			      "failed to disable DC%d stream%d pixel link mst_en: %d\n",
> +			      pl->dc_id, pl->stream_id, ret);
> +
> +	return ret;
> +}
> +
> +static int imx8qxp_pixel_link_disable_mst_vld(struct imx8qxp_pixel_link *pl)
> +{
> +	int ret;
> +
> +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +				      pl->mst_vld_ctrl, false);
> +	if (ret)
> +		DRM_DEV_ERROR(pl->dev,
> +			      "failed to disable DC%d stream%d pixel link mst_vld: %d\n",
> +			      pl->dc_id, pl->stream_id, ret);
> +
> +	return ret;
> +}
> +
> +static int imx8qxp_pixel_link_disable_sync(struct imx8qxp_pixel_link *pl)
> +{
> +	int ret;
> +
> +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> +				      pl->sync_ctrl, false);
> +	if (ret)
> +		DRM_DEV_ERROR(pl->dev,
> +			      "failed to disable DC%d stream%d pixel link sync: %d\n",
> +			      pl->dc_id, pl->stream_id, ret);
> +
> +	return ret;
> +}
> +
> +static void imx8qxp_pixel_link_set_mst_addr(struct imx8qxp_pixel_link *pl)
> +{
> +	int ret;
> +
> +	ret = imx_sc_misc_set_control(pl->ipc_handle,
> +				      pl->sink_rsc, pl->mst_addr_ctrl,
> +				      pl->mst_addr);
> +	if (ret)
> +		DRM_DEV_ERROR(pl->dev,
> +			      "failed to set DC%d stream%d pixel link mst addr(%u): %d\n",
> +			      pl->dc_id, pl->stream_id, pl->mst_addr, ret);
> +}
> +
> +static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
> +					    enum drm_bridge_attach_flags flags)
> +{
> +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		DRM_DEV_ERROR(pl->dev,
> +			      "do not support creating a drm_connector\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!bridge->encoder) {
> +		DRM_DEV_ERROR(pl->dev, "missing encoder\n");
> +		return -ENODEV;
> +	}
> +
> +	return drm_bridge_attach(bridge->encoder,
> +				 pl->next_bridge, bridge,
> +				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static void
> +imx8qxp_pixel_link_bridge_mode_set(struct drm_bridge *bridge,
> +				   const struct drm_display_mode *mode,
> +				   const struct drm_display_mode *adjusted_mode)
> +{
> +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +	imx8qxp_pixel_link_set_mst_addr(pl);
> +}
> +
> +static void
> +imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)
> +{
> +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +	imx8qxp_pixel_link_enable_mst_en(pl);
> +	imx8qxp_pixel_link_enable_mst_vld(pl);
> +	imx8qxp_pixel_link_enable_sync(pl);
> +}
> +
> +static void
> +imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *old_bridge_state)
> +{
> +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> +
> +	imx8qxp_pixel_link_disable_mst_en(pl);
> +	imx8qxp_pixel_link_disable_mst_vld(pl);
> +	imx8qxp_pixel_link_disable_sync(pl);
> +}
> +
> +static const u32 imx8qxp_pixel_link_bus_output_fmts[] = {
> +	MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
> +	MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
> +};
> +
> +static bool imx8qxp_pixel_link_bus_output_fmt_supported(u32 fmt)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts); i++) {
> +		if (imx8qxp_pixel_link_bus_output_fmts[i] == fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +						    struct drm_bridge_state *bridge_state,
> +						    struct drm_crtc_state *crtc_state,
> +						    struct drm_connector_state *conn_state,
> +						    u32 output_fmt,
> +						    unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	if (!imx8qxp_pixel_link_bus_output_fmt_supported(output_fmt))
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +
> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = output_fmt;
> +
> +	return input_fmts;
> +}
> +
> +static u32 *
> +imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +						     struct drm_bridge_state *bridge_state,
> +						     struct drm_crtc_state *crtc_state,
> +						     struct drm_connector_state *conn_state,
> +						     unsigned int *num_output_fmts)
> +{
> +	*num_output_fmts = ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts);
> +	return kmemdup(imx8qxp_pixel_link_bus_output_fmts,
> +			sizeof(imx8qxp_pixel_link_bus_output_fmts), GFP_KERNEL);
> +}
> +
> +static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
> +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> +	.attach			= imx8qxp_pixel_link_bridge_attach,
> +	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
> +	.atomic_enable		= imx8qxp_pixel_link_bridge_atomic_enable,
> +	.atomic_disable		= imx8qxp_pixel_link_bridge_atomic_disable,
> +	.atomic_get_input_bus_fmts =
> +			imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts,
> +	.atomic_get_output_bus_fmts =
> +			imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts,
> +};
> +
> +static int imx8qxp_pixel_link_disable_all_controls(struct imx8qxp_pixel_link *pl)
> +{
> +	int ret;
> +
> +	ret = imx8qxp_pixel_link_disable_mst_en(pl);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx8qxp_pixel_link_disable_mst_vld(pl);
> +	if (ret)
> +		return ret;
> +
> +	return imx8qxp_pixel_link_disable_sync(pl);
> +}
> +
> +static struct drm_bridge *
> +imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
> +{
> +	struct device_node *np = pl->dev->of_node;
> +	struct device_node *port, *remote;
> +	struct drm_bridge *next_bridge[PL_MAX_NEXT_BRIDGES];
> +	u32 port_id;
> +	bool found_port = false;
> +	int reg, ep_cnt = 0;
> +	/* select the first next bridge by default */
> +	int bridge_sel = 0;
> +
> +	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
> +		port = of_graph_get_port_by_id(np, port_id);
> +		if (!port)
> +			continue;
> +
> +		if (of_device_is_available(port)) {
> +			found_port = true;
> +			of_node_put(port);
> +			break;
> +		}
> +
> +		of_node_put(port);
> +	}
> +
> +	if (!found_port) {
> +		DRM_DEV_ERROR(pl->dev, "no available output port\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
> +		remote = of_graph_get_remote_node(np, port_id, reg);
> +		if (!remote)
> +			continue;
> +
> +		if (!of_device_is_available(remote->parent)) {
> +			DRM_DEV_DEBUG(pl->dev,
> +				      "port%u endpoint%u remote parent is not available\n",
> +				      port_id, reg);
> +			of_node_put(remote);
> +			continue;
> +		}
> +
> +		next_bridge[ep_cnt] = of_drm_find_bridge(remote);
> +		if (!next_bridge[ep_cnt]) {
> +			of_node_put(remote);
> +			return ERR_PTR(-EPROBE_DEFER);
> +		}
> +
> +		/* specially select the next bridge with companion PXL2DPI */
> +		if (of_find_property(remote, "fsl,companion-pxl2dpi", NULL))
> +			bridge_sel = ep_cnt;
> +
> +		ep_cnt++;
> +
> +		of_node_put(remote);
> +	}
> +
> +	pl->mst_addr = port_id - 1;
> +
> +	return next_bridge[bridge_sel];
> +}
> +
> +static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
> +{
> +	struct imx8qxp_pixel_link *pl;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	pl = devm_kzalloc(dev, sizeof(*pl), GFP_KERNEL);
> +	if (!pl)
> +		return -ENOMEM;
> +
> +	ret = imx_scu_get_handle(&pl->ipc_handle);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
> +				      ret);
> +		return ret;
> +	}
> +
> +	pl->id = of_alias_get_id(np, "dc_pl");

Could we avoid relying on aliases ? I'd add an id property to the DT
node instead, or possibly even better a dc id and a stream id.

> +	if (pl->id < 0) {
> +		DRM_DEV_ERROR(dev,
> +			      "failed to get pixel link node alias id: %d\n",
> +			      pl->id);
> +		return pl->id;
> +	}
> +
> +	pl->dev = dev;
> +
> +	pl->dc_id = pl->id / 2;
> +	pl->stream_id = pl->id % 2;
> +
> +	pl->sink_rsc = pl->dc_id ? IMX_SC_R_DC_1 : IMX_SC_R_DC_0;
> +
> +	if (pl->stream_id == 0) {
> +		pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST1_ADDR;
> +		pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST1_ENB;
> +		pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST1_VLD;
> +		pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL0;
> +	} else {
> +		pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST2_ADDR;
> +		pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST2_ENB;
> +		pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST2_VLD;
> +		pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL1;
> +	}
> +
> +	/* disable all controls to POR default */
> +	ret = imx8qxp_pixel_link_disable_all_controls(pl);
> +	if (ret)
> +		return ret;
> +
> +	pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
> +	if (IS_ERR(pl->next_bridge)) {
> +		ret = PTR_ERR(pl->next_bridge);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
> +				      ret);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, pl);
> +
> +	pl->bridge.driver_private = pl;
> +	pl->bridge.funcs = &imx8qxp_pixel_link_bridge_funcs;
> +	pl->bridge.of_node = np;
> +
> +	drm_bridge_add(&pl->bridge);
> +
> +	return ret;
> +}
> +
> +static int imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
> +{
> +	struct imx8qxp_pixel_link *pl = platform_get_drvdata(pdev);
> +
> +	drm_bridge_remove(&pl->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id imx8qxp_pixel_link_dt_ids[] = {
> +	{ .compatible = "fsl,imx8qm-dc-pixel-link", },
> +	{ .compatible = "fsl,imx8qxp-dc-pixel-link", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8qxp_pixel_link_dt_ids);
> +
> +static struct platform_driver imx8qxp_pixel_link_bridge_driver = {
> +	.probe	= imx8qxp_pixel_link_bridge_probe,
> +	.remove = imx8qxp_pixel_link_bridge_remove,
> +	.driver	= {
> +		.of_match_table = imx8qxp_pixel_link_dt_ids,
> +		.name = DRIVER_NAME,
> +	},
> +};
> +module_platform_driver(imx8qxp_pixel_link_bridge_driver);
> +
> +MODULE_DESCRIPTION("i.MX8QXP/QM display pixel link bridge driver");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRIVER_NAME);

-- 
Regards,

Laurent Pinchart
