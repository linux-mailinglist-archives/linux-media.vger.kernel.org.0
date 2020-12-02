Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B492CC4DA
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389298AbgLBSP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:15:26 -0500
Received: from retiisi.eu ([95.216.213.190]:33496 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389384AbgLBSP0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:15:26 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B3D2F634CD8;
        Wed,  2 Dec 2020 20:08:33 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 37/38] ccs-pll: Print pixel rates
Date:   Wed,  2 Dec 2020 20:06:40 +0200
Message-Id: <20201202180641.17401-38-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
References: <20201202180641.17401-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Print pixel rates on CSI-2 bus as well as in pixel array as the variation
allowed in PLL capabilities makes this non-trivial to figure out
otherwise.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 5a0162347777..eb7b6f01f623 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -119,6 +119,11 @@ static void print_pll(struct device *dev, struct ccs_pll *pll)
 		}
 	}
 
+	dev_dbg(dev, "pixel rate in pixel array:\t%u\n",
+		pll->pixel_rate_pixel_array);
+	dev_dbg(dev, "pixel rate on CSI-2 bus:\t%u\n",
+		pll->pixel_rate_csi);
+
 	dev_dbg(dev, "flags%s%s%s%s%s%s%s%s%s\n",
 		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
 		pll->flags & PLL_FL(LINK_DECOUPLED) ? " link-decoupled" : "",
-- 
2.27.0

