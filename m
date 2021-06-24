Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2933B359D
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 20:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbhFXS2x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 14:28:53 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43740 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhFXS2x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 14:28:53 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 69B1C1F4420C
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 01/12] drm/panel: kd35t133: Add panel orientation support
Date:   Thu, 24 Jun 2021 15:26:01 -0300
Message-Id: <20210624182612.177969-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210624182612.177969-1-ezequiel@collabora.com>
References: <20210624182612.177969-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Parse the device tree rotation specifier, and set a DRM
connector orientation property. The property can then be read
by compositors to apply hardware plane rotation or a GPU transform.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index fe5ac3ef9018..5987d28c874c 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -39,6 +39,7 @@
 struct kd35t133 {
 	struct device *dev;
 	struct drm_panel panel;
+	enum drm_panel_orientation orientation;
 	struct gpio_desc *reset_gpio;
 	struct regulator *vdd;
 	struct regulator *iovcc;
@@ -216,6 +217,7 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 	drm_mode_probed_add(connector, mode);
+	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	return 1;
 }
@@ -258,6 +260,12 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
 		return ret;
 	}
 
+	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
+	if (ret) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
+		return ret;
+	}
+
 	mipi_dsi_set_drvdata(dsi, ctx);
 
 	ctx->dev = dev;
-- 
2.30.0

