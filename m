Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D50B6F8A70
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 22:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbjEEUyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 16:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233398AbjEEUyX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 16:54:23 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E512949EB
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 13:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683320062; x=1714856062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3zjSmhadpNxBwBxwtNuzY6XDxzGx9Fog998MFf0Nivk=;
  b=Ty3YLY8qqh6Aua1kkfs1Cf/F+4pRbRCt2RsfGWfgp2owJkgZHDxY9Gd+
   hsT7LFXDrnlBXSvt8Vz90xjFjTGD9wd4Xl4b7/oP9xvcDnIMKIYEh3XL7
   UaTdYAFg2h0EKQ8b24s71c0X4U/rcAWkAXW/RDyAmThgoqEw6KXG4ASFT
   hBYw+RDVSlSpG0YXSZJvlybyHwcA8J9jxAfMFSXFj2K7/gezifzt8sdwO
   nISyxrLimjVl+GtQWlZaLycDq2nPl1WbF75govclAIUgGX8s4+rnbOihD
   8A4tiVIwGbOqivhi65+JUVAUsNEt1yIPkkaMtGvyKbvgTlDNyw+LywsCi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="414842207"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="414842207"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="767265302"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="767265302"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:54:21 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4A140121435;
        Fri,  5 May 2023 23:54:18 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com
Subject: [PATCH 2/2] media: pci: ipu3-cio2: Obtain remote pad from endpoint
Date:   Fri,  5 May 2023 23:54:16 +0300
Message-Id: <20230505205416.55002-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505205416.55002-1-sakari.ailus@linux.intel.com>
References: <20230505205416.55002-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the endpoint fwnode to find out the remote pad, instead of using the
first source pad found. Also improve error messages.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 3c84cb121632..0a6fbe0e29db 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1373,6 +1373,7 @@ static const struct v4l2_subdev_ops cio2_subdev_ops = {
 struct sensor_async_subdev {
 	struct v4l2_async_subdev asd;
 	struct csi2_bus_info csi2;
+	struct fwnode_endpoint endpoint;
 };
 
 #define to_sensor_asd(asd)	container_of(asd, struct sensor_async_subdev, asd)
@@ -1424,24 +1425,22 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 		s_asd = to_sensor_asd(asd);
 		q = &cio2->queue[s_asd->csi2.port];
 
-		for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
-			if (q->sensor->entity.pads[pad].flags &
-						MEDIA_PAD_FL_SOURCE)
-				break;
-
-		if (pad == q->sensor->entity.num_pads) {
-			dev_err(dev, "failed to find src pad for %s\n",
-				q->sensor->name);
-			return -ENXIO;
+		ret = media_entity_get_fwnode_pad(&q->sensor->entity,
+						  s_asd->endpoint.local_fwnode,
+						  MEDIA_PAD_FL_SOURCE);
+		if (ret < 0) {
+			dev_err(dev, "no endpoint for %pfw (%d)\n", s_asd->endpoint.local_fwnode, ret);
+			return ret;
 		}
 
-		ret = media_create_pad_link(
-				&q->sensor->entity, pad,
-				&q->subdev.entity, CIO2_PAD_SINK,
-				0);
+		pad = ret;
+
+		ret = media_create_pad_link(&q->sensor->entity, pad,
+					    &q->subdev.entity, CIO2_PAD_SINK,
+					    0);
 		if (ret) {
-			dev_err(dev, "failed to create link for %s\n",
-				q->sensor->name);
+			dev_err(dev, "failed to create link for %s (endpoint %pfw, error %d)\n",
+				q->sensor->name, s_asd->endpoint.local_fwnode, ret);
 			return ret;
 		}
 	}
@@ -1485,6 +1484,7 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
 			goto err_parse;
 		}
 
+		s_asd->endpoint = vep.base;
 		s_asd->csi2.port = vep.base.port;
 		s_asd->csi2.lanes = vep.bus.mipi_csi2.num_data_lanes;
 
-- 
2.30.2

