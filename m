Return-Path: <linux-media+bounces-3222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 328A3825016
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD32D1F23A7E
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 08:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BC522328;
	Fri,  5 Jan 2024 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNoub7JO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828142136D
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704443893; x=1735979893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S6W48cSmTzLROrbu167lGwePe8bDOGdIsCBUY7tUM6Q=;
  b=cNoub7JOHkIszDg0xAk/2oeo3wvS2Op8zuN04RMaeNIj+SOvQENL/0fw
   kmhc013NlHKwW9E49Ncw6gl66mGm5YMhWTENoXsM1KXoRib171Z905k1o
   xovi85QrCHC9mVZxCI3ihkKDE0DwsztMiyR4wBi10iuglzVRgqZ41nAIA
   cWhqnDtfyaa9tweND8ZzAj0K75HtZJfnPGIN7fHZA4NDNh/0X81I+Yi2r
   GbZhx5Puz0AWLfdCgtDG0ory5Y1NSay1YUf+T7k6yEXMrC1VMx0G0qjzQ
   v77FWl1SGqQM8ZqnO1Vcm9pvVFp7F3SLcYP4Zbr6+oWWQEXpJf88mHzPd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4834102"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4834102"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:38:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="953888655"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="953888655"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:38:02 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C2EB711FC24;
	Fri,  5 Jan 2024 10:37:59 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v2 1/3] media: ipu3-cio2: Further clean up async subdev link creation
Date: Fri,  5 Jan 2024 10:37:55 +0200
Message-Id: <20240105083757.197846-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105083757.197846-1-sakari.ailus@linux.intel.com>
References: <20240105083757.197846-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use v4l2_create_fwnode_links_to_pad() to create links from async
sub-devices to the CSI-2 receiver subdevs.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index ed08bf4178f0..83e29c56fe33 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -28,6 +28,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-sg.h>
 
@@ -1407,7 +1408,6 @@ static void cio2_notifier_unbind(struct v4l2_async_notifier *notifier,
 static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct cio2_device *cio2 = to_cio2_device(notifier);
-	struct device *dev = &cio2->pci_dev->dev;
 	struct sensor_async_subdev *s_asd;
 	struct v4l2_async_connection *asd;
 	struct cio2_queue *q;
@@ -1417,23 +1417,10 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 		s_asd = to_sensor_asd(asd);
 		q = &cio2->queue[s_asd->csi2.port];
 
-		ret = media_entity_get_fwnode_pad(&q->sensor->entity,
-						  s_asd->asd.match.fwnode,
-						  MEDIA_PAD_FL_SOURCE);
-		if (ret < 0) {
-			dev_err(dev, "no pad for endpoint %pfw (%d)\n",
-				s_asd->asd.match.fwnode, ret);
-			return ret;
-		}
-
-		ret = media_create_pad_link(&q->sensor->entity, ret,
-					    &q->subdev.entity, CIO2_PAD_SINK,
-					    0);
-		if (ret) {
-			dev_err(dev, "failed to create link for %s (endpoint %pfw, error %d)\n",
-				q->sensor->name, s_asd->asd.match.fwnode, ret);
+		ret = v4l2_create_fwnode_links_to_pad(asd->sd,
+						      &q->subdev_pads[CIO2_PAD_SINK], 0);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
@@ -1572,6 +1559,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	v4l2_subdev_init(subdev, &cio2_subdev_ops);
 	subdev->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	subdev->owner = THIS_MODULE;
+	subdev->dev = dev;
 	snprintf(subdev->name, sizeof(subdev->name),
 		 CIO2_ENTITY_NAME " %td", q - cio2->queue);
 	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-- 
2.39.2


