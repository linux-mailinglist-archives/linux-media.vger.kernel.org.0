Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE58827EB49
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 16:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730367AbgI3OsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 10:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730104AbgI3OsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 10:48:16 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8266EC0613D1
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 07:48:15 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 9A4E1634C8D;
        Wed, 30 Sep 2020 17:47:59 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jmondi@jmondi.org
Subject: [PATCH 3/5] v4l2-fwnode: Don't zero parts of struct v4l2_fwnode_endpoint anymore
Date:   Wed, 30 Sep 2020 17:48:09 +0300
Message-Id: <20200930144811.16612-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't zero parts of the vep argument to v4l2_fwnode_endpoint_parse()
anymore as this can no longer be done while still supporting defaults on
multiple bus types.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index dfc53d11053f..44dd04b05e29 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -416,20 +416,8 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 	enum v4l2_mbus_type mbus_type;
 	int rval;
 
-	if (vep->bus_type == V4L2_MBUS_UNKNOWN) {
-		/* Zero fields from bus union to until the end */
-		memset(&vep->bus, 0,
-		       sizeof(*vep) - offsetof(typeof(*vep), bus));
-	}
-
 	pr_debug("===== begin parsing endpoint %pfw\n", fwnode);
 
-	/*
-	 * Zero the fwnode graph endpoint memory in case we don't end up parsing
-	 * the endpoint.
-	 */
-	memset(&vep->base, 0, sizeof(vep->base));
-
 	fwnode_property_read_u32(fwnode, "bus-type", &bus_type);
 	pr_debug("fwnode video bus type %s (%u), mbus type %s (%u)\n",
 		 v4l2_fwnode_bus_type_to_string(bus_type), bus_type,
-- 
2.27.0

