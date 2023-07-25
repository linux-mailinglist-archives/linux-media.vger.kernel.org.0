Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41CD97622E8
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 22:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbjGYUCt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 16:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbjGYUCs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 16:02:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21D11AA
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 13:02:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E730EBA;
        Tue, 25 Jul 2023 22:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690315307;
        bh=Z6CZgG7T8JEZSovTygTu1oLATimETM1rJjKJucL9X4o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cjOek2R5dn3GjicXsQAURkAyAomfZiuCnAo72dV/8w6O/AEQOIcUOrZeqVcv6SyNb
         o1B8YJt6tJa6DTEWIGXPl0dTPBOtM12s+cdABZp8rFZoU3mLGMzTDFvrTRxKU6wAZF
         k+ExiWwm1a4IDWOz+odaHih0Oc1JOjteePaIAj4M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Fabio Estevam <festevam@denx.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Martin Kepplinger <martink@posteo.de>,
        Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH v3 3/3] media: imx: imx7-media-csi: Include headers explicitly
Date:   Tue, 25 Jul 2023 23:02:49 +0300
Message-Id: <20230725200249.15447-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com>
References: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Include all the headers that the driver needs explicitly instead of
relying on indirect inclusion. While at it, drop a few unneeded headers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 27 ++++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 3aa7978d3f8a..95e9f22f21be 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -3,31 +3,46 @@
  * V4L2 Capture CSI Subdev for Freescale i.MX6UL/L / i.MX7 SOC
  *
  * Copyright (c) 2019 Linaro Ltd
- *
  */
 
 #include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
 #include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/math.h>
-#include <linux/mfd/syscon.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_graph.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
-#include <linux/regmap.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/timekeeping.h>
 #include <linux/types.h>
 
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-fwnode.h>
+#include <media/v4l2-fh.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
+#include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
 
 #define IMX7_CSI_PAD_SINK		0
 #define IMX7_CSI_PAD_SRC		1
-- 
Regards,

Laurent Pinchart

