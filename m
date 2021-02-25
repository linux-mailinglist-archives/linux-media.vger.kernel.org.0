Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38CCC324E0D
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 11:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbhBYKYq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 05:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235337AbhBYKSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 05:18:03 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E409CC061222
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:16:43 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id z7so2930960plk.7
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rPds8Sv7GUEEyk1zAIR4OmJkrFu7mzc9HWc+V93Z198=;
        b=CKCsGqiAB/HRbKsOO7yduvsdNknZ8XUSNFN//yKVMirfy2a2RDYD8QFKysTP49c9JN
         MJfnyRH3fgCHajl3+wef+FuzDmmwE6GeU2X1USMZlwMVJpWK4jBGTes8e+WKuDJl39SN
         gh08iC6o/idUnrGwqb5H2Hl1BmrYSJkXpPNz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rPds8Sv7GUEEyk1zAIR4OmJkrFu7mzc9HWc+V93Z198=;
        b=jOi4tM2L2DrcOOxyMxDy6fZTu3CM95eoPWGHFHCRf1kMJYUgubAsJE/clnmEnf760n
         U06WBXy5CCA4HrezpUjAZ0wl7znc1UXxbRy/E0ARqOsCpCsKk3NGZNLlyuL2tH5aHRUR
         EX+4CTDEVUXlaVqhfc5SGdMTPRSKlzMvDEYsL8woruaf8rvagSp+ivNXy3SRpGcyoqWs
         H5V77QQjq5vNdE9zBbYCPiK2NVcRFSZvltiDp2JSKYzvkyEV+w3JDjHO38RN0jmUCAhI
         2ByrI5TLQS/eBc/guo1BM4tFMc+7bzexnzwgSOnn64g9Dvg6E9DogAtrRCOAVjCPGh7o
         qMAQ==
X-Gm-Message-State: AOAM532z9djKQvFPJFio9+obEv3UsjKKnTLUJXc9SVZrwqWwUaVqQhqy
        MRVfyIcXbtM6AfoMJ1NKcY1bYg==
X-Google-Smtp-Source: ABdhPJzLvuKzJmtBTws3k3mugVhnelvdDoWGrtYgLJq0rmswBRVYtRxeXogQwxa3aUJPy3oiWm7jEg==
X-Received: by 2002:a17:902:9304:b029:e4:12f4:bdb0 with SMTP id bc4-20020a1709029304b02900e412f4bdb0mr2483934plb.55.1614248203466;
        Thu, 25 Feb 2021 02:16:43 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:2550:3154:2c53:b6e7])
        by smtp.gmail.com with ESMTPSA id z2sm5848193pfc.8.2021.02.25.02.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 02:16:42 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2 6/8] media: mtk-vcodec: vdec: add media device if using stateless api
Date:   Thu, 25 Feb 2021 19:16:10 +0900
Message-Id: <20210225101612.2832444-7-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210225101612.2832444-1-acourbot@chromium.org>
References: <20210225101612.2832444-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
---
 drivers/media/platform/Kconfig                |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 39 +++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
 3 files changed, 42 insertions(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c27db5643712..9d83b4223ecc 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -296,6 +296,7 @@ config VIDEO_MEDIATEK_VCODEC
 	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
 	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
 	select V4L2_H264
+	select MEDIA_CONTROLLER
 	help
 	  Mediatek video codec driver provides HW capability to
 	  encode and decode in a range of video formats on MT8173
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 533781d4680a..e942e28f96fe 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -14,6 +14,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-device.h>
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_dec.h"
@@ -324,6 +325,31 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
 	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		mtk_v4l2_err("Failed to register video device");
@@ -336,6 +362,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
@@ -368,6 +400,13 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 
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
index 3b884a321883..79d6a1e6c916 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -384,6 +384,7 @@ struct mtk_vcodec_enc_pdata {
  * struct mtk_vcodec_dev - driver data
  * @v4l2_dev: V4L2 device to register video devices for.
  * @vfd_dec: Video device for decoder
+ * @mdev_dec: Media device for decoder
  * @vfd_enc: Video device for encoder.
  *
  * @m2m_dev_dec: m2m device for decoder
@@ -420,6 +421,7 @@ struct mtk_vcodec_enc_pdata {
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
 	struct video_device *vfd_dec;
+	struct media_device mdev_dec;
 	struct video_device *vfd_enc;
 
 	struct v4l2_m2m_dev *m2m_dev_dec;
-- 
2.30.0.617.g56c4b15f3c-goog

