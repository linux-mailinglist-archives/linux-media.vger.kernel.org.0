Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06243E226A
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 06:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242780AbhHFEQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 00:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242769AbhHFEQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 00:16:52 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52A7C061798
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 21:16:37 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id g11-20020a25ae4b0000b02905792fb55b0bso8338637ybe.9
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 21:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=oPE1v1kYszg9FU+kfYGAPyUdSszW/QUX8TrG+ItsMlc=;
        b=wRAmpjl5Tp1P0V4/0Qs40Z8RIx8HO8peuCxUkTEw7vDEqOCrwiCPA6gZgElPB66Zu8
         DiYTMDT7MJz8qs0/0a3pAjaEaTiahRcoHEIBvZLClQvBViNQ/ooXSHaYTjpUdZNuQOTZ
         7pRl7jPMdnHiSYLc4XwQDUJlIuhggLdHEDrBiVHLmYd7lKGMKmL5d9YKqpwtwQIRbGdK
         HqJaQgvzzab9C7FjnfggAUodA5WAIrLnQjlQ8NASjQNq4wYxmIDYPLWEjvtMgTooabTY
         BSZE+OqLjLuw4GUdAk1ZVhNNXfVdPj4ji2eSQ8UXLtUudY7j9djtOkjWAaG1KS+MsXzj
         s5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=oPE1v1kYszg9FU+kfYGAPyUdSszW/QUX8TrG+ItsMlc=;
        b=P9L4M7sBMCzFz91eVL+3zDwTkq/Vrmc+1k5pQTWmKZNYwhVB5LcX1FWt5avGvC10Zz
         AvlQvOkAn57cgFdm/DYgKkE8e7TJxbOMNF9/CoNMvjJVUvVY1Q2YFhCG5vzGfudZqfw3
         DT6RwdHQdZuUUlet5AQnvD4lW+7UjGMqJ8jURTOxl/827+yNhslLzfFjrj91IwOxxst+
         TEDi4lhGMKh77va4Ywb3ad/VhkZ66FJyKZYuooo7Yd4ZodXHpb1nd8Y3b+ZbKNI9gwsa
         dlsqCDARSXvSlUQXnG4ISZNwMWhVCRiKPDw0jgxziWKouOveyfy4L/agV14S+ayqZwB9
         5VPw==
X-Gm-Message-State: AOAM530lQNAwJUhNZwMUKHkmpAPvuDwkaDL7XFQA9grcHe5L3KzK7VGx
        WU/0MHe7PzZeVqwaC+SQjOIcLnbq6QYi
X-Google-Smtp-Source: ABdhPJzHv93sp38BXCMDnFkgYFIopCnlFNt4d9gy77XHq5f8skX6+aGKHwCmhbZiIiEDqty9RHDOn1a0J+A6
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a25:1e89:: with SMTP id
 e131mr10513765ybe.90.1628223397026; Thu, 05 Aug 2021 21:16:37 -0700 (PDT)
Date:   Fri,  6 Aug 2021 12:15:28 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-13-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 12/14] media: mtk-vcodec: vdec: add media device if using
 stateless api
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com,
        acourbot@chromium.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

The stateless API requires a media device for issuing requests. Add one
if we are being instantiated as a stateless decoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
[tzungbi: fix wrong device minor number reference]
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/Kconfig                |  2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 41 ++++++++++++++++++-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index ae1468aa1b4e..aa277a19e275 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -315,6 +315,8 @@ config VIDEO_MEDIATEK_VCODEC
 	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
 	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
 	select V4L2_H264
+	select MEDIA_CONTROLLER
+	select MEDIA_CONTROLLER_REQUEST_API
 	help
 	  Mediatek video codec driver provides HW capability to
 	  encode and decode in a range of video formats on MT8173
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 1460951f302c..fe345aab9853 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -14,6 +14,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-device.h>
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_dec.h"
@@ -316,18 +317,47 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
+	if (dev->vdec_pdata->uses_stateless_api) {
+		dev->mdev_dec.dev = &pdev->dev;
+		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
+			sizeof(dev->mdev_dec.model));
+
+		media_device_init(&dev->mdev_dec);
+		dev->mdev_dec.ops = &mtk_vcodec_media_ops;
+		dev->v4l2_dev.mdev = &dev->mdev_dec;
+
+		ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec, dev->vfd_dec,
+							 MEDIA_ENT_F_PROC_VIDEO_DECODER);
+		if (ret) {
+			mtk_v4l2_err("Failed to register media controller");
+			goto err_reg_cont;
+		}
+
+		ret = media_device_register(&dev->mdev_dec);
+		if (ret) {
+			mtk_v4l2_err("Failed to register media device");
+			goto err_media_reg;
+		}
+
+		mtk_v4l2_debug(0, "media registered as /dev/media%d", vfd_dec->minor);
+	}
 	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		mtk_v4l2_err("Failed to register video device");
 		goto err_dec_reg;
 	}
 
-	mtk_v4l2_debug(0, "decoder registered as /dev/video%d",
-		vfd_dec->num);
+	mtk_v4l2_debug(0, "decoder registered as /dev/video%d", vfd_dec->minor);
 
 	return 0;
 
 err_dec_reg:
+	if (dev->vdec_pdata->uses_stateless_api)
+		media_device_unregister(&dev->mdev_dec);
+err_media_reg:
+	if (dev->vdec_pdata->uses_stateless_api)
+		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
+err_reg_cont:
 	destroy_workqueue(dev->decode_workqueue);
 err_event_workq:
 	v4l2_m2m_release(dev->m2m_dev_dec);
@@ -360,6 +390,13 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 
 	flush_workqueue(dev->decode_workqueue);
 	destroy_workqueue(dev->decode_workqueue);
+
+	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
+		media_device_unregister(&dev->mdev_dec);
+		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
+		media_device_cleanup(&dev->mdev_dec);
+	}
+
 	if (dev->m2m_dev_dec)
 		v4l2_m2m_release(dev->m2m_dev_dec);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 8fb333a99a40..d4f840a7bbcb 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -389,6 +389,7 @@ struct mtk_vcodec_enc_pdata {
  * struct mtk_vcodec_dev - driver data
  * @v4l2_dev: V4L2 device to register video devices for.
  * @vfd_dec: Video device for decoder
+ * @mdev_dec: Media device for decoder
  * @vfd_enc: Video device for encoder.
  *
  * @m2m_dev_dec: m2m device for decoder
@@ -426,6 +427,7 @@ struct mtk_vcodec_enc_pdata {
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
 	struct video_device *vfd_dec;
+	struct media_device mdev_dec;
 	struct video_device *vfd_enc;
 
 	struct v4l2_m2m_dev *m2m_dev_dec;
-- 
2.32.0.605.g8dce9f2422-goog

