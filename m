Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA7EADC829
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408622AbfJRPKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:10:42 -0400
Received: from retiisi.org.uk ([95.216.213.190]:51488 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405709AbfJRPKl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:10:41 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id D237D634C89;
        Fri, 18 Oct 2019 18:10:06 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/3] omap3isp: Don't restart CCDC if we're about to stop
Date:   Fri, 18 Oct 2019 18:07:18 +0300
Message-Id: <20191018150720.31674-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018150720.31674-1-sakari.ailus@linux.intel.com>
References: <20191018150720.31674-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The omap3isp driver set the new buffer and enabled the CCDC in a situation
a new buffer was available but streaming was about to be stopped on the
CCDC. This lead to frequent system crashes in case there were buffers
queued when streming was being stopped.

Fix this by first checking whether there's an intent to stop streaming and
if there isn't, then set the new buffer and re-enable CCDC.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/omap3isp/ispccdc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/omap3isp/ispccdc.c b/drivers/media/platform/omap3isp/ispccdc.c
index e2f336c715a4..471ae7cdb813 100644
--- a/drivers/media/platform/omap3isp/ispccdc.c
+++ b/drivers/media/platform/omap3isp/ispccdc.c
@@ -1607,6 +1607,11 @@ static int ccdc_isr_buffer(struct isp_ccdc_device *ccdc)
 		return 0;
 	}
 
+	/* Don't restart CCDC if we're just about to stop streaming. */
+	if (ccdc->state == ISP_PIPELINE_STREAM_CONTINUOUS &&
+	    ccdc->stopping & CCDC_STOP_REQUEST)
+		return 0;
+
 	if (!ccdc_has_all_fields(ccdc))
 		return 1;
 
@@ -1661,16 +1666,15 @@ static void ccdc_vd0_isr(struct isp_ccdc_device *ccdc)
 		spin_unlock_irqrestore(&ccdc->lock, flags);
 	}
 
-	if (ccdc->output & CCDC_OUTPUT_MEMORY)
-		restart = ccdc_isr_buffer(ccdc);
-
 	spin_lock_irqsave(&ccdc->lock, flags);
-
 	if (ccdc_handle_stopping(ccdc, CCDC_EVENT_VD0)) {
 		spin_unlock_irqrestore(&ccdc->lock, flags);
 		return;
 	}
 
+	if (ccdc->output & CCDC_OUTPUT_MEMORY)
+		restart = ccdc_isr_buffer(ccdc);
+
 	if (!ccdc->shadow_update)
 		ccdc_apply_controls(ccdc);
 	spin_unlock_irqrestore(&ccdc->lock, flags);
-- 
2.20.1

