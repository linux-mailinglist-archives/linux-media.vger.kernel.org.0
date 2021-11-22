Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1701F4594FC
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 19:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240416AbhKVSuc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 13:50:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240421AbhKVSuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 13:50:21 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2F3C061746;
        Mon, 22 Nov 2021 10:47:14 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id g14so81320184edb.8;
        Mon, 22 Nov 2021 10:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+w4xKSGr2Zu6+OjnOBXAenD8YjQlbwAZQEVVxErum9c=;
        b=bd3XcFjOlYJkoNuauwnOZ4WoOKrVjvPD2tfLabA4dd5EVxBgcs1EfqKYQlCK1GCJyA
         dNOaBCKc8sCGwwdzfG5Sbv0lb3xcUO2yfsmqBmbjA15QC4YlXCxLzhumhpCPU2oMJglI
         BHFfd4aPH+uuABtD5uVxldU8d4cQxW0o19LYkzoUSDVfXGfr6fDnK86IHzqesQ3M0eqA
         5MWwrf6zfAGc/CsFtDenZLcKD4gFLKTZIVVKcNZb3w4XaOUT6XXPVy9lq5MTYFSisZtu
         B8qL/KR97y2prd2Cyowkn9Ia1pcHruDyfJpbZYJ/ZTOaHlSWyr5pyOStpLsYzyYTt61T
         B8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+w4xKSGr2Zu6+OjnOBXAenD8YjQlbwAZQEVVxErum9c=;
        b=qQ8AATn4pqg4/XTriOqr1ULNFuKHsLgef6Hlx9evtTFMFOYi3o+9gOKk2/XtjXUrOE
         X/Cart2NX/WyVniwP2UupNb4CmaorRNYkbZ7QK3PuqsatsR4XNjVuYdr9PSbseO0puzg
         ltWsFnxW91/iZvsF/IRpgbN2pEAWtq8ljxoyt4idFkwugXaIDBohFln5EZpWp0teXV0i
         bukWHGo2PECpQawqBIAPosnAEbYPvzMONPzCcv3HPUH+jSAGnPdDEmj9xMrLEK3CnCXr
         lL0rixv0csMFJSruG00d5DE7GcJ+nNNGH+pSyN4R4j2aetW8d+977Doh6zXdcrVWSWyw
         iDBw==
X-Gm-Message-State: AOAM530vXnnEO6ks4hAA62w4KxhJJUNuIqskOajykjO0n9b5YzO2Pq1a
        vdksmU/XEETvybtt6ZpqapCcCJ3/BJg1MA==
X-Google-Smtp-Source: ABdhPJysbwUlkyvCH+XVf6KqRQevoHWgxCWlT5DPGHxL30ztAHwZotkpi7zotZeGy3uRYsgbv4HRxQ==
X-Received: by 2002:a17:907:7215:: with SMTP id dr21mr43579240ejc.505.1637606833124;
        Mon, 22 Nov 2021 10:47:13 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id h10sm4512312edr.95.2021.11.22.10.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:47:12 -0800 (PST)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, andrzej.p@collabora.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/7] media: hantro: add support for reset lines
Date:   Mon, 22 Nov 2021 19:46:56 +0100
Message-Id: <20211122184702.768341-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122184702.768341-1-jernej.skrabec@gmail.com>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some SoCs like Allwinner H6 use reset lines for resetting Hantro G2. Add
support for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro.h     |  3 +++
 drivers/staging/media/hantro/hantro_drv.c | 15 ++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 7da23f7f207a..33eb3e092cc1 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -16,6 +16,7 @@
 #include <linux/videodev2.h>
 #include <linux/wait.h>
 #include <linux/clk.h>
+#include <linux/reset.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -171,6 +172,7 @@ hantro_vdev_to_func(struct video_device *vdev)
  * @dev:		Pointer to device for convenient logging using
  *			dev_ macros.
  * @clocks:		Array of clock handles.
+ * @resets:		Array of reset handles.
  * @reg_bases:		Mapped addresses of VPU registers.
  * @enc_base:		Mapped address of VPU encoder register for convenience.
  * @dec_base:		Mapped address of VPU decoder register for convenience.
@@ -190,6 +192,7 @@ struct hantro_dev {
 	struct platform_device *pdev;
 	struct device *dev;
 	struct clk_bulk_data *clocks;
+	struct reset_control *resets;
 	void __iomem **reg_bases;
 	void __iomem *enc_base;
 	void __iomem *dec_base;
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index ab2467998d29..8c3de31f51b3 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -905,6 +905,10 @@ static int hantro_probe(struct platform_device *pdev)
 			return PTR_ERR(vpu->clocks[0].clk);
 	}
 
+	vpu->resets = devm_reset_control_array_get(&pdev->dev, false, true);
+	if (IS_ERR(vpu->resets))
+		return PTR_ERR(vpu->resets);
+
 	num_bases = vpu->variant->num_regs ?: 1;
 	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
 				      sizeof(*vpu->reg_bases), GFP_KERNEL);
@@ -978,10 +982,16 @@ static int hantro_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(vpu->dev);
 	pm_runtime_enable(vpu->dev);
 
+	ret = reset_control_deassert(vpu->resets);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to deassert resets\n");
+		return ret;
+	}
+
 	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to prepare clocks\n");
-		return ret;
+		goto err_rst_assert;
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
@@ -1037,6 +1047,8 @@ static int hantro_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&vpu->v4l2_dev);
 err_clk_unprepare:
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
+err_rst_assert:
+	reset_control_assert(vpu->resets);
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
 	return ret;
@@ -1055,6 +1067,7 @@ static int hantro_remove(struct platform_device *pdev)
 	v4l2_m2m_release(vpu->m2m_dev);
 	v4l2_device_unregister(&vpu->v4l2_dev);
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
+	reset_control_assert(vpu->resets);
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
 	return 0;
-- 
2.34.0

