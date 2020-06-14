Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1284A1F8BC0
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbgFOAB7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728237AbgFOAB5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:57 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEEDE2146;
        Mon, 15 Jun 2020 02:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179253;
        bh=uwxecfi/U6Rc/2Zvq7uB83IpRY1ieyE7JBsWLoSypgs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UP/s0HUuonc3KLr30TDrX1gEbL6VrjGn/wJxvAeB24jsQNleinuHCTEhpRoS792X7
         VPM5xVXOWNG/9r/+p3MD3XXBWqKGiN6Lxmne6vu05sBvcw/NFHvn8nUbzEiMPe9tLT
         7gDOSOiLaKKZqOY+uZChJm0Nzr3oGC6x9WFw6OSo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 088/107] media: ti-vpe: cal: Replace hardcoded BIT() value with macro
Date:   Mon, 15 Jun 2020 02:59:25 +0300
Message-Id: <20200614235944.17716-89-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the hardcoded BIT(3) value with CAL_CSI2_PPI_CTRL_FRAME_MASK to
increase readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 9be432ff87b2..c69c26e88a1d 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -478,7 +478,8 @@ void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
 
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

