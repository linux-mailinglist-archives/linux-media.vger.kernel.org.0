Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714B427EB48
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 16:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730363AbgI3OsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 10:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730200AbgI3OsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 10:48:16 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06CFC0613D3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 07:48:15 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id ACA29634C8E;
        Wed, 30 Sep 2020 17:47:59 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, jmondi@jmondi.org
Subject: [PATCH 4/5] v4l2-fwnode: Rework v4l2_fwnode_endpoint_parse documentation
Date:   Wed, 30 Sep 2020 17:48:10 +0300
Message-Id: <20200930144811.16612-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework the documentation of v4l2_fwnode_endpoint_parse for better
readability, usefulness and correctness.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-fwnode.h | 62 ++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 0f9a768b1a8d..0c28dc11e829 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -219,17 +219,26 @@ struct v4l2_fwnode_connector {
  * @vep: pointer to the V4L2 fwnode data structure
  *
  * This function parses the V4L2 fwnode endpoint specific parameters from the
- * firmware. The caller is responsible for assigning @vep.bus_type to a valid
- * media bus type. The caller may also set the default configuration for the
- * endpoint --- a configuration that shall be in line with the DT binding
- * documentation. Should a device support multiple bus types, the caller may
- * call this function once the correct type is found --- with a default
- * configuration valid for that type.
- *
- * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
- * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
- * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
- * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
+ * firmware. There are two ways to use this function, either by letting it
+ * obtain the type of the bus (by setting the @vep.bus_type field to
+ * V4L2_MBUS_UNKNOWN) or specifying the bus type explicitly to one of the &enum
+ * v4l2_mbus_type types.
+ *
+ * When @vep.bus_type is V4L2_MBUS_UNKNOWN, the function will use the "bus-type"
+ * property to determine the type when it is available. The caller is
+ * responsible for validating the contents of @vep.bus_type field after the call
+ * returns.
+ *
+ * As a deprecated functionality to support older DT bindings without "bus-type"
+ * property for devices that support multiple types, if the "bus-type" property
+ * does not exist, the function will attempt to guess the type based on the
+ * endpoint properties available. NEVER RELY ON GUESSING THE BUS TYPE IN NEW
+ * DRIVERS OR BINDINGS.
+ *
+ * It is also possible to set @vep.bus_type corresponding to an actual bus. In
+ * this case the function will only attempt to parse properties related to this
+ * bus, and it will return an error if the value of the "bus-type" property
+ * corresponds to a different bus.
  *
  * The caller is required to initialise all fields of @vep.
  *
@@ -263,17 +272,26 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
  * @vep: pointer to the V4L2 fwnode data structure
  *
  * This function parses the V4L2 fwnode endpoint specific parameters from the
- * firmware. The caller is responsible for assigning @vep.bus_type to a valid
- * media bus type. The caller may also set the default configuration for the
- * endpoint --- a configuration that shall be in line with the DT binding
- * documentation. Should a device support multiple bus types, the caller may
- * call this function once the correct type is found --- with a default
- * configuration valid for that type.
- *
- * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
- * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
- * guessing @vep.bus_type between CSI-2 D-PHY, parallel and BT.656 busses is
- * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
+ * firmware. There are two ways to use this function, either by letting it
+ * obtain the type of the bus (by setting the @vep.bus_type field to
+ * V4L2_MBUS_UNKNOWN) or specifying the bus type explicitly to one of the &enum
+ * v4l2_mbus_type types.
+ *
+ * When @vep.bus_type is V4L2_MBUS_UNKNOWN, the function will use the "bus-type"
+ * property to determine the type when it is available. The caller is
+ * responsible for validating the contents of @vep.bus_type field after the call
+ * returns.
+ *
+ * As a deprecated functionality to support older DT bindings without "bus-type"
+ * property for devices that support multiple types, if the "bus-type" property
+ * does not exist, the function will attempt to guess the type based on the
+ * endpoint properties available. NEVER RELY ON GUESSING THE BUS TYPE IN NEW
+ * DRIVERS OR BINDINGS.
+ *
+ * It is also possible to set @vep.bus_type corresponding to an actual bus. In
+ * this case the function will only attempt to parse properties related to this
+ * bus, and it will return an error if the value of the "bus-type" property
+ * corresponds to a different bus.
  *
  * The caller is required to initialise all fields of @vep.
  *
-- 
2.27.0

