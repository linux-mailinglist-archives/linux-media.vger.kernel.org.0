Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C345AE2767
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 02:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408085AbfJXAmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 20:42:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392854AbfJXAmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 20:42:09 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDEE19A1;
        Thu, 24 Oct 2019 02:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571877725;
        bh=cFuZyCc1/MzaKEBr8N7p0S5PpSbBxxJnL5r26LSKeaM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AQcJ9SgPuin+P8nR2OzvPU0X2oHvziedwLNKguPGzIiqIIrpFNDyrVL6ruW+sbmEv
         1uVTPcph14pzitnPz9WOjr7VYgs9vhVJeCpnE4KdgLIZLsPWArPIJQfNJHl8C/LvIN
         Jqbzmc5LEDyFKpw1pq2wWbBXWsl93E40GNwQ4sNE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 2/7] media: imx: imx7_mipi_csis: Print the RESOL_CH0 register
Date:   Thu, 24 Oct 2019 03:41:50 +0300
Message-Id: <20191024004155.32068-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the RESOL_CH0 register to the list of registers printed through the
debugfs debug infrastructure for the driver, as it can be useful to
verify proper configuration of the CSI-2 receiver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 66407b228f8e..a0ba3ed00cd8 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -303,6 +303,7 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 		{ 0x20, "DPHYSTS" },
 		{ 0x10, "INTMSK" },
 		{ 0x40, "CONFIG_CH0" },
+		{ 0x44, "RESOL_CH0" },
 		{ 0xC0, "DBG_CONFIG" },
 		{ 0x38, "DPHYSLAVE_L" },
 		{ 0x3C, "DPHYSLAVE_H" },
-- 
Regards,

Laurent Pinchart

