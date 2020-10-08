Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0D6287D66
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 22:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730681AbgJHUrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 16:47:49 -0400
Received: from retiisi.eu ([95.216.213.190]:43986 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730673AbgJHUrt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 16:47:49 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id E2893634C8B;
        Thu,  8 Oct 2020 23:46:59 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Tsuchiya Yuto <kitakar@gmail.com>, bingbu.cao@intel.com,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 2/3] ipu3-cio2: Serialise access to pad format
Date:   Thu,  8 Oct 2020 23:47:46 +0300
Message-Id: <20201008204747.26320-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201008204747.26320-1-sakari.ailus@linux.intel.com>
References: <20201008204747.26320-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pad format can be accessed from user space. Serialise access to it.

Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 11 +++++++++++
 drivers/media/pci/intel/ipu3/ipu3-cio2.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index afa472026ba4..9c7b527a8800 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1233,11 +1233,15 @@ static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
 {
 	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
 
+	mutex_lock(&q->subdev_lock);
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
 	else
 		fmt->format = q->subdev_fmt;
 
+	mutex_unlock(&q->subdev_lock);
+
 	return 0;
 }
 
@@ -1261,6 +1265,8 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 	if (fmt->pad == CIO2_PAD_SOURCE)
 		return cio2_subdev_get_fmt(sd, cfg, fmt);
 
+	mutex_lock(&q->subdev_lock);
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
 	} else {
@@ -1271,6 +1277,8 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 		fmt->format = q->subdev_fmt;
 	}
 
+	mutex_unlock(&q->subdev_lock);
+
 	return 0;
 }
 
@@ -1529,6 +1537,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 
 	/* Initialize miscellaneous variables */
 	mutex_init(&q->lock);
+	mutex_init(&q->subdev_lock);
 
 	/* Initialize formats to default values */
 	fmt = &q->subdev_fmt;
@@ -1646,6 +1655,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
 fail_fbpt:
 	mutex_destroy(&q->lock);
+	mutex_destroy(&q->subdev_lock);
 
 	return r;
 }
@@ -1658,6 +1668,7 @@ static void cio2_queue_exit(struct cio2_device *cio2, struct cio2_queue *q)
 	media_entity_cleanup(&q->subdev.entity);
 	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
 	mutex_destroy(&q->lock);
+	mutex_destroy(&q->subdev_lock);
 }
 
 static int cio2_queues_init(struct cio2_device *cio2)
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index 549b08f88f0c..df0247326a1d 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -335,6 +335,7 @@ struct cio2_queue {
 
 	/* Subdev, /dev/v4l-subdevX */
 	struct v4l2_subdev subdev;
+	struct mutex subdev_lock;
 	struct media_pad subdev_pads[CIO2_PADS];
 	struct v4l2_mbus_framefmt subdev_fmt;
 	atomic_t frame_sequence;
-- 
2.27.0

