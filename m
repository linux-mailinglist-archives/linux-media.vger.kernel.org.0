Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B410A24D3C5
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 13:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgHULUB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 07:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgHULTs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 07:19:48 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5ABC061386
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 04:19:47 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id v15so853598pgh.6
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 04:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2VIeirKC7U7WGWxGmP4oRtrh71NIdS/JKoywFCrHktQ=;
        b=g8iv19BUauBM54+OaGxIEwnRevuDpN11JroVr9XjhhoUpwbDGmNMYGxZyruJZIF65u
         Sng5gJC2U+duUzp9VJUfRYkuhqKw47vBKo/JTk0vQ0WRR1QMg5SEp6a1LMRhomUMdwqU
         0M6WQrtnvRLSZpDjsnoDAQkUue1O8ysZpS0IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2VIeirKC7U7WGWxGmP4oRtrh71NIdS/JKoywFCrHktQ=;
        b=TcOH+1NiHKBjf7wULbPWo4mcGjga+cFGojaF9s81aFpXTt7i5IvEhX/JHPgiZuk49X
         lrWGYt9EwdHnsKqDhZKSRvNRvxwF9eqZlL/qqm+dX0txMYNUS00AJ8AWl1IGgSfyJeZ0
         D5xjBVMiQtGvr9bDV+QLWut/pNvAMOGsbev3nZaXbkpCtOewUEelmZIwbTNTyaql/fRy
         /7btekqo82ApiO8NYMvRaDknYFa6bMR15wTN1hkjxWG/09BK/WcxXxxQdE6pYfFLZ+w5
         QsRgzyxqEyS3FEzwA2VIR8w0XDBN+YMZHH8gvzOu2e+VukWCeIeSBA/bI86gMtBNzaIt
         U3vA==
X-Gm-Message-State: AOAM532EIyInkpWXiPcH98TyOLZ77f5ccdP/ybWhM8YBOhbCFcuFCK+O
        S0ZALC+HpmhDzxP79EToV2+9Xw==
X-Google-Smtp-Source: ABdhPJzVqnf1RyIgIZ6S3FevYn5PI/d8NZHy8ofqSoD4DTDV68i+kCDcddYWR+B+ab6mPFfxG2R/4g==
X-Received: by 2002:a05:6a00:1343:: with SMTP id k3mr2146199pfu.91.1598008785422;
        Fri, 21 Aug 2020 04:19:45 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id p9sm1860786pge.39.2020.08.21.04.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 04:19:44 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: mtk-vcodec: make IRQs disabled upon request
Date:   Fri, 21 Aug 2020 20:19:23 +0900
Message-Id: <20200821111924.2328306-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver requests IRQs to disable them immediately. This is
potentially racy, fix this by requesting the IRQs to come disabled
instead using the IRQ_NOAUTOEN flag of irq_set_status_flags().

Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
The "media: mtk-vcodec: venc: support for MT8183" happens to change this
part of the code, this version applies on top of it (but adapting it to
the media ToT is trivial). If preferred I can include this one on top of
the series on its next respin, even though it also touches the decoder.

 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 5b5765b98e57..a6ba342f7bc8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -259,6 +259,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 
 	dev->dec_irq = platform_get_irq(pdev, 0);
+	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
 			mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
 	if (ret) {
@@ -268,7 +269,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_res;
 	}
 
-	disable_irq(dev->dec_irq);
 	mutex_init(&dev->dec_mutex);
 	mutex_init(&dev->dev_mutex);
 	spin_lock_init(&dev->irqlock);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index d6438cb4eead..2a4136e6e867 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -311,6 +311,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 
 	dev->enc_irq = platform_get_irq(pdev, 0);
+	irq_set_status_flags(dev->enc_irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(&pdev->dev, dev->enc_irq,
 			       mtk_vcodec_enc_irq_handler,
 			       0, pdev->name, dev);
@@ -321,7 +322,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		ret = -EINVAL;
 		goto err_res;
 	}
-	disable_irq(dev->enc_irq);
 
 	if (dev->venc_pdata->has_lt_irq) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
@@ -333,6 +333,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		mtk_v4l2_debug(2, "reg[%d] base=0x%p", i, dev->reg_base[VENC_LT_SYS]);
 
 		dev->enc_lt_irq = platform_get_irq(pdev, 1);
+		irq_set_status_flags(dev->enc_lt_irq, IRQ_NOAUTOEN);
 		ret = devm_request_irq(&pdev->dev,
 				       dev->enc_lt_irq,
 				       mtk_vcodec_enc_lt_irq_handler,
@@ -344,7 +345,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 			ret = -EINVAL;
 			goto err_res;
 		}
-		disable_irq(dev->enc_lt_irq); /* VENC_LT */
 	}
 
 	mutex_init(&dev->enc_mutex);
-- 
2.28.0.297.g1956fa8f8d-goog

