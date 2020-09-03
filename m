Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E38F125BA9F
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 07:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgICFsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 01:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbgICFsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 01:48:46 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D5BC061245
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 22:48:45 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id m5so1200687pgj.9
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 22:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxOUTu3Fn6s5agkJSuaeoytoVx0NNmaxRXLXydxOq+w=;
        b=htj3lRqkIgsh4c7IEbd0OmII1g4rHRRPYOwizSELlMizgLq1bPkB8rImlcFCoZKJVE
         03NUrgzKBL4KZEocOdzwfK5zpgqAqBsBI2zDsMWwNcYGgiybhcIlQur0qV0U6/0z5Tc9
         PJyJN3Ae9HfFWMc+5cOBsivktgGMh/wYlw2Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxOUTu3Fn6s5agkJSuaeoytoVx0NNmaxRXLXydxOq+w=;
        b=WfQMJZUloTQhL7aVxKB86ORnUgkxQo9vyvUd73ES7HtM6DcLC4akorz6h2fxGWBhiR
         adKlrzew6br6M9ttPuteP+vCWTusf17laov+Rlni5pZ5uKXufvHXfQPuj3/81Xy9azi7
         n6IalLHmTYFMg9ySW4iLvzrIox8pK/qVTd3fYG3JtDqfgmZODSZBCns4lA+Z3WaR0jyJ
         MHi+xh2xZfR5RZARThbb/hjhVhgmmFzin2fIhi/yWhT8PBjnqY0uiBVIxZtiC9pVsrqs
         R1djUYmp8O8PjlQhlE3OQIOoK2tp+klN1r5ylCHBxb6vr9rsbuK0NCt/dFOE4yrNlt/9
         og5w==
X-Gm-Message-State: AOAM531hq9b70KL/CFZta6ETDwrFImRj95oJAj+EiCWJlh2uUrRles+Y
        uPjVk4E6XDtiX/xGa507zClAHlKOy9wr9A==
X-Google-Smtp-Source: ABdhPJxnvTUo3AQzDD/vyNULzOUhHkXHWGLFFwWLxxcbIpy/btsmC/T3RiZIgNFj//B5dc6sqis6/A==
X-Received: by 2002:a63:1052:: with SMTP id 18mr1525513pgq.311.1599112124849;
        Wed, 02 Sep 2020 22:48:44 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
        by smtp.gmail.com with ESMTPSA id r2sm1099218pga.94.2020.09.02.22.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 22:48:44 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] media: mtk-vcodec: remove allocated dma_parms
Date:   Thu,  3 Sep 2020 13:48:33 +0800
Message-Id: <20200903054832.3743698-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

9495b7e92f71 ("driver core: platform: Initialize dma_parms for platform
devices") included dma_parms in platform_device. There's no need to
allocate again.

Fixes: 13483fc2f20f0e2db7ba9c39b095ac7ea46f8de8 ("media: mtk-vcodec: set dma max segment size")
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 9 +--------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 9 +--------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 3bbd0bac56d69..76ee0cb5a7094 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -242,14 +242,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		mtk_v4l2_err("[VPU] vpu device in not ready");
 		return -EPROBE_DEFER;
 	}
-	if (!pdev->dev.dma_parms) {
-		pdev->dev.dma_parms = devm_kzalloc(&pdev->dev,
-						sizeof(*pdev->dev.dma_parms),
-						GFP_KERNEL);
-		if (!pdev->dev.dma_parms)
-			return -ENOMEM;
-	}
-	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
 
 	vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_dec_reset_handler,
 			dev, VPU_RST_DEC);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index ff4a87485d690..c18e58c71d4a4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -249,14 +249,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		mtk_v4l2_err("[VPU] vpu device in not ready");
 		return -EPROBE_DEFER;
 	}
-	if (!pdev->dev.dma_parms) {
-		pdev->dev.dma_parms = devm_kzalloc(&pdev->dev,
-						sizeof(*pdev->dev.dma_parms),
-						GFP_KERNEL);
-		if (!pdev->dev.dma_parms)
-			return -ENOMEM;
-	}
-	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
 
 	vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_enc_reset_handler,
 				dev, VPU_RST_ENC);
-- 
2.28.0.402.g5ffc5be6b7-goog

