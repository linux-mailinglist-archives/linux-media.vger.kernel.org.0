Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A9633E813
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 05:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhCQD5S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 23:57:18 -0400
Received: from mail-eopbgr60044.outbound.protection.outlook.com ([40.107.6.44]:61157
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230137AbhCQD45 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 23:56:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrG2m3mU+Tchz4uOwMW9VzJSbA6wfCqWpXnx3HUpjZw5cBmqXAeiNockdrARi2Y3OhEbiD8DdOrkI6gGWZNWInY0vTgUPZ7rJ6Py7SQXaQ1NFRIfvwEbGKDQIEcdddAjQ+SVsJPVOv6ZvbQt27CvRKilCpwtbijHvFEJF0sQpO7iF272JlqjwuyZdcnZylwEfcDyT6OfDstmPOrKGFuo0hMJRrOsI9cSNB9xRmsKA+SgYxSQDFBLDe7M8Kl1My34HJuT8LyX3uBTcim4fB5FYQcv/B+AdKhplRnKmlzpJUqfsigQkFDEJxQn9xHxiTdUBRvQgmZz2hHzxJrR31YK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foOjzm362vWlA6gMUyTTe5YLw0Vaf7u1CrduLC4ATGQ=;
 b=NfzB5gCDNzf6MVunSaE2oGmCDfL+rJBfz7a/zuCAcWL2QhdcBS5KhLJTgpxYMQieD/YA064A1T0ZjrjjsJRhkYpcdYMoE2oWekcMelWA+xN17f5pd0aCB1o6rHeLxhWxHENqQN08CHwWX4Dys4GvBToS6pvSVhsx6LhcHhkAoR34I5jjDbegUG5o+EJ1T69Pz0m49uwf8WoQnrQoVLYDPVkfbDbbJepDOJC5iZ0LGl+PDyKiyPw4hWpukjbm0PGZz29/v5tXqXTszGwupa2YmsK1r5G/nrdfjDpFgnz96Hr8477d8oQ+uIfmkhj5fj/KjLvdIIxZE43e78nQ2GaTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foOjzm362vWlA6gMUyTTe5YLw0Vaf7u1CrduLC4ATGQ=;
 b=NpVtwMOw30q9k0SHXC8CfYCsK3iLhQoPVj2gVpXDgoN28KBLgr+VIKe+TPoq+DotEBHJ6bAYgjNP9op2mZDgf7Gijm8h9/uOyarMiA3qNJKeI2Nw+m/ei9FpKohjbo4drsfknRhEiHhxGPczOAl0TbGMU7uTJ+spCcS3oQq0tVI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6141.eurprd04.prod.outlook.com (2603:10a6:803:f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 03:56:55 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:56:55 +0000
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
Subject: [PATCH v6 06/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel link support
Date:   Wed, 17 Mar 2021 11:42:41 +0800
Message-Id: <1615952569-4711-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:56:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6236c18f-cef2-4832-ab0e-08d8e8f8b421
X-MS-TrafficTypeDiagnostic: VI1PR04MB6141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6141AA68BE04E0DE3E6B6294986A9@VI1PR04MB6141.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uukgWAw1TQ1AYmBS6VyiG+9vrwtKcxZpVgX0eY8ksnx3dHeLLNLddN6Zo/5Qfoljm8aD5M9/j3TnBL385SG4lEX6Ge6nHLyIgdwc8NCas8F7oUowtfjedjhm4aQV8NXBg1DLqIK+hJCol+f+29ee8Rx7YVL1sXaGn+rAbxZ6UfLc9xjJMg1vf9uEMG2yaQvpfDr541SjjhcGkj8m+Olt3JiaQ8SeHl8dhSD1gllgM5hTCVqXUYlZLjQE8RlEeIKQDp4KdAiKzCLBmFERQreikE2J4tx69JDvY3F+QQSiWSlMJwheiaGh6W0H3WCMsOgD386A6VYmKAsus1g8r/+CPDMbmumVJamIaPOWLNkdatx6yflD+S2dZZ8N+Znw+4ZL8pJvpllQSXlLukEdXacyAhHZm1vV2pax7TF5gEzODye5f6LOMSpxCB6MfYKigiMaT6USoP7MXdV/Na98FmOlhBaIcmFgYs/aKyuTQdQo/D8weHAmAjFFHnbWMOZ1VaaHibfQGJs0vZuLzGlb2jzi0PvD64/n6ZOvE53Vg7Op3S0n3naE14DE/h0tMR2SBPtRccCJPWwiywFlybwgbiKL/9NHFKhvueYYup04Tb6IKNQnSF2EDt0EiG9bxrgfTsJH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(8676002)(5660300002)(316002)(36756003)(16526019)(186003)(8936002)(69590400012)(4326008)(956004)(2616005)(2906002)(30864003)(52116002)(6486002)(6512007)(6666004)(478600001)(6506007)(66556008)(66476007)(66946007)(7416002)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lidma2ZxDfhAIDxzZGHAECAOjct9ipX7UAT5auEnlnLmSBVSluqaJGPzVwxP?=
 =?us-ascii?Q?k/4/bjzW3PlatbNJ0lgu/Odc1eQZDy0tAHVsOixlyZjicdSKoX0Z4pcbJKmi?=
 =?us-ascii?Q?h5+lrHsUWEQ+Gdrw3HrCNq/MA0WO8HWXeEgMQMso84Zi2fy7eJfFriYHctTQ?=
 =?us-ascii?Q?fdsrZF4ZI+eQHVpXxdQ7FXMctI6ySAbydP2ZVpLj+mA+LGrWgFjt7be8ZEIf?=
 =?us-ascii?Q?GHQnx0ENkTHIeZOyW1AzZQ4pvIIDfwKdsSVaPMNmuSfcga71enkfLW5DhmYa?=
 =?us-ascii?Q?PtZHg48cEBe8bDevswGDTRXEjNpBf64TYhWbx0PTjJmu9D7sEuO5GE9wRGax?=
 =?us-ascii?Q?usfqnipI6ykRVpp8uROuuLk1k+YynVBx7CQ4jpNTha8M+QhQu0Wd9mu9+BOd?=
 =?us-ascii?Q?f9995BScJoQGj78HLjWJbmW5q4nbwI+FsBdxp2zor3XHK0XavdSvPNOZ+TXE?=
 =?us-ascii?Q?szj9x7srDldGCVaoEm5C/wKcuzNv55mGJnL3DE/BpVxUvxQL1E781VZN5uol?=
 =?us-ascii?Q?I3w5Od0bDfbs/Fgg10RFxve5/JwZQ4qcbSwk+sb6CQu2LJJ889wf1Yvb0G68?=
 =?us-ascii?Q?lQEzCCfynYYEX8q53ndPBGrhJsNjn3wV7jV2EZiWs3NSr1wpo2KcKBLCeaC1?=
 =?us-ascii?Q?OAQBDZ6KFVypDxsR+EzMAZlMWsRPY5YBSyvK7vDiR2GehvkLVJ+vfCmew2qW?=
 =?us-ascii?Q?h/5Z7M6ziDnd2dT/hUJAOCKYvjYbVqD5B5MTka9OgfAoNvN56xuaZXb1nvr6?=
 =?us-ascii?Q?ImSG3SDnxLHq+T3XMOWEXTEzxmny23N7ns59OiFkHcOiGHXN87lEf3yUeu+4?=
 =?us-ascii?Q?Fh1GFD/lyrp7SXQbn00aXQkIWL+CmjhgQsM2WUSswzxPizldqJsyasqd1/i/?=
 =?us-ascii?Q?XORpIcDevlIzh9TnLLunoHLRaLbhJ7OKiiYTBFV3zamxnQ1ARw7NJtuwYMUc?=
 =?us-ascii?Q?8fRkgbNXuH+Vl8FRDT5ihFdGe8xNG4lcFd5ImBHTDMph3RLpo6VnBCvnifkk?=
 =?us-ascii?Q?JscwYaWpXyLuqao6AbGweQKDNxwGkOX0B9arnwURJi2/pDGk/1iZxxPoj8xi?=
 =?us-ascii?Q?4SyvgpMoHKDFxddGVP8cSZsfTDiPi0SH4fuUt3x/NltxhOLI9iLxLnVgOFHe?=
 =?us-ascii?Q?w/JhP66ND/MV/0prK+iqanetZYZJmwmymOd4fSD0UDvXf8qINDdWp5XmNvGe?=
 =?us-ascii?Q?luriP0smE6tZDutbFB1MnxkLrElD/3x5KFSesCZpn85NLVt2SXHulyp+lzH1?=
 =?us-ascii?Q?aabPqRSYoKeq7D9j66h7sL68KRVXnIH5sZVTtKdbSLnExpaz3tJH3DZe+W9D?=
 =?us-ascii?Q?v38hHv0sfb1pfAGrl0kzkUcH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6236c18f-cef2-4832-ab0e-08d8e8f8b421
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:56:54.8811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzH9oYqhF+8350ySLQth7zSOdzMKm++pSry9KMpqBSFwRoss3EEFYyx4sUvYp/cTdRhrNR5e4NnYHr4Y/rV1ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6141
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds a drm bridge driver for i.MX8qm/qxp display pixel link.
The pixel link forms a standard asynchronous linkage between
pixel sources(display controller or camera module) and pixel
consumers(imaging or displays).  It consists of two distinct
functions, a pixel transfer function and a control interface.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* No change.

v4->v5:
* Make a comment occupy a line. (Robert)
* Add Robert's R-b tag.

v3->v4:
* No change.

v2->v3:
* Drop two macros which help define functions and define them directly.
* Properly disable all pixel link controls to POR value by calling
  imx8qxp_pixel_link_disable_all_controls() from
  imx8qxp_pixel_link_bridge_probe().

v1->v2:
* Rewrite the function to find the next bridge by properly using OF APIs
  and dropping unnecessary DT validation. (Rob)

 drivers/gpu/drm/bridge/imx/Kconfig              |   8 +
 drivers/gpu/drm/bridge/imx/Makefile             |   1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 427 ++++++++++++++++++++++++
 3 files changed, 436 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index f1c91b6..4d1f027 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -6,3 +6,11 @@ config DRM_IMX8QXP_PIXEL_COMBINER
 	help
 	  Choose this to enable pixel combiner found in
 	  Freescale i.MX8qm/qxp processors.
+
+config DRM_IMX8QXP_PIXEL_LINK
+	tristate "Freescale i.MX8QM/QXP display pixel link"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable display pixel link found in
+	  Freescale i.MX8qm/qxp processors.
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index 7d7c8d6..c15469f 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
+obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
new file mode 100644
index 00000000..a549624
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -0,0 +1,427 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2020 NXP
+ */
+
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#define DRIVER_NAME		"imx8qxp-display-pixel-link"
+#define PL_MAX_MST_ADDR		3
+#define PL_MAX_NEXT_BRIDGES	2
+
+struct imx8qxp_pixel_link {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct device *dev;
+	struct imx_sc_ipc *ipc_handle;
+	int id;
+	int stream_id;
+	int dc_id;
+	u32 sink_rsc;
+	u32 mst_addr;
+	u8 mst_addr_ctrl;
+	u8 mst_en_ctrl;
+	u8 mst_vld_ctrl;
+	u8 sync_ctrl;
+};
+
+static void imx8qxp_pixel_link_enable_mst_en(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_en_ctrl, true);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			"failed to enable DC%d stream%d pixel link mst_en: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+}
+
+static void imx8qxp_pixel_link_enable_mst_vld(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_vld_ctrl, true);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+		"failed to enable DC%d stream%d pixel link mst_vld: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+}
+
+static void imx8qxp_pixel_link_enable_sync(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->sync_ctrl, true);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			"failed to enable DC%d stream%d pixel link sync: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+}
+
+static int imx8qxp_pixel_link_disable_mst_en(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_en_ctrl, false);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+		"failed to disable DC%d stream%d pixel link mst_en: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+
+	return ret;
+}
+
+static int imx8qxp_pixel_link_disable_mst_vld(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->mst_vld_ctrl, false);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+		"failed to disable DC%d stream%d pixel link mst_vld: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+
+	return ret;
+}
+
+static int imx8qxp_pixel_link_disable_sync(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
+				      pl->sync_ctrl, false);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+			"failed to disable DC%d stream%d pixel link sync: %d\n",
+						pl->dc_id, pl->stream_id, ret);
+
+	return ret;
+}
+
+static void imx8qxp_pixel_link_set_mst_addr(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(pl->ipc_handle,
+				      pl->sink_rsc, pl->mst_addr_ctrl,
+				      pl->mst_addr);
+	if (ret)
+		DRM_DEV_ERROR(pl->dev,
+		    "failed to set DC%d stream%d pixel link mst addr(%u): %d\n",
+		    pl->dc_id, pl->stream_id, pl->mst_addr, ret);
+}
+
+static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
+					    enum drm_bridge_attach_flags flags)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_DEV_ERROR(pl->dev,
+			      "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(pl->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return drm_bridge_attach(bridge->encoder,
+				 pl->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static void
+imx8qxp_pixel_link_bridge_mode_set(struct drm_bridge *bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adjusted_mode)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	imx8qxp_pixel_link_set_mst_addr(pl);
+}
+
+static void imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
+			      struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	imx8qxp_pixel_link_enable_mst_en(pl);
+	imx8qxp_pixel_link_enable_mst_vld(pl);
+	imx8qxp_pixel_link_enable_sync(pl);
+}
+
+static void imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pixel_link *pl = bridge->driver_private;
+
+	imx8qxp_pixel_link_disable_mst_en(pl);
+	imx8qxp_pixel_link_disable_mst_vld(pl);
+	imx8qxp_pixel_link_disable_sync(pl);
+}
+
+static const u32 imx8qxp_pixel_link_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
+	MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
+};
+
+static bool imx8qxp_pixel_link_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts); i++) {
+		if (imx8qxp_pixel_link_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (!imx8qxp_pixel_link_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = output_fmt;
+
+	return input_fmts;
+}
+
+static u32 *
+imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts);
+	return kmemdup(imx8qxp_pixel_link_bus_output_fmts,
+			sizeof(imx8qxp_pixel_link_bus_output_fmts), GFP_KERNEL);
+}
+
+static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.attach			= imx8qxp_pixel_link_bridge_attach,
+	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
+	.atomic_enable		= imx8qxp_pixel_link_bridge_atomic_enable,
+	.atomic_disable		= imx8qxp_pixel_link_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+			imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+			imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts,
+};
+
+static int imx8qxp_pixel_link_disable_all_controls(struct imx8qxp_pixel_link *pl)
+{
+	int ret;
+
+	ret = imx8qxp_pixel_link_disable_mst_en(pl);
+	if (ret)
+		return ret;
+
+	ret = imx8qxp_pixel_link_disable_mst_vld(pl);
+	if (ret)
+		return ret;
+
+	return imx8qxp_pixel_link_disable_sync(pl);
+}
+
+static struct drm_bridge *
+imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
+{
+	struct device_node *np = pl->dev->of_node;
+	struct device_node *port, *remote;
+	struct drm_bridge *next_bridge[PL_MAX_NEXT_BRIDGES];
+	u32 port_id;
+	bool found_port = false;
+	int reg, ep_cnt = 0;
+	/* select the first next bridge by default */
+	int bridge_sel = 0;
+
+	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
+		port = of_graph_get_port_by_id(np, port_id);
+		if (!port)
+			continue;
+
+		if (of_device_is_available(port)) {
+			found_port = true;
+			of_node_put(port);
+			break;
+		}
+
+		of_node_put(port);
+	}
+
+	if (!found_port) {
+		DRM_DEV_ERROR(pl->dev, "no available output port\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
+		remote = of_graph_get_remote_node(np, port_id, reg);
+		if (!remote)
+			continue;
+
+		if (!of_device_is_available(remote->parent)) {
+			DRM_DEV_DEBUG(pl->dev,
+			   "port%u endpoint%u remote parent is not available\n",
+								port_id, reg);
+			of_node_put(remote);
+			continue;
+		}
+
+		next_bridge[ep_cnt] = of_drm_find_bridge(remote);
+		if (!next_bridge[ep_cnt]) {
+			of_node_put(remote);
+			return ERR_PTR(-EPROBE_DEFER);
+		}
+
+		/* specially select the next bridge with companion PXL2DPI */
+		if (of_find_property(remote, "fsl,companion-pxl2dpi", NULL))
+			bridge_sel = ep_cnt;
+
+		ep_cnt++;
+
+		of_node_put(remote);
+	}
+
+	pl->mst_addr = port_id - 1;
+
+	return next_bridge[bridge_sel];
+}
+
+static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
+{
+	struct imx8qxp_pixel_link *pl;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	pl = devm_kzalloc(dev, sizeof(*pl), GFP_KERNEL);
+	if (!pl)
+		return -ENOMEM;
+
+	ret = imx_scu_get_handle(&pl->ipc_handle);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
+									ret);
+		return ret;
+	}
+
+	pl->id = of_alias_get_id(np, "dc_pl");
+	if (pl->id < 0) {
+		DRM_DEV_ERROR(dev,
+			      "failed to get pixel link node alias id: %d\n",
+								pl->id);
+		return pl->id;
+	}
+
+	pl->dev = dev;
+
+	pl->dc_id = pl->id / 2;
+	pl->stream_id = pl->id % 2;
+
+	pl->sink_rsc = pl->dc_id ? IMX_SC_R_DC_1 : IMX_SC_R_DC_0;
+
+	if (pl->stream_id == 0) {
+		pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST1_ADDR;
+		pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST1_ENB;
+		pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST1_VLD;
+		pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL0;
+	} else {
+		pl->mst_addr_ctrl = IMX_SC_C_PXL_LINK_MST2_ADDR;
+		pl->mst_en_ctrl   = IMX_SC_C_PXL_LINK_MST2_ENB;
+		pl->mst_vld_ctrl  = IMX_SC_C_PXL_LINK_MST2_VLD;
+		pl->sync_ctrl     = IMX_SC_C_SYNC_CTRL1;
+	}
+
+	/* disable all controls to POR default */
+	ret = imx8qxp_pixel_link_disable_all_controls(pl);
+	if (ret)
+		return ret;
+
+	pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
+	if (IS_ERR(pl->next_bridge)) {
+		ret = PTR_ERR(pl->next_bridge);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
+									ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, pl);
+
+	pl->bridge.driver_private = pl;
+	pl->bridge.funcs = &imx8qxp_pixel_link_bridge_funcs;
+	pl->bridge.of_node = np;
+
+	drm_bridge_add(&pl->bridge);
+
+	return ret;
+}
+
+static int imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
+{
+	struct imx8qxp_pixel_link *pl = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&pl->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id imx8qxp_pixel_link_dt_ids[] = {
+	{ .compatible = "fsl,imx8qm-dc-pixel-link", },
+	{ .compatible = "fsl,imx8qxp-dc-pixel-link", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qxp_pixel_link_dt_ids);
+
+static struct platform_driver imx8qxp_pixel_link_bridge_driver = {
+	.probe	= imx8qxp_pixel_link_bridge_probe,
+	.remove = imx8qxp_pixel_link_bridge_remove,
+	.driver	= {
+		.of_match_table = imx8qxp_pixel_link_dt_ids,
+		.name = DRIVER_NAME,
+	},
+};
+module_platform_driver(imx8qxp_pixel_link_bridge_driver);
+
+MODULE_DESCRIPTION("i.MX8QXP/QM display pixel link bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.7.4

