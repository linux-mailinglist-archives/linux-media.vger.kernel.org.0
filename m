Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D81F260E20
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 10:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgIHIyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 04:54:54 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60106 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729305AbgIHIyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 04:54:47 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id B013F634C8E;
        Tue,  8 Sep 2020 11:54:38 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        niklas.soderlund@ragnatech.se, jacopo@jmondi.org
Subject: [PATCH 2/3] v4l2-fwnode: Make bus configuration a struct
Date:   Tue,  8 Sep 2020 11:51:20 +0300
Message-Id: <20200908085121.864-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908085121.864-1-sakari.ailus@linux.intel.com>
References: <20200908085121.864-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bus specific parameters were an union. This made providing bus
specific defaults impossible as the memory used to store the defaults for
multiple different busses was the same.

Make it struct instead. It's not large so the size isn't really an issue.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-fwnode.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 81e7eb123294..d04f39b60096 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -78,7 +78,7 @@ struct v4l2_fwnode_bus_mipi_csi1 {
  * struct v4l2_fwnode_endpoint - the endpoint data structure
  * @base: fwnode endpoint of the v4l2_fwnode
  * @bus_type: bus type
- * @bus: union with bus configuration data structure
+ * @bus: bus configuration data structure
  * @bus.parallel: embedded &struct v4l2_fwnode_bus_parallel.
  *		  Used if the bus is parallel.
  * @bus.mipi_csi1: embedded &struct v4l2_fwnode_bus_mipi_csi1.
@@ -99,7 +99,7 @@ struct v4l2_fwnode_endpoint {
 	 * v4l2_fwnode_endpoint_parse()
 	 */
 	enum v4l2_mbus_type bus_type;
-	union {
+	struct {
 		struct v4l2_fwnode_bus_parallel parallel;
 		struct v4l2_fwnode_bus_mipi_csi1 mipi_csi1;
 		struct v4l2_fwnode_bus_mipi_csi2 mipi_csi2;
-- 
2.27.0

