Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67EFA599C1
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 14:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfF1MBC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 08:01:02 -0400
Received: from retiisi.org.uk ([95.216.213.190]:32972 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726957AbfF1MA6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 08:00:58 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 28E63634C89;
        Fri, 28 Jun 2019 15:00:41 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, niklas.soderlund@ragnatech.se
Subject: [PATCH v4 7/8] ipu3-cio2: Proceed with notifier init even if there are no subdevs
Date:   Fri, 28 Jun 2019 15:00:53 +0300
Message-Id: <20190628120054.11818-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190628120054.11818-1-sakari.ailus@linux.intel.com>
References: <20190628120054.11818-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The notifier may be registered even if there are no subdevs. Do that to
simplify the code.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 373970f812f4..690d3bd08ddd 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1506,9 +1506,10 @@ static int cio2_notifier_init(struct cio2_device *cio2)
 	if (ret < 0)
 		goto out;
 
-	if (list_empty(&cio2->notifier.asd_list))
-		return -ENODEV;	/* no endpoint */
-
+	/*
+	 * Proceed even without sensors connected to allow the device to
+	 * suspend.
+	 */
 	cio2->notifier.ops = &cio2_async_ops;
 	ret = v4l2_async_notifier_register(&cio2->v4l2_dev, &cio2->notifier);
 	if (ret) {
@@ -1815,8 +1816,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 
 	/* Register notifier for subdevices we care */
 	r = cio2_notifier_init(cio2);
-	/* Proceed without sensors connected to allow the device to suspend. */
-	if (r && r != -ENODEV)
+	if (r)
 		goto fail_cio2_queue_exit;
 
 	r = devm_request_irq(&pci_dev->dev, pci_dev->irq, cio2_irq,
-- 
2.11.0

