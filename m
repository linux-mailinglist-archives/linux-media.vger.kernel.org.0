Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3196E2CA8A6
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 17:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389033AbgLAQsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 11:48:03 -0500
Received: from retiisi.eu ([95.216.213.190]:50038 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388811AbgLAQsD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 11:48:03 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id AD38A634C8E;
        Tue,  1 Dec 2020 18:45:12 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 05/30] ccs: Remove remaining support for platform data
Date:   Tue,  1 Dec 2020 18:42:21 +0200
Message-Id: <20201201164246.18003-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
References: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No need to support platform data; remove support for conveying hardware
configuration that way.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index bb3759e2534c..af79d80ebb59 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2860,9 +2860,6 @@ static struct ccs_hwconfig *ccs_get_hwconfig(struct device *dev)
 	int i;
 	int rval;
 
-	if (!fwnode)
-		return dev->platform_data;
-
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return NULL;
-- 
2.27.0

