Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8CD3756D7
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235224AbhEFP1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:27:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:40886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235255AbhEFP1m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FD526193D;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314783;
        bh=tu2hhB6CHAZbCfvPd96Qq+9zsUaGe3IxV7AH+2XbuEs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QSv5FyWJT/GViSc6Q+heyZ8j7KBHQdYNi702iuXY93QpbIK8+cnC1/xs1fPqbG58v
         e6vroDclZEHhpG8z930B+6RnjE6pxRdRheOjDERiTlCPXYw0dKRl/osJFl0dJ7sNUE
         Px1nspje6+TNsaj4136ofXsWxxFYjDH8U2ju5L0Ojvt8dgSf3V+v+vdWvuSEjDzgYY
         YQdcBHMVRkrubGz4B1AyJvqKTdLgyZmSVHYaOIx4vmCVvThySszg6LE8Qrp3L79A9H
         3GL58F3a3RcFjqPKkSMJWLi/vuQgglOYJp7SqiW4X+yffj71IIwTNDgVkuUFH2bA9A
         rhVu2sLFjEiDw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left8-000SBj-0I; Thu, 06 May 2021 17:26:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v5 11/25] media: mtk-jpeg: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:49 +0200
Message-Id: <55b1ee0dc3c77c721eb7773666578cdf37908ee2.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
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

