Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A1742E0E8
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 20:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbhJNSOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 14:14:48 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:56874 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232633AbhJNSOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 14:14:48 -0400
Received: from pop-os.home ([92.140.161.106])
        by smtp.orange.fr with ESMTPA
        id b5DZmB3dgBazob5DamY5G0; Thu, 14 Oct 2021 20:12:42 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 14 Oct 2021 20:12:42 +0200
X-ME-IP: 92.140.161.106
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        mchehab@kernel.org, matthias.bgg@gmail.com
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: mtk-vcodec: Remove redundant 'flush_workqueue()' calls
Date:   Thu, 14 Oct 2021 20:12:35 +0200
Message-Id: <8b7137f1d15c64fc3bc8df27e55095dc8d1d80da.1634235066.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

This was generated with coccinelle:

@@
expression E;
@@
- 	flush_workqueue(E);
	destroy_workqueue(E);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 1 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e6e6a8203eeb..68abb1422c40 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -390,7 +390,6 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dev *dev = platform_get_drvdata(pdev);
 
-	flush_workqueue(dev->decode_workqueue);
 	destroy_workqueue(dev->decode_workqueue);
 
 	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index eed67394cf46..b576f44ce505 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -461,7 +461,6 @@ static int mtk_vcodec_enc_remove(struct platform_device *pdev)
 	struct mtk_vcodec_dev *dev = platform_get_drvdata(pdev);
 
 	mtk_v4l2_debug_enter();
-	flush_workqueue(dev->encode_workqueue);
 	destroy_workqueue(dev->encode_workqueue);
 	if (dev->m2m_dev_enc)
 		v4l2_m2m_release(dev->m2m_dev_enc);
-- 
2.30.2

