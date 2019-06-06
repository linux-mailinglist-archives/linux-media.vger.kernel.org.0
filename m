Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71750374C4
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbfFFNCa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:02:30 -0400
Received: from retiisi.org.uk ([95.216.213.190]:49874 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727193AbfFFNCa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 09:02:30 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 0D281634C86;
        Thu,  6 Jun 2019 16:02:18 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, niklas.soderlund@ragnatech.se
Subject: [PATCH v2 7/9] ipu3-cio2: Clean up notifier's subdev list if parsing endpoints fails
Date:   Thu,  6 Jun 2019 16:02:23 +0300
Message-Id: <20190606130225.10751-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The notifier must be cleaned up whenever parsing endpoints fails. Do that
to avoid a memory leak in that case.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index c1d133e17e4b..373970f812f4 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1504,7 +1504,7 @@ static int cio2_notifier_init(struct cio2_device *cio2)
 		sizeof(struct sensor_async_subdev),
 		cio2_fwnode_parse);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	if (list_empty(&cio2->notifier.asd_list))
 		return -ENODEV;	/* no endpoint */
@@ -1514,9 +1514,13 @@ static int cio2_notifier_init(struct cio2_device *cio2)
 	if (ret) {
 		dev_err(&cio2->pci_dev->dev,
 			"failed to register async notifier : %d\n", ret);
-		v4l2_async_notifier_cleanup(&cio2->notifier);
+		goto out;
 	}
 
+out:
+	if (ret)
+		v4l2_async_notifier_cleanup(&cio2->notifier);
+
 	return ret;
 }
 
-- 
2.11.0

