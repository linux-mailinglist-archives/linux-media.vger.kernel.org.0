Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95F2215E6D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729815AbgGFSh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45180 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729569AbgGFSh3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:29 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BEF4D6E;
        Mon,  6 Jul 2020 20:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060648;
        bh=JQR+qSdn1OXoo0HEFmuwGwNM7LOkyNoqBL5DERMIRhk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BFV9FZ9ytGYmOW/9wS/tVuwEoikWer6CpixeOy74LBolgir9Ku9SDxA+oKYAW6Cty
         ffSVqj+XemitVEUmJ26F7bNSCOqnHRWejPRSmD6ZizISRetw4rCZu3dBqUrhzhtQPC
         PnrLJF6fF4zOwLU91WXhNXj5IaAzxOBiQfQG+mUE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 001/108] media: ti-vpe: cal: Sort headers alphabetically
Date:   Mon,  6 Jul 2020 21:35:22 +0300
Message-Id: <20200706183709.12238-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorting headers alphabetically helps locating duplicates.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9b18db7af6c3..19425248bd63 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -7,30 +7,31 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/ioctl.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
-#include <linux/delay.h>
 #include <linux/pm_runtime.h>
-#include <linux/slab.h>
-#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <linux/videodev2.h>
-#include <linux/of_device.h>
-#include <linux/of_graph.h>
 
-#include <media/v4l2-fwnode.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
-#include <media/v4l2-ioctl.h>
 #include <media/v4l2-fh.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ioctl.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
+
 #include "cal_regs.h"
 
 #define CAL_MODULE_NAME "cal"
-- 
Regards,

Laurent Pinchart

