Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C56027EB4C
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 16:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730503AbgI3OsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 10:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730427AbgI3OsR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 10:48:17 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE04C061755
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 07:48:17 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id BFE88634C8F;
        Wed, 30 Sep 2020 17:47:59 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jmondi@jmondi.org
Subject: [PATCH 5/5] v4l2-fwnode: Say it's fine to use v4l2_fwnode_endpoint_parse
Date:   Wed, 30 Sep 2020 17:48:11 +0300
Message-Id: <20200930144811.16612-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Earlier it was expected that there would be more variable size endpoint
properties and that most if not all drivers would need them. For that
reason it was expected also that v4l2_fwnode_endpoint_parse would no
longer be needed.

What actually happened that not all drivers require "link-frequencies",
the only variable size media endpoint property without a small upper
limit. Therefore drivers that do not need that information are fine using
v4l2_fwnode_endpoint_parse. So don't tell drivers to use
v4l2_fwnode_endpoint_alloc_parse in all cases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-fwnode.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 0c28dc11e829..cbd872e59f8e 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -245,8 +245,8 @@ struct v4l2_fwnode_connector {
  * The function does not change the V4L2 fwnode endpoint state if it fails.
  *
  * NOTE: This function does not parse properties the size of which is variable
- * without a low fixed limit. Please use v4l2_fwnode_endpoint_alloc_parse() in
- * new drivers instead.
+ * without a low fixed limit. Please use v4l2_fwnode_endpoint_alloc_parse() if
+ * you need properties of variable size.
  *
  * Return: %0 on success or a negative error code on failure:
  *	   %-ENOMEM on memory allocation failure
-- 
2.27.0

