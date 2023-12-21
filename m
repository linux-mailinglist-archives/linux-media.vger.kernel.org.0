Return-Path: <linux-media+bounces-2867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B3281B933
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 15:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 880FE1F27561
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 14:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476F95990D;
	Thu, 21 Dec 2023 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/zdnTrB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2F758236
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703167109; x=1734703109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cXkpUsjZkvgBmGXazNfWiLAgnaqd9mNI4wLKcTHVkZ4=;
  b=n/zdnTrBaiU7U5p/asKED+hN7bcYwb2CDgaoweQeiOmDlVyQhhb6flDL
   FjjO6Y1NO8zkhafP12U13zM46WQNLKHE7sr6fknuP5qlhSyBlmrYL6oDn
   79kYlFeBwQ7lQisQk0YzRWX3FdLZK7KDLlkwjphIJf8+Y+THtwYJUYXz4
   X5/eV0xRNxc9doRzTv0oRtXft2s7kfhPdLxPIV8lBn9GyCTJdrdvZpm3P
   jV9ocYBomI1fPpueEK7K+6uZnDEtssOVZ3+IE3sInLiSXe180tZ2MJZ+F
   dx4br2TCjEkNmOQ27Rbk9S2IkkPLAaBIxFzZskuWT7zMaxgLBZfIdjGqC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="460312126"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="460312126"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:58:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1108108404"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="1108108404"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:58:26 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 84F571203EB;
	Thu, 21 Dec 2023 15:58:23 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH 1/3] media: ipu3-cio2: Further clean up async subdev link creation
Date: Thu, 21 Dec 2023 15:58:20 +0200
Message-Id: <20231221135822.152448-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
References: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
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
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
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


