Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2339D215EB4
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbgGFSif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729972AbgGFSie (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:34 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 465961959;
        Mon,  6 Jul 2020 20:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060693;
        bh=1Kx0S1miAGJb/zbvazeKnA4Q9BILzxAYsIDNhYE+wNw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JDm/bC7ZvaOIoE8kVe0UXZLRDE1e5eQUR8n5uj7yuvqVU2lGlbvUtT+hCpf7LAfBr
         DVpAf4czChCsjXGM4K6L7KNHbN/oDY4iFbRa4wHLzQcabB5shzhT6A6TSk+cCd/uya
         nicKcN7Q+S+uNu96b3vHSsnuhYomvC1KoZVt0z4U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 068/108] media: ti-vpe: cal: Replace number of ports numerical value by macro
Date:   Mon,  6 Jul 2020 21:36:29 +0300
Message-Id: <20200706183709.12238-69-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the CAL_NUM_CSI2_PORTS macro instead of the hardcoded numerical
value 2 to iterate over the CSI-2 ports.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e57ee6010555..617b17133071 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1281,7 +1281,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
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

