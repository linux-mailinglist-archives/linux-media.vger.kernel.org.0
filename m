Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3874E25AADE
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 14:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgIBMKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 08:10:04 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60576 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726124AbgIBMKC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 08:10:02 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id A9D58634C8C
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 15:09:37 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] v4l2-fwnode: Use debug level for printing link frequencies
Date:   Wed,  2 Sep 2020 15:05:18 +0300
Message-Id: <20200902120518.3405-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pr_info() was accidentally used to print the link frequencies whereas the
rest of the information is printed on debug level. Fix that by using
pr_debug() also for link frequencies.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index a4c3c77c1894..d7bbe33840cb 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -547,8 +547,8 @@ int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
 		}
 
 		for (i = 0; i < vep->nr_of_link_frequencies; i++)
-			pr_info("link-frequencies %u value %llu\n", i,
-				vep->link_frequencies[i]);
+			pr_debug("link-frequencies %u value %llu\n", i,
+				 vep->link_frequencies[i]);
 	}
 
 	pr_debug("===== end parsing endpoint %pfw\n", fwnode);
-- 
2.27.0

