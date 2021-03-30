Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738CC34E49D
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 11:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbhC3JnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 05:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbhC3Jmp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 05:42:45 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C89C061574
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 02:42:44 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id v10so11295542pgs.12
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 02:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7LoUqeum2iq91pIgvTQ/pMKpCUqLqS8izu6jJknZLX0=;
        b=FM82EuK08cHIZemfUn1Ea9MrpS++774Y3ItBIam1oZQe9mvsjkEe22BSkztLDhqR9j
         1oAcuV9ISrn9tbEnNB+BWOMRRcfIIzfd6hMieOR3nM53jWRH0KQ7JrK/o5Uc22WdyXKx
         Mx12ih6M3Z38JVLARKbjRtHgQtuP399cntsw8PaUeDsUozuUbzW3p3qSQJSmnYbn0waX
         AgvH9ycQjhjhU3szu0Iw3autF7YE6+Adxe8maawH8iO3vU2tkZSwnbvuLNu/WttbCg1n
         pxU8QBK6MIctWYrKNjdOtJdP/vXMu+H10p+LddD0MHjmZ2kpBfQDOpQVA0FDVp1DvB5D
         0E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7LoUqeum2iq91pIgvTQ/pMKpCUqLqS8izu6jJknZLX0=;
        b=NYLs8izHxoYu/sOgG5Z7YC4W00CYKodQZSoxVZ3Af5yVoRxLdrz31gUOsYbHRJKDCc
         q+aLzfvINvLFKDhe9Z47pB+Co9rxQAyXVBcbKfruprRfgyOG+jq8tQ5+In8bcUpArWvK
         8aH7IYXQLzT3pcjC4c5AKGOHdj3ZEiFY+DdTB+MYL6VIbAarg85l7YQPb49Nq1TiRLK0
         vgTiFBDsU/XQrWH5pdHdfjOQdR9YPncTtHNRR6EcEKjXND3r7bnnZoVFMSxWd0x+nl7N
         Qf86dun/L70no24flhKfLIgOfiZ8/LXKZ4yz5bxYt3amovwiGnLPLmCPklvRsLwa1NPl
         o/kA==
X-Gm-Message-State: AOAM530utnWrflT8+ebNHjM9Ub+0Odtw1jzT0BW5fI5TWGppzFH4XjXo
        Qd5lYb7U339blaeXUpsu5KHvYojNbY1m0rrRD/6jlw==
X-Google-Smtp-Source: ABdhPJyvpbQtwkVBq52QxcQcZgLJvXcP90o/uayzupMR1+8gdl0Tgw33swzSYoTdvvr4LRczzPP3+Vubq2Mg46gIT6M=
X-Received: by 2002:a63:2321:: with SMTP id j33mr27577140pgj.120.1617097364126;
 Tue, 30 Mar 2021 02:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com> <1615952569-4711-10-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1615952569-4711-10-git-send-email-victor.liu@nxp.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 30 Mar 2021 11:42:32 +0200
Message-ID: <CAG3jFysiRnNCv21utFyj+UuFhW+6om0eHEMLH57FYSdiBqL5wA@mail.gmail.com>
Subject: Re: [PATCH v6 09/14] drm/bridge: imx: Add i.MX8qxp pixel link to DPI support
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Liu,

checkpatch --strict had some complaints, with those fixed feel free to
add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Wed, 17 Mar 2021 at 04:57, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds a drm bridge driver for i.MX8qxp pixel link to display
> pixel interface(PXL2DPI).  The PXL2DPI interfaces the pixel link 36-bit
> data output and the DSI controller=E2=80=99s MIPI-DPI 24-bit data input, =
and
> inputs of LVDS Display Bridge(LDB) module used in LVDS mode, to remap
> the pixel color codings between those modules. The PXL2DPI is purely
> combinatorial.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v5->v6:
> * No change.
>
> v4->v5:
> * No change.
>
> v3->v4:
> * Use 'fsl,sc-resource' DT property to get the SCU resource ID associated=
 with
>   the PXL2DPI instance instead of using alias ID. (Rob)
>
> v2->v3:
> * Call syscon_node_to_regmap() to get regmap instead of
>   syscon_regmap_lookup_by_phandle().
>
> v1->v2:
> * Drop unnecessary port availability check.
>
>  drivers/gpu/drm/bridge/imx/Kconfig           |   8 +
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 485 +++++++++++++++++++++=
++++++
>  3 files changed, 494 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
>
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/=
imx/Kconfig
> index 4d1f027..1ea1ce7 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -14,3 +14,11 @@ config DRM_IMX8QXP_PIXEL_LINK
>         help
>           Choose this to enable display pixel link found in
>           Freescale i.MX8qm/qxp processors.
> +
> +config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
> +       tristate "Freescale i.MX8QXP pixel link to display pixel interfac=
e"
> +       depends on OF
> +       select DRM_KMS_HELPER
> +       help
> +         Choose this to enable pixel link to display pixel interface(PXL=
2DPI)
> +         found in Freescale i.MX8qxp processor.
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge=
/imx/Makefile
> index c15469f..e74dd64 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) +=3D imx8qxp-pixel-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) +=3D imx8qxp-pixel-link.o
> +obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) +=3D imx8qxp-pxl2dpi.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/d=
rm/bridge/imx/imx8qxp-pxl2dpi.c
> new file mode 100644
> index 00000000..6696855
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> @@ -0,0 +1,485 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +#include <linux/firmware/imx/svc/misc.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +
> +#include <dt-bindings/firmware/imx/rsrc.h>
> +
> +#define PXL2DPI_CTRL   0x40
> +#define  CFG1_16BIT    0x0
> +#define  CFG2_16BIT    0x1
> +#define  CFG3_16BIT    0x2
> +#define  CFG1_18BIT    0x3
> +#define  CFG2_18BIT    0x4
> +#define  CFG_24BIT     0x5
> +
> +#define DRIVER_NAME    "imx8qxp-pxl2dpi"
> +
> +struct imx8qxp_pxl2dpi {
> +       struct regmap *regmap;
> +       struct drm_bridge bridge;
> +       struct drm_bridge *next_bridge;
> +       struct drm_bridge *companion;
> +       struct device *dev;
> +       struct imx_sc_ipc *ipc_handle;
> +       u32 sc_resource;
> +       u32 in_bus_format;
> +       u32 out_bus_format;
> +       u32 pl_sel;
> +};
> +
> +#define bridge_to_p2d(b)       container_of(b, struct imx8qxp_pxl2dpi, b=
ridge)
> +
> +static int imx8qxp_pxl2dpi_bridge_attach(struct drm_bridge *bridge,
> +                                        enum drm_bridge_attach_flags fla=
gs)
> +{
> +       struct imx8qxp_pxl2dpi *p2d =3D bridge->driver_private;
> +
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +               DRM_DEV_ERROR(p2d->dev,
> +                             "do not support creating a drm_connector\n"=
);
> +               return -EINVAL;
> +       }
> +
> +       if (!bridge->encoder) {
> +               DRM_DEV_ERROR(p2d->dev, "missing encoder\n");
> +               return -ENODEV;
> +       }
> +
> +       return drm_bridge_attach(bridge->encoder,
> +                                p2d->next_bridge, bridge,
> +                                DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static int
> +imx8qxp_pxl2dpi_bridge_atomic_check(struct drm_bridge *bridge,
> +                                   struct drm_bridge_state *bridge_state=
,
> +                                   struct drm_crtc_state *crtc_state,
> +                                   struct drm_connector_state *conn_stat=
e)
> +{
> +       struct imx8qxp_pxl2dpi *p2d =3D bridge->driver_private;
> +
> +       p2d->in_bus_format =3D bridge_state->input_bus_cfg.format;
> +       p2d->out_bus_format =3D bridge_state->output_bus_cfg.format;
> +
> +       return 0;
> +}
> +
> +static void
> +imx8qxp_pxl2dpi_bridge_mode_set(struct drm_bridge *bridge,
> +                               const struct drm_display_mode *mode,
> +                               const struct drm_display_mode *adjusted_m=
ode)
> +{
> +       struct imx8qxp_pxl2dpi *p2d =3D bridge->driver_private;
> +       struct imx8qxp_pxl2dpi *companion_p2d;
> +       int ret;
> +
> +       ret =3D pm_runtime_get_sync(p2d->dev);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(p2d->dev,
> +                             "failed to get runtime PM sync: %d\n", ret)=
;
> +
> +       ret =3D imx_sc_misc_set_control(p2d->ipc_handle, p2d->sc_resource=
,
> +                                     IMX_SC_C_PXL_LINK_SEL, p2d->pl_sel)=
;
> +       if (ret)
> +               DRM_DEV_ERROR(p2d->dev,
> +                             "failed to set pixel link selection(%u): %d=
\n",
> +                                                       p2d->pl_sel, ret)=
;
> +
> +       switch (p2d->out_bus_format) {
> +       case MEDIA_BUS_FMT_RGB888_1X24:
> +               regmap_write(p2d->regmap, PXL2DPI_CTRL, CFG_24BIT);
> +               break;
> +       case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +               regmap_write(p2d->regmap, PXL2DPI_CTRL, CFG2_18BIT);
> +               break;
> +       default:
> +               DRM_DEV_ERROR(p2d->dev,
> +                             "unsupported output bus format 0x%08x\n",
> +                                                       p2d->out_bus_form=
at);
> +       }
> +
> +       if (p2d->companion) {
> +               companion_p2d =3D bridge_to_p2d(p2d->companion);
> +
> +               companion_p2d->in_bus_format =3D p2d->in_bus_format;
> +               companion_p2d->out_bus_format =3D p2d->out_bus_format;
> +
> +               p2d->companion->funcs->mode_set(p2d->companion, mode,
> +                                                       adjusted_mode);
> +       }
> +}
> +
> +static void
> +imx8qxp_pxl2dpi_bridge_atomic_disable(struct drm_bridge *bridge,
> +                                     struct drm_bridge_state *old_bridge=
_state)
> +{
> +       struct imx8qxp_pxl2dpi *p2d =3D bridge->driver_private;
> +       int ret;
> +
> +       ret =3D pm_runtime_put(p2d->dev);
> +       if (ret < 0)
> +               DRM_DEV_ERROR(p2d->dev, "failed to put runtime PM: %d\n",=
 ret);
> +
> +       if (p2d->companion)
> +               p2d->companion->funcs->atomic_disable(p2d->companion,
> +                                                       old_bridge_state)=
;
> +}
> +
> +static const u32 imx8qxp_pxl2dpi_bus_output_fmts[] =3D {
> +       MEDIA_BUS_FMT_RGB888_1X24,
> +       MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
> +};
> +
> +static bool imx8qxp_pxl2dpi_bus_output_fmt_supported(u32 fmt)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(imx8qxp_pxl2dpi_bus_output_fmts); i+=
+) {
> +               if (imx8qxp_pxl2dpi_bus_output_fmts[i] =3D=3D fmt)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
> +static u32 *
> +imx8qxp_pxl2dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *brid=
ge,
> +                                       struct drm_bridge_state *bridge_s=
tate,
> +                                       struct drm_crtc_state *crtc_state=
,
> +                                       struct drm_connector_state *conn_=
state,
> +                                       u32 output_fmt,
> +                                       unsigned int *num_input_fmts)
> +{

CHECK: Alignment should match open parenthesis
#217: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:164:
+imx8qxp_pxl2dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge=
,
+                    struct drm_bridge_state *bridge_state,


> +       u32 *input_fmts;
> +
> +       if (!imx8qxp_pxl2dpi_bus_output_fmt_supported(output_fmt))
> +               return NULL;
> +
> +       *num_input_fmts =3D 1;
> +
> +       input_fmts =3D kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +       if (!input_fmts)
> +               return NULL;
> +
> +       switch (output_fmt) {
> +       case MEDIA_BUS_FMT_RGB888_1X24:
> +               input_fmts[0] =3D MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
> +               break;
> +       case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +               input_fmts[0] =3D MEDIA_BUS_FMT_RGB666_1X36_CPADLO;
> +               break;
> +       default:
> +               kfree(input_fmts);
> +               input_fmts =3D NULL;
> +               break;
> +       }
> +
> +       return input_fmts;
> +}
> +
> +static u32 *
> +imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bri=
dge,
> +                                       struct drm_bridge_state *bridge_s=
tate,
> +                                       struct drm_crtc_state *crtc_state=
,
> +                                       struct drm_connector_state *conn_=
state,
> +                                       unsigned int *num_output_fmts)

CHECK: Alignment should match open parenthesis
#252: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:199:
+imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridg=
e,
+                    struct drm_bridge_state *bridge_state,


> +{
> +       *num_output_fmts =3D ARRAY_SIZE(imx8qxp_pxl2dpi_bus_output_fmts);
> +       return kmemdup(imx8qxp_pxl2dpi_bus_output_fmts,
> +                       sizeof(imx8qxp_pxl2dpi_bus_output_fmts), GFP_KERN=
EL);
> +}
> +
> +static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs =3D {
> +       .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
> +       .atomic_destroy_state   =3D drm_atomic_helper_bridge_destroy_stat=
e,
> +       .atomic_reset           =3D drm_atomic_helper_bridge_reset,
> +       .attach                 =3D imx8qxp_pxl2dpi_bridge_attach,
> +       .atomic_check           =3D imx8qxp_pxl2dpi_bridge_atomic_check,
> +       .mode_set               =3D imx8qxp_pxl2dpi_bridge_mode_set,
> +       .atomic_disable         =3D imx8qxp_pxl2dpi_bridge_atomic_disable=
,
> +       .atomic_get_input_bus_fmts =3D
> +                       imx8qxp_pxl2dpi_bridge_atomic_get_input_bus_fmts,
> +       .atomic_get_output_bus_fmts =3D
> +                       imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts=
,
> +};
> +
> +static struct device_node *
> +imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
> +                                          u32 port_id)
> +{
> +       struct device_node *port, *ep;
> +       int ep_cnt;
> +
> +       port =3D of_graph_get_port_by_id(p2d->dev->of_node, port_id);
> +       if (!port) {
> +               DRM_DEV_ERROR(p2d->dev, "failed to get port@%u\n", port_i=
d);
> +               return ERR_PTR(-ENODEV);
> +       }
> +
> +       ep_cnt =3D of_get_available_child_count(port);
> +       if (ep_cnt =3D=3D 0) {
> +               DRM_DEV_ERROR(p2d->dev, "no available endpoints of port@%=
u\n",
> +                                                               port_id);

CHECK: Alignment should match open parenthesis
#292: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:239:
+        DRM_DEV_ERROR(p2d->dev, "no available endpoints of port@%u\n",
+                                port_id);


> +               ep =3D ERR_PTR(-ENODEV);
> +               goto out;
> +       } else if (ep_cnt > 1) {
> +               DRM_DEV_ERROR(p2d->dev,
> +                       "invalid available endpoints of port@%u\n", port_=
id);

CHECK: Alignment should match open parenthesis
#297: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:244:
+        DRM_DEV_ERROR(p2d->dev,
+            "invalid available endpoints of port@%u\n", port_id);

> +               ep =3D ERR_PTR(-ENOTSUPP);

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#298: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:245:
+        ep =3D ERR_PTR(-ENOTSUPP);

Maybe the more correct return value would be -EINVAL.


> +               goto out;
> +       }
> +
> +       ep =3D of_get_next_available_child(port, NULL);
> +       if (!ep) {
> +               DRM_DEV_ERROR(p2d->dev,
> +                             "failed to get available endpoint of port@%=
u\n",
> +                                                               port_id);

This ^^ indentation also looks funny.

> +               ep =3D ERR_PTR(-ENODEV);
> +               goto out;
> +       }
> +out:
> +       of_node_put(port);
> +       return ep;
> +}
> +
> +static struct drm_bridge *
> +imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
> +{
> +       struct device_node *ep, *remote;
> +       struct drm_bridge *next_bridge;
> +       int ret;
> +
> +       ep =3D imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
> +       if (IS_ERR(ep)) {
> +               ret =3D PTR_ERR(ep);
> +               return ERR_PTR(ret);
> +       }
> +
> +       remote =3D of_graph_get_remote_port_parent(ep);
> +       if (!remote || !of_device_is_available(remote)) {
> +               DRM_DEV_ERROR(p2d->dev, "no available remote\n");
> +               next_bridge =3D ERR_PTR(-ENODEV);
> +               goto out;
> +       } else if (!of_device_is_available(remote->parent)) {
> +               DRM_DEV_ERROR(p2d->dev, "remote parent is not available\n=
");
> +               next_bridge =3D ERR_PTR(-ENODEV);
> +               goto out;
> +       }
> +
> +       next_bridge =3D of_drm_find_bridge(remote);
> +       if (!next_bridge) {
> +               next_bridge =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out;
> +       }
> +out:
> +       of_node_put(remote);
> +       of_node_put(ep);
> +
> +       return next_bridge;
> +}
> +
> +static int imx8qxp_pxl2dpi_set_pixel_link_sel(struct imx8qxp_pxl2dpi *p2=
d)
> +{
> +       struct device_node *ep;
> +       struct of_endpoint endpoint;
> +       int ret;
> +
> +       ep =3D imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 0);
> +       if (IS_ERR(ep))
> +               return PTR_ERR(ep);
> +
> +       ret =3D of_graph_parse_endpoint(ep, &endpoint);
> +       if (ret) {
> +               DRM_DEV_ERROR(p2d->dev,
> +                             "failed to parse endpoint of port@0: %d\n",=
 ret);
> +               goto out;
> +       }
> +
> +       p2d->pl_sel =3D endpoint.id;
> +out:
> +       of_node_put(ep);
> +
> +       return ret;
> +}
> +
> +static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2=
d)
> +{
> +       struct imx8qxp_pxl2dpi *companion_p2d;
> +       struct device *dev =3D p2d->dev;
> +       struct device_node *companion;
> +       struct device_node *port1, *port2;
> +       const struct of_device_id *match;
> +       int dual_link;
> +       int ret =3D 0;
> +
> +       /* Locate the companion PXL2DPI for dual-link operation, if any. =
*/
> +       companion =3D of_parse_phandle(dev->of_node, "fsl,companion-pxl2d=
pi", 0);
> +       if (!companion)
> +               return 0;
> +
> +       if (!of_device_is_available(companion)) {
> +               DRM_DEV_ERROR(dev, "companion PXL2DPI is not available\n"=
);
> +               ret =3D -ENODEV;
> +               goto out;
> +       }
> +
> +       /*
> +        * Sanity check: the companion bridge must have the same compatib=
le
> +        * string.
> +        */
> +       match =3D of_match_device(dev->driver->of_match_table, dev);
> +       if (!of_device_is_compatible(companion, match->compatible)) {
> +               DRM_DEV_ERROR(dev, "companion PXL2DPI is incompatible\n")=
;
> +               ret =3D -ENXIO;
> +               goto out;
> +       }
> +
> +       p2d->companion =3D of_drm_find_bridge(companion);
> +       if (!p2d->companion) {
> +               ret =3D -EPROBE_DEFER;
> +               DRM_DEV_DEBUG_DRIVER(p2d->dev,
> +                               "failed to find companion bridge: %d\n", =
ret);

CHECK: Alignment should match open parenthesis
#411: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:358:
+        DRM_DEV_DEBUG_DRIVER(p2d->dev,
+                "failed to find companion bridge: %d\n", ret);


> +               goto out;
> +       }
> +
> +       companion_p2d =3D bridge_to_p2d(p2d->companion);
> +
> +       /*
> +        * We need to work out if the sink is expecting us to function in
> +        * dual-link mode.  We do this by looking at the DT port nodes th=
at
> +        * the next bridges are connected to.  If they are marked as expe=
cting
> +        * even pixels and odd pixels than we need to use the companion P=
XL2DPI.
> +        */
> +       port1 =3D of_graph_get_port_by_id(p2d->next_bridge->of_node, 1);
> +       port2 =3D of_graph_get_port_by_id(companion_p2d->next_bridge->of_=
node, 1);
> +       dual_link =3D drm_of_lvds_get_dual_link_pixel_order(port1, port2)=
;
> +       of_node_put(port1);
> +       of_node_put(port2);
> +
> +       if (dual_link < 0) {
> +               ret =3D dual_link;
> +               DRM_DEV_ERROR(dev, "failed to get dual link pixel order: =
%d\n",
> +                                                                       r=
et);

CHECK: Alignment should match open parenthesis
#432: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:379:
+        DRM_DEV_ERROR(dev, "failed to get dual link pixel order: %d\n",
+                                    ret);


> +               goto out;
> +       }
> +
> +       DRM_DEV_DEBUG_DRIVER(dev,
> +               "dual-link configuration detected (companion bridge %pOF)=
\n",
> +                                                               companion=
);

CHECK: Alignment should match open parenthesis
#437: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:384:
+    DRM_DEV_DEBUG_DRIVER(dev,
+        "dual-link configuration detected (companion bridge %pOF)\n",


> +out:
> +       of_node_put(companion);
> +       return ret;
> +}
> +
> +static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
> +{
> +       struct imx8qxp_pxl2dpi *p2d;
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       int ret;
> +
> +       p2d =3D devm_kzalloc(dev, sizeof(*p2d), GFP_KERNEL);
> +       if (!p2d)
> +               return -ENOMEM;
> +
> +       p2d->regmap =3D syscon_node_to_regmap(np->parent);
> +       if (IS_ERR(p2d->regmap)) {
> +               ret =3D PTR_ERR(p2d->regmap);
> +               if (ret !=3D -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", =
ret);
> +               return ret;
> +       }
> +
> +       ret =3D imx_scu_get_handle(&p2d->ipc_handle);
> +       if (ret) {
> +               if (ret !=3D -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev, "failed to get SCU ipc handle:=
 %d\n",
> +                                                                       r=
et);

CHECK: Alignment should match open parenthesis
#467: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:414:
+            DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
+                                    ret);


> +               return ret;
> +       }
> +
> +       p2d->dev =3D dev;
> +
> +       ret =3D of_property_read_u32(np, "fsl,sc-resource", &p2d->sc_reso=
urce);
> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "failed to get SC resource %d\n", ret)=
;
> +               return ret;
> +       }
> +
> +       p2d->next_bridge =3D imx8qxp_pxl2dpi_find_next_bridge(p2d);
> +       if (IS_ERR(p2d->next_bridge)) {
> +               ret =3D PTR_ERR(p2d->next_bridge);
> +               if (ret !=3D -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev, "failed to find next bridge: %=
d\n",
> +                                                                       r=
et);

CHECK: Alignment should match open parenthesis
#484: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:431:
+            DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
+                                    ret);


> +               return ret;
> +       }
> +
> +       ret =3D imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D imx8qxp_pxl2dpi_parse_dt_companion(p2d);
> +       if (ret)
> +               return ret;
> +
> +       platform_set_drvdata(pdev, p2d);
> +       pm_runtime_enable(dev);
> +
> +       p2d->bridge.driver_private =3D p2d;
> +       p2d->bridge.funcs =3D &imx8qxp_pxl2dpi_bridge_funcs;
> +       p2d->bridge.of_node =3D np;
> +
> +       drm_bridge_add(&p2d->bridge);
> +
> +       return ret;
> +}
> +
> +static int imx8qxp_pxl2dpi_bridge_remove(struct platform_device *pdev)
> +{
> +       struct imx8qxp_pxl2dpi *p2d =3D platform_get_drvdata(pdev);
> +
> +       drm_bridge_remove(&p2d->bridge);
> +
> +       pm_runtime_disable(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id imx8qxp_pxl2dpi_dt_ids[] =3D {
> +       { .compatible =3D "fsl,imx8qxp-pxl2dpi", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8qxp_pxl2dpi_dt_ids);
> +
> +static struct platform_driver imx8qxp_pxl2dpi_bridge_driver =3D {
> +       .probe  =3D imx8qxp_pxl2dpi_bridge_probe,
> +       .remove =3D imx8qxp_pxl2dpi_bridge_remove,
> +       .driver =3D {
> +               .of_match_table =3D imx8qxp_pxl2dpi_dt_ids,
> +               .name =3D DRIVER_NAME,
> +       },
> +};
> +module_platform_driver(imx8qxp_pxl2dpi_bridge_driver);
> +
> +MODULE_DESCRIPTION("i.MX8QXP pixel link to DPI bridge driver");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRIVER_NAME);
> --
> 2.7.4
>
