Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A709731B5CB
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 09:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhBOH7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 02:59:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhBOH7b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 02:59:31 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894B2C061756
        for <linux-media@vger.kernel.org>; Sun, 14 Feb 2021 23:57:46 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 768E5634C99;
        Mon, 15 Feb 2021 09:56:45 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com
Subject: [PATCH 1/1] ipu3-cio2: Fix pixel-rate derived link frequency
Date:   Mon, 15 Feb 2021 09:57:42 +0200
Message-Id: <20210215075742.12434-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver uses v4l2_get_link_freq() helper to obtain the link frequency
using the LINK_FREQ but also the PIXEL_RATE control. The divisor for the
pixel rate derived link frequency was wrong, missing the bus uses double
data rate. Fix this.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Fixes: 4b6c129e87a3 ("media: ipu3-cio2: Use v4l2_get_link_freq helper")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 6e8c0c230e11..fecef85bd62e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -302,7 +302,7 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
 	if (!q->sensor)
 		return -ENODEV;
 
-	freq = v4l2_get_link_freq(q->sensor->ctrl_handler, bpp, lanes);
+	freq = v4l2_get_link_freq(q->sensor->ctrl_handler, bpp, lanes * 2);
 	if (freq < 0) {
 		dev_err(dev, "error %lld, invalid link_freq\n", freq);
 		return freq;
-- 
2.29.2

