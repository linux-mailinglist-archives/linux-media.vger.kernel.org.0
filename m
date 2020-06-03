Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52FD41EC9FE
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgFCHBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:01:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:43304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbgFCHBG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 804302077D;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=eWAJvViYM06bCspTqoBw5aI7xqOFP2eVmb3nVQAQ9wY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QK+/al89zy+82hQBgD2jdShYFfh7VIXPNz3PIkM6AjrLzxAdSNh7J96+jd0ktmnBB
         c8XYlbSGiG4kLnp93+bK/KSUK5FEfy3yUG5Z+C4zTng2WHTcP/JYc8mNKV6+D8oIq+
         iaIXF/TdOI+Gi3d43CxV0BiWOknuBuaQg4Heg1qE=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j84-3J; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/15] media: atomisp: improve IRQ handling debug messages
Date:   Wed,  3 Jun 2020 09:00:47 +0200
Message-Id: <575283fde059cbb42bf4e7b044cafbfe463e9f3b.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When an IRQ is not handled, it is nice to know what's the
reason.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index d06173b62b99..875dd3ce6e48 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -566,7 +566,7 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 
 	if (irq_infos & IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF) {
 		dev_dbg_ratelimited(isp->dev,
-				    "irq:0x%x (IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF)\n",
+				    "irq:0x%x (SOF)\n",
 				    irq_infos);
 		irq_infos &= ~IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF;
 	}
@@ -591,14 +591,14 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 			/* EOF Event does not have the css_pipe returned */
 			asd = __get_asd_from_port(isp, eof_event.event.port);
 			if (!asd) {
-				dev_err(isp->dev, "%s:no subdev.event:%d",
+				dev_err(isp->dev, "%s: ISYS event, but no subdev.event:%d",
 					__func__, eof_event.event.type);
 				continue;
 			}
 
 			atomisp_eof_event(asd, eof_event.event.exp_id);
 			dev_dbg_ratelimited(isp->dev,
-					    "%s EOF exp_id %d, asd %d\n",
+					    "%s ISYS event: EOF exp_id %d, asd %d\n",
 					    __func__, eof_event.event.exp_id,
 					    asd->index);
 		}
@@ -610,7 +610,7 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 
 	spin_unlock_irqrestore(&isp->lock, flags);
 
-	dev_dbg_ratelimited(isp->dev, "irq:0x%x\n", irq_infos);
+	dev_dbg_ratelimited(isp->dev, "irq:0x%x (unhandled)\n", irq_infos);
 
 	return IRQ_WAKE_THREAD;
 
@@ -618,7 +618,8 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 	spin_unlock_irqrestore(&isp->lock, flags);
 
 	if (irq_infos)
-		dev_dbg_ratelimited(isp->dev, "irq:0x%x\n", irq_infos);
+		dev_dbg_ratelimited(isp->dev, "irq:0x%x (ignored, as not streaming anymore)\n",
+				    irq_infos);
 
 	return IRQ_HANDLED;
 }
-- 
2.26.2

