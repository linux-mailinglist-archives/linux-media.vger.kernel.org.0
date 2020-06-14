Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F671F8B65
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgFOAAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgFOAAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A3FC05BD43
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 17:00:12 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5AFF2C0;
        Mon, 15 Jun 2020 02:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179211;
        bh=yNPVrIcUgn+1M4//khLxyGqzrNHTly8mRMWo69lobCU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jOQmZC708FshyPpCtYKdl+aqFUwbVfFwFAEMwEF3vUEqOQqmx9BhBcCCVnXGNanwg
         ud8q0un5cKpiWvdtz1cpoTsJQno9iYuOOmUI2vK2nmk6vrtk5Y6dwEpj9dZJmOJt7N
         AhD7D7L2pPUOzZt6oN/VNbp3WoHzJHePr9/pRmuk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 001/107] media: ti-vpe: cal: Sort headers alphabetically
Date:   Mon, 15 Jun 2020 02:57:58 +0300
Message-Id: <20200614235944.17716-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorting headers alphabetically helps locating duplicates.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

