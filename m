Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482BF4C1202
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 12:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240047AbiBWL4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 06:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240025AbiBWL4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 06:56:51 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0886699EF3
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 03:56:24 -0800 (PST)
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 330C0634C93;
        Wed, 23 Feb 2022 13:56:21 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 2/2] v4l: fwnode: Remove now-redundant loop from v4l2_fwnode_parse_reference()
Date:   Wed, 23 Feb 2022 13:54:34 +0200
Message-Id: <20220223115434.21316-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223115434.21316-1-sakari.ailus@linux.intel.com>
References: <20220223115434.21316-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_fwnode_parse_reference() relied on counting the number of references
for async array memory allocation. The array is long gone so remove
counting the references now.

This also changes how the function arrives in different unsuccessful
return values but the functionality remains unchanged.

Also the check for -ENODATA is removed, it was made redundant by commit
c343bc2ce2c6 ("ACPI: properties: Align return codes of
__acpi_node_get_property_reference()").

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index ae140443847b..afceb35e500c 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -894,21 +894,8 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
 	int ret;
 
 	for (index = 0;
-	     !(ret = fwnode_property_get_reference_args(dev_fwnode(dev),
-							prop, NULL, 0,
-							index, &args));
-	     index++)
-		fwnode_handle_put(args.fwnode);
-
-	if (!index)
-		return -ENOENT;
-
-	if (ret != -ENOENT)
-		return ret;
-
-	for (index = 0;
-	     !fwnode_property_get_reference_args(dev_fwnode(dev), prop, NULL,
-						 0, index, &args);
+	     !(ret = fwnode_property_get_reference_args(dev_fwnode(dev), prop,
+							NULL, 0, index, &args));
 	     index++) {
 		struct v4l2_async_subdev *asd;
 
@@ -924,7 +911,12 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
 		}
 	}
 
-	return 0;
+	/* -ENOENT here means successful parsing */
+	if (ret != -ENOENT)
+		return ret;
+
+	/* Return -ENOENT if no references were found */
+	return index ? 0 : -ENOENT;
 }
 
 /*
-- 
2.30.2

