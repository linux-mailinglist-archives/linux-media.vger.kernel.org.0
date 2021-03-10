Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97D733399E
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 11:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbhCJKKR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 05:10:17 -0500
Received: from mail-eopbgr30054.outbound.protection.outlook.com ([40.107.3.54]:57230
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231908AbhCJKKB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 05:10:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8JQwnDACW8/7SCWiGJXNN0kgVeDFIkKmtfsKHeZNXZEy04QJIcFKOyp0yqd4P/qpaaGNoQvltq445EfxPc0OFY5Sd0liOvcth3n6rskUmThkSxUeyDIRoKQe3hXW5aRTx8Lm+hL1hzDUKUo2p5QAyaNXAPUHey5e9Jn1Ourp7t7nZgP+vs2VYMlf5MYc6ru9unW48YxtC+a3GRO/098vS4rJ2fMqnjsQEIRDK9OZqedLntA0PAmhcya+EROF715WeOSNTxmpUMywVDeVR0ME/xTWnYRrS8aSt5W9FSmr7zQ9KvFW4QJrz4hvFOW3D+v2xloKFVuO2JVZeTohP6xdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOdbNl8Q3/9eong8LMlu769IEyT7I+G4D0T40NkHEIQ=;
 b=RbwV6vU47SiQx5FRTuXseRq3BiJ637sJM9atyAgWcIXBno6gPqrgiQX0/5l7WgW489I5prw/8ZNy9EQZJnj8Lh/ZqFFCF6TaC0bPu3JCygOu/KUU6b2UNna4WrrEaDyd9Xr1f57qRPH7w7SZOkoqazUoWyjbxUeKRByQ4WEjn8KMwf4U5oKodOnUAB0RNGotUL8mJugSGvhu4ylhYa5GOGBQ//kvYl3Dc5rV4kxxH/uEkJaEocyh5En6UhwOWYnHEPzFNYfr6SIEVTqhJVsSEpqX2TZkgpWKdy0OWdKIWlJcTIjrwfnJ5dw83gbVH9Nhyd48ZT4NIzfdBO9Rflia0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOdbNl8Q3/9eong8LMlu769IEyT7I+G4D0T40NkHEIQ=;
 b=mCWKnkXhXiAjr08P+pyQDNCqDrPUk7AxFTiyWbGiFaLJGHVJ2V7A2MhSGiWTraWF7ukCebw/jt7Wymb7Kt0ltyA04UgXTxUfHIZ3IYL4ZSXVAtn4y/6BrZHpI1I47TzsNrHk1uUoUJBTGRlsJ2hApP8h9pDHDJFIJNeBIH4FzO0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2813.eurprd04.prod.outlook.com (2603:10a6:800:b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Wed, 10 Mar
 2021 10:09:56 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:09:56 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mchehab@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, kishon@ti.com, vkoul@kernel.org,
        robert.foss@linaro.org, lee.jones@linaro.org
Subject: [PATCH v5 09/14] drm/bridge: imx: Add i.MX8qxp pixel link to DPI support
Date:   Wed, 10 Mar 2021 17:55:33 +0800
Message-Id: <1615370138-5673-10-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:202:2e::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:09:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0573ebf2-2493-495f-46ca-08d8e3aca78c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB281334400D560450BE1408AC98919@VI1PR0402MB2813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mt9sKs5JnaTbgMJ/0pYDNnhJFt3G3wJZiCafCtAVe5EGnM+k+Bi3M135qSrBS+hkO9kgxXMnC5yoUSl29rp7ehfeq++jQeBSP4Ha0UhK1Z3OFKxXN/9A9ufbnJP29nJ4oM+I1HvDlemTpxNT1qzM/KquM+Dkiql/+GhAgdLKMZz+AzT2aVGn0ENWTMTEquKLcmyTL8g5yPEwbteBRl6+Ipc6rksaDDbNV1jCkucl1fvQaHxLmtpEybNq6mQxe6O72hGOa5hYIN+rxCvKaZ46sZsWSztAH/furo916rNfwJUtJKjTbSb2miHYekiq3VOM9u9PrfVIMR7vAIqRpuTbJOJsR3rC+C3RSChOZmpO7rLPUk0eUDAEOZM9s3wj+cxAVg/yr8KeKWqTEZxbsWsTLx2DT7mggzt5zn9a1PpzXefP9XC5NWIUT3FJYMmob04xg66JL0u/a7IHr++ZeeE/OIJtyBTOtVyQwXG715pKkNyHf3yskWnklcXQLqfBFqcD3Ih5111cGYRzvA7TEccGUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(8936002)(6512007)(6666004)(26005)(30864003)(36756003)(6506007)(956004)(83380400001)(8676002)(2616005)(5660300002)(52116002)(6486002)(316002)(7416002)(478600001)(186003)(66946007)(2906002)(66476007)(66556008)(16526019)(86362001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZEdmWlNVang5aGJyZHd0TXg3bm5oTHRjTGV5YnNkZVcvWVhPa3dYRVRiZ3VB?=
 =?utf-8?B?ZXlBMk5SdFc4SFNSV0prbklpYXB1dXVvcENzeFUzRkZJWG5OdkJGS0tESTBt?=
 =?utf-8?B?ejJMZmhjM1NYcW5xRWJFdmMrTThkcUxRZCtUeEF2bVVQUFUrY0tJdVVDQ2JU?=
 =?utf-8?B?ZDcyQmJ1Y3RpRkFFZXluejNYNTB2Yjc2YlJsdTFONGFaRW5FNUNacisyVzlL?=
 =?utf-8?B?ZGxoRlM2R3N1QlNXaDhuemExa090M2dxMGJqS2ZzNENCakN2cWVCbU81M08v?=
 =?utf-8?B?Yy9CWVdxeEN2WWl5SUdzME1INGdnS2oyeFdWSDE2RDVJS1B4cVNGUitWbHBr?=
 =?utf-8?B?enNlRWJ4YnNPSkhQdkNMVHQ0WjY3THdEQTJDL1NZRXJBdE4zMG5sdEZ2c1l0?=
 =?utf-8?B?dy9VWGYvRU9TZjZYTEZmd2lVaU9uWG1pNnFadTVLYVA1ZzREK3JzdEZKODE3?=
 =?utf-8?B?dVdkSTJyU1l0SUxNMzgyUkx2MkhDaVQ5cFQ0citCbGRuWTR3TlAyOHY4LzVB?=
 =?utf-8?B?SE1iSHhMMW84enI2RzROUGpwSTllNE1MdG1QZzlUT3RxRjhla1hadkhMTHhs?=
 =?utf-8?B?ZkdxNDBVSnJHOVJZb0NUTEVWbFlDSDJuMTZtWFJmSjdnODU1K1hlb205RWJ2?=
 =?utf-8?B?Umx5VWN0VDA0ZzdjZTV4cmhlOFFPY0dQWjkxeTNaU015bEVENlUzQ1piT0hr?=
 =?utf-8?B?TWRVYjhBdXVYcUNEdnNUeEU3eWRER1dESS9SZnZCNGMxL2Z0MWZCTlBPY1Vp?=
 =?utf-8?B?VzNiNU9HUmtCelZqMS9ESTA5NzFnYmNhTE9tdXliM2hqVUR5N29CTnZHU2or?=
 =?utf-8?B?d1M5Z3h3SmlpS1FzaWZ6bG5nY2x5WDRPeVQyTlF5N1FRWWZNazVLM2FmTFZV?=
 =?utf-8?B?K2NPVXNVTEdGZHRlNVFqUnkvOUxFUkJwT3luYVRlN0V3OUVQWXA3OXlOQlh3?=
 =?utf-8?B?eUs0VFZoeElqdUJaRHdoMllEOGZnZGdWSmNrUVZtQjlLY0tOdWF4eG45UXZq?=
 =?utf-8?B?ZGs1bFBZTGF5Wnh4bE5pU0JNU09DcUZEakorT3hJT3pFc1Frd0NCVVdRdGZ0?=
 =?utf-8?B?MW51QTJvcXREa2RnWXZBT1JXZFVwTkhGa0wvazdqZUZzd3RlZyt2NGVFQTlQ?=
 =?utf-8?B?VGJacktkeXpUZGxzczlqNk1oRFczOFB1SDZ3MFI5Z2JvaU9wSTVDekhDd3U4?=
 =?utf-8?B?aHNGNTdWNElELzNCNmJPSGgvVVpETkVLZWZva3dzSHVJcnpqSUJwZi9nTWtL?=
 =?utf-8?B?R3Byd1lJTUpQUmxxZU12MHZucTl3THNZMmhMTm96Y0tHK2c3VTlWcHNaaTc1?=
 =?utf-8?B?MkptTnBNYjJTeWswck5Ddy9MdWlyU09NR2ZOemUyNUhnM0VNSi81QU5KNUto?=
 =?utf-8?B?R0Z3Q3pwcW9HVGdFamdYWEtHdlFxYjhOaldmRVpMZXlQSGw5UG0yNlVvTGhH?=
 =?utf-8?B?eFZOQUQ4b0dLSG9DZ2FmYXQ3L3o2YXZIM1ViOXlCVUdidSt5QkwwSW0rNm5N?=
 =?utf-8?B?ZjBaWlNjdWhpK1JtWU9FTU9ndUpSVCtVOWVmZ0tJWVpPemlGUkYyNmVtN2dY?=
 =?utf-8?B?MnA3QWFPQ01CV2c2c2tLZkthUVlXdDFibEp0dzJyN1hMTldwK0Q3Y0RHS1ND?=
 =?utf-8?B?SmZldWZvR3ZJVTJFMTQ4SXI1TjQ4SXNORCtreGRaeWVaOVB5bm11VXJzTHcv?=
 =?utf-8?B?aS81L3dTS0puTjRpWlVHQ3hLblVpYzN6eXUxWVZxZkV6TGQ2VitCM3haNnk2?=
 =?utf-8?Q?0NgvqK39ehA+zQjx3aCgV9TSOMHWtU/wI927dH3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0573ebf2-2493-495f-46ca-08d8e3aca78c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:09:56.0122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooSELmXQPJBxT58iXuoDsfn7UaI06EZVIvgZrVFhVkXwSrt+4k2vSpPn/EqWu+EbOtcbY+oJ9vr52A+OdpXpnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2813
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds a drm bridge driver for i.MX8qxp pixel link to display
pixel interface(PXL2DPI).  The PXL2DPI interfaces the pixel link 36-bit
data output and the DSI controller’s MIPI-DPI 24-bit data input, and
inputs of LVDS Display Bridge(LDB) module used in LVDS mode, to remap
the pixel color codings between those modules. The PXL2DPI is purely
combinatorial.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4->v5:
* No change.

v3->v4:
* Use 'fsl,sc-resource' DT property to get the SCU resource ID associated with
  the PXL2DPI instance instead of using alias ID. (Rob)

v2->v3:
* Call syscon_node_to_regmap() to get regmap instead of
  syscon_regmap_lookup_by_phandle().

v1->v2:
* Drop unnecessary port availability check.

 drivers/gpu/drm/bridge/imx/Kconfig           |   8 +
 drivers/gpu/drm/bridge/imx/Makefile          |   1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 485 +++++++++++++++++++++++++++
 3 files changed, 494 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 4d1f027..1ea1ce7 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -14,3 +14,11 @@ config DRM_IMX8QXP_PIXEL_LINK
 	help
 	  Choose this to enable display pixel link found in
 	  Freescale i.MX8qm/qxp processors.
+
+config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
+	tristate "Freescale i.MX8QXP pixel link to display pixel interface"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable pixel link to display pixel interface(PXL2DPI)
+	  found in Freescale i.MX8qxp processor.
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index c15469f..e74dd64 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
+obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
new file mode 100644
index 00000000..6696855
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -0,0 +1,485 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2020 NXP
+ */
+
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#define PXL2DPI_CTRL	0x40
+#define  CFG1_16BIT	0x0
+#define  CFG2_16BIT	0x1
+#define  CFG3_16BIT	0x2
+#define  CFG1_18BIT	0x3
+#define  CFG2_18BIT	0x4
+#define  CFG_24BIT	0x5
+
+#define DRIVER_NAME	"imx8qxp-pxl2dpi"
+
+struct imx8qxp_pxl2dpi {
+	struct regmap *regmap;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct drm_bridge *companion;
+	struct device *dev;
+	struct imx_sc_ipc *ipc_handle;
+	u32 sc_resource;
+	u32 in_bus_format;
+	u32 out_bus_format;
+	u32 pl_sel;
+};
+
+#define bridge_to_p2d(b)	container_of(b, struct imx8qxp_pxl2dpi, bridge)
+
+static int imx8qxp_pxl2dpi_bridge_attach(struct drm_bridge *bridge,
+					 enum drm_bridge_attach_flags flags)
+{
+	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_DEV_ERROR(p2d->dev,
+			      "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(p2d->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return drm_bridge_attach(bridge->encoder,
+				 p2d->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static int
+imx8qxp_pxl2dpi_bridge_atomic_check(struct drm_bridge *bridge,
+				    struct drm_bridge_state *bridge_state,
+				    struct drm_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state)
+{
+	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
+
+	p2d->in_bus_format = bridge_state->input_bus_cfg.format;
+	p2d->out_bus_format = bridge_state->output_bus_cfg.format;
+
+	return 0;
+}
+
+static void
+imx8qxp_pxl2dpi_bridge_mode_set(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
+	struct imx8qxp_pxl2dpi *companion_p2d;
+	int ret;
+
+	ret = pm_runtime_get_sync(p2d->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(p2d->dev,
+			      "failed to get runtime PM sync: %d\n", ret);
+
+	ret = imx_sc_misc_set_control(p2d->ipc_handle, p2d->sc_resource,
+				      IMX_SC_C_PXL_LINK_SEL, p2d->pl_sel);
+	if (ret)
+		DRM_DEV_ERROR(p2d->dev,
+			      "failed to set pixel link selection(%u): %d\n",
+							p2d->pl_sel, ret);
+
+	switch (p2d->out_bus_format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		regmap_write(p2d->regmap, PXL2DPI_CTRL, CFG_24BIT);
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+		regmap_write(p2d->regmap, PXL2DPI_CTRL, CFG2_18BIT);
+		break;
+	default:
+		DRM_DEV_ERROR(p2d->dev,
+			      "unsupported output bus format 0x%08x\n",
+							p2d->out_bus_format);
+	}
+
+	if (p2d->companion) {
+		companion_p2d = bridge_to_p2d(p2d->companion);
+
+		companion_p2d->in_bus_format = p2d->in_bus_format;
+		companion_p2d->out_bus_format = p2d->out_bus_format;
+
+		p2d->companion->funcs->mode_set(p2d->companion, mode,
+							adjusted_mode);
+	}
+}
+
+static void
+imx8qxp_pxl2dpi_bridge_atomic_disable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
+	int ret;
+
+	ret = pm_runtime_put(p2d->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(p2d->dev, "failed to put runtime PM: %d\n", ret);
+
+	if (p2d->companion)
+		p2d->companion->funcs->atomic_disable(p2d->companion,
+							old_bridge_state);
+}
+
+static const u32 imx8qxp_pxl2dpi_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
+};
+
+static bool imx8qxp_pxl2dpi_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qxp_pxl2dpi_bus_output_fmts); i++) {
+		if (imx8qxp_pxl2dpi_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qxp_pxl2dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (!imx8qxp_pxl2dpi_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X36_CPADLO;
+		break;
+	default:
+		kfree(input_fmts);
+		input_fmts = NULL;
+		break;
+	}
+
+	return input_fmts;
+}
+
+static u32 *
+imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qxp_pxl2dpi_bus_output_fmts);
+	return kmemdup(imx8qxp_pxl2dpi_bus_output_fmts,
+			sizeof(imx8qxp_pxl2dpi_bus_output_fmts), GFP_KERNEL);
+}
+
+static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.attach			= imx8qxp_pxl2dpi_bridge_attach,
+	.atomic_check		= imx8qxp_pxl2dpi_bridge_atomic_check,
+	.mode_set		= imx8qxp_pxl2dpi_bridge_mode_set,
+	.atomic_disable		= imx8qxp_pxl2dpi_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+			imx8qxp_pxl2dpi_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+			imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts,
+};
+
+static struct device_node *
+imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
+					   u32 port_id)
+{
+	struct device_node *port, *ep;
+	int ep_cnt;
+
+	port = of_graph_get_port_by_id(p2d->dev->of_node, port_id);
+	if (!port) {
+		DRM_DEV_ERROR(p2d->dev, "failed to get port@%u\n", port_id);
+		return ERR_PTR(-ENODEV);
+	}
+
+	ep_cnt = of_get_available_child_count(port);
+	if (ep_cnt == 0) {
+		DRM_DEV_ERROR(p2d->dev, "no available endpoints of port@%u\n",
+								port_id);
+		ep = ERR_PTR(-ENODEV);
+		goto out;
+	} else if (ep_cnt > 1) {
+		DRM_DEV_ERROR(p2d->dev,
+			"invalid available endpoints of port@%u\n", port_id);
+		ep = ERR_PTR(-ENOTSUPP);
+		goto out;
+	}
+
+	ep = of_get_next_available_child(port, NULL);
+	if (!ep) {
+		DRM_DEV_ERROR(p2d->dev,
+			      "failed to get available endpoint of port@%u\n",
+								port_id);
+		ep = ERR_PTR(-ENODEV);
+		goto out;
+	}
+out:
+	of_node_put(port);
+	return ep;
+}
+
+static struct drm_bridge *
+imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
+{
+	struct device_node *ep, *remote;
+	struct drm_bridge *next_bridge;
+	int ret;
+
+	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
+	if (IS_ERR(ep)) {
+		ret = PTR_ERR(ep);
+		return ERR_PTR(ret);
+	}
+
+	remote = of_graph_get_remote_port_parent(ep);
+	if (!remote || !of_device_is_available(remote)) {
+		DRM_DEV_ERROR(p2d->dev, "no available remote\n");
+		next_bridge = ERR_PTR(-ENODEV);
+		goto out;
+	} else if (!of_device_is_available(remote->parent)) {
+		DRM_DEV_ERROR(p2d->dev, "remote parent is not available\n");
+		next_bridge = ERR_PTR(-ENODEV);
+		goto out;
+	}
+
+	next_bridge = of_drm_find_bridge(remote);
+	if (!next_bridge) {
+		next_bridge = ERR_PTR(-EPROBE_DEFER);
+		goto out;
+	}
+out:
+	of_node_put(remote);
+	of_node_put(ep);
+
+	return next_bridge;
+}
+
+static int imx8qxp_pxl2dpi_set_pixel_link_sel(struct imx8qxp_pxl2dpi *p2d)
+{
+	struct device_node *ep;
+	struct of_endpoint endpoint;
+	int ret;
+
+	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 0);
+	if (IS_ERR(ep))
+		return PTR_ERR(ep);
+
+	ret = of_graph_parse_endpoint(ep, &endpoint);
+	if (ret) {
+		DRM_DEV_ERROR(p2d->dev,
+			      "failed to parse endpoint of port@0: %d\n", ret);
+		goto out;
+	}
+
+	p2d->pl_sel = endpoint.id;
+out:
+	of_node_put(ep);
+
+	return ret;
+}
+
+static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
+{
+	struct imx8qxp_pxl2dpi *companion_p2d;
+	struct device *dev = p2d->dev;
+	struct device_node *companion;
+	struct device_node *port1, *port2;
+	const struct of_device_id *match;
+	int dual_link;
+	int ret = 0;
+
+	/* Locate the companion PXL2DPI for dual-link operation, if any. */
+	companion = of_parse_phandle(dev->of_node, "fsl,companion-pxl2dpi", 0);
+	if (!companion)
+		return 0;
+
+	if (!of_device_is_available(companion)) {
+		DRM_DEV_ERROR(dev, "companion PXL2DPI is not available\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	/*
+	 * Sanity check: the companion bridge must have the same compatible
+	 * string.
+	 */
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!of_device_is_compatible(companion, match->compatible)) {
+		DRM_DEV_ERROR(dev, "companion PXL2DPI is incompatible\n");
+		ret = -ENXIO;
+		goto out;
+	}
+
+	p2d->companion = of_drm_find_bridge(companion);
+	if (!p2d->companion) {
+		ret = -EPROBE_DEFER;
+		DRM_DEV_DEBUG_DRIVER(p2d->dev,
+				"failed to find companion bridge: %d\n", ret);
+		goto out;
+	}
+
+	companion_p2d = bridge_to_p2d(p2d->companion);
+
+	/*
+	 * We need to work out if the sink is expecting us to function in
+	 * dual-link mode.  We do this by looking at the DT port nodes that
+	 * the next bridges are connected to.  If they are marked as expecting
+	 * even pixels and odd pixels than we need to use the companion PXL2DPI.
+	 */
+	port1 = of_graph_get_port_by_id(p2d->next_bridge->of_node, 1);
+	port2 = of_graph_get_port_by_id(companion_p2d->next_bridge->of_node, 1);
+	dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
+	of_node_put(port1);
+	of_node_put(port2);
+
+	if (dual_link < 0) {
+		ret = dual_link;
+		DRM_DEV_ERROR(dev, "failed to get dual link pixel order: %d\n",
+									ret);
+		goto out;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev,
+		"dual-link configuration detected (companion bridge %pOF)\n",
+								companion);
+out:
+	of_node_put(companion);
+	return ret;
+}
+
+static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
+{
+	struct imx8qxp_pxl2dpi *p2d;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	p2d = devm_kzalloc(dev, sizeof(*p2d), GFP_KERNEL);
+	if (!p2d)
+		return -ENOMEM;
+
+	p2d->regmap = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(p2d->regmap)) {
+		ret = PTR_ERR(p2d->regmap);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
+		return ret;
+	}
+
+	ret = imx_scu_get_handle(&p2d->ipc_handle);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
+									ret);
+		return ret;
+	}
+
+	p2d->dev = dev;
+
+	ret = of_property_read_u32(np, "fsl,sc-resource", &p2d->sc_resource);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to get SC resource %d\n", ret);
+		return ret;
+	}
+
+	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
+	if (IS_ERR(p2d->next_bridge)) {
+		ret = PTR_ERR(p2d->next_bridge);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
+									ret);
+		return ret;
+	}
+
+	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
+	if (ret)
+		return ret;
+
+	ret = imx8qxp_pxl2dpi_parse_dt_companion(p2d);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, p2d);
+	pm_runtime_enable(dev);
+
+	p2d->bridge.driver_private = p2d;
+	p2d->bridge.funcs = &imx8qxp_pxl2dpi_bridge_funcs;
+	p2d->bridge.of_node = np;
+
+	drm_bridge_add(&p2d->bridge);
+
+	return ret;
+}
+
+static int imx8qxp_pxl2dpi_bridge_remove(struct platform_device *pdev)
+{
+	struct imx8qxp_pxl2dpi *p2d = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&p2d->bridge);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id imx8qxp_pxl2dpi_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-pxl2dpi", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qxp_pxl2dpi_dt_ids);
+
+static struct platform_driver imx8qxp_pxl2dpi_bridge_driver = {
+	.probe	= imx8qxp_pxl2dpi_bridge_probe,
+	.remove = imx8qxp_pxl2dpi_bridge_remove,
+	.driver	= {
+		.of_match_table = imx8qxp_pxl2dpi_dt_ids,
+		.name = DRIVER_NAME,
+	},
+};
+module_platform_driver(imx8qxp_pxl2dpi_bridge_driver);
+
+MODULE_DESCRIPTION("i.MX8QXP pixel link to DPI bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.7.4

