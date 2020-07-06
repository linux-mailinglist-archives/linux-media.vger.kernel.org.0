Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9505D215ECD
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730020AbgGFSjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730001AbgGFSjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:03 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D8CC2165;
        Mon,  6 Jul 2020 20:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060704;
        bh=9MlnoAZtJ+Qpn4SOYDiulmN1AGhGk3w0WLJpplDZJ0Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fLf+qnczDI0moXDW52nWhMWhdF4FAG1N/st0126RSxbhdERbfs3oi0rsWU5ewJnYc
         y6eACBPnvXkXCMGTcma1As3vhr4ok0a/PcC4mpwRg3Vjj3JmrXcagQEszQXds2vB44
         Hf2Ua662TY9HUF4EgEijxoqD+L6PKxbwV14wNo3Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 089/108] media: ti-vpe: cal: Replace hardcoded BIT() value with macro
Date:   Mon,  6 Jul 2020 21:36:50 +0300
Message-Id: <20200706183709.12238-90-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the hardcoded BIT(3) value with CAL_CSI2_PPI_CTRL_FRAME_MASK to
increase readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 1c9ce30eb7af..6af09d4c0049 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -485,7 +485,8 @@ void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
 
 void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
 {
-	cal_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance), BIT(3));
+	cal_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
+		  CAL_CSI2_PPI_CTRL_FRAME_MASK);
 	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
 			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
-- 
Regards,

Laurent Pinchart

