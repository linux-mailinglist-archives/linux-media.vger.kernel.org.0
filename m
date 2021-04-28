Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9B136DA6F
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240681AbhD1Oz6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:36740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240343AbhD1Oxm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 570F46162F;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=tu2hhB6CHAZbCfvPd96Qq+9zsUaGe3IxV7AH+2XbuEs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KtK66w5w+MqC+buetVQpX4klt8E7eQKMomLy3QjlqjVd2YsbUKE43Nkp6+91l7scu
         44dEYHkoaTal1LRKV0Tm71R1+ekTI67JvcAaf4zHu+7I51T9C63DNCPxe0TNatBeUY
         a5dk2vF6J/GjIoOIFes2CatpeDGzX1KUcUt8n9TSbxI3htOgl+Cu/KK00evDXM1qh1
         4Eyu5wonFJU7ni9avZaYpwniDJY+RnXwPjznSqSBfg6IxFMxYxDTfGib4I9lEg96HP
         p5dmwBfkSVPEX8lJRGV2xydcMTe8eHwpK7VVQ6Iqyi/nO9iSSzK+ONQgLziinEFR1w
         Y9IMPZmVuivMg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Dsg-EA; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v4 64/79] media: mtk-jpeg: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:25 +0200
Message-Id: <71dd5d55eba4fc353900354acffd6861be8a8abb.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 88a23bce569d..a89c7b206eef 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -920,7 +920,7 @@ static void mtk_jpeg_enc_device_run(void *priv)
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	ret = pm_runtime_get_sync(jpeg->dev);
+	ret = pm_runtime_resume_and_get(jpeg->dev);
 	if (ret < 0)
 		goto enc_end;
 
@@ -973,7 +973,7 @@ static void mtk_jpeg_dec_device_run(void *priv)
 		return;
 	}
 
-	ret = pm_runtime_get_sync(jpeg->dev);
+	ret = pm_runtime_resume_and_get(jpeg->dev);
 	if (ret < 0)
 		goto dec_end;
 
-- 
2.30.2

