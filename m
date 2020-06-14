Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CFA1F8BA7
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbgFOAB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728185AbgFOABZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:25 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B57A2159;
        Mon, 15 Jun 2020 02:00:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179240;
        bh=kMRoPymRl0zJVEuqO0RagXmERW8NfPSOhHCNq33nWDA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nObWn9Lx53B8+c3Dl+ZyrgoOXngk5cbzCsl1eyOjkYd0fyfPPxKK00CDxUuODAlav
         SleeblfrsI6VrNf9KJ+LBHws2EQSqDeCRlRpxgVoWbp5sYvbjxXTaQiIwscPxvV9Mw
         aByrFgTGGgRooMjP+c+Se50mrPc0izu7Dz38Wxc4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 065/107] media: ti-vpe: cal: Move CAL_NUM_CSI2_PORTS from cal_regs.h to cal.c
Date:   Mon, 15 Jun 2020 02:59:02 +0300
Message-Id: <20200614235944.17716-66-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CAL_NUM_CSI2_PORTS macro isn't a register definition. Move it to
cal.c, and fix indentation of the other macros while at it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 7 ++++---
 drivers/media/platform/ti-vpe/cal_regs.h | 2 --
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 0ce627b668ab..518f8af616b6 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -74,10 +74,11 @@ MODULE_PARM_DESC(debug, "activates debug info");
 #define phy_err(phy, fmt, arg...)	\
 	cal_err((phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
 
-#define CAL_NUM_CONTEXT 2
+#define CAL_NUM_CONTEXT			2
+#define CAL_NUM_CSI2_PORTS		2
 
-#define MAX_WIDTH_BYTES (8192 * 8)
-#define MAX_HEIGHT_LINES 16383
+#define MAX_WIDTH_BYTES			(8192 * 8)
+#define MAX_HEIGHT_LINES		16383
 
 /* ------------------------------------------------------------------
  *	Format Handling
diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index b551e67d5d41..f752096dcf7f 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -34,8 +34,6 @@
  */
 #define DRA72_CAL_PRE_ES2_LDO_DISABLE BIT(0)
 
-#define CAL_NUM_CSI2_PORTS		2
-
 /* CAL register offsets */
 
 #define CAL_HL_REVISION			0x0000
-- 
Regards,

Laurent Pinchart

