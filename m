Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90482260E1E
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 10:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbgIHIyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 04:54:49 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60096 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729278AbgIHIyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 04:54:47 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 9C10D634C8D;
        Tue,  8 Sep 2020 11:54:38 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        niklas.soderlund@ragnatech.se, jacopo@jmondi.org
Subject: [PATCH 1/3] v4l2-fwnode: Make number of data lanes a character
Date:   Tue,  8 Sep 2020 11:51:19 +0300
Message-Id: <20200908085121.864-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908085121.864-1-sakari.ailus@linux.intel.com>
References: <20200908085121.864-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The maximum is currently four (4). No short is needed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-fwnode.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index c47b70636e42..81e7eb123294 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -40,7 +40,7 @@ struct v4l2_fwnode_bus_mipi_csi2 {
 	unsigned int flags;
 	unsigned char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES];
 	unsigned char clock_lane;
-	unsigned short num_data_lanes;
+	unsigned char num_data_lanes;
 	bool lane_polarities[1 + V4L2_FWNODE_CSI2_MAX_DATA_LANES];
 };
 
-- 
2.27.0

