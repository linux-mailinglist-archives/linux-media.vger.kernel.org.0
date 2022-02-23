Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803D34C1200
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 12:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235255AbiBWL4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 06:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237222AbiBWL4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 06:56:51 -0500
Received: from hillosipuli.retiisi.eu (retiisi.eu [95.216.213.190])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86AF99EE4
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 03:56:23 -0800 (PST)
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 1EFF2634C91;
        Wed, 23 Feb 2022 13:56:21 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 1/2] v4l: fwnode: Drop redunant -ENODATA check in property reference parsing
Date:   Wed, 23 Feb 2022 13:54:33 +0200
Message-Id: <20220223115434.21316-2-sakari.ailus@linux.intel.com>
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

The check of -ENODATA return value from
fwnode_property_get_reference_args() was made redundant by commit
c343bc2ce2c6 ("ACPI: properties: Align return codes of
__acpi_node_get_property_reference()"). -ENOENT remains to be used to
signal there are no further entries.

Remove the check for -ENODATA.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 71dcc9a96535..ae140443847b 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -903,11 +903,7 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
 	if (!index)
 		return -ENOENT;
 
-	/*
-	 * Note that right now both -ENODATA and -ENOENT may signal
-	 * out-of-bounds access. Return the error in cases other than that.
-	 */
-	if (ret != -ENOENT && ret != -ENODATA)
+	if (ret != -ENOENT)
 		return ret;
 
 	for (index = 0;
-- 
2.30.2

