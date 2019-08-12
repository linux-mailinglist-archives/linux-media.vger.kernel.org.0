Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4786898BD
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 10:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfHLIfP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 04:35:15 -0400
Received: from retiisi.org.uk ([95.216.213.190]:40012 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbfHLIfP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 04:35:15 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 32579634C89;
        Mon, 12 Aug 2019 11:35:11 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/2] omap3isp: Set device on omap3isp subdevs
Date:   Mon, 12 Aug 2019 11:32:26 +0300
Message-Id: <20190812083227.11838-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190812083227.11838-1-sakari.ailus@linux.intel.com>
References: <20190812083227.11838-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The omap3isp driver registered subdevs without the dev field being set. Do
that now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/omap3isp/ispccdc.c    | 1 +
 drivers/media/platform/omap3isp/ispccp2.c    | 1 +
 drivers/media/platform/omap3isp/ispcsi2.c    | 1 +
 drivers/media/platform/omap3isp/isppreview.c | 1 +
 drivers/media/platform/omap3isp/ispresizer.c | 1 +
 drivers/media/platform/omap3isp/ispstat.c    | 2 ++
 6 files changed, 7 insertions(+)

diff --git a/drivers/media/platform/omap3isp/ispccdc.c b/drivers/media/platform/omap3isp/ispccdc.c
index 261ad1175f98..9297281402f5 100644
--- a/drivers/media/platform/omap3isp/ispccdc.c
+++ b/drivers/media/platform/omap3isp/ispccdc.c
@@ -2605,6 +2605,7 @@ int omap3isp_ccdc_register_entities(struct isp_ccdc_device *ccdc,
 	int ret;
 
 	/* Register the subdev and video node. */
+	ccdc->subdev.dev = vdev->mdev->dev;
 	ret = v4l2_device_register_subdev(vdev, &ccdc->subdev);
 	if (ret < 0)
 		goto error;
diff --git a/drivers/media/platform/omap3isp/ispccp2.c b/drivers/media/platform/omap3isp/ispccp2.c
index 2dea423ffc0e..3cf9a32c1d9e 100644
--- a/drivers/media/platform/omap3isp/ispccp2.c
+++ b/drivers/media/platform/omap3isp/ispccp2.c
@@ -1034,6 +1034,7 @@ int omap3isp_ccp2_register_entities(struct isp_ccp2_device *ccp2,
 	int ret;
 
 	/* Register the subdev and video nodes. */
+	ccp2->subdev.dev = vdev->mdev->dev;
 	ret = v4l2_device_register_subdev(vdev, &ccp2->subdev);
 	if (ret < 0)
 		goto error;
diff --git a/drivers/media/platform/omap3isp/ispcsi2.c b/drivers/media/platform/omap3isp/ispcsi2.c
index da66ea65be5d..9977702d57ff 100644
--- a/drivers/media/platform/omap3isp/ispcsi2.c
+++ b/drivers/media/platform/omap3isp/ispcsi2.c
@@ -1201,6 +1201,7 @@ int omap3isp_csi2_register_entities(struct isp_csi2_device *csi2,
 	int ret;
 
 	/* Register the subdev and video nodes. */
+	csi2->subdev.dev = vdev->mdev->dev;
 	ret = v4l2_device_register_subdev(vdev, &csi2->subdev);
 	if (ret < 0)
 		goto error;
diff --git a/drivers/media/platform/omap3isp/isppreview.c b/drivers/media/platform/omap3isp/isppreview.c
index 6ea6aeafd751..94fc9cf01436 100644
--- a/drivers/media/platform/omap3isp/isppreview.c
+++ b/drivers/media/platform/omap3isp/isppreview.c
@@ -2228,6 +2228,7 @@ int omap3isp_preview_register_entities(struct isp_prev_device *prev,
 	int ret;
 
 	/* Register the subdev and video nodes. */
+	prev->subdev.dev = vdev->mdev->dev;
 	ret = v4l2_device_register_subdev(vdev, &prev->subdev);
 	if (ret < 0)
 		goto error;
diff --git a/drivers/media/platform/omap3isp/ispresizer.c b/drivers/media/platform/omap3isp/ispresizer.c
index b281cae036b3..d5cce8b8af97 100644
--- a/drivers/media/platform/omap3isp/ispresizer.c
+++ b/drivers/media/platform/omap3isp/ispresizer.c
@@ -1684,6 +1684,7 @@ int omap3isp_resizer_register_entities(struct isp_res_device *res,
 	int ret;
 
 	/* Register the subdev and video nodes. */
+	res->subdev.dev = vdev->mdev->dev;
 	ret = v4l2_device_register_subdev(vdev, &res->subdev);
 	if (ret < 0)
 		goto error;
diff --git a/drivers/media/platform/omap3isp/ispstat.c b/drivers/media/platform/omap3isp/ispstat.c
index 46a42c5dc1cc..bb1578d6eaf6 100644
--- a/drivers/media/platform/omap3isp/ispstat.c
+++ b/drivers/media/platform/omap3isp/ispstat.c
@@ -1029,6 +1029,8 @@ void omap3isp_stat_unregister_entities(struct ispstat *stat)
 int omap3isp_stat_register_entities(struct ispstat *stat,
 				    struct v4l2_device *vdev)
 {
+	stat->subdev.dev = vdev->mdev->dev;
+
 	return v4l2_device_register_subdev(vdev, &stat->subdev);
 }
 
-- 
2.20.1

