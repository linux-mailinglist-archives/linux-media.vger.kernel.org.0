Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6661F8BA9
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgFOAB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbgFOAB1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:27 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 279EF1A80;
        Mon, 15 Jun 2020 02:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179241;
        bh=LdsCtZnYRxjM9FsScK4ESGB8WNzT1289hpg3rAlaGEs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uQaXv1hLcDSPo8Q77A3LbiGOAmTXVPWhJ/SxeNWFmuDkGCE836648HTUexw29aM3c
         c5mLbXcIBrFSFftCL5hcCcxvG+HoT/r5/Gt7pGF2/7/STsGO2DI96WGIQyGbvs7LZr
         Za4xpKjDysMM66pT7Gk7VPom2avlMQYBbqw7mkb8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 067/107] media: ti-vpe: cal: Replace number of ports numerical value by macro
Date:   Mon, 15 Jun 2020 02:59:04 +0300
Message-Id: <20200614235944.17716-68-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the CAL_NUM_CSI2_PORTS macro instead of the hardcoded numerical
value 2 to iterate over the CSI-2 ports.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 26b9f4638084..9fe8abfa1df9 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1274,7 +1274,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		if (status & CAL_HL_IRQ_OCPO_ERR_MASK)
 			dev_err_ratelimited(&cal->pdev->dev, "OCPO ERROR\n");
 
-		for (i = 0; i < 2; ++i) {
+		for (i = 0; i < CAL_NUM_CSI2_PORTS; ++i) {
 			if (status & CAL_HL_IRQ_CIO_MASK(i)) {
 				u32 cio_stat = reg_read(cal,
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
-- 
Regards,

Laurent Pinchart

