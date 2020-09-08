Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31AE5260E1B
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 10:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729378AbgIHIyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 04:54:49 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60116 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729351AbgIHIys (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 04:54:48 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id C0CAB634C8F;
        Tue,  8 Sep 2020 11:54:38 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        niklas.soderlund@ragnatech.se, jacopo@jmondi.org
Subject: [PATCH 3/3] v4l2-fwnode: Document changes usage patterns of v4l2_fwnode_endpoint_parse
Date:   Tue,  8 Sep 2020 11:51:21 +0300
Message-Id: <20200908085121.864-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908085121.864-1-sakari.ailus@linux.intel.com>
References: <20200908085121.864-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document that it is possible to provide defaults for multiple bus types to
v4l2_fwnode_endpoint_parse and v4l2_fwnode_endpoint_alloc_parse. Also
underline the fact that detecting the bus type without bus-type property
is only for the old drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-fwnode.h | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index d04f39b60096..ccaa5693df14 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -226,11 +226,10 @@ struct v4l2_fwnode_connector {
  * call this function once the correct type is found --- with a default
  * configuration valid for that type.
  *
- * As a compatibility means guessing the bus type is also supported by setting
- * @vep.bus_type to V4L2_MBUS_UNKNOWN. The caller may not provide a default
- * configuration in this case as the defaults are specific to a given bus type.
- * This functionality is deprecated and should not be used in new drivers and it
- * is only supported for CSI-2 D-PHY, parallel and Bt.656 buses.
+ * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
+ * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
+ * guessing @vep.bus_type between CSI-2 D-PHY, parallel and Bt.656 busses is
+ * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
  *
  * The function does not change the V4L2 fwnode endpoint state if it fails.
  *
@@ -269,11 +268,10 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
  * call this function once the correct type is found --- with a default
  * configuration valid for that type.
  *
- * As a compatibility means guessing the bus type is also supported by setting
- * @vep.bus_type to V4L2_MBUS_UNKNOWN. The caller may not provide a default
- * configuration in this case as the defaults are specific to a given bus type.
- * This functionality is deprecated and should not be used in new drivers and it
- * is only supported for CSI-2 D-PHY, parallel and Bt.656 buses.
+ * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
+ * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
+ * guessing @vep.bus_type between CSI-2 D-PHY, parallel and Bt.656 busses is
+ * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
  *
  * The function does not change the V4L2 fwnode endpoint state if it fails.
  *
-- 
2.27.0

