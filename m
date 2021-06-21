Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF5613AF909
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 01:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhFUXOu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 19:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhFUXOt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 19:14:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03256C061756
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 16:12:35 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id BB9A01F41F2F
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 2/2] hantro: Make struct hantro_variant.init() optional
Date:   Mon, 21 Jun 2021 20:11:57 -0300
Message-Id: <20210621231157.226962-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210621231157.226962-1-ezequiel@collabora.com>
References: <20210621231157.226962-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The hantro_variant.init() function is there for platforms
to perform hardware-specific initialization, such as
clock rate bumping.

Not all platforms require it, so make it optional.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h          |  4 ++--
 drivers/staging/media/hantro/hantro_drv.c      | 10 ++++++----
 drivers/staging/media/hantro/sama5d4_vdec_hw.c |  6 ------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index a70c386de6f1..c2e2dca38628 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -61,8 +61,8 @@ struct hantro_irq {
  * @num_postproc_fmts:		Number of post-processor formats.
  * @codec:			Supported codecs
  * @codec_ops:			Codec ops.
- * @init:			Initialize hardware.
- * @runtime_resume:		reenable hardware after power gating
+ * @init:			Initialize hardware, optional.
+ * @runtime_resume:		reenable hardware after power gating, optional.
  * @irqs:			array of irq names and interrupt handlers
  * @num_irqs:			number of irqs in the array
  * @clk_names:			array of clock names
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 31d8449ca1d2..9b5415176bfe 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -942,10 +942,12 @@ static int hantro_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = vpu->variant->init(vpu);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to init VPU hardware\n");
-		return ret;
+	if (vpu->variant->init) {
+		ret = vpu->variant->init(vpu);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to init VPU hardware\n");
+			return ret;
+		}
 	}
 
 	pm_runtime_set_autosuspend_delay(vpu->dev, 100);
diff --git a/drivers/staging/media/hantro/sama5d4_vdec_hw.c b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
index 58ae72c2b723..9c3b8cd0b239 100644
--- a/drivers/staging/media/hantro/sama5d4_vdec_hw.c
+++ b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
@@ -64,11 +64,6 @@ static const struct hantro_fmt sama5d4_vdec_fmts[] = {
 	},
 };
 
-static int sama5d4_hw_init(struct hantro_dev *vpu)
-{
-	return 0;
-}
-
 /*
  * Supported codec ops.
  */
@@ -109,7 +104,6 @@ const struct hantro_variant sama5d4_vdec_variant = {
 	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
 		 HANTRO_H264_DECODER,
 	.codec_ops = sama5d4_vdec_codec_ops,
-	.init = sama5d4_hw_init,
 	.irqs = sama5d4_irqs,
 	.num_irqs = ARRAY_SIZE(sama5d4_irqs),
 	.clk_names = sama5d4_clk_names,
-- 
2.30.0

