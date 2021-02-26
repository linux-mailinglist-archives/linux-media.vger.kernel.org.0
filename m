Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488C83260E0
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhBZKFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhBZKD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:03:57 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269B7C061356
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:21 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id 17so5032030pli.10
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ULJfNkdw83Y6AFx0P3bzeBO6g6jj3XubfTKkzYBLpyk=;
        b=KQ3bT1Cn8YRGUWPxuuAF7zF/GRt6M4dziANQw9TGeTgcdm4DzIn+ebvMzOuXYtayaD
         c8JDBvScczV1pZmNf35uF0g3kvsk4dMSoQw3Gmi8V+OPRl+GdqTEyfv2HR/BykeUcj0J
         KD+hhp8oOwt8cvrP6oBXJUfYlv73hvMi0kVjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ULJfNkdw83Y6AFx0P3bzeBO6g6jj3XubfTKkzYBLpyk=;
        b=tf5yRWdfE5UqzE8vVQiOM1PkKxY5jrrKGr1z6d3FzxEcBkkhHD721ByI+iz9cm8pGX
         3X/Utwrlky+oKVoVf+4GRd+T9RgsQkgC69ZD/wqRxYI7u1EfAP/mSG5Pkwo6DUwqyMXg
         Cy6rfRC+PVS0kNB7edwmYlXuHaOoy7dqqTyBl/s/iUs/wd4lje4RYsBjh/IuInDck4gy
         kkwV/vdefYQMT/NwWSG5l1aMZu81UmsABj8E643E0SpZG/Qh1+pWVXSbuYPbUkmCTlmD
         xiGUpykwun7n4BwxNC3nQnrHIgI0TQ2flAQ8rOg0PS5ZznqiEHyfFTB/FmwKSbMaF7aP
         wvVg==
X-Gm-Message-State: AOAM531xhvlK/TLHg1S2gPNMv1+DKGZLWCGqGBNhZVjTp9zueiZVina+
        k7rkDj6MWuYBBeKXaZDRjOXJxw==
X-Google-Smtp-Source: ABdhPJz4se85ecUkV3uESj3swy1jhn88z4Bz8wZJ9w2BY7RseDeRr5Jnr6yf7P3mg947gcZuxaLq8Q==
X-Received: by 2002:a17:902:8687:b029:e1:601e:bd29 with SMTP id g7-20020a1709028687b02900e1601ebd29mr2363880plo.47.1614333740761;
        Fri, 26 Feb 2021 02:02:20 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
        by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 02:02:20 -0800 (PST)
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
Subject: [PATCH v3 07/15] media: mtk-vcodec: vdec: add media device if using stateless api
Date:   Fri, 26 Feb 2021 19:01:40 +0900
Message-Id: <20210226100148.1663389-8-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
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
2.30.1.766.gb4fecdf3b7-goog

