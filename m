Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB86312464
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 00:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfEBWA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 18:00:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42698 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfEBWA7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 18:00:59 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8208128435A
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 1/4] media: coda: Print a nicer device registered message
Date:   Thu,  2 May 2019 19:00:42 -0300
Message-Id: <20190502220045.14962-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502220045.14962-1-ezequiel@collabora.com>
References: <20190502220045.14962-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is just a cosmetic change to print a more descriptive
message, to distinguish decoder from encoder:

So, instead of printing

  coda 2040000.vpu: codec registered as /dev/video[4-5]

With this change, the driver now prints

  coda 2040000.vpu: encoder registered as /dev/video4
  coda 2040000.vpu: decoder registered as /dev/video5

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/coda/coda-common.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 3ce58dee4422..39421ded5c63 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -2480,9 +2480,12 @@ static int coda_hw_init(struct coda_dev *dev)
 static int coda_register_device(struct coda_dev *dev, int i)
 {
 	struct video_device *vfd = &dev->vfd[i];
+	enum coda_inst_type type;
+	int ret;
 
 	if (i >= dev->devtype->num_vdevs)
 		return -EINVAL;
+	type = dev->devtype->vdevs[i]->type;
 
 	strscpy(vfd->name, dev->devtype->vdevs[i]->name, sizeof(vfd->name));
 	vfd->fops	= &coda_fops;
@@ -2498,7 +2501,12 @@ static int coda_register_device(struct coda_dev *dev, int i)
 	v4l2_disable_ioctl(vfd, VIDIOC_G_CROP);
 	v4l2_disable_ioctl(vfd, VIDIOC_S_CROP);
 
-	return video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
+	if (!ret)
+		v4l2_info(&dev->v4l2_dev, "%s registered as %s\n",
+			  type == CODA_INST_ENCODER ? "encoder" : "decoder",
+			  video_device_node_name(vfd));
+	return ret;
 }
 
 static void coda_copy_firmware(struct coda_dev *dev, const u8 * const buf,
@@ -2612,9 +2620,6 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 		}
 	}
 
-	v4l2_info(&dev->v4l2_dev, "codec registered as /dev/video[%d-%d]\n",
-		  dev->vfd[0].num, dev->vfd[i - 1].num);
-
 	pm_runtime_put_sync(&pdev->dev);
 	return;
 
-- 
2.20.1

