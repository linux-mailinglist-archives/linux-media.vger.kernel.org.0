Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F254AB792
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 13:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404401AbfIFL4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 07:56:04 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35307 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404375AbfIFL4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 07:56:04 -0400
Received: by mail-pf1-f193.google.com with SMTP id 205so4319791pfw.2
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 04:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JZfqsyf6E7qNi8d0uHMTslvkHYYxxoFC9pGOwYz59rY=;
        b=XGaztWczFM3DFRBteEZsy9iz0HHDTzLO9EuZEMK7P2xlI7Bu6t70z3JG24Tgdq7uoz
         cUCFb/oFjuxJ7qglU6stIyJXZMAKb155d3NROd3zd1eFcn34BkCcuFrLyexyahy08cVa
         ThuVnxwqArG1xsmPE9Znn6BObgbDtcT3nBjRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JZfqsyf6E7qNi8d0uHMTslvkHYYxxoFC9pGOwYz59rY=;
        b=eOGMW27soqOBtzbXoBxkO+vxLKl55KbMkvvL9Ave6z4AfAfj5TNb+pM1Shia0anaPV
         LE5iXMIgz0TRhAVSR8ZtmTeP67Tfxf+XAMXu9wvfRFITlA9/YJ80RGRiJel6ptvLQ53q
         FzusQLdi+E1wRpQnfjMRylbhd3GaIdU/8HKM9bC+RHpPM6bfM6BQ3f9hKFKFDPj3ft1s
         qeoBMAn5nZaDKCDayBMkOR1EIkDtBlSyruVCvScS8sVvOMTles4UwyqthlkpmMvLnC25
         eXMAGY/K0gXPQ3mVAvXKT3ZfLeLES9yhhEdp3Z+0s73X9i3HkGx2v7Fi7S0aOnbTpQic
         Gp3A==
X-Gm-Message-State: APjAAAVMoD4Xst8Wbxtbg10itAj8Eaz4WxRJ/y9URJ1LlroCRXdUvXFd
        qIxproM7FtmEc61A7wEGdhiE8g==
X-Google-Smtp-Source: APXvYqyFf/aKYMAyWuUvsAqpMruHGhO70SSlVo+6UyVWGn7jSKN1LsO2oh6GiQ1ZPjkjjlrH+oPfng==
X-Received: by 2002:a62:c102:: with SMTP id i2mr10414642pfg.7.1567770963594;
        Fri, 06 Sep 2019 04:56:03 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id o22sm3667394pjq.21.2019.09.06.04.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 04:56:03 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 12/13] media: mtk-vcodec: vdec: add media device if using stateless api
Date:   Fri,  6 Sep 2019 20:55:12 +0900
Message-Id: <20190906115513.159705-13-acourbot@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906115513.159705-1-acourbot@chromium.org>
References: <20190906115513.159705-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

The stateless API requires a media device for issuing requests. Add one
if it turns out we are using it.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/Kconfig                |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 40 +++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
 3 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 83a785010753..86e97e5c3c10 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -248,6 +248,7 @@ config VIDEO_MEDIATEK_VCODEC
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	select VIDEO_MEDIATEK_VPU
+	select MEDIA_CONTROLLER
 	help
 	    Mediatek video codec driver provides HW capability to
 	    encode and decode in a range of video formats
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 53a9e016d989..7b4afac18297 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -14,6 +14,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-device.h>
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_dec.h"
@@ -329,6 +330,31 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
+	if (dev->vdec_pdata->uses_stateless_api) {
+		dev->mdev_dec.dev = &pdev->dev;
+		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
+				sizeof(dev->mdev_dec.model));
+
+		media_device_init(&dev->mdev_dec);
+		dev->mdev_dec.ops = &mtk_vcodec_media_ops;
+		dev->v4l2_dev.mdev = &dev->mdev_dec;
+
+		ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec,
+			dev->vfd_dec, MEDIA_ENT_F_PROC_VIDEO_DECODER);
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
+		mtk_v4l2_debug(0, "media registered as /dev/media%d",
+			vfd_dec->num);
+	}
 	ret = video_register_device(vfd_dec, VFL_TYPE_GRABBER, 0);
 	if (ret) {
 		mtk_v4l2_err("Failed to register video device");
@@ -341,6 +367,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
@@ -354,6 +386,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 extern const struct mtk_vcodec_dec_pdata mtk_frame_8173_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_req_8183_pdata;
 
 static const struct of_device_id mtk_vcodec_match[] = {
 	{
@@ -371,6 +404,13 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 
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
index 8167eeaa40e4..2202e8de9631 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -355,6 +355,7 @@ struct mtk_vcodec_dec_pdata {
  * struct mtk_vcodec_dev - driver data
  * @v4l2_dev: V4L2 device to register video devices for.
  * @vfd_dec: Video device for decoder
+ * @mdev_dec: Media device for decoder
  * @vfd_enc: Video device for encoder.
  *
  * @m2m_dev_dec: m2m device for decoder
@@ -391,6 +392,7 @@ struct mtk_vcodec_dec_pdata {
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
 	struct video_device *vfd_dec;
+	struct media_device mdev_dec;
 	struct video_device *vfd_enc;
 
 	struct v4l2_m2m_dev *m2m_dev_dec;
-- 
2.23.0.187.g17f5b7556c-goog

