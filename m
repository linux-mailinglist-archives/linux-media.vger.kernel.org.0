Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFA83C77D4
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 22:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235328AbhGMUYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 16:24:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:18054 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235259AbhGMUYF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 16:24:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="197421631"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="197421631"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 13:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="487466054"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2021 13:21:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 18C082B6; Tue, 13 Jul 2021 23:21:37 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 3/6] media: ipu3-cio2: Switch to use media_entity_to_video_device()
Date:   Tue, 13 Jul 2021 23:21:28 +0300
Message-Id: <20210713202131.13906-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210713202131.13906-1-andriy.shevchenko@linux.intel.com>
References: <20210713202131.13906-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 provides a few helper macros, in particular
media_entity_to_video_device(). Switch the driver
to use it instead of open-coded variant.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index d3358817db6f..2f8ded58a949 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1313,15 +1313,15 @@ static int cio2_subdev_link_validate_get_format(struct media_pad *pad,
 
 static int cio2_video_link_validate(struct media_link *link)
 {
-	struct video_device *vd = container_of(link->sink->entity,
-						struct video_device, entity);
+	struct media_entity *entity = link->sink->entity;
+	struct video_device *vd = media_entity_to_video_device(entity);
 	struct cio2_queue *q = container_of(vd, struct cio2_queue, vdev);
 	struct cio2_device *cio2 = video_get_drvdata(vd);
 	struct device *dev = &cio2->pci_dev->dev;
 	struct v4l2_subdev_format source_fmt;
 	int ret;
 
-	if (!media_entity_remote_pad(link->sink->entity->pads)) {
+	if (!media_entity_remote_pad(entity->pads)) {
 		dev_info(dev, "video node %s pad not connected\n", vd->name);
 		return -ENOTCONN;
 	}
-- 
2.30.2

