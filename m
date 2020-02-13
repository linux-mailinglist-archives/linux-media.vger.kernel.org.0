Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 537D315BC05
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 10:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbgBMJth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 04:49:37 -0500
Received: from retiisi.org.uk ([95.216.213.190]:59664 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729588AbgBMJtg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 04:49:36 -0500
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 358C6634C8C
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 11:49:18 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/7] omap3isp: Prevent enabling CCDC when stopping streaming
Date:   Thu, 13 Feb 2020 11:49:28 +0200
Message-Id: <20200213094934.18595-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213094934.18595-1-sakari.ailus@linux.intel.com>
References: <20200213094934.18595-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit ... prevented restarting CCDC through its interrupt handler when
it's about to be disabled. It missed to address the case when CCDC might
be enabled due to queueing a buffer. Do that now.

Fixes: dd12ed17ce9e ("omap3isp: Don't restart CCDC if we're about to stop")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/omap3isp/ispccdc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/omap3isp/ispccdc.c b/drivers/media/platform/omap3isp/ispccdc.c
index 471ae7cdb813..0fbb2aa6dd2c 100644
--- a/drivers/media/platform/omap3isp/ispccdc.c
+++ b/drivers/media/platform/omap3isp/ispccdc.c
@@ -1312,6 +1312,10 @@ static void __ccdc_enable(struct isp_ccdc_device *ccdc, int enable)
 {
 	struct isp_device *isp = to_isp_device(ccdc);
 
+	/* Avoid restarting the CCDC when streaming is stopping. */
+	if (enable && ccdc->stopping & CCDC_STOP_REQUEST)
+		return;
+
 	isp_reg_clr_set(isp, OMAP3_ISP_IOMEM_CCDC, ISPCCDC_PCR,
 			ISPCCDC_PCR_EN, enable ? ISPCCDC_PCR_EN : 0);
 
-- 
2.20.1

