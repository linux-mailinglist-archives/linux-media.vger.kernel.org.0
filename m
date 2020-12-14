Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E032DA2AC
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 22:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407860AbgLNVnL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 16:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392109AbgLNVnK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 16:43:10 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B022C0613D6
        for <linux-media@vger.kernel.org>; Mon, 14 Dec 2020 13:41:25 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D06B9634C87
        for <linux-media@vger.kernel.org>; Mon, 14 Dec 2020 23:40:48 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] v4l: fwnode: v4l2_async_notifier_parse_fwnode_endpoints is deprecated
Date:   Mon, 14 Dec 2020 23:33:48 +0200
Message-Id: <20201214213348.19675-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document that v4l2_async_notifier_parse_fwnode_endpoints() is deprecated.
Its functionality has been replaced by other, better functions. Also add a
reference to an example if someone ends up wandering here.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-fwnode.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 4365430eea6f..d0a1293379ab 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -453,6 +453,10 @@ typedef int (*parse_endpoint_func)(struct device *dev,
  * @parse_endpoint: Driver's callback function called on each V4L2 fwnode
  *		    endpoint. Optional.
  *
+ * DEPRECATED! This function is deprecated. Don't use it in new drivers.
+ * Instead see an example in cio2_parse_firmware() function in
+ * drivers/media/pci/intel/ipu3/ipu3-cio2.c .
+ *
  * Parse the fwnode endpoints of the @dev device and populate the async sub-
  * devices list in the notifier. The @parse_endpoint callback function is
  * called for each endpoint with the corresponding async sub-device pointer to
-- 
2.29.2

